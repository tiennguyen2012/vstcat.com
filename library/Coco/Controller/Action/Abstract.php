<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/8/13
 * Time: 12:33 PM
 * To change this template use File | Settings | File Templates.
 */
class Coco_Controller_Action_Abstract extends Zend_Controller_Action
{

    public $href;

    public function init()
    {
        parent::init();

        $this->view->params = $this->_getAllParams();
        $this->href = base64_decode($this->_getParam('href'));
        $this->view->href = $this->href;
    }
}