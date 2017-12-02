<?php

class Sponsor extends DataObject
{
    private static $db = [
        'Name' => 'Varchar(100)',
        'URL' => 'Varchar(255)',
    ];

    private static $has_one = [
        'Logo' => 'Image',
        'Subsite' => 'Subsite',
    ];

    private static $belongs_many_many = [
        'Event' => 'Event',
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        if (class_exists('Subsite')) {
            $fields->push(new HiddenField('SubsiteID', 'SubsiteID', Subsite::currentSubsiteID()));
        }

        return $fields;
    }
}
