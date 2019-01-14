<?php
/* PHP SDK
 * @version 2.0.0
 * @author connect@qq.com
 * @copyright © 2013, Tencent Corporation. All rights reserved.
 */

namespace oauth\qq\api;

use oauth\qq\api\Recorder;
use oauth\qq\api\ErrorCase;
use oauth\qq\api\URL;
use think\facade\Session;

class Oauth{
    const VERSION = "2.0";
    const GET_AUTH_CODE_URL = "https://graph.qq.com/oauth2.0/authorize";
    const GET_ACCESS_TOKEN_URL = "https://graph.qq.com/oauth2.0/token";
    const GET_OPENID_URL = "https://graph.qq.com/oauth2.0/me";
    const GET_USERINFO_URL = "https://graph.qq.com/user/get_user_info";

    protected $recorder;
    public $urlUtils;
    protected $error;
    

    function __construct(){
        $this->recorder = new Recorder();
        $this->urlUtils = new URL();
        $this->error = new ErrorCase();
    }

    public function qq_login(){
        $appid = $this->recorder->readInc("appid");
        $callback = $this->recorder->readInc("callback");
        $scope = $this->recorder->readInc("scope");

        //-------生成唯一随机串防CSRF攻击
        $state = md5(uniqid(rand(), TRUE));
        $this->recorder->write('state',$state);
		Session::set('state',$state,'QC_userData');
        //-------构造请求参数列表
        $keysArr = array(
            "response_type" => "code",
            "client_id" => $appid,
            "redirect_uri" => $callback,
            "state" => $state,
            "scope" => $scope
        );

        $login_url =  $this->urlUtils->combineURL(self::GET_AUTH_CODE_URL, $keysArr);

        header("Location:$login_url");
    }
	// 获取access_token
	public function qq_callback($code){
		$state = $this->recorder->read("state");
		
        //--------验证state防止CSRF攻击
        if(!$state || $_GET['state'] != $state){
            $this->error->showError("30001");
        }
		
		if($code){
			$appid = $this->recorder->readInc("appid");
			$appkey = $this->recorder->readInc("appkey");
			$callback = $this->recorder->readInc("callback");
			$scope = $this->recorder->readInc("scope");
			
			//-------构造请求参数列表
			$keysArr = array(
				"grant_type" => "authorization_code",
				"client_id" => $appid,
				"client_secret" => $appkey,
				"code" => $code,
				"redirect_uri" => $callback
			);
			//------构造请求access_token的url
			$token_url = $this->urlUtils->combineURL(self::GET_ACCESS_TOKEN_URL, $keysArr);
			$response = $this->urlUtils->get_contents($token_url);
			
			if(strpos($response, "callback") !== false){

				$lpos = strpos($response, "(");
				$rpos = strrpos($response, ")");
				$response  = substr($response, $lpos + 1, $rpos - $lpos -1);
				$msg = json_decode($response);

				if(isset($msg->error)){
					$this->error->showError($msg->error, $msg->error_description);
				}
			}

			$params = array();
			parse_str($response, $params);
			$this->recorder->write("qq_access_token", $params["access_token"]);
			$access_token = $this->recorder->read("qq_access_token");
			return $access_token;
		}
		
	}
	
    public function get_openid(){

        //-------请求参数列表
        $keysArr = array(
            "access_token" => $this->recorder->read("qq_access_token")
        );

        $graph_url = $this->urlUtils->combineURL(self::GET_OPENID_URL, $keysArr);
        $response = $this->urlUtils->get_contents($graph_url);

        //--------检测错误是否发生
        if(strpos($response, "callback") !== false){

            $lpos = strpos($response, "(");
            $rpos = strrpos($response, ")");
            $response = substr($response, $lpos + 1, $rpos - $lpos -1);
        }

        $user = json_decode($response);
        if(isset($user->error)){
            $this->error->showError($user->error, $user->error_description);
        }

        //------记录openid
        $this->recorder->write("openid", $user->openid);
        return $user->openid;

    }
	
	public function get_userinfo(){
        //-------请求参数列表
		$access_token = $this->recorder->read("qq_access_token") ? $this->recorder->read("qq_access_token") : Session::get('qq_access_token','QC_userData');
		$openid = $this->recorder->read("openid") ? $this->recorder->read("openid") : Session::get('openid','QC_userData');
        
		$keysArr = array(
            "access_token" => $access_token,
            "oauth_consumer_key" => $this->recorder->readInc("appid"),
            "openid" => $openid,
        );

        $graph_url = $this->urlUtils->combineURL(self::GET_USERINFO_URL, $keysArr);
        $response = $this->urlUtils->get_contents($graph_url);
		return $response;
        //--------检测错误是否发生
       /*  if(strpos($response, "callback") !== false){

            $lpos = strpos($response, "(");
            $rpos = strrpos($response, ")");
            $response = substr($response, $lpos + 1, $rpos - $lpos -1);
        }

        $user = json_decode($response);
		return $user;
        if(isset($user->error)){
            $this->error->showError($user->error, $user->error_description);
        }

        //------记录openid
        $this->recorder->write("openid", $user->openid);
        return $user->openid; */
    }
}
