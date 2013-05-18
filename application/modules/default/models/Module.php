<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/9/13
 * Time: 12:38 AM
 * To change this template use File | Settings | File Templates.
 */
class Default_Model_Module {

    public function getModules(){
        return Coco_NotORM::getInstance()->Modules()->where('IsActive', 1)->where('IsDeleted', 0);
    }
}