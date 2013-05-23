<?php

class IndexController extends Coco_Controller_Action_Default
{

    /**
     * @var Default_Model_Index
     */
    private $_model;

    public function init()
    {
        parent::init();
        $this->_model = new Default_Model_Index();
    }

    public function indexAction()
    {
        $data = $this->_model->index();

        $this->view->bestSale = $data['best-sale'];
//        $this->view->templateTypes = $data['template-types'];
        $this->view->templateCategorys = $data['template-categorys'];
    }


}

