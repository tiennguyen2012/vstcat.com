<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 5/26/13
 * Time: 6:07 PM
 * To change this template use File | Settings | File Templates.
 */
class Default_Model_Website {
	const SITE_TYPE_INSITE = 'INSITE';
	
	/**
	 * Generate website by order id
	 * @param int $orderId
	 * @return boolean
	 * @author tien.nguyen
	 */
	public function generate($orderId){
		$modelOrder = new Default_Model_Order();
		$sampleDomain = $modelOrder->getSampleDomainByOrderId($orderId);
		$domain = $modelOrder->getDomainByOrderId($orderId);
		
		if($sampleDomain && $domain){
			/** Generate website from api **/
			$vtsApi = new Vts_Api();
			$resultMake = $vtsApi->make($sampleDomain, $domain);
			
			/**
			 * save new domain to website
			 */
			$resultSaveWebsite = $this->saveWebsite($domain, $orderId);
			
			if($resultSaveWebsite && $resultMake){
				$this->sendEmailReportSuccess($orderId);
				return true;
			}
		}else{
			throw new Zend_Exception("Need sample domain and new domain.");
		}
		return FALSE;
	}
	
	/**
	 * Send email report success 
	 * @author tien nguyen
	 */
	public function sendEmailReportSuccess($orderId){
		$order = Coco_NotORM::getInstance()->Orders[array('OrderId' => $orderId)];
		if($order){
			$modelOrder = new Default_Model_Order();
			$domain = $modelOrder->getDomainByOrderId($orderId);
		
			$user = Coco_NotORM::getInstance()->Users[$order['UserId']];
			$lEmail = new Vts_Email();
			
			$view = Zend_Controller_Front::getInstance()->getParam('bootstrap')->getResource('view');
			$view = new Zend_View();
			$view->setBasePath(APPLICATION_PATH.'/../library/Vts/Website/View');
			$view->setHelperPath(APPLICATION_PATH.'/views/helpers');
			$view->order = $order;
			$view->user = $user;
			$view->domain = $domain;
			
			$html = $view->render('generate-website-email.phtml');
			$res = @$lEmail->send('VTSCat'. ' Generate Website for Order '.$order['OrderId'], $html,
					array('name' => EMAIL_NAME, 'email' => EMAIL_USER),
					array('name' => $user['Fullname'], 'email' => $user['Email'])
			);
		}
	}
	
	/**
	 * Save website with new domain
	 * @param string $domain
	 * @param int $orderId
	 * @throws Zend_Exception
	 * @return boolean
	 */
	public function saveWebsite($domain, $orderId){
		$data = array();
		$order = Coco_NotORM::getInstance()->Orders[array('OrderId' => $orderId)];
		if($order){
			$data['UserId'] = $order['UserId'];
			$data['Domain'] = $domain;
			$data['WebsiteType'] = self::SITE_TYPE_INSITE; //set default when have new function we will change.
			$data['WebsiteName'] = $domain;
			
			/** Save website to table website **/
			//check exist 
			$existWebsite = Coco_NotORM::getInstance()->Websites[array('Domain' => $domain)];
			if(!$existWebsite){
				$result = Coco_NotORM::getInstance()->Websites()->insert($data);
				if($result) return true;
			}else{
				throw new Zend_Exception('Domain '.$domain.' is exist.');
			}
		}
		return false;
	}
}