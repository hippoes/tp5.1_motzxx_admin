<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/27
 * Time: 17:26
 */

namespace app\common\validate;

use \think\Validate;

class Email extends Validate
{
    protected $rule = [
        'title'         =>  'require|max:125',
        'send_emails'    =>  'require',
        'content'       =>  'require',
        '__token__'     =>  'require|token',
    ];
    protected $message  =   [
        'title.max'     =>  '标题不能超过125个字符',
        'title.require' =>   '标题不能为空',
        'send_emails.require'    =>  '收件人不能为空',
        'content'       =>  '文章内容不能为空',
        '__token__'     =>  'Token非法操作或失效',
    ];

    protected $scene = [
        'default'  =>  ['title','send_emails','content'],
        'token'    =>  ['__token__'],
    ];
}