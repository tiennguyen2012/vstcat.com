<?php
class Admin_Model_User {
	
	/**
	 * Get user login.
	 * We get it from session
	 *
	 * @author tien.nguyen
	 * @return NotORM Users|null
	 */
	public function getUserLogin() {
		$default = new Zend_Session_Namespace ( 'default' );
		if ($default->userLogin)
			return $default->userLogin;
		else
			return null;
	}
	
	/**
	 * Login system
	 * 
	 * @param string $username        	
	 * @param string $password        	
	 * @return boolean
	 */
	public function login($username, $password) {
		$user = Coco_NotORM::getInstance ()->Users [array (
				'Username' => $username,
				'Password' => md5 ( $password ),
				'IsActive' => 1,
				'IsDeleted' => 0,
				'IsAdmin' => 1
		)];
		if ($user) {
			$default = new Zend_Session_Namespace ( 'default' );
			$userLogin = new stdClass ();
			$userLogin->Username = $user ['Username'];
			$userLogin->Fullname = $user ['Fullname'];
			$userLogin->Email = $user ['Email'];
			$userLogin->UserId = $user ['UserId'];
			$userLogin->IsAdmin = $user ['IsAdmin'];
			$default->userLogin = $userLogin;
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * Check is login
	 * 
	 * @return bool
	 */
	public function isLogin() {
		$default = new Zend_Session_Namespace ( 'default' );
		if ($default->userLogin && $default->userLogin->IsAdmin == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 *
	 * @return bool
	 */
	public function logout() {
		$default = new Zend_Session_Namespace ( 'default' );
		// set null for user
		$default->userLogin = null;
		return true;
	}
}