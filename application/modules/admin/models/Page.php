<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/13/13
 * Time: 8:32 PM
 * To change this template use File | Settings | File Templates.
 */
class Admin_Model_Page
{

    public function getPages()
    {
        $pages = Coco_NotORM::getInstance()->Pages()->
            where('IsDeleted', 0);

        return $pages;
    }

    public function getPage($pageId, $lang = LANGUAGE_DEFAULT){
        $page = Coco_NotORM::getInstance()->Pages[$pageId];
        $pageLang = Coco_NotORM::getInstance()->PageLangs[array('PageId' => $pageId, 'Lang' => $lang)];
        return array_merge(Vts_App::objectToArray($page), Vts_App::objectToArray($pageLang));
    }

    public function save($data, $lang = LANGUAGE_DEFAULT)
    {
        $data['Lang'] = $lang;
        $dataPage = Coco_NotORM::mergeData('Pages', $data);
        $dataPageLang = Coco_NotORM::mergeData('PageLangs', $data);
        //save and update
        try{
            //save page
            if(!empty($data['PageId'])){
                Coco_NotORM::getInstance()->Pages[$data['PageId']]->update($dataPage);
            }else{
                $newPage = Coco_NotORM::getInstance()->Pages()->insert($dataPage);
                if($newPage){
                    $dataPageLang['PageId'] = $newPage['PageId'];
                }
            }

            //save page lang
            if(!empty($dataPageLang['PageLangId'])){
                Coco_NotORM::getInstance()->PageLangs[$data['PageLangId']]->update($dataPageLang);
            }else{
                Coco_NotORM::getInstance()->PageLangs()->insert($dataPageLang);
            }

            return true;
        }catch (exception $e){
            return false;
        }
    }
}