<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/12/13
 * Time: 5:24 PM
 * To change this template use File | Settings | File Templates.
 */
class Coco_Controller_Action_Admin extends Coco_Controller_Action_Abstract {
	
	/**
	 * Array no check when you login
	 * @author tien.nguyen
	 * @var array
	 */
	private $_noCheckLogin;
	
	/**
	 * Function init for controller
	 * @author tien.nguyen
	 * @see Coco_Controller_Action_Abstract::init()
	 */
    public function init(){
        parent::init();
        $this->view->layout()->setLayoutPath(APPLICATION_PATH.'/layouts/scripts/admin');
        $this->view->layout()->setLayout('layout');
        
        // check login
        $this->checkLogin();
    }
    
    /**
     * Get router for some controller and action no need login
     * @author tien.nguyen
     * @return array
     */
    private function _getRoutNoLogin(){
    	$res = array();
    	$res[] = array('controller' => 'user', 'action' => 'login');
    	$this->_noCheckLogin = $res;
    }
    
    /**
     * Check some controller and action 
     * @param string $controller
     * @param string $action
     * @return boolean
     */
    private function _isNoCheckLogin($controller, $action = null){
    	$this->_getRoutNoLogin();
    	foreach ($this->_noCheckLogin as $item){
    		$flag = false;
    		if(!empty($item['controller']) && !empty($item['action']) ){
    			if($controller == $item['controller'] && 
    				$action == $item['action']){
    				return TRUE;
    			}
    		}elseif(!empty($item['controller'])){
    			if($item['controller'] == $controller){
    				return TRUE;
    			}
    		}
    	}
    	return FALSE;
    }
    
    /**
     * function check login. Check controller and action "no check login"
     * Get session login. If session is existed return true else return false
     * if no login redirect to login.
     * @author tien.nguyen
     */
    public function checkLogin(){

    	$controller = $this->_request->getControllerName();
    	$action = $this->_request->getActionName();

    	$resNoCheck = $this->_isNoCheckLogin($controller, $action);
    	if(!$resNoCheck){
    		$modelUser = new Admin_Model_User();
    		if(!$modelUser->isLogin())
    			$this->_redirect($this->view->url(array('controller' => 'user', 'action' => 'login')));
    	}
    }
}