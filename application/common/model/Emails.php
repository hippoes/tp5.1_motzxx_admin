<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/27
 * Time: 15:17
 */

namespace app\common\model;

use app\common\validate\Email;
use app\common\validate\EmailsConfig;
use app\common\model\MyModel;
use app\common\model\AdminLog;
use think\Db;
use think\Model;
use think\Session;

class Emails extends BaseModel
{
    protected $Log;
    protected $validate;
    protected $Emails;

    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->Log = new AdminLog();
        $this->validate = new Email();
        $this->Emails = new EmailsConfig();
    }

    /**
     * 分页获取邮件数据
     * @param $curr_page
     * @param $limit
     * @return array
     */
    public function getEmailsForPage($curr_page, $limit)
    {
        $res = $this
            ->field('*')
            ->limit($limit * ($curr_page - 1), $limit)
            ->order('timeline', 'desc')
            ->select()
            ->toArray();

        return $res;
    }

    /**
     * 获取邮件总条数
     * @return float|string
     */
    public function getEmailsCount()
    {
        $res = $this
            ->field('id')
            ->count();
        return $res;
    }

    /**
     * 进行新邮件的添加操作
     * @param $data
     * @return array
     */
    public function addEmails($data)
    {
        // 获取配置邮件信息
        $config_emails = $this->get_find_id_field('emails_config', '1', '*');
        $addData = [
            'sender' => $config_emails['0']['sender'],
            'sender_email' => $config_emails['0']['smtp_email'],
            'title' => $data['title'],
            'send_emails' => $data['send_emails'],
            'content' => isset($data['content']) ? $data['content'] : '',
            'attachment' => $data['attachment'],
            'attachment_name' => $data['attachment_name'],
            'timeline' => time()
        ];
        $tokenData = ['__token__' => isset($data['__token__']) ? $data['__token__'] : '',];
        $validateRes = $this->validate($this->validate, $addData, $tokenData);

        if ($validateRes['tag']) {
            $tag = $this->insert($addData);
            $validateRes['tag'] = $tag;
            $validateRes['message'] = $tag ? '添加成功' : '添加失败';

            $this->Log->addLog('新增邮件，' . $addData['title'] . ' "' . $validateRes['message'] . '"');
        } else {
            // 添加失败，删除附件
            if ($data['attachment']) {
                $upload_file = str_replace('/../', '', APP_PATH) . $data['attachment'];
                file_exists($upload_file) ? unlink($upload_file) : '';
            }
        }
        return $validateRes;
    }

    // 获取单条邮件所有信息
    public function getEmailsData($id)
    {
        if ($id) {
            $res = $this->where('id', $id)->select()->toArray();
        }
        return $res;
    }

    /** 更新邮件 or 删除单条邮件
     * @param $input
     * @return array
     */
    public function updateEmailsData($input)
    {
        $id = $input['id'];
        $opTag = isset($input['tag']) ? $input['tag'] : 'edit';
        if ($opTag == 'del') {
            $saveTag = $this
                ->where('id', $id)
                ->detele();
            $validateRes = ['tag' => 1, 'message' => '删除成功'];
            $this->Log->addLog('删除邮件，id：' . $id . '； "' . $validateRes['message'] . '"');
        } else {
            $old_attachment = $input['old_attachment'];
            $saveData = [
                "sender" => "何泽小生",
                "sender_email" => "2441561897@qq.com",
                "title" => $input['title'],
                "send_emails" => $input['send_emails'],
                "content" => $input['content'],
                "attachment" => $input['attachment'],
                "attachment_name" => $input['attachment_name'],
                "update_timeline" => time(),
            ];

            $tokenData = ['__token__' => isset($input['__token__']) ? $input['__token__'] : ''];
            $validateRes = $this->validate($this->validate, $saveData, $tokenData);
            if ($validateRes['tag']) {
                if (trim($old_attachment) !== trim($input['attachment'])) {
                    $old_file = str_replace('/../', '', APP_PATH) . $old_attachment;
                    $res = file_exists($old_file) ? unlink($old_file) : '';
                }
                $saveTag = $this
                    ->where('id', $id)
                    ->update($saveData);
                $validateRes['tag'] = $saveTag;
                $validateRes['message'] = $saveTag ? '修改成功' : '数据无变动';
                $this->Log->addLog('修改邮件，' . $saveData['title'] . ' "' . $validateRes['message'] . '"');
            } else {
                // 修改失败，删除新上传附件
                if (trim($old_attachment) !== trim($input['attachment'])) {
                    $upload_file = str_replace('/../', '', APP_PATH) . $input['attachment'];
                    file_exists($upload_file) ? unlink($upload_file) : '';
                }
            }
        }
        return $validateRes;
    }

    /**
     * 删除邮件
     * @param $id
     * @param $input
     * @return mixed
     * @throws \Exception
     */
    public function delEmails($id, $input)
    {
        $res = strpos($id, ',');
        $opTag = isset($input['tag']) ? $input['tag'] : 'del';
        if ($opTag == 'del') {

            if ($res) {
                $tag = $this->whereIn('id', $id)->delete();
                $validateRes['tag'] = $tag;
                $validateRes['message'] = $tag ? '选中邮件删除成功' : '选中邮件删除失败！';
            } else {
                $tag = $this->where('id', $id)->delete();
                $validateRes['tag'] = $tag;
                $validateRes['message'] = $tag ? '邮件删除成功' : '邮件删除失败！';
            }
        }
        return $validateRes;
    }


    // 设置邮箱配置信息
    public function settingEmails($data)
    {
        $addData = [
            'sender' => $data['sender'],
            'smtp_email' => $data['smtp_email'],
            'smtp_pwd' => $data['smtp_pwd'],
            'smtp_url' => $data['smtp_url'],
            'smtp_port' => $data['smtp_port'],
            'test_email' => $data['test_email'],
            'test_title' => $data['test_title'],
            'test_content' => $data['test_content'],
        ];
        $tokenData = ['__token__' => isset($data['__token__']) ? $data['__token__'] : '',];
        $validateRes = $this->validate($this->Emails, $addData, $tokenData);
        $config_emails = $this->get_find_id_field('emails_config','1','*');
        if ($validateRes['tag'] && empty($config_emails)) {
            $tag = Db::name('emails_config')
                ->data([
                    'sender' => $data['sender'],
                    'smtp_email' => $data['smtp_email'],
                    'smtp_pwd' => $data['smtp_pwd'],
                    'smtp_url' => $data['smtp_url'],
                    'smtp_port' => $data['smtp_port'],
                    'test_email' => $data['test_email'],
                    'test_title' => $data['test_title'],
                    'test_content' => $data['test_content'],
                ])
                ->insert();
            $validateRes['tag'] = $tag;
            $validateRes['message'] = $tag ? '添加成功' : '添加失败';

            $this->Log->addLog('首次配置邮件设置，' . ' "' . $validateRes['message'] . '"');
        } else {
            $tag = Db::name('emails_config')
                ->where('id', '1')
                ->update([
                    'sender' => $data['sender'],
                    'smtp_email' => $data['smtp_email'],
                    'smtp_pwd' => $data['smtp_pwd'],
                    'smtp_url' => $data['smtp_url'],
                    'smtp_port' => $data['smtp_port'],
                    'test_email' => $data['test_email'],
                    'test_title' => $data['test_title'],
                    'test_content' => $data['test_content'],
                ]);
            $validateRes['tag'] = $tag;
            $validateRes['message'] = $tag ? '修改成功' : '数据无变动';

            $this->Log->addLog('修改邮件设置，' . ' "' . $validateRes['message'] . '"');
        }
        return $validateRes;

    }

    /** 发送邮件--更新邮件信息
     * @param $input
     * @return array
     */
    public function updateSendEmailsData($input)
    {
        $id = $input['id'];
        $sendfail_email = $this->get_find_id_field('emails', $id, 'sendfail_email');
        if ($input['sendfail_email'] !== 'null') {
            $sendfail_email = $sendfail_email['0']['sendfail_email'] . ',' . $input['sendfail_email'];
        }else{
            $sendfail_email = $sendfail_email['0']['sendfail_email'];
        }
        $saveData = [
            "sendfail_email" => $sendfail_email,
            "status" => "1",
            "send_timeline" => time(),
        ];

        $saveTag = $this
            ->where('id', $id)
            ->update($saveData);
        $validateRes['tag'] = $saveTag;
        $validateRes['message'] = $saveTag ? '该邮箱地址发送失败' : '数据无变动';
        $this->Log->addLog('更新发送失败邮箱地址，' . $input['sendfail_email'] . ' "' . $validateRes['message'] . '"');

        return $validateRes;
    }
}