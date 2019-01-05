<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2019/1/4
 * Time: 17:10
 */

namespace app\cms\controller;

use app\common\model\AdminLog;
use think\facade\Session;
use think\Request;
use think\Validate;
use phpdysms\demo\SendSms;


class SmsCode
{
    protected $Log;
    protected $Sms;
    protected $page_limit;

    public function __construct()
    {
        $this->Log = new AdminLog();
        $this->Sms = new SendSms();
        $this->page_limit = config('app.CMS_PAGE_SIZE');

//        $set_config = $this->config_emails = $this->emails->get_find_id_field('emails_config','1','*');
        // 配置静态属性
    }

    public function index()
    {
        $config = array(
            'AccessKeyId'=>'LTAItwFcHEvPylQV',
            'AccessKeySecret'=>'3ooXu4h3DV0GPXeoHCNBS44cJ4CSR8',
            'SignName'=>'舞美酷库',
            'TemplateCode'=>'SMS_95845017',
            );

        $this->Sms->set_config($config);

        $phone = '17610900163';
        $code = rand(000000,999999);
        $res = $this->Sms->send($phone, $code);

        dump($res);
    }

}