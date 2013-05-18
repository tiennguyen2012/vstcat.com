<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/11/13
 * Time: 12:54 AM
 * To change this template use File | Settings | File Templates.
 */
class Vts_App
{

    public function changeLang($langeCode)
    {
        $default = new Zend_Session_Namespace('default');
        $default->language = $langeCode;
    }

    public static function getUserLogin(){
        $default = new Zend_Session_Namespace('default');
        //set null for user
        return $default->userLogin;
    }

    /**
     * Format number for money
     * @author tien.nguyen
     * @param $number
     * @return string
     */
    public static function formatMoney($number){
        return '$'. number_format($number, 2, '.', ',');
    }

    /**
     * Get format date
     * @author tien.nguyen
     * @param $date
     * @param $newFormat
     * @param string $oldFormat
     * @return string
     */
    public static function formatDate($date, $newFormat, $oldFormat = DATE_FORMAT_DATABASE){
        $date = new Zend_Date($date, $oldFormat);
        return $date->toString($newFormat);
    }

    public static function getId($text)
    {
        $id = str_replace('_', '', strstr($text, '_'));
        if (intval($id)) {
            return intval($id);
        } else {
            return null;
        }
    }

    public static function objectToArray($object)
    {
        $res = array();
        try {
            if ($object) {
                foreach ($object as $key => $value) {
                    $res[$key] = $value;
                }
            }
        } catch (exception $e) {
        }

        return $res;
    }

    public static function isActive($module, $controller = null, $action = null, $params = null)
    {
        $front = Zend_Controller_Front::getInstance()->getRequest();

        $fController = $front->getControllerName();
        $fModule = $front->getModuleName();
        $fAction = $front->getActionName();
        $fParams = $front->getParams();

        $flag = false;
        if ($module && $controller && $action) {
            if ($fController == $controller && $fAction == $action && $fModule == $module) {
                $flag = true;
            }
        } elseif ($module && $controller) {
            if ($fController == $controller && $fModule == $module) {
                $flag = true;
            }
        } elseif ($module == $fModule) {
            $flag = true;
        }


        if ($flag) {
            if ($params) {
                foreach ($params as $k => $v) {
                    if ($params[$k] != $fParams[$k]) {
                        return false;
                    }
                }
                return true;
            } else {
                return true;
            }
        } else {
            return false;
        }


    }
}