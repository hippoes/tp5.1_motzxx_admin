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
use ThinkSDK\ThinkOauth;
//use ThinkSDK\sdk\QqSDK;


class Oauth extends ThinkOauth
{
    protected $Log;
    protected $QqSDK;
    protected $page_limit;

    public function __construct()
    {
        $this->Log = new AdminLog();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
//        $QqSDK = new QqSDK();
//        $set_config = $this->config_emails = $this->emails->get_find_id_field('emails_config','1','*');
        // 配置静态属性
    }

    public function index()
    {
        /*$type = 'qq';
        $sdk=ThinkOauth::getInstance($type);//获取SDK实例*/
        dump('123');
//        redirect($sdk->getRequestCodeURL())//跳转到授权页面
    }


    /**
     * 组装接口调用参数 并调用接口
     */
    public function call($api, $param = '', $method = 'GET', $multi = false)
    {

    }

    /**
     * 解析access_token方法请求后的返回值
     */
    public function parseToken($result, $extend)
    {

    }

    /**
     * 获取当前授权用户的SNS标识
     */
    public function openid()
    {

    }

}