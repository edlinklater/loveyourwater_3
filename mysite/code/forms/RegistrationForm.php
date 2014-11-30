<?php
/**
 * A form used to register to the site.
 */
class RegistrationForm extends Form {

    public function __construct($controller, $name) {

        // Fields
        $fields = new FieldList();
        $fields->push(TextField::create('FirstName', 'First Name')
            ->addExtraClass('form-control')
            ->setAttribute( 'placeholder', 'First Name' ));
        $fields->push(TextField::create('Surname', 'Last Name')
            ->addExtraClass('form-control')
            ->setAttribute( 'placeholder', 'Last Name' ));
        $fields->push(EmailField::create('Email', 'Email')
            ->addExtraClass('form-control')
            ->setAttribute( 'placeholder', 'Email Address' ));
        $fields->push(TextField::create('Phone', 'Phone')
            ->addExtraClass('form-control')
            ->setAttribute( 'placeholder', 'Phone Number' ));
        $fields->push($pw = ConfirmedPasswordField::create('setPassword', 'Password')
            ->setCustomValidationMessage('Password is required'));

        foreach ($pw->children as $child) {
            $child->addExtraClass('form-control');
        }

        // Actions
        $actions = new FieldList(
            FormAction::create('doRegistration', 'Register', 'Email', 'Phone', 'setPassword')
                ->addExtraClass('btn btn-default'),
            ResetFormAction::create('doReset', 'Reset')
                ->addExtraClass('btn btn-default')
        );

        // Validation
        $validator = new RequiredFields('FirstName', 'Surname', 'Email', 'Phone', 'setPassword');

        parent::__construct($controller, $name, $fields, $actions, $validator);
    }

    public function doRegistration($data, $form, $request) {

        $memberData = $data;

        if(isset($memberData['setPassword']['_Password'])) {
            $memberData['setPassword'] = $memberData['setPassword']['_Password'];
        }

        $member = Member::get()->filter(array(
            'Email' => $data['Email']
        ))->first();

        if($member) {
            $form->sessionMessage("A member exists with the same email address!", 'bad');
            return $this->controller->redirectBack();
        }

        $member = new Member();
        $member->Email = $data['Email'];
        $member->PendingFormData = serialize($memberData);
        $member->write();

        // set verification data
        $generator = new RandomGenerator();
        $code = $generator->randomToken();
        $member->VerificationCode = $code;
        $member->VerificationExpiry = date(
            'Y-m-d H:i:s',
            strtotime(
                '+24 hours',
                SS_Datetime::now()->Format('U')
            )
        );
        $member->write();

        // send email
        $registrationPage = RegistrationPage::get()->first();
        $link = $this->controller->join_links(
            $registrationPage->Link('verifyemail'),
            '?h=' . $code
        );
        $email = Email::create()
            ->setTo($member->Email)
            ->setSubject('Your Love Your Water account verification, nearly done!')
            ->setTemplate('RegistrationVerificationEmail')
            ->populateTemplate(array(
                'Member' => $member,
                'VerificationLink' => $link,
                'BaseURL' => Director::absoluteBaseURL()
            ))
            ->send();
        
        // redirect to success page
        return $this->controller->redirect($this->controller->Link('?success=1'));
    }

}