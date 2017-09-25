<?php

/**
 * Class SiteConfigExtension
 */
class SiteConfigExtension extends DataExtension
{

    /**
     * @var array
     */
    private static $db = array(
        'GACode' => 'VarChar(255)',
        'RegistrationEmailAddress' => 'VarChar(255)'
    );

    /**
     * @var array
     */
    private static $has_one = array(
        'DefaultEventImage' => 'Image'
    );

    /**
     * @param FieldList $fields
     */
    public function updateCMSFields(FieldList $fields)
    {
        $fields->addFieldToTab('Root.GoogleAnalytics', new TextField('GACode', 'Google Analytics account'));
        $fields->addFieldToTab('Root.Main', new EmailField('RegistrationEmailAddress', 'Email address for sending all emails from'));
        $fields->addFieldToTab('Root.Main', UploadField::create('DefaultEventImage', 'Default event image'));
    }
}
