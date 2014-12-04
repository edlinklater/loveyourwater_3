<?php

class GoogleMapPage extends Page {

    private static $db = array(
    );
    private static $has_many = array(
        "Locations" => "Location"
    );

    public function getCMSFields() {
        // Get the fields from the parent implementation
        $fields = parent::getCMSFields();

        //google map module
        $location = new Location();
        $googlemapfield = new GoogleMapField($location, "Google Map Field");
        $Latitude = new ReadonlyField('Latitude', 'Latitude', $googlemapfield->getDefaultValue('Latitude'));
        $Longitude = new ReadonlyField('Longitude', 'Longitude', $googlemapfield->getDefaultValue('Longitude'));
        $fields->addFieldToTab('Root.Map', $googlemapfield);
        $fields->addFieldToTab('Root.Map', $Latitude);
        $fields->addFieldToTab('Root.Map', $Longitude);

        return $fields;
    }

}

class GoogleMapPage_Controller extends Page_Controller {

    private static $allowed_actions = array(
        "GoogleMapForm",
    );

    public function init() {
        parent::init();
        Requirements::javascript('framework/thirdparty/jquery/jquery.js');
    }

    public function GoogleMapForm() {
        $location = new Location();
        $fields = new FieldList(
            new GoogleMapField($location, 'Event Map')
        );

        // Create actions
        $actions = new FieldList(
                new FormAction('doGoogleMap', 'Submit')
        );

        return new Form($this, 'GoogleMapForm', $fields, $actions);
    }

    public function doGoogleMap($data, $form) {
        $location = new Location();
        $form->saveInto($location);
        $location->write();
        return $this->redirectBack();
    }

}
