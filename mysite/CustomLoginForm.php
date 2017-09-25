<?php

class CustomLoginForm extends MemberLoginForm
{

    protected $authenticator_class = "LYWMemberAuthenticator";

    /**
     * Constructor
     *
     * @param Controller $controller The parent controller, necessary to
     *                               create the appropriate form action tag.
     * @param string $name The method on the controller that will return this
     *                     form object.
     * @param FieldList|FormField $fields All of the fields in the form - a
     *                                   {@link FieldList} of {@link FormField}
     *                                   objects.
     * @param FieldList|FormAction $actions All of the action buttons in the
     *                                     form - a {@link FieldList} of
     *                                     {@link FormAction} objects
     * @param bool $checkCurrentUser If set to TRUE, it will be checked if a
     *                               the user is currently logged in, and if
     *                               so, only a logout button will be rendered
     * @param string $authenticatorClassName Name of the authenticator class that this form uses.
     */
    public function __construct($controller, $name, $fields = null, $actions = null,
                                $checkCurrentUser = true)
    {

        // This is now set on the class directly to make it easier to create subclasses
        // $this->authenticator_class = $authenticatorClassName;

        $customCSS = project() . '/css/member_login.css';
        if (Director::fileExists($customCSS)) {
            Requirements::css($customCSS);
        }

        if ($home = HomePage::get()->first()) {
            $backURL = $home->Link();
        }


        if ($checkCurrentUser && Member::currentUser() && Member::logged_in_session_exists()) {
            $fields = new FieldList(
                new HiddenField("AuthenticationMethod", null, $this->authenticator_class, $this)
            );
            $actions = new FieldList(
                new FormAction("logout", _t('Member.BUTTONLOGINOTHER', "Log in as someone else"))
            );
        } else {
            if (!$fields) {
                $label = singleton('Member')->fieldLabel(Member::config()->unique_identifier_field);
                $fields = new FieldList(
                    new HiddenField("AuthenticationMethod", null, $this->authenticator_class, $this),
                    // Regardless of what the unique identifer field is (usually 'Email'), it will be held in the
                    // 'Email' value, below:
                    $emailField = new TextField("Email", $label, null, null, $this),
                    new PasswordField("Password", _t('Member.PASSWORD', 'Password'))
                );
                if (Security::config()->remember_username) {
                    $emailField->setValue(Session::get('SessionForms.MemberLoginForm.Email'));
                } else {
                    // Some browsers won't respect this attribute unless it's added to the form
                    $this->setAttribute('autocomplete', 'off');
                    $emailField->setAttribute('autocomplete', 'off');
                }
                if (Security::config()->autologin_enabled) {
                    $fields->push(new CheckboxField(
                        "Remember",
                        _t('Member.REMEMBERME', "Remember me next time?")
                    ));
                }
            }
            if (!$actions) {
                $actions = new FieldList(
                    new FormAction('dologin', _t('Member.BUTTONLOGIN', "Log in")),
                    new LiteralField(
                        'forgotPassword',
                        '<p id="ForgotPassword"><a href="Security/lostpassword">'
                        . _t('Member.BUTTONLOSTPASSWORD', "I've lost my password") . '</a></p>'
                    )
                );
            }
        }

        if (isset($backURL)) {
            $fields->push(new HiddenField('BackURL', 'BackURL', $backURL));
        }

        // Reduce attack surface by enforcing POST requests
        $this->setFormMethod('POST', true);

        parent::__construct($controller, $name, $fields, $actions);

        $this->setValidator(new RequiredFields('Email', 'Password'));

        // Focus on the email input when the page is loaded
        $js = <<<JS
		(function() {
			var el = document.getElementById("MemberLoginForm_LoginForm_Email");
			if(el && el.focus && (typeof jQuery == 'undefined' || jQuery(el).is(':visible'))) el.focus();
		})();
JS;
        Requirements::customScript($js, 'MemberLoginFormFieldFocus');
    }

}