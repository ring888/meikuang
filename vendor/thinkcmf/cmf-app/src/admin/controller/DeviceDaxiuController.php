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
use app\admin\model\DeviceDaxiuModel;
use app\portal\model\PortalDeviceCategoryModel;
class DeviceDaxiuController extends AdminBaseController
{

    /**
     * 大修记录
     * @adminMenu(
     *     'name'   => '大修记录',
     *     'parent' => 'admin/Device/record',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '大修记录',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function index(){
        $id                 = $this->request->param('id');
        $categoryIds = $this->request->param('category', 0, 'intval');
        $filter = $this->request->param();
        $list        = Db::table("mk_device_daxiu")
                            ->alias("a")
                            ->join('mk_department b', 'a.department=b.id')
                            ->join('mk_device c', 'a.device_id=c.id')
            ->where(function (Query $query) use ($filter) {

                $category = empty($filter['category']) ? 0 : $filter['category'];
                if(!empty($category)){
                    $query->where('a.department',$category);
                }
                
                $startTime = empty($filter['start_time']) ? 0 : strtotime($filter['start_time']);
                $endTime   = empty($filter['end_time']) ? 0 : strtotime($filter['end_time']);
                if (!empty($startTime)) {
                    $query->where('a.repair_time', '>=', $startTime);
                }
                if (!empty($endTime)) {
                    $query->where('a.repair_time', '<=', $endTime);
                }

                $keyword = empty($filter['keyword']) ? '' : $filter['keyword'];
                if (!empty($keyword)) {
                    $query->where('c.device_name|a.sn|a.worker_name', 'like', "%$keyword%");
                }
            })
            ->field("a.*,b.name as department_name,c.device_name")
            ->order('a.id', 'DESC')
            ->paginate(10);

       
        // 获取分页显示
        $page = $list->render();
        $this->assign("page",$page);
        $this->assign("list", $list);
        $this->assign('category', $categoryIds);
        $this->assign('start_time', isset($filter['start_time']) ? $filter['start_time'] : '');
        $this->assign('end_time', isset($filter['end_time']) ? $filter['end_time'] : '');
        $this->assign('keyword', isset($filter['keyword']) ? $filter['keyword'] : '');
        $department = Db::name('department')->order("id asc")->select();
        $this->assign("department", $department);
        return $this->fetch();
    }
    public function daxiu()
    {
        $id                 = $this->request->param('id');
        $roles = Db::table("mk_device_daxiu")
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
    public function daxiu_add()
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

    public function add(){
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
    public function daxiu_addPost()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();
            $data['create_time'] = time();
            $data['repair_time'] = strtotime($data['repair_time']);
            $linkModel = new DeviceDaxiuModel();
            
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
    public function daxiu_edit()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_daxiu")
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
    public function edit()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_daxiu")
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
    public function daxiu_editPost()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();
            $data['repair_time'] = strtotime($data['repair_time']);
            $linkModel = new DeviceDaxiuModel();
            $linkModel->allowField(true)->isUpdate(true)->save($data);
    
            $this->success("保存成功！");
        }
    }

        /**
     * 记录查看
     * @adminMenu(
     *     'name'   => '记录查看',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '记录查看',
     *     'param'  => ''
     * )
     */
    public function daxiu_show()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_daxiu")
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
     * 记录删除
     * @adminMenu(
     *     'name'   => '记录删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '记录删除',
     *     'param'  => ''
     * )
     */
    public function daxiu_delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        $tag = $this->request->param('tag', 0, 'intval');

        $device_id = $this->request->param('device_id', 0, 'intval');
        DeviceDaxiuModel::destroy($id);
        if($tag>0){
            $this->success("删除成功！", url("DeviceDaxiu/index"));
        }
        else{
            $this->success("删除成功！", url("DeviceDaxiu/daxiu",array('id'=>$device_id)));
        }
        
    }

}