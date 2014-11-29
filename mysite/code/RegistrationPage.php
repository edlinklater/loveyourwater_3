<?php
class RegistrationPage extends Page {

    private static $db = array(
        'SuccessMessage' => 'HTMLText'
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Form', new HTMLEditorField('SuccessMessage', 'Success Message'));

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

    public function isSuccess() {
        return $this->request->getVar('success');
    }

}
