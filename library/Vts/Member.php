<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/20/13
 * Time: 11:56 PM
 * To change this template use File | Settings | File Templates.
 */
class Vts_Member {

	/**
	 * Check is member.
	 * We do not use member table to check member. We only check is member
	 * in Website table. If you have record in Website table. You are member
	 * @author tien.nguyen
	 * @return boolean
	 */
    public function isMember(){
        $userLogin = Vts_App::getUserLogin();
        if($userLogin){
            $member  = Coco_NotORM::getInstance()->Websites[array('UserId' => $userLogin->UserId, 
            		'IsActive' => 1, 'IsDeleted' => 0
            )];
            if($member){
                return true;
            }
        }
        return false;
    }
}