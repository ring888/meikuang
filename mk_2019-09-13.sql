# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.23)
# Database: mk
# Generation Time: 2019-09-13 13:05:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table mk_admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_admin_menu`;

CREATE TABLE `mk_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

LOCK TABLES `mk_admin_menu` WRITE;
/*!40000 ALTER TABLE `mk_admin_menu` DISABLE KEYS */;

INSERT INTO `mk_admin_menu` (`id`, `parent_id`, `type`, `status`, `list_order`, `app`, `controller`, `action`, `param`, `name`, `icon`, `remark`)
VALUES
	(1,0,0,1,20,'admin','Plugin','default','','插件中心','cloud','插件中心'),
	(2,1,1,1,10000,'admin','Hook','index','','钩子管理','','钩子管理'),
	(3,2,1,0,10000,'admin','Hook','plugins','','钩子插件管理','','钩子插件管理'),
	(4,2,2,0,10000,'admin','Hook','pluginListOrder','','钩子插件排序','','钩子插件排序'),
	(5,2,1,0,10000,'admin','Hook','sync','','同步钩子','','同步钩子'),
	(6,0,0,1,0,'admin','Setting','default','','设置','cogs','系统设置入口'),
	(7,6,1,1,50,'admin','Link','index','','友情链接','','友情链接管理'),
	(8,7,1,0,10000,'admin','Link','add','','添加友情链接','','添加友情链接'),
	(9,7,2,0,10000,'admin','Link','addPost','','添加友情链接提交保存','','添加友情链接提交保存'),
	(10,7,1,0,10000,'admin','Link','edit','','编辑友情链接','','编辑友情链接'),
	(11,7,2,0,10000,'admin','Link','editPost','','编辑友情链接提交保存','','编辑友情链接提交保存'),
	(12,7,2,0,10000,'admin','Link','delete','','删除友情链接','','删除友情链接'),
	(13,7,2,0,10000,'admin','Link','listOrder','','友情链接排序','','友情链接排序'),
	(14,7,2,0,10000,'admin','Link','toggle','','友情链接显示隐藏','','友情链接显示隐藏'),
	(15,6,1,1,10,'admin','Mailer','index','','邮箱配置','','邮箱配置'),
	(16,15,2,0,10000,'admin','Mailer','indexPost','','邮箱配置提交保存','','邮箱配置提交保存'),
	(17,15,1,0,10000,'admin','Mailer','template','','邮件模板','','邮件模板'),
	(18,15,2,0,10000,'admin','Mailer','templatePost','','邮件模板提交','','邮件模板提交'),
	(19,15,1,0,10000,'admin','Mailer','test','','邮件发送测试','','邮件发送测试'),
	(20,6,1,0,10000,'admin','Menu','index','','后台菜单','','后台菜单管理'),
	(21,20,1,0,10000,'admin','Menu','lists','','所有菜单','','后台所有菜单列表'),
	(22,20,1,0,10000,'admin','Menu','add','','后台菜单添加','','后台菜单添加'),
	(23,20,2,0,10000,'admin','Menu','addPost','','后台菜单添加提交保存','','后台菜单添加提交保存'),
	(24,20,1,0,10000,'admin','Menu','edit','','后台菜单编辑','','后台菜单编辑'),
	(25,20,2,0,10000,'admin','Menu','editPost','','后台菜单编辑提交保存','','后台菜单编辑提交保存'),
	(26,20,2,0,10000,'admin','Menu','delete','','后台菜单删除','','后台菜单删除'),
	(27,20,2,0,10000,'admin','Menu','listOrder','','后台菜单排序','','后台菜单排序'),
	(28,20,1,0,10000,'admin','Menu','getActions','','导入新后台菜单','','导入新后台菜单'),
	(29,6,1,1,30,'admin','Nav','index','','导航管理','','导航管理'),
	(30,29,1,0,10000,'admin','Nav','add','','添加导航','','添加导航'),
	(31,29,2,0,10000,'admin','Nav','addPost','','添加导航提交保存','','添加导航提交保存'),
	(32,29,1,0,10000,'admin','Nav','edit','','编辑导航','','编辑导航'),
	(33,29,2,0,10000,'admin','Nav','editPost','','编辑导航提交保存','','编辑导航提交保存'),
	(34,29,2,0,10000,'admin','Nav','delete','','删除导航','','删除导航'),
	(35,29,1,0,10000,'admin','NavMenu','index','','导航菜单','','导航菜单'),
	(36,35,1,0,10000,'admin','NavMenu','add','','添加导航菜单','','添加导航菜单'),
	(37,35,2,0,10000,'admin','NavMenu','addPost','','添加导航菜单提交保存','','添加导航菜单提交保存'),
	(38,35,1,0,10000,'admin','NavMenu','edit','','编辑导航菜单','','编辑导航菜单'),
	(39,35,2,0,10000,'admin','NavMenu','editPost','','编辑导航菜单提交保存','','编辑导航菜单提交保存'),
	(40,35,2,0,10000,'admin','NavMenu','delete','','删除导航菜单','','删除导航菜单'),
	(41,35,2,0,10000,'admin','NavMenu','listOrder','','导航菜单排序','','导航菜单排序'),
	(42,1,1,1,10000,'admin','Plugin','index','','插件列表','','插件列表'),
	(43,42,2,0,10000,'admin','Plugin','toggle','','插件启用禁用','','插件启用禁用'),
	(44,42,1,0,10000,'admin','Plugin','setting','','插件设置','','插件设置'),
	(45,42,2,0,10000,'admin','Plugin','settingPost','','插件设置提交','','插件设置提交'),
	(46,42,2,0,10000,'admin','Plugin','install','','插件安装','','插件安装'),
	(47,42,2,0,10000,'admin','Plugin','update','','插件更新','','插件更新'),
	(48,42,2,0,10000,'admin','Plugin','uninstall','','卸载插件','','卸载插件'),
	(49,110,0,1,10000,'admin','User','default','','管理组','','管理组'),
	(50,49,1,1,10000,'admin','Rbac','index','','角色管理','','角色管理'),
	(51,50,1,0,10000,'admin','Rbac','roleAdd','','添加角色','','添加角色'),
	(52,50,2,0,10000,'admin','Rbac','roleAddPost','','添加角色提交','','添加角色提交'),
	(53,50,1,0,10000,'admin','Rbac','roleEdit','','编辑角色','','编辑角色'),
	(54,50,2,0,10000,'admin','Rbac','roleEditPost','','编辑角色提交','','编辑角色提交'),
	(55,50,2,0,10000,'admin','Rbac','roleDelete','','删除角色','','删除角色'),
	(56,50,1,0,10000,'admin','Rbac','authorize','','设置角色权限','','设置角色权限'),
	(57,50,2,0,10000,'admin','Rbac','authorizePost','','角色授权提交','','角色授权提交'),
	(58,0,1,0,10001,'admin','RecycleBin','index','','回收站','','回收站'),
	(59,58,2,0,10000,'admin','RecycleBin','restore','','回收站还原','','回收站还原'),
	(60,58,2,0,10000,'admin','RecycleBin','delete','','回收站彻底删除','','回收站彻底删除'),
	(61,6,1,1,10000,'admin','Route','index','','URL美化','','URL规则管理'),
	(62,61,1,0,10000,'admin','Route','add','','添加路由规则','','添加路由规则'),
	(63,61,2,0,10000,'admin','Route','addPost','','添加路由规则提交','','添加路由规则提交'),
	(64,61,1,0,10000,'admin','Route','edit','','路由规则编辑','','路由规则编辑'),
	(65,61,2,0,10000,'admin','Route','editPost','','路由规则编辑提交','','路由规则编辑提交'),
	(66,61,2,0,10000,'admin','Route','delete','','路由规则删除','','路由规则删除'),
	(67,61,2,0,10000,'admin','Route','ban','','路由规则禁用','','路由规则禁用'),
	(68,61,2,0,10000,'admin','Route','open','','路由规则启用','','路由规则启用'),
	(69,61,2,0,10000,'admin','Route','listOrder','','路由规则排序','','路由规则排序'),
	(70,61,1,0,10000,'admin','Route','select','','选择URL','','选择URL'),
	(71,6,1,1,0,'admin','Setting','site','','网站信息','','网站信息'),
	(72,71,2,0,10000,'admin','Setting','sitePost','','网站信息设置提交','','网站信息设置提交'),
	(73,6,1,0,10000,'admin','Setting','password','','密码修改','','密码修改'),
	(74,73,2,0,10000,'admin','Setting','passwordPost','','密码修改提交','','密码修改提交'),
	(75,6,1,1,10000,'admin','Setting','upload','','上传设置','','上传设置'),
	(76,75,2,0,10000,'admin','Setting','uploadPost','','上传设置提交','','上传设置提交'),
	(77,6,1,0,10000,'admin','Setting','clearCache','','清除缓存','','清除缓存'),
	(78,6,1,1,40,'admin','Slide','index','','幻灯片管理','','幻灯片管理'),
	(79,78,1,0,10000,'admin','Slide','add','','添加幻灯片','','添加幻灯片'),
	(80,78,2,0,10000,'admin','Slide','addPost','','添加幻灯片提交','','添加幻灯片提交'),
	(81,78,1,0,10000,'admin','Slide','edit','','编辑幻灯片','','编辑幻灯片'),
	(82,78,2,0,10000,'admin','Slide','editPost','','编辑幻灯片提交','','编辑幻灯片提交'),
	(83,78,2,0,10000,'admin','Slide','delete','','删除幻灯片','','删除幻灯片'),
	(84,78,1,0,10000,'admin','SlideItem','index','','幻灯片页面列表','','幻灯片页面列表'),
	(85,84,1,0,10000,'admin','SlideItem','add','','幻灯片页面添加','','幻灯片页面添加'),
	(86,84,2,0,10000,'admin','SlideItem','addPost','','幻灯片页面添加提交','','幻灯片页面添加提交'),
	(87,84,1,0,10000,'admin','SlideItem','edit','','幻灯片页面编辑','','幻灯片页面编辑'),
	(88,84,2,0,10000,'admin','SlideItem','editPost','','幻灯片页面编辑提交','','幻灯片页面编辑提交'),
	(89,84,2,0,10000,'admin','SlideItem','delete','','幻灯片页面删除','','幻灯片页面删除'),
	(90,84,2,0,10000,'admin','SlideItem','ban','','幻灯片页面隐藏','','幻灯片页面隐藏'),
	(91,84,2,0,10000,'admin','SlideItem','cancelBan','','幻灯片页面显示','','幻灯片页面显示'),
	(92,84,2,0,10000,'admin','SlideItem','listOrder','','幻灯片页面排序','','幻灯片页面排序'),
	(93,6,1,1,10000,'admin','Storage','index','','文件存储','','文件存储'),
	(94,93,2,0,10000,'admin','Storage','settingPost','','文件存储设置提交','','文件存储设置提交'),
	(95,6,1,1,20,'admin','Theme','index','','模板管理','','模板管理'),
	(96,95,1,0,10000,'admin','Theme','install','','安装模板','','安装模板'),
	(97,95,2,0,10000,'admin','Theme','uninstall','','卸载模板','','卸载模板'),
	(98,95,2,0,10000,'admin','Theme','installTheme','','模板安装','','模板安装'),
	(99,95,2,0,10000,'admin','Theme','update','','模板更新','','模板更新'),
	(100,95,2,0,10000,'admin','Theme','active','','启用模板','','启用模板'),
	(101,95,1,0,10000,'admin','Theme','files','','模板文件列表','','启用模板'),
	(102,95,1,0,10000,'admin','Theme','fileSetting','','模板文件设置','','模板文件设置'),
	(103,95,1,0,10000,'admin','Theme','fileArrayData','','模板文件数组数据列表','','模板文件数组数据列表'),
	(104,95,2,0,10000,'admin','Theme','fileArrayDataEdit','','模板文件数组数据添加编辑','','模板文件数组数据添加编辑'),
	(105,95,2,0,10000,'admin','Theme','fileArrayDataEditPost','','模板文件数组数据添加编辑提交保存','','模板文件数组数据添加编辑提交保存'),
	(106,95,2,0,10000,'admin','Theme','fileArrayDataDelete','','模板文件数组数据删除','','模板文件数组数据删除'),
	(107,95,2,0,10000,'admin','Theme','settingPost','','模板文件编辑提交保存','','模板文件编辑提交保存'),
	(108,95,1,0,10000,'admin','Theme','dataSource','','模板文件设置数据源','','模板文件设置数据源'),
	(109,95,1,0,10000,'admin','Theme','design','','模板设计','','模板设计'),
	(110,0,0,1,10,'user','AdminIndex','default','','用户管理','group','用户管理'),
	(111,49,1,1,10000,'admin','User','index','','管理员','','管理员管理'),
	(112,111,1,0,10000,'admin','User','add','','管理员添加','','管理员添加'),
	(113,111,2,0,10000,'admin','User','addPost','','管理员添加提交','','管理员添加提交'),
	(114,111,1,0,10000,'admin','User','edit','','管理员编辑','','管理员编辑'),
	(115,111,2,0,10000,'admin','User','editPost','','管理员编辑提交','','管理员编辑提交'),
	(116,111,1,0,10000,'admin','User','userInfo','','个人信息','','管理员个人信息修改'),
	(117,111,2,0,10000,'admin','User','userInfoPost','','管理员个人信息修改提交','','管理员个人信息修改提交'),
	(118,111,2,0,10000,'admin','User','delete','','管理员删除','','管理员删除'),
	(119,111,2,0,10000,'admin','User','ban','','停用管理员','','停用管理员'),
	(120,111,2,0,10000,'admin','User','cancelBan','','启用管理员','','启用管理员'),
	(121,0,1,0,10002,'user','AdminAsset','index','','资源管理','file','资源管理列表'),
	(122,121,2,0,10000,'user','AdminAsset','delete','','删除文件','','删除文件'),
	(123,110,0,1,10000,'user','AdminIndex','default1','','用户组','','用户组'),
	(124,123,1,1,10000,'user','AdminIndex','index','','本站用户','','本站用户'),
	(125,124,2,0,10000,'user','AdminIndex','ban','','本站用户拉黑','','本站用户拉黑'),
	(126,124,2,0,10000,'user','AdminIndex','cancelBan','','本站用户启用','','本站用户启用'),
	(127,123,1,1,10000,'user','AdminOauth','index','','第三方用户','','第三方用户'),
	(128,127,2,0,10000,'user','AdminOauth','delete','','删除第三方用户绑定','','删除第三方用户绑定'),
	(129,6,1,1,10000,'user','AdminUserAction','index','','用户操作管理','','用户操作管理'),
	(130,129,1,0,10000,'user','AdminUserAction','edit','','编辑用户操作','','编辑用户操作'),
	(131,129,2,0,10000,'user','AdminUserAction','editPost','','编辑用户操作提交','','编辑用户操作提交'),
	(132,129,1,0,10000,'user','AdminUserAction','sync','','同步用户操作','','同步用户操作'),
	(133,0,1,1,60,'ckfinder','index','index','','文件管理','file-archive-o',''),
	(134,133,2,0,10010,'ckfinder','index','ckfinder','','ckfinder配置','',''),
	(135,0,0,1,30,'portal','AdminIndex','default','','安全管理','newspaper-o','门户管理'),
	(136,135,1,1,10000,'portal','AdminArticle','index','','内容管理','','文章列表'),
	(137,136,1,0,10000,'portal','AdminArticle','add','','添加文章','','添加文章'),
	(138,136,2,0,10000,'portal','AdminArticle','addPost','','添加文章提交','','添加文章提交'),
	(139,136,1,0,10000,'portal','AdminArticle','edit','','编辑文章','','编辑文章'),
	(140,136,2,0,10000,'portal','AdminArticle','editPost','','编辑文章提交','','编辑文章提交'),
	(141,136,2,0,10000,'portal','AdminArticle','delete','','文章删除','','文章删除'),
	(142,136,2,0,10000,'portal','AdminArticle','publish','','文章发布','','文章发布'),
	(143,136,2,0,10000,'portal','AdminArticle','top','','文章置顶','','文章置顶'),
	(144,136,2,0,10000,'portal','AdminArticle','recommend','','文章推荐','','文章推荐'),
	(145,136,2,0,10000,'portal','AdminArticle','listOrder','','文章排序','','文章排序'),
	(146,135,1,1,10000,'portal','AdminCategory','index','','分类管理','','文章分类列表'),
	(147,146,1,0,10000,'portal','AdminCategory','add','','添加文章分类','','添加文章分类'),
	(148,146,2,0,10000,'portal','AdminCategory','addPost','','添加文章分类提交','','添加文章分类提交'),
	(149,146,1,0,10000,'portal','AdminCategory','edit','','编辑文章分类','','编辑文章分类'),
	(150,146,2,0,10000,'portal','AdminCategory','editPost','','编辑文章分类提交','','编辑文章分类提交'),
	(151,146,1,0,10000,'portal','AdminCategory','select','','文章分类选择对话框','','文章分类选择对话框'),
	(152,146,2,0,10000,'portal','AdminCategory','listOrder','','文章分类排序','','文章分类排序'),
	(153,146,2,0,10000,'portal','AdminCategory','toggle','','文章分类显示隐藏','','文章分类显示隐藏'),
	(154,146,2,0,10000,'portal','AdminCategory','delete','','删除文章分类','','删除文章分类'),
	(155,135,1,0,10000,'portal','AdminPage','index','','页面管理','','页面管理'),
	(156,155,1,0,10000,'portal','AdminPage','add','','添加页面','','添加页面'),
	(157,155,2,0,10000,'portal','AdminPage','addPost','','添加页面提交','','添加页面提交'),
	(158,155,1,0,10000,'portal','AdminPage','edit','','编辑页面','','编辑页面'),
	(159,155,2,0,10000,'portal','AdminPage','editPost','','编辑页面提交','','编辑页面提交'),
	(160,155,2,0,10000,'portal','AdminPage','delete','','删除页面','','删除页面'),
	(161,135,1,0,10000,'portal','AdminTag','index','','文章标签','','文章标签'),
	(162,161,1,0,10000,'portal','AdminTag','add','','添加文章标签','','添加文章标签'),
	(163,161,2,0,10000,'portal','AdminTag','addPost','','添加文章标签提交','','添加文章标签提交'),
	(164,161,2,0,10000,'portal','AdminTag','upStatus','','更新标签状态','','更新标签状态'),
	(165,161,2,0,10000,'portal','AdminTag','delete','','删除文章标签','','删除文章标签'),
	(166,0,2,1,40,'admin','Produce','default','','生产管理','bar-chart-o',''),
	(167,166,1,1,10000,'Produce','MachineStopRecord','index','','启停车记录','',''),
	(168,0,1,1,50,'CoalAnalysis','Index','default','','煤质化验','flask',''),
	(169,168,1,1,10000,'CoalAnalysis','Index','index','','数据录入','',''),
	(170,0,2,1,10000,'admin','Device','default','','设备维护','suitcase',''),
	(171,0,0,1,10000,'admin','GoodsMaterials','default','','物资管理','cubes',''),
	(172,166,1,1,10000,'admin','Produce','CoalOutputRecord','','产品煤产量记录','list-alt',''),
	(173,166,1,0,10000,'Produce','InputWashRecord','index','','入洗情况记录','list-alt',''),
	(174,1,1,1,10000,'plugin/AdminJournal','AdminIndex','index','','操作日志','','操作日志'),
	(175,222,1,1,10000,'portal','AdminDeviceCategory','index','','设备分类','','设备分类列表'),
	(176,175,1,0,10000,'portal','AdminDeviceCategory','add','','添加设备分类','','添加设备分类'),
	(177,175,2,0,10000,'portal','AdminDeviceCategory','addPost','','添加设备分类提交','','添加设备分类提交'),
	(178,175,1,0,10000,'portal','AdminDeviceCategory','edit','','编辑设备分类','','编辑设备分类'),
	(179,175,2,0,10000,'portal','AdminDeviceCategory','editPost','','编辑设备分类提交','','编辑设备分类提交'),
	(180,175,1,0,10000,'portal','AdminDeviceCategory','select','','设备分类选择对话框','','设备分类选择对话框'),
	(181,175,2,0,10000,'portal','AdminDeviceCategory','listOrder','','设备分类排序','','设备分类排序'),
	(182,175,2,0,10000,'portal','AdminDeviceCategory','toggle','','设备分类显示隐藏','','设备分类显示隐藏'),
	(183,175,2,0,10000,'portal','AdminDeviceCategory','delete','','删除设备分类','','删除设备分类'),
	(184,0,1,0,10000,'admin','Produce','index','','--new--','',''),
	(185,184,1,0,10000,'admin','Produce','edit','','管理员编辑','','管理员编辑'),
	(186,184,2,0,10000,'admin','Produce','editPost','','管理员编辑提交','','管理员编辑提交'),
	(187,184,1,0,10000,'admin','Produce','userInfo','','个人信息','','管理员个人信息修改'),
	(188,184,2,0,10000,'admin','Produce','userInfoPost','','管理员个人信息修改提交','','管理员个人信息修改提交'),
	(189,184,2,0,10000,'admin','Produce','delete','','管理员删除','','管理员删除'),
	(190,184,2,0,10000,'admin','Produce','ban','','停用管理员','','停用管理员'),
	(191,184,2,0,10000,'admin','Produce','cancelBan','','启用管理员','','启用管理员'),
	(192,171,0,1,10000,'admin','BasicInformation','default','','基本资料','address-book',''),
	(193,192,1,1,50,'admin','Warehouse','index','','仓库信息','','仓库信息'),
	(194,193,1,0,10000,'admin','Warehouse','add','','添加仓库信息','','添加仓库信息'),
	(195,193,2,0,10000,'admin','Warehouse','addPost','','添加仓库信息提交保存','','添加仓库信息提交保存'),
	(196,193,1,0,10000,'admin','Warehouse','edit','','编辑仓库信息','','编辑仓库信息'),
	(197,193,2,0,10000,'admin','Warehouse','editPost','','编辑仓库信息提交保存','','编辑仓库信息提交保存'),
	(198,193,2,0,10000,'admin','Warehouse','delete','','删除仓库信息','','删除仓库信息'),
	(199,193,2,0,10000,'admin','Warehouse','listOrder','','仓库信息排序','','仓库信息排序'),
	(200,171,0,1,10000,'admin','WarehouseEx','default','','出入库管理','',''),
	(201,200,1,1,10000,'admin','WarehouseEx','index','','出库管理','','出库管理'),
	(202,201,1,0,10000,'admin','WarehouseEx','add','','新增','','新增'),
	(203,201,2,0,10000,'admin','WarehouseEx','addPost','','新增提交','','新增提交'),
	(204,201,1,0,10000,'admin','WarehouseEx','edit','','出库信息编辑','','出库信息编辑'),
	(205,201,2,0,10000,'admin','WarehouseEx','editPost','','出库信息编辑提交','','出库信息编辑提交'),
	(206,201,2,0,10000,'admin','WarehouseEx','delete','','出库信息删除','','出库信息删除'),
	(207,192,1,1,10000,'admin','WarehouseGoods','index','','物品信息','','物品信息'),
	(208,207,1,0,10000,'admin','WarehouseGoods','add','','新增','','新增'),
	(209,207,2,0,10000,'admin','WarehouseGoods','addPost','','新增提交','','新增提交'),
	(210,207,1,0,10000,'admin','WarehouseGoods','edit','','编辑','','编辑'),
	(211,207,2,0,10000,'admin','WarehouseGoods','editPost','','编辑提交','','编辑提交'),
	(212,207,2,0,10000,'admin','WarehouseGoods','delete','','删除','','删除'),
	(213,200,1,1,10000,'admin','WarehouseIn','index','','入库管理','','入库管理'),
	(214,213,1,0,10000,'admin','WarehouseIn','add','','新增','','新增'),
	(215,213,2,0,10000,'admin','WarehouseIn','addPost','','新增提交','','新增提交'),
	(216,213,1,0,10000,'admin','WarehouseIn','edit','','入库信息编辑','','入库信息编辑'),
	(217,213,2,0,10000,'admin','WarehouseIn','editPost','','入库信息编辑提交','','入库信息编辑提交'),
	(218,213,2,0,10000,'admin','WarehouseIn','delete','','入库信息删除','','入库信息删除'),
	(219,213,1,0,10000,'admin','WarehouseIn','select','','入库信息物品选择框','','入库信息物品选择框'),
	(220,213,1,0,10000,'admin','WarehouseIn','prints','','打印','','打印'),
	(221,213,1,0,10000,'admin','WarehouseIn','show','','查看','','查看'),
	(222,170,0,1,10000,'admin','Device','basicinfo','','基本资料','',''),
	(223,170,1,1,10000,'admin','Device','index','','设备管理','','设备管理'),
	(224,223,1,0,10000,'admin','Device','add','','新增','','新增'),
	(225,223,2,0,10000,'admin','Device','addPost','','新增提交','','新增提交'),
	(226,223,1,0,10000,'admin','Device','edit','','编辑','','编辑'),
	(227,223,2,0,10000,'admin','Device','editPost','','编辑提交','','编辑提交'),
	(228,223,2,0,10000,'admin','Device','delete','','删除','','删除'),
	(229,223,1,0,10000,'admin','Device','select','','选择框','','选择框'),
	(230,223,1,0,10000,'admin','Device','prints','','打印','','打印'),
	(231,223,1,0,10000,'admin','Device','show','','查看','','查看'),
	(232,201,1,0,10000,'admin','WarehouseEx','select','','出库信息物品选择框','','出库信息物品选择框'),
	(233,201,1,0,10000,'admin','WarehouseEx','prints','','打印','','打印'),
	(234,201,1,0,10000,'admin','WarehouseEx','show','','查看','','查看'),
	(235,222,1,1,50,'admin','DeviceStatus','index','','状态信息','','状态信息'),
	(236,235,1,0,10000,'admin','DeviceStatus','add','','添加状态信息','','添加状态信息'),
	(237,235,2,0,10000,'admin','DeviceStatus','addPost','','添加状态信息提交保存','','添加状态信息提交保存'),
	(238,235,1,0,10000,'admin','DeviceStatus','edit','','编辑状态信息','','编辑状态信息'),
	(239,235,2,0,10000,'admin','DeviceStatus','editPost','','编辑状态信息提交保存','','编辑状态信息提交保存'),
	(240,235,2,0,10000,'admin','DeviceStatus','delete','','删除状态信息','','删除状态信息'),
	(241,222,1,1,10000,'portal','AdminDeviceDocumentCategory','index','','设备文档分类','','设备文档分类列表'),
	(242,241,1,0,10000,'portal','AdminDeviceDocumentCategory','add','','添加','','添加'),
	(243,241,2,0,10000,'portal','AdminDeviceDocumentCategory','addPost','','添加提交','','添加提交'),
	(244,241,1,0,10000,'portal','AdminDeviceDocumentCategory','edit','','编辑','','编辑'),
	(245,241,2,0,10000,'portal','AdminDeviceDocumentCategory','editPost','','编辑提交','','编辑提交'),
	(246,241,1,0,10000,'portal','AdminDeviceDocumentCategory','select','','分类选择对话框','','分类选择对话框'),
	(247,241,2,0,10000,'portal','AdminDeviceDocumentCategory','listOrder','','分类排序','','分类排序'),
	(248,241,2,0,10000,'portal','AdminDeviceDocumentCategory','toggle','','分类显示隐藏','','分类显示隐藏'),
	(249,241,2,0,10000,'portal','AdminDeviceDocumentCategory','delete','','删除分类','','删除分类'),
	(250,222,1,1,50,'admin','Department','index','','部门信息','','部门信息'),
	(251,250,1,0,10000,'admin','Department','add','','添加部门信息','','添加部门信息'),
	(252,250,2,0,10000,'admin','Department','addPost','','添加部门信息提交保存','','添加部门信息提交保存'),
	(253,250,1,0,10000,'admin','Department','edit','','编辑部门信息','','编辑部门信息'),
	(254,250,2,0,10000,'admin','Department','editPost','','编辑部门信息提交保存','','编辑部门信息提交保存'),
	(255,250,2,0,10000,'admin','Department','delete','','删除部门信息','','删除部门信息'),
	(256,170,0,1,10000,'admin','Device','record','','记录查询','',''),
	(257,223,1,0,10000,'admin','Device','trouble','','故障记录','','故障记录'),
	(258,223,1,0,10000,'admin','Device','trouble_add','','故障新增','','故障新增'),
	(259,223,2,0,10000,'admin','Device','trouble_addPost','','故障提交','','故障提交'),
	(260,223,1,0,10000,'admin','Device','trouble_edit','','故障记录编辑','','故障记录编辑'),
	(261,223,2,0,10000,'admin','Device','trouble_editPost','','故障编辑提交','','编辑提交'),
	(262,223,1,0,10000,'admin','Device','trouble_show','','故障记录查看','','故障记录查看'),
	(263,223,2,0,10000,'admin','Device','trouble_delete','','故障记录删除','','故障记录删除'),
	(264,256,1,1,10000,'admin','DeviceDaxiu','index','','大修记录','','大修记录'),
	(265,264,1,0,10000,'admin','DeviceDaxiu','daxiu_add','','新增','','新增'),
	(266,264,2,0,10000,'admin','DeviceDaxiu','daxiu_addPost','','提交','','提交'),
	(267,264,1,0,10000,'admin','DeviceDaxiu','daxiu_edit','','编辑','','编辑'),
	(268,264,2,0,10000,'admin','DeviceDaxiu','daxiu_editPost','','编辑提交','','提交'),
	(269,264,1,0,10000,'admin','DeviceDaxiu','daxiu_show','','记录查看','','记录查看'),
	(270,264,2,0,10000,'admin','DeviceDaxiu','daxiu_delete','','记录删除','','记录删除'),
	(271,256,1,1,10000,'admin','DeviceDocument','index','','技术资料','','技术资料'),
	(272,271,1,0,10000,'admin','DeviceDocument','document_add','','新增','','新增'),
	(273,271,2,0,10000,'admin','DeviceDocument','document_addPost','','提交','','提交'),
	(274,271,1,0,10000,'admin','DeviceDocument','document_edit','','编辑','','编辑'),
	(275,271,2,0,10000,'admin','DeviceDocument','document_editPost','','编辑提交','','提交'),
	(276,271,1,0,10000,'admin','DeviceDocument','daxiu_show','','记录查看','','记录查看'),
	(277,271,2,0,10000,'admin','DeviceDocument','document_delete','','记录删除','','记录删除'),
	(278,256,1,1,10000,'admin','DeviceMaintain','index','','保养记录','','保养记录'),
	(279,278,1,0,10000,'admin','DeviceMaintain','maintain_add','','新增','','新增'),
	(280,278,2,0,10000,'admin','DeviceMaintain','maintain_addPost','','提交','','提交'),
	(281,278,1,0,10000,'admin','DeviceMaintain','maintain_edit','','编辑','','编辑'),
	(282,278,2,0,10000,'admin','DeviceMaintain','maintain_editPost','','编辑提交','','提交'),
	(283,278,1,0,10000,'admin','DeviceMaintain','maintain_show','','查看','','查看'),
	(284,278,2,0,10000,'admin','DeviceMaintain','maintain_delete','','删除','','删除'),
	(285,256,2,0,10000,'admin','DeviceMaintainPlan','index','','保养设置','','保养设置'),
	(286,285,1,0,10000,'admin','DeviceMaintainPlan','plan_add','','新增','','新增'),
	(287,285,2,0,10000,'admin','DeviceMaintainPlan','plan_addPost','','提交','','提交'),
	(288,285,1,0,10000,'admin','DeviceMaintainPlan','plan_edit','','编辑','','编辑'),
	(289,285,2,0,10000,'admin','DeviceMaintainPlan','plan_editPost','','编辑提交','','提交'),
	(290,285,1,0,10000,'admin','DeviceMaintainPlan','plan_show','','查看','','查看'),
	(291,285,2,0,10000,'admin','DeviceMaintainPlan','plan_delete','','删除','','删除'),
	(292,256,1,1,10000,'admin','DeviceRepair','index','','检修记录','','检修记录'),
	(293,292,1,0,10000,'admin','DeviceRepair','repair_add','','新增','','新增'),
	(294,292,2,0,10000,'admin','DeviceRepair','repair_addPost','','提交','','提交'),
	(295,292,1,0,10000,'admin','DeviceRepair','repair_edit','','编辑','','编辑'),
	(296,292,2,0,10000,'admin','DeviceRepair','repair_editPost','','编辑提交','','提交'),
	(297,292,1,0,10000,'admin','DeviceRepair','repair_show','','查看','','查看'),
	(298,292,2,0,10000,'admin','DeviceRepair','repair_delete','','删除','','删除'),
	(299,256,2,0,10000,'admin','DeviceRepairPlan','index','','检修计划','','检修计划'),
	(300,299,1,0,10000,'admin','DeviceRepairPlan','plan_add','','新增','','新增'),
	(301,299,2,0,10000,'admin','DeviceRepairPlan','plan_addPost','','提交','','提交'),
	(302,299,1,0,10000,'admin','DeviceRepairPlan','plan_edit','','编辑','','编辑'),
	(303,299,2,0,10000,'admin','DeviceRepairPlan','plan_editPost','','编辑提交','','提交'),
	(304,299,1,0,10000,'admin','DeviceRepairPlan','plan_show','','查看','','查看'),
	(305,299,2,0,10000,'admin','DeviceRepairPlan','plan_delete','','删除','','删除'),
	(306,256,1,1,10000,'admin','DeviceRunhua','index','','润滑记录','','润滑记录'),
	(307,306,1,0,10000,'admin','DeviceRunhua','runhua_add','','新增','','新增'),
	(308,306,2,0,10000,'admin','DeviceRunhua','runhua_addPost','','提交','','提交'),
	(309,306,1,0,10000,'admin','DeviceRunhua','runhua_edit','','编辑','','编辑'),
	(310,306,2,0,10000,'admin','DeviceRunhua','runhua_editPost','','编辑提交','','提交'),
	(311,306,1,0,10000,'admin','DeviceRunhua','runhua_show','','查看','','查看'),
	(312,306,2,0,10000,'admin','DeviceRunhua','runhua_delete','','删除','','删除'),
	(313,256,2,0,10000,'admin','DeviceRunhuaPlan','index','','润滑设置','','润滑设置'),
	(314,313,1,0,10000,'admin','DeviceRunhuaPlan','plan_add','','新增','','新增'),
	(315,313,2,0,10000,'admin','DeviceRunhuaPlan','plan_addPost','','提交','','提交'),
	(316,313,1,0,10000,'admin','DeviceRunhuaPlan','plan_edit','','编辑','','编辑'),
	(317,313,2,0,10000,'admin','DeviceRunhuaPlan','plan_editPost','','编辑提交','','提交'),
	(318,313,1,0,10000,'admin','DeviceRunhuaPlan','plan_show','','查看','','查看'),
	(319,313,2,0,10000,'admin','DeviceRunhuaPlan','plan_delete','','删除','','删除');

/*!40000 ALTER TABLE `mk_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_asset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_asset`;

CREATE TABLE `mk_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

