<?php
class SiteConfigExtension extends DataExtension {

	private static $db = array(
		'GACode' => 'VarChar(255)'
	);

	public function updateCMSFields(FieldList $fields) {
		$fields->addFieldToTab('Root.GoogleAnalytics', new TextField('GACode', 'Google Analytics account'));
	}

}
