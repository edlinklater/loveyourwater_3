<?php

/**
 * Provides a page that gives users the ability to register to the site, creating a {@link Member} account
 * and adding them to a {@link Group}.
 */
class RegistrationPage extends Page
{

    /**
     * @var array
     */
    private static $db = array(
        'SuccessMessage' => 'HTMLText',
        'ConfirmedMessage' => 'HTMLText',
        'VerifiedMessage' => 'HTMLText'
    );

    /**
     * @var array
     */
    private static $has_one = array(
        'Group' => 'Group',
        'TermsAndConditions' => 'SiteTree'
    );

    /**
     * @config
     * @var string
     */
    private static $user_group = 'users';

    /**
     * @return FieldList
     */
    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $groups = Group::get()->map();
        $fields->addFieldToTab('Root.Form', DropdownField::create('GroupID', 'Group', $groups)
            ->setDescription('Security group the registered member will be assigned to.')
            ->setEmptyString('Default Group'));

        $pages = SiteTree::get()->map();
        $fields->addFieldToTab('Root.Form', DropdownField::create('TermsAndConditionsID', 'Terms and Conditions', $pages)
            ->setDescription('Page to link Terms and Conditions to.'));
        $fields->addFieldToTab('Root.Form', HTMLEditorField::create('SuccessMessage', 'Success Message')
            ->setDescription('Message to display after the form has been successfully submitted.'));
        $fields->addFieldToTab('Root.Form', HTMLEditorField::create('ConfirmedMessage', 'Confirmed Message')
            ->setDescription('Message to display after the member has successfully confirmed through their email.'));
        $fields->addFieldToTab('Root.Form', HTMLEditorField::create('VerifiedMessage', 'Verified Message')
            ->setDescription('Message to display after the member has attempted to verify an already verified account.'));

        return $fields;
    }

}

class RegistrationPage_Controller extends Page_Controller
{

    /**
     * @var array
     */
    private static $allowed_actions = array(
        'Form',
        'verifyemail'
    );

    /**
     *
     */
    public function init()
    {
        parent::init();
        Requirements::javascript('themes/loveyourwater/js/registrationForm.js');
    }

    /**
     * @return RegistrationForm
     */
    public function Form()
    {
        return new RegistrationForm($this, 'Form');
    }

    /**
     * @return mixed
     */
    public function isSuccess()
    {
        return $this->request->getVar('success');
    }

    /**
     * @return mixed
     */
    public function isConfirmed()
    {
        return $this->request->getVar('confirmed');
    }

    public function isVerified()
    {
        return $this->request->getVar('verified');
    }

    /**
     * @return SS_HTTPResponse|ViewableData_Customised|void
     * @throws Exception
     * @throws ValidationException
     * @throws null
     */
    public function verifyemail()
    {
        $code = $this->request->getVar('h');

        $member = Member::get()->filter('VerificationCode', $code)->first();

        // if a member exists, else throw a 404 error
        if ($member) {
            // if user is already verified - we can tell this is the expiry is set to null
            if ($member->VerificationExpiry === null) {
                return $this->redirect($this->Link('?verified=1'));
            }

            // if verification is expired
            if (SS_Datetime::now()->Format('U') > strtotime($member->VerificationExpiry)) {
                $member->delete();
                $member->destroy();

                $content = sprintf(
                    'The verification code you entered has expired. The unique verification code is only valid for %s hours. Please register to get a new new code and try again.',
                    $this->getExpiryHours()
                );

                return $this->customise(array(
                    'Content' => $content
                ));
            }

            // wipe the verification expiry so we know we've been verified
            // keep the code itself so we can tell if someone attempts to verify it again
            $member->VerificationExpiry = null;

            // check if the member has pending data to save
            if ($member->PendingFormData) {

                // save member data
                $data = unserialize($member->PendingFormData);
                $member->PendingFormData = null;
                $member->IsVerified = true;
                $member->write();

                $member->update($data);
                $member->write();

                // set the members password
                $member->changePassword($data['setPassword']);

                // find or make group to add member to
                if ($this->GroupID) {
                    $member->Groups()->add($this->Group());
                } else {
                    $code = RegistrationPage::config()->user_group;
                    $userGroup = Group::get()->filter("Code", $code)->first();
                    if (!$userGroup) {
                        $userGroup = new Group();
                        $userGroup->Code = $code;
                        $userGroup->Title = $code;
                        $userGroup->Write();
                    }
                    $userGroup->Members()->add($member);
                }

                $config = SiteConfig::current_site_config();


                // send confirmation email
                $email = Email::create()
                    ->setTo($member->Email)
                    ->setSubject('Your Love Your Water account confirmation!')
                    ->setTemplate('RegistrationConfirmationEmail')
                    ->populateTemplate(array(
                        'Member' => $member,
                        'BaseURL' => Director::absoluteBaseURL()
                    ));

                if ($config->RegistrationEmailAddress) {
                    $email->setFrom($config->RegistrationEmailAddress);
                }

                $email->send();


                // redirect
                return $this->redirect($this->Link('?confirmed=1'));
            }
        } else {
            return $this->httpError(404);
        }
    }

    /**
     * get the expiration hours to display in the template.
     * @return String hours
     */
    public function getExpiryHours()
    {
        return Config::inst()->get('RegistrationForm', 'verification_expiry_hours');
    }

}
