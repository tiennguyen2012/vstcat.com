<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/28/13
 * Time: 10:42 PM
 * To change this template use File | Settings | File Templates.
 */
class Admin_TemplateController extends Coco_Controller_Action_Admin {

    /**
     * @var Admin_Model_Template
     */
    private $_model;

    public function init(){
        parent::init();

        $this->_model = new Admin_Model_Template();
    }

    /**
     * get action index.
     * @author tien.nguyen
     */
    public function indexAction(){
        $templates = $this->_model->getTemplates();

        $this->view->templates = $templates;
    }

    /**
     * Action edit
     * @author tien.nguyen
     */
    public function editAction(){
        $templateId = $this->_getParam('id');
        $form = new Admin_Form_FormTemplate();

        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            if($form->isValid($data)){
                $res = $this->_model->save($data, $this->_getParam('lang', LANGUAGE_DEFAULT));
                if($res){
                    $this->_redirect($this->href ? $this->href : '/admin/template');
                }
            }
            $form->populate($data);
        }else{
            $template = $this->_model->getTemplate($templateId, $this->_getParam('lang', LANGUAGE_DEFAULT));
            $form->populate($template);
        }
        $this->view->form = $form;
    }

    /**
     * Action for add template
     * @author tien.nguyen
     */
    public function addAction(){
        $form = new Admin_Form_FormTemplate();

        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            if($form->isValid($data)){
                $res = $this->_model->save($data, $this->_getParam('lang', LANGUAGE_DEFAULT));
                if($res){
                    $this->_redirect($this->href ? $this->href : '/admin/template');
                }
            }
            $form->populate($data);
        }

        $this->view->form = $form;
    }

    /**
     * Delete template
     */
    public function deleteAction(){
        $templateId = $this->_getParam('id');
        $res = Coco_NotORM::getInstance()->Templates[$templateId]->update(array('IsDeleted' => 1));
        if($res){
            $this->_redirect($this->href ? $this->href : '/admin/template');
        }else{
            throw new Zend_Exception("Delete fail.");
        }
    }

    public function deleteFileAction(){
        $templateId = $this->_getParam('id');
        $imageName = $this->_getParam('image');

        $path = APPLICATION_PATH.'/../public/uploads/templates/'.$templateId.'/';
        try{
            //delete image main
            @unlink($path.$imageName);
            //delete image thumbnail
            @unlink($path.'thumbnail/'.$imageName);
            echo json_encode(array('result' => true));
        }catch (exception $e){
            echo json_encode(array('result' => false));
        }
        die;
    }
}