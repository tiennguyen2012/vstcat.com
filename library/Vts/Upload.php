<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/31/13
 * Time: 9:26 PM
 * To change this template use File | Settings | File Templates.
 */
require_once APPLICATION_PATH.'/../public/jquery-upload/server/php/UploadHandler.php';
class Vts_Upload {

    private $_options;

    public function __construct($options = array()){
        $this->_options = $options;
    }

    /**
     * Will upload image for product, news, template..
     * @param $type - template, module...
     */
    public function upload($type, $obj = null, $subPath = null){
        $pathUpload = $_SERVER['DOCUMENT_ROOT'].'/uploads';
        if($type){
            $pathUpload .= '/'.$type;
            if($subPath){
                $pathUpload .= '/'.$subPath;
            }
        }
        $options = array('upload_dir' => $pathUpload.'/');
        $upload_handler = new UploadHandler($options);
    }
}