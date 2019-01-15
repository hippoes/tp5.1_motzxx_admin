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
use oauth\qq\QqConnectAPI;
use oauth\qq\api\Recorder;


class Oauth
{
    protected $Log;

    protected $weibo;
    protected $wb_akey = '3603563768';
    protected $wb_skey = '2db026b84f9f850558369fc885984a30';
    protected $wb_callback_url = 'http://hippos.sharephotos.cn/cms/oauth/callback.html';
    protected $wb_access_token = '';

    protected $Recorder;
    protected $qq;
    protected $qq_aID = '101539047';
    protected $qq_aKEY = '2b27382035fc3d2d9915d2a435df0e6a';
    protected $qq_callback_url = 'http://hippos.sharephotos.cn/cms/oauth/qqcallback.html';

    protected $page_limit;

    public function __construct()
    {
        $this->Log = new AdminLog();
        $this->Recorder = new Recorder();

        $this->weibo = new SaeToAuthV2($this->wb_akey, $this->wb_skey);
        $this->qq = new QqConnectAPI();

        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }
    // 第三方登录列表
    public function index()
    {
        return view('index');
    }

    public function qq()
    {
        return view('qq');
    }

    public function qq_login()
    {
        $this->qq->qq_login();
    }

    public function qqcallback()
    {
        $request = request();
        $code = $request->get('code');
        if (!empty($code)) {
            $qq_access_token = Session::get('qq_access_token','QC_userData');
            if (empty($qq_access_token)){
                $qq_access_token = $this->qq->qq_callback($code);
            }
        }
        if ($qq_access_token) {
            $openid = $this->qq->get_openid();
        }
        if ($openid) {
            $userinfo = $this->qq->get_userinfo();
            $userinfo = json_decode($userinfo, true);
        }
        // $session = Session::get('','QC_userData');
        // dump($session);
        // dump($openid);
        // dump($userinfo);
        return view('qq',[
            'nickname'=>$userinfo['nickname'],
            'userinfo'=>$userinfo,
        ]);
    }

    public function qq_loginout()
    {
        $session = Session::get('','QC_userData');

        Session::has('openid','QC_userData') ? Session::delete('openid','QC_userData') : '';
        Session::has('qq_access_token','QC_userData') ? Session::delete('qq_access_token','QC_userData') : '';
        Session::has('state','QC_userData') ? Session::delete('state','QC_userData') : '';


        return redirect('qq');
    }








    // 微博 JS_SDK
    public function weibo_js_sdk()
    {
        return view('weibo_js_sdk');
    }

    // php 微博登录
    public function weibo ()
    {
        // 获取登录接口链接
        $url = $this->weibo->getAuthorizeURL($this->wb_callback_url);
        // 判断是否已经登录
        $wb_access_token = session::get('wb_access_token');
        // dump(date('Y-m-d H:i:s',time()));
        if ($wb_access_token){
            if (Session::get('token_info')){
                $token_info = Session::get('token_info');
            } else {
                $token_info = $this->weibo_get_token_info($wb_access_token);
            }

            if (Session::get('user_info')){
                $user_info = Session::get('user_info');
            } else {
                $user_info = $this->weibo_get_user_info($wb_access_token,array('uid'=>$token_info['uid']));
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
        $wb_access_token = Session::get('wb_access_token');
        // 撤销授权
        $revoke = $this->weibo_get_revoke($wb_access_token);
        Session::delete('token_info');
        Session::delete('user_info');
        Session::delete('wb_access_token');

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
            $data['redirect_uri'] = $this->wb_callback_url;
            $wb_access_token = $this->weibo->post($token_url, $data);

            if(!empty($wb_access_token['access_token'])){
                $this->wb_access_token = $wb_access_token['access_token'];
                Session::set('wb_access_token',$this->wb_access_token);
                dump($this->wb_access_token);
            }else{
                $this->wb_access_token = Session::get('wb_access_token');
                dump($this->wb_access_token);
            }
            return redirect('weibo');
        }
    }

    // 获取微博 token_info
    public function weibo_get_token_info($wb_access_token)
    {
        if ($wb_access_token){
            $url = 'https://api.weibo.com/oauth2/get_token_info';

            $data['access_token'] = $wb_access_token;
            $token_info = $this->weibo->post($url, $data);
        }
        Session::set('token_info', $token_info);
        return $token_info ? $token_info : '获取错误';
    }

    // 获取登录微博详细信息
    public function weibo_get_user_info($wb_access_token,$data)
    {
        if ($wb_access_token){
            $url = 'https://api.weibo.com/2/users/show.json';
            $data['access_token'] = $wb_access_token;

            $user_info = $this->weibo->get($url, $data);
        }
        Session::set('user_info', $user_info);
        return $user_info ? $user_info : '获取错误';
    }

    // 撤销微博授权
    public function weibo_get_revoke($wb_access_token)
    {
        if ($wb_access_token){
            $url = 'https://api.weibo.com/oauth2/revokeoauth2';
            $data['access_token'] = $wb_access_token;

            $revoke = $this->weibo->get($url, $data);
        }
        return !empty($revoke) ? $revoke : '撤销错误';
    }
}