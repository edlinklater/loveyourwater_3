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

        // Actions
        $actions = new FieldList(
            new FormAction('doRegistration', 'Register', 'Email', 'Phone', 'setPassword')
        );

        // Validation
        $validator = new RequiredFields('FirstName', 'Surname');

        parent::__construct($controller, $name, $fields, $actions, $validator);
    }

    public function doRegistration($data, $form, $request) {

        $memberData = $data;
        
        return $this->controller->redirectBack();
    }

}