LOCK TABLES `mk_asset` WRITE;
/*!40000 ALTER TABLE `mk_asset` DISABLE KEYS */;

INSERT INTO `mk_asset` (`id`, `user_id`, `file_size`, `create_time`, `status`, `download_times`, `file_key`, `filename`, `file_path`, `file_md5`, `file_sha1`, `suffix`, `more`)
VALUES
	(1,1,11284,1567216482,1,0,'4d247bc3adec2d990fe472d3b523d7d442d0f6d236a23d41a4cf2425d5ff0818','backcash.mp3','portal/20190831/719e5bbc30379b8c83ee07835887070c.mp3','4d247bc3adec2d990fe472d3b523d7d4','78fb91fbcb2a0572d6735b3375c18be744364f18','mp3',NULL),
	(2,1,38243,1567217821,1,0,'2604b30258ef14120cca3dc9c279057a91408b17d9c353043290ddcaf3f2f9b7','70.png','portal/20190831/f6cd2d85e5f82f24d0be29761065efec.png','2604b30258ef14120cca3dc9c279057a','1c7ce31b8a59f37f8c8e6cd062d91f34d769a2e2','png',NULL),
	(3,1,347136,1567217848,1,0,'426741d580e964ebff394a10fc819c14385a6c41df7d1b3e3a767bf6e4d40c04','需求.doc','portal/20190831/38e4a48b39ad1504bc8c612987280292.doc','426741d580e964ebff394a10fc819c14','76d01ad92d725a4ddcb3069636b0b4ba186a2bf7','doc',NULL),
	(4,1,13529,1567217870,1,0,'8232eff6bc68a5856c843cc08ebf90bb51dd8b6ed6c6f218a71ec7bf4a145afd','AA04434145.pdf','portal/20190831/1ac56d5a262dcba6d23ac78e228e04de.pdf','8232eff6bc68a5856c843cc08ebf90bb','c3f0aaf819fa53540a68d64a349104e5488dcb75','pdf',NULL),
	(5,1,1045606,1567217899,1,0,'093a3f94fcd051cf296bf1de9d4b332fe1bb27312f13a1dc27a5d88254b67b3b','alipay_parking-master.zip','portal/20190831/1fbbd72ff3387c439bedf2a07849bf00.zip','093a3f94fcd051cf296bf1de9d4b332f','d93cbd33ecdfeb46826b08506e99bc3aaa7ac7e1','zip',NULL),
	(6,1,156194872,1567219129,1,0,'fd4427fc7fd0610f0bf955d7cc6bbd581ac27cc5b50df08f0a370b4ef373f09a','04-02 Redux由浅入深精讲-1.mp4','portal/20190831/40578f46651fb507c13ef4874f81012b.mp4','fd4427fc7fd0610f0bf955d7cc6bbd58','29cdcad58f151e3873ca29ef5b7638cfcca197ff','mp4',NULL),
	(7,1,2293134,1567219188,1,0,'c20558b51e03f0b039ad2b4f5215e8b2830499bf66ab1460b5fd2b849aaf80d4','IMG_1697.JPG','portal/20190831/62dd3c0d898fef8f664eab42df5f23a4.jpg','c20558b51e03f0b039ad2b4f5215e8b2','86e88c97efb5fe98e072e84586cdce67a4f100ef','jpg',NULL),
	(8,1,1700675,1567219196,1,0,'b4e3f1993897912f47cae16c4e10295135f7e732ed08c667f24f09fe563be831','IMG_1702.JPG','portal/20190831/cf5f340bbdeb635dba3e005d77eaa8eb.jpg','b4e3f1993897912f47cae16c4e102951','606f246e5c21c5af8a17e407f7435c5e4bbc4214','jpg',NULL),
	(9,1,448910,1567219212,1,0,'ef79765ca6a10b83daaeef39c3fe854be149c3e8bda007eec9192cdbda595d95','模板巴士手机版模块文件（解压后浏览器打开）h5v2.zip','portal/20190831/6e4adedeccb9ace5713affe290f4d6da.zip','ef79765ca6a10b83daaeef39c3fe854b','b427375f068a59daf7a3733c10bc6eb7514af98e','zip',NULL),
	(10,1,3211725,1567219229,1,0,'6fc836a52ac95349e4e0f12ea72e89dd55376dceb5ed228bc5809503e0107974','1157719532.mp3','portal/20190831/4eeb117383dcc5df0047084a9be454aa.mp3','6fc836a52ac95349e4e0f12ea72e89dd','706dd228d96b541ceed97a21464fefc1c90274e5','mp3',NULL),
	(11,1,1731579,1567219249,1,0,'36fa5c8c519cb878e859ea389fd2c18235e5472b49d0f841ce07dadc56823c5f','1552533967795780.mp4','portal/20190831/2f95abea0f0881335374013bfd5bc28e.mp4','36fa5c8c519cb878e859ea389fd2c182','8c7b0cdd3b8e0bebcd7737368ba76f517f3d8013','mp4',NULL),
	(12,1,141772,1567219260,1,0,'12300d17261afc7fce533d63e142a71d45af36e408ae029e493b79fda8286623','1024*1024-70.png','portal/20190831/de6d18c6a364f14fba4fd14afd80802a.png','12300d17261afc7fce533d63e142a71d','f768cb8bb9cee4a23d5c502be2b90f3c6e1aea59','png',NULL),
	(13,1,8719,1567261982,1,0,'1f25d509873b0f574a2bf4110c502281caaef1a233aae42de9928d37e3346192','order__0428005726.xlsx','default/20190831/46b1ab875b846afe5942699b19a687cb.xlsx','1f25d509873b0f574a2bf4110c502281','8929f23b978c4e26a803780a7488900d79a205a9','xlsx',NULL),
	(14,1,49830,1568138808,1,0,'efe8ed27b8ebb1760da123dc35fc70fc99ce693314d751700aaa6f0e525a8c05','logo.png','default/20190911/c80ad6762f4d1a970455cb3d85d0552d.png','efe8ed27b8ebb1760da123dc35fc70fc','e81a004e954788addbc68879737e7ded39e0e3b1','png',NULL),
	(15,1,3251447,1568139030,1,0,'3763af94a8b4f9163a90faca26b03879057b4d9960b90e0c5ca96bdd763914a5','360加固助手使用手册.pdf','default/20190911/b72b0c1058aaeeb68b99a287b33baedf.pdf','3763af94a8b4f9163a90faca26b03879','f725316aa401e2a288d169b78c23e57c6882e6be','pdf',NULL),
	(16,1,1142473,1568139364,1,0,'12defc1bf269ebd8d7fe60e95e370ba9bac56e05ad38b350120ba2b81dddafdf','SDK加固使用帮助.pdf','default/20190911/f55ce93f779a44337f206ae1e80c0cde.pdf','12defc1bf269ebd8d7fe60e95e370ba9','05dd8518e717fa6848c1fca84426072382ae5814','pdf',NULL),
	(17,1,60528,1568140181,1,0,'d07a9fac5efec33731c53b87791002ed2ce5e429ba05d92983174f8d1dc2e448','1473129558272005.jpg','default/20190911/ca86e89979f5a2a5e73467ad17b4f292.jpg','d07a9fac5efec33731c53b87791002ed','dfed0aa26dcbc6215d695bccd21777bd433094ff','jpg',NULL),
	(18,1,21289,1568141206,1,0,'d4cd47698f095fa8b4aa8f5ad831ef38a9f8a1b725298dc76bb40f62da626a86','123333.png','default/20190911/a9159d49632aae78c22a4500dbe4b2c2.png','d4cd47698f095fa8b4aa8f5ad831ef38','f3a106e2441883e4c55dc49d74fdf0593b6856bf','png',NULL),
	(19,1,9282,1568141372,1,0,'096dc9e1a6f0b1bd1246146bad1cc374ecc4a1a37ba7151ac2f08dd60a3ed3d7','logo.jpg','default/20190911/5a6166be60cbdafeed3ec1d4fc32e838.jpg','096dc9e1a6f0b1bd1246146bad1cc374','ea7ee821b54e9c8c4b5e2c5eea18e558c5bbdcdc','jpg',NULL),
	(20,1,84405,1568141426,1,0,'a811ca640446f88af8fb70cb84e5320911bb4826b6b89f3439dfb82e8b557454','swiper2.png','default/20190911/aace1b414df5c55f53ec8fd0ff580c72.png','a811ca640446f88af8fb70cb84e53209','45d80a2198e4bd28acbc749327f85ff0f99b1676','png',NULL),
	(21,1,218937,1568142100,1,0,'f78a205349dfe6c333e3aa6acc00368bbc60795b7a350cffe7684f82499ed1ae','1566659557469.jpg','default/20190911/343863974f9b99867ac9b39a4b34ead0.jpg','f78a205349dfe6c333e3aa6acc00368b','7e59b8f1a5e25d78866c2fa72b4e9b105bdcafd9','jpg',NULL),
	(22,1,2968195,1568177285,1,0,'a1f9b68116acdc6c40966b788cb73a1c1bff56a34643944bc39531687e61760a','安装说明(必读).docx','default/20190911/02813af3c4c1676fedcb17405d940ae3.docx','a1f9b68116acdc6c40966b788cb73a1c','b8f4346eee92242420ea24ad3d4f9616b72d40f4','docx',NULL),
	(23,1,154624,1568177314,1,0,'983c8ea8c02bd26080bd21adb05b3dde282ea1d568332b9cb3e54ff2ed8cc5a6','分类信息使用说明.doc','default/20190911/de0376ef702ebc50026f9505773820c8.doc','983c8ea8c02bd26080bd21adb05b3dde','39ee8145f1a38a844d55f2c765ba2100d77c6da6','doc',NULL),
	(24,1,6032,1568177657,1,0,'ca24abd2423665cf6d62e9c4340ad3bc3d9e6e6415cb512418f1a843d6a8cde3','admin_journal.rar','default/20190911/757134a3c68aa4e109936dc24e6e191a.rar','ca24abd2423665cf6d62e9c4340ad3bc','7b059f9eb17b2f13d8774df4297b974855859ce2','rar',NULL),
	(25,1,80567,1568181619,1,0,'10f4f2bce916d82a1fccf481764268f9cc1f708f6603d5a6eb60e722e52d7e55','10F4F2BCE916D82A1FCCF481764268F9.jpg','default/20190911/c2eef7841ab55f1173a4b792c80445d5.jpg','10f4f2bce916d82a1fccf481764268f9','a2922b10f7326e8975283db0efb52640c90912cf','jpg',NULL),
	(26,1,98071,1568378469,1,0,'65717208062bd8594a90a98f21e3a13b8cae78d11fc8b606651e340b3c31e86b','1024-70.png','default/20190913/f4b9c5e1d90624c6de68758b977de1aa.png','65717208062bd8594a90a98f21e3a13b','cbcf02c495aa6a15f5cdd8d4fba6affb2e715581','png',NULL),
	(27,1,186487,1568378939,1,0,'d9a4079f8a94caaca613a85754e75e6f2f427481743dff89f0083c75d2e696f6','1563866746624.jpg','default/20190913/f7c9828a6236dd301f5712b1e69b584e.jpg','d9a4079f8a94caaca613a85754e75e6f','dd5d8807c1e7399aa243b8b4be2347d4b3069211','jpg',NULL);

