<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/12/13
 * Time: 5:24 PM
 * To change this template use File | Settings | File Templates.
 */
class Coco_Controller_Action_Admin extends Coco_Controller_Action_Abstract {

    public function init(){
        parent::init();
        $this->view->layout()->setLayoutPath(APPLICATION_PATH.'/layouts/scripts/admin');
        $this->view->layout()->setLayout('layout');
    }
}