<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/9/13
 * Time: 2:02 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Form_FormDomain extends Zend_Form {

    public function __construct($options = array()){
        parent::__construct($options);

        $domain = new Zend_Form_Element_Text('Domain');
        $domain->setRequired(true);
        $domain->addValidator(new Zend_Validate_Hostname());
        $domain->addValidator('Db_NoRecordExists', false, array('table' => 'Websites', 'field' => 'Domain'));
        $this->addElement($domain);

    }
}