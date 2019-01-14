<?php
/**
 * Created by PhpStorm.
 * User: 何泽
 * Date: 2019/1/5
 * Time: 22:08
 */

namespace app\cms\controller;

use app\common\model\AdminLog;
use think\facade\Session;
use think\Request;
use think\Validate;
use oauth\weibo\SaeToAuthV2;


class Oauth
{
    protected $Log;
    protected $weibo;
    protected $wb_akey = '3603563768';
    protected $wb_skey = '2db026b84f9f850558369fc885984a30';
    protected $callback_url = 'http://hippos.sharephotos.cn/cms/oauth/callback.html';
    protected $access_token = '';
    protected $page_limit;

    public function __construct()
    {
        $this->Log = new AdminLog();
        $this->weibo = new SaeToAuthV2($this->wb_akey, $this->wb_skey);
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }
    // 第三方登录列表
    public function index()
    {
        return view('index');
    }

    public function weibo_js_sdk()
    {
        return view('weibo_js_sdk');
    }

    // php 微博登录
    public function weibo ()
    {

        // 获取登录接口链接
        $url = $this->weibo->getAuthorizeURL($this->callback_url);
        // 判断是否已经登录
        $access_token = session::get('access_token');
        dump($access_token);
        if ($access_token){
            if (Session::get('token_info')){
                $token_info = Session::get('token_info');
            } else {
                $token_info = $this->weibo_get_token_info($access_token);
            }

            if (Session::get('user_info')){
                $user_info = Session::get('user_info');
            } else {
                $user_info = $this->weibo_get_user_info($access_token,array('uid'=>$token_info['uid']));
            }
        }
        $token_info = !empty($token_info) ? $token_info : '';
        $user_info = !empty($user_info) ? $user_info : '';
        $user_name = !empty($user_info) ? $user_info['screen_name'] : '';
        return view('weibo',[
            'url' => $url,
            'token_info' => $token_info,
            'user_info' => $user_info,
            'user_name' => $user_name,
        ]);
    }

    // 微博退出登录
    public function weibo_loginout ()
    {
        $access_token = Session::get('access_token');
        // 撤销授权
        $revoke = $this->weibo_get_revoke($access_token);
        Session::delete('token_info');
        Session::delete('user_info');
        Session::delete('access_token');

        return redirect('weibo');
    }

    // 微博回调地址
    public function callback()
    {
        $request = request();
        // 获取 code 用于第二步调用oauth2/access_token接口，获取授权后的access token
        $code = $request->get('code');

        if($code) {
            $token_url = 'https://api.weibo.com/oauth2/access_token';
            $data['client_id'] = $this->wb_akey;
            $data['client_secret'] = $this->wb_skey;
            $data['grant_type'] = 'authorization_code';
            $data['code'] = $code;
            $data['redirect_uri'] = $this->callback_url;
            $access_token = $this->weibo->post($token_url, $data);
            if(!empty($access_token['access_token'])){
                $this->access_token = $access_token['access_token'];
                Session::set('access_token',$this->access_token);
                dump($this->access_token);
            }else{
                $this->access_token = Session::get('access_token');
                dump($this->access_token);
            }
            return redirect('weibo');
        }
    }

    // 获取微博 token_info
    public function weibo_get_token_info($access_token)
    {
        if ($access_token){
            $url = 'https://api.weibo.com/oauth2/get_token_info';

            $data['access_token'] = $access_token;
            $token_info = $this->weibo->post($url, $data);
        }
        Session::set('token_info', $token_info);
        return $token_info ? $token_info : '获取错误';
    }

    // 获取登录微博详细信息
    public function weibo_get_user_info($access_token,$data)
    {
        if ($access_token){
            $url = 'https://api.weibo.com/2/users/show.json';
            $data['access_token'] = $access_token;

            $user_info = $this->weibo->get($url, $data);
        }
        Session::set('user_info', $user_info);
        return $user_info ? $user_info : '获取错误';
    }

    // 撤销微博授权
    public function weibo_get_revoke($access_token)
    {
        if ($access_token){
            $url = 'https://api.weibo.com/oauth2/revokeoauth2';
            $data['access_token'] = $access_token;

            $revoke = $this->weibo->get($url, $data);
        }
        return !empty($revoke) ? $revoke : '撤销错误';
    }
}