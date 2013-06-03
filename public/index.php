<?php
// Define path to application directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

// Define application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),
    "D:\ZendFramework-1.11.7\library",
    'E:\Framework\ZendFramework-1.12.1-minimal\library',
    get_include_path(),
)));

/** Zend_Application */
require_once APPLICATION_PATH.'/configs/constant.php';
/**
 * Load constant with environment
 */
$fileConstant = APPLICATION_PATH.'/configs/constant_'.APPLICATION_ENV.'.php';
if(file_exists($fileConstant))
    require_once($fileConstant);

require_once 'Zend/Application.php';

// Create application, bootstrap, and run
$application = new Zend_Application(
    APPLICATION_ENV,
    APPLICATION_PATH . '/configs/application.ini'
);
$application->bootstrap()
            ->run();