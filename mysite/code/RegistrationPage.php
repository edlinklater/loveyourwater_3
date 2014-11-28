<?php

class RegistrationPage extends Page {

    public function getCMSFields() {
        $fields = parent::getCMSFields();
        return $fields;
    }

}

class RegistrationPage_Controller extends Page_Controller {

    private static $allowed_actions = array(
        'Form'
    );

    public function init() {
        parent::init();
    }

    public function Form() {
        return new RegistrationForm($this, 'Form');
    }

}
