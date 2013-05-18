<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/18/13
 * Time: 8:22 PM
 * To change this template use File | Settings | File Templates.
 */
interface Vts_Payment_Payment {

    public function render($orderId);

    public function getPayment($params);

    public function saveTransaction($params);
}