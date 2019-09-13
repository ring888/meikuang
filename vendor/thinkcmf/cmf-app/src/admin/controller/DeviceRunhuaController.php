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
use app\admin\model\DeviceRunhuaModel;
use app\admin\model\DeviceRunhuaPlanModel;
class DeviceRunhuaController extends AdminBaseController
{

    /**
     * 润滑记录
     * @adminMenu(
     *     'name'   => '润滑记录',
     *     'parent' => 'admin/Device/record',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '润滑记录',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function index(){
        $id                 = $this->request->param('id');
        $categoryIds = $this->request->param('category', 0, 'intval');
        $filter = $this->request->param();
        $list        = Db::table("mk_device_runhua")
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
                    $query->where('a.runhua_time', '>=', $startTime);
                }
                if (!empty($endTime)) {
                    $query->where('a.runhua_time', '<=', $endTime);
                }

                $keyword = empty($filter['keyword']) ? '' : $filter['keyword'];
                if (!empty($keyword)) {
                    $query->where('c.device_name|a.sn|a.runhua_worker', 'like', "%$keyword%");
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
    public function runhua()
    {
        $id                 = $this->request->param('id');
        $roles = Db::table("mk_device_runhua")
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
    public function runhua_add()
    {

        $id                 = $this->request->param('id');
        $plan_id = $this->request->param('plan_id');
        if(!empty($plan_id)){
            $this->assign("plan_id",$plan_id);
        }
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
    public function runhua_addPost()
    {
        if ($this->request->isPost()) {
            if ($this->request->isPost()) {
                $data      = $this->request->param();
                $data['create_time'] = time();
                $data['runhua_time'] = strtotime($data['runhua_time']);
                $linkModel = new DeviceRunhuaModel();
                if(isset($data['plan_id'])){
                    $data['runhua_type'] = "计划润滑";
                    if($linkModel->allowField(true)->save($data)){
                        $plan['last_runhua_time'] = $data['runhua_time'];
                        $plan['id'] = $data['plan_id'];
                        $planModel = new DeviceRunhuaPlanModel();
                        $planModel->allowField(true)->isUpdate(true)->save($plan);
                        $this->success("添加成功！",url("DeviceRunhuaPlan/plan",array('id'=>$data['device_id'])));
                    }
                }
                else{
                    $data['runhua_type'] = "常规润滑";
                    $linkModel->allowField(true)->save($data);
                    $this->success("添加成功！");
                }
                
                
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
    public function runhua_edit()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_runhua")
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
    public function runhua_editPost()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();
            $data['runhua_time'] = strtotime($data['runhua_time']);
            $linkModel = new DeviceRunhuaModel();
            $linkModel->allowField(true)->isUpdate(true)->save($data);
    
            $this->success("保存成功！");
        }
    }
    public function edit()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_runhua")
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
    public function runhua_show()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_runhua")
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
    public function runhua_delete()
    {
        $tag = $this->request->param('tag', 0, 'intval');
        $id = $this->request->param('id', 0, 'intval');
        $device_id = $this->request->param('device_id', 0, 'intval');
        DeviceRunhuaModel::destroy($id);
        if($tag==0){
            $this->success("删除成功！", url("DeviceRunhua/runhua",array('id'=>$device_id)));
        }
        else{
            $this->success("删除成功！", url("DeviceRunhua/index"));
        }
    }

}