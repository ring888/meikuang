<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2019 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\admin\model\AnalysisRibaoModel;
use cmf\controller\AdminBaseController;
use think\Db;
use think\db\Query;

class AnalysisRibaoController extends AdminBaseController
{

    /**
     * 日报记录
     * @adminMenu(
     *     'name'   => '日报记录',
     *     'parent' => 'admin/Analysis/record',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '日报记录',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $param = $this->request->param();
        $goods = Db::table('mk_analysis_ribao')
            ->alias('a')
            ->join('mk_user b', 'a.creater=b.id')
            ->where(function (Query $query) use ($param) {


                $startTime = empty($param['start_time']) ? 0 : strtotime($param['start_time']);
                $endTime   = empty($param['end_time']) ? 0 : strtotime($param['end_time']);
                if (!empty($startTime)) {
                    $query->where('a.record_date', '>=', $startTime);
                }
                if (!empty($endTime)) {
                    $query->where('a.record_date', '<=', $endTime);
                }
            })
            ->field('a.*,b.user_nickname as creater')
            ->order("a.id DESC")
            ->paginate(10);
        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('list', $goods);
        $this->assign('page', $goods->render());
        return $this->fetch();
    }

    /**
     * 新增
     * @adminMenu(
     *     'name'   => '新增',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '新增',
     *     'param'  => ''
     * )
     */
    public function add()
    {

        return $this->fetch();
    }

    /**
     * 新增提交
     * @adminMenu(
     *     'name'   => '新增提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '新增提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();
            $data['create_time'] = time();
                $data['record_date'] = strtotime($data['record_date']);
                $data['creater'] = cmf_get_current_admin_id();

               
            $result = Db::name('analysis_ribao')
                ->where('record_date', $data['record_date'])
                ->select();
            if (count($result) > 0) {
                $this->error("已存在该日记录");
            } else {
                
                //print_r($data['more']['time']);die;
                $linkModel = new AnalysisRibaoModel();

                $linkModel->allowField(true)->save($data);
                $this->success("操作成功", url("AnalysisRibao/index"));
            }
        }
    }

    /**
     * 编辑
     * @adminMenu(
     *     'name'   => '编辑',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $id    = $this->request->param('id', 0, 'intval');
        
        $linkModel = new AnalysisRibaoModel();
        $link      = $linkModel->get($id);
        $link['ground_more'] = json_decode($link['ground_more'], true);
        $link['coal_more'] = json_decode($link['coal_more'], true);
        $link['under_more'] = json_decode($link['under_more'], true);
        $link['four_classes_more'] = json_decode($link['four_classes_more'], true);
        $link['zero_classes_more'] = json_decode($link['zero_classes_more'], true);
        $link['eight_classes_more'] = json_decode($link['eight_classes_more'], true);
        $this->assign("info", $link);
        return $this->fetch();
    }

    /**
     * 编辑提交
     * @adminMenu(
     *     'name'   => '编辑提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑提交',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();
            $linkModel = new AnalysisRibaoModel();
            $data['record_date'] = strtotime($data['record_date']);
            $data['ground_more'] = json_encode($data['ground_more']);
            $data['coal_more'] = json_encode($data['coal_more']);
            $data['under_more'] = json_encode($data['under_more']);
            $data['four_classes_more'] = json_encode($data['four_classes_more']);
            $data['zero_classes_more'] = json_encode($data['zero_classes_more']);
            $data['eight_classes_more'] = json_encode($data['eight_classes_more']);
            $result = Db::name('analysis_ribao')
                ->where('record_date', $data['record_date'])
                ->where("id", "<>", $data['id'])
                ->select();
            if (count($result) > 0) {
                $this->error("已存在该日记录");
            }
            $linkModel->allowField(true)->isUpdate(true)->save($data);
            
            $this->success("保存成功！", url("AnalysisRibao/index"));
        }
    }


    /**
     * 删除
     * @adminMenu(
     *     'name'   => '删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除',
     *     'param'  => ''
     * )
     */
    public function delete()
    {

        $id = $this->request->param('id', 0, 'intval');
        AnalysisRibaoModel::destroy($id);
        $this->success("删除成功！", url("AnalysisRibao/index"));
    }


    /**
     * 打印
     * @adminMenu(
     *     'name'   => '打印',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '打印',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function prints()
    {
        $id    = $this->request->param('id', 0, 'intval');
        
        $linkModel = new AnalysisRibaoModel();
        $link      = $linkModel->get($id);
        $link['ground_more'] = json_decode($link['ground_more'], true);
        $this->assign("ground_more_count",count($link['ground_more']['coal_name']));

        $link['coal_more'] = json_decode($link['coal_more'], true);
        $this->assign("coal_more_count",count($link['coal_more']['coal_name']));

        $link['under_more'] = json_decode($link['under_more'], true);
        $this->assign("under_more_count",count($link['under_more']['coal_name']));

        $link['four_classes_more'] = json_decode($link['four_classes_more'], true);
        $four_count = count($link['four_classes_more']['coal_name']);
        $this->assign("four_classes_more_count",$four_count);

        $link['zero_classes_more'] = json_decode($link['zero_classes_more'], true);
        $zero_count = count($link['zero_classes_more']['coal_name']);
        $this->assign("zero_classes_more_count",$zero_count);

        $link['eight_classes_more'] = json_decode($link['eight_classes_more'], true);
        $eight_count = count($link['eight_classes_more']['coal_name']);
        $this->assign("eight_classes_more_count",$eight_count);

        $total = count($link['ground_more']['coal_name']) + count($link['coal_more']['coal_name']) + count($link['under_more']['coal_name']);

        $max = max($four_count,$zero_count,$eight_count);
        $this->assign("max",$max==0?1:$max);
        $this->assign("total",$total);
        $this->assign("info", $link);
        return $this->fetch();
    }

    /**
     * 查看
     * @adminMenu(
     *     'name'   => '查看',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '查看',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function show()
    {
        $id    = $this->request->param('id', 0, 'intval');
        
        $linkModel = new AnalysisRibaoModel();
        $link      = $linkModel->get($id);
        $link['ground_more'] = json_decode($link['ground_more'], true);
        $this->assign("ground_more_count",count($link['ground_more']['coal_name']));

        $link['coal_more'] = json_decode($link['coal_more'], true);
        $this->assign("coal_more_count",count($link['coal_more']['coal_name']));

        $link['under_more'] = json_decode($link['under_more'], true);
        $this->assign("under_more_count",count($link['under_more']['coal_name']));

        $link['four_classes_more'] = json_decode($link['four_classes_more'], true);
        $four_count = count($link['four_classes_more']['coal_name']);
        $this->assign("four_classes_more_count",$four_count);

        $link['zero_classes_more'] = json_decode($link['zero_classes_more'], true);
        $zero_count = count($link['zero_classes_more']['coal_name']);
        $this->assign("zero_classes_more_count",$zero_count);

        $link['eight_classes_more'] = json_decode($link['eight_classes_more'], true);
        $eight_count = count($link['eight_classes_more']['coal_name']);
        $this->assign("eight_classes_more_count",$eight_count);

        $total = count($link['ground_more']['coal_name']) + count($link['coal_more']['coal_name']) + count($link['under_more']['coal_name']);

        $max = max($four_count,$zero_count,$eight_count);
        $this->assign("max",$max==0?1:$max);
        $this->assign("total",$total);
        $this->assign("info", $link);
        return $this->fetch();
    }
}
