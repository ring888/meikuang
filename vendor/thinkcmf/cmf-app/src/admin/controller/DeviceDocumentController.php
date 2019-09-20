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

use app\admin\model\DeviceDocumentModel;
use app\portal\model\PortalDeviceDocumentCategoryModel;
class DeviceDocumentController extends AdminBaseController
{

    /**
     * 技术资料
     * @adminMenu(
     *     'name'   => '技术资料',
     *     'parent' => 'admin/Device/record',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '技术资料',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function index(){
        $id                 = $this->request->param('id');
        $filter = $this->request->param();
        $categoryIds = $this->request->param('category', 0, 'intval');
        $portalCategoryModel = new PortalDeviceDocumentCategoryModel();
        $categoryTree        = $portalCategoryModel->adminCategoryTree($categoryIds);
        $this->assign("category_tree",$categoryTree);
        $list        = Db::table("mk_device_document")
                            ->alias("a")
                            ->join('mk_portal_device_document_category b', 'a.document_type=b.id')
                            ->join('mk_device c', 'a.device_id=c.id')
                            
            ->where(function (Query $query) use ($filter) {

                $category = empty($filter['category']) ? 0 : $filter['category'];
                if(!empty($category)){
                    $query->where('a.document_type',$category);
                }
                $startTime = empty($filter['start_time']) ? 0 : strtotime($filter['start_time']);
                $endTime   = empty($filter['end_time']) ? 0 : strtotime($filter['end_time']);
                if (!empty($startTime)) {
                    $query->where('a.create_time', '>=', $startTime);
                }
                if (!empty($endTime)) {
                    $query->where('a.create_time', '<=', $endTime);
                }

                $keyword = empty($filter['keyword']) ? '' : $filter['keyword'];
                if (!empty($keyword)) {
                    $query->where('c.device_name|a.document_name', 'like', "%$keyword%");
                }
            })
            ->field("a.*,b.name as category_name,c.device_name")
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
        return $this->fetch();
    }
    public function document()
    {
        $id                 = $this->request->param('id');
        $roles = Db::table("mk_device_document")
                        ->alias("a")
                        ->join('mk_portal_device_document_category b', 'a.document_type=b.id')
                        ->where("a.device_id",$id)
                        ->field('a.*,b.name as category_name')
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
    public function document_add()
    {

        $id                 = $this->request->param('id');
        $order_goods = Db::table("mk_device")
                        ->alias("a")
                        ->join('mk_portal_device_category b', 'a.device_type=b.id')
                        
                        ->where("a.id",$id)
                        ->field('a.*,b.name')
                        ->order("a.id asc")
                        ->find();
        $portalCategoryModel = new PortalDeviceDocumentCategoryModel();
        $categoryTree        = $portalCategoryModel->adminCategoryTree();
        $this->assign("category_tree",$categoryTree);
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
        $portalCategoryModel = new PortalDeviceDocumentCategoryModel();
        $categoryTree        = $portalCategoryModel->adminCategoryTree();
        $this->assign("category_tree",$categoryTree);
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
    public function document_addPost()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();
            $tag = $this->request->param('tag', 0, 'intval');
            $items = array();
            $linkModel = new DeviceDocumentModel();
            if(count($data['file_urls'])>1){ 
                foreach($data['file_urls'] as $k=>$v){
                    $geshi = explode('.',$data['file_names'][$k]);
                    $item = [
                        "document_type" => $data['document_type'],
                        "document_file" => $data['file_urls'][$k],
                        "document_size" => $data['file_size'][$k],
                        "document_name" => $data['file_names'][$k],
                        "create_time"  => time(),
                        "remarks"       => $data['remarks'],
                        "device_id"    => $data['device_id'],
                        "geshi"         => $geshi[1],
                    ];
                    $items[] = $item;
                }
                $linkModel->allowField(true)->saveAll($items);
            }else{
                $geshi = explode('.',$data['file_names'][0]);
                $items = [
                    "document_type" => $data['document_type'],
                        "document_file" => $data['file_urls'][0],
                        "document_size" => $data['file_size'][0],
                        "document_name" => $data['file_names'][0],
                        "create_time"  => time(),
                        "remarks"       => $data['remarks'],
                        "device_id"    => $data['device_id'],
                        "geshi"         => $geshi[1],
                ];
                $linkModel->allowField(true)->save($items);
            }
            if($tag==0){
                $this->success("添加成功！", url("DeviceDocument/document",array('id'=>$data['device_id'])));
            }
            else{
                $this->success("添加成功！", url("DeviceDocument/index"));
            }
            //$this->success("添加成功！",url("DeviceDocument/document",array('id'=>$data['device_id'])));   
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
    public function document_edit()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_document")
                        ->alias("a")
                        ->join('mk_device b', 'a.device_id=b.id')
                        ->join('mk_portal_device_category c', 'b.device_type=c.id')
                        ->join('mk_portal_device_document_category d', 'a.document_type=d.id')
                        ->where("a.id",$id)
                        ->field('a.*,b.device_name,c.name as category_name,d.name as document_category')
                        ->order("a.id asc")
                        ->find();
                        $portalCategoryModel = new PortalDeviceDocumentCategoryModel();
                        $categoryTree        = $portalCategoryModel->adminCategoryTree($order_goods['document_type']);
                        $this->assign("category_tree",$categoryTree);  
         $this->assign("info",$order_goods);              
        return $this->fetch();
    }
    public function edit()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $order_goods = Db::table("mk_device_document")
                        ->alias("a")
                        ->join('mk_device b', 'a.device_id=b.id')
                        ->join('mk_portal_device_category c', 'b.device_type=c.id')
                        ->join('mk_portal_device_document_category d', 'a.document_type=d.id')
                        ->where("a.id",$id)
                        ->field('a.*,b.device_name,c.name as category_name,d.name as document_category')
                        ->order("a.id asc")
                        ->find();
                        $portalCategoryModel = new PortalDeviceDocumentCategoryModel();
                        $categoryTree        = $portalCategoryModel->adminCategoryTree($order_goods['document_type']);
                        $this->assign("category_tree",$categoryTree);  
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
    public function document_editPost()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();
            $tag = $this->request->param('tag', 0, 'intval');
            $items = array();
            $linkModel = new DeviceDocumentModel();
            $geshi = explode('.',$data['file_names'][0]);
            $items = [
                "id"    => $data['id'],
                "document_type" => $data['document_type'],
                    "document_file" => $data['file_urls'][0],
                    "document_size" => $data['file_size'][0],
                    "document_name" => $data['file_names'][0],
                    "create_time"  => time(),
                    "remarks"       => $data['remarks'],
                    "device_id"    => $data['device_id'],
                    "geshi"         => $geshi[1],
            ];
            $linkModel->allowField(true)->isUpdate(true)->save($items);
    
           // $this->success("保存成功！",url("DeviceDocument/document",array('id'=>$data['device_id'])));
           if($tag==0){
            $this->success("保存成功！", url("DeviceDocument/document",array('id'=>$data['device_id'])));
        }
        else{
            $this->success("保存成功！", url("DeviceDocument/index"));
        }
        }
    }

        /**
     * 查看
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
    public function document_delete()
    {
        $tag = $this->request->param('tag', 0, 'intval');
        $id = $this->request->param('id', 0, 'intval');
        $device_id = $this->request->param('device_id', 0, 'intval');
        DeviceDocumentModel::destroy($id);
        
        if($tag==0){
            $this->success("删除成功！", url("DeviceDocument/document",array('id'=>$device_id)));
        }
        else{
            $this->success("删除成功！", url("DeviceDocument/index"));
        }
    }

}