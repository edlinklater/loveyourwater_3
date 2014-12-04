<?php
class RegistrationPage extends Page {

    private static $db = array(
        'SuccessMessage' => 'HTMLText',
        'ConfirmedMessage' => 'HTMLText'
    );

    private static $has_one = array(
        'Group' => 'Group',
        'TermsAndConditions' => 'SiteTree'
    );

    private static $user_group = 'users';

    public function getCMSFields() {
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

        return $fields;
    }

}

class RegistrationPage_Controller extends Page_Controller {

    private static $allowed_actions = array(
        'Form',
        'verifyemail'
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

    public function isConfirmed() {
        return $this->request->getVar('confirmed');
    }

    public function verifyemail() {
        $code = $this->request->getVar('h');

        $member = Member::get()->filter('VerificationCode', $code)->first();
        if($member) {
            $member->VerificationCode = null;
            $member->VerificationExpiry = null;

            if($member->PendingFormData) {
                // save member data
                $data = unserialize($member->PendingFormData);
                $member->PendingFormData = null;
                $member->IsVerified = true;
                $member->write();

                $member->update($data);
                $member->write();

                $member->changePassword($data['setPassword']);

                if($this->GroupID) {
                    $member->Groups()->add($this->Group());
                } else {
                    $code = RegistrationPage::config()->user_group;
                    $userGroup = Group::get()->filter("Code", $code)->first();
                    if(!$userGroup) {
                        $userGroup = new Group();
                        $userGroup->Code = $code;
                        $userGroup->Title = $code;
                        $userGroup->Write();
                    }

                    //Add member to user group
                    $userGroup->Members()->add($member);
                }

                // send email
                $email = Email::create()
                    ->setTo($member->Email)
                    ->setSubject('Your Love Your Water account confirmation!')
                    ->setTemplate('RegistrationConfirmationEmail')
                    ->populateTemplate(array(
                        'Member' => $member,
                        'BaseURL' => Director::absoluteBaseURL()
                    ))
                    ->send();

                // redirect
                return $this->redirect($this->Link('?confirmed=1'));
            }
        } else {
            return $this->httpError(500);
        }
    }

}
