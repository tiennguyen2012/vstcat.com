<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    public function _initLanguage()
    {
        $default = new Zend_Session_Namespace('default');
        if (empty($default->language)) {
            $default->language = LANGUAGE_DEFAULT;
        }

//        $cache = Zend_Cache::factory(
//            'Core', 'File', array(
//                'caching' => true
//            , 'lifetime' => 900, 'automatic_serialization' => true, 'automatic_cleaning_factor' => 20
//            , 'cache_id_prefix' => 'Translate'
//            )
//            , array(
//                'hashed_directory_level' => 0, 'cache_dir' => CACHE_PATH
//            )
//        );
//
//        Zend_Translate::setCache($cache);
        $translate = new Zend_Translate('ini',
            APPLICATION_PATH . '/modules/default/languages/'. $default->language, $default->language,
            array('scan' => Zend_Translate::LOCALE_FILENAME)
        );
        $translateAffiliate = new Zend_Translate('ini',
            APPLICATION_PATH . '/modules/affiliate/languages/'. $default->language, $default->language,
            array('scan' => Zend_Translate::LOCALE_FILENAME)
        );
        $translate->addTranslation($translateAffiliate);

        Zend_Registry::set('Zend_Translate', $translate);
    }

}

