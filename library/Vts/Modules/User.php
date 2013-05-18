<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/10/13
 * Time: 10:08 PM
 * To change this template use File | Settings | File Templates.
 */
class Vts_Modules_User
{

    /**
     * @param $username
     * @param $password
     * @return boolean
     */
    public function login($username, $password)
    {
        $user = Coco_NotORM::getInstance()->Users[array('Username' => $username, 'Password' => md5($password),
            'IsActive' => 1, 'IsDeleted' => 0)];
        if ($user) {
            $default = new Zend_Session_Namespace('default');
            $userLogin = new stdClass();
            $userLogin->Username = $user['Username'];
            $userLogin->Fullname = $user['Fullname'];
            $userLogin->Email = $user['Email'];
            $userLogin->UserId = $user['UserId'];
            $default->userLogin = $userLogin;
            return true;
        } else {
            return false;
        }
    }

    /**
     * Check is login
     * @return bool
     */
    public function isLogin(){
        $default = new Zend_Session_Namespace('default');
        if($default->userLogin){
            return true;
        }else{
            return false;
        }
    }

    /**
     * @return bool
     */
    public function logout(){
        $default = new Zend_Session_Namespace('default');
        //set null for user
        $default->userLogin = null;
        return true;
    }
}