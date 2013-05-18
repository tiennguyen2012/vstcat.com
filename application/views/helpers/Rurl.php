<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/15/13
 * Time: 3:07 PM
 * To change this template use File | Settings | File Templates.
 */
class Zend_View_Helper_Rurl extends Zend_View_Helper_Url {

    public function Rurl(array $urlOptions = array(), $name = null, $reset = false, $encode = true){
        $urlOptions['href'] = base64_encode($_SERVER['REQUEST_URI']);
        return parent::url($urlOptions, $name, $reset, $encode);
    }
}