<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/11/13
 * Time: 5:22 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Form_FormContact extends Zend_Form {

    public function __construct($options = array()){
        parent::__construct($options);
        $this->setAttrib('id', 'frmContact');
        $this->setAttrib('method', 'POST');

        $fullname = new Zend_Form_Element_Text('Fullname');
        $fullname->setRequired(true);
        $this->addElement($fullname);

        $email = new Zend_Form_Element_Text('Email');
        $email->setRequired(true);
        $email->addValidator(new Zend_Validate_EmailAddress());
        $this->addElement($email);

        $phone = new Zend_Form_Element_Text('Phone');
        $phone->setRequired(true);
        $this->addElement($phone);

        $countryName = new Zend_Form_Element_Select('CountryName');
        $countryName->setRequired(true);
        $options = Coco_NotORM::getInstance()->CountryAlls()->fetchPairs('CountryId', 'CountryName');
        $options = array_merge(array('' => '-- Choose country --'), $options);
        $countryName->setMultiOptions($options);
        $this->addElement($countryName);

        $content = new Zend_Form_Element_Textarea('Content');
        $content->setRequired(true);
        $content->addValidator(new Zend_Validate_StringLength(10));
        $this->addElement($content);
    }
}