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
        $this->checkLogin();

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
     * Action save order
     * @author tien.nguyen
     * @throws Zend_Exception
     */
    public function saveOrderAction(){
        //get basket
        $basket = Vts_Session::get('basket');
        if($basket){
            $res = $this->_model->saveOrder();
            if($res){
                $this->_redirect($this->view->url(array('controller' => 'order', 'action' => 'detail',
                    'order-id' => $res['OrderId']), null, true));
            }
        }else{
            throw new Zend_Exception('Basket is empty.');
        }
    }

    /**
     * Get order
     */
    public function detailAction(){
        $this->checkLogin();

        $orderId = $this->_getParam('order-id');
        $order = $this->_model->getOrder($orderId);
        $this->view->order = $order;
    }

    /**
     * Set account type for user
     * @author tien.nguyen
     * @throws Zend_Exception
     */
    public function setAccountTypeAction(){
        $accountType = $this->_getParam('account-type');
        $cycleBilling = $this->_getParam('cycle-billing', 'NONE');

        if(empty($accountType) || empty($cycleBilling)){
            throw new Zend_Exception('Account Type OR Cycle Billing is empty.');
        }

        $vtsBasket = new Vts_Basket();
        $res = $vtsBasket->setTypeAccount($accountType, $cycleBilling);
        if($res){
            $this->_redirect($vtsBasket->getNextStep());
        }else{
            throw new Zend_Exception('Set domain have error. Please contact with admin vtscat@gmail.com.');
        }
    }

    /**
     * Set domain
     * @author tien.nguyen
     * @throws Zend_Exception
     */
    public function setDomainAction(){
        $domain = $this->_getParam('domain');
        if(empty($domain)){
            throw new Zend_Exception('Domain is empty.');
        }

        $vtsBasket = new Vts_Basket();
        $res = $vtsBasket->setDomain($domain);
        if($res){
            $this->_redirect($vtsBasket->getNextStep());
        }else{
            throw new Zend_Exception('Set domain have error. Please contact with admin vtscat@gmail.com.');
        }
    }

    /**
     * Add order template
     * @author tien.nguyen
     */
    public function setTemplateAction(){
        $templateId = $this->_getParam('template-id');
        if(empty($templateId)){
            throw new Zend_Exception('Template Id is empty.');
        }

        $vtsBasket = new Vts_Basket();
        $res = $vtsBasket->setTemplate($templateId);
        if($res){
            $this->_redirect($vtsBasket->getNextStep());
        }else{
            throw new Zend_Exception("Set template have error. Please contact with admin  vtscat@gmail.com.");
        }
    }

    public function setInfoAction(){
        $vtsBasket = new Vts_Basket();
        $res = $vtsBasket->setInfoByBasket();
        if($res){
            $this->_redirect($vtsBasket->getNextStep());
        }else{
            throw new Zend_Exception("Maybe you do not login system, yet.");
        }
    }

    public function newOrderAction(){
        $templateId = $this->_getParam('template-id');

        if($templateId){
            $vtsBasket = new Vts_Basket();
            $res = $vtsBasket->removeAll();
            if($res){
                $this->_redirect($this->view->url(array('controller' => 'order', 'action' => 'set-template', 'template-id' => $templateId), null, true));
            }else{
                throw new Zend_Exception('Have error when remove basket.');
            }
        }else{
            throw new Zend_Exception('Template Id is empty.');
        }
    }

    public function successAction(){

    }
}