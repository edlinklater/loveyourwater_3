<?php

namespace Mysite\Test\Behaviour;

use SilverStripe\BehatExtension\Context\SilverStripeContext,
	SilverStripe\BehatExtension\Context\BasicContext,
	SilverStripe\BehatExtension\Context\LoginContext,
	SilverStripe\BehatExtension\Context\EmailContext as EmailContext,
	SilverStripe\BehatExtension\Context\FixtureContext as CoreFixtureContext,
	SilverStripe\Cms\Test\Behaviour,
	SilverStripe\Framework\Test\Behaviour\CmsUiContext,
	SilverStripe\Framework\Test\Behaviour\CmsFormsContext,
	Behat\Behat\Context\Step\Then,
	Behat\Gherkin\Node\TableNode,
	Behat\Mink\Element\NodeElement,
	Behat\Mink\Exception\ElementNotFoundException;
use Behat\Gherkin\Node\PyStringNode;

// PHPUnit
require_once 'PHPUnit/Autoload.php';
require_once 'PHPUnit/Framework/Assert/Functions.php';

/**
 * Features context
 *
 * Context automatically loaded by Behat.
 * Uses subcontexts to extend functionality.
 */
class FeatureContext extends SilverStripeContext {

	/**
	 * @var FixtureFactory
	 */
	protected $fixtureFactory;
	/**
	 * Date format in date() syntax
	 * @var String
	 */
	protected $dateFormat = 'd/m/Y';
	/**
	 * Initializes context.
	 * Every scenario gets it's own context object.
	 *
	 * @param array $parameters context parameters (set them up through behat.yml)
	 */
	public function __construct(array $parameters) {
		parent::__construct($parameters);

		$this->useContext('BasicContext', new BasicContext($parameters));
		$this->useContext('LoginContext', new LoginContext($parameters));
		$this->useContext('EmailContext', new EmailContext($parameters));
		$this->useContext('CmsUiContext', new CmsUiContext($parameters));
		$this->useContext('CmsFormsContext', new CmsFormsContext($parameters));

		$fixtureContext = new CoreFixtureContext($parameters);
		$fixtureContext->setFixtureFactory($this->getFixtureFactory());
		$this->useContext('FixtureContext', $fixtureContext);

		// Use blueprints to set user name from identifier
		$factory = $fixtureContext->getFixtureFactory();
		$blueprint = \Injector::inst()->create('FixtureBlueprint', 'Member');
		$blueprint->addCallback('beforeCreate', function($identifier, &$data, &$fixtures) {
			if(!isset($data['FirstName'])) $data['FirstName'] = $identifier;
		});
		$factory->define('Member', $blueprint);

		// Auto-publish pages
		foreach(\ClassInfo::subclassesFor('SiteTree') as $id => $class) {
			$blueprint = \Injector::inst()->create('FixtureBlueprint', $class);
			$blueprint->addCallback('afterCreate', function($obj, $identifier, &$data, &$fixtures) {
				$obj->publish('Stage', 'Live');
			});
			$factory->define($class, $blueprint);
		}
		
		$manager = \Injector::inst()->get(
			'LywFakeManager',
			true,
			// Creates a new database automatically. Session doesn't exist here yet,
			// so we need to take fake database path from internal config.
			// The same path is then set in the browser session
			// and reused across scenarios (see resetFakeDatabase()).
			array(new \FakeDatabase($this->getFakeDatabasePath()))
		);
		
		$emailContext = new EmailContext($parameters);
		$this->useContext(
			'CmsUiContext',
			new CmsUiContext($parameters, $manager, $factory, $this->testSessionEnvironment)
		);
		
		$this->manager = $manager;
	}

	public function setMinkParameters(array $parameters) {
		parent::setMinkParameters($parameters);

		if(isset($parameters['files_path'])) {
			$this->getSubcontext('FixtureContext')->setFilesPath($parameters['files_path']);
		}
	}

	/**
	 * @return FixtureFactory
	 */
	public function getFixtureFactory() {
		if(!$this->fixtureFactory) {
			$this->fixtureFactory = \Injector::inst()->create('BehatFixtureFactory');
		}

		return $this->fixtureFactory;
	}

	public function setFixtureFactory(FixtureFactory $factory) {
		$this->fixtureFactory = $factory;
	}

	/**
	 * "Shares" the database with web requests, see
	 * {@link LywFakeManagerControllerExtension}
	 */
	public function getTestSessionState() {
		return array_merge(
			parent::getTestSessionState(),
			array(
				'useFakeManager' => true,
				'importDatabasePath' => BASE_PATH .'/mysite/tests/fixtures/behat/lyw3_db.sql',
				'requireDefaultRecords' => false,
				'fakeDatabasePath' => $this->getFakeDatabasePath(),
			)
		);
	}

	public function getFakeDatabasePath() {
		return BASE_PATH . '/FakeDatabase.json';
	}

	/**
	 * @BeforeScenario
	 */
	public function resetFakeDatabase() {
		$this->manager->getDb()->reset(true);
	}

	/**
	 * @AfterStep
	 */
	public function printDebugAfterStep($event) {
		// TODO Figure out a cleaner way to get --verbose to output trace on tested steps
		if($event->getResult() == \Behat\Behat\Event\StepEvent::FAILED) {
			$this->printDebug($event->getException()->getTraceAsString());
		}
	}

	/**
	 * @Given /^I save the fake database to "([^"]*)"$/
	 */
	public function stepSaveFakeDatabase($path) {
		$json = json_encode($this->manager->getDb()->toArray(), JSON_PRETTY_PRINT);
		file_put_contents(BASE_PATH . '/' . $path, $json);
	}

	/**
	 * @Given /^I (stop and |)view the fake database$/
	 */
	public function stepDebugFakeDatabase($stop) {
		echo json_encode($this->manager->getDb()->toArray(), JSON_PRETTY_PRINT);

		if($stop) {
			fwrite(STDOUT, "\033[s    \033[93m[Breakpoint] Press \033[1;93m[RETURN]\033[0;93m to continue...\033[0m");
			while (fgets(STDIN, 1024) == '') {}
			fwrite(STDOUT, "\033[u");
		}
	}

	/**
	 * Pauses the scenario until the user presses a key. Useful when debugging a scenario.
	 *
	 * @Then /^(?:|I )break$/
	 */
	public function iPutABreakpoint(){
		fwrite(STDOUT, "\033[s \033[93m[Breakpoint] Press \033[1;93m[RETURN]\033[0;93m to continue...\033[0m");
		while (fgets(STDIN, 1024) == '') {}
		fwrite(STDOUT, "\033[u");
		return;
	}

}