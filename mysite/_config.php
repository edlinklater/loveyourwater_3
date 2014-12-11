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
