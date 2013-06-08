<?php
class Admin_UserController extends Coco_Controller_Action_Admin {
	
	public function init(){
		parent::init();
		
		$this->_helper->layout->disableLayout();
	}
	
	/**
	 * Action to user login. User login need is admin
	 * @author tien.nguyen
	 */
	public function loginAction(){
		$form = new Admin_Form_FormLogin();
		
		if($this->_request->isPost()){
			$data = $this->_request->getPost();
			if($form->isValid($data)){
				$modelUser = new Admin_Model_User();
				if($modelUser->login($data['Username'], $data['Password'])){
					$this->_redirect($this->view->url(array('module' => 'admin', 'controller' => 'index', 
							'action' => 'index'), null, true));
				}
			}
		}
		
		$this->view->form = $form;
	}
}