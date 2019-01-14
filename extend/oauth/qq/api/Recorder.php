<?php
/* PHP SDK
 * @version 2.0.0
 * @author connect@qq.com
 * @copyright © 2013, Tencent Corporation. All rights reserved.
 */

namespace oauth\qq\api;

use oauth\qq\api\ErrorCase;
use think\facade\Session;

class Recorder{
    private static $data;
    private static $datas = array();
    private $inc;
    private $error;
	

    public function __construct(){
		
        $this->error = new ErrorCase();

        //-------读取配置文件
        $incFileContents = file(dirname(dirname(__FILE__))."/comm/inc.php");

        $incFileContents = $incFileContents[1];
        $this->inc = json_decode($incFileContents);

        if(empty($this->inc)){
            $this->error->showError("20001");
        }

        if(empty($_SESSION['QC_userData'])){
            self::$data = array();
        }else{
            self::$data = $_SESSION['QC_userData'];
        }
    }

    public function write($name,$value){
		$_SESSION['QC_userData'][$name] = $value;
    }
	
    public function read($name){
        if(empty($_SESSION['QC_userData'][$name])){
            return null;
        }else{
            return $_SESSION['QC_userData'][$name];
        }
    }

    public function readInc($name){
        if(empty($this->inc->$name)){
            return null;
        }else{
            return $this->inc->$name;
        }
    }

    public function delete($name){
        unset($_SESSION['QC_userData'][$name]);
    }
	
	
    // function __destruct(){
        // $_SESSION['QC_userData'] = self::$data;
    // }
}
