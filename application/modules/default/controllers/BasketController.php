<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 5/25/13
 * Time: 3:56 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_BasketController extends Coco_Controller_Action_Default {

    public function init(){
        parent::init();
    }

    /**
     * Get
     * @return Zend_Session_Namespace
     */
    public function getBasket(){
        $basket = new Zend_Session_Namespace("basket");
        return $basket;
    }

    /**
     * Add item
     * @param $item
     * @author tien.nguyen
     */
    public function add($item){

    }
}