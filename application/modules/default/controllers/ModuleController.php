<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/9/13
 * Time: 12:29 AM
 * To change this template use File | Settings | File Templates.
 */
class ModuleController extends Coco_Controller_Action_Default {
    /**
     * @var Default_Model_Module
     */
    private $_model;

    public function init(){
        parent::init();
        $this->_model = new Default_Model_Module();
    }

    public function indexAction(){
        $modules = $this->_model->getModules();

        $this->view->modules = $modules;
    }
}