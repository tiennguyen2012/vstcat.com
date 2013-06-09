<?php
require_once APPLICATION_PATH.'/modules/default/forms/FormSignIn.php';

class Default_Form_FormSignInTest extends PHPUnit_Framework_TestCase {
	
	protected $_form;

	/**
	 * Setup test
	 * @author tien.nguyen
	 * @see PHPUnit_Framework_TestCase::setUp()
	 */
	protected function setUp(){
		$this->_form = new Default_Form_FormSignIn();
		parent::setUp();
	}
	
	/**
	 * Tear down for form testing
	 * @author tien.nguyen
	 * @see PHPUnit_Framework_TestCase::tearDown()
	 */
	protected function tearDown(){
		parent::tearDown();
		$this->_form = null;
	}
	
	/**
	 * Demo good data
	 * @author tien.nguyen
	 * @return array
	 */
	public function getGoodData(){
		return array(
				array('Username' => 'admin', 'Password' => 'tinhanh')
		);
	}
	
	/**
	 * Demo bad data for test form faild
	 * @author tien.nguyen
	 * @return multitype:multitype:string
	 */
	public function getBadData(){
		return array(
				array('Username' =>  '', 'Password' => ''),
				array('Username' => '', 'Password' => '1234'),
				array('Username'  => 'tien.nguyen', 'Password' =>  '')
		);
	}
	
	/**
	 * Test data accept data
	 * @author tien.nguyen
	 */
	public function testFormAcceptsValidData(){
		$datas = $this->getGoodData();
		foreach($datas as $data){
			$this->assertTrue($this->_form->isValid($data));
		}
	}
	
	/**
	 * Test reject data for form
	 * @author tien.nguyen
	 */
	public function testFormRejectBadData(){
		$datas = $this->getBadData();
		foreach($datas as $data){
			$this->assertFalse($this->_form->isValid($data));
		}
	}
}