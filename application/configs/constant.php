<?php
define('BASE_URL', 'http://'.$_SERVER['HTTP_HOST']);
define('HOST_NAME', $_SERVER['HTTP_HOST']);
/**
 * This defined used to test
 */
define('REQUEST_NO_REWRITE', '/vtssoft/vtsweb/public');
define('CACHE_PATH', $_SERVER['DOCUMENT_ROOT'].'/caches');

define('STDERR', $_SERVER['DOCUMENT_ROOT'].'/debug/sql-log.txt' );

define('DATE_FORMAT_DATABASE', 'yyyy-MM-dd');
define('DATE_FORMAT_VIEW', 'yyyy-MM-dd');
define('API_CMS', 'http://api.vtscat.com');

/**
 * PAGINATION
 */
define('PAGINATION_ORDER', 10);
define('PAGINATION_TEMPLATE', 30);

/**
 * LANGUAGE
 */
define('LANGUAGE_DEFAULT', 'en');

/**
 * CONFIG SEND EMAIL
 */
define('EMAIL_SSL', 'ssl');
define('EMAIL_PORT', 465);
define('EMAIL_AUTH', 'login');
define('EMAIL_USER', 'vtscat@gmail.com');
define('EMAIL_PASSWORD', 'tinhanh123');
define('EMAIL_SERVER', 'smtp.gmail.com');
define('EMAIL_NAME', 'VTS Contact');

/**
 * FLOW ORDER
 */
define('ORDER_LOGIN', BASE_URL.'/user/signin/href/'.base64_encode('/order/set-info'));
define('ORDER_TEMPLATE', BASE_URL.'/template');
define('ORDER_ACCOUNT_TYPE', BASE_URL.'/page/price');
define('ORDER_DOMAIN', BASE_URL.'/website/domain');
define('ORDER_SAVE', BASE_URL.'/order/save-order');

/**
 * CYCLE BILLING
 */
define('CYCLE_MONTHLY', 'Monthly');
define('CYCLE_SIX_MONTHLY', 'Six Monthly');
define('CYCLE_YEARLY', 'Yearly');
define('CYCLE_TWO_YEARLY', 'Two Yearly');

/**
 * ORDER STATUS
 */
define('ORDER_STATUS_PENDING', 'PENDING');
define('ORDER_STATUS_PURCHASED', 'PURCHASED');
define('ORDER_STATUS_PAYMENT_FAIL', 'PAYMENT_FAIL');

/**
 * PAYMENT
 */
//define('PAYPAL_ACOUNT', 'nguyenvantien2009@gmail.com');
define('PAYPAL_ACOUNT', 'nguyenvantien2009-facilitator@gmail.com');
//define('PAYPAL_URL', 'https://www.paypal.com/cgi-bin/webscr');
define('PAYPAL_URL', 'https://www.sandbox.paypal.com/cgi-bin/webscr');