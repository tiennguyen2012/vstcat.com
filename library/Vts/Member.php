<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/20/13
 * Time: 11:56 PM
 * To change this template use File | Settings | File Templates.
 */
class Vts_Member {

    public function isMember(){
        $userLogin = Vts_App::getUserLogin();
        if($userLogin){
            $member  = Coco_NotORM::getInstance()->Members[array('UserId' => $userLogin->UserId)];
            if($member){
                return true;
            }
        }
        return false;
    }
}