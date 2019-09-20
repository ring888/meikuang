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
class DeviceAlertController extends AdminBaseController
{

    /**
     * 保养预警记录
     * @adminMenu(
     *     'name'   => '保养预警记录',
     *     'parent' => 'admin/Device/alert',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '保养预警记录',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function maintain(){
        
        $list        = Db::table("mk_device_maintain_plan")
                    ->alias("a")
                    ->join('mk_device b', 'a.device_id=b.id')
                    ->where("a.last_maintain_time+a.period_count*24*60*60<unix_timestamp()")
            ->field("a.*,b.device_name")
            ->order('a.id', 'DESC')
            ->paginate(10);
        
        // 获取分页显示
        $page = $list->render();
        $this->assign("page",$page);
        $this->assign("list", $list);
        return $this->fetch();
        
    }
    /**
     * 维修预警记录
     * @adminMenu(
     *     'name'   => '维修预警记录',
     *     'parent' => 'admin/Device/alert',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '维修预警记录',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function repair(){
        $list        = Db::table("mk_device_repair_plan")
                    ->alias("a")
                    ->join('mk_device b', 'a.device_id=b.id')
                    ->where("a.last_repair_time+a.period_count*24*60*60<unix_timestamp()")
            ->field("a.*,b.device_name")
            ->order('a.id', 'DESC')
            ->paginate(10);
        
        // 获取分页显示
        $page = $list->render();
        $this->assign("page",$page);
        $this->assign("list", $list);
        return $this->fetch();
    }

    /**
     * 润滑预警记录
     * @adminMenu(
     *     'name'   => '润滑预警记录',
     *     'parent' => 'admin/Device/alert',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '润滑预警记录',
     *     'param'  => ''
     * )
     * @throws \think\exception\DbException
     */
    public function runhua(){
        $list        = Db::table("mk_device_runhua_plan")
                    ->alias("a")
                    ->join('mk_device b', 'a.device_id=b.id')
                    ->where("a.last_runhua_time+a.period_count*24*60*60<unix_timestamp()")
            ->field("a.*,b.device_name")
            ->order('a.id', 'DESC')
            ->paginate(10);
        
        // 获取分页显示
        $page = $list->render();
        $this->assign("page",$page);
        $this->assign("list", $list);
        return $this->fetch();
    }
     

}