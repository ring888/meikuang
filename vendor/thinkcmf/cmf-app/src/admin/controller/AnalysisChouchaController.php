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

use cmf\controller\AdminBaseController;
use think\Db;
use think\db\Query;
use app\admin\model\AnalysisChouchaModel;

class AnalysisChouchaController extends AdminBaseController
{

    /**
     * 抽查样记录
     * @adminMenu(
     *     'name'   => '抽查样记录',
     *     'parent' => 'admin/Analysis/record',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '抽查样记录',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $param = $this->request->param();
        $goods = Db::table('mk_analysis_choucha')
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

            $data['more'] = json_encode($data['more']);
            $result = Db::name('analysis_choucha')
                ->where('record_date', $data['record_date'])
                ->select();
            if (count($result) > 0) {
                $this->error("已存在该日记录");
            } else {

                //print_r($data['more']['time']);die;
                $linkModel = new AnalysisChouchaModel();

                $linkModel->allowField(true)->save($data);
                $this->success("操作成功", url("AnalysisChoucha/index"));
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

        $linkModel = new AnalysisChouchaModel();
        $link      = $linkModel->get($id);
        $link['more'] = json_decode($link['more'], true);
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

            $linkModel = new AnalysisChouchaModel();
            $data['record_date'] = strtotime($data['record_date']);
            $data['more'] = json_encode($data['more']);
            $result = Db::name('analysis_choucha')
                ->where('record_date', $data['record_date'])
                ->where("id", "<>", $data['id'])
                ->select();
            if (count($result) > 0) {
                $this->error("已存在该日记录");
            } else {
                $linkModel->allowField(true)->isUpdate(true)->save($data);

                $this->success("保存成功！", url("AnalysisChoucha/index"));
            }
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
        AnalysisChouchaModel::destroy($id);
        $this->success("删除成功！", url("AnalysisChoucha/index"));
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
        $ids                 = $this->request->param('id');
        $info = Db::name("warehouse_order")->where("id", $ids)->find();
        $this->assign("info", $info);

        $order_goods = Db::table("mk_warehouse_order_goods")
            ->alias("a")
            ->join('mk_warehouse_goods b', 'a.goods_id=b.id')
            ->join('mk_warehouse c', 'b.warehouse=c.id')
            ->where("a.order_id", $ids)
            ->field('a.*,b.goods_name,b.goods_no,b.danwei,c.wh_name')
            ->order("a.id asc")
            ->select();
        $this->assign("order_goods", $order_goods);
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

        $linkModel = new AnalysisChouchaModel();
        $link      = $linkModel->get($id);
        $link['more'] = json_decode($link['more'], true);
        $this->assign("info", $link);
        return $this->fetch();
    }
}
