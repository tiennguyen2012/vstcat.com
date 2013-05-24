<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 5/24/13
 * Time: 8:25 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Model_User {

    public function forgetPassword($email){
        $user = Coco_NotORM::getInstance()->Users[array('Email' => $email)];
        if($user){
            try{
                //update temp password
                $token = md5($user['Username'].$user['CreatedDate']);
                $user->update(array('Token' => $token, 'TokenExpireDate' => Zend_Date::now()->addHour(24)->toString("yyyy-MM-dd hh:mm:ss")));

                $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('viewRenderer');
                if($viewRenderer->view == null){
                    $viewRenderer->initView();
                }
                $view = $viewRenderer->view;

                //send email to user
                $mail = new Vts_Email();
                $view->user = $user;
                $view->token = $token;
                $resHtml = $view->render('user/forget-password-email.phtml');
                @$mail->send($view->lang('VTSWeb Registry'), $resHtml,
                    array('name' => EMAIL_NAME, 'email' => EMAIL_USER),
                    array('name' => $user['Username'], 'email' => $user['Email'])
                );
                return true;
            }catch (exception $e){
                throw new Zend_Exception($e->getMessage());
            }

        }
    }

    /**
     * @param $token
     * @param $data
     * @return bool
     * @throws Zend_Exception
     */
    public function changePassToken($token, $data){
        $user = Coco_NotORM::getInstance()->Users[array('Token' => $token)];
        if($user){
            try{
                $user->update(array('Password' => md5($data['Password'])) );
                return true;
            }catch (exception $e){
                throw new Zend_Exception($e->getMessage());
            }
        }else{
            throw new Zend_Exception("Token invalid.");
        }
    }

    /**
     * Change password by token
     * @author tien.nguyen
     * @param $token
     */
    public function checkExpireToke($token){
        $user = Coco_NotORM::getInstance()->Users[array('Token' => $token)];
        if($user){
            $expireDate = new Zend_Date($user['TokenExpireDate']);
            if(Zend_Date::now()->subHour(24)->compare($expireDate) < 0){
                return true;
            }else{
                throw new Zend_Exception("Your toke is expired.");
            }
        }else{
            throw new Zend_Exception("Your token invalid.");
        }
        return false;
    }

    /**
     * Create random password
     * @return string
     */
    public function createRandomPassword(){
        $chars = "abcdefghijkmnopqrstuvwxyz0123456789";
        srand((double)microtime()*10000000);
        $i = 0;
        $pass = '';
        while($i <= 7){
            $num = rand() %  33;
            $tmp = substr($chars, $num, 1);
            $pass = $pass.$tmp;
            $i++;
        }
        return $pass;
    }
}