<?php

class Page extends SiteTree {

    private static $db = array(
        "Subtitle" => "Varchar",
        "IsTerms" => "Boolean",
    );
    private static $has_one = array(
    );

    public function getCMSFields() {
        // Get the fields from the parent implementation
        $fields = parent::getCMSFields();

        //google map module
        $subtitle = new TextField('Subtitle', 'Subtitle');
        $fields->addFieldToTab('Root.Main', $subtitle, 'Content');
        $fields->addFieldToTab('Root.Settings', new CheckboxField('IsTerms', 'T&Cs Page'));

        return $fields;
    }

}

class Page_Controller extends ContentController {

    /**
     * An array of actions that can be accessed via a request. Each array element should be an action name, and the
     * permissions or conditions required to allow the user to access it.
     *
     * <code>
     * array (
     *     'action', // anyone can access this action
     *     'action' => true, // same as above
     *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
     *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
     * );
     * </code>
     *
     * @var array
     */
    private static $allowed_actions = array(
        'getTermsPageLink',
    );

    public function init() {
        parent::init();

        // You can include any CSS or JS required by your project here.
        // See: http://doc.silverstripe.org/framework/en/reference/requirements
    }

    public function getTermsPageLink() {
		$TermsPage = DataObject::get_one('Page', '"IsTerms" = TRUE');
		if($TermsPage instanceof DataObject) {
			return $TermsPage->Link();
		}
    }

}
