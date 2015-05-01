<?php

/**
 * override Forgot password email to send from custom field in site config
 * Class LYWMember_ForgotPasswordEmail
 */
class LYWMember_ForgotPasswordEmail extends Member_ForgotPasswordEmail {

	protected $from = '';  // setting a blank from address uses the site's default administrator email
	protected $subject = '';
	protected $ss_template = 'ForgotPasswordEmail';

	public function __construct() {
		parent::__construct();
		$config = SiteConfig::current_site_config();
		//if there is an send all emails from set in SiteConfig use that as the from address
		$this->from = ($config->RegistrationEmailAddress) ? $config->RegistrationEmailAddress : '';
		$this->subject = _t('Member.SUBJECTPASSWORDRESET', "Your password reset link", 'Email subject');
	}
}