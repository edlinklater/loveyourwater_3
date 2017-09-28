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
        'RegistrationEmailAddress' => 'VarChar(255)',
        'AllowLogin' => 'Boolean',
    );

    /**
     * @var array
     */
    private static $has_one = array(
        'DefaultEventImage' => 'Image',
        'Logo' => 'Image',
    );

    /**
     * @param FieldList $fields
     */
    public function updateCMSFields(FieldList $fields)
    {
        $fields->addFieldToTab('Root.GoogleAnalytics', new TextField('GACode', 'Google Analytics account'));
        $fields->addFieldToTab('Root.Main', new CheckboxField('AllowLogin', 'Allow users to log in and create/edit events?'));
        $fields->addFieldToTab('Root.Main', new EmailField('RegistrationEmailAddress', 'Email address for sending all emails from'));
        $fields->addFieldToTab('Root.Main', UploadField::create('DefaultEventImage', 'Default event image'));
        $fields->addFieldToTab('Root.Main', UploadField::create('Logo')->setFolderName('Logo'));
    }
}
