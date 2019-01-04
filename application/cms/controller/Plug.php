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
// 添加附件
        $this->email->addFile('http://img.php.cn//upload/image/279/781/463/1545880815355141.png');
// 邮件标题
        $title = '愿得一人心，白首不相离。';
// 邮件内容
        $content = <<< EOF
<p align="center">
皑如山上雪，皎若云间月。<br>
闻君有两意，故来相决绝。<br>
今日斗酒会，明旦沟水头。<br>
躞蹀御沟上，沟水东西流。<br>
凄凄复凄凄，嫁娶不须啼。<br>
愿得一人心，白首不相离。<br>
竹竿何袅袅，鱼尾何簁簁！<br>
男儿重意气，何用钱刀为！</p>
EOF;
        exit;
// 发送QQ邮件
        $res = $this->email->send('2929006594@qq.com', $title, $content);
        dump($res);
    }
}