<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/8/13
 * Time: 12:26 PM
 * To change this template use File | Settings | File Templates.
 */
class TemplateController extends Coco_Controller_Action_Default
{

    /**
     * @var Default_Model_Template
     */
    private $_model;

    public function init()
    {
        parent::init();
        $this->_model = new Default_Model_Template();
    }

    public function indexAction()
    {
        $templates = $this->_model->getTemplates($this->_getAllParams());

        $paginator = Zend_Paginator::factory($templates);
        $paginator->setItemCountPerPage(PAGINATION_TEMPLATE);
        $paginator->setDefaultPageRange(5);
        $paginator->setCurrentPageNumber($this->_getParam("page", 1));

        $this->view->templates = $paginator;
    }

    public function detailAction()
    {
        $id = $this->_getParam('id');

        $lMember = new Vts_Member();
        $lTemplate = new Vts_Template();
        $modelWebsite = new Default_Model_Website();

        $this->view->isMember = $lMember->isMember();
        $this->view->template = $this->_model->detail($id);
        $this->view->photos = $lTemplate->photos($id, true);
        $this->view->websites = $modelWebsite->getSiteByLogin();
    }

    public function downloadAction()
    {
        $itemId = $this->_getParam('item-id');
        $orderId = $this->_getParam('order-id');
        $itemType = $this->_getParam('item-type');
        if ($itemId && $orderId && $itemType) {
            $template = Coco_NotORM::getInstance()->Templates[$itemId];
            if ($template) {
                $lOrder = new Vts_Order();
                if ($lOrder->checkOrderItemPurchase($orderId, $itemId, $itemType)) {
                    header('Content-Description: File Transfer');
                    header('Content-Type: application/octet-stream');
                    header('Content-Disposition: attachment; filename="' . basename(BASE_URL . '/uploads/templates-zip/' . $template['TemplateCode'] . '.zip') . '"');
                    header('Content-Transfer-Encoding: binary');
                    header('Connection: Keep-Alive');
                    header('Expires: 0');
                    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
                    header('Pragma: public');
                    header('Content-Length: ' . filesize(BASE_URL . '/uploads/templates-zip/' . $template['TemplateCode'] . '.zip'));
                }
            }
        } else {
            throw new Zend_Exception('Template not found.');
        }
        die;
    }
}