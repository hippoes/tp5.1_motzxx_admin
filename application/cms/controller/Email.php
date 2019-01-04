<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/27
 * Time: 14:50
 */

namespace app\cms\controller;

use app\common\model\Emails;
use app\common\model\AdminLog;
use think\facade\Session;
use think\Request;
use think\Validate;
use phpmailer\src\EmailAddon;


class Email
{
    protected $Log;
    protected $page_limit;
    protected $mailer;
    protected $emails;
    protected $config_emails;


    public function __construct()
    {
        $this->mailer = new EmailAddon();
        $this->emails = new Emails();
        $this->Log = new AdminLog();
        $this->page_limit = config('app.CMS_PAGE_SIZE');

        $set_config = $this->config_emails = $this->emails->get_find_id_field('emails_config','1','*');
        // 配置静态属性
        $this->mailer->set_config($set_config['0']);
    }

    /**
     * 邮件列表
     */
    public function index()
    {
        if (!empty($this->config_emails)) {
            $list = $this->emails->getEmailsForPage(1, $this->page_limit);
            foreach ($list as $k => $v) {
                if (strlen($v['title']) > 20) {
                    $list[$k]['title'] = cutStr($v['title'], 20);
                }
                if (strlen($v['send_emails']) > 20) {
                    $list[$k]['send_emails'] = cutStr($v['send_emails'], 20) . '(等)';
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
        } else {
            $data['sender'] = '';
            $data['smtp_email'] = '';
            $data['smtp_pwd'] = '';
            $data['smtp_url'] = '';
            $data['smtp_port'] = '';
            $data['test_email'] = '';
            $data['test_title'] = '';
            $data['test_content'] = '';
            return view('setting', ['data' => $data]);
        }


    }

    /**
     * 设置邮箱
     * @param Request $request
     * @return \think\response\View|void
     */
    public function setting()
    {
        $request = request();
        if ($request->isPost()) {
            $input = $request->param();
            $opRes = $this->emails->settingEmails($input);
            return showMsg($opRes['tag'], $opRes['message']);
        } else {
            $config_emails = $this->config_emails;
            if (!empty($config_emails)) {
                return view('setting', ['data' => $config_emails['0']]);
            } else {
                $data['sender'] = '';
                $data['smtp_email'] = '';
                $data['smtp_pwd'] = '';
                $data['smtp_url'] = '';
                $data['smtp_port'] = '';
                $data['test_email'] = '';
                $data['test_title'] = '';
                $data['test_content'] = '';

                return view('setting', ['data' => $data]);
            }
        }
    }

    // 发送测试邮件
    public function sendTestEmail(Request $request)
    {
        if ($request->isPost()) {
            $input = $request->param();

            $email = $input['test_email'];
            $title = $input['test_title'];
            $content = $input['test_content'];
            // 添加附件
            $fujian = $this->mailer->addFile(str_replace('/../', '', APP_PATH).'/upload/20190103\a4ac51f3d56ea2853e04f75492e969b4.jpg');
            // 发送邮件
            $result = $this->mailer->send($email, $title, $content);

            $opRes['tag'] = $result ? 0 : 0;
            $opRes['message'] = $result ? '测试邮件发送成功！' : '测试邮件发送失败';

            $this->Log->addLog('发送测试邮件，' . ' "' . $opRes['message'] . '"');
            return showMsg($opRes['tag'], $opRes['message']);
        }
    }


    // 发送邮件 or 查看邮件详情
    public function send(request $request, $id)
    {
        if ($request->isPost()) {
            // 发送邮件
            $input = $request->param();
            $data_email = $this->emails->getEmailsData($input['id']);
            $email = $input['email'];

            // 待发送邮件信息
            $attachment = $data_email['0']['attachment'];
            $title = $data_email['0']['title'];
            $content = $data_email['0']['content'];
            $this->mailer->addFile(str_replace('/../', '', APP_PATH).$attachment);

            // 验证邮箱格式
            $validate = new Validate([
                'email' => 'email'
            ]);
            $result = $validate->check($input);
            if ($result) {
                // 发送邮件
                $status = $this->mailer->send($email, $title, $content);
//                $status = true;
                $opRes['status'] = $status ? $status : 0;
                $opRes['message'] = $status ? '发送成功！' : '发送失败！';

                $fail['id'] = $id;
                if ($status == false) {
                    $fail['sendfail_email'] = $email;
                    $this->emails->updateSendEmailsData($fail);
                } else {
                    $fail['sendfail_email'] = 'null';
                    $res = $this->emails->updateSendEmailsData($fail);
                }
            }else{
                $opRes['status'] =  0;
                $opRes['message'] = '邮箱格式错误！';
            }
            return $opRes;
        } else {
            // 查看邮件信息详情
            $data = $this->emails->getEmailsData($id);
            $pic_url = $data['0']['attachment'];
            $data['0']['pic_url'] = $pic_url;
            $list = explode('; ', $data['0']['send_emails']);
            if(empty($list[count($list) - 1])) unset($list[count($list) - 1]);
            $validate = new Validate([
                'email' => 'email'
            ]);
            // 验证邮件地址 true or false
            $list_true = array();
            $list_false = array();
            foreach ($list as $v) {
                $check['email'] = $v;
                $result = $validate->check($check);
                if (!$result) {
                    $list_false[] = $v;
                } else {
                    $list_true[] = $v;
                }
            }
            // 获取发送失败邮件地址 并归为失效地址
            $fail_email = $this->emails->get_find_id_field('emails', $id,'sendfail_email');
            if(!empty($fail_email['0']['sendfail_email'])){
                $fail_list = explode(',', $fail_email['0']['sendfail_email']);
                foreach($fail_list as $v){
                    if(in_array($v, $list_true)){
                        $k = array_search($v, $list_true);
                        unset($list_true[$k]);
                        array_values($list_true);
                        array_push($list_false, $v);
                    }
                }
            }
            $list_true = array_unique($list_true);
            array_values($list_true);
            $list_false = array_unique($list_false);
            array_values($list_false);
            $data['0']['list_true'] = $list_true;
            $data['0']['list_false'] = $list_false;
            $data['0']['status'] = $data['0']['status'] ? 'true' : 'false';
            return view('send', ['emailinfo' => $data['0']]);
        }
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
    public function del(Request $request, $id)
    {
        if ($request->isPost()) {
            $input = $request->param();
            $opRes = $this->emails->delEmails($id, $input);
            return showMsg($opRes['tag'], $opRes['message']);
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
        if ($request->isPost()) {
            $input = $request->param();
            $opRes = $this->emails->updateEmailsData($input);
            return showMsg($opRes['tag'], $opRes['message']);
        } else {
            $data = $this->emails->getEmailsData($id);
            $pic_url = $data['0']['attachment'];

            $data['0']['pic_url'] = $pic_url;
            return view('edit', ['emailinfo' => $data['0']]);
        }
    }

    /**
     * 分页获取数据
     * @param Request $request
     */
    public function ajaxOpForPage(Request $request)
    {
        if ($request->isPost()) {
            $curr_page = $request->post('curr_page', 1);
            $list = $this->emails->getEmailsForPage($curr_page, $this->page_limit);
            foreach ($list as $k => $v) {
                if (strlen($v['title']) > 20) {
                    $list[$k]['title'] = cutStr($v['title'], 20);
                }
                if (strlen($v['send_emails']) > 20) {
                    $list[$k]['send_emails'] = cutStr($v['send_emails'], 20) . '(等)';
                }

                $list[$k]['timeline'] = date('Y-m-d H:i:s', $v['timeline']);
            }
            return showMsg(1, 'success', $list);
        } else {
            return showMsg(0, 'sorry，请求不合法');
        }

    }

}