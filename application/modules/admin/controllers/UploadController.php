<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/31/13
 * Time: 9:48 PM
 * To change this template use File | Settings | File Templates.
 */
class Admin_UploadController extends Coco_Controller_Action_Admin {

    public function init(){
        parent::init();

    }

    public function uploadTempleteAction(){
        $templateId = $this->_getParam('id');
        if($templateId){
            $template = Coco_NotORM::getInstance()->Templates[$templateId];
            if($template){

                $lUpload = new Vts_Upload();
//                $lUpload->upload('templates', $)
            }
        }
    }
}