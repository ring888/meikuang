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
namespace app\admin\validate;

use think\Validate;

class WarehouseValidate extends Validate
{
    protected $rule = [
        'wh_name' => 'require',
        'wh_fzr'  => 'require',
        'wh_code'  => 'require',
    ];

    protected $message = [
        'wh_name.require' => '名称不能为空',
        'wh_fzr.require'  => '负责人不能为空',
        'wh_code.require'  => '仓库编号不能为空',
    ];

}