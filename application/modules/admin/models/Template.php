<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/28/13
 * Time: 10:43 PM
 * To change this template use File | Settings | File Templates.
 */
class Admin_Model_Template {

    /**
     * Get template list
     * @return mixed
     */
    public function getTemplates(){
        $templates = Coco_NotORM::getInstance()->Templates()->where('IsDeleted', 0)->order('CreatedDate DESC');
        return $templates;
    }

    /**
     * Get template detail
     * @param $templateId
     * @return mixed
     */
    public function getTemplate($templateId, $lang = LANGUAGE_DEFAULT){
        $template = Coco_NotORM::getInstance()->Templates[array('TemplateId' => $templateId, 'IsDeleted' => 0)];
        if($template){
            $templateLang = Coco_NotORM::getInstance()->TemplateLangs[array('TemplateId' => $templateId, 'Lang' => $lang)];
            return array_merge(Vts_App::objectToArray($template), Vts_App::objectToArray($templateLang));
        }
        return null;
    }

    /**
     * Save value of template.
     * @param $data
     * @param string $lang
     * @return bool
     */
    public function save($data, $lang = LANGUAGE_DEFAULT)
    {
        $data['Lang'] = $lang;
        $dataTemplate = Coco_NotORM::mergeData('Templates', $data);
        $dataTemplateLang = Coco_NotORM::mergeData('TemplateLangs', $data);
        //save and update
        try{
            //save page
            if(!empty($data['TemplateId'])){
                Coco_NotORM::getInstance()->Templates[$data['TemplateId']]->update($dataTemplate);
            }else{
                $newTemplate = Coco_NotORM::getInstance()->Templates()->insert($dataTemplate);
                if($newTemplate){
                    $dataTemplateLang['TemplateId'] = $newTemplate['TemplateId'];
                }
            }

            //save page lang
            if(!empty($dataTemplateLang['TemplateLangId'])){
                Coco_NotORM::getInstance()->TemplateLangs[$data['TemplateLangId']]->update($dataTemplateLang);
            }else{
                Coco_NotORM::getInstance()->TemplateLangs()->insert($dataTemplateLang);
            }

            return true;
        }catch (exception $e){
            return false;
        }
    }

    public function uploadFiles(){

    }
}