<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/9/13
 * Time: 12:48 PM
 * To change this template use File | Settings | File Templates.
 */
class WebsiteController extends Coco_Controller_Action_Default {

    public function createAction(){
        $form = new Default_Form_FormDomain();
        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            if($form->isValid($data)){
                $default = new Zend_Session_Namespace('default');
                $data['UserId'] = $default->userLogin->UserId;
                $res = Coco_NotORM::getInstance()->Websites()->insert($data);
                if($res){
                    $default = new Zend_Session_Namespace('default');
                    $default->userLogin->CurrentWebsiteId = $res['WebsiteId'];
                    $default->userLogin->CurrentDomain = $res['Domain'];
                    $this->_redirect(!empty($this->href) ? $this->href.'/result/success' : '/website/create-success');
                }
            }

            $form->populate($data);
        }

        $this->view->form = $form;
    }

    /**
     * Domain for website
     */
    public function domainAction(){
        $form = new Default_Form_FormDomain();
        $formSubDomain = new Default_Form_FormSubDomain();

        if($this->_request->isPost()){
            $data = $this->_request->getPost();

            if(empty($data['UseSubDomain'])){
                if($form->isValid($data)){
                    $this->_redirect($this->view->url(array('controller' => 'order', 'action' => 'set-domain', 'domain' => $data['Domain']), null, true));
                }
                $form->populate($data);
            }else{
                if($formSubDomain->isValid($data)){
                    $this->_redirect($this->view->url(array('controller' => 'order', 'action' => 'set-domain', 'domain' => $data['SubDomain'].".vtscat.com"), null, true));
                }
                $formSubDomain->populate($data);
            }
            $this->view->UseSubDomain = $data['UseSubDomain'];
        }

        $this->view->form = $form;
        $this->view->formSubDomain = $formSubDomain;
    }

    public function createSuccessAction(){

    }
}