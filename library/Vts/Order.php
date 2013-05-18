<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/24/13
 * Time: 12:51 AM
 * To change this template use File | Settings | File Templates.
 */
class Vts_Order {

    /**
     * Check template purchased
     * @param $orderId
     * @param $templateId
     * @return bool
     */
    public function checkOrderItemPurchase($orderId, $itemId, $itemType){
        $order = Coco_NotORM::getInstance()->Orders[$orderId];
        if($order){
            var_dump($orderId);
            var_dump($itemId);
            var_dump($itemType);
            $orderDetail = Coco_NotORM::getInstance()->OrderDetails[array('OrderId' => $orderId, 'ItemId' => $itemId, 'ItemType' => strtoupper($itemType))];

            if(!$orderDetail){
                $orderDetail = Coco_NotORM::getInstance()->OrderDetails[array('OrderId' => $orderId, 'ItemId' => $itemId, 'ItemType' => 'NEW_AND_TEMPALTE')];
            }
            if($orderDetail && $order['OrderStatus'] == 'PURCHASED'){
                return true;
            }
        }
        return false;
    }

    /**
     * Send email to customer.
     * @param $orderId
     */
    public function sendEmailPayment($orderId){
        $order = Coco_NotORM::getInstance()->Orders[$orderId];
        if($order){
            $user = Coco_NotORM::getInstance()->Users[$order['UserId']];
            $lEmail = new Vts_Email();

            $view = Zend_Controller_Front::getInstance()->getParam('bootstrap')->getResource('view');
            $view = new Zend_View();
            $view->setBasePath(APPLICATION_PATH.'/../library/Vts/Order/View');
            $view->order = $order;
            $view->user = $user;

            $htmlOrderPayment = $view->render('order-payment-email.phtml');
            $res = @$lEmail->send('VTSCat'. ' - '.$order['OrderId'], $htmlOrderPayment,
                array('name' => EMAIL_NAME, 'email' => EMAIL_USER),
                array('name' => $user['Fullname'], 'email' => $user['Email'])
            );
        }
    }
}