/*!40000 ALTER TABLE `mk_asset` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_auth_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_auth_access`;

CREATE TABLE `mk_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';



# Dump of table mk_auth_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_auth_rule`;

CREATE TABLE `mk_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

LOCK TABLES `mk_auth_rule` WRITE;
/*!40000 ALTER TABLE `mk_auth_rule` DISABLE KEYS */;

INSERT INTO `mk_auth_rule` (`id`, `status`, `app`, `type`, `name`, `param`, `title`, `condition`)
VALUES
	(1,1,'admin','admin_url','admin/Hook/index','','钩子管理',''),
	(2,1,'admin','admin_url','admin/Hook/plugins','','钩子插件管理',''),
	(3,1,'admin','admin_url','admin/Hook/pluginListOrder','','钩子插件排序',''),
	(4,1,'admin','admin_url','admin/Hook/sync','','同步钩子',''),
	(5,1,'admin','admin_url','admin/Link/index','','友情链接',''),
	(6,1,'admin','admin_url','admin/Link/add','','添加友情链接',''),
	(7,1,'admin','admin_url','admin/Link/addPost','','添加友情链接提交保存',''),
	(8,1,'admin','admin_url','admin/Link/edit','','编辑友情链接',''),
	(9,1,'admin','admin_url','admin/Link/editPost','','编辑友情链接提交保存',''),
	(10,1,'admin','admin_url','admin/Link/delete','','删除友情链接',''),
	(11,1,'admin','admin_url','admin/Link/listOrder','','友情链接排序',''),
	(12,1,'admin','admin_url','admin/Link/toggle','','友情链接显示隐藏',''),
	(13,1,'admin','admin_url','admin/Mailer/index','','邮箱配置',''),
	(14,1,'admin','admin_url','admin/Mailer/indexPost','','邮箱配置提交保存',''),
	(15,1,'admin','admin_url','admin/Mailer/template','','邮件模板',''),
	(16,1,'admin','admin_url','admin/Mailer/templatePost','','邮件模板提交',''),
	(17,1,'admin','admin_url','admin/Mailer/test','','邮件发送测试',''),
	(18,1,'admin','admin_url','admin/Menu/index','','后台菜单',''),
	(19,1,'admin','admin_url','admin/Menu/lists','','所有菜单',''),
	(20,1,'admin','admin_url','admin/Menu/add','','后台菜单添加',''),
	(21,1,'admin','admin_url','admin/Menu/addPost','','后台菜单添加提交保存',''),
	(22,1,'admin','admin_url','admin/Menu/edit','','后台菜单编辑',''),
	(23,1,'admin','admin_url','admin/Menu/editPost','','后台菜单编辑提交保存',''),
	(24,1,'admin','admin_url','admin/Menu/delete','','后台菜单删除',''),
	(25,1,'admin','admin_url','admin/Menu/listOrder','','后台菜单排序',''),
	(26,1,'admin','admin_url','admin/Menu/getActions','','导入新后台菜单',''),
	(27,1,'admin','admin_url','admin/Nav/index','','导航管理',''),
	(28,1,'admin','admin_url','admin/Nav/add','','添加导航',''),
	(29,1,'admin','admin_url','admin/Nav/addPost','','添加导航提交保存',''),
	(30,1,'admin','admin_url','admin/Nav/edit','','编辑导航',''),
	(31,1,'admin','admin_url','admin/Nav/editPost','','编辑导航提交保存',''),
	(32,1,'admin','admin_url','admin/Nav/delete','','删除导航',''),
	(33,1,'admin','admin_url','admin/NavMenu/index','','导航菜单',''),
	(34,1,'admin','admin_url','admin/NavMenu/add','','添加导航菜单',''),
	(35,1,'admin','admin_url','admin/NavMenu/addPost','','添加导航菜单提交保存',''),
	(36,1,'admin','admin_url','admin/NavMenu/edit','','编辑导航菜单',''),
	(37,1,'admin','admin_url','admin/NavMenu/editPost','','编辑导航菜单提交保存',''),
	(38,1,'admin','admin_url','admin/NavMenu/delete','','删除导航菜单',''),
	(39,1,'admin','admin_url','admin/NavMenu/listOrder','','导航菜单排序',''),
	(40,1,'admin','admin_url','admin/Plugin/default','','插件中心',''),
	(41,1,'admin','admin_url','admin/Plugin/index','','插件列表',''),
	(42,1,'admin','admin_url','admin/Plugin/toggle','','插件启用禁用',''),
	(43,1,'admin','admin_url','admin/Plugin/setting','','插件设置',''),
	(44,1,'admin','admin_url','admin/Plugin/settingPost','','插件设置提交',''),
	(45,1,'admin','admin_url','admin/Plugin/install','','插件安装',''),
	(46,1,'admin','admin_url','admin/Plugin/update','','插件更新',''),
	(47,1,'admin','admin_url','admin/Plugin/uninstall','','卸载插件',''),
	(48,1,'admin','admin_url','admin/Rbac/index','','角色管理',''),
	(49,1,'admin','admin_url','admin/Rbac/roleAdd','','添加角色',''),
	(50,1,'admin','admin_url','admin/Rbac/roleAddPost','','添加角色提交',''),
	(51,1,'admin','admin_url','admin/Rbac/roleEdit','','编辑角色',''),
	(52,1,'admin','admin_url','admin/Rbac/roleEditPost','','编辑角色提交',''),
	(53,1,'admin','admin_url','admin/Rbac/roleDelete','','删除角色',''),
	(54,1,'admin','admin_url','admin/Rbac/authorize','','设置角色权限',''),
	(55,1,'admin','admin_url','admin/Rbac/authorizePost','','角色授权提交',''),
	(56,1,'admin','admin_url','admin/RecycleBin/index','','回收站',''),
	(57,1,'admin','admin_url','admin/RecycleBin/restore','','回收站还原',''),
	(58,1,'admin','admin_url','admin/RecycleBin/delete','','回收站彻底删除',''),
	(59,1,'admin','admin_url','admin/Route/index','','URL美化',''),
	(60,1,'admin','admin_url','admin/Route/add','','添加路由规则',''),
	(61,1,'admin','admin_url','admin/Route/addPost','','添加路由规则提交',''),
	(62,1,'admin','admin_url','admin/Route/edit','','路由规则编辑',''),
	(63,1,'admin','admin_url','admin/Route/editPost','','路由规则编辑提交',''),
	(64,1,'admin','admin_url','admin/Route/delete','','路由规则删除',''),
	(65,1,'admin','admin_url','admin/Route/ban','','路由规则禁用',''),
	(66,1,'admin','admin_url','admin/Route/open','','路由规则启用',''),
	(67,1,'admin','admin_url','admin/Route/listOrder','','路由规则排序',''),
	(68,1,'admin','admin_url','admin/Route/select','','选择URL',''),
	(69,1,'admin','admin_url','admin/Setting/default','','设置',''),
	(70,1,'admin','admin_url','admin/Setting/site','','网站信息',''),
	(71,1,'admin','admin_url','admin/Setting/sitePost','','网站信息设置提交',''),
	(72,1,'admin','admin_url','admin/Setting/password','','密码修改',''),
	(73,1,'admin','admin_url','admin/Setting/passwordPost','','密码修改提交',''),
	(74,1,'admin','admin_url','admin/Setting/upload','','上传设置',''),
	(75,1,'admin','admin_url','admin/Setting/uploadPost','','上传设置提交',''),
	(76,1,'admin','admin_url','admin/Setting/clearCache','','清除缓存',''),
	(77,1,'admin','admin_url','admin/Slide/index','','幻灯片管理',''),
	(78,1,'admin','admin_url','admin/Slide/add','','添加幻灯片',''),
	(79,1,'admin','admin_url','admin/Slide/addPost','','添加幻灯片提交',''),
	(80,1,'admin','admin_url','admin/Slide/edit','','编辑幻灯片',''),
	(81,1,'admin','admin_url','admin/Slide/editPost','','编辑幻灯片提交',''),
	(82,1,'admin','admin_url','admin/Slide/delete','','删除幻灯片',''),
	(83,1,'admin','admin_url','admin/SlideItem/index','','幻灯片页面列表',''),
	(84,1,'admin','admin_url','admin/SlideItem/add','','幻灯片页面添加',''),
	(85,1,'admin','admin_url','admin/SlideItem/addPost','','幻灯片页面添加提交',''),
	(86,1,'admin','admin_url','admin/SlideItem/edit','','幻灯片页面编辑',''),
	(87,1,'admin','admin_url','admin/SlideItem/editPost','','幻灯片页面编辑提交',''),
	(88,1,'admin','admin_url','admin/SlideItem/delete','','幻灯片页面删除',''),
	(89,1,'admin','admin_url','admin/SlideItem/ban','','幻灯片页面隐藏',''),
	(90,1,'admin','admin_url','admin/SlideItem/cancelBan','','幻灯片页面显示',''),
	(91,1,'admin','admin_url','admin/SlideItem/listOrder','','幻灯片页面排序',''),
	(92,1,'admin','admin_url','admin/Storage/index','','文件存储',''),
	(93,1,'admin','admin_url','admin/Storage/settingPost','','文件存储设置提交',''),
	(94,1,'admin','admin_url','admin/Theme/index','','模板管理',''),
	(95,1,'admin','admin_url','admin/Theme/install','','安装模板',''),
	(96,1,'admin','admin_url','admin/Theme/uninstall','','卸载模板',''),
	(97,1,'admin','admin_url','admin/Theme/installTheme','','模板安装',''),
	(98,1,'admin','admin_url','admin/Theme/update','','模板更新',''),
	(99,1,'admin','admin_url','admin/Theme/active','','启用模板',''),
	(100,1,'admin','admin_url','admin/Theme/files','','模板文件列表',''),
	(101,1,'admin','admin_url','admin/Theme/fileSetting','','模板文件设置',''),
	(102,1,'admin','admin_url','admin/Theme/fileArrayData','','模板文件数组数据列表',''),
	(103,1,'admin','admin_url','admin/Theme/fileArrayDataEdit','','模板文件数组数据添加编辑',''),
	(104,1,'admin','admin_url','admin/Theme/fileArrayDataEditPost','','模板文件数组数据添加编辑提交保存',''),
	(105,1,'admin','admin_url','admin/Theme/fileArrayDataDelete','','模板文件数组数据删除',''),
	(106,1,'admin','admin_url','admin/Theme/settingPost','','模板文件编辑提交保存',''),
	(107,1,'admin','admin_url','admin/Theme/dataSource','','模板文件设置数据源',''),
	(108,1,'admin','admin_url','admin/Theme/design','','模板设计',''),
	(109,1,'admin','admin_url','admin/User/default','','管理组',''),
	(110,1,'admin','admin_url','admin/User/index','','管理员',''),
	(111,1,'admin','admin_url','admin/User/add','','管理员添加',''),
	(112,1,'admin','admin_url','admin/User/addPost','','管理员添加提交',''),
	(113,1,'admin','admin_url','admin/User/edit','','管理员编辑',''),
	(114,1,'admin','admin_url','admin/User/editPost','','管理员编辑提交',''),
	(115,1,'admin','admin_url','admin/User/userInfo','','个人信息',''),
	(116,1,'admin','admin_url','admin/User/userInfoPost','','管理员个人信息修改提交',''),
	(117,1,'admin','admin_url','admin/User/delete','','管理员删除',''),
	(118,1,'admin','admin_url','admin/User/ban','','停用管理员',''),
	(119,1,'admin','admin_url','admin/User/cancelBan','','启用管理员',''),
	(120,1,'user','admin_url','user/AdminAsset/index','','资源管理',''),
	(121,1,'user','admin_url','user/AdminAsset/delete','','删除文件',''),
	(122,1,'user','admin_url','user/AdminIndex/default','','用户管理',''),
	(123,1,'user','admin_url','user/AdminIndex/default1','','用户组',''),
	(124,1,'user','admin_url','user/AdminIndex/index','','本站用户',''),
	(125,1,'user','admin_url','user/AdminIndex/ban','','本站用户拉黑',''),
	(126,1,'user','admin_url','user/AdminIndex/cancelBan','','本站用户启用',''),
	(127,1,'user','admin_url','user/AdminOauth/index','','第三方用户',''),
	(128,1,'user','admin_url','user/AdminOauth/delete','','删除第三方用户绑定',''),
	(129,1,'user','admin_url','user/AdminUserAction/index','','用户操作管理',''),
	(130,1,'user','admin_url','user/AdminUserAction/edit','','编辑用户操作',''),
	(131,1,'user','admin_url','user/AdminUserAction/editPost','','编辑用户操作提交',''),
	(132,1,'user','admin_url','user/AdminUserAction/sync','','同步用户操作',''),
	(133,1,'ckfinder','admin_url','ckfinder/index/index','','文件管理',''),
	(134,1,'ckfinder','admin_url','ckfinder/index/ckfinder','','ckfinder配置',''),
	(135,1,'portal','admin_url','portal/AdminArticle/index','','内容管理',''),
	(136,1,'portal','admin_url','portal/AdminArticle/add','','添加文章',''),
	(137,1,'portal','admin_url','portal/AdminArticle/addPost','','添加文章提交',''),
	(138,1,'portal','admin_url','portal/AdminArticle/edit','','编辑文章',''),
	(139,1,'portal','admin_url','portal/AdminArticle/editPost','','编辑文章提交',''),
	(140,1,'portal','admin_url','portal/AdminArticle/delete','','文章删除',''),
	(141,1,'portal','admin_url','portal/AdminArticle/publish','','文章发布',''),
	(142,1,'portal','admin_url','portal/AdminArticle/top','','文章置顶',''),
	(143,1,'portal','admin_url','portal/AdminArticle/recommend','','文章推荐',''),
	(144,1,'portal','admin_url','portal/AdminArticle/listOrder','','文章排序',''),
	(145,1,'portal','admin_url','portal/AdminCategory/index','','分类管理',''),
	(146,1,'portal','admin_url','portal/AdminCategory/add','','添加文章分类',''),
	(147,1,'portal','admin_url','portal/AdminCategory/addPost','','添加文章分类提交',''),
	(148,1,'portal','admin_url','portal/AdminCategory/edit','','编辑文章分类',''),
	(149,1,'portal','admin_url','portal/AdminCategory/editPost','','编辑文章分类提交',''),
	(150,1,'portal','admin_url','portal/AdminCategory/select','','文章分类选择对话框',''),
	(151,1,'portal','admin_url','portal/AdminCategory/listOrder','','文章分类排序',''),
	(152,1,'portal','admin_url','portal/AdminCategory/toggle','','文章分类显示隐藏',''),
	(153,1,'portal','admin_url','portal/AdminCategory/delete','','删除文章分类',''),
	(154,1,'portal','admin_url','portal/AdminIndex/default','','安全管理',''),
	(155,1,'portal','admin_url','portal/AdminPage/index','','页面管理',''),
	(156,1,'portal','admin_url','portal/AdminPage/add','','添加页面',''),
	(157,1,'portal','admin_url','portal/AdminPage/addPost','','添加页面提交',''),
	(158,1,'portal','admin_url','portal/AdminPage/edit','','编辑页面',''),
	(159,1,'portal','admin_url','portal/AdminPage/editPost','','编辑页面提交',''),
	(160,1,'portal','admin_url','portal/AdminPage/delete','','删除页面',''),
	(161,1,'portal','admin_url','portal/AdminTag/index','','文章标签',''),
	(162,1,'portal','admin_url','portal/AdminTag/add','','添加文章标签',''),
	(163,1,'portal','admin_url','portal/AdminTag/addPost','','添加文章标签提交',''),
	(164,1,'portal','admin_url','portal/AdminTag/upStatus','','更新标签状态',''),
	(165,1,'portal','admin_url','portal/AdminTag/delete','','删除文章标签',''),
	(166,1,'Admin','admin_url','Admin/Produce/default','','生产管理',''),
	(167,1,'Produce','admin_url','Produce/MachineStopRecord/index','','启停车记录',''),
	(168,1,'CoalAnalysis','admin_url','CoalAnalysis/Index/default','','煤质化验',''),
	(169,1,'CoalAnalysis','admin_url','CoalAnalysis/Index/index','','数据录入',''),
	(170,1,'admin','admin_url','admin/Device/default','','设备维护',''),
	(171,1,'admin','admin_url','admin/GoodsMaterials/default','','物资管理',''),
	(172,1,'admin','admin_url','admin/Produce/CoalOutputRecord','','产品煤产量记录',''),
	(173,1,'Produce','admin_url','Produce/InputWashRecord/index','','入洗情况记录',''),
	(174,1,'plugin/AdminJournal','plugin_url','plugin/AdminJournal/AdminIndex/index','','操作日志',''),
	(175,1,'portal','admin_url','portal/AdminDeviceCategory/index','','设备分类',''),
	(176,1,'portal','admin_url','portal/AdminDeviceCategory/add','','添加设备分类',''),
	(177,1,'portal','admin_url','portal/AdminDeviceCategory/addPost','','添加设备分类提交',''),
	(178,1,'portal','admin_url','portal/AdminDeviceCategory/edit','','编辑设备分类',''),
	(179,1,'portal','admin_url','portal/AdminDeviceCategory/editPost','','编辑设备分类提交',''),
	(180,1,'portal','admin_url','portal/AdminDeviceCategory/select','','设备分类选择对话框',''),
	(181,1,'portal','admin_url','portal/AdminDeviceCategory/listOrder','','设备分类排序',''),
	(182,1,'portal','admin_url','portal/AdminDeviceCategory/toggle','','设备分类显示隐藏',''),
	(183,1,'portal','admin_url','portal/AdminDeviceCategory/delete','','删除设备分类',''),
	(184,1,'admin','admin_url','admin/Produce/edit','','管理员编辑',''),
	(185,1,'admin','admin_url','admin/Produce/editPost','','管理员编辑提交',''),
	(186,1,'admin','admin_url','admin/Produce/userInfo','','个人信息',''),
	(187,1,'admin','admin_url','admin/Produce/userInfoPost','','管理员个人信息修改提交',''),
	(188,1,'admin','admin_url','admin/Produce/delete','','管理员删除',''),
	(189,1,'admin','admin_url','admin/Produce/ban','','停用管理员',''),
	(190,1,'admin','admin_url','admin/Produce/cancelBan','','启用管理员',''),
	(191,1,'admin','admin_url','admin/BasicInformation/default','','基本资料',''),
	(192,1,'admin','admin_url','admin/Warehouse/index','','仓库信息',''),
	(193,1,'admin','admin_url','admin/Warehouse/add','','添加仓库信息',''),
	(194,1,'admin','admin_url','admin/Warehouse/addPost','','添加仓库信息提交保存',''),
	(195,1,'admin','admin_url','admin/Warehouse/edit','','编辑仓库信息',''),
	(196,1,'admin','admin_url','admin/Warehouse/editPost','','编辑仓库信息提交保存',''),
	(197,1,'admin','admin_url','admin/Warehouse/delete','','删除仓库信息',''),
	(198,1,'admin','admin_url','admin/Warehouse/listOrder','','仓库信息排序',''),
	(199,1,'admin','admin_url','admin/WarehouseEx/default','','出入库管理',''),
	(200,1,'admin','admin_url','admin/WarehouseEx/index','','出库管理',''),
	(201,1,'admin','admin_url','admin/WarehouseEx/add','','新增',''),
	(202,1,'admin','admin_url','admin/WarehouseEx/addPost','','新增提交',''),
	(203,1,'admin','admin_url','admin/WarehouseEx/edit','','出库信息编辑',''),
	(204,1,'admin','admin_url','admin/WarehouseEx/editPost','','出库信息编辑提交',''),
	(205,1,'admin','admin_url','admin/WarehouseEx/delete','','出库信息删除',''),
	(206,1,'admin','admin_url','admin/WarehouseGoods/index','','物品信息',''),
	(207,1,'admin','admin_url','admin/WarehouseGoods/add','','新增',''),
	(208,1,'admin','admin_url','admin/WarehouseGoods/addPost','','新增提交',''),
	(209,1,'admin','admin_url','admin/WarehouseGoods/edit','','编辑',''),
	(210,1,'admin','admin_url','admin/WarehouseGoods/editPost','','编辑提交',''),
	(211,1,'admin','admin_url','admin/WarehouseGoods/delete','','删除',''),
	(212,1,'admin','admin_url','admin/WarehouseIn/index','','入库管理',''),
	(213,1,'admin','admin_url','admin/WarehouseIn/add','','新增',''),
	(214,1,'admin','admin_url','admin/WarehouseIn/addPost','','新增提交',''),
	(215,1,'admin','admin_url','admin/WarehouseIn/edit','','入库信息编辑',''),
	(216,1,'admin','admin_url','admin/WarehouseIn/editPost','','入库信息编辑提交',''),
	(217,1,'admin','admin_url','admin/WarehouseIn/delete','','入库信息删除',''),
	(218,1,'admin','admin_url','admin/WarehouseIn/select','','入库信息物品选择框',''),
	(219,1,'admin','admin_url','admin/WarehouseIn/prints','','打印',''),
	(220,1,'admin','admin_url','admin/WarehouseIn/show','','查看',''),
	(221,1,'admin','admin_url','admin/Device/basicinfo','','基本资料',''),
	(222,1,'admin','admin_url','admin/Device/index','','设备管理',''),
	(223,1,'admin','admin_url','admin/Device/add','','新增',''),
	(224,1,'admin','admin_url','admin/Device/addPost','','新增提交',''),
	(225,1,'admin','admin_url','admin/Device/edit','','编辑',''),
	(226,1,'admin','admin_url','admin/Device/editPost','','编辑提交',''),
	(227,1,'admin','admin_url','admin/Device/delete','','删除',''),
	(228,1,'admin','admin_url','admin/Device/select','','选择框',''),
	(229,1,'admin','admin_url','admin/Device/prints','','打印',''),
	(230,1,'admin','admin_url','admin/Device/show','','查看',''),
	(231,1,'admin','admin_url','admin/WarehouseEx/select','','出库信息物品选择框',''),
	(232,1,'admin','admin_url','admin/WarehouseEx/prints','','打印',''),
	(233,1,'admin','admin_url','admin/WarehouseEx/show','','查看',''),
	(234,1,'admin','admin_url','admin/DeviceStatus/index','','状态信息',''),
	(235,1,'admin','admin_url','admin/DeviceStatus/add','','添加状态信息',''),
	(236,1,'admin','admin_url','admin/DeviceStatus/addPost','','添加状态信息提交保存',''),
	(237,1,'admin','admin_url','admin/DeviceStatus/edit','','编辑状态信息',''),
	(238,1,'admin','admin_url','admin/DeviceStatus/editPost','','编辑状态信息提交保存',''),
	(239,1,'admin','admin_url','admin/DeviceStatus/delete','','删除状态信息',''),
	(240,1,'portal','admin_url','portal/AdminDeviceDocumentCategory/index','','设备文档分类',''),
	(241,1,'portal','admin_url','portal/AdminDeviceDocumentCategory/add','','添加',''),
	(242,1,'portal','admin_url','portal/AdminDeviceDocumentCategory/addPost','','添加提交',''),
	(243,1,'portal','admin_url','portal/AdminDeviceDocumentCategory/edit','','编辑',''),
	(244,1,'portal','admin_url','portal/AdminDeviceDocumentCategory/editPost','','编辑提交',''),
	(245,1,'portal','admin_url','portal/AdminDeviceDocumentCategory/select','','分类选择对话框',''),
	(246,1,'portal','admin_url','portal/AdminDeviceDocumentCategory/listOrder','','分类排序',''),
	(247,1,'portal','admin_url','portal/AdminDeviceDocumentCategory/toggle','','分类显示隐藏',''),
	(248,1,'portal','admin_url','portal/AdminDeviceDocumentCategory/delete','','删除分类',''),
	(249,1,'admin','admin_url','admin/Department/index','','部门信息',''),
	(250,1,'admin','admin_url','admin/Department/add','','添加部门信息',''),
	(251,1,'admin','admin_url','admin/Department/addPost','','添加部门信息提交保存',''),
	(252,1,'admin','admin_url','admin/Department/edit','','编辑部门信息',''),
	(253,1,'admin','admin_url','admin/Department/editPost','','编辑部门信息提交保存',''),
	(254,1,'admin','admin_url','admin/Department/delete','','删除部门信息',''),
	(255,1,'admin','admin_url','admin/Device/record','','记录查询',''),
	(256,1,'admin','admin_url','admin/Device/trouble','','故障记录',''),
	(257,1,'admin','admin_url','admin/Device/trouble_add','','故障新增',''),
	(258,1,'admin','admin_url','admin/Device/trouble_addPost','','故障提交',''),
	(259,1,'admin','admin_url','admin/Device/trouble_edit','','故障记录编辑',''),
	(260,1,'admin','admin_url','admin/Device/trouble_editPost','','故障编辑提交',''),
	(261,1,'admin','admin_url','admin/Device/trouble_show','','故障记录查看',''),
	(262,1,'admin','admin_url','admin/Device/trouble_delete','','故障记录删除',''),
	(263,1,'admin','admin_url','admin/DeviceDaxiu/index','','大修记录',''),
	(264,1,'admin','admin_url','admin/DeviceDaxiu/daxiu_add','','新增',''),
	(265,1,'admin','admin_url','admin/DeviceDaxiu/daxiu_addPost','','提交',''),
	(266,1,'admin','admin_url','admin/DeviceDaxiu/daxiu_edit','','编辑',''),
	(267,1,'admin','admin_url','admin/DeviceDaxiu/daxiu_editPost','','编辑提交',''),
	(268,1,'admin','admin_url','admin/DeviceDaxiu/daxiu_show','','记录查看',''),
	(269,1,'admin','admin_url','admin/DeviceDaxiu/daxiu_delete','','记录删除',''),
	(270,1,'admin','admin_url','admin/DeviceDocument/index','','技术资料',''),
	(271,1,'admin','admin_url','admin/DeviceDocument/document_add','','新增',''),
	(272,1,'admin','admin_url','admin/DeviceDocument/document_addPost','','提交',''),
	(273,1,'admin','admin_url','admin/DeviceDocument/document_edit','','编辑',''),
	(274,1,'admin','admin_url','admin/DeviceDocument/document_editPost','','编辑提交',''),
	(275,1,'admin','admin_url','admin/DeviceDocument/daxiu_show','','记录查看',''),
	(276,1,'admin','admin_url','admin/DeviceDocument/document_delete','','记录删除',''),
	(277,1,'admin','admin_url','admin/DeviceMaintain/index','','保养记录',''),
	(278,1,'admin','admin_url','admin/DeviceMaintain/maintain_add','','新增',''),
	(279,1,'admin','admin_url','admin/DeviceMaintain/maintain_addPost','','提交',''),
	(280,1,'admin','admin_url','admin/DeviceMaintain/maintain_edit','','编辑',''),
	(281,1,'admin','admin_url','admin/DeviceMaintain/maintain_editPost','','编辑提交',''),
	(282,1,'admin','admin_url','admin/DeviceMaintain/maintain_show','','查看',''),
	(283,1,'admin','admin_url','admin/DeviceMaintain/maintain_delete','','删除',''),
	(284,1,'admin','admin_url','admin/DeviceMaintainPlan/index','','保养设置',''),
	(285,1,'admin','admin_url','admin/DeviceMaintainPlan/plan_add','','新增',''),
	(286,1,'admin','admin_url','admin/DeviceMaintainPlan/plan_addPost','','提交',''),
	(287,1,'admin','admin_url','admin/DeviceMaintainPlan/plan_edit','','编辑',''),
	(288,1,'admin','admin_url','admin/DeviceMaintainPlan/plan_editPost','','编辑提交',''),
	(289,1,'admin','admin_url','admin/DeviceMaintainPlan/plan_show','','查看',''),
	(290,1,'admin','admin_url','admin/DeviceMaintainPlan/plan_delete','','删除',''),
	(291,1,'admin','admin_url','admin/DeviceRepair/index','','检修记录',''),
	(292,1,'admin','admin_url','admin/DeviceRepair/repair_add','','新增',''),
	(293,1,'admin','admin_url','admin/DeviceRepair/repair_addPost','','提交',''),
	(294,1,'admin','admin_url','admin/DeviceRepair/repair_edit','','编辑',''),
	(295,1,'admin','admin_url','admin/DeviceRepair/repair_editPost','','编辑提交',''),
	(296,1,'admin','admin_url','admin/DeviceRepair/repair_show','','查看',''),
	(297,1,'admin','admin_url','admin/DeviceRepair/repair_delete','','删除',''),
	(298,1,'admin','admin_url','admin/DeviceRepairPlan/index','','检修计划',''),
	(299,1,'admin','admin_url','admin/DeviceRepairPlan/plan_add','','新增',''),
	(300,1,'admin','admin_url','admin/DeviceRepairPlan/plan_addPost','','提交',''),
	(301,1,'admin','admin_url','admin/DeviceRepairPlan/plan_edit','','编辑',''),
	(302,1,'admin','admin_url','admin/DeviceRepairPlan/plan_editPost','','编辑提交',''),
	(303,1,'admin','admin_url','admin/DeviceRepairPlan/plan_show','','查看',''),
	(304,1,'admin','admin_url','admin/DeviceRepairPlan/plan_delete','','删除',''),
	(305,1,'admin','admin_url','admin/DeviceRunhua/index','','润滑记录',''),
	(306,1,'admin','admin_url','admin/DeviceRunhua/runhua_add','','新增',''),
	(307,1,'admin','admin_url','admin/DeviceRunhua/runhua_addPost','','提交',''),
	(308,1,'admin','admin_url','admin/DeviceRunhua/runhua_edit','','编辑',''),
	(309,1,'admin','admin_url','admin/DeviceRunhua/runhua_editPost','','编辑提交',''),
	(310,1,'admin','admin_url','admin/DeviceRunhua/runhua_show','','查看',''),
	(311,1,'admin','admin_url','admin/DeviceRunhua/runhua_delete','','删除',''),
	(312,1,'admin','admin_url','admin/DeviceRunhuaPlan/index','','润滑设置',''),
	(313,1,'admin','admin_url','admin/DeviceRunhuaPlan/plan_add','','新增',''),
	(314,1,'admin','admin_url','admin/DeviceRunhuaPlan/plan_addPost','','提交',''),
	(315,1,'admin','admin_url','admin/DeviceRunhuaPlan/plan_edit','','编辑',''),
	(316,1,'admin','admin_url','admin/DeviceRunhuaPlan/plan_editPost','','编辑提交',''),
	(317,1,'admin','admin_url','admin/DeviceRunhuaPlan/plan_show','','查看',''),
	(318,1,'admin','admin_url','admin/DeviceRunhuaPlan/plan_delete','','删除','');

