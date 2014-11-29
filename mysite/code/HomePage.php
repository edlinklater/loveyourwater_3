<?php

class HomePage extends Page {

    private static $db = array(
    );

    public function getCMSFields() {
        // Get the fields from the parent implementation
        $fields = parent::getCMSFields();

        return $fields;
    }

}

class HomePage_Controller extends Page_Controller {

    public function init() {
        parent::init();
    }

}
