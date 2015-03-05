<?php

/**
 * Class SiteConfigExtension
 */
class SiteConfigExtension extends DataExtension {

	/**
	 * @var array
	 */
	private static $db = array(
		'GACode' => 'VarChar(255)',
		'RegistrationEmailAddress'  => 'VarChar(255)',
	);

	/**
	 * @param FieldList $fields
	 */
	public function updateCMSFields(FieldList $fields) {
		$fields->addFieldToTab('Root.GoogleAnalytics', new TextField('GACode', 'Google Analytics account'));
		$fields->addFieldToTab('Root.Main', new EmailField('RegistrationEmailAddress', 'Email address for sending all emails from'));
	}

}