/*!40000 ALTER TABLE `mk_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_comment`;

CREATE TABLE `mk_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';



# Dump of table mk_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_department`;

CREATE TABLE `mk_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '部门名称',
  `create_time` int(11) DEFAULT NULL COMMENT '插入时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '部门状态',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_department` WRITE;
/*!40000 ALTER TABLE `mk_department` DISABLE KEYS */;

INSERT INTO `mk_department` (`id`, `name`, `create_time`, `status`, `remarks`)
VALUES
	(1,'财务部',NULL,1,''),
	(2,'集控部',NULL,1,'');

/*!40000 ALTER TABLE `mk_department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_device
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_device`;

CREATE TABLE `mk_device` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_name` varchar(255) NOT NULL DEFAULT '' COMMENT '设备名称',
  `device_type` int(10) unsigned NOT NULL COMMENT '设备类型',
  `device_location` varchar(255) DEFAULT NULL COMMENT '设备位置号',
  `device_detail` varchar(255) DEFAULT NULL COMMENT '设备技术参数',
  `device_danwei` varchar(20) DEFAULT NULL COMMENT '单位',
  `device_nums` int(10) unsigned NOT NULL COMMENT '数量',
  `single_weight` float(10,3) unsigned NOT NULL COMMENT '单重',
  `total_weight` float(10,3) unsigned NOT NULL COMMENT '总重',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `last_maintain_time` int(11) DEFAULT NULL COMMENT '上次保养时间',
  `next_maintain_time` int(11) DEFAULT NULL COMMENT '下次保养时间',
  `create_time` int(11) DEFAULT NULL COMMENT '订单创建时间',
  `status` tinyint(2) unsigned DEFAULT NULL COMMENT '状态',
  `department` int(11) unsigned DEFAULT NULL COMMENT '使用部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_device` WRITE;
/*!40000 ALTER TABLE `mk_device` DISABLE KEYS */;

