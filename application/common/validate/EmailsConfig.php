<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2019/1/2
 * Time: 9:42
 */

namespace app\common\validate;

use \think\Validate;

class EmailsConfig extends Validate
{
    protected $rule = [
        'sender'         =>  'require',
        'smtp_email'         =>  'require|email',
        'smtp_pwd'         =>  'require',
        'smtp_url'         =>  'require',
        'smtp_port'         =>  'require',
        'test_email'         =>  'email',
        'test_title'         =>  'max:125',
        '__token__'     =>  'require|token',
    ];

    protected $message  =   [
        'test_title.max'     =>  '测试标题不能超过125个字符',

        'smtp_email.email'     =>  'SMTP服务账号邮箱格式有误',
        'test_email.email'     =>  '测试邮箱格式有误',

        'sender.require'     =>  '发件人昵称不能为空',
        'smtp_email.require'     =>  'SMTP服务账号不能为空',
        'smtp_pwd.require'     =>  'SMTP服务密码不能为空',
        'smtp_url.require'     =>  'SMTP服务器网址不能为空',
        'smtp_port.require'     =>  'SMTP服务端口不能为空',

        '__token__'     =>  'Token非法操作或失效',
    ];

    protected $scene = [
        'default'  =>  ['title','send_emails','content'],
        'token'    =>  ['__token__'],
    ];
}