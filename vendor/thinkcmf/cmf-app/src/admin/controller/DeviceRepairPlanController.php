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
use app\admin\model\DeviceRepairPlanModel;
class DeviceRepairPlanController extends AdminBaseController
{

    /**
     * 检修计划
     * @adminMenu(
     *     'name'   => '检修计划',
     *     'parent' => 'admin/Device/record',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '检修计划',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function index(){

    }
    public function plan()
    {
        $id                 = $this->request->param('id');
        $roles = Db::table("mk_device_repair_plan")
                        ->alias("a")
                        ->join('mk_department b', 'a.department=b.id')
                        ->join('mk_device c', 'a.device_id=c.id')
                        ->where("a.device_id",$id)
                        ->field('a.*,b.name as department_name,c.device_name')
                        ->order("a.id asc")
                        ->paginate(10);
                        // 获取分页显示
                        $page = $roles->render();
        $this->assign("page",$page);
        $this->assign("list", $roles);
        $this->assign("device_id",$id);
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
    public function plan_add()
    {

        $id                 = $this->request->param('id');
        $order_goods = Db::table("mk_device")
                        ->alias("a")
                        ->join('mk_portal_device_category b', 'a.device_type=b.id')
                        
                        ->where("a.id",$id)
                        ->field('a.*,b.name')
                        ->order("a.id asc")
                        ->find();
        $department = Db::name('department')->order("id asc")->select();
        $this->assign("department", $department);      
         $this->assign("info",$order_goods);     
        return $this->fetch();
    }

        /**
     * 提交
     * @adminMenu(
     *     'name'   => '提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '提交',
     *     'param'  => ''
     * )
     */
    public function plan_addPost()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();
            $data['create_time'] = time();
            $data['last_repair_time'] = strtotime($data['last_repair_time']);
            $linkModel = new DeviceRepairPlanModel();
            
            $linkModel->allowField(true)->save($data);
            $this->success("添加成功！");
            
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
    public function plan_edit()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_repair_plan")
                        ->alias("a")
                        ->join('mk_device b', 'a.device_id=b.id')
                        ->join('mk_portal_device_category c', 'b.device_type=c.id')
                        
                        ->where("a.id",$id)
                        ->field('a.*,b.device_name,c.name as category_name')
                        ->order("a.id asc")
                        ->find();
        $department = Db::name('department')->order("id asc")->select();
        $this->assign("department", $department);      
         $this->assign("info",$order_goods);              
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
     *     'remark' => '提交',
     *     'param'  => ''
     * )
     */
    public function plan_editPost()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();
            $data['last_repair_time'] = strtotime($data['last_repair_time']);
            $linkModel = new DeviceRepairPlanModel();
            $linkModel->allowField(true)->isUpdate(true)->save($data);
    
            $this->success("保存成功！");
        }
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
     */
    public function plan_show()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_repair_plan")
                        ->alias("a")
                        ->join('mk_device b', 'a.device_id=b.id')
                        ->join('mk_portal_device_category c', 'b.device_type=c.id')
                        
                        ->where("a.id",$id)
                        ->field('a.*,b.device_name,c.name as category_name')
                        ->order("a.id asc")
                        ->find();
        $department = Db::name('department')->order("id asc")->select();
        $this->assign("department", $department);      
         $this->assign("info",$order_goods);              
        return $this->fetch();
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
    public function plan_delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        $device_id = $this->request->param('device_id', 0, 'intval');
        DeviceRepairPlanModel::destroy($id);
        $this->success("删除成功！", url("DeviceRepairPlan/plan",array('id'=>$device_id)));
    }

}