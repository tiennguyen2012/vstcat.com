<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/11/13
 * Time: 12:53 AM
 * To change this template use File | Settings | File Templates.
 */
class SystemController extends Coco_Controller_Action_Default {

    public function changeLangAction(){
        $langCode = $this->_getParam('lang-code');

        $lApp = new Vts_App();
        $lApp->changeLang($langCode);

        $this->_redirect($_SERVER['HTTP_REFERER']);
    }
}