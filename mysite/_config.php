<?php

global $project;
$project = 'mysite';

global $database;
$database = 'lyw3_db';

require_once('conf/ConfigureFromEnv.php');

// Set the site locale
i18n::set_locale('en_US');

// global $databaseConfig;
// $databaseConfig = array(
// 	"type" => 'MySQLDatabase',
// 	"server" => 'localhost',
// 	"username" => 'loveyour_lyc',
// 	"password" => 'jWl56ef0H82182R',
// 	"database" => 'lyw3_db',
// 	"path" => '',
// );