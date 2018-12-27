<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/24
 * Time: 16:04
 */

namespace app\cms\controller;

use app\common\model\AdminLog;
use app\common\model\Plugs;
use think\facade\Session;
use think\Request;
use phpmailer\src\EmailAddon;

class Plug
{
    protected $Log;
    protected $plug;
    protected $page_limit;
    protected $email;


    public function __construct()
    {
        $this->Log = new AdminLog();
        $this->plug = new Plugs();
        $this->email = new EmailAddon();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    //插件列表
    public function index()
    {
        $list = $this->plug->getPlugForPage(1,$this->page_limit);
        foreach($list as $k=>$v){
            $list[$k]['timeline'] = date('Y-m-d H:i:s',$v['timeline']);
        }
        $record_num = $this->plug->getPlugCount();

        dump($record_num);
        dump($list);
        return view('index',
            [
                'list'=>$list,
                'record_num' => $record_num,
                'page_limit' => $this->page_limit,
            ]);
    }

    // 已安装插件
    public function pluged()
    {
        $res = $this->email->sendMail('2929006594@qq.com','圣诞快乐','2018-12-25 Merry Christmas');
        dump($res);
    }
}