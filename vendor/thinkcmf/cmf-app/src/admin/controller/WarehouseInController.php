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


class WarehouseInController extends AdminBaseController
{

    /**
     * 入库管理
     * @adminMenu(
     *     'name'   => '入库管理',
     *     'parent' => 'admin/WarehouseEx/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '入库管理',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function index()
    {
        /**搜索条件**/
        $sn = $this->request->param('sn');
        $creater = $this->request->param('creater');

        $order = Db::name('warehouse_order')
            ->where("type",2)
            ->where(function (Query $query) use ($sn, $creater) {
                if ($sn) {
                    $query->where('sn', 'like', "%$sn%");
                }

                if ($creater) {
                    $query->where('creater', 'like', "%$creater%");
                }
            })
            ->order("id DESC")
            ->paginate(10);
        $order->appends(['sn' => $sn, 'creater' => $creater]);
        // 获取分页显示
        $page = $order->render();
        $this->assign("page", $page);
        $this->assign("list", $order);
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

        $admins = Db::name('user')->where('user_type',1)->where('user_status',1)->select();
        $this->assign("admins",$admins);
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
            //$linkModel = new WarehouseGoodsModel();
            $result    = $this->validate($data, 'WarehouseEx');
            if ($result !== true) {
                $this->error($result);
            }

            $order = [
                'sn' => $data['sn'],
                'creater' => $data['creater'],
                'warehouse' => $data['warehouse'],
                'remarks'   => $data['remarks'],
                'type'      => 2,
                'create_time' => time(),
            ];
            $result = Db::name('warehouse_order')->insertGetId($order);
            if($result>0){
                foreach ($data['goods'] as $k=>$v) {
                    //id更新产品数量
                    $goods = Db::name('warehouse_goods')->where("id",$v)->find();
                    if(!empty($goods)){
                        Db::name('warehouse_goods')->where("id",$v)->setDec("goods_nums",$data['num'][$k]);

                        $goods_order = [
                            'goods_id' => $v,
                            'order_id' => $result,
                            'nums'     => $data['num'][$k],
                        ];
                        Db::name('warehouse_order_goods')->insert($goods_order);
                    }
                    else{
                        $this->error("提交失败");
                    }
                }
                $this->success("添加成功！", url("WarehouseEx/index"));
            }
            else{
                $this->error("提交失败");
            }
            
        }
    }

    /**
     * 入库信息编辑
     * @adminMenu(
     *     'name'   => '入库信息编辑',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '入库信息编辑',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $id    = $this->request->param('id', 0, 'intval');
        $roles = Db::name('warehouse')->order("id asc")->select();
        $this->assign("whouse", $roles);

        $admins = Db::name('user')->where('user_type',1)->where('user_status',1)->select();
        $this->assign("admins",$admins);

        $order = Db::name('warehouse_order')->where("id",$id)->find();
        $this->assign($order);

        $order_goods = Db::table("mk_warehouse_order_goods")
                        ->alias("a")
                        ->join('mk_warehouse_goods b', 'a.goods_id=b.id')
                        ->where("a.order_id",$id)
                        ->field('a.*,b.goods_name')
                        ->order("a.id asc")
                        ->select();       
         $this->assign("order_goods",$order_goods);           
        return $this->fetch();
    }

    /**
     * 入库信息编辑提交
     * @adminMenu(
     *     'name'   => '入库信息编辑提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '入库信息编辑提交',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {
        if ($this->request->isPost()) {
            $id    = $this->request->param('id', 0, 'intval');
            $data      = $this->request->param();
            $result    = $this->validate($data, 'WarehouseEx');
            if ($result !== true) {
                $this->error($result);
            }

            $order = [
                'sn' => $data['sn'],
                'creater' => $data['creater'],
                'warehouse' => $data['warehouse'],
                'remarks'   => $data['remarks'],
                'type'      => 2,
                'create_time' => time(),
            ];
            $result = Db::name('warehouse_order')->save($order);
            if($result>0){

                $old_data = Db::name('warehouse_order_goods')->where("order_id",$id)->select();
                foreach($old_data as $k=>$v){
                    //删除商品订单记录前，先把商品数量加上
                    Db::name('warehouse_goods')->where("id",$v['goods_id'])->setInc("goods_nums",$v['nums']);

                }
                //删除商品记录
                Db::name('warehouse_order_goods')->where("order_id",$id)->delete();
                //然后再插入更新的数据
                foreach ($data['goods'] as $k=>$v) {
                    //id更新产品数量
                    $goods = Db::name('warehouse_goods')->where("id",$v)->find();
                    if(!empty($goods)){
                        Db::name('warehouse_goods')->where("id",$v)->setDec("goods_nums",$data['num'][$k]);

                        $goods_order = [
                            'goods_id' => $v,
                            'order_id' => $result,
                            'nums'     => $data['num'][$k],
                        ];
                        Db::name('warehouse_order_goods')->insert($goods_order);
                        $this->success("更新成功！", url("WarehouseEx/index"));
                    }
                    else{
                        $this->error("提交失败");
                    }
                }
            }
            else{
                $this->error("提交失败");
            }
            
        }
    }


    /**
     * 入库信息删除
     * @adminMenu(
     *     'name'   => '入库信息删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '入库信息删除',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        
        if (Db::name('user')->delete($id) !== false) {
            Db::name("RoleUser")->where("user_id", $id)->delete();
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
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
    public function select()
    {
        $ids                 = $this->request->param('ids');
        
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

}