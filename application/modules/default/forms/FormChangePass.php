<?php
class Default_Form_FormChangePass extends Zend_Form {
	
	public function __construct($options = array()){
		parent::__construct($options);
		
		$oldPass = new Zend_Form_Element_Password('OldPassword');
		$oldPass->setRequired(true);
		$this->addElement($oldPass);
		
		$newPass = new Zend_Form_Element_Password('NewPassword');
		$newPass->setRequired(true);
		$this->addElement($newPass);
		
		$reNewPass = new Zend_Form_Element_Password('ReNewPassword');
		$reNewPass->addValidator('Identical', false, array('token' => 'NewPassword'));
		$reNewPass->setRequired(true);
		$this->addElement($reNewPass);
	}
	
	/**
	 * Override validate
	 * @author tien.nguyen
	 * @see Zend_Form::isValid()
	 * @return boolean
	 */
	public function isValid($data){
		$error = parent::isValid($data);
		if($error){
			if(!$this->isValidOldPassword($data['OldPassword'])){
				$this->getElement("OldPassword")->addError('Old Password is not correct.');
				$error = FALSE;					
			}
		}
		return $error;
	}
	
	/**
	 * Check is valid old password. Access to session user login 
	 * and compare old password from input and session password
	 * @param string $oldPassword
	 * @return boolean
	 */
	private function isValidOldPassword($oldPassword){
		$modelUser = new Default_Model_User();
		$user = $modelUser->getUserLogin();
		if($user){
			$user = Coco_NotORM::getInstance()->Users[array('UserId' => $user->UserId)];
			if($user['Password'] == md5($oldPassword)){
				return TRUE;
			}
		}
		return FALSE;
	}
}