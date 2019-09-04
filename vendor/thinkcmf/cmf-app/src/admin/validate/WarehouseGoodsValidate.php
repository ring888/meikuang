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

class WarehouseGoodsValidate extends Validate
{
    protected $rule = [
        'warehouse' => 'require',
        'goods_name'  => 'require',
        'goods_type'  => 'require',
        'danwei'  => 'require',
        'goods_nums'  => 'require',
    ];

    protected $message = [
        'warehouse.require' => '仓库不能为空',
        'goods_name.require'  => '物品名称不能为空',
        'goods_type.require'  => '规格不能为空',
        'danwei.require'  => '单位不能为空',
        'goods_nums.require'  => '数量不能为空',
    ];

}