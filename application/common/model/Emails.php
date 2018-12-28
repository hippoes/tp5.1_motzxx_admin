<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/27
 * Time: 15:17
 */

namespace app\common\model;

use app\common\validate\Email;
use app\common\model\MyModel;
use app\common\model\AdminLog;
use think\Db;
use think\Model;
use think\Session;

class Emails extends BaseModel
{
    protected $Log;
    protected $validate;

    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->Log = new AdminLog();
        $this->validate = new Email();
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
        $addData = [
            'sender' => '何泽小生',
            'sender_email' => '2441561897@qq.com',
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

    // 获取单条邮件信息
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
    public function delEmails($id,$input)
    {
        $res = strpos($id,',');
        $opTag = isset($input['tag']) ? $input['tag'] : 'del';
        if($opTag == 'del') {

            if($res){
                $tag = $this->whereIn('id',$id)->delete();
                $validateRes['tag'] = $tag;
                $validateRes['message'] = $tag? '选中邮件删除成功' : '选中邮件删除失败！';
            }else{
                $tag = $this->where('id',$id)->delete();
                $validateRes['tag'] = $tag;
                $validateRes['message'] = $tag? '邮件删除成功' : '邮件删除失败！';
            }
        }
        return $validateRes;
    }

}