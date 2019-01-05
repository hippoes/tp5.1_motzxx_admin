<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/24
 * Time: 16:12
 */

namespace app\common\model;

use app\common\model\MyModel;
use think\Db;
use \think\Model;
use \think\Request;

class Plugs extends BaseModel
{
    public function __construct($data = [])
    {
        parent::__construct($data);
    }

    /**
     * 分页获取插件信息
     */
    public function getPlugForPage($curr_page,$limit)
    {
        $res = $this
            ->field('*')
            ->limit($limit*($curr_page - 1),$limit)
            ->order('timeline','desc')
            ->select()
            ->toArray();

        return $res;
    }

    /**
     * 获取插件总数
     * @return float|string
     */
    public function getPlugCount(){
        $res = $this
            ->field('id')
            ->count();
        return $res;
    }
}