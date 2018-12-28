<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/27
 * Time: 14:50
 */

namespace app\cms\controller;

use app\common\model\Emails;
use think\facade\Session;
use think\Request;
use phpmailer\src\EmailAddon;


class Email
{
    protected $Log;
    protected $page_limit;
    protected $mailer;
    protected $emails;


    public function __construct()
    {
        $this->mailer = new EmailAddon();
        $this->emails = new Emails();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 邮件列表
     */
    public function index()
    {
        $list = $this->emails->getEmailsForPage(1, $this->page_limit);
        foreach ($list as $k => $v) {
            if(strlen($v['title']) > 20){
                $list[$k]['title'] = cutStr($v['title'],20);
            }
            if(strlen($v['send_emails']) > 20){
                $list[$k]['send_emails'] = cutStr($v['send_emails'],20).'(等)';
            }
            $list[$k]['timeline'] = date('Y-m-d H:i:s', $v['timeline']);
        }
        $record_num = $this->emails->getEmailsCount();

        return view('index',
            [
                'list' => $list,
                'record_num' => $record_num,
                'page_limit' => $this->page_limit,
            ]);
    }

    /**
     * 添加邮件
     * @param Request $request
     * @return \think\response\View|void
     */
    public function add(Request $request)
    {
        if ($request->isPost()) {
            $input = $request->param();
            $opRes = $this->emails->addEmails($input);
            return showMsg($opRes['tag'], $opRes['message']);
        } else {
            return view('add');
        }
    }

    /**
     * 删除邮件
     *
     * @param Request $request
     * @param $id
     * @throws \Exception
     */
    public function del(Request $request,$id)
    {
        if ($request->isPost()){
            $input = $request->param();
            $opRes = $this->emails->delEmails($id,$input);
            return showMsg($opRes['tag'],$opRes['message']);
        }
    }

    /**
     * 修改邮件内容
     * @param Request $request
     * @param $id
     * @return \think\response\View|void
     */
    public function edit(request $request, $id)
    {
        if($request->isPost()){
            $input = $request->param();
            $opRes = $this->emails->updateEmailsData($input);
            return showMsg($opRes['tag'], $opRes['message']);
        } else {
            $data = $this->emails->getEmailsData($id);
            $pic_url = $data['0']['attachment'];

            $data['0']['pic_url'] = $pic_url;
            return view('edit', ['emailinfo'=>$data['0']]);
        }
    }

    /**
     * 分页获取数据
     * @param Request $request
     */
    public function ajaxOpForPage(Request $request){
        if ($request->isPost()){
            $curr_page = $request->post('curr_page',1);
            $list = $this->emails->getEmailsForPage($curr_page,$this->page_limit);
            foreach($list as $k=>$v){
                if(strlen($v['title']) > 20){
                    $list[$k]['title'] = cutStr($v['title'],20);
                }
                if(strlen($v['send_emails']) > 20){
                    $list[$k]['send_emails'] = cutStr($v['send_emails'],20).'(等)';
                }

                $list[$k]['timeline'] = date('Y-m-d H:i:s',$v['timeline']);
            }
            return showMsg(1,'success',$list);
        }else{
            return showMsg(0,'sorry，请求不合法');
        }

    }

}