INSERT INTO `mk_device` (`id`, `device_name`, `device_type`, `device_location`, `device_detail`, `device_danwei`, `device_nums`, `single_weight`, `total_weight`, `remarks`, `last_maintain_time`, `next_maintain_time`, `create_time`, `status`, `department`)
VALUES
	(1,'带式输送机1',2,'3331','发大水发发发fss13211','台1',11,1001.000,30001.000,'反反复复1',NULL,NULL,1567871586,4,2),
	(2,'测试设备',1,'123321','sfsfdsfdsdf','辆',1,222.000,333.000,'尔尔',NULL,NULL,1568017839,2,1);

/*!40000 ALTER TABLE `mk_device` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_device_daxiu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_device_daxiu`;

CREATE TABLE `mk_device_daxiu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL COMMENT '设备ID',
  `repair_time` int(10) unsigned NOT NULL COMMENT '修理时间',
  `worker_name` varchar(100) DEFAULT NULL COMMENT '操作者',
  `department` int(10) unsigned DEFAULT NULL COMMENT '大修部门',
  `worker_mobile` varchar(100) DEFAULT NULL COMMENT '操作者电话',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `remarks` longtext COMMENT '修理内容',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '故障状态。1：未处理。2：处理成功。3：处理失败。0：已删除',
  `sn` varchar(100) DEFAULT NULL COMMENT '单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_device_daxiu` WRITE;
/*!40000 ALTER TABLE `mk_device_daxiu` DISABLE KEYS */;

