<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/20
 * Time: 10:07
 */

namespace app\common\model;

use app\common\model\MyModel;
use think\Db;
use \think\Model;
use \think\Request;

class AdminLog extends BaseModel
{
    protected $admin;

    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->admin = new MyModel();
    }

    /**
     * 获取所有日志
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getList()
    {
        $res = $this
            ->field('*')
            ->order('timeline', 'desc')
            ->select();

        return $res;
    }

    /**
     * 新增日志
     * @param $id
     * @param string $data
     * @return array
     */
    public function addLog($action = '')
    {
        $request = request();
        $id = $request->session('cmsMoTzxxAID');
        $admin = $this->admin->get_find_field($id, 'user_name');
        $addData = [
            'performer' => $admin['user_name'] . '(' . $admin['role_name'] . ')',
            'ip' => $request->ip(),
            'timeline' => time(),
            'action' => $action
        ];

        if (!empty($addData['action']) && $addData['performer'] !=='()') {
            $tag = $this->insert($addData);
            return $tag;
        }
    }

    /**
     * 删除日志
     * @param $id
     * @param $input
     * @return mixed
     * @throws \Exception
     */
    public function delLog($id,$input)
    {
        $res = strpos($id,',');
        $opTag = isset($input['tag']) ? $input['tag'] : 'del';
        if($opTag == 'del') {

            if($id == 'delAll'){
                $sql = 'truncate tp5_admin_log';
                $tag = $this->query($sql);
                $validateRes['tag'] = $tag? $tag : 0;
                $validateRes['message'] = $tag? '清空日志失败！' : '清空日志成功';
            }elseif($res){
                $tag = $this->whereIn('id',$id)->delete();
                $validateRes['tag'] = $tag;
                $validateRes['message'] = $tag? '选中日志删除成功' : '选中日志删除失败！';
            }else{
                $tag = $this->where('id',$id)->delete();
                $validateRes['tag'] = $tag;
                $validateRes['message'] = $tag? '日志删除成功' : '日志删除失败！';
            }
        }
        return $validateRes;
    }

    /**
     * 查看单条日志信息
     * @param $id
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function find_one($id)
    {
        if($id){
            $res = $this->where('id',$id)->select();
        }
        return $res;
    }

    /**
     * 获取日志总条数
     * @return float|string
     */
    public function getLogCount(){
        $res = $this
            ->field('id')
            ->count();
        return $res;
    }

    /**
     * 分页获取日志数据
     */
    public function getAdminLogForPage($curr_page,$limit)
    {
        $res = $this
            ->field('*')
            ->limit($limit*($curr_page - 1),$limit)
            ->order('timeline','desc')
            ->select()
            ->toArray();

        return $res;
    }
}