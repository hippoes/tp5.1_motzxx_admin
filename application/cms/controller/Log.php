<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/19
 * Time: 16:28
 */
namespace app\cms\controller;


class Log
{
    public function index()
    {
//        Log::write('测试日志信息，这是警告级别，并且实时写入','notice');
        return 'log/index page.';
    }
}