INSERT INTO `mk_device_daxiu` (`id`, `device_id`, `repair_time`, `worker_name`, `department`, `worker_mobile`, `create_time`, `remarks`, `status`, `sn`)
VALUES
	(1,2,1568257200,'张三1ab1',2,'1441ab1',1568084503,'fdsfadasfaa1233aabaa',1,'DX2019090501204645636');

/*!40000 ALTER TABLE `mk_device_daxiu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_device_document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_device_document`;

CREATE TABLE `mk_device_document` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL COMMENT '设备ID',
  `document_type` int(10) unsigned NOT NULL COMMENT '文档类型',
  `document_name` varchar(100) NOT NULL DEFAULT '' COMMENT '文档名称',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '上传时间',
  `document_size` int(10) unsigned NOT NULL COMMENT '文档大小',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `document_file` varchar(255) DEFAULT NULL COMMENT '文件位置',
  `geshi` varchar(50) DEFAULT NULL COMMENT '文件格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_device_document` WRITE;
/*!40000 ALTER TABLE `mk_device_document` DISABLE KEYS */;

INSERT INTO `mk_device_document` (`id`, `device_id`, `document_type`, `document_name`, `create_time`, `document_size`, `remarks`, `document_file`, `geshi`)
VALUES
	(1,2,2,'70.png',1568183496,21289,'fsfds','portal/20190831/f6cd2d85e5f82f24d0be29761065efec.png','png'),
	(3,2,2,'swiper1.png',1568171225,84405,'aaa','default/20190911/aace1b414df5c55f53ec8fd0ff580c72.png',NULL),
	(5,2,1,'1473129558272005.jpg',1568172016,60528,'dsfsdf','default/20190911/ca86e89979f5a2a5e73467ad17b4f292.jpg','jpg'),
	(7,1,2,'1024*1024-70.png',1568182176,138,'1fdsfds','portal/20190831/de6d18c6a364f14fba4fd14afd80802a.png','png'),
	(8,1,1,'安装说明(必读).docx',1568177318,2899,'aaa','default/20190911/02813af3c4c1676fedcb17405d940ae3.docx','docx'),
	(9,1,1,'分类信息使用说明.doc',1568177318,151,'aaa','default/20190911/de0376ef702ebc50026f9505773820c8.doc','doc'),
	(10,1,1,'admin_journal.rar',1568177660,6,'vv','default/20190911/757134a3c68aa4e109936dc24e6e191a.rar','rar'),
	(11,2,2,'1024-70.png1',1568379297,96,'啊啊啊啊啊1','default/20190913/f4b9c5e1d90624c6de68758b977de1aa.png','png1');

/*!40000 ALTER TABLE `mk_device_document` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_device_maintain
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_device_maintain`;

CREATE TABLE `mk_device_maintain` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL COMMENT '设备名称',
  `department` int(10) unsigned DEFAULT NULL COMMENT '保养部门',
  `maintain_worker` varchar(50) DEFAULT NULL COMMENT '保养人',
  `maintain_details` longtext COMMENT '保养内容',
  `create_time` int(11) DEFAULT NULL COMMENT '订单创建时间',
  `maintain_time` int(11) DEFAULT NULL COMMENT '保养时间',
  `sn` varchar(100) NOT NULL DEFAULT '' COMMENT '保养单号',
  `maintain_part` varchar(255) DEFAULT NULL COMMENT '保养部位',
  `maintain_type` varchar(50) DEFAULT NULL COMMENT '计划保养，一般保养',
  `plan_id` int(10) unsigned DEFAULT NULL COMMENT '保养计划ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_device_maintain` WRITE;
/*!40000 ALTER TABLE `mk_device_maintain` DISABLE KEYS */;

INSERT INTO `mk_device_maintain` (`id`, `device_id`, `department`, `maintain_worker`, `maintain_details`, `create_time`, `maintain_time`, `sn`, `maintain_part`, `maintain_type`, `plan_id`)
VALUES
	(3,2,2,'电风扇2','复健科2',1568187062,1568187000,'BY2019091103304986251','机位2','常规保养',NULL);

/*!40000 ALTER TABLE `mk_device_maintain` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_device_maintain_plan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_device_maintain_plan`;

CREATE TABLE `mk_device_maintain_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL COMMENT '设备名称',
  `department` int(10) unsigned DEFAULT NULL COMMENT '保养部门',
  `period_count` int(10) unsigned NOT NULL COMMENT '保养周期数量',
  `period_unit` varchar(20) DEFAULT NULL COMMENT '小时，天，月，年',
  `last_maintain_time` int(10) unsigned DEFAULT NULL COMMENT '上次保养时间',
  `maintain_worker` varchar(50) DEFAULT NULL COMMENT '保养人',
  `maintain_details` longtext COMMENT '计划描述',
  `create_time` int(11) DEFAULT NULL COMMENT '计划创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '计划更新时间',
  `maintain_part` varchar(255) DEFAULT NULL COMMENT '保养部位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_device_maintain_plan` WRITE;
/*!40000 ALTER TABLE `mk_device_maintain_plan` DISABLE KEYS */;

INSERT INTO `mk_device_maintain_plan` (`id`, `device_id`, `department`, `period_count`, `period_unit`, `last_maintain_time`, `maintain_worker`, `maintain_details`, `create_time`, `update_time`, `maintain_part`)
VALUES
	(1,2,1,33,NULL,1568187180,'电风扇1','发的说法是1',1568126840,NULL,'第三方1');

/*!40000 ALTER TABLE `mk_device_maintain_plan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_device_repair
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_device_repair`;

CREATE TABLE `mk_device_repair` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL COMMENT '设备名称',
  `department` int(10) unsigned DEFAULT NULL COMMENT '部门',
  `repair_worker` varchar(50) DEFAULT NULL COMMENT '工人',
  `repair_details` longtext COMMENT '计划描述',
  `create_time` int(11) DEFAULT NULL COMMENT '订单创建时间',
  `repair_time` int(11) DEFAULT NULL COMMENT '检修时间',
  `sn` varchar(100) NOT NULL DEFAULT '' COMMENT '单号',
  `repair_type` varchar(50) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL COMMENT '计划iD',
  `repair_part` varchar(255) DEFAULT NULL COMMENT '检修部位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_device_repair` WRITE;
/*!40000 ALTER TABLE `mk_device_repair` DISABLE KEYS */;

INSERT INTO `mk_device_repair` (`id`, `device_id`, `department`, `repair_worker`, `repair_details`, `create_time`, `repair_time`, `sn`, `repair_type`, `plan_id`, `repair_part`)
VALUES
	(3,2,1,'安安','44',1568195865,1568195820,'JX2019091105571572110','常规检修',NULL,'33'),
	(8,2,2,'安安','ss',1568196385,1568196300,'JX2019091106054879978','计划检修',1,'试试'),
	(9,2,2,'fdf','cc',1568196461,1568196420,'JX2019091106073410345','计划检修',1,'ss');

/*!40000 ALTER TABLE `mk_device_repair` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_device_repair_plan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_device_repair_plan`;

CREATE TABLE `mk_device_repair_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL COMMENT '设备ID',
  `repair_part` varchar(255) DEFAULT NULL COMMENT '检修部位',
  `department` int(11) DEFAULT NULL COMMENT '检修部门',
  `repair_details` longtext COMMENT '检修内容',
  `period_count` int(10) unsigned NOT NULL COMMENT '周期数',
  `period_uint` varchar(20) DEFAULT NULL COMMENT '小时，日，月，年',
  `repair_worker` varchar(100) DEFAULT NULL COMMENT '检修工人',
  `last_repair_time` int(11) DEFAULT NULL COMMENT '上次检修时间',
  `create_time` int(11) DEFAULT NULL COMMENT '计划创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '计划更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_device_repair_plan` WRITE;
/*!40000 ALTER TABLE `mk_device_repair_plan` DISABLE KEYS */;

INSERT INTO `mk_device_repair_plan` (`id`, `device_id`, `repair_part`, `department`, `repair_details`, `period_count`, `period_uint`, `repair_worker`, `last_repair_time`, `create_time`, `update_time`)
VALUES
	(1,2,'试试1',2,'伤口上课1',30,NULL,'李刚1',1568196420,1568190752,NULL);

/*!40000 ALTER TABLE `mk_device_repair_plan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_device_runhua
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_device_runhua`;

CREATE TABLE `mk_device_runhua` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL COMMENT '设备ID',
  `runhua_part` varchar(255) DEFAULT NULL COMMENT '加油部位',
  `department` int(11) DEFAULT NULL COMMENT '检修部门',
  `remarks` longtext COMMENT '备注',
  `oil_brand_no` varchar(100) DEFAULT NULL COMMENT '油品牌号',
  `oil_total` varchar(100) DEFAULT NULL COMMENT '加油量',
  `oil_type` varchar(100) DEFAULT NULL COMMENT '加油方式',
  `runhua_worker` varchar(100) DEFAULT NULL COMMENT '工人',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `runhua_time` int(11) DEFAULT NULL COMMENT '润滑时间',
  `plan_id` int(11) DEFAULT NULL COMMENT '计划ID',
  `sn` varchar(100) DEFAULT NULL COMMENT '单号',
  `runhua_type` varchar(100) DEFAULT NULL COMMENT '润滑类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_device_runhua` WRITE;
/*!40000 ALTER TABLE `mk_device_runhua` DISABLE KEYS */;

INSERT INTO `mk_device_runhua` (`id`, `device_id`, `runhua_part`, `department`, `remarks`, `oil_brand_no`, `oil_total`, `oil_type`, `runhua_worker`, `create_time`, `runhua_time`, `plan_id`, `sn`, `runhua_type`)
VALUES
	(2,2,'cc1',1,'sdfsdf1','dd1','bb1','1vv','aa1',1568207767,1568207700,NULL,'RH2019091109155563042','常规润滑'),
	(3,2,'da',1,'dsfdf','dd1','dccc','cd','aaa',1568207940,1568207880,NULL,'RH2019091109184443778','常规润滑'),
	(4,2,'ccc',1,'fsdfsfd','aaa','sss','ddd','vvv',1568208028,1568208000,2,'RH2019091109201754951','计划润滑'),
	(5,2,'ccc',1,'adfadf','aaa','sss','xxx','ddd',1568208263,1568208240,2,'RH2019091109241197155','计划润滑'),
	(7,2,'4441',1,'8881','4331','6661','15551','7771',1568352659,1568352600,NULL,'RH2019091301304740288','常规润滑');

/*!40000 ALTER TABLE `mk_device_runhua` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_device_runhua_plan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_device_runhua_plan`;

CREATE TABLE `mk_device_runhua_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL COMMENT '设备ID',
  `runhua_part` varchar(255) DEFAULT NULL COMMENT '加油部位',
  `department` int(11) DEFAULT NULL COMMENT '检修部门',
  `remarks` longtext COMMENT '备注',
  `oil_brand_no` varchar(100) DEFAULT NULL COMMENT '油品牌号',
  `period_count` int(10) unsigned NOT NULL COMMENT '周期数',
  `oil_total` varchar(100) DEFAULT NULL COMMENT '加油量',
  `oil_type` varchar(100) DEFAULT NULL COMMENT '加油方式',
  `period_uint` varchar(20) DEFAULT NULL COMMENT '小时，日，月，年',
  `runhua_worker` varchar(100) DEFAULT NULL COMMENT '检修工人',
  `last_runhua_time` int(11) DEFAULT NULL COMMENT '上次润滑时间',
  `create_time` int(11) DEFAULT NULL COMMENT '计划创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '计划更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_device_runhua_plan` WRITE;
/*!40000 ALTER TABLE `mk_device_runhua_plan` DISABLE KEYS */;

INSERT INTO `mk_device_runhua_plan` (`id`, `device_id`, `runhua_part`, `department`, `remarks`, `oil_brand_no`, `period_count`, `oil_total`, `oil_type`, `period_uint`, `runhua_worker`, `last_runhua_time`, `create_time`, `update_time`)
VALUES
	(2,2,'cc',1,' adf','aa',20,'ss','bb',NULL,'dd',1568208240,1568202813,NULL);

/*!40000 ALTER TABLE `mk_device_runhua_plan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_device_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_device_status`;

CREATE TABLE `mk_device_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '状态名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_device_status` WRITE;
/*!40000 ALTER TABLE `mk_device_status` DISABLE KEYS */;

INSERT INTO `mk_device_status` (`id`, `name`, `create_time`, `remarks`)
VALUES
	(2,'在用',NULL,''),
	(3,'报废',NULL,''),
	(4,'备用',NULL,''),
	(5,'待维修',NULL,''),
	(6,'维修中',NULL,'');

/*!40000 ALTER TABLE `mk_device_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_device_trouble
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_device_trouble`;

CREATE TABLE `mk_device_trouble` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL COMMENT '设备ID',
  `trouble_level` varchar(50) DEFAULT NULL COMMENT '故障等级',
  `trouble_start_time` int(10) unsigned NOT NULL COMMENT '故障发生时间',
  `department` int(11) DEFAULT NULL COMMENT '维修部门',
  `trouble_details` longtext COMMENT '故障描述',
  `worker_name` varchar(100) DEFAULT NULL COMMENT '操作者',
  `worker_mobile` varchar(100) DEFAULT NULL COMMENT '操作者电话',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `remarks` longtext COMMENT '故障处理内容',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '故障状态。1：未处理。2：处理成功。3：处理失败。0：已删除',
  `sn` varchar(100) DEFAULT NULL COMMENT '单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_device_trouble` WRITE;
/*!40000 ALTER TABLE `mk_device_trouble` DISABLE KEYS */;

INSERT INTO `mk_device_trouble` (`id`, `device_id`, `trouble_level`, `trouble_start_time`, `department`, `trouble_details`, `worker_name`, `worker_mobile`, `create_time`, `remarks`, `status`, `sn`)
VALUES
	(1,2,'重大',1568047080,2,'fsfsfsfdsf','张三','15560144888',1568047109,'',1,'GZ2019091201204645636'),
	(3,1,'其他',1568076420,1,'fdfsfe1','fdsf1','fds1',1568049731,'aaaa1111',1,NULL),
	(4,2,'一般',1568085900,1,'ff','ff','ff',1568085923,'',1,'GZ2019091201204645333');

/*!40000 ALTER TABLE `mk_device_trouble` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_hook
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_hook`;

CREATE TABLE `mk_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

LOCK TABLES `mk_hook` WRITE;
/*!40000 ALTER TABLE `mk_hook` DISABLE KEYS */;

