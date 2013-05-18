<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/21/13
 * Time: 12:00 AM
 * To change this template use File | Settings | File Templates.
 */
class Default_Model_Order
{

    /**
     * Add item template to basket
     *
     * @param $templateId
     * @param $type in array('MEMBER_AND_TEMPLATE', 'TEMPLATE', 'MODULE')
     * @param $priceType in array('NORMAL', 'UNIQUE')
     * @param $memberType in array('INSITE', 'DOWNLOAD')
     * @return null|Order
     */
    public function add($itemId, $itemType, $priceType, $websiteType = 'INSITE')
    {
        $userLogin = Vts_App::getUserLogin();
        if ($userLogin) {
            if ($this->_isValidateAdd($itemId, $itemType, $priceType)) {
                //check and add member
                $lMember = new Vts_Member();
                if (!$lMember->isMember()) { //is member
                    $resMember = $this->_addMember($userLogin, $websiteType);
                    if (!$resMember) {
                        throw new Zend_Exception('Add member have error.');
                    }
                }

                //update new domain
                if (strtoupper($itemType) == 'NEW_AND_TEMPLATE') {
                    $resUpdateWebsite = $this->_updateWebsiteType($websiteType);
                    if (!$resUpdateWebsite) {
                        throw new Zend_Exception('Update website type is fail.');
                    }
                }

                //add new Order
                $resOrder = $this->_saveOrder($userLogin);
                if ($resOrder) {
                    $resOrderDetail = $this->_saveOrderDetail($resOrder['OrderId'], $itemId, $itemType, $priceType, $websiteType);
                    if ($resOrderDetail) {
                        //update total
                        $this->_updateOrderTotal($resOrder['OrderId']);
                        return $resOrder;
                    }
                } else {
                    throw new Zend_Exception('Save order fail');
                }
            }
        }
        return null;
    }

    private function _isValidateAdd($itemId, $type, $priceType)
    {
        return true;
    }

    /**
     * Add member by session login
     * @param $userLogin stdClass
     * @param $memberType - string in array: DOWNLOAD, UNIQUE
     * @return bool
     */
    private function _addMember($userLogin, $memberType)
    {
        $dataMember = array();
        $dataMember['UserId'] = $userLogin->UserId;
        $dataMember['IsActive'] = 1;
        $resMember = Coco_NotORM::getInstance()->Members()->insert($dataMember);
        if ($resMember)
            return true;
        else
            return false;
    }

    /**
     * Update website type type
     * @param $websiteType - string
     * @return bool
     * @throws Zend_Exception
     * @return bool
     */
    private function _updateWebsiteType($websiteType)
    {
        $login = Vts_App::getUserLogin();
        if ($login->CurrentWebsiteId) {
            $website = Coco_NotORM::getInstance()->Websites[$login->CurrentWebsiteId];
            if ($website) {
                try{
                    $website->update(array('WebsiteType' => strtoupper($websiteType)));
                    return true;
                }catch (exception $e){
                    return false;
                }
            }
        } else {
            throw new Zend_Exception('Lost session website id.');
        }
        return false;
    }

    private function _saveOrder($userLogin)
    {
        if (Vts_App::getUserLogin()->CurrentWebsiteId) {
            $dataOrder = array();
            $dataOrder['UserId'] = $userLogin->UserId;
            $dataOrder['TotalPrice'] = 0;
            $dataOrder['WebsiteId'] = Vts_App::getUserLogin()->CurrentWebsiteId;
            return Coco_NotORM::getInstance()->Orders()->insert($dataOrder);
        } else {
            throw new Zend_Exception('Please choose site.');
        }
    }

    /**
     * Update order total
     * @param $orderId - Order of Id
     */
    private function _updateOrderTotal($orderId)
    {
        $total = 0;
        $order = Coco_NotORM::getInstance()->Orders[$orderId];
        if ($order) {
            $orderDetails = Coco_NotORM::getInstance()->OrderDetails()->where('OrderId', $orderId);
            if ($orderDetails) {
                foreach ($orderDetails as $item) {
                    $total += floatval($item['Price']);
                }
            }
            try{
                if($total == 0)
                    $order->update(array('TotalPrice' => $total, 'OrderStatus' => 'PURCHASED'));
                else
                    $order->update(array('TotalPrice' => $total));
                return true;
            }catch (exception $e){

            }
        }
        return false;
    }

    /**
     * @param $orderId - Order id
     * @param $itemId - Item ID that you can buy
     * @param $type - Item Type. example: TEMPLATE, MEMBER_AND_TEMPLATE, MODULE
     * @param $priceType - Price of Item. We have 2 options for price: UNIQUE, NORMAL
     * @param $memberType - We have 2 options for member type: DOWNLOAD, INSITE
     * @throws Zend_Exception
     */
    private function _saveOrderDetail($orderId, $itemId, $type, $priceType, $websiteType)
    {
        //Order Item with Template
        if (strtoupper($type) == 'TEMPLATE' || strtoupper($type) == 'NEW_AND_TEMPLATE') {
            $lTemplate = new Vts_Template();
            $template = Coco_NotORM::getInstance()->Templates[$itemId];
            if ($template) {
                $dataOrderDetail = array();
                $dataOrderDetail['OrderId'] = $orderId;
                $dataOrderDetail['ItemName'] = $template['TemplateName'];
                $dataOrderDetail['ItemId'] = $itemId;
                $dataOrderDetail['ItemCode'] = $template['TemplateCode'];
                $dataOrderDetail['ItemQuality'] = 1;
                $dataOrderDetail['ItemType'] = strtoupper($type);
                $dataOrderDetail['Price'] = $lTemplate->getPrice($template, $type, $priceType, $websiteType);
                $dataOrderDetail['PriceType'] = strtoupper($priceType);
                //insert to new Order Detail
                return Coco_NotORM::getInstance()->OrderDetails()->insert($dataOrderDetail);
            } else {
                throw new Zend_Exception('Template not exist.');
            }
        }
    }

    /**
     * Get order with order id
     * @param $orderId - int, order id
     * @return null|order
     */
    public function getOrder($orderId)
    {
        if ($orderId) {
            $order = Coco_NotORM::getInstance()->Orders[array('OrderId' => $orderId, 'IsDeleted' => 0)];
            return $order;
        }
        return null;
    }
}