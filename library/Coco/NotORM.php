<?php

/**
 * Class NotORM, Overide to show
 * @author NguyenVanTien
 * Change some function
 */
include_once __DIR__ . '/../NotORM/NotORM.php';
include_once __DIR__ . '/../NotORM/ParentStructure.php';

class Coco_NotORM
{

    public $connection;

    public static function getInstance()
    {
        return self::init();
    }

    public static function pdo()
    {
        $dbParams = self::_getConfigDb();
        //connection database
        $connection = new PDO("mysql:host=" . $dbParams->host . ";dbname=" . $dbParams->dbname,
            $dbParams->username, $dbParams->password,
            array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
        return $connection;

    }

    public static function objEmpty($tableName)
    {
        $arr = null;
        $columns = Coco_NotORM::pdo()->query('SHOW COLUMNS FROM ' . $tableName)->fetchAll();
        if ($columns) {
            foreach ($columns as $col) {
                if ($col['Default']) {
                    $arr[$col['Field']] = $col['Default'];
                } else {
                    $arr[$col['Field']] = null;
                }
            }
        }
        return $arr;
    }

    public static function mergeData($tableName, $data)
    {
        $arr = null;
        $columns = Coco_NotORM::pdo()->query('SHOW COLUMNS FROM ' . $tableName)->fetchAll();
        if ($columns) {
            foreach ($columns as $col) {
                if (!isset($data[$col['Field']])) {
                    if ($col['Default'])
                        $arr[$col['Field']] = $col['Default'];
                    else{
                        unset($arr[$col['Field']]);
                    }
                } else {
                    $arr[$col['Field']] = $data[$col['Field']];
                }
            }
        }
        return $arr;
    }

    /**
     * Set init ORM
     * @author tien.nguyen
     * @return NotORM
     */
    public static function init()
    {
        if (!Zend_Registry::isRegistered('dbNotOrm')) {
            $connection = Coco_NotORM::pdo();
            $dbParams = self::_getConfigDb();

            //new instance NotORM
            $dbNotOrm = new NotORM($connection, self::_structure());
//            $dbNotOrm->debug =  false;
            $dbNotOrm->debug =  DEBUG_NOT_ORM;

            //set Zend_Registry
            Zend_Registry::set('dbNotOrm', $dbNotOrm);
        }
        return Zend_Registry::get('dbNotOrm');
    }

    /**
     * Get system database for application ini
     *
     * @author tien.nguyen
     * @see Zend_Config_Ini
     * @return Zend_Config - array from params of databas of system
     */
    private function _getConfigDb()
    {
        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/application.ini', APPLICATION_ENV);
        return $config->resources->db->params;
    }

    /**
     * define structure for table in NotORM
     *
     * @author tien.nguyen
     * @return NotORM_Structure_Convention
     * @see NotORM_Structure_Convention
     * @since 2012
     */
    private function _structure()
    {
        $structure = new ParentStructure(
            $primary = "%sId", // $table_id
            $foreign = "%sId", // $table_id
            $table = "%ss", // {$table}s
            $prefix = "" // $table
        );
        return $structure;
    }

}

?>
