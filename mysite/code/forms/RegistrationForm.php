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
            new FormAction('doRegistration', 'Register', 'Email', 'Phone', 'setPassword'),
            new ResetFormAction('doReset', 'Reset')
        );

        // Validation
        // $validator = new RequiredFields('FirstName', 'Surname');

        parent::__construct($controller, $name, $fields, $actions);
    }

    public function doRegistration($data, $form, $request) {
        // create member
        $member = new Member($data);
        $member->write();
        $member->changePassword($data['setPassword']['_Password']);

        if($this->controller->GroupID) {
            $member->Groups()->add($this->controller->Group());
        }
        
        // redirect to success page
        return $this->controller->redirect($this->controller->Link('?success=1'));
    }

}