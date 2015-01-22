<?php

global $project;
$project = 'mysite';

global $database;
$database = 'lyw3_db';

require_once('conf/ConfigureFromEnv.php');

// Set the site locale
i18n::set_locale('en_US');

CalendarConfig::init(array(
	'pagetypes' => array(
		'calendarpage' => array(
			'eventlist' => 'coming'
		)
	)
));


$validator = new PasswordValidator();
$validator->minLength(6);
$validator->checkHistoricalPasswords(6);
$validator->characterStrength(3, array("lowercase", "uppercase", "digits", "punctuation"));
Member::set_password_validator($validator);