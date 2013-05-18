<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/8/13
 * Time: 12:34 PM
 * To change this template use File | Settings | File Templates.
 */
class Coco_Controller_Action_Default extends Coco_Controller_Action_Abstract {

    public function init(){
        parent::init();
    }

    /**
     * Check login system
     */
    public function checkLogin(){
        $lUser = new Vts_Modules_User();
        if(!$lUser->isLogin()){
            $this->_redirect($this->view->rurl(array('controller' => 'user', 'action' => 'signin')));
        }
    }
}