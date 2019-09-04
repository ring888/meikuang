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
use app\admin\model\WarehouseGoodsModel;

class WarehouseGoodsController extends AdminBaseController
{

    /**
     * 物品信息
     * @adminMenu(
     *     'name'   => '物品信息',
     *     'parent' => 'admin/BasicInformation/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '物品信息',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $categoryIds = $this->request->param('category', 0, 'intval');
        $goods = Db::table('mk_warehouse_goods')
            ->alias('a')
            ->join('mk_warehouse b', 'a.warehouse=b.id')
            ->where(function (Query $query) {
                $param = $this->request->param();
                if (!empty($param['keyword'])) {
                    $keyword = $param['keyword'];
                    $query->where('a.goods_name|a.goods_no|a.goods_code', 'like', "%$keyword%");
                }
                $categoryId = $this->request->param('category', 0, 'intval');
                if ($categoryId > 0) {
                    $query->where('a.warehouse', $categoryId);
                }
            })
            ->field('a.*,b.wh_name')
            ->order("a.id DESC")
            ->paginate(10);
        $warehouse = Db::name('Warehouse')->select();
        $this->assign('warehouse', $warehouse);
        $this->assign('category', $categoryIds);
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


        $roles = Db::name('warehouse')->order("id asc")->select();
        $this->assign("warehouse", $roles);
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
        $data      = $this->request->param();
        $linkModel = new WarehouseGoodsModel();
        $result    = $this->validate($data, 'WarehouseGoods');
        if ($result !== true) {
            $this->error($result);
        }
        $goods = Db::name('warehouse_goods')
            ->where("goods_name", $data['goods_name'])
            ->where("goods_type", $data['goods_type'])
            ->where("warehouse", $data['warehouse'])
            ->select();
        if (count($goods) > 0) {
            
            $this->error("系统已经存在相关物品!", url("WarehouseGoods/index"));
        } else {
            $linkModel->allowField(true)->save($data);
            $this->success("添加成功！", url("WarehouseGoods/index"));
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
        $roles = Db::name('warehouse')->order("id asc")->select();
        $this->assign("warehouseModel", $roles);

        $warehouse_goods = DB::name('warehouse_goods')->where("id", $id)->find();
        $this->assign($warehouse_goods);
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
        $data      = $this->request->param();
        $linkModel = new WarehouseGoodsModel();
        $result    = $this->validate($data, 'WarehouseGoods');
        if ($result !== true) {
            $this->error($result);
        }
        $linkModel->allowField(true)->isUpdate(true)->save($data);

        $this->success("保存成功！", url("WarehouseGoods/index"));
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
        WarehouseGoodsModel::destroy($id);
        $this->success("删除成功！", url("WarehouseGoods/index"));
    }
}
