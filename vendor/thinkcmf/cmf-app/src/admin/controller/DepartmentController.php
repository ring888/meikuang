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
use app\admin\model\DepartmentModel;

class DepartmentController extends AdminBaseController
{
    protected $targets = ["_blank" => "新标签页打开", "_self" => "本窗口打开"];

    /**
     * 部门信息
     * @adminMenu(
     *     'name'   => '部门信息',
     *     'parent' => 'admin/Device/basicinfo',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 50,
     *     'icon'   => '',
     *     'remark' => '部门信息',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $linkModel = new DepartmentModel();
        $links     = $linkModel->select();
        $this->assign('links', $links);

        return $this->fetch();
    }

    /**
     * 添加部门信息
     * @adminMenu(
     *     'name'   => '添加部门信息',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加部门信息',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $this->assign('targets', $this->targets);
        return $this->fetch();
    }

    /**
     * 添加部门信息提交保存
     * @adminMenu(
     *     'name'   => '添加部门信息提交保存',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加部门信息提交保存',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        $data      = $this->request->param();
        $linkModel = new DepartmentModel();
        $result    = $this->validate($data, 'Department');
        if ($result !== true) {
            $this->error($result);
        }
        $linkModel->allowField(true)->save($data);

        $this->success("添加成功！", url("Department/index"));
    }

    /**
     * 编辑部门信息
     * @adminMenu(
     *     'name'   => '编辑部门信息',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑部门信息',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\Exception\DbException
     */
    public function edit()
    {
        $id        = $this->request->param('id', 0, 'intval');
        $linkModel = new DepartmentModel();
        $link      = $linkModel->get($id);
        $this->assign('targets', $this->targets);
        $this->assign('link', $link);
        return $this->fetch();
    }

    /**
     * 编辑部门信息提交保存
     * @adminMenu(
     *     'name'   => '编辑部门信息提交保存',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑部门信息提交保存',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {
        $data      = $this->request->param();
        $linkModel = new DepartmentModel();
        $result    = $this->validate($data, 'Department');
        if ($result !== true) {
            $this->error($result);
        }
        $linkModel->allowField(true)->isUpdate(true)->save($data);

        $this->success("保存成功！", url("Department/index"));
    }

    /**
     * 删除部门信息
     * @adminMenu(
     *     'name'   => '删除部门信息',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除部门信息',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        DepartmentModel::destroy($id);
        $this->success("删除成功！", url("Department/index"));
    }



}