<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/9/13
 * Time: 12:49 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Form_FormMemberSignUp extends Zend_Form {

    public function __construct($options = array()){
        parent::__construct($options);

        $this->setAttrib('id', 'frmMemberSignUp');
        $this->setMethod('POST');

    }
}