<?php
/**
 *  ==================================================================
 *        文 件 名: Index.php
 *        概    要:
 *        作    者: IT小强
 *        创建时间: 2019-08-28 18:29
 *        修改时间:
 *        copyright (c) 2016 - 2019 mail@xqitw.cn
 *  ==================================================================
 */

namespace app\ckfinder\controller;

use cmf\controller\AdminBaseController;

class IndexController extends AdminBaseController
{
    /**
     * page
     * @return mixed
     */
    public function index()
    {
        
        $assign = ['ckfinder_url' => url('ckfinder')];
        $this->assign($assign);
        return $this->fetch(__DIR__ . '/../view/ckfinder.html');
    }

    /**
     * API
     * @throws \Exception
     */
    public function ckfinder()
    {
        getCkfinder();
    }
}