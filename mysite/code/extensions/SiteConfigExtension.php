<?php

/**
 * Class SiteConfigExtension
 */
class SiteConfigExtension extends DataExtension {

	/**
	 * @var array
	 */
	private static $db = array(
		'GACode' => 'VarChar(255)'
	);

	/**
	 * @param FieldList $fields
	 */
	public function updateCMSFields(FieldList $fields) {
		$fields->addFieldToTab('Root.GoogleAnalytics', new TextField('GACode', 'Google Analytics account'));
	}

}
