<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/9/13
 * Time: 12:24 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Form_FormSignUp extends Zend_Form {

    public function __construct($options = array()){
        parent::__construct($options);

        $this->setAttrib('id', 'frmSignUp');
        $this->setMethod('POST');

        $username = new Zend_Form_Element_Text('Username');
        $username->setRequired(true);
        $username->addValidator('Db_NoRecordExists', false, array('table' => 'Users', 'field' => 'Username'));
        $this->addElement($username);

        $password = new Zend_Form_Element_Password('Password');
        $password->setRequired(true);
        $this->addElement($password);

        $rePassword = new Zend_Form_Element_Password('RePassword');
        $rePassword->addValidator('Identical', false, array('token' => 'Password'));
        $rePassword->setRequired(true);
        $this->addElement($rePassword);

        $fullname = new Zend_Form_Element_Text('Fullname');
        $fullname->setRequired(true);
        $this->addElement($fullname);

        $email = new Zend_Form_Element_Text('Email');
        $email->setRequired(true);
        $email->addValidator(new Zend_Validate_EmailAddress());
        $email->addValidator('Db_NoRecordExists', false, array('table' => 'Users', 'field' => 'Email'));
        $this->addElement($email);

        $countryName = new Zend_Form_Element_Select('CountryName');
        $countryName->setRequired(true);
        $options = Coco_NotORM::getInstance()->CountryAlls()->fetchPairs('CountryId', 'CountryName');
        $options = array_merge(array('' => '-- Choose country --'), $options);
        $countryName->setMultiOptions($options);
        $this->addElement($countryName);

        $address = new Zend_Form_Element_Text('Address');
        $this->addElement($address);
    }
}