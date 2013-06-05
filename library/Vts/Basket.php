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

    /**
     * - Get basket
     * - Set information by basket 
     * @return Zend_Session
     */
    public function get(){
        $basket = Vts_Session::get("basket", new stdClass());
        $this->setInfoByBasket();
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
            $total += floatval($basket->Template->Price);
        if($basket->AccountType)
            $total += floatval($basket->AccountType->Price);
        if($basket->Domain)
            $total += floatval($basket->Domain->Price);

        return $total;
    }

    /**
     * Get url next
     * @return null
     */
    public function getNextStep(){
        $basket = $this->get();
        $arr = array('Info' => ORDER_LOGIN, 'Template' => ORDER_TEMPLATE, 'AccountType' => ORDER_ACCOUNT_TYPE, 'Domain' => ORDER_DOMAIN);
        foreach($arr as $key => $value){
            if(empty($basket->{$key})){
                return $value;
            }
        }
        return ORDER_SAVE;
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
        $res = array();

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
     * Get info customer for basket
     * @author tien.nguyen
     */
    public function getInfo(){
        $basket = $this->get();
        if(isset($basket->Info)){
            return $basket->Info;
        }
        return null;
    }

    /**
     * Get cycle billing
     * @author tien.nguyen
     * @return null
     */
    public function getCycleBilling(){
        $basket = $this->get();
        if(isset($basket->AccountType)){
            return $basket->AccountType->Options;
        }
        return null;
    }

    /**
     * @param $name
     * @param $value
     * @return bool
     */
    public function setValue($name, $value){
        $default = new Zend_Session_Namespace('default');
        $default->basket->{$name} = $value;

        return true;
    }

    /**
     * Add template for basket
     * @author tien.nguyen
     * @param $templateId
     * @throws Zend_Exception
     */
    public function setTemplate($templateId) {
        $template = Coco_NotORM::getInstance()->Templates[array('TemplateId' => $templateId, 'IsActive' => 1, 'IsDeleted' => 0)];
        $vtsTemplate = new Vts_Template();
        if($template){
            $item = new stdClass();
            $item->ItemQuality = 1;
            $item->Price = $vtsTemplate->getPriceDefault($template);
            $item->PriceType = $vtsTemplate->getPriceTypeDefault($template);
            $item->ItemId = $templateId;
            $item->ItemType = "TEMPLATE";
            $item->ItemName = $template['TemplateName'];
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
    public function setTypeAccount($accountTypeCode, $cycleBilling = "NONE"){
        $accountTypeCodeObj = Coco_NotORM::getInstance()->AccountTypes[array('AccountTypeCode' => $accountTypeCode, 'IsActive' => 1)];
        if($accountTypeCodeObj){
            $item = new stdClass();
            $item->ItemQuality = 1;
            $item->Price = $accountTypeCodeObj['Price'];
            $item->ItemId = $accountTypeCodeObj['AccountTypeId'];
            $item->PriceType = $accountTypeCode;
            $item->ItemType = 'ACCOUNT_TYPE';
            $item->ItemCode = strtoupper($accountTypeCode);
            $item->ItemName = $accountTypeCodeObj['AccountTypeName'];
            $item->Options = strtoupper($cycleBilling);

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
        $item->ItemName = $domain;
        $item->ItemCode = '';

        //set domain
        return $this->setValue("Domain", $item);
    }

    /**
     * Set information by user login system
     * @author tiennguyen
     */
    public function setInfoByBasket(){
        //get user from session. have all property of table user.
        $userLogin = Vts_Session::get('userLogin');
        if($userLogin){
            $item = new stdClass();
            $item->UserId = $userLogin->UserId;
            $item->OrderStatus = ORDER_STATUS_PENDING;

            return $this->setValue('Info', $item);
        }else{
            
        }
    }

    /**
     * Remove all item in basket
     * @return bool
     */
    public function removeAll(){
        $default = new Zend_Session_Namespace('default');
        $default->basket = null;
        return  true;
    }
}