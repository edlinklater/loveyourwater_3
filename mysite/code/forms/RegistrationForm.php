<?php
/**
 * A form used to register to the site. 
 * Provides a verification and confirmation email on successful submission.
 */
class RegistrationForm extends Form {

    /**
     * @config
     * @var integer
     */
    private static $verification_expiry_hours = 24;

    public function init() {
    }

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
                ->addExtraClass('btn btn-success'),
            ResetFormAction::create('doReset', 'Reset')
                ->addExtraClass('btn btn-danger')
        );

        // Validation
        $validator = new RequiredFields('FirstName', 'Surname', 'Email', 'Phone', 'setPassword');

        parent::__construct($controller, $name, $fields, $actions, $validator);
    }

    /**
     * On form submission
     * 
     * @param  array  $data    Submitted form data as an array
     * @param  Form   $form    The submitted RegistrationForm object
     */
    public function doRegistration($data, $form) {

        // store the member data for verification
        $memberData = $data;

        $validator = Member::password_validator();
        if(isset($memberData['setPassword']['_Password'])) {
            $memberData['setPassword'] = $memberData['setPassword']['_Password'];
        }

        //ensure password meets minimal security reqs, set in config.yml
        $v = $validator->validate($memberData['setPassword'], new Member());
        if(!$v->valid()){
            $form->sessionMessage("The password supplied does not meet our minimum security requirements.
                Passwords must be at least 6 characters long and contain a selection of lowercase, uppercase,
                digits and punctuation", 'bad'
            );
            return $this->controller->redirectBack();
        }

        // check if a member exists with the same email
        $member = Member::get()->filter(array(
            'Email' => $data['Email']
        ))->first();

        if($member) {
            $form->sessionMessage("A member exists with the same email address!", 'bad');
            return $this->controller->redirectBack();
        }

        // create the new member
        $member = new Member();
        $member->Email = $data['Email'];
        $member->PendingFormData = serialize($memberData);
        $member->write();

        // create verification code
        $code = $this->setVerificationCode($member);

        // create and send email
        $registrationPage = RegistrationPage::get()->first();
        $link = $this->controller->join_links(
            $registrationPage->Link('verifyemail'),
            '?h=' . $code
        );

        $config = SiteConfig::current_site_config();

        $email = Email::create()
            ->setTo($member->Email)
            ->setSubject('Your Love Your Water account verification, nearly done!')
            ->setTemplate('RegistrationVerificationEmail')
            ->populateTemplate(array(
                'Member' => $member,
                'VerificationLink' => $link,
                'BaseURL' => Director::absoluteBaseURL()
            ));

            if($config->RegistrationEmailAddress){
                $email->setFrom($config->RegistrationEmailAddress);
            }

            $email->send();
        
        // redirect to success page
        return $this->controller->redirect($this->controller->Link('?success=1'));
    }

    /**
     * Set the members verification code and expiry date
     */
    public function setVerificationCode($member) {
        $generator = new RandomGenerator();
        $code = $generator->randomToken();
        $member->VerificationCode = $code;
        $member->VerificationExpiry = date(
            'Y-m-d H:i:s',
            strtotime(
                '+' . Config::inst()->get('RegistrationForm', 'verification_expiry_hours') . ' hours',
                SS_Datetime::now()->Format('U')
            )
        );
        $member->write();

        return $code;
    }

}
