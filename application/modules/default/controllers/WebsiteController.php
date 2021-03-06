<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/9/13
 * Time: 12:48 PM
 * To change this template use File | Settings | File Templates.
 */
class WebsiteController extends Coco_Controller_Action_Default {

	/**
	 * Show list website of user login.
	 * Get user login from session. This action required you login.
	 * @author tien.nguyen
	 */
	public function indexAction(){
		$this->checkLogin();
		
		// get list website by user login
		$modelWebsite = new Default_Model_Website();
		$websites = $modelWebsite->getSiteByLogin();
		
		$this->view->websites = $websites;
	}
	
    public function createAction(){
        $form = new Default_Form_FormDomain();
        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            if($form->isValid($data)){
                $default = new Zend_Session_Namespace('default');
                $data['UserId'] = $default->userLogin->UserId;
                $res = Coco_NotORM::getInstance()->Websites()->insert($data);
                if($res){
                    $default = new Zend_Session_Namespace('default');
                    $default->userLogin->CurrentWebsiteId = $res['WebsiteId'];
                    $default->userLogin->CurrentDomain = $res['Domain'];
                    $this->_redirect(!empty($this->href) ? $this->href.'/result/success' : '/website/create-success');
                }
            }

            $form->populate($data);
        }

        $this->view->form = $form;
    }
    
    /**
     * Action generate website
     * If order payment have 
     * - TotalPrice = 0 and Domain not exist in Website table
     * => Generate website.
     * and return warning page. Not waiting generate finished
     * @author tien.nguyen
     */
    public function generateWebsiteAction(){
    	$this->_helper->viewRenderer->setNoRender(true);
    	$this->_helper->layout->disableLayout();
    	
    	$orderId = $this->_getParam('order-id');
    	
    	/** Check website exist **/
    	$modelWebsite = new Default_Model_Website();
    	if($modelWebsite->isExistDomainByOrderId($orderId)){
    		echo json_encode(array('result' => false, 'message' => 'Your domain is existed. System can not build. Please contact with administrator.'));
    	}else{
    		if($orderId){
    			$modelOrder = new Default_Model_Order();
    			$order = $modelOrder->getOrder($orderId);
    			/** Generate website **/
    			$modelWebsite = new Default_Model_Website();
    			$res = $modelWebsite->generate($order);
    			if($res){
    				echo json_encode(array('result' => true, 'message' => 'Built website success.'));
    			}else{
    				echo json_encode(array('result' => false, 'message' => 'Generate not good.'));
    			}
    		}else{
    			//throw new Zend_Exception('You do not have order id');
    			echo json_encode(array('result' => false, 'message' => 'Not order id'));
    		}
    	}
    }

    /**
     * Domain for website
     */
    public function domainAction(){
        $form = new Default_Form_FormDomain();
        $formSubDomain = new Default_Form_FormSubDomain();

        if($this->_request->isPost()){
            $data = $this->_request->getPost();

            if(empty($data['UseSubDomain'])){
                if($form->isValid($data)){
                    $this->_redirect($this->view->url(array('controller' => 'order', 'action' => 'set-domain', 'domain' => $data['Domain']), null, true));
                }
                $form->populate($data);
            }else{
                if($formSubDomain->isValid($data)){
                    $this->_redirect($this->view->url(array('controller' => 'order', 'action' => 'set-domain', 'domain' => $data['SubDomain'].".vtscat.com"), null, true));
                }
                $formSubDomain->populate($data);
            }
            $this->view->UseSubDomain = $data['UseSubDomain'];
        }

        $this->view->form = $form;
        $this->view->formSubDomain = $formSubDomain;
    }
    
    /**
     * Action choose site when you want chose domain to setup.
     * This is function user for ajax. show in modal of twitter bootstrap.
     * @author tien.nguyen
     */
    public function chooseSiteAction(){
    	//no render template and layout.
    	$this->_helper->layout->disableLayout();
    	
    	$modelWebsite = new Default_Model_Website();
    	
    	$this->view->websites = $modelWebsite->getSiteByLogin();
    }
    
    /**
     * Install theme for site is existed.
     * Use when customer want to install new theme for his/her website.
     * Params need:
     * - order-id
     * @author tien.nguyen
     */
    public function installThemeByOrderIdAction(){
    	$orderId = $this->_getParam('order-id');
    	if(empty($orderId)){
    		throw new Zend_Exception('Order Id is empty.');
    	}
    	
    	$modelOrder = new Default_Model_Order();
    	$sampleDomain = $oldDomain = $modelOrder->getSampleDomainByOrderId($orderId);
    	$siteDomain = $newDomain = $modelOrder->getDomainByOrderId($orderId);
    	
    	// old domain and new domain
    	if($oldDomain && $newDomain){
    		$vtsApi = new Vts_Api();
    		$res = $vtsApi->installTheme($oldDomain, $newDomain);
    		if($res){
    			$url = $this->view->url(array('controller' => 'website', 'action' => 'install-theme-success'));
    			$this->_redirect($url);
    		}else{
    			throw new Zend_Exception('Have some error when install theme. Please contact with administrtor.');	
    		}
    	}else{
    		throw new Zend_Exception('Old Domain and New Domain are empty.');
    	}
    }
    
    /**
     * Action when system install new theme is success
     * This is static page
     * @author tien.nguyen
     */
    public function installThemeSuccessAction(){
    	$orderId = $this->_getParam('order-id');
    	if($orderId){
    		$modelOrder = new Default_Model_Order();
    		$domain = $modelOrder->getDomainByOrderId($orderId);
    		
    		$this->view->domain = $domain;
    	}
    }
    
    /**
     * This is action build website success
     * Be used when order total price is 0, and customer click build website
     * @author tien.nguyen
     */
    public function buildSuccessAction(){
    	
    }

    /**
     * After customer paid his order. The system generate website and send email
     * to customer to notify for customer about this processing.
     * @author tien.nguyen
     */
    public function createSuccessAction(){
		
    }
}