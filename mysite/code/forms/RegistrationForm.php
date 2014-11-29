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
        $email = (new Email())
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