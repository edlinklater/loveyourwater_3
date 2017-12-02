<?php

class Event extends DataObject
{
    private static $db = [
        'Name' => 'Varchar(200)',
        'StartTime' => 'SS_Datetime',
        'EndTime' => 'SS_Datetime',
        'Summary' => 'Text',
        'Content' => 'HTMLText',
        'Active' => 'Boolean',
        'Region' => "Enum('Northland, Auckland, Waikato, Bay of Plenty, Gisborne, Hawkes Bay, Taranaki, Manawatu-Whanganui, Wellington, Tasman, Nelson, Marlborough, West Coast, Canterbury, Otago, Southland')",
        'Geometry' => 'Text',
        'Code' => 'Varchar(4)',
    ];

    private static $has_one = [
        'Banner' => 'Image',
        'Subsite' => 'Subsite',
    ];

    private static $has_many = [
        'Registrations' => 'EventRegistration',
    ];

    private static $many_many = [
        'Sponsors' => 'Sponsor',
    ];

    private static $many_many_extraFields = [
        'Sponsors' => [
            'SortOrder' => 'Int',
        ],
    ];

    private static $indexes = array(
        'Code' => true,
    );

    private static $summary_fields = [
        'Name',
        'Region',
        'Active',
    ];

    private static $default_sort = 'StartTime DESC';

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        if (class_exists('Subsite')) {
            $fields->push(HiddenField::create('SubsiteID', 'SubsiteID', Subsite::currentSubsiteID()));
        }

        $fields->replaceField('Code', ReadonlyField::create('Code'));

        $sortableField = $fields->dataFieldByName('Sponsors');
        if ($sortableField instanceof GridField) {
            $sortableFieldConfig = $sortableField->getConfig();
            $sortableFieldConfig->addComponent(GridFieldOrderableRows::create('SortOrder'));
        }

        return $fields;
    }

    protected function onBeforeWrite()
    {
        parent::onBeforeWrite();

        if (!$this->Code) {
            $valid_code = false;
            while (!$valid_code) {
                $factory = new RandomLib\Factory;
                $generator = $factory->getMediumStrengthGenerator();
                $code = $generator->generateString(4, '3468acdefhkmnpqrtwxy');
                if (! Event::get()->filter('Code', $code)->exists()) {
                    $this->Code = $code;
                    $valid_code = true;
                }
            }
        }
    }

    public function Current()
    {
        return ($this->EndDate >= date('Y-m-d H:i:s'));
    }

    public function FriendlyDate()
    {
        $StartTime = $this->dbObject('StartTime');
        $EndTime = $this->dbObject('EndTime');

        if ($StartTime->Year() != $EndTime->Year()) {
            return $StartTime->Format('jS F Y') . ' &ndash; ' . $EndTime->Format('jS F Y');
        }

        if ($StartTime->Month() != $EndTime->Month()) {
            return $StartTime->Format('jS F') . ' &ndash; ' . $EndTime->Format('jS F Y');
        }

        if ($StartTime->DayOfMonth() != $EndTime->DayOfMonth()) {
            return $StartTime->Format('jS') . ' &ndash; ' . $EndTime->Format('jS F Y');
        }

        return $StartTime->Format('jS F Y');
    }

    public function Link()
    {
        $filter = URLSegmentFilter::create();
        $title = $filter->filter($this->Title);
        $region = $filter->filter($this->Region);

        return Controller::join_links(
            'event',
            $this->Code,
            $region,
            $title
        );
    }

    public function SiteName()
    {
        if ($this->SubsiteID) {
            return $this->Subsite()->Title;
        }

        return SiteConfig::get()->filter('SubsiteID', 0)->first()->Title;
    }
}
