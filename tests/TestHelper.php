<?php
define ( 'BASE_PATH', realpath ( __FILE__ ) . '/../' );
define ( 'APPLICATION_PATH', BASE_PATH . '/application' );
define ( 'TEST_PATH', BASE_PATH . '/tests' );
define ( 'APPLICATION_ENV', 'testing' );

// include path
set_include_path ( PATH_SEPARATOR . BASE_PATH . '/library' . PATH_SEPARATOR . get_include_path () );

// Set default time zone
date_default_timezone_set ( 'Europe/Brussels' );

// Show error
error_reporting ( E_ALL | E_STRICT );

require_once 'Zend/Application.php';
$application = new Zend_Application ( APPLICATION_ENV, APPLICATION_PATH . '/configs/application.ini' );

$application->bootstrap();