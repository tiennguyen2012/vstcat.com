<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/13/13
 * Time: 8:52 PM
 * To change this template use File | Settings | File Templates.
 */
class Admin_Form_FormPage extends Zend_Form {

    public function __construct($options = array()){
        $translate = Zend_Registry::get('Zend_Translate');

        parent::__construct($options);
        $this->setAttrib('id', 'frmPage');

        $pageId = new Zend_Form_Element_Hidden('PageId');
        $this->addElement($pageId);

        $pageLangId = new Zend_Form_Element_Hidden('PageLangId');
        $this->addElement($pageLangId);

        $pageName = new Zend_Form_Element_Text('PageName');
        $pageName->setLabel($translate->_('Page Name'));
        $pageName->setRequired(true);
        $this->addElement($pageName);

        $pageCode = new Zend_Form_Element_Text('PageCode');
        $pageCode->setLabel($translate->_('Page Code'));
        $pageCode->setRequired(true);
        $pageCode->setDescription($translate->_('No depend language.'));
        $this->addElement($pageCode);

        $pageTitle = new Zend_Form_Element_Text('PageTitle');
        $pageTitle->setLabel($translate->_('Page Title'));
        $pageTitle->setRequired(true);
        $this->addElement($pageTitle);

        $pageContent = new Zend_Form_Element_Textarea('PageContent');
        $pageContent->setRequired(true);
        $pageContent->setLabel($translate->_('Page Content'));
        $this->addElement($pageContent);

        $isActive = new Zend_Form_Element_Checkbox('IsActive');
        $isActive->setCheckedValue(1);
        $isActive->setUncheckedValue(0);
        $isActive->setDescription($translate->_('No depend language.'));
        $isActive->setLabel($translate->_('Is Active'));
        $this->addElement($isActive);
    }

    public function isValid($data){
        $pageCode = $this->getElement('PageCode');
        $pageCode->addValidator('Db_NoRecordExists', true, array('table' => 'Pages', 'field' => 'PageCode',
            'exclude'   => array(
                'field' => 'PageId',
                'value' => $data['PageId']
            )));
        return parent::isValid($data);
    }
}