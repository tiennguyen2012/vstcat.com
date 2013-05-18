<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/18/13
 * Time: 8:21 PM
 * To change this template use File | Settings | File Templates.
 */
class Vts_Payment_Paypal implements Vts_Payment_Payment
{
    public function render($orderId)
    {
        $view = new Zend_View();
        $view->setBasePath(APPLICATION_PATH.'/../library/Vts/Payment/View');

        //get order by order id
        $order = Coco_NotORM::getInstance()->Orders[$orderId];

        $view->order = $order;
        return $view->render('paypal.phtml');
    }

    public function getPayment($params){
        $payment = array();
        $payment['Params'] = json_encode($params);
        $payment['PayerEmail'] = $params['payer_email'];
        $payment['Type'] = 'paypal';
        $payment['ItemName'] = $params['item_name1'];
        $payment['ItemQuality'] = $params['item_number1'];

        return $payment;
    }

    public function saveTransaction($params){
        $transaction = Coco_NotORM::mergeData('PaypalTransactions', $params);
        return Coco_NotORM::getInstance()->PaypalTransactions()->insert($transaction);
    }
}