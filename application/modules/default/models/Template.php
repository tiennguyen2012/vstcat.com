<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/8/13
 * Time: 12:38 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Model_Template  {

    public function detail($id){
        $template = Coco_NotORM::getInstance()->Templates[array('TemplateId' => $id, 'IsActive' => 1, 'IsDeleted' => 0)];
        return $template;
    }

    public function getTemplates($params = array()){
        $templates = Coco_NotORM::getInstance()->Templates()->where('IsActive', 1)->where('IsDeleted', 0)->where('ImageDefault IS NOT NULL');
        if(isset($params['cate'])){
            $templates->where('CategoryId', $params['cate']);
        }
        if(isset($params['type'])){
            $templates->where('TemplateTypeId', $params['type']);
        }
        return $templates;
    }

}