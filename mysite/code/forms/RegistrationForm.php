<?php
/**
 * A form used to register to the site.
 */
class RegistrationForm extends Form {

    public function __construct($controller, $name) {

        // Fields
        $fields = new FieldList();
        $fields->push(new TextField('FirstName', 'First Name'));
        $fields->push(new TextField('Surname', 'Last Name'));
        $fields->push(new EmailField('Email', 'Email'));
        $fields->push(new TextField('Phone', 'Phone'));
        $fields->push(new ConfirmedPasswordField('setPassword', 'Password'));
        $fields->push(new CheckboxField('AcceptToc', 'I have read and accept the <a target="_blank" href="#">Terms and Conditions</a>'));

        // Actions
        $actions = new FieldList(
            new FormAction('doRegistration', 'Register', 'Email', 'Phone', 'setPassword'),
            new ResetFormAction('doReset', 'Reset')
        );

        // Validation
        // $validator = new RequiredFields('FirstName', 'Surname');

        parent::__construct($controller, $name, $fields, $actions, $validator);
    }

    public function doRegistration($data, $form, $request) {
        $member = new Member($data);
        $member->write();
        $member->changePassword($data['setPassword']['_Password']);
        
        return $this->controller->redirectBack();
    }

}