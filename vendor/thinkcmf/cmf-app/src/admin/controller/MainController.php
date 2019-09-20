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
use app\admin\model\Menu;

class MainController extends AdminBaseController
{

    /**
     *  后台欢迎页
     */
    public function index()
    {
        
        $maintain_list = Db::query("select * from  mk_device_maintain_plan  where  last_maintain_time+period_count*24*60*60<unix_timestamp()");
        $repair_list =  Db::query("select * from  mk_device_repair_plan  where  last_repair_time+period_count*24*60*60<unix_timestamp()");
        $runhua_list =  Db::query("select * from  mk_device_runhua_plan  where  last_runhua_time+period_count*24*60*60<unix_timestamp()");

        $this->assign("maintain_list",$maintain_list);
        $this->assign("repair_list",$repair_list);
        $this->assign("runhua_list",$runhua_list);
        return $this->fetch();
    }

    public function dashboardWidget()
    {
        $dashboardWidgets = [];
        $widgets          = $this->request->param('widgets/a');
        if (!empty($widgets)) {
            foreach ($widgets as $widget) {
                if ($widget['is_system']) {
                    array_push($dashboardWidgets, ['name' => $widget['name'], 'is_system' => 1]);
                } else {
                    array_push($dashboardWidgets, ['name' => $widget['name'], 'is_system' => 0]);
                }
            }
        }

        cmf_set_option('admin_dashboard_widgets', $dashboardWidgets, true);

        $this->success('更新成功!');

    }

}
