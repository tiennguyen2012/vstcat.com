<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/9/13
 * Time: 2:02 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Form_FormSubDomain extends Zend_Form {

    public function __construct($options = array()){
        parent::__construct($options);

        $subDomain = new Zend_Form_Element_Text('SubDomain');
        $subDomain->setRequired(true);
        $subDomain->addValidator(new Zend_Validate_Hostname());
        $subDomain->addValidator('Db_NoRecordExists', false, array('table' => 'Websites', 'field' => 'Domain'));
        $this->addElement($subDomain);
    }

    /**
     * Check valid data
     * @param array $data
     * @return bool
     */
    public function isValid($data){
        //convert sub domain
        $data['SubDomain'] = strtolower($data['SubDomain']).".vtscat.com";
        return parent::isValid($data);
    }
}