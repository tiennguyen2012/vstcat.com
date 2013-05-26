<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 5/26/13
 * Time: 5:57 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Payment {

    /**
     * Send email to customer
     * @author tien.nguyen
     * @param $orderId
     */
    public function sendEmailToCustomer($orderId){
        //send email notify when payment success.
        $lOrder = new Vts_Order();
        $lOrder->sendEmailPayment($orderId);
    }

    /**
     * Update payment to success if paypal get money.
     * @author tien.nguyen
     */
    public function updateStatusOrder($orderId){
        $paymentStatus = $this->_getParam('payment_status');
        if ($paymentStatus == 'Completed') {
            //update order id
            $order = Coco_NotORM::getInstance()->Orders[$orderId]->update(array('OrderStatus' => 'PURCHASED'));
        } else {
            $order = Coco_NotORM::getInstance()->Orders[$orderId]->update(array('OrderStatus' => 'PAYMENT_FAIL'));
        }
    }

    /**
     * Insert to pay payment
     * @param $paymentMethod - object NotORM
     * @param $userId - int/string
     */
    public function insertToPayment($paymentMethod, $userId){
        $className = $paymentMethod['Class'];
        $object = new $className();
        $payment = $object->getPayment($this->_getAllParams());

        //insert transaction
        $resPaymentTransaction = $object->saveTransaction($this->_getAllParams());
        $payment['UserId'] = $userId;

        //insert payment
        $resPayment = Coco_NotORM::getInstance()->Payments()->insert($payment);
        if ($resPaymentTransaction) {
            $resPaymentTransaction['PaymentId'] = $resPayment['PaymentId'];
            $resPaymentTransaction->update();
        }
    }

    /**
     * Generate site
     */
    public function generateSite(){

    }

    /**
     * Notify after customer pay money
     * @param $type
     * @param $orderId
     * @param $userId
     */
    public function notify($type, $orderId, $userId){
        //save payment
        $paymentMethod = Coco_NotORM::getInstance()->PaymentMethods[array('PaymentMethodCode' => $type)];
        if ($paymentMethod) {
            //insert data to payment help you track
            $this->insertToPayment($paymentMethod, $userId);

            //update status for order
            $this->updateStatusOrder($orderId);

            //generate site
            $this->generateSite();

            //send email to customer
            $this->sendEmailToCustomer($orderId);

            return true;
        }
    }
}