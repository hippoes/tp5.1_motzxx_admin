<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/20
 * Time: 15:15
 */
namespace app\common\model;

use think\Db;
use \think\Model;
use \think\Request;

class MyModel extends BaseModel
{
    protected $table;

    public function __construct($data = [])
    {
        parent::__construct($data);
    }



    /**
     * 根据ID 获取管理员 指定字段数据
     * @param $id
     * @param $field
     * @return array
     */
    public function get_find_field($id,$field='*'){
        $fields = '';
        $field = explode(',',$field);
        if(is_array($field)){
            foreach($field as $v){
                $fields.='a.'.$v.',';
            }
        }

        $res = Db::table('tp5_admins')
            ->alias('a')
            ->field($fields.'ar.user_name role_name')
            ->join('tp5_admin_roles ar','ar.id = a.role_id')
            ->where('a.id',$id)
            ->find();

        return $res;
    }

}