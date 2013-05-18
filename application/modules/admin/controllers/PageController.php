<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/13/13
 * Time: 8:14 PM
 * To change this template use File | Settings | File Templates.
 */
class Admin_PageController extends Coco_Controller_Action_Admin {

    /**
     * @var Admin_Model_Page
     */
    private $_model;

    public function init(){
        parent::init();

        $this->_model = new Admin_Model_Page();
    }

    public function indexAction(){
        $pages = $this->_model->getPages();

        $this->view->pages = $pages;
    }

    public function deleteAction(){
        $pageId = $this->_getParam('id');
        if($pageId){
            if(Coco_NotORM::getInstance()->Pages[$pageId]->delete()){
                $this->_redirect($this->href ? $this->href : '/admin/page');
            }else{
                throw new Zend_Exception('Delete have error.');
            }
        }
    }

    public function editAction(){
        $pageId = $this->_getParam('id');
        $form = new Admin_Form_FormPage();

        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            if($form->isValid($data)){
                $res = $this->_model->save($data, $this->_getParam('lang', LANGUAGE_DEFAULT));
                if($res){
                    $this->_redirect($this->href ? $this->href : '/admin/page');
                }
            }
            $form->populate($data);
        }else{
            $page = $this->_model->getPage($pageId, $this->_getParam('lang', LANGUAGE_DEFAULT));
            $form->populate($page);
        }

        $this->view->form = $form;
    }

    public function addAction(){
        $form = new Admin_Form_FormPage();

        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            if($form->isValid($data)){
                $res = $this->_model->save($data, $this->_getParam('lang', LANGUAGE_DEFAULT));
                if($res){
                    $this->_redirect($this->href ? $this->href : '/admin/page');
                }
            }
            $form->populate($data);
        }

        $this->view->form = $form;
    }
}