INSERT INTO `mk_hook` (`id`, `type`, `once`, `name`, `hook`, `app`, `description`)
VALUES
	(2,1,0,'应用开始','app_begin','cmf','应用开始'),
	(3,1,0,'模块初始化','module_init','cmf','模块初始化'),
	(4,1,0,'控制器开始','action_begin','cmf','控制器开始'),
	(5,1,0,'视图输出过滤','view_filter','cmf','视图输出过滤'),
	(6,1,0,'应用结束','app_end','cmf','应用结束'),
	(7,1,0,'日志write方法','log_write','cmf','日志write方法'),
	(8,1,0,'输出结束','response_end','cmf','输出结束'),
	(9,1,0,'后台控制器初始化','admin_init','cmf','后台控制器初始化'),
	(10,1,0,'前台控制器初始化','home_init','cmf','前台控制器初始化'),
	(11,1,1,'发送手机验证码','send_mobile_verification_code','cmf','发送手机验证码'),
	(12,3,0,'模板 body标签开始','body_start','','模板 body标签开始'),
	(13,3,0,'模板 head标签结束前','before_head_end','','模板 head标签结束前'),
	(14,3,0,'模板底部开始','footer_start','','模板底部开始'),
	(15,3,0,'模板底部开始之前','before_footer','','模板底部开始之前'),
	(16,3,0,'模板底部结束之前','before_footer_end','','模板底部结束之前'),
	(17,3,0,'模板 body 标签结束之前','before_body_end','','模板 body 标签结束之前'),
	(18,3,0,'模板左边栏开始','left_sidebar_start','','模板左边栏开始'),
	(19,3,0,'模板左边栏结束之前','before_left_sidebar_end','','模板左边栏结束之前'),
	(20,3,0,'模板右边栏开始','right_sidebar_start','','模板右边栏开始'),
	(21,3,0,'模板右边栏结束之前','before_right_sidebar_end','','模板右边栏结束之前'),
	(22,3,1,'评论区','comment','','评论区'),
	(23,3,1,'留言区','guestbook','','留言区'),
	(24,2,0,'后台首页仪表盘','admin_dashboard','admin','后台首页仪表盘'),
	(25,4,0,'后台模板 head标签结束前','admin_before_head_end','','后台模板 head标签结束前'),
	(26,4,0,'后台模板 body 标签结束之前','admin_before_body_end','','后台模板 body 标签结束之前'),
	(27,2,0,'后台登录页面','admin_login','admin','后台登录页面'),
	(28,1,1,'前台模板切换','switch_theme','cmf','前台模板切换'),
	(29,3,0,'主要内容之后','after_content','','主要内容之后'),
	(32,2,1,'获取上传界面','fetch_upload_view','user','获取上传界面'),
	(33,3,0,'主要内容之前','before_content','cmf','主要内容之前'),
	(34,1,0,'日志写入完成','log_write_done','cmf','日志写入完成'),
	(35,1,1,'后台模板切换','switch_admin_theme','cmf','后台模板切换'),
	(36,1,1,'验证码图片','captcha_image','cmf','验证码图片'),
	(37,2,1,'后台模板设计界面','admin_theme_design_view','admin','后台模板设计界面'),
	(38,2,1,'后台设置网站信息界面','admin_setting_site_view','admin','后台设置网站信息界面'),
	(39,2,1,'后台清除缓存界面','admin_setting_clear_cache_view','admin','后台清除缓存界面'),
	(40,2,1,'后台导航管理界面','admin_nav_index_view','admin','后台导航管理界面'),
	(41,2,1,'后台友情链接管理界面','admin_link_index_view','admin','后台友情链接管理界面'),
	(42,2,1,'后台幻灯片管理界面','admin_slide_index_view','admin','后台幻灯片管理界面'),
	(43,2,1,'后台管理员列表界面','admin_user_index_view','admin','后台管理员列表界面'),
	(44,2,1,'后台角色管理界面','admin_rbac_index_view','admin','后台角色管理界面'),
	(49,2,1,'用户管理本站用户列表界面','user_admin_index_view','user','用户管理本站用户列表界面'),
	(50,2,1,'资源管理列表界面','user_admin_asset_index_view','user','资源管理列表界面'),
	(51,2,1,'用户管理第三方用户列表界面','user_admin_oauth_index_view','user','用户管理第三方用户列表界面'),
	(52,2,1,'后台首页界面','admin_index_index_view','admin','后台首页界面'),
	(53,2,1,'后台回收站界面','admin_recycle_bin_index_view','admin','后台回收站界面'),
	(54,2,1,'后台菜单管理界面','admin_menu_index_view','admin','后台菜单管理界面'),
	(55,2,1,'后台自定义登录是否开启钩子','admin_custom_login_open','admin','后台自定义登录是否开启钩子'),
	(64,2,1,'后台幻灯片页面列表界面','admin_slide_item_index_view','admin','后台幻灯片页面列表界面'),
	(65,2,1,'后台幻灯片页面添加界面','admin_slide_item_add_view','admin','后台幻灯片页面添加界面'),
	(66,2,1,'后台幻灯片页面编辑界面','admin_slide_item_edit_view','admin','后台幻灯片页面编辑界面'),
	(67,2,1,'后台管理员添加界面','admin_user_add_view','admin','后台管理员添加界面'),
	(68,2,1,'后台管理员编辑界面','admin_user_edit_view','admin','后台管理员编辑界面'),
	(69,2,1,'后台角色添加界面','admin_rbac_role_add_view','admin','后台角色添加界面'),
	(70,2,1,'后台角色编辑界面','admin_rbac_role_edit_view','admin','后台角色编辑界面'),
	(71,2,1,'后台角色授权界面','admin_rbac_authorize_view','admin','后台角色授权界面');

/*!40000 ALTER TABLE `mk_hook` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_hook_plugin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_hook_plugin`;

CREATE TABLE `mk_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

LOCK TABLES `mk_hook_plugin` WRITE;
/*!40000 ALTER TABLE `mk_hook_plugin` DISABLE KEYS */;

INSERT INTO `mk_hook_plugin` (`id`, `list_order`, `status`, `hook`, `plugin`)
VALUES
	(1,10000,1,'admin_init','AdminJournal');

/*!40000 ALTER TABLE `mk_hook_plugin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_link`;

CREATE TABLE `mk_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

LOCK TABLES `mk_link` WRITE;
/*!40000 ALTER TABLE `mk_link` DISABLE KEYS */;

INSERT INTO `mk_link` (`id`, `status`, `rating`, `list_order`, `description`, `url`, `name`, `image`, `target`, `rel`)
VALUES
	(1,1,1,8,'thinkcmf官网','http://www.thinkcmf.com','ThinkCMF','','_blank','');

/*!40000 ALTER TABLE `mk_link` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_nav
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_nav`;

CREATE TABLE `mk_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';

LOCK TABLES `mk_nav` WRITE;
/*!40000 ALTER TABLE `mk_nav` DISABLE KEYS */;

INSERT INTO `mk_nav` (`id`, `is_main`, `name`, `remark`)
VALUES
	(1,1,'主导航','主导航'),
	(2,0,'底部导航','');

/*!40000 ALTER TABLE `mk_nav` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_nav_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_nav_menu`;

CREATE TABLE `mk_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';

LOCK TABLES `mk_nav_menu` WRITE;
/*!40000 ALTER TABLE `mk_nav_menu` DISABLE KEYS */;

INSERT INTO `mk_nav_menu` (`id`, `nav_id`, `parent_id`, `status`, `list_order`, `name`, `target`, `href`, `icon`, `path`)
VALUES
	(1,1,0,1,0,'首页','','home','','0-1');

/*!40000 ALTER TABLE `mk_nav_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_option`;

CREATE TABLE `mk_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

LOCK TABLES `mk_option` WRITE;
/*!40000 ALTER TABLE `mk_option` DISABLE KEYS */;

INSERT INTO `mk_option` (`id`, `autoload`, `option_name`, `option_value`)
VALUES
	(1,1,'site_info','{\"site_name\":\"\\u53e4\\u57ce\\u77ff\\u9009\\u7164\\u5382\\u4fe1\\u606f\\u7ba1\\u7406\\u7cfb\\u7edf\",\"site_seo_title\":\"\\u53e4\\u57ce\\u77ff\\u9009\\u7164\\u5382\\u4fe1\\u606f\\u7ba1\\u7406\\u7cfb\\u7edf\",\"site_seo_keywords\":\"ThinkCMF,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework\",\"site_seo_description\":\"\\u53e4\\u57ce\\u77ff\\u9009\\u7164\\u5382\\u4fe1\\u606f\\u7ba1\\u7406\\u7cfb\\u7edf\",\"site_icp\":\"\",\"site_gwa\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\"}'),
	(2,1,'cmf_settings','{\"open_registration\":\"0\",\"banned_usernames\":\"\"}'),
	(3,1,'cdn_settings','{\"cdn_static_root\":\"\"}'),
	(4,1,'admin_settings','{\"admin_password\":\"\",\"admin_theme\":\"admin_simpleboot3\",\"admin_style\":\"flatadmin\"}');

/*!40000 ALTER TABLE `mk_option` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_plugin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_plugin`;

CREATE TABLE `mk_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

LOCK TABLES `mk_plugin` WRITE;
/*!40000 ALTER TABLE `mk_plugin` DISABLE KEYS */;

INSERT INTO `mk_plugin` (`id`, `type`, `has_admin`, `status`, `create_time`, `name`, `title`, `demo_url`, `hooks`, `author`, `author_url`, `version`, `description`, `config`)
VALUES
	(1,1,1,1,0,'AdminJournal','操作日志','https://www.wzxaini9.cn/','','Powerless','https://www.wzxaini9.cn/','1.2.0','后台操作日志','[]');

/*!40000 ALTER TABLE `mk_plugin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_portal_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_portal_category`;

CREATE TABLE `mk_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';

LOCK TABLES `mk_portal_category` WRITE;
/*!40000 ALTER TABLE `mk_portal_category` DISABLE KEYS */;

INSERT INTO `mk_portal_category` (`id`, `parent_id`, `post_count`, `status`, `delete_time`, `list_order`, `name`, `description`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `more`)
VALUES
	(1,0,0,1,0,10000,'安全公告','','0-1','','','','list','article','{\"thumbnail\":\"\"}'),
	(2,0,0,1,0,10000,'安全报表','','0-2','','','','list','article','{\"thumbnail\":\"\"}'),
	(3,0,0,1,0,10000,'在线学习','','0-3','','','','list','article','{\"thumbnail\":\"\"}'),
	(4,1,0,1,0,10000,'新款','','0-1-4','','','','list','article','{\"thumbnail\":\"\"}');

/*!40000 ALTER TABLE `mk_portal_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_portal_category_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_portal_category_post`;

CREATE TABLE `mk_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

LOCK TABLES `mk_portal_category_post` WRITE;
/*!40000 ALTER TABLE `mk_portal_category_post` DISABLE KEYS */;

INSERT INTO `mk_portal_category_post` (`id`, `post_id`, `category_id`, `list_order`, `status`)
VALUES
	(1,1,1,10000,1),
	(2,2,1,10000,1),
	(4,3,3,10000,1),
	(5,4,2,10000,1),
	(6,5,1,10000,1),
	(7,6,4,10000,1);

/*!40000 ALTER TABLE `mk_portal_category_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_portal_device_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_portal_device_category`;

CREATE TABLE `mk_portal_device_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类设备数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';

LOCK TABLES `mk_portal_device_category` WRITE;
/*!40000 ALTER TABLE `mk_portal_device_category` DISABLE KEYS */;

INSERT INTO `mk_portal_device_category` (`id`, `parent_id`, `post_count`, `status`, `delete_time`, `list_order`, `name`, `description`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `more`)
VALUES
	(1,0,0,1,0,10000,'主设备','VVV','0-1','','','','','','{\"thumbnail\":\"portal\\/20190831\\/f6cd2d85e5f82f24d0be29761065efec.png\"}'),
	(2,0,0,1,0,10000,'子设备','','0-2','','','','','','{\"thumbnail\":\"\"}'),
	(3,1,0,1,0,10000,'202提升设备','vvvvxxx','0-1-3','','','','','','{\"thumbnail\":\"\"}'),
	(4,3,0,1,0,10000,'333fl','','0-1-3-4','','','','','','{\"thumbnail\":\"\"}');

/*!40000 ALTER TABLE `mk_portal_device_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_portal_device_category_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_portal_device_category_post`;

CREATE TABLE `mk_portal_device_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';



# Dump of table mk_portal_device_document_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_portal_device_document_category`;

CREATE TABLE `mk_portal_device_document_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';

LOCK TABLES `mk_portal_device_document_category` WRITE;
/*!40000 ALTER TABLE `mk_portal_device_document_category` DISABLE KEYS */;

INSERT INTO `mk_portal_device_document_category` (`id`, `parent_id`, `post_count`, `status`, `delete_time`, `list_order`, `name`, `description`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `more`)
VALUES
	(1,0,0,1,0,10000,'技术资料','','0-1','','','','','','{\"thumbnail\":\"\"}'),
	(2,0,0,1,0,10000,'培训资料','','0-2','','','','','','{\"thumbnail\":\"\"}');

/*!40000 ALTER TABLE `mk_portal_device_document_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_portal_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_portal_post`;

CREATE TABLE `mk_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_favorites` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

LOCK TABLES `mk_portal_post` WRITE;
/*!40000 ALTER TABLE `mk_portal_post` DISABLE KEYS */;

INSERT INTO `mk_portal_post` (`id`, `parent_id`, `post_type`, `post_format`, `user_id`, `post_status`, `comment_status`, `is_top`, `recommended`, `post_hits`, `post_favorites`, `post_like`, `comment_count`, `create_time`, `update_time`, `published_time`, `delete_time`, `post_title`, `post_keywords`, `post_excerpt`, `post_source`, `thumbnail`, `post_content`, `post_content_filtered`, `more`)
VALUES
	(1,0,1,1,1,1,1,0,0,42,0,0,0,1567219264,1567219264,1567248458,0,'安全公告测试','公告','','','portal/20190831/de6d18c6a364f14fba4fd14afd80802a.png','&lt;p&gt;安全公告内容&lt;/p&gt;',NULL,'{\"audio\":\"portal\\/20190831\\/4eeb117383dcc5df0047084a9be454aa.mp3\",\"video\":\"portal\\/20190831\\/2f95abea0f0881335374013bfd5bc28e.mp4\",\"thumbnail\":\"portal\\/20190831\\/de6d18c6a364f14fba4fd14afd80802a.png\",\"template\":\"\",\"photos\":[{\"url\":\"portal\\/20190831\\/62dd3c0d898fef8f664eab42df5f23a4.jpg\",\"name\":\"IMG_1697.JPG\"},{\"url\":\"portal\\/20190831\\/cf5f340bbdeb635dba3e005d77eaa8eb.jpg\",\"name\":\"IMG_1702.JPG\"}],\"files\":[{\"url\":\"portal\\/20190831\\/6e4adedeccb9ace5713affe290f4d6da.zip\",\"name\":\"模板巴士手机版模块文件（解压后浏览器打开）h5v2.zip\"}]}'),
	(2,0,1,1,1,1,1,0,0,6,0,0,0,1567249059,1567249059,1567249071,0,'测试1','','','','','&lt;p&gt;测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1&lt;/p&gt;',NULL,'{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"\",\"template\":\"\"}'),
	(3,0,1,1,1,1,1,0,0,3,0,0,0,1567252685,1567252713,1567252969,0,'在线学习测试2','','','','',NULL,NULL,'{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"\",\"template\":\"\"}'),
	(4,0,1,1,1,1,1,0,0,2,0,0,0,1567252984,1567252984,1567252992,0,'安全报表测试','','','','',NULL,NULL,'{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"\",\"template\":\"\"}'),
	(5,0,1,1,1,1,1,0,0,72,0,0,0,1567262013,1567262013,1567262021,0,'测试安全功能','','','','','\n&lt;p style=&quot;line-height: 16px;&quot;&gt;&lt;img style=&quot;vertical-align: middle; margin-right: 2px;&quot; src=&quot;/static/js/ueditor/dialogs/attachment/fileTypeImages/icon_txt.gif&quot;&gt;&lt;a style=&quot;font-size:12px; color:#0066cc;&quot; href=&quot;default/20190831/46b1ab875b846afe5942699b19a687cb.xlsx&quot; title=&quot;order__0428005726.xlsx&quot;&gt;order__0428005726.xlsx&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n',NULL,'{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"\",\"template\":\"\"}'),
	(6,0,1,1,1,1,1,0,0,0,0,0,0,1567846229,1567846229,1567846298,0,'测试，','','','','',NULL,NULL,'{\"audio\":\"\",\"video\":\"\",\"thumbnail\":\"\",\"template\":\"\"}');

