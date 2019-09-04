<?php
/**
 *  ==================================================================
 *        文 件 名: common.php
 *        概    要: 自定义函数
 *        作    者: IT小强
 *        创建时间: 2019-08-29 09:09
 *        修改时间:
 *        copyright (c) 2016 - 2019 mail@xqitw.cn
 *  ==================================================================
 */

if (!function_exists('getCkfinder')) {

    /**
     * @throws \Exception
     */
    function getCkfinder()
    {
        if (!class_exists(\itxq\ckfinder\CkFinder::class)) {
            require __DIR__ . '/vendor/autoload.php';
        }

        // 获取当前登录用户的ID
        $uid = session('ADMIN_ID');
        // 获取全部的权限目录
        $auth = config('ckfinder.');
        // 存储根路径
        $root = realpath(WEB_ROOT . 'upload') . DIRECTORY_SEPARATOR;
        // 当前权限可访问的路径
        $pre = '__' . md5('ckfinder') . '__';
        $url = str_replace($pre, '', cmf_get_image_url($pre));

        $ck = \itxq\ckfinder\CkFinder::ins()
            // 配置缓存目录
            ->setConfig('runtime_path', realpath(CMF_DATA . '/runtime') . DIRECTORY_SEPARATOR)
            // 授权信息
            ->setConfig('licenseName', 'licenseName')
            ->setConfig('licenseKey', 'licenseKey')
            // 是否自动重命名（用于过滤用户提交包含中文以及特殊字符，中文会自动转为拼音）
            ->setConfig('auto_rename', ['folder' => true, 'file' => true])
            // 设置PrivateDirKey （可用于区分不同用户的缓存目录，建议使用用户ID）
            ->setPrivateDirKey($uid)
            // 添加一个本地存储空间（添加多个存储空间时，name不可重复）
            ->addBackend('local', \itxq\ckfinder\CkFinder::ADAPTER_LOCAL, [
                // 以下根路径和URL前缀需根据自己项目进行调整
                'root'    => $root,
                'baseUrl' => $url
            ]);
        // 为本地存储空间添加资源目录（可添加多个）
        foreach ($auth as $k => $v) {
            if (!cmf_auth_check($uid, $k)) {
                continue;
            }
            $ck = $ck->addResource($v['title'], $v['name'], 'local');
        }
        $ck->run();
        exit('');
    }
}

