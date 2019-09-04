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
use app\admin\model\WarehouseModel;

class WarehouseController extends AdminBaseController
{
    protected $targets = ["_blank" => "新标签页打开", "_self" => "本窗口打开"];

    /**
     * 仓库信息
     * @adminMenu(
     *     'name'   => '仓库信息',
     *     'parent' => 'admin/BasicInformation/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 50,
     *     'icon'   => '',
     *     'remark' => '仓库信息',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $linkModel = new WarehouseModel();
        $links     = $linkModel->select();
        $this->assign('links', $links);

        return $this->fetch();
    }

    /**
     * 添加仓库信息
     * @adminMenu(
     *     'name'   => '添加仓库信息',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加仓库信息',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $this->assign('targets', $this->targets);
        return $this->fetch();
    }

    /**
     * 添加仓库信息提交保存
     * @adminMenu(
     *     'name'   => '添加仓库信息提交保存',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加仓库信息提交保存',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        $data      = $this->request->param();
        $linkModel = new WarehouseModel();
        $result    = $this->validate($data, 'Warehouse');
        if ($result !== true) {
            $this->error($result);
        }
        $linkModel->allowField(true)->save($data);

        $this->success("添加成功！", url("Warehouse/index"));
    }

    /**
     * 编辑仓库信息
     * @adminMenu(
     *     'name'   => '编辑仓库信息',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑仓库信息',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\Exception\DbException
     */
    public function edit()
    {
        $id        = $this->request->param('id', 0, 'intval');
        $linkModel = new WarehouseModel();
        $link      = $linkModel->get($id);
        $this->assign('targets', $this->targets);
        $this->assign('link', $link);
        return $this->fetch();
    }

    /**
     * 编辑仓库信息提交保存
     * @adminMenu(
     *     'name'   => '编辑仓库信息提交保存',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑仓库信息提交保存',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {
        $data      = $this->request->param();
        $linkModel = new WarehouseModel();
        $result    = $this->validate($data, 'Warehouse');
        if ($result !== true) {
            $this->error($result);
        }
        $linkModel->allowField(true)->isUpdate(true)->save($data);

        $this->success("保存成功！", url("Warehouse/index"));
    }

    /**
     * 删除仓库信息
     * @adminMenu(
     *     'name'   => '删除仓库信息',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除仓库信息',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        WarehouseModel::destroy($id);
        $this->success("删除成功！", url("warehouse/index"));
    }

    /**
     * 仓库信息排序
     * @adminMenu(
     *     'name'   => '仓库信息排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '仓库信息排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        $linkModel = new  WarehouseModel();
        parent::listOrders($linkModel);
        $this->success("排序更新成功！");
    }


}