/*!40000 ALTER TABLE `mk_portal_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_portal_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_portal_tag`;

CREATE TABLE `mk_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';

LOCK TABLES `mk_portal_tag` WRITE;
/*!40000 ALTER TABLE `mk_portal_tag` DISABLE KEYS */;

INSERT INTO `mk_portal_tag` (`id`, `status`, `recommended`, `post_count`, `name`)
VALUES
	(1,1,0,0,'公告');

/*!40000 ALTER TABLE `mk_portal_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_portal_tag_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_portal_tag_post`;

CREATE TABLE `mk_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

LOCK TABLES `mk_portal_tag_post` WRITE;
/*!40000 ALTER TABLE `mk_portal_tag_post` DISABLE KEYS */;

INSERT INTO `mk_portal_tag_post` (`id`, `tag_id`, `post_id`, `status`)
VALUES
	(1,1,1,1);

/*!40000 ALTER TABLE `mk_portal_tag_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_produce
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_produce`;

CREATE TABLE `mk_produce` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classes` tinyint(2) unsigned NOT NULL COMMENT '班次：0：零点班；8：八点班；4：四点班',
  `rawcoal` decimal(10,2) unsigned NOT NULL COMMENT '原煤仓位（m）',
  `zjtm` decimal(10,2) unsigned NOT NULL COMMENT '主井提煤（吨）',
  `rxym_tooo` decimal(10,2) unsigned NOT NULL COMMENT '入洗原煤（吨）3001',
  `rxym_toot` decimal(10,2) unsigned NOT NULL COMMENT '入洗原煤（吨）3003',
  `hm_eoo` decimal(10,2) unsigned NOT NULL COMMENT '801混煤（吨）',
  `pc_eot` decimal(10,2) unsigned NOT NULL COMMENT '802喷吹（吨）',
  `xh_eot` decimal(10,2) unsigned NOT NULL COMMENT '803洗混（吨）',
  `kj_eof` decimal(10,2) unsigned NOT NULL COMMENT '804块精（吨）',
  `mgs_noo` decimal(10,2) unsigned NOT NULL COMMENT '901末矸石（吨）',
  `kgs_not` decimal(10,2) unsigned NOT NULL COMMENT '902块矸石（吨）',
  `jcmc` decimal(10,2) unsigned NOT NULL COMMENT '进储煤厂（吨）',
  `dxcw_mgs` decimal(10,2) unsigned NOT NULL COMMENT '地销仓位（m）1#末矸石',
  `dxcw_kgs` decimal(10,2) unsigned NOT NULL COMMENT '地销仓位（m）2#块矸石',
  `dxcw_kjm` decimal(10,2) unsigned NOT NULL COMMENT '地销仓位（m）3#块精煤',
  `dxcw_hm_four` decimal(10,2) unsigned NOT NULL COMMENT '地销仓位（m）4#混煤',
  `dxcw_pcm` decimal(10,2) unsigned NOT NULL COMMENT '地销仓位（m）5#喷吹煤',
  `dxcw_hm_six` decimal(10,2) unsigned NOT NULL COMMENT '地销仓位（m）6#混煤',
  `trouble_time` decimal(10,2) unsigned NOT NULL COMMENT '事故时间（h）',
  `yxdm_time` decimal(10,2) unsigned NOT NULL COMMENT '有效带煤时间（h）',
  `yldl` int(11) unsigned NOT NULL COMMENT '压滤打料（台数）',
  `jypl` int(11) unsigned NOT NULL COMMENT '加压排料（次数）',
  `bzz_dd` varchar(20) DEFAULT NULL COMMENT '班组长 调度',
  `bzz_ym` varchar(20) DEFAULT NULL COMMENT '班组长 原煤',
  `bzz_zx` varchar(20) DEFAULT NULL COMMENT '班组长 主洗',
  `bzz_ys` varchar(20) DEFAULT NULL COMMENT '班组长 运输',
  `bzz_jx` varchar(20) DEFAULT NULL COMMENT '班组长 机修',
  `bzz_dg` varchar(20) DEFAULT NULL COMMENT '班组长 电工',
  `create_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_produce` WRITE;
/*!40000 ALTER TABLE `mk_produce` DISABLE KEYS */;

INSERT INTO `mk_produce` (`id`, `classes`, `rawcoal`, `zjtm`, `rxym_tooo`, `rxym_toot`, `hm_eoo`, `pc_eot`, `xh_eot`, `kj_eof`, `mgs_noo`, `kgs_not`, `jcmc`, `dxcw_mgs`, `dxcw_kgs`, `dxcw_kjm`, `dxcw_hm_four`, `dxcw_pcm`, `dxcw_hm_six`, `trouble_time`, `yxdm_time`, `yldl`, `jypl`, `bzz_dd`, `bzz_ym`, `bzz_zx`, `bzz_ys`, `bzz_jx`, `bzz_dg`, `create_time`, `status`)
VALUES
	(2,8,1000.00,999.00,888.00,777.00,666.00,555.00,444.00,333.00,222.00,111.00,99.00,66.00,55.00,44.00,33.00,22.00,11.00,1.50,2.20,10,20,'张三','李四','王五','张柳','赵柳','郑某',1567432389,1);

/*!40000 ALTER TABLE `mk_produce` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_recycle_bin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_recycle_bin`;

CREATE TABLE `mk_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';



# Dump of table mk_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_role`;

CREATE TABLE `mk_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

LOCK TABLES `mk_role` WRITE;
/*!40000 ALTER TABLE `mk_role` DISABLE KEYS */;

INSERT INTO `mk_role` (`id`, `parent_id`, `status`, `create_time`, `update_time`, `list_order`, `name`, `remark`)
VALUES
	(1,0,1,1329633709,1329633709,0,'超级管理员','拥有网站最高管理员权限！'),
	(2,0,1,1329633709,1329633709,0,'普通管理员','权限由最高管理员分配！');

/*!40000 ALTER TABLE `mk_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_role_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_role_user`;

CREATE TABLE `mk_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';



# Dump of table mk_route
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_route`;

CREATE TABLE `mk_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';



# Dump of table mk_slide
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_slide`;

CREATE TABLE `mk_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';



# Dump of table mk_slide_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_slide_item`;

CREATE TABLE `mk_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';



# Dump of table mk_theme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_theme`;

CREATE TABLE `mk_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mk_theme` WRITE;
/*!40000 ALTER TABLE `mk_theme` DISABLE KEYS */;

INSERT INTO `mk_theme` (`id`, `create_time`, `update_time`, `status`, `is_compiled`, `theme`, `name`, `version`, `demo_url`, `thumbnail`, `author`, `author_url`, `lang`, `keywords`, `description`)
VALUES
	(1,0,0,0,0,'default','default','1.0.0','http://demo.thinkcmf.com','','ThinkCMF','http://www.thinkcmf.com','zh-cn','ThinkCMF默认模板','ThinkCMF默认模板'),
	(2,0,0,0,0,'simpleboot3','simpleboot3','1.0.2','http://demo.thinkcmf.com','','ThinkCMF','http://www.thinkcmf.com','zh-cn','ThinkCMF模板','ThinkCMF默认模板');

/*!40000 ALTER TABLE `mk_theme` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_theme_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_theme_file`;

CREATE TABLE `mk_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mk_theme_file` WRITE;
/*!40000 ALTER TABLE `mk_theme_file` DISABLE KEYS */;

INSERT INTO `mk_theme_file` (`id`, `is_public`, `list_order`, `theme`, `name`, `action`, `file`, `description`, `more`, `config_more`, `draft_more`)
VALUES
	(1,0,10,'simpleboot3','文章页','portal/Article/index','portal/article','文章页模板文件','{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}','{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}',NULL),
	(2,0,10,'simpleboot3','联系我们页','portal/Page/index','portal/contact','联系我们页模板文件','{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}','{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}',NULL),
	(3,0,5,'simpleboot3','首页','portal/Index/index','portal/index','首页模板文件','{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}',NULL),
	(5,0,10,'simpleboot3','单页面','portal/Page/index','portal/page','单页面模板文件','{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}',NULL),
	(6,0,10,'simpleboot3','搜索页面','portal/search/index','portal/search','搜索模板文件','{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}','{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}',NULL),
	(7,1,0,'simpleboot3','模板全局配置','public/Config','public/config','模板全局配置文件','{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}','{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}',NULL),
	(8,1,1,'simpleboot3','导航条','public/Nav','public/nav','导航条模板文件','{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}','{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}',NULL),
	(9,0,10,'simpleboot3','文章列表页','portal/List/index','portal/list','文章列表模板文件','{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}',NULL);

/*!40000 ALTER TABLE `mk_theme_file` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_third_party_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_third_party_user`;

CREATE TABLE `mk_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方唯一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';



# Dump of table mk_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_user`;

CREATE TABLE `mk_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

LOCK TABLES `mk_user` WRITE;
/*!40000 ALTER TABLE `mk_user` DISABLE KEYS */;

INSERT INTO `mk_user` (`id`, `user_type`, `sex`, `birthday`, `last_login_time`, `score`, `coin`, `balance`, `create_time`, `user_status`, `user_login`, `user_pass`, `user_nickname`, `user_email`, `user_url`, `avatar`, `signature`, `last_login_ip`, `user_activation_key`, `mobile`, `more`)
VALUES
	(1,1,0,0,1568346961,0,0,0.00,1567046364,1,'admin','###62b26e11bf373689a4ae17fdd392d5ab','admin','admin@admin.com','','','','::1','','',NULL);

/*!40000 ALTER TABLE `mk_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_user_action
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_user_action`;

CREATE TABLE `mk_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';

LOCK TABLES `mk_user_action` WRITE;
/*!40000 ALTER TABLE `mk_user_action` DISABLE KEYS */;

INSERT INTO `mk_user_action` (`id`, `score`, `coin`, `reward_number`, `cycle_type`, `cycle_time`, `name`, `action`, `app`, `url`)
VALUES
	(1,1,1,1,2,1,'用户登录','login','user','');

/*!40000 ALTER TABLE `mk_user_action` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_user_action_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_user_action_log`;

CREATE TABLE `mk_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';



# Dump of table mk_user_balance_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_user_balance_log`;

CREATE TABLE `mk_user_balance_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户余额变更日志表';



# Dump of table mk_user_favorite
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_user_favorite`;

CREATE TABLE `mk_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，JSON格式',
  `description` text COMMENT '收藏内容的描述',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';



# Dump of table mk_user_like
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_user_like`;

CREATE TABLE `mk_user_like` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容原来的主键id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '内容以前所在表,不带前缀',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容的原文地址，不带域名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` text COMMENT '内容的描述',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户点赞表';



# Dump of table mk_user_login_attempt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_user_login_attempt`;

CREATE TABLE `mk_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';



# Dump of table mk_user_score_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_user_score_log`;

CREATE TABLE `mk_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';



# Dump of table mk_user_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_user_token`;

CREATE TABLE `mk_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

LOCK TABLES `mk_user_token` WRITE;
/*!40000 ALTER TABLE `mk_user_token` DISABLE KEYS */;

INSERT INTO `mk_user_token` (`id`, `user_id`, `expire_time`, `create_time`, `token`, `device_type`)
VALUES
	(1,1,1582598385,1567046385,'32b5fa41382c0baf1c889165ae36059f057c4ba015b161075dc91d9d1d9adc01','web');

/*!40000 ALTER TABLE `mk_user_token` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_verification_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_verification_code`;

CREATE TABLE `mk_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';



# Dump of table mk_warehouse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_warehouse`;

CREATE TABLE `mk_warehouse` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wh_name` varchar(100) NOT NULL DEFAULT '' COMMENT '仓库名称',
  `wh_code` varchar(100) DEFAULT NULL COMMENT '仓库编号',
  `wh_fzr` varchar(20) DEFAULT NULL COMMENT '仓库负责人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_warehouse` WRITE;
/*!40000 ALTER TABLE `mk_warehouse` DISABLE KEYS */;

INSERT INTO `mk_warehouse` (`id`, `wh_name`, `wh_code`, `wh_fzr`, `remarks`, `list_order`, `create_time`, `status`)
VALUES
	(2,'选煤厂仓库','xmc001','李刚','备注',10000,NULL,NULL),
	(3,'煤矿仓库','mkck','李四','备注',10000,NULL,NULL),
	(4,'选煤厂2号仓库','xmc002','赵四','xx',10000,NULL,NULL);

/*!40000 ALTER TABLE `mk_warehouse` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_warehouse_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_warehouse_goods`;

CREATE TABLE `mk_warehouse_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(100) NOT NULL DEFAULT '' COMMENT '物品名称',
  `warehouse` int(5) unsigned NOT NULL COMMENT '仓库ID',
  `goods_type` varchar(255) NOT NULL DEFAULT '' COMMENT '规格型号',
  `danwei` varchar(20) NOT NULL DEFAULT '' COMMENT '物品单位',
  `goods_no` varchar(255) DEFAULT NULL COMMENT '物品编号',
  `goods_code` varchar(100) DEFAULT NULL COMMENT '物品条码',
  `gys` varchar(100) DEFAULT NULL COMMENT '供应商',
  `goods_nums` int(11) NOT NULL DEFAULT '0' COMMENT '物品数量',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `create_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(2) unsigned DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_warehouse_goods` WRITE;
/*!40000 ALTER TABLE `mk_warehouse_goods` DISABLE KEYS */;

INSERT INTO `mk_warehouse_goods` (`id`, `goods_name`, `warehouse`, `goods_type`, `danwei`, `goods_no`, `goods_code`, `gys`, `goods_nums`, `list_order`, `create_time`, `status`, `remarks`)
VALUES
	(1,'下无源液压纠偏器',4,'WY-1600XY','套','xxxxaaaa','234324234241','',-3,10000,NULL,NULL,''),
	(3,'测试',4,'测试规格','单位','fddfs342','34324242','',-4,10000,NULL,NULL,'');

/*!40000 ALTER TABLE `mk_warehouse_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_warehouse_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_warehouse_order`;

CREATE TABLE `mk_warehouse_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) NOT NULL DEFAULT '' COMMENT '单据号',
  `creater` varchar(20) NOT NULL DEFAULT '' COMMENT '制单人',
  `warehouse` int(10) unsigned NOT NULL COMMENT '仓库ID',
  `create_time` varchar(20) DEFAULT NULL COMMENT '时间',
  `status` int(2) unsigned NOT NULL DEFAULT '1',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:出库；2：入库',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_warehouse_order` WRITE;
/*!40000 ALTER TABLE `mk_warehouse_order` DISABLE KEYS */;

INSERT INTO `mk_warehouse_order` (`id`, `sn`, `creater`, `warehouse`, `create_time`, `status`, `remarks`, `type`)
VALUES
	(1,'SN2019090507470061266','admin',4,'1567684033',1,'',1);

/*!40000 ALTER TABLE `mk_warehouse_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mk_warehouse_order_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mk_warehouse_order_goods`;

CREATE TABLE `mk_warehouse_order_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` tinyint(9) unsigned NOT NULL COMMENT '物品ID',
  `order_id` tinyint(9) unsigned NOT NULL COMMENT '出入库ID',
  `nums` int(9) unsigned NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `mk_warehouse_order_goods` WRITE;
/*!40000 ALTER TABLE `mk_warehouse_order_goods` DISABLE KEYS */;

INSERT INTO `mk_warehouse_order_goods` (`id`, `goods_id`, `order_id`, `nums`)
VALUES
	(1,3,1,2),
	(2,1,1,3);

/*!40000 ALTER TABLE `mk_warehouse_order_goods` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
