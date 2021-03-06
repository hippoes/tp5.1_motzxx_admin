<?php
/*
 * 此文件用于验证短信服务API接口，供开发时参考
 * 执行验证前请确保文件为utf-8编码，并替换相应参数为您自己的信息，并取消相关调用的注释
 * 建议验证前先执行Test.php验证PHP环境
 *
 * 2017/11/30
 */

namespace phpdysms\demo;

use phpdysms\SignatureHelper;

class SendSms
{

    public static $AccessKeyId = "your access key id";          // 必填: 取得您的AKId信息
    public static $AccessKeySecret = "your access key secret";  // 必填: 取得您的AKSecret信息
    Public static $SignName = '短信签名';                        // 必填: 短信签名
    Public static $TemplateCode = 'SMS_0000001';                // 必填: 短信模板Code

    Public static $OutId = '12345';                             // 可选: 设置发送短信流水号
    Public static $SmsUpExtendCode = '1234567';                 // 可选: 上行短信扩展码, 扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段


    public function __construct()
    {

    }

    // 配置短信参数
    public function set_config($data)
    {
        self::$AccessKeyId = $data['AccessKeyId'];
        self::$AccessKeySecret = $data['AccessKeySecret'];
        self::$SignName = $data['SignName'];
        self::$TemplateCode = $data['TemplateCode'];
    }

    // 发送短信
    public function send($phone, $code)
    {
        $params = array();

        // *** 需用户填写部分 ***
        // fixme 必填：是否启用https
        $security = false;

        // fixme 必填: 请参阅 https://ak-console.aliyun.com/ 取得您的AK信息
        $accessKeyId = self::$AccessKeyId;
        $accessKeySecret = self::$AccessKeySecret;

        // fixme 必填: 短信接收号码
        $params["PhoneNumbers"] = $phone;

        // fixme 必填: 短信签名，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
        $params["SignName"] = self::$SignName;

        // fixme 必填: 短信模板Code，应严格按"模板CODE"填写, 请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/template
        $params["TemplateCode"] = self::$TemplateCode;

        // fixme 可选: 设置模板参数, 假如模板中存在变量需要替换则为必填项
        $params['TemplateParam'] = Array(
            "phone_code" => $code,
        );

        // fixme 可选: 设置发送短信流水号
        $params['OutId'] = "12345";

        // fixme 可选: 上行短信扩展码, 扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段
        $params['SmsUpExtendCode'] = "1234567";


        // *** 需用户填写部分结束, 以下代码若无必要无需更改 ***
        if (!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
            $params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
        }

        // 初始化SignatureHelper实例用于设置参数，签名以及发送请求
        $helper = new SignatureHelper();

        // 此处可能会抛出异常，注意catch
        $content = $helper->request(
            $accessKeyId,
            $accessKeySecret,
            "dysmsapi.aliyuncs.com",
            array_merge($params, array(
                "RegionId" => "cn-hangzhou",
                "Action" => "SendSms",
                "Version" => "2017-05-25",
            )),
            $security
        );

        return json_encode($content, JSON_UNESCAPED_UNICODE);
    }

    public function code_switch($code)
    {
        $status = array(
            'OK' => '发送成功',
            'isv.OUT_OF_SERVICE' => '业务停机',
            'isv.PRODUCT_UN_SUBSCRIPT' => '未开通云通信产品的阿里云客户',
            'isv.PRODUCT_UNSUBSCRIBE' => '产品未开通',
            'isv.ACCOUNT_NOT_EXISTS' => '账户不存在',
            'isv.ACCOUNT_ABNORMAL' => '账户异常',
            'isv.SMS_TEMPLATE_ILLEGAL' => '短信模版不合法',
            'isv.SMS_SIGNATURE_ILLEGAL' => '短信签名不合法',
            'isv.INVALID_PARAMETERS' => '参数异常',
            'isv.MOBILE_NUMBER_ILLEGAL' => '非法手机号',
            'isv.MOBILE_COUNT_OVER_LIMIT' => '手机号码数量超过限制',
            'isv.TEMPLATE_MISSING_PARAMETERS' => '模版缺少变量',
            'isv.BUSINESS_LIMIT_CONTROL' => '业务限流',
            'isv.INVALID_JSON_PARAM' => 'JSON参数不合法，只接受字符串值',
            'isv.BLACK_KEY_CONTROL_LIMIT' => '黑名单管控',
            'isv.PARAM_LENGTH_LIMIT' => '参数超出长度限制',
            'isv.PARAM_NOT_SUPPORT_URL' => '不支持URL',
            'isv.AMOUNT_NOT_ENOUGH' => '账户余额不足',
            'isv.TEMPLATE_PARAMS_ILLEGAL' => '模版变量里包含非法关键字',
        );

        if (array_key_exists($code, $status)) {
            return $status[$code];
        } else {
            return $code;
        }

    }


}

