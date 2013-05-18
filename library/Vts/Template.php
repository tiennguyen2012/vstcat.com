<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tien
 * Date: 3/21/13
 * Time: 10:42 PM
 * To change this template use File | Settings | File Templates.
 */
class Vts_Template
{

    /**
     * Get price for template
     *
     * @param $template object template get database by Coco_NotORM
     * @param $type string type of template
     * @param $memberType - In array ('DOWNLOAD', 'INSITE')
     * @param $priceType - Type of price
     * @author tien.nguyen
     * @return float
     */
    public function getPrice($template, $itemType, $priceType, $memberType)
    {
        $price = 0;
        if ($template) {
            switch (strtoupper($itemType)) {
                //Get price for member registry and by template
                case 'NEW_AND_TEMPLATE':
                {
                    //With member download website
                    if (strtoupper($memberType) == 'DOWNLOAD') {
                        switch (strtoupper($priceType)) {
                            case 'NORMAL':
                                $price = 20 * 12 + floatval($template['NormalPrice']);
                                break;
                            case 'UNIQUE':
                                $price = 20 * 12 + floatval($template['UniqueCurrentPrice']);
                                break;
                        }
                    } //With member setup in hosting of me.
                    elseif (strtoupper($memberType) == 'INSITE') {
                        switch (strtoupper($priceType)) {
                            case 'NORMAL':
                                $price = 20 + floatval($template['NormalPrice']);
                                break;
                            case 'UNIQUE':
                                $price = 20 + floatval($template['UniqueCurrentPrice']);
                                break;
                        }
                    }
                    break;
                }
                //Only buy template
                case 'TEMPLATE':
                {
                    switch (strtoupper($priceType)) {
                        case 'NORMAL':
                            $price = floatval($template['NormalPrice']);
                            break;
                        case 'UNIQUE':
                            $price = floatval($template['UniqueCurrentPrice']);
                            break;
                    }
                    break;
                }
            }
        }

        return $price;
    }

    /**
     * Upload image for template
     * @param $templateId
     * @param bool $isThumb
     * @return array
     */
    public function photos($templateId, $isThumb = true)
    {
        $result = array();
        $path = APPLICATION_PATH . '/../public/uploads/templates/' . $templateId . '/';
        if ($isThumb) {
            $path .= 'thumbnail/';
        }
        if (is_dir($path)) {
            if ($handle = opendir($path)) {
                while (false !== ($entry = readdir($handle))) {
                    if (!in_array($entry, array('.', '..', '.svn'))) {
                        $result[] = $entry;
                    }
                }
                closedir($handle);
            }
        }

        return $result;
    }
}