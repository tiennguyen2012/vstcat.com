<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 5/24/13
 * Time: 10:50 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Form_FormForgetToken extends Zend_Form {

    public function __construct($options = array()){
        parent::__construct($options);

        $password = new Zend_Form_Element_Password("Password");
        $password->setRequired(true);
        $password->addValidator(new Zend_Validate_StringLength(array('max' => 30, 'min' => 6)));
        $this->addElement($password);

        $rePassword = new Zend_Form_Element_Password('RePassword');
        $rePassword->addValidator(new Zend_Validate_StringLength(array('max' => 30, 'min' => 6)));
        $rePassword->setRequired(true);
        $rePassword->addValidator(new Zend_Validate_Identical('Password'));
        $this->addElement($rePassword);
    }
}