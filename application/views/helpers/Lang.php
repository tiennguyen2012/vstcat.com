<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/11/13
 * Time: 12:29 AM
 * To change this template use File | Settings | File Templates.
 */
class Zend_View_Helper_Lang extends  Zend_View_Helper_Abstract {
    public function lang($text){
        /**
         * @var Zend_Translate
         */
        $translate = Zend_Registry::get('Zend_Translate');
        return $translate->_($text);
    }
}