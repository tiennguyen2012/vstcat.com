<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/11/13
 * Time: 5:16 PM
 * To change this template use File | Settings | File Templates.
 */
class ContactController extends Coco_Controller_Action_Default {

    public function indexAction(){
        $form = new Default_Form_FormContact();

        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            if($form->isValid($data)){
                $res = Coco_NotORM::getInstance()->Contacts()->insert($data);
                if($res){
                    //send email to user
                    $lEmail = new Vts_Email();
                    $this->view->data = $data;
                    $htmlContact = $this->view->render('contact/contact-email.phtml');
                    @$lEmail->send($this->view->lang('VTSWeb Contact'), $htmlContact,
                        array('name' => EMAIL_NAME, 'email' => EMAIL_USER),
                        array('name' => $data['Fullname'], 'email' => $data['Email'])
                    );
                    $this->_redirect('/contact/contact-success');
                }
            }
            $form->populate($data);
        }

        $this->view->form = $form;
    }

    public function contactSuccessAction(){

    }
}