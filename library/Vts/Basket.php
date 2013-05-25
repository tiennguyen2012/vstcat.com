<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 5/25/13
 * Time: 4:01 PM
 * To change this template use File | Settings | File Templates.
 */
class Vts_Basket {

    public function __construct(){}

    public function get(){
        $basket = Vts_Session::get("basket");
        if(empty($basket->items)){
            $basket->items = array();
        }
        return $basket;
    }



    /**
     * Get to
     * @return float|int
     */
    public function getTotal(){
        $total = 0;
        $basket = $this->get();
        if($basket->Template)
            $total = floatval($basket->Template->Price);
        if($basket->AccountType)
            $total = floatval($basket->AccountType->Price);
        if($basket->Domain)
            $total = floatval($basket->Domain->Price);

        return $total;
    }

    /**
     * Get url next
     * @return null
     */
    public function getNextStep(){
        $basket = $this->get();
        $arr = array('Template' => ORDER_TEMPLATE, 'AccountType' => ORDER_TEMPLATE, 'Domain' => ORDER_DOMAIN);
        foreach($arr as $key => $value){
            if(empty($basket->{$key})){
                return $value;
            }
        }
        return null;
    }

    /**
     * @param $itemId
     * @param $itemType
     * @param $priceType
     * @return bool
     */
    public function remove($name){
        $basket = $this->get();
        $basket->{$name} = null;
        return true;
    }


    public function setDetail($data){
        $basket = $this->get();
        foreach($data as $item){
            switch($item['ItemType']){
                case 'TEMPLATE':
                    $basket->Template = $this->toObject($item);
                    break;
                case 'DOMAIN':
                    $basket->Domain = $this->toObject($item);
                    break;
                case 'ACCOUNT_TYPE':
                    $basket->AccountType = $this->toObject($item);
                    break;
            }
        }
    }

    /**
     * To object
     * @param $item
     * @return stdClass
     */
    public function toObject($item){
        $res = new stdClass();
        foreach($item as $k => $v){
            $res->{$k} = $v;
        }
        return $res;
    }

    /**
     * Get Detail of order
     * @return array
     */
    public function getDetail(){
        $basket = $this->get();
        $res = arrray();

        //get Template
        if($basket->Template)
            $res[] = $basket->Template;

        //get Account Type
        if($basket->AccountType)
            $res[] = $basket->AccountType;

        //get Domain
        if($basket->Domain)
            $res[] = $basket->Domain;

        return $res;
    }

    /**
     * @param $name
     * @param $value
     * @return bool
     */
    public function setValue($name, $value){
        $basket = $this->get();
        $basket->{$name} = $value;
        return true;
    }

    /**
     * Add template for basket
     * @author tien.nguyen
     * @param $templateId
     * @throws Zend_Exception
     */
    public function setTemplate($templateId, $typePrice) {
        $template = Coco_NotORM::getInstance()->Templates[array('TemplateId' => $templateId, 'IsActive' => 0)];
        $vtsTemplate = new Vts_Template();
        if($template){
            $item = new stdClass();
            $item->ItemQuality = 1;
            $item->Price = $vtsTemplate->getPriceDefault($template);
            $item->PriceType = $vtsTemplate->getPriceTypeDefault($template);
            $item->ItemId = $templateId;
            $item->ItemType = "TEMPLATE";
            $item->ItemCode = $template['TemplateCode'];
            return $this->setValue("Template", $item);
        }else{
            throw new Zend_Exception('Template not found');
        }
    }

    /**
     * @param $accountType
     * @return bool
     */
    public function setTypeAccount($accountTypeCode){
        $accountTypeCodeObj = Coco_NotORM::getInstance()->AccountTypes[array('AccountTypeCode' => $accountTypeCode, 'IsAction' => 0)];
        if($accountTypeCodeObj){
            $item = new stdClass();
            $item->ItemQuality = 1;
            $item->Price = $accountTypeCodeObj['Price'];
            $item->ItemId = $accountTypeCodeObj['AccountTypeId'];
            $item->PriceType = $accountTypeCode;
            $item->ItemType = 'ACCOUNT_TYPE';
            $item->ItemCode = $accountTypeCode;

            return $this->setValue("AccountType", $item);
        }else{
            throw new Zend_Exception('Account type not found');
        }
    }

    /**
     * Set domain for basket
     * @param $domain
     * @return bool
     */
    public function setDomain($domain){
        $item = new stdClass();
        $item->ItemQuality = 1;
        $item->Price = 0;
        $item->ItemId = '';
        $item->PriceType = '';
        $item->ItemType = 'DOMAIN';
        $item->ItemCode = '';

        //set domain
        return $this->setValue("Domain", $item);
    }
}