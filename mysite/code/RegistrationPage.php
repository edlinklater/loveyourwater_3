<?php
class RegistrationPage extends Page {

    private static $db = array(
        'SuccessMessage' => 'HTMLText'
    );

    private static $has_one = array(
        'Group' => 'Group',
        'TermsAndConditions' => 'SiteTree'
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $groups = Group::get()->map();
        $fields->addFieldToTab('Root.Form', DropdownField::create('GroupID', 'Group', $groups)
            ->setDescription('Security group the registered member will be assigned to.'));

        $pages = SiteTree::get()->map();
        $fields->addFieldToTab('Root.Form', DropdownField::create('TermsAndConditionsID', 'Terms and Conditions', $pages)
            ->setDescription('Page to link Terms and Conditions to.'));
        $fields->addFieldToTab('Root.Form', HTMLEditorField::create('SuccessMessage', 'Success Message')
            ->setDescription('Message to display after the form has been successfully submitted.'));

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
