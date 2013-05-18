<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/12/13
 * Time: 1:39 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Form_FormSignIn extends Zend_Form {

    public function __construct($options = array()){
        parent::__construct($options);
        $this->setAttrib('id', 'frmFormLogin');

        $username = new Zend_Form_Element_Text('Username');
        $username->setRequired(true);
        $this->addElement($username);

        $password = new Zend_Form_Element_Password('Password');
        $password->setRequired(true);
        $this->addElement($password);
    }
}