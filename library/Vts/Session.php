<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/12/13
 * Time: 4:25 PM
 * To change this template use File | Settings | File Templates.
 */
class Vts_Session {

    public static function get($name){
        $default = new Zend_Session_Namespace('default');
        return $default->{$name};
    }
}