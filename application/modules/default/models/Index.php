<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/8/13
 * Time: 12:56 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Model_Index {

    public function index(){
        $res = array();

        $res['best-sale'] = Coco_NotORM::getInstance()->Templates()
            ->where('IsActive', 1)->where('IsDeleted', 0)->where('ImageDefault IS NOT NULL')->limit(4);
        $res['template-types'] = Coco_NotORM::getInstance()->TemplateTypes()
            ->where('IsActive', 1)->where('IsDeleted', 0);

        return $res;
    }
}