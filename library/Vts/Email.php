<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/10/13
 * Time: 10:18 PM
 * To change this template use File | Settings | File Templates.
 */
class Vts_Email {
	
	/**
	 * Send email by template
	 * @param unknown $subject
	 * @param unknown $template
	 * @param unknown $params
	 * @param unknown $from
	 * @param unknown $to
	 * @param unknown $cc
	 * @return unknown
	 */
	public function sendEmail($subject, $template, $params = array(), 
			$from = array(), $to = array(), $cc = array()){
		//get html
		$view = Zend_Controller_Front::getInstance()->getParam('bootstrap')->getResource('view');
		$view = new Zend_View();
		$view->setBasePath(APPLICATION_PATH.'/views/scripts/_emails');
		$view->setHelperPath(APPLICATION_PATH.'/views/helpers');
		
		foreach ($params as $k => $v){
			$view->{$k} = $v;
		}
		
		$html = $view->render("header.phtml");
		$html .= $view->render($template);
		$html .= $view->render("footer.phtml");
		
		$res = @$this->send($subject, $html, $from, $to, $cc);
		return $res;
	}

    public function send($subject, $html, $from = array(), $to = array(), $cc = array()){
        $config = array('ssl' => EMAIL_SSL, 'port' => EMAIL_PORT, 'auth' => EMAIL_AUTH,
            'username' => EMAIL_USER, 'password' => EMAIL_PASSWORD);

        $tr = new Zend_Mail_Transport_Smtp(EMAIL_SERVER, $config);
        Zend_Mail::setDefaultTransport($tr);

        $mail = new Zend_Mail('utf-8');
        $mail->setBodyHtml($html);
        $mail->setFrom( $from['email'], $from['name'] );
        $mail->addTo($to['email'], $to['name']);
        //add cc email
        if($cc){
            foreach($cc as $item){
                $mail->addCc($item['email'], $item['name']);
            }
        }
        $mail->setSubject($subject);
        try{
            if(!@$mail->send()){
                throw new Zend_Exception('Error send email. Please check config email.');
            }
        }catch (exception $e){
            throw new Zend_Exception('Error send email. Please check config email.');
        }

        return true;
    }
}