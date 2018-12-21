<?php
/**
 * Created by PhpStorm.
 * User: 何泽-hz
 * Date: 2018/12/19
 * Time: 16:28
 */
namespace app\cms\controller;

use app\common\model\AdminLog;
use think\facade\Session;
use think\Request;

class Log
{
    protected $Log;
    protected $menuModel;
    private $page_limit;


    public function __construct()
    {
        $this->Log = new AdminLog();
        $this->page_limit = config('app.CMS_PAGE_SIZE');
    }

    /**
     * 日志列表
     *
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $res = $this->Log->getAdminLogForPage(1,$this->page_limit);
        foreach($res as $k=>$v){
            $res[$k]['timeline'] = date('Y-m-d H:i:s',$v['timeline']);
        }
        $record_num = $this->Log->getLogCount();

        return view('index',
            [
                'res'=>$res,
                'record_num' => $record_num,
                'page_limit' => $this->page_limit,
            ]);
    }

    /**
     * 删除日志
     *
     * @param Request $request
     * @param $id
     * @throws \Exception
     */
    public function del(Request $request,$id)
    {
        if ($request->isPost()){
            $input = $request->param();
            $opRes = $this->Log->delLog($id,$input);
            return showMsg($opRes['tag'],$opRes['message']);
        }
    }

    /**
     * 查看日志
     *
     * @param Request $request
     * @param $id
     * @return \think\response\View|void
     */
    public function show(Request $request,$id)
    {
        if (!empty($id)){
            $input = $request->param();
            $LogData = $this->Log->find_one($id)->toArray();
            $city = get_area($LogData['0']['ip']);
            $city = $city['data']['country'].'/'.$city['data']['city'];
            return view('show',['LogData' => $LogData['0'],'city' => $city]);
        }
    }

    /**
     * 分页获取数据
     * @param Request $request
     */
    public function ajaxOpForPage(Request $request){
        if ($request->isPost()){
            $curr_page = $request->post('curr_page',1);
            $list = $this->Log->getAdminLogForPage($curr_page,$this->page_limit);
            foreach($list as $k=>$v){
                $list[$k]['timeline'] = date('Y-m-d H:i:s',$v['timeline']);
            }
            return showMsg(1,'success',$list);
        }else{
            return showMsg(0,'sorry，请求不合法');
        }

    }


}