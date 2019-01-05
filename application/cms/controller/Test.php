<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/19
 * Time: 11:30
 */

namespace app\cms\controller;

use think\Controller;

class Test extends Controller
{
    public function _empty($name)
    {
        return $this->showCity($name);
    }

    public function showCity($name)
    {
        return '当前城市：'.$name;
    }

    public function index()
    {
//        $this->success('新增成功');
//        $this->error('新增失败');
        return 'test index page.';
    }

}