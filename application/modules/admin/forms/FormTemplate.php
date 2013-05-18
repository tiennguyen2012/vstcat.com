<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/30/13
 * Time: 4:07 PM
 * To change this template use File | Settings | File Templates.
 */
class Admin_Form_FormTemplate extends Zend_Form {


    public function __construct($options = array()){
        $translate = Zend_Registry::get('Zend_Translate');

        parent::__construct($options);
        $this->setAttrib('id', 'frmTemplate');

        $templateId = new Zend_Form_Element_Hidden('TemplateId');
        $this->addElement($templateId);

        $templateCode = new Zend_Form_Element_Text('TemplateCode');
        $templateCode->setDescription($translate->_('No depend language.'));
        $templateCode->setRequired(true);
        $templateCode->setLabel($translate->_('Template Code'));
        $this->addElement($templateCode);

        $templateName = new Zend_Form_Element_Text('TemplateName');
        $templateName->setRequired(true);
        $templateName->setLabel($translate->_('Template Name'));
        $this->addElement($templateName);

        $isFreeMember = new Zend_Form_Element_Checkbox('IsFreeMember');
        $isFreeMember->setCheckedValue(1);
        $isFreeMember->setUncheckedValue(0);
        $isFreeMember->setDescription($translate->_('No depend language.'));
        $isFreeMember->setLabel($translate->_('Is Free Member'));
        $this->addElement($isFreeMember);

        $isActive = new Zend_Form_Element_Checkbox('IsActive');
        $isActive->setDescription($translate->_('No depend language.'));
        $isActive->setCheckedValue(1);
        $isActive->setUncheckedValue(0);
        $isActive->setLabel($translate->_('Is Active'));
        $this->addElement($isActive);

        $uniqueCurrentPrice = new Zend_Form_Element_Text('UniqueCurrentPrice');
        $uniqueCurrentPrice->setDescription($translate->_('No depend language.'));
        $uniqueCurrentPrice->setLabel($translate->_('Unique Price'));
        $uniqueCurrentPrice->setRequired(true);
        $uniqueCurrentPrice->addValidator(new Zend_Validate_Float());
        $this->addElement($uniqueCurrentPrice);

        $normalPrice = new Zend_Form_Element_Text('NormalPrice');
        $normalPrice->addValidator(new Zend_Validate_Float());
        $normalPrice->setLabel($translate->_('Normal Price'));
        $normalPrice->setDescription($translate->_('No depend language.'));
        $this->addElement($normalPrice);

        $templateType = new Zend_Form_Element_Select('TemplateTypeId');
        $templateType->setRequired(true);
        $templateType->setLabel($translate->_('Template Type'));
        $templateType->setMultiOptions(Coco_NotORM::getInstance()->TemplateTypes()->fetchPairs('TemplateTypeId', 'TemplateTypeName'));
        $templateType->setDescription($translate->_('No depend language.'));
        $this->addElement($templateType);

        $categoryId = new Zend_Form_Element_Select('CategoryId');
        $categoryId->setDescription($translate->_('No depend language.'));
        $categoryId->setLabel($translate->_('Category'));
        $categoryId->setMultiOptions(Coco_NotORM::getInstance()->Categorys()->fetchPairs('CategoryId', 'CategoryName'));
        $categoryId->setRequired(true);
        $this->addElement($categoryId);

        $templateDescription = new Zend_Form_Element_Textarea('TemplateDescription');
        $templateDescription->setLabel($translate->_('Template Description'));
        $templateDescription->setRequired(true);
        $this->addElement($templateDescription);

        $templateCodeName = new Zend_Form_Element_Text('TemplateCodeName');
        $templateCodeName->setLabel($translate->_('Template Code Name'));
        $templateCodeName->setDescription($translate->_('No depend language.'));
        $templateCodeName->setRequired(true);
        $this->addElement($templateCodeName);

        $imageDefault = new Zend_Form_Element_Hidden('ImageDefault');
        $this->addElement($imageDefault);
    }

    public function isValid($data){
        $templateCodeName = $this->getElement('TemplateCodeName');
        $templateCodeName->addValidator('Db_NoRecordExists', true, array('table' => 'Templates', 'field' => 'TemplateCodeName',
            'exclude'   => array(
                'field' => 'TemplateId',
                'value' => $data['TemplateId']
            )));


        $templateCode = $this->getElement('TemplateCode');
        $templateCode->addValidator('Db_NoRecordExists', true, array('table' => 'Templates', 'field' => 'TemplateCode',
            'exclude'   => array(
                'field' => 'TemplateId',
                'value' => $data['TemplateId']
            )));

        return parent::isValid($data);
    }
}