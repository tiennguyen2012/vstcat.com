<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 5/26/13
 * Time: 9:06 AM
 * To change this template use File | Settings | File Templates.
 */
class Vts_Unit {

    public static function toArray($object){
        $array = array();
        foreach($object as $key => $value){
            $array[$key] = $value;
        }
        return $array;
    }

    public static function toObject($arr){
        $object = new stdClass();
        foreach($arr as $key => $value){
            $object->{$key} = $value;
        }
        return $object;
    }
}