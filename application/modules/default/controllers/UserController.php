<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/9/13
 * Time: 11:40 AM
 * To change this template use File | Settings | File Templates.
 */
class UserController extends Coco_Controller_Action_Default {

    public function signupAction(){
        $form = new Default_Form_FormSignUp();

        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            if($form->isValid($data)){
                unset($data['RePassword']);
                $data['Password'] = md5($data['Password']);
                $res = Coco_NotORM::getInstance()->Users()->insert($data);
                if($res){
                    //send email success
                    $mail = new Vts_Email();
                    $this->view->data = $data;
                    $resHtml = $this->view->render('user/signup-email.phtml');
                    @$mail->send($this->view->lang('VTSWeb Registry'), $resHtml,
                        array('name' => EMAIL_NAME, 'email' => EMAIL_USER),
                        array('name' => $data['Fullname'], 'email' => $data['Email'])
                    );

                    //get user
                    $user = Coco_NotORM::getInstance()->Users[array('Username' => $data['Username'])];
                    //login system
                    $lUser = new Vts_Modules_User();
                    $lUser->login($user['Username'], $user['Password']);
                    $this->_redirect('/website/create');
                }
            }
            $form->populate($data);
        }

        $this->view->form = $form;
    }

    public function signinAction(){
        $form = new Default_Form_FormSignIn();

        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            if($form->isValid($data)){
                $lUser = new Vts_Modules_User();
                $res = $lUser->login($data['Username'], $data['Password']);
                if($res){
                    $this->_redirect($this->href ? $this->href : '/user/management');
                }
            }
            $form->populate($data);
        }

        $this->view->form = $form;
    }

    public function managementAction(){

    }

    public function upgradeAction(){

    }

    public function signoutAction(){
        $lUser = new Vts_Modules_User();
        $res = $lUser->logout();
        $this->_redirect('/user/signin');
    }
}