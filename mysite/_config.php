<?php

global $project;
$project = 'mysite';

global $database;
$database = '';

require_once('conf/ConfigureFromEnv.php');

// Set the site locale
i18n::set_locale('en_US');

Object::useCustomClass('MemberLoginForm', 'CustomLoginForm');
Object::useCustomClass('Member_ForgotPasswordEmail', 'LYWMember_ForgotPasswordEmail');

$validator = new PasswordValidator();
$validator->minLength(6);
$validator->checkHistoricalPasswords(6);
$validator->characterStrength(3, array("lowercase", "uppercase", "digits", "punctuation"));
Member::set_password_validator($validator);
