<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/11/13
 * Time: 2:16 PM
 * To change this template use File | Settings | File Templates.
 */
class PageController extends Coco_Controller_Action_Default {

    public function detailAction(){
        $code = $this->_getParam('code');
        $page = Coco_NotORM::getInstance()->Pages[array('PageCode' => $code)];
        $this->view->page = $page;
    }
}