<?php

/**
 * {@link Event} extension
 */
class EventExtension extends DataExtension
{

    /**
     * Regional data
     * @var array
     */
    private static $db = array(
        "Region" => "Enum('Northland, Auckland, Waikato, Bay of Plenty, Gisborne, Hawkes Bay, Taranaki,
		 Manawatu-Whanganui, Wellington, Tasman, Nelson, Marlborough, West Coast, Canterbury, Otago, Southland')",
        "Geometry" => "Text"
    );

    /**
     * @var array
     */
    private static $has_one = array(
        "Creator" => "Member"
    );

    /**
     * @param FieldList $fields
     */
    public function updateCMSFields(FieldList $fields)
    {
        $regionDropDown = new DropdownField('Region', 'Region', $this->owner->dbObject('Region')->enumValues());
        $fields->addFieldToTab('Root.Main', $regionDropDown);
        $memberLookup = new DropdownField('CreatorID', 'Creator', Member::get()->map('ID', 'Name'));
        $fields->addFieldToTab('Root.Main', $memberLookup);

        $geoField = new LeafletField('Geometry', 'Location', $this->owner);
        $geoField->setDrawOptions(array(
            'rectangle' => false,
            'circle' => false
        ));
        $fields->addFieldToTab('Root.Location', $geoField);
    }

    /**
     * Return regions availble for events
     * @return mixed
     */
    public static function getRegions()
    {
        return singleton('Event')->dbObject('Region')->enumValues();
    }

    /**
     * Return the location geometry as geojson
     * @return String the GeoJSON representation of the location.
     */
    public function getLocation()
    {
        // get the layer and format.
        $layer = null;
        if ($this->owner->Geometry && $data = json_decode($this->owner->Geometry)) {
            if (isset($data->layers)) {
                $layer = array(
                    'type' => 'FeatureCollection',
                    'features' => array()
                );

                foreach ($data->layers as $feature) {
                    $feature->properties = array(
                        'featureType' => 'projectLayer',
                        'id' => (String)$this->owner->ID
                    );
                    $layer['features'][] = $feature;
                }
            }
        }
        if ($layer) {
            $layer = json_encode($layer);
            return str_replace("\"", "'", $layer);
        } else {
            return null;
        }
    }

}
