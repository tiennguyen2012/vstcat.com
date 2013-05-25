<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/20/13
 * Time: 11:58 PM
 * To change this template use File | Settings | File Templates.
 */
class OrderController extends Coco_Controller_Action_Default {

    /**
     * @var Default_Model_Order
     */
    private $_model;

    public function init(){
        parent::init();
        //check login
        $this->checkLogin();

        $this->_model = new Default_Model_Order();
    }

    public function indexAction(){
        $this->checkLogin();
        $login = Vts_App::getUserLogin();
        if($login->UserId){
            $orders = Coco_NotORM::getInstance()->Orders()->where('UserId', $login->UserId)->where('IsDeleted', 0)->order('CreatedDate DESC');

            $paginator = Zend_Paginator::factory($orders);
            $paginator->setItemCountPerPage(PAGINATION_ORDER);
            $paginator->setDefaultPageRange(5);
            $paginator->setCurrentPageNumber($this->_getParam("page", 1));

            $this->view->orders = $paginator;
        }else{
            throw new Zend_Exception('Error login');
        }
    }

    public function addAction(){
        $itemId = $this->_getParam('item-id');
        $itemType = $this->_getParam('item-type');
        $priceType = $this->_getParam('price-type');
        $websiteType = $this->_getParam('website-type');

        if(strtoupper($itemType) == 'NEW_AND_TEMPLATE' && $this->_getParam('result', null) != 'success' ){
            $this->_redirect($this->view->rurl(array('controller' => 'website', 'action' => 'create')));
        }else{
            $resAdd = $this->_model->add($itemId, $itemType, $priceType, $websiteType);
            if($resAdd){
                $this->_redirect($this->view->url(array('controller' => 'order', 'action' => 'detail', 'order-id' => $resAdd['OrderId']), null, true));
            }else{
                throw new Zend_Exception('Error when save.');
            }
        }
    }

    /**
     * Get order
     */
    public function detailAction(){
        $orderId = $this->_getParam('order-id');
        $order = $this->_model->getOrder($orderId);
        $this->view->order = $order;
    }

    /**
     * Add order template
     * @author
     */
    public function addOrderTemplateAction(){
        $templateId = $this->_getParam('template-id');

        $vtsBasket = new Vts_Basket();
        $vtsTemplate = new Vts_Template();

        $template = Coco_NotORM::getInstance()->Templates[array('TemplateId' => $templateId, 'IsActive' => 0)];
        if($template){

        }
    }
}