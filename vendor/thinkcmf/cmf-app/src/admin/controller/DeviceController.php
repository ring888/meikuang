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
use app\admin\model\DeviceModel;
use app\admin\model\DeviceTroubleModel;
use app\portal\model\PortalDeviceCategoryModel;
class DeviceController extends AdminBaseController
{

    /**
     * 设备管理
     * @adminMenu(
     *     'name'   => '设备管理',
     *     'parent' => 'admin/Device/basicinfo',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '设备管理',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $categoryIds = $this->request->param('category', 0, 'intval');
        $status = $this->request->param('status', 0, 'intval');
        $goods = Db::table('mk_device')
            ->alias('a')
            ->join('mk_device_status b', 'a.status=b.id')
            ->join('mk_portal_device_category c', 'a.device_type=c.id')
            ->where(function (Query $query) use($categoryIds,$status) {
                $param = $this->request->param();
                if (!empty($param['keyword'])) {
                    $keyword = $param['keyword'];
                    $query->where('a.device_name|a.device_location|a.device_detail', 'like', "%$keyword%");
                }
                
                if ($categoryIds > 0) {
                    $query->where('a.device_type', $categoryIds);
                }

                if ($status > 0) {
                    $query->where('a.status', $status);
                }
            })
            ->field('a.*,b.name,c.name as device_category')
            ->order("a.id DESC")
            ->paginate(10);

        
        $portalCategoryModel = new PortalDeviceCategoryModel();
        $categoryTree        = $portalCategoryModel->adminCategoryTree($categoryIds);
        $warehouse = Db::name('device_status')->select();
        $this->assign('device_status', $warehouse);
        $this->assign('category', $categoryIds);
        $this->assign('status', $status);
        $this->assign('list', $goods);
        $this->assign('page', $goods->render());
        $this->assign('category_tree', $categoryTree);
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

        $roles = Db::name('device_status')->order("id asc")->select();
        $this->assign("device_status", $roles);

        $department = Db::name('department')->order("id asc")->select();
        $this->assign("department", $department);

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
            $linkModel = new DeviceModel();
            $result    = $this->validate($data, 'Device');
            if ($result !== true) {
                $this->error($result);
            }
            $linkModel->allowField(true)->save($data);
            $this->success("添加成功！", url("Device/index"));
            
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
       
        $status = Db::name('device_status')->select();
        $this->assign("device_status",$status);
        $department = Db::name('department')->order("id asc")->select();
        $this->assign("department", $department);
        $order_goods = Db::table("mk_device")
                        ->alias("a")
                        ->join('mk_portal_device_category b', 'a.device_type=b.id')
                        ->where("a.id",$id)
                        ->field('a.*,b.name')
                        ->order("a.id asc")
                        ->find();
               
         $this->assign("device",$order_goods);           
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
            $linkModel = new DeviceModel();
            $result    = $this->validate($data, 'Device');
            if ($result !== true) {
                $this->error($result);
            }
            $linkModel->allowField(true)->isUpdate(true)->save($data);
    
            $this->success("保存成功！", url("Device/index"));
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
        DeviceModel::destroy($id);
        $this->success("删除成功！", url("Device/index"));
    }

          /**
     * 入库信息物品选择框
     * @adminMenu(
     *     'name'   => '入库信息物品选择框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '入库信息物品选择框',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function select_device()
    {
        $ids                 = $this->request->param('ids');
        
        $categoryIds = $this->request->param('category', 0, 'intval');
        $portalCategoryModel = new PortalDeviceCategoryModel();
        $categoryTree        = $portalCategoryModel->adminCategoryTree($categoryIds);
        
        $this->assign('category_tree', $categoryTree);

        $goods = Db::table('mk_device')
            ->alias('a')
            ->join('mk_portal_device_category b', 'a.device_type=b.id')
            ->where(function (Query $query) {
                $param = $this->request->param();
                if (!empty($param['keyword'])) {
                    $keyword = $param['keyword'];
                    $query->where('a.device_name|a.device_location|a.device_detail', 'like', "%$keyword%");
                }
                $categoryId = $this->request->param('category', 0, 'intval');
                if ($categoryId > 0) {
                    $query->where('a.device_type', $categoryId);
                }
            })
            ->field('a.*,b.name as device_type_category')
            ->order("a.id DESC")
            ->paginate(10);
        $this->assign('category', $categoryIds);
        $this->assign('list', $goods);
        $this->assign('page', $goods->render());
        return $this->fetch();
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
        $info = Db::name("warehouse_order")->where("id",$ids)->find();
        $this->assign("info",$info);

        $order_goods = Db::table("mk_warehouse_order_goods")
        ->alias("a")
        ->join('mk_warehouse_goods b', 'a.goods_id=b.id')
        ->join('mk_warehouse c', 'b.warehouse=c.id')
        ->where("a.order_id",$ids)
        ->field('a.*,b.goods_name,b.goods_no,b.danwei,c.wh_name')
        ->order("a.id asc")
        ->select();       
        $this->assign("order_goods",$order_goods);           
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
        $id                 = $this->request->param('id');
        $order_goods = Db::table("mk_device")
                        ->alias("a")
                        ->join('mk_portal_device_category b', 'a.device_type=b.id')
                        ->join('mk_device_status c', 'a.status=c.id')
                        ->where("a.id",$id)
                        ->field('a.*,b.name,c.name as device_status')
                        ->order("a.id asc")
                        ->find();
               
         $this->assign("info",$order_goods);                  
        return $this->fetch();
    }

        /**
     * 故障记录
     * @adminMenu(
     *     'name'   => '故障记录',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '故障记录',
     *     'param'  => ''
     * )
     */
    public function trouble()
    {
        $id                 = $this->request->param('id');
        $roles = Db::table("mk_device_trouble")
                        ->alias("a")
                        ->join('mk_department b', 'a.department=b.id')
                        ->where("a.device_id",$id)
                        ->field('a.*,b.name as department_name')
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
     * 故障新增
     * @adminMenu(
     *     'name'   => '故障新增',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '故障新增',
     *     'param'  => ''
     * )
     */
    public function trouble_add()
    {

        //$roles = Db::name('device_status')->order("id asc")->select();
        //$this->assign("device_status", $roles);
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
     * 故障提交
     * @adminMenu(
     *     'name'   => '故障提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '故障提交',
     *     'param'  => ''
     * )
     */
    public function trouble_addPost()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();
            $data['create_time'] = time();
            $data['trouble_start_time'] = strtotime($data['trouble_start_time']);
            $linkModel = new DeviceTroubleModel();
            
            $linkModel->allowField(true)->save($data);
            $this->success("添加成功！");
            
        }
    }

    /**
     * 故障记录编辑
     * @adminMenu(
     *     'name'   => '故障记录编辑',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '故障记录编辑',
     *     'param'  => ''
     * )
     */
    public function trouble_edit()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_trouble")
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
     * 故障编辑提交
     * @adminMenu(
     *     'name'   => '故障编辑提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑提交',
     *     'param'  => ''
     * )
     */
    public function trouble_editPost()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();
            $data['trouble_start_time'] = strtotime($data['trouble_start_time']);
            $linkModel = new DeviceTroubleModel();
            $linkModel->allowField(true)->isUpdate(true)->save($data);
    
            $this->success("保存成功！");
        }
    }

        /**
     * 故障记录查看
     * @adminMenu(
     *     'name'   => '故障记录查看',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '故障记录查看',
     *     'param'  => ''
     * )
     */
    public function trouble_show()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_trouble")
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
     * 故障记录删除
     * @adminMenu(
     *     'name'   => '故障记录删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '故障记录删除',
     *     'param'  => ''
     * )
     */
    public function trouble_delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        $device_id = $this->request->param('device_id', 0, 'intval');
        DeviceTroubleModel::destroy($id);
        $this->success("删除成功！", url("Device/trouble",array('id'=>$device_id)));
    }

}