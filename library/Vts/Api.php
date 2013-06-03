<?php

class Vts_Api {
    /**
     * Some constant to define for api
     */

    const CREATE = 'create';

    public function getApi($actionName, $params = array()) {
        $url = API_URL . '/api/' . $actionName . '/user/' . API_USER . '/pass/' . API_PASS;
        if($params){
            $string = implode("/", $params);
        }
    }

    /**
     * Make website by url
     * @author TienNguyen <nguyenvantien2009@gmail.com>
     * @return boolean make website success
     * @param string $oldDomain Domain from sample
     * @param string $newDomain Domain to setup new site
     */
    public function make($oldDomain, $newDomain) {
        $content = file_get_contents($this->getApi(self::CREATE));
        if($content){
            $json = json_decode($content);
            if($json->result){
                return TRUE;
            }
        }
        return FALSE;
    }
    
    public function remove(){
        
    }

}