<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/12/13
 * Time: 4:25 PM
 * To change this template use File | Settings | File Templates.
 */
class Vts_Session {

    public static function get($name, $value = null){
        $default = new Zend_Session_Namespace('default');
        if(!empty($value) && empty($default->{$name})){
            $default->{$name} = $value;
        }
        return $default->{$name};
    }

    public static function set($name, $value){
        $default = new Zend_Session_Namespace('default');
        $default->{$name} = $value;
    }

    public static function getByNamespace($name){
        $session = new Zend_Session_Namespace($name);
        return $session;
    }

    public static function setByNamespace($name, $value){
        $session = new Zend_Session_Namespace($name);
        $session->{$name} = $value;
    }
}