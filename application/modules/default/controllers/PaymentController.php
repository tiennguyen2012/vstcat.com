<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/17/13
 * Time: 2:14 PM
 * To change this template use File | Settings | File Templates.
 */
class PaymentController extends Coco_Controller_Action_Default
{

    public function methodAction()
    {
        //check login
        $this->checkLogin();

        $template = Coco_NotORM::getInstance()->Templates[array('TemplateId' => $this->_getParam('template-id'), 'IsActive' => 1,
            'IsDeleted' => 0)];
        $paymentMethods = Coco_NotORM::getInstance()->PaymentMethods()->where('IsActive', 1)->where('IsDeleted', 0);

        $this->view->template = $template;
        $this->view->paymentMethods = $paymentMethods;
    }
    
    /**
     * Make website by manual
     * @author tien.nguyen
     */
    public function makeByOrderIdAction(){
    	/*
    	$orderId = $this->_getParam('order-id');
    	$modelWebsite = new Default_Model_Website();
    	$modelWebsite->generate(intval($orderId));
    	die;
    	*/
    	
    	$lOrder = new Vts_Order();
    	$lOrder->sendEmailPayment(70);
    	die;
    	
    }

    /**
     * Need parameters type (Type of payment example Paypal), user-id, and order id
     * URL for testing :
     * http://dev.vtsweb.com/payment/notify/type/paypal/user-id/15/order-id/61
     */
    public function notifyAction()
    {
        $this->_helper->layout()->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $type = $this->_getParam('type');
        $userId = $this->_getParam('user-id');
        $orderId = $this->_getParam('order-id');
        if (empty($type) || empty($userId) || empty($orderId)) {
            throw new Zend_Exception('You not enough parameters.');
        }

        //add new order with order is

        //save payment
        $paymentMethod = Coco_NotORM::getInstance()->PaymentMethods[array('PaymentMethodCode' => $type)];
        if ($paymentMethod) {

            $className = $paymentMethod['Class'];
            $object = new $className();
            $payment = $object->getPayment($this->_getAllParams());

            //insert transaction
            $resPaymentTransaction = $object->saveTransaction($this->_getAllParams());
            $payment['UserId'] = $userId;

            //insert payment
            $resPayment = Coco_NotORM::getInstance()->Payments()->insert($payment);
            if ($resPaymentTransaction) {
                $resPaymentTransaction->update(array('PaymentId' => $resPayment['PaymentId']));
            }

            /**
             * Update payment to success if paypal get money.
             */
            $paymentStatus = $this->_getParam('payment_status');
            if ($paymentStatus == 'Completed') {
                //update order id
                $order = Coco_NotORM::getInstance()->Orders[$orderId]->update(array('OrderStatus' => 'PURCHASED'));
            } else {
                $order = Coco_NotORM::getInstance()->Orders[$orderId]->update(array('OrderStatus' => 'PAYMENT_FAIL'));
            }
            
            /**
			 * Send email to customer because we do not want customer wait
             */
            $lOrder = new Vts_Order();
            $lOrder->sendEmailPayment($orderId);
            
            /**
             * Check order success and generate website by api
             */
            $modelWebsite = new Default_Model_Website();
            $modelWebsite->generate($orderId);
            
            /**
             * Show to test success. Because this action do not use layout.
             */
            echo "Success";
        }
    }
}