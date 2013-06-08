<?php

class Vts_Api {
    /**
     * Some constant to define for api
     */
    const CREATE = 'create';
    const REMOVE = 'remove';
    const INSTALL_THEME = 'install-theme';

    /**
     * Get api url
     * @param unknown $actionName
     * @param unknown $params
     * @return string
     */
    public function getApi($actionName, $params = array()) {
        $url = API_URL . '/api/' . $actionName . '/user/' . API_USER . '/pass/' . API_PASS;
        if($params){
            foreach ($params as $k => $v){
            	$url .= '/'.$k.'/'.$v;
            }
        }
        return $url;
    }

    /**
     * Make website by url
     * @author TienNguyen <nguyenvantien2009@gmail.com>
     * @return boolean make website success
     * @param string $oldDomain Domain from sample
     * @param string $newDomain Domain to setup new site
     */
    public function make($oldDomain, $newDomain) {
        $content = file_get_contents($this->getApi(self::CREATE, 
        		array('olddomain' => $oldDomain, 'domain' => $newDomain, 
        				'fw' => FW_WORDPRESS)));
        if($content){
            $json = json_decode($content);
            if($json->result){
                return TRUE;
            }
        }
        return FALSE;
    }
    
    /**
     * Remove website framewrok
     * @author tien.nguyen
     * @param string $domain
     * @return boolean
     */
    public function remove($domain){
        $content = file_get_contents($this->getApi(self::REMOVE,
        		array('olddomain' => $domain, 'fw' => FW_WORDPRESS)));
        if($content){
        	$json = json_decode($content);
        	if($json->result){
        		return TRUE;
        	}
        }
        return FALSE;
    }
    
    /**
     * Install new theme for website is existed. 
     * We call API to install theme.
     * @author tien.nguyen
     * @param string $oldDomain
     * @param string $newDomain
     * @return boolean
     */
    public function installTheme($oldDomain, $newDomain){
    	$content = file_get_contents($this->getApi(self::INSTALL_THEME,
    			array('old-domain' => $oldDomain, 'new-domain' => $newDomain)));
    	if($content){
    		$json = json_decode($content);
    		if($json->result){
    			return TRUE;
    		}
    	}
    	return FALSE;
    }

}