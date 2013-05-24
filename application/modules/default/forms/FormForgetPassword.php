<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 5/24/13
 * Time: 8:07 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Form_FormForgetPassword extends Zend_Form {

    /**
     * function options
     * @param array $options
     */
    public function __construct($options = array()){
        parent::__construct($options);

        $email = new Zend_Form_Element_Text('Email');
        $email->setRequired(true);
        $email->addValidator(new Zend_Validate_EmailAddress());
        $email->addValidator('Db_RecordExists', false, array('table' => 'Users', 'field' => 'Email'));
        $this->addElement($email);
    }
}