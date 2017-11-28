/*
Navicat MySQL Data Transfer

Source Server         : 0localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : xinxiadan

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-11-23 10:20:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_action`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action`;
CREATE TABLE `onethink_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of xd_action
-- ----------------------------
INSERT INTO `onethink_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '2', '1', '1383295068');
INSERT INTO `onethink_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '2', '1', '1380173180');
INSERT INTO `onethink_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '2', '1', '1383285646');
INSERT INTO `onethink_action` VALUES ('4', 'add_document_blog', '发表博客', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '2', '1', '1383285637');
INSERT INTO `onethink_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '2', '1', '1383285551');
INSERT INTO `onethink_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '1', '1', '1383294988');
INSERT INTO `onethink_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '1', '1', '1383295057');
INSERT INTO `onethink_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '1', '1', '1383295963');
INSERT INTO `onethink_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '1', '1', '1383296301');
INSERT INTO `onethink_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '1', '1', '1383296765');
INSERT INTO `onethink_action` VALUES ('12', 'temp_add', '添加模板', '添加模板', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('13', 'temp_update', '修改模板', '修改模板', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('14', 'temp_del', '删除模板', '删除模板', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('15', 'source_add', '推广渠道添加', '推广渠道添加', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('16', 'source_update', '推广渠道修改', '推广渠道修改', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('17', 'source_del', '推广渠道删除', '推广渠道删除', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('18', 'order_table_list', '订单字段修改', '订单字段修改', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('19', 'user_add', '添加管理员', '添加管理员', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('20', 'user_update', '修改管理员', '修改管理员', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('21', 'user_del', '删除管理员', '删除管理员', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('22', 'per_add', '管理权限添加', '管理权限添加', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('23', 'per_del', '管理权限删除', '管理权限删除', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('24', 'per_update', '管理权限修改', '管理权限修改', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('25', 'import', '数据库还原', '数据库还原', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('26', 'export', '数据库备份', '数据库备份', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('27', 'paycode_del', '支付二维码删除', '支付二维码删除', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('28', 'paycode_add', '支付二维码添加', '支付二维码添加', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('29', 'paycode_update', '支付二维码修改', '支付二维码修改', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('30', 'order_del', '订单删除', '订单删除', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('31', 'order_update', '订单修改', '订单修改', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('32', 'order_export', '订单导出', '订单导出', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('33', 'pro_add', '产品添加', '产品添加', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('34', 'pro_update', '产品修改', '产品修改', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('35', 'pro_del', '产品删除', '产品删除', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('36', 'alipay', '配置支付宝支付', '配置支付宝支付', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('37', 'weixin', '配置微信支付', '配置微信支付', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('38', 'sms', '配置短信', '配置短信', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('39', 'email', '配置邮箱', '配置邮箱', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('40', 'htmlvalue', '开启关闭网页静态', '开启关闭网页静态', '', '1', '1', '1383296392');

-- ----------------------------
-- Table structure for `onethink_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action_log`;
CREATE TABLE `onethink_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`),
  KEY `action_ip_ix` (`action_ip`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of xd_action_log
-- ----------------------------
INSERT INTO `onethink_action_log` VALUES ('1', '1', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/public/login.html', '1', '1510905873');
INSERT INTO `onethink_action_log` VALUES ('2', '1', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/public/login.html', '1', '1510970197');
INSERT INTO `onethink_action_log` VALUES ('3', '33', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/product/add.html', '1', '1510990729');
INSERT INTO `onethink_action_log` VALUES ('4', '33', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/product/add.html', '1', '1510990738');
INSERT INTO `onethink_action_log` VALUES ('5', '35', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/product/del_arr.html', '1', '1510998018');
INSERT INTO `onethink_action_log` VALUES ('6', '33', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/product/add.html', '1', '1510998985');
INSERT INTO `onethink_action_log` VALUES ('7', '35', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/product/del_arr.html', '1', '1510998999');
INSERT INTO `onethink_action_log` VALUES ('8', '1', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/public/login.html', '1', '1511254126');
INSERT INTO `onethink_action_log` VALUES ('9', '1', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/public/login.html', '1', '1511315268');
INSERT INTO `onethink_action_log` VALUES ('10', '1', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/public/login.html', '1', '1511338381');
INSERT INTO `onethink_action_log` VALUES ('11', '33', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/product/add.html', '1', '1511338409');
INSERT INTO `onethink_action_log` VALUES ('12', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/del_arr.html', '1', '1511341857');
INSERT INTO `onethink_action_log` VALUES ('13', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/del/orderid/706.html', '1', '1511342402');
INSERT INTO `onethink_action_log` VALUES ('14', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim_arr.html', '1', '1511342600');
INSERT INTO `onethink_action_log` VALUES ('15', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim/orderid/708.html', '1', '1511342607');
INSERT INTO `onethink_action_log` VALUES ('16', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/del_arr.html', '1', '1511342728');
INSERT INTO `onethink_action_log` VALUES ('17', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/add_arr.html', '1', '1511342764');
INSERT INTO `onethink_action_log` VALUES ('18', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/del_arr.html', '1', '1511342779');
INSERT INTO `onethink_action_log` VALUES ('19', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim_arr.html', '1', '1511342820');
INSERT INTO `onethink_action_log` VALUES ('20', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim_arr.html', '1', '1511342834');
INSERT INTO `onethink_action_log` VALUES ('21', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/add_arr.html', '1', '1511342841');
INSERT INTO `onethink_action_log` VALUES ('22', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim_arr.html', '1', '1511342852');
INSERT INTO `onethink_action_log` VALUES ('23', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim/orderid/709.html', '1', '1511342871');
INSERT INTO `onethink_action_log` VALUES ('24', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/del/orderid/709.html', '1', '1511342876');
INSERT INTO `onethink_action_log` VALUES ('25', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/add_arr.html', '1', '1511343128');
INSERT INTO `onethink_action_log` VALUES ('26', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim/orderid/710.html', '1', '1511343133');
INSERT INTO `onethink_action_log` VALUES ('27', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/del/orderid/711.html', '1', '1511343139');
INSERT INTO `onethink_action_log` VALUES ('28', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/add_arr.html', '1', '1511343167');
INSERT INTO `onethink_action_log` VALUES ('29', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim/orderid/710.html', '1', '1511343174');
INSERT INTO `onethink_action_log` VALUES ('30', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/del/orderid/710.html', '1', '1511343181');
INSERT INTO `onethink_action_log` VALUES ('31', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim/orderid/712.html', '1', '1511343249');
INSERT INTO `onethink_action_log` VALUES ('32', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/del/orderid/712.html', '1', '1511343255');
INSERT INTO `onethink_action_log` VALUES ('33', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim/orderid/713.html', '1', '1511343408');
INSERT INTO `onethink_action_log` VALUES ('34', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/del/orderid/713.html', '1', '1511343413');
INSERT INTO `onethink_action_log` VALUES ('35', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim_arr.html', '1', '1511343735');
INSERT INTO `onethink_action_log` VALUES ('36', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/add_arr.html', '1', '1511345442');
INSERT INTO `onethink_action_log` VALUES ('37', '35', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/product/del_arr.html', '1', '1511346273');
INSERT INTO `onethink_action_log` VALUES ('38', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/reclaim_arr.html', '1', '1511346278');
INSERT INTO `onethink_action_log` VALUES ('39', '30', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/order/del_arr.html', '1', '1511346284');
INSERT INTO `onethink_action_log` VALUES ('40', '1', '1', '2130706433', 'member', '1', '操作url：/index.php?s=/admin/public/login.html', '1', '1511403626');

-- ----------------------------
-- Table structure for `onethink_addons`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_addons`;
CREATE TABLE `onethink_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of xd_addons
-- ----------------------------
INSERT INTO `onethink_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"2\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `onethink_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `onethink_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `onethink_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `onethink_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `onethink_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `onethink_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for `onethink_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attachment`;
CREATE TABLE `onethink_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表\r\n@author   麦当苗儿\r\n@version  2013-06-19';

-- ----------------------------
-- Records of xd_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attribute`;
CREATE TABLE `onethink_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='模型属性表\r\n@author huajie';

-- ----------------------------
-- Records of xd_attribute
-- ----------------------------
INSERT INTO `onethink_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '\'\'', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '\'\'', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '\'\'', '', '1', '', '1', '0', '1', '1383894927', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '0', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1383896023', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('14', 'dateline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1383895812', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895825', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233');
INSERT INTO `onethink_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243');
INSERT INTO `onethink_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243');
INSERT INTO `onethink_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '\'\'', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243');
INSERT INTO `onethink_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243');
INSERT INTO `onethink_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '1', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1383896487', '1383891252');
INSERT INTO `onethink_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252');
INSERT INTO `onethink_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '\'\'', '', '1', '', '3', '0', '1', '1383896429', '1383891252');
INSERT INTO `onethink_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252');
INSERT INTO `onethink_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252');
INSERT INTO `onethink_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252');
INSERT INTO `onethink_attribute` VALUES ('33', 'name', '行为唯一标识', 'char(30) NOT NULL ', 'string', '\'\'', '标识唯一', '1', '', '4', '0', '1', '1383897155', '1383891262');
INSERT INTO `onethink_attribute` VALUES ('34', 'title', '行为说明', 'char(80) NOT NULL ', 'textarea', '\'\'', '', '1', '', '4', '0', '1', '1383897133', '1383891262');
INSERT INTO `onethink_attribute` VALUES ('35', 'remark', '行为描述', 'char(140) NOT NULL ', 'textarea', '\'\'', '', '1', '', '4', '0', '1', '1383897032', '1383891262');
INSERT INTO `onethink_attribute` VALUES ('36', 'rule', '行为规则', 'text NOT NULL ', 'textarea', '', '', '1', '', '4', '0', '1', '1383897011', '1383891262');
INSERT INTO `onethink_attribute` VALUES ('37', 'type', '类型', 'tinyint(2) unsigned NOT NULL ', 'select', '1', '', '1', '1:系统\r\n2:用户', '4', '0', '1', '1383896955', '1383891262');
INSERT INTO `onethink_attribute` VALUES ('38', 'status', '状态', 'tinyint(2) NOT NULL ', 'radio', '0', '', '1', '-1:已删除\r\n0:禁用\r\n1:正常', '4', '0', '1', '1383896868', '1383891262');
INSERT INTO `onethink_attribute` VALUES ('39', 'update_time', '修改时间', 'int(11) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '4', '0', '1', '1383896756', '1383891262');
INSERT INTO `onethink_attribute` VALUES ('40', 'action_id', '行为id', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '5', '0', '1', '1383897599', '1383891340');
INSERT INTO `onethink_attribute` VALUES ('41', 'user_id', '执行用户id', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '5', '0', '1', '1383897587', '1383891340');
INSERT INTO `onethink_attribute` VALUES ('42', 'action_ip', '执行行为者ip', 'bigint(20) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1383897570', '1383891341');
INSERT INTO `onethink_attribute` VALUES ('43', 'model', '触发行为的表', 'varchar(50) NOT NULL ', 'string', '\'\'', '', '1', '', '5', '0', '1', '1383897523', '1383891341');
INSERT INTO `onethink_attribute` VALUES ('44', 'record_id', '触发行为的数据id', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '5', '0', '1', '1383897512', '1383891341');
INSERT INTO `onethink_attribute` VALUES ('45', 'remark', '日志备注', 'varchar(255) NOT NULL ', 'textarea', '\'\'', '', '1', '', '5', '0', '1', '1383897352', '1383891341');
INSERT INTO `onethink_attribute` VALUES ('46', 'status', '状态', 'tinyint(2) NOT NULL ', 'checkbox', '1', '', '1', '-1:已删除\r\n0:禁用\r\n1:正常', '5', '0', '1', '1383897331', '1383891341');
INSERT INTO `onethink_attribute` VALUES ('47', 'create_time', '执行行为的时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '5', '0', '1', '1383897274', '1383891341');
INSERT INTO `onethink_attribute` VALUES ('48', 'name', '插件名或标识', 'varchar(40) NOT NULL ', 'string', '', '区分大小写', '1', '', '6', '0', '1', '1383898041', '1383891396');
INSERT INTO `onethink_attribute` VALUES ('49', 'title', '中文名', 'varchar(20) NOT NULL ', 'string', '\'\'', '', '1', '', '6', '0', '1', '1383898024', '1383891396');
INSERT INTO `onethink_attribute` VALUES ('50', 'description', '插件描述', 'text NULL ', 'editor', '', '', '1', '', '6', '0', '1', '1383897787', '1383891396');
INSERT INTO `onethink_attribute` VALUES ('51', 'status', '状态', 'tinyint(1) NOT NULL ', 'radio', '1', '', '1', '1:启用\r\n0:禁用\r\n-1:损坏', '6', '0', '1', '1383897771', '1383891396');
INSERT INTO `onethink_attribute` VALUES ('52', 'config', '配置', 'text NULL ', 'textarea', '', '序列化存放', '1', '', '6', '0', '1', '1383897747', '1383891396');
INSERT INTO `onethink_attribute` VALUES ('53', 'author', '作者', 'varchar(40) NULL ', 'string', '\'\'', '', '1', '', '6', '0', '1', '1383897731', '1383891396');
INSERT INTO `onethink_attribute` VALUES ('54', 'version', '版本号', 'varchar(20) NULL ', 'string', '\'\'', '', '1', '', '6', '0', '1', '1383897715', '1383891396');
INSERT INTO `onethink_attribute` VALUES ('55', 'create_time', '安装时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '6', '0', '1', '1383897704', '1383891396');
INSERT INTO `onethink_attribute` VALUES ('56', 'has_adminlist', '是否有后台列表', 'tinyint(1) unsigned NOT NULL ', 'bool', '0', '', '1', '1:有后台列表\r\n0:无后台列表', '6', '0', '1', '1383897682', '1383891396');
INSERT INTO `onethink_attribute` VALUES ('57', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '7', '0', '1', '1383900457', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('58', 'title', '附件显示名', 'char(30) NOT NULL ', 'string', '\'\'', '', '1', '', '7', '0', '1', '1383900447', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('59', 'type', '附件类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '1', '0:目录\r\n1:外链\r\n2:文件', '7', '0', '1', '1383900433', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('60', 'source', '资源ID', 'int(10) unsigned NOT NULL ', 'num', '0', '0-目录， 大于0-当资源为文件时其值为file_id,当资源为外链时其值为link_id', '1', '', '7', '0', '1', '1383900405', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('61', 'record_id', '关联记录ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '7', '0', '1', '1383900384', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('62', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '7', '0', '1', '1383900376', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('63', 'size', '附件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '当附件为目录或外链时，该值为0', '1', '', '7', '0', '1', '1383900367', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('64', 'dir', '上级目录ID', 'int(12) unsigned NOT NULL ', 'num', '0', '0-根目录', '1', '', '7', '0', '1', '1383900283', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('65', 'sort', '排序', 'int(8) unsigned NOT NULL ', 'num', '0', '', '1', '', '7', '0', '1', '1383900264', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('66', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '7', '0', '1', '1383900256', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('67', 'update_time', '更新时间', 'int(11) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '7', '0', '1', '1383900249', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('68', 'status', '状态', 'tinyint(1) NOT NULL ', 'select', '0', '', '1', '-1:已删除\r\n0:禁用\r\n1:正常', '7', '0', '1', '1383900239', '1383891410');
INSERT INTO `onethink_attribute` VALUES ('69', 'name', '字段名', 'varchar(30) NOT NULL ', 'string', '\'\'', '', '1', '', '8', '0', '1', '1383901456', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('70', 'title', '字段注释', 'varchar(100) NOT NULL ', 'textarea', '\'\'', '', '1', '', '8', '0', '1', '1383901439', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('71', 'field', '字段定义', 'varchar(100) NOT NULL ', 'string', '\'\'', '', '1', '', '8', '0', '1', '1383901414', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('72', 'type', '数据类型', 'varchar(20) NOT NULL ', 'string', '\'\'', '用于表单展示', '1', '', '8', '0', '1', '1383901399', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('73', 'value', '字段默认值', 'varchar(100) NOT NULL ', 'string', '\'\'', '', '1', '', '8', '0', '1', '1383901261', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('74', 'remark', '备注', 'varchar(100) NOT NULL ', 'textarea', '\'\'', '', '1', '', '8', '0', '1', '1383901247', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('75', 'is_show', '是否显示', 'tinyint(1) unsigned NOT NULL ', 'select', '1', '', '1', '0:不显示\r\n1:始终显示\r\n2:新增时显示\r\n3:编辑时显示', '8', '0', '1', '1383901027', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('76', 'extra', '参数', 'varchar(255) NOT NULL ', 'textarea', '\'\'', '表单显示', '1', '', '8', '0', '1', '1383900964', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('77', 'model_id', '模型id', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '8', '0', '1', '1383900862', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('78', 'is_must', '是否必填', 'tinyint(1) unsigned NOT NULL ', 'bool', '0', '', '1', '0:否\r\n1:是', '8', '0', '1', '1383900852', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('79', 'status', '状态', 'tinyint(2) NOT NULL ', 'select', '0', '', '1', '-1:已删除\r\n0:禁用\r\n1:正常', '8', '0', '1', '1383900822', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('80', 'update_time', '更新时间', 'int(11) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '8', '0', '1', '1383900771', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('81', 'create_time', '创建时间', 'int(11) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '8', '0', '1', '1383900759', '1383891441');
INSERT INTO `onethink_attribute` VALUES ('82', 'name', '标志', 'varchar(30) NOT NULL ', 'string', '', '', '1', '', '9', '0', '1', '1383901549', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('83', 'title', '标题', 'varchar(50) NOT NULL ', 'string', '', '', '1', '', '9', '0', '1', '1383891453', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('84', 'pid', '上级分类ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '9', '0', '1', '1383901524', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('85', 'sort', '排序（同级有效）', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '9', '0', '1', '1383902180', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('86', 'list_row', '列表每页行数', 'tinyint(3) unsigned NOT NULL ', 'num', '10', '', '1', '', '9', '0', '1', '1383902154', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('87', 'meta_title', 'SEO的网页标题', 'varchar(50) NOT NULL ', 'string', '\'\'', '', '1', '', '9', '0', '1', '1383902118', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('88', 'keywords', '关键字', 'varchar(255) NOT NULL ', 'textarea', '\'\'', '', '1', '', '9', '0', '1', '1383902106', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('89', 'description', '描述', 'varchar(255) NOT NULL ', 'textarea', '\'\'', '', '1', '', '9', '0', '1', '1383902089', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('90', 'template_index', '频道页模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '9', '0', '1', '1383891453', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('91', 'template_lists', '列表页模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '9', '0', '1', '1383891453', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('92', 'template_detail', '详情页模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '9', '0', '1', '1383891453', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('93', 'template_edit', '编辑页模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '9', '0', '1', '1383891453', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('94', 'model', '关联模型', 'varchar(100) NOT NULL ', 'string', '\'\'', '', '1', '', '9', '0', '1', '1383902070', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('95', 'type', '允许发布的内容类型', 'varchar(100) NOT NULL ', 'radio', '\'\'', '', '1', '1:目录\r\n2:主题\r\n3:段落', '9', '0', '1', '1383902026', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('96', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID', '1', '', '9', '0', '1', '1383902007', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('97', 'allow_publish', '是否允许发布内容', 'tinyint(3) unsigned NOT NULL ', 'radio', '0', '（0-不允许，1-允许）', '1', '0:不允许\r\n1:仅允许后台\r\n2:允许前后台', '9', '0', '1', '1385343315', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('98', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '0', '', '1', '0:所有人可见\r\n1:管理员可见\r\n2:不可见', '9', '0', '1', '1383900863', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('99', 'reply', '是否允许回复', 'tinyint(3) unsigned NOT NULL ', 'radio', '0', '', '1', '1:允许\r\n0:不允许', '9', '0', '1', '1383900823', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('100', 'check', '发布的文章是否需要审核', 'tinyint(3) unsigned NOT NULL ', 'radio', '0', '0：不需要，1：需要', '1', '0:不需要\r\n1:需要', '9', '0', '1', '1383901976', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('101', 'reply_model', '', 'varchar(100) NOT NULL ', 'string', '\'\'', '', '1', '', '9', '0', '1', '1383901959', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('102', 'extend', '扩展设置', 'text NOT NULL ', 'textarea', '', 'JSON数据', '1', '', '9', '0', '1', '1383901931', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('103', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '9', '0', '1', '1383900444', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('104', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '9', '0', '1', '1383900436', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('105', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '-1-删除，0-禁用，1-正常，2-待审核', '1', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核', '9', '0', '1', '1383900393', '1383891453');
INSERT INTO `onethink_attribute` VALUES ('106', 'pid', '上级频道ID', 'int(10) unsigned NOT NULL ', 'string', '0', '', '1', '', '10', '0', '1', '1383891460', '1383891460');
INSERT INTO `onethink_attribute` VALUES ('107', 'title', '频道标题', 'char(30) NOT NULL ', 'string', '', '', '1', '', '10', '0', '1', '1383891460', '1383891460');
INSERT INTO `onethink_attribute` VALUES ('108', 'url', '频道连接', 'char(100) NOT NULL ', 'string', '', '', '1', '', '10', '0', '1', '1383891460', '1383891460');
INSERT INTO `onethink_attribute` VALUES ('109', 'sort', '导航排序', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '10', '0', '1', '1383900256', '1383891460');
INSERT INTO `onethink_attribute` VALUES ('110', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '10', '0', '1', '1383900247', '1383891460');
INSERT INTO `onethink_attribute` VALUES ('111', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '10', '0', '1', '1383900239', '1383891460');
INSERT INTO `onethink_attribute` VALUES ('112', 'status', '状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '1', '1:正常\r\n0:禁用', '10', '0', '1', '1383900228', '1383891460');
INSERT INTO `onethink_attribute` VALUES ('113', 'name', '配置名称', 'varchar(30) NOT NULL ', 'string', '\'\'', '', '1', '', '11', '0', '1', '1383901902', '1383891466');
INSERT INTO `onethink_attribute` VALUES ('114', 'type', '配置类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '11', '0', '1', '1383901877', '1383891466');
INSERT INTO `onethink_attribute` VALUES ('115', 'title', '配置说明', 'varchar(50) NOT NULL ', 'string', '\'\'', '', '1', '', '11', '0', '1', '1383901743', '1383891466');
INSERT INTO `onethink_attribute` VALUES ('116', 'group', '配置分组', 'tinyint(3) unsigned NOT NULL ', 'radio', '0', '0-无分组，1-基本设置', '1', '0:无分组\r\n1:基本设置', '11', '0', '1', '1383901731', '1383891466');
INSERT INTO `onethink_attribute` VALUES ('117', 'extra', '配置值', 'varchar(255) NOT NULL ', 'textarea', '\'\'', '', '1', '', '11', '0', '1', '1383901707', '1383891466');
INSERT INTO `onethink_attribute` VALUES ('118', 'remark', '配置说明', 'varchar(100) NOT NULL ', 'textarea', '', '', '1', '', '11', '0', '1', '1383901666', '1383891466');
INSERT INTO `onethink_attribute` VALUES ('119', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '11', '0', '1', '1383899711', '1383891466');
INSERT INTO `onethink_attribute` VALUES ('120', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '11', '0', '1', '1383899704', '1383891466');
INSERT INTO `onethink_attribute` VALUES ('121', 'status', '状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '1', '1:启用\r\n0:禁用', '11', '0', '1', '1383901650', '1383891466');
INSERT INTO `onethink_attribute` VALUES ('122', 'value', '配置值', 'text NOT NULL ', 'textarea', '', '', '1', '', '11', '0', '1', '1383901634', '1383891466');
INSERT INTO `onethink_attribute` VALUES ('123', 'sort', '排序', 'smallint(3) unsigned NOT NULL ', 'num', '0', '', '1', '', '11', '0', '1', '1383901610', '1383891467');
INSERT INTO `onethink_attribute` VALUES ('124', 'name', '原始文件名', 'char(30) NOT NULL ', 'string', '\'\'', '', '1', '', '12', '0', '1', '1383902322', '1383891474');
INSERT INTO `onethink_attribute` VALUES ('125', 'savename', '保存名称', 'char(20) NOT NULL ', 'string', '\'\'', '', '1', '', '12', '0', '1', '1383902308', '1383891474');
INSERT INTO `onethink_attribute` VALUES ('126', 'savepath', '文件保存路径', 'char(30) NOT NULL ', 'string', '\'\'', '', '1', '', '12', '0', '1', '1383902297', '1383891474');
INSERT INTO `onethink_attribute` VALUES ('127', 'ext', '文件后缀', 'char(5) NOT NULL ', 'string', '\'\'', '', '1', '', '12', '0', '1', '1383902285', '1383891474');
INSERT INTO `onethink_attribute` VALUES ('128', 'mime', '文件mime类型', 'char(40) NOT NULL ', 'string', '\'\'', '', '1', '', '12', '0', '1', '1383902267', '1383891474');
INSERT INTO `onethink_attribute` VALUES ('129', 'size', '文件大小', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '12', '0', '1', '1383902259', '1383891474');
INSERT INTO `onethink_attribute` VALUES ('130', 'md5', '文件md5', 'char(32) NOT NULL ', 'string', '\'\'', '', '1', '', '12', '0', '1', '1383902245', '1383891474');
INSERT INTO `onethink_attribute` VALUES ('131', 'sha1', '文件 sha1编码', 'char(40) NOT NULL ', 'string', '\'\'', '', '1', '', '12', '0', '1', '1383902236', '1383891474');
INSERT INTO `onethink_attribute` VALUES ('132', 'location', '文件保存位置', 'tinyint(3) unsigned NOT NULL ', 'checkbox', '0', '', '1', '0:本地\r\n1:FTP', '12', '0', '1', '1383899469', '1383891474');
INSERT INTO `onethink_attribute` VALUES ('133', 'create_time', '上传时间', 'int(10) unsigned NOT NULL ', 'datetime', '', '', '1', '', '12', '0', '1', '1383899436', '1383891474');
INSERT INTO `onethink_attribute` VALUES ('134', 'name', '钩子名称', 'varchar(40) NOT NULL ', 'string', '\'\'', '', '1', '', '13', '0', '1', '1383902516', '1383891480');
INSERT INTO `onethink_attribute` VALUES ('135', 'description', '描述', 'text NOT NULL ', 'editor', '', '', '1', '', '13', '0', '1', '1383902505', '1383891480');
INSERT INTO `onethink_attribute` VALUES ('136', 'type', '类型', 'tinyint(1) unsigned NOT NULL ', 'select', '1', '', '1', '1:Controller\r\n2:Widget', '13', '0', '1', '1383902484', '1383891480');
INSERT INTO `onethink_attribute` VALUES ('137', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '13', '0', '1', '1383902552', '1383891480');
INSERT INTO `onethink_attribute` VALUES ('138', 'addons', '钩子挂载的插件 \'，\'分割', 'varchar(255) NULL ', 'string', '', '', '1', '', '13', '0', '1', '1383891480', '1383891480');
INSERT INTO `onethink_attribute` VALUES ('139', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '14', '0', '1', '1383898187', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('140', 'nickname', '昵称', 'char(16) NOT NULL ', 'string', '\'\'', '', '1', '', '14', '0', '1', '1383902646', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('141', 'sex', '性别', 'tinyint(3) unsigned NOT NULL ', 'radio', '0', '', '1', '0:女\r\n1:男', '14', '0', '1', '1383898158', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('142', 'birthday', '生日', 'date NOT NULL ', 'string', '0000-00-00', '', '1', '', '14', '0', '1', '1383891488', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('143', 'qq', 'qq号', 'char(10) NOT NULL ', 'string', '\'\'', '', '1', '', '14', '0', '1', '1383902605', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('144', 'score', '用户积分', 'mediumint(8) NOT NULL ', 'num', '0', '', '1', '', '14', '0', '1', '1383898066', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('145', 'login', '登录次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '14', '0', '1', '1383898055', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('146', 'reg_ip', '注册IP', 'bigint(20) NOT NULL ', 'string', '0', '', '1', '', '14', '0', '1', '1383898045', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('147', 'reg_time', '注册时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '14', '0', '1', '1383897783', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('148', 'last_login_ip', '最后登录IP', 'bigint(20) NOT NULL ', 'string', '0', '', '1', '', '14', '0', '1', '1383891488', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('149', 'last_login_time', '最后登录时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '14', '0', '1', '1383897775', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('150', 'status', '会员状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '1', '1:正常\r\n0:禁用', '14', '0', '1', '1383898472', '1383891488');
INSERT INTO `onethink_attribute` VALUES ('151', 'title', '标题', 'varchar(50) NOT NULL ', 'string', '\'\'', '', '1', '', '15', '0', '1', '1383902756', '1383891503');
INSERT INTO `onethink_attribute` VALUES ('152', 'pid', '上级分类ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '15', '0', '1', '1383897737', '1383891503');
INSERT INTO `onethink_attribute` VALUES ('153', 'sort', '排序（同级有效）', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '15', '0', '1', '1383902746', '1383891503');
INSERT INTO `onethink_attribute` VALUES ('154', 'url', '链接地址', 'char(255) NOT NULL ', 'string', '\'\'', '', '1', '', '15', '0', '1', '1383902737', '1383891503');
INSERT INTO `onethink_attribute` VALUES ('155', 'hide', '是否隐藏', 'tinyint(1) unsigned NOT NULL ', 'radio', '0', '', '1', '1:是\r\n0:否', '15', '0', '1', '1383902727', '1383891503');
INSERT INTO `onethink_attribute` VALUES ('156', 'tip', '提示', 'varchar(255) NOT NULL ', 'textarea', '\'\'', '', '1', '', '15', '0', '1', '1383902703', '1383891503');
INSERT INTO `onethink_attribute` VALUES ('157', 'group', '分组', 'varchar(50) NULL ', 'string', '\'\'', '', '1', '', '15', '0', '1', '1383902688', '1383891503');
INSERT INTO `onethink_attribute` VALUES ('158', 'is_dev', '是否仅开发者模式可见', 'tinyint(1) unsigned NOT NULL ', 'radio', '0', '', '1', '1:开发者模式可见\r\n0:开发者模式不可见', '15', '0', '1', '1383902676', '1383891503');
INSERT INTO `onethink_attribute` VALUES ('159', 'name', '模型标识', 'char(30) NOT NULL ', 'string', '\'\'', '', '1', '', '16', '0', '1', '1383903045', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('160', 'title', '模型名称', 'char(30) NOT NULL ', 'string', '\'\'', '', '1', '', '16', '0', '1', '1383903037', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('161', 'extend', '继承的模型', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '16', '0', '1', '1383903026', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('162', 'relation', '继承与被继承模型的关联字段', 'varchar(30) NOT NULL ', 'string', '', '', '1', '', '16', '0', '1', '1383891514', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('163', 'need_pk', '新建表时是否需要主键字段', 'tinyint(1) unsigned NOT NULL ', 'radio', '1', '', '1', '1:是\r\n0:否', '16', '0', '1', '1383903004', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('164', 'field_sort', '表单字段排序', 'text NOT NULL ', 'textarea', '', '', '1', '', '16', '0', '1', '1383902978', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('165', 'field_group', '字段分组', 'varchar(255) NOT NULL ', 'string', '1:基础', '', '1', '', '16', '0', '1', '1383891514', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('166', 'attribute_list', '属性列表（表的字段）', 'text NOT NULL ', 'textarea', '', '', '1', '', '16', '0', '1', '1383902908', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('167', 'template_list', '列表模板', 'varchar(100) NOT NULL ', 'string', '\'\'', '', '1', '', '16', '0', '1', '1383902888', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('168', 'template_add', '新增模板', 'varchar(100) NOT NULL ', 'string', '\'\'', '', '1', '', '16', '0', '1', '1383902878', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('169', 'template_edit', '编辑模板', 'varchar(100) NOT NULL ', 'string', '\'\'', '', '1', '', '16', '0', '1', '1383902869', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('170', 'list_grid', '列表定义', 'varchar(255) NOT NULL ', 'textarea', '\'\'', '', '1', '', '16', '0', '1', '1383902861', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('171', 'list_row', '列表数据长度', 'smallint(2) unsigned NOT NULL ', 'num', '10', '', '1', '', '16', '0', '1', '1383897602', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('172', 'search_key', '默认搜索字段', 'varchar(50) NOT NULL ', 'string', '\'\'', '', '1', '', '16', '0', '1', '1383902840', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('173', 'search_list', '高级搜索的字段', 'varchar(255) NOT NULL ', 'string', '\'\'', '', '1', '', '16', '0', '1', '1383902828', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('174', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '16', '0', '1', '1383897557', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('175', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '16', '0', '1', '1383897549', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('176', 'status', '状态', 'tinyint(3) unsigned NOT NULL ', 'radio', '0', '', '1', '-1:已删除\r\n0:禁用\r\n1:正常', '16', '0', '1', '1383902811', '1383891514');
INSERT INTO `onethink_attribute` VALUES ('177', 'path', '路径', 'varchar(255) NOT NULL ', 'string', '\'\'', '', '1', '', '17', '0', '1', '1383903110', '1383891522');
INSERT INTO `onethink_attribute` VALUES ('178', 'url', '图片链接', 'varchar(255) NOT NULL ', 'string', '\'\'', '', '1', '', '17', '0', '1', '1383903103', '1383891522');
INSERT INTO `onethink_attribute` VALUES ('179', 'md5', '文件md5', 'char(32) NOT NULL ', 'string', '\'\'', '', '1', '', '17', '0', '1', '1383903093', '1383891522');
INSERT INTO `onethink_attribute` VALUES ('180', 'sha1', '文件 sha1编码', 'char(40) NOT NULL ', 'string', '\'\'', '', '1', '', '17', '0', '1', '1383903084', '1383891522');
INSERT INTO `onethink_attribute` VALUES ('181', 'status', '状态', 'tinyint(2) NOT NULL ', 'radio', '0', '', '1', '-1:已删除\r\n0:禁用\r\n1:正常', '17', '0', '1', '1383903075', '1383891522');
INSERT INTO `onethink_attribute` VALUES ('182', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '17', '0', '1', '1383897491', '1383891522');
INSERT INTO `onethink_attribute` VALUES ('183', 'url', '链接地址', 'char(255) NOT NULL ', 'string', '\'\'', '', '1', '', '18', '0', '1', '1383903175', '1383891532');
INSERT INTO `onethink_attribute` VALUES ('184', 'short', '短网址', 'char(100) NOT NULL ', 'string', '\'\'', '', '1', '', '18', '0', '1', '1383903162', '1383891532');
INSERT INTO `onethink_attribute` VALUES ('185', 'status', '状态', 'tinyint(2) NOT NULL ', 'radio', '2', '', '1', '-1:已删除\r\n0:禁用\r\n1:正常\r\n2:未审核', '18', '0', '1', '1383903153', '1383891532');
INSERT INTO `onethink_attribute` VALUES ('186', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '18', '0', '1', '1383903130', '1383891532');

-- ----------------------------
-- Table structure for `onethink_audit`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_audit`;
CREATE TABLE `onethink_audit` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `title` varchar(250) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态（0：开启，1：关闭）',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_audit
-- ----------------------------
INSERT INTO `onethink_audit` VALUES ('7', '斯蒂芬斯蒂芬', '<p>阿斯蒂发生的辅导书</p>', '0');

-- ----------------------------
-- Table structure for `onethink_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_extend`;
CREATE TABLE `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of xd_auth_extend
-- ----------------------------
INSERT INTO `onethink_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for `onethink_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group`;
CREATE TABLE `onethink_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_auth_group
-- ----------------------------
INSERT INTO `onethink_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');

-- ----------------------------
-- Table structure for `onethink_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group_access`;
CREATE TABLE `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_auth_group_access
-- ----------------------------
INSERT INTO `onethink_auth_group_access` VALUES ('19', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('20', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('24', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('25', '2');

-- ----------------------------
-- Table structure for `onethink_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_rule`;
CREATE TABLE `onethink_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`module`,`name`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_auth_rule
-- ----------------------------
INSERT INTO `onethink_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('6', 'admin', '1', 'Admin/Index/index', '首页', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addAction', '新增用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editAction', '编辑用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');

-- ----------------------------
-- Table structure for `onethink_category`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_category`;
CREATE TABLE `onethink_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分类表\r\n@author   麦当苗儿\r\n@version  2013-05-21';

-- ----------------------------
-- Records of xd_category
-- ----------------------------
INSERT INTO `onethink_category` VALUES ('1', 'blog', '博客', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1382701539', '1');
INSERT INTO `onethink_category` VALUES ('2', 'default_blog', '默认分类', '1', '1', '10', '', '', '', '', '', '', '', '2,3', '2,1,3', '0', '1', '1', '0', '1', '1', '', '1379475028', '1384423564', '1');
INSERT INTO `onethink_category` VALUES ('3', 'topic', '讨论', '0', '0', '10', '', '', '', 'Article/index_topic', 'Article/lists_topic', 'Article/Article/detail_topic', '', '2', '2', '0', '0', '1', '0', '0', '1', '', '1379475049', '1382701899', '1');
INSERT INTO `onethink_category` VALUES ('4', 'default_topic', '默认分类', '3', '0', '10', '', '', '', '', 'Article/lists_topic', 'Article/Article/detail_topic', '', '2,3', '2,3', '0', '1', '1', '1', '1', '1', '', '1379475068', '1383878121', '1');

-- ----------------------------
-- Table structure for `onethink_channel`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_channel`;
CREATE TABLE `onethink_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_channel
-- ----------------------------
INSERT INTO `onethink_channel` VALUES ('1', '0', '首页', 'Index/index', '2', '1379475111', '1379923177', '1');
INSERT INTO `onethink_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '0', '1379475131', '1379483713', '1');
INSERT INTO `onethink_channel` VALUES ('3', '0', '讨论', 'Article/index?category=topic', '0', '1379475154', '1379483726', '1');

-- ----------------------------
-- Table structure for `onethink_config`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_config`;
CREATE TABLE `onethink_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_config
-- ----------------------------
INSERT INTO `onethink_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '手机号码', '1', '', '手机号码', '1511425190', '1379235274', '0', '提示：这里填写你自己的手机号码', '0');
INSERT INTO `onethink_config` VALUES ('2', 'WEB_INDEX_TITLE', '1', '首页标题', '1', '', '网站首页标题', '1', '1379235841', '1', '商品抢购首页', '1');
INSERT INTO `onethink_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '0', '内容管理框架', '3');
INSERT INTO `onethink_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '0');
INSERT INTO `onethink_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '0');
INSERT INTO `onethink_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如(<kbd>沪ICP备12007941号-2</kbd>)', '1378900335', '1379235859', '1', '提示：这里可以写公司名称或者备案号等信息', '4');
INSERT INTO `onethink_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '0');
INSERT INTO `onethink_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '0');
INSERT INTO `onethink_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '10', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'blue_color', '5');
INSERT INTO `onethink_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n6:支付宝\r\n7:微信支付\r\n9:邮箱\r\n11:短信\r\n12:物流\r\n13:防刷', '0');
INSERT INTO `onethink_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '0');
INSERT INTO `onethink_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '0');
INSERT INTO `onethink_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '0');
INSERT INTO `onethink_config` VALUES ('24', 'AOTUSAVE_DRAFT', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1379484574', '1', '60', '0');
INSERT INTO `onethink_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '50', '5');
INSERT INTO `onethink_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '0');
INSERT INTO `onethink_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'elegant', '0');
INSERT INTO `onethink_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '0');
INSERT INTO `onethink_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '0');
INSERT INTO `onethink_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '0');
INSERT INTO `onethink_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '0');
INSERT INTO `onethink_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '0');
INSERT INTO `onethink_config` VALUES ('40', 'WEB_COLOR_BG', '1', '网站背景', '5', '', '网站背景（例如：#fff000)', '1381713408', '1381713408', '1', '#44361C', '0');
INSERT INTO `onethink_config` VALUES ('41', 'WEB_POSTAGE', '3', '邮费设置', '8', '', '邮费设置', '1383105995', '1383291877', '1', '邮费10元', '1');
INSERT INTO `onethink_config` VALUES ('42', 'WEB_CONTACT', '10', '联系我们', '10', '', ' ', '1381713408', '1381713408', '0', '<p>\r\n	<img src=\"/xiadan/Uploads/Editor/2017-03-25/58d5d5c562c73.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/xiadan/Uploads/Editor/2017-03-25/58d5d5f53cef2.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/xiadan/Uploads/Editor/2017-03-25/58d5d60251f8d.jpg\" alt=\"\" />\r\n</p>', '0');
INSERT INTO `onethink_config` VALUES ('43', 'WEB_ABOUT', '10', '关于我们', '10', '', ' ', '1381713408', '1381713408', '0', '<p>\r\n	<img src=\"/xiadan/Uploads/Editor/2017-03-25/58d5d50a3ca1e.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/xiadan/Uploads/Editor/2017-03-25/58d5d56f13c76.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/xiadan/Uploads/Editor/2017-03-25/58d5d52c5a238.jpg\" alt=\"\" /> \r\n</p>', '0');
INSERT INTO `onethink_config` VALUES ('62', 'WX_APIKEY', '2', 'KEY证书', '7', '', '微信apiclient_key.pem证书内容', '1381713408', '1381713408', '1', '', '7');
INSERT INTO `onethink_config` VALUES ('89', 'SITE_TITLE', '1', '站点标题', '1', '', '站点标题', '1381713408', '1381713408', '1', '站点标题', '0');
INSERT INTO `onethink_config` VALUES ('90', 'SITE_KEYWORDS', '2', '站点关键词', '1', '', '站点关键词', '1381713408', '1381713408', '1', '站点关键词', '0');
INSERT INTO `onethink_config` VALUES ('91', 'SITE_DESCRIBE', '2', '站点描述', '1', '', '站点描述', '1381713408', '1381713408', '1', '站点描述', '0');
INSERT INTO `onethink_config` VALUES ('92', 'EMS_STATUS', '4', '物流状态', '12', '0:关闭\r\n1:开启', '物流状态', '1381713408', '1381713408', '1', '0', '1');
INSERT INTO `onethink_config` VALUES ('93', 'EMS_EBID', '1', '商户ID', '12', '', '商户ID，暂无账号【<a href=\"http://www.kdniao.com/reg\" target=\"_blank\">立即注册</a>】', '1381713408', '1381713408', '1', '商户ID', '2');
INSERT INTO `onethink_config` VALUES ('94', 'EMS_APPKEY', '7', 'API key', '12', '', 'API key', '1381713408', '1381713408', '1', 'API key	', '3');
INSERT INTO `onethink_config` VALUES ('98', 'TEXT_SMS', '1', '测试手机号码', '11', '', '填写测试手机号，测试短信是否对接成功，<a href=\"javascript:;\" onclick=\"sms();\">【测试短信接口】</a>', '1381713408', '1381713408', '1', '测试手机号码', '4');
INSERT INTO `onethink_config` VALUES ('95', 'VER_STATUS', '4', '防刷状态', '13', '0:关闭\r\n1:开启', '防刷状态', '1381713408', '1381713408', '1', '0', '1');
INSERT INTO `onethink_config` VALUES ('96', 'VER_CHAR', '1', '限定数量', '13', '', '限定同一个手机号码&IP，同一天可以下单多少数量', '1381713408', '1381713408', '1', '2', '2');
INSERT INTO `onethink_config` VALUES ('97', 'LANGUAGE', '0', '语言类型', '0', '', '', '1381713408', '1381713408', '0', '0', '0');
INSERT INTO `onethink_config` VALUES ('99', 'STATISTICAL', '2', '统计代码', '1', '', '填写站长统计代码', '1381713408', '1381713408', '1', '', '9');
INSERT INTO `onethink_config` VALUES ('57', 'ALI_STATUS', '4', '支付状态', '6', '0:关闭\r\n1:开启', ' 支付开启状态，关闭', '1381713408', '1381713408', '0', '1', '0');
INSERT INTO `onethink_config` VALUES ('58', 'WX_STATUS', '4', '支付状态', '7', '0:关闭\r\n1:开启', ' 支付开启状态，关闭', '1381713408', '1381713408', '0', '1', '0');
INSERT INTO `onethink_config` VALUES ('59', 'HD_STATUS', '4', '支付状态', '8', '0:关闭\r\n1:开启', '  支付开启状态，关闭', '1381713408', '1381713408', '0', '1', '0');
INSERT INTO `onethink_config` VALUES ('50', 'ALI_PARTNER', '1', '合作身份者ID', '6', '', '合作身份者ID，签约账号，<kbd>以2088开头由16位纯数字组成的字符串</kbd>', '1381713408', '1381713408', '1', '合作身份者ID	', '0');
INSERT INTO `onethink_config` VALUES ('53', 'WX_APPID', '1', 'APPID', '7', '', '这里填写开户邮件中的（<kbd>公众账号APPID或者应用APPID</kbd>）', '1381713408', '1381713408', '1', 'APPIDAPPID', '1');
INSERT INTO `onethink_config` VALUES ('51', 'ALI_PRIVATE_KEY', '2', '商户的私钥', '6', '', '商户的私钥,此处填写原始私钥去头去尾', '1381713408', '1381713408', '1', '商户的私钥', '0');
INSERT INTO `onethink_config` VALUES ('52', 'ALI_PUBLIC_KEY', '2', '支付宝的公钥', '6', '', ' 支付宝的公钥', '1381713408', '1381713408', '1', '支付宝的公钥', '0');
INSERT INTO `onethink_config` VALUES ('54', 'WX_APPSECRET', '1', 'APPSECRET', '7', '', ' 使用APPID对应的公众平台登录 <a href=\"http://mp.weixin.qq.com\" target=\"_blank\">http://mp.weixin.qq.com</a> 的开发者', '1381713408', '1381713408', '1', 'APPSECRETAPPSECRET', '2');
INSERT INTO `onethink_config` VALUES ('55', 'WX_KEY', '1', 'KEY', '7', '', ' 这里填写您在商户平台 <a href=\"http://pay.weixin.qq.com\" target=\"_blank\">http://pay.weixin.qq.com</a> 自己设置的API', '1381713408', '1381713408', '1', 'KEYKEY', '3');
INSERT INTO `onethink_config` VALUES ('56', 'WX_MCHID', '1', 'MCHID', '7', '', '这里填写开户邮件中的商户号', '1381713408', '1381713408', '1', 'MCHIDMCHID', '4');
INSERT INTO `onethink_config` VALUES ('61', 'WX_APICERT', '2', 'CERT证书', '7', '', '微信<kbd>apiclient_cert.pem</kbd>证书内容', '1381713408', '1381713408', '1', '', '5');
INSERT INTO `onethink_config` VALUES ('100', 'WX_VERIFY', '8', '域名验证码', '7', '', '上传绑定微信域名验证码', '1381713408', '1381713408', '1', '', '0');
INSERT INTO `onethink_config` VALUES ('101', 'DOMAIN_STATUS', '0', '', '0', '', '', '1381713408', '1381713408', '0', '1', '0');
INSERT INTO `onethink_config` VALUES ('102', 'DOMAIN', '0', '', '0', '', '', '1381713408', '1381713408', '0', '', '0');
INSERT INTO `onethink_config` VALUES ('63', 'WX_ROOTCA', '2', 'ROOTCA证书', '7', '', '微信<kbd>rootca.pem</kbd>证书内容', '1381713408', '1381713408', '1', '', '6');
INSERT INTO `onethink_config` VALUES ('60', 'WEB_EMAIL', '1', '接收邮箱', '9', '', '用户下单邮箱提醒，<a href=\"javascript:;\" onclick=\"email();\">【测试邮箱】</a>', '1381713408', '1381713408', '1', '接收邮箱', '10');
INSERT INTO `onethink_config` VALUES ('64', 'EMAIL_STATUS', '4', '邮件发送开关', '9', '0:关闭\r\n1:开启', '默认为关闭状态，如需要邮件提醒功能，点击开启', '1381713408', '1381713408', '1', '0', '1');
INSERT INTO `onethink_config` VALUES ('65', 'EMAIL_SERVER', '1', 'SMTP服务器', '9', '', '网易163邮箱：<kbd>smtp.163.com</kbd>，qq邮箱：<kbd>smtp.qq.com</kbd>', '1381713408', '1381713408', '1', 'smtp.163.com', '3');
INSERT INTO `onethink_config` VALUES ('66', 'EMAIL_POST', '1', 'SMTP服务器端口', '9', '', '网易163邮箱：<kbd>25</kbd>，qq邮箱：<kbd>465</kbd>', '1381713408', '1381713408', '1', '25', '3');
INSERT INTO `onethink_config` VALUES ('67', 'EMAIL_SEND', '1', 'SMTP发送邮箱', '9', '', '推荐使用网易邮箱', '1381713408', '1381713408', '1', 'SMTP发送邮箱', '4');
INSERT INTO `onethink_config` VALUES ('68', 'EMAIL_USER', '1', 'SMTP用户名', '9', '', '此处填写网易邮箱', '1381713408', '1381713408', '1', 'SMTP用户名', '5');
INSERT INTO `onethink_config` VALUES ('69', 'EMAIL_PASSWORD', '7', 'SMTP密码', '9', '', '此处填写网易邮箱的客户端授权密码', '1381713408', '1381713408', '1', 'SMTP密码', '6');
INSERT INTO `onethink_config` VALUES ('70', 'EMAIL_TITLE', '1', '订单信息邮件标题', '9', '', '此处填写邮箱里收到的订单邮件的标题', '1381713408', '1381713408', '1', '您有新订单，请注意查收！', '7');
INSERT INTO `onethink_config` VALUES ('71', 'SMS_HDSTATUS', '4', '短信状态', '11', '0:关闭\r\n1:开启', '短信开启状态，关闭', '1381713408', '1381713408', '1', '0', '5');
INSERT INTO `onethink_config` VALUES ('72', 'SMS_USERNAME', '1', '短信平台帐号', '11', '', '短信平台的登录帐号，还没有【<a href=\"http://www.smsbao.com/reg?r=10597\" target=\"_blank\">立即注册</a>】', '1381713408', '1381713408', '1', '短信平台帐号', '2');
INSERT INTO `onethink_config` VALUES ('73', 'SMS_PASSWORD', '7', '短信平台密码', '11', '', '短信平台的登录密码', '1381713408', '1381713408', '1', '短信平台密码', '3');
INSERT INTO `onethink_config` VALUES ('74', 'SMS_TITLE_1', '5', '短信接口设置', '11', '', '', '1381713408', '1381713408', '1', '', '1');
INSERT INTO `onethink_config` VALUES ('75', 'SMS_TITLE_2', '5', '提交成功后发送短信', '11', '', '', '1381713408', '1381713408', '1', '', '4');
INSERT INTO `onethink_config` VALUES ('76', 'SMS_HDGKCON', '2', '发送给顾客短信内容', '11', '', '｛｝大括号内是系统变量，不能修改 <a href=\"javascript:;\" data-modal=\"modal-1\" class=\"md-trigger\"><kbd>系统变量说明</kbd></a', '1381713408', '1381713408', '1', '您好{name}，您已成功订购{title}，我们会马上安排为您发货，请保持您的电话畅通。【小蜜蜂】', '7');
INSERT INTO `onethink_config` VALUES ('77', 'SMS_HDSJCON', '2', '发送给商家短信内容', '11', '', '｛｝大括号内是系统变量，不能修改 <a href=\"javascript:;\" data-modal=\"modal-1\" class=\"md-trigger\"><kbd>系统变量说明</kbd></a', '1381713408', '1381713408', '1', '收到新订单（{name}/{phone}/{province}{city}{area} ），请注意查收。【小蜜蜂】', '8');
INSERT INTO `onethink_config` VALUES ('78', 'SMS_DX', '6', '短信发送对象', '11', 'gk:发送给顾客\r\nsj:发送给商家', '短信发送对象', '1381713408', '1381713408', '1', 'a:1:{i:0;s:1:\"1\";}', '6');
INSERT INTO `onethink_config` VALUES ('79', 'SMS_TITLE_3', '5', '手机短信验证码', '11', '', '', '1381713408', '1381713408', '1', '', '9');
INSERT INTO `onethink_config` VALUES ('80', 'SMS_VERIFY', '4', '短信状态', '11', '0:关闭\r\n1:开启', ' 短信开启状态，关闭', '1381713408', '1381713408', '1', '0', '10');
INSERT INTO `onethink_config` VALUES ('81', 'SMS_VERIFY_CON', '2', '短信验证码内容', '11', '', '短信验证码内容，<kbd>{sms}</kbd>为验证码变量', '1381713408', '1381713408', '1', '验证码：{sms}，请在10分钟内按页面提示提交验证码，切勿将验证码泄露于他人。【小蜜蜂】', '11');
INSERT INTO `onethink_config` VALUES ('82', 'SMS_PHONE', '1', '商家接收短信手机号', '11', '', '商家接收短信手机号', '1381713408', '1381713408', '1', '商家接收短信手机号', '6');
INSERT INTO `onethink_config` VALUES ('83', 'ORDER_1', '10', '', '10', '', '', '1381713408', '1381713408', '1', '', '0');
INSERT INTO `onethink_config` VALUES ('84', 'ORDER_2', '10', '', '10', '', '', '1381713408', '1381713408', '1', 'ordernum,proid,total,name,phone,address,message,addtime,paytype,status,exp_com,exp_num,uid', '0');
INSERT INTO `onethink_config` VALUES ('85', 'TITLE_3', '5', '订单发货后发送短信', '11', '', '', '1381713408', '1381713408', '1', '', '12');
INSERT INTO `onethink_config` VALUES ('87', 'SMS_FAHUO', '2', '发货短信内容', '11', '', '｛｝大括号内是系统变量，不能修改 <a href=\"javascript:;\" data-modal=\"modal-1\" class=\"md-trigger\"><kbd>系统变量说明</kbd></a', '1381713408', '1381713408', '1', '您好{name}，您已成功订购{title}，我们已经为您发货，请保持您的电话畅通。【小蜜蜂】', '14');
INSERT INTO `onethink_config` VALUES ('86', 'SMS_FAHUO_STATUS', '4', '短信状态', '11', '0:关闭\r\n1:开启', '短信开启状态，关闭', '1381713408', '1381713408', '1', '0', '13');
INSERT INTO `onethink_config` VALUES ('88', 'HTML_STATUS', '0', '静态状态', '0', '', '', '1381713408', '1381713408', '0', '1', '0');

-- ----------------------------
-- Table structure for `onethink_document`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document`;
CREATE TABLE `onethink_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`type`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表\r\n@author   麦当苗儿\r\n@version  2013-05-21';

-- ----------------------------
-- Records of xd_document
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_document_article`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_article`;
CREATE TABLE `onethink_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表\r\n@author   麦当苗儿\r\n@version  2013-05-24';

-- ----------------------------
-- Records of xd_document_article
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_document_download`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_download`;
CREATE TABLE `onethink_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表\r\n@author   麦当苗儿\r\n@version  2013-05-24';

-- ----------------------------
-- Records of xd_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_domain`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_domain`;
CREATE TABLE `onethink_domain` (
  `proid` int(11) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `domain` varchar(100) DEFAULT NULL COMMENT '绑定域名',
  PRIMARY KEY (`proid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_domain
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_file`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_file`;
CREATE TABLE `onethink_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='文件表\r\n@author   麦当苗儿\r\n@version  2013-05-21';

-- ----------------------------
-- Records of xd_file
-- ----------------------------
INSERT INTO `onethink_file` VALUES ('26', 'MP_verify_EAWcpq6Di0Ibv7EA.txt', '599d337ac31e1.txt', '2017-08-23/', 'txt', 'text/plain', '16', 'a6df7bc3b604ec9a7894caf6732698e6', '7e395996f2c8591cfbce47dd8babcb1213f0c147', '0', '1503474554');
INSERT INTO `onethink_file` VALUES ('27', 'xls_agent_list.xls', '59aa26267b74c.xls', '2017-09-02/', 'xls', 'application/vnd.ms-excel', '18944', '40eae8dec406e020a8072b6504289d25', '8431b915e37e87fb9ef82d321e3fe2839d5302e7', '0', '1504323110');
INSERT INTO `onethink_file` VALUES ('28', 'xls_agent_list (1).xls', '59aa27a54cf9d.xls', '2017-09-02/', 'xls', 'application/vnd.ms-excel', '20992', '2e9f6711c6b4e3c00497e4d0f6805144', '80d55cbce2fd1b3f19d89fd31f3407eafd9558be', '0', '1504323493');
INSERT INTO `onethink_file` VALUES ('29', 'xls_agent_list (2).xls', '59aa292bc6806.xls', '2017-09-02/', 'xls', 'application/vnd.ms-excel', '164352', '1b7c1f5ee12fbea9dd48ca7c1a9c9d94', '4557d528712b425713c7799890b54ef3ded45129', '0', '1504323883');
INSERT INTO `onethink_file` VALUES ('30', '2017-09-02 14-02-14订单号数据.xls', '59aa49b770188.xls', '2017-09-02/', 'xls', 'application/vnd.ms-office', '18432', '101d6f8fd561e43099e6d1f56e7ddfa2', '146e9f7927ca3214b1595a9c740bab114af6fbae', '0', '1504332215');
INSERT INTO `onethink_file` VALUES ('31', '2017-09-02 14-02-14订单号数据.xls', '59aa4a00a716b.xls', '2017-09-02/', 'xls', 'application/vnd.ms-office', '18432', '34da42569c6742483c84253f4f45cdda', '217ad2295836d8f7ba27dad26c7c80e4d0ad0e11', '0', '1504332288');
INSERT INTO `onethink_file` VALUES ('32', '2017-11-09 12_08_58订单号数据.xls', '5a03d4e1a8ef1.xls', '2017-11-09/', 'xls', 'application/vnd.ms-office', '4096', '4a05f2dc8e4c9b2d634150acc6f490a8', '8601d51d180dff3a80932d9ec2595db72a6e0c3f', '0', '1510200545');

-- ----------------------------
-- Table structure for `onethink_gzname`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_gzname`;
CREATE TABLE `onethink_gzname` (
  `gzid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '类名',
  PRIMARY KEY (`gzid`),
  KEY `gzid` (`gzid`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_gzname
-- ----------------------------
INSERT INTO `onethink_gzname` VALUES ('1', '今日头条');
INSERT INTO `onethink_gzname` VALUES ('2', '新浪扶翼');
INSERT INTO `onethink_gzname` VALUES ('3', '新浪粉丝通');
INSERT INTO `onethink_gzname` VALUES ('4', '腾讯智汇推');
INSERT INTO `onethink_gzname` VALUES ('5', '网易有道');
INSERT INTO `onethink_gzname` VALUES ('6', '搜狐汇算');
INSERT INTO `onethink_gzname` VALUES ('7', 'UC');
INSERT INTO `onethink_gzname` VALUES ('8', '陌陌');
INSERT INTO `onethink_gzname` VALUES ('9', '网易客户端');
INSERT INTO `onethink_gzname` VALUES ('10', '腾讯广点通');
INSERT INTO `onethink_gzname` VALUES ('11', '腾讯mp');
INSERT INTO `onethink_gzname` VALUES ('12', '微信朋友圈');
INSERT INTO `onethink_gzname` VALUES ('13', '凤凰新闻端');
INSERT INTO `onethink_gzname` VALUES ('14', '品友dsp');
INSERT INTO `onethink_gzname` VALUES ('16', 'zaker');
INSERT INTO `onethink_gzname` VALUES ('17', '优酷');
INSERT INTO `onethink_gzname` VALUES ('18', '爱奇艺');
INSERT INTO `onethink_gzname` VALUES ('19', '百度信息流');
INSERT INTO `onethink_gzname` VALUES ('20', '快手');
INSERT INTO `onethink_gzname` VALUES ('21', '360搜索');
INSERT INTO `onethink_gzname` VALUES ('22', '其他');

-- ----------------------------
-- Table structure for `onethink_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_hooks`;
CREATE TABLE `onethink_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `搜索索引` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_hooks
-- ----------------------------
INSERT INTO `onethink_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `onethink_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `onethink_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `onethink_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment');
INSERT INTO `onethink_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `onethink_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `onethink_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `onethink_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `onethink_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `onethink_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `onethink_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- ----------------------------
-- Table structure for `onethink_member`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_member`;
CREATE TABLE `onethink_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `perid` int(11) DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `ix_uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='会员表\r\n@author   麦当苗儿\r\n@version  2013-05-27';

-- ----------------------------
-- Records of xd_member
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_menu`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_menu`;
CREATE TABLE `onethink_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_menu
-- ----------------------------
INSERT INTO `onethink_menu` VALUES ('1', '首页', '0', '0', 'Index/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('2', '内容', '0', '0', 'Article/mydocument', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO `onethink_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO `onethink_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('16', '用户', '0', '0', 'User/index', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `onethink_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addAction', '0', '\"用户->用户行为\"中的新增', '', '0');
INSERT INTO `onethink_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editAction', '0', '\"用户->用户行为\"点击标题进行编辑', '', '0');
INSERT INTO `onethink_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `onethink_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `onethink_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `onethink_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `onethink_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `onethink_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `onethink_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `onethink_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('43', '扩展', '0', '5', 'Addons/index', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('44', '插件管理', '43', '0', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `onethink_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `onethink_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `onethink_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `onethink_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `onethink_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `onethink_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `onethink_menu` VALUES ('57', '钩子管理', '43', '0', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `onethink_menu` VALUES ('58', '模型管理', '68', '0', 'Model/index', '1', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('68', '系统', '0', '0', 'Config/group', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('69', '网站设置', '68', '0', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('70', '配置管理', '68', '0', 'Config/index', '1', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('75', '菜单管理', '68', '0', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('76', '导航管理', '68', '0', 'Channel/index', '1', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('80', '分类管理', '68', '0', 'Category/index', '1', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('84', '移动', '80', '0', 'Category/move', '0', '移动栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('85', '合并', '80', '0', 'Category/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '1', '', '数据备份', '0');
INSERT INTO `onethink_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `onethink_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `onethink_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `onethink_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '1', '', '数据备份', '0');
INSERT INTO `onethink_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `onethink_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `onethink_menu` VALUES ('93', '其他', '0', '0', 'other', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('102', '应用', '0', '0', 'Think/lists?model=config', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `onethink_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('118', '订单管理', '0', '0', 'Order/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('119', '订单详情', '118', '0', 'Order/update', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('122', '产品管理', '0', '0', 'Product/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('123', '添加产品', '122', '2', 'Product/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('124', '产品列表', '122', '0', 'Product/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('125', '订单列表', '118', '0', 'Order/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('126', '产品编辑', '122', '0', 'Product/update', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('127', '产品规格', '122', '0', 'Product/type', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('128', '添加产品规格', '122', '0', 'Product/add_type', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('129', '修改产品规格', '122', '0', 'Product/update_type', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('130', '联系我们', '0', '0', 'Content/contact', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('131', '关于我们', '0', '0', 'Content/about', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('132', '投放平台统计', '118', '0', 'order/gzlist', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('133', '投放平台', '122', '0', 'product/gz', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('134', '投放平台统计', '118', '0', 'order/gzinfo', '1', '', '', '0');

-- ----------------------------
-- Table structure for `onethink_model`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_model`;
CREATE TABLE `onethink_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='文档模型表\r\n@author   麦当苗儿\r\n@version  2013-06-19';

-- ----------------------------
-- Records of xd_model
-- ----------------------------
INSERT INTO `onethink_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '1');
INSERT INTO `onethink_model` VALUES ('2', 'article', '文章文档', '1', '', '1', '{\"1\":[\"3\",\"2\",\"5\",\"24\"],\"2\":[\"23\",\"14\",\"25\",\"11\",\"9\",\"15\",\"16\",\"10\",\"17\",\"19\",\"13\",\"20\",\"12\",\"26\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1384743355', '1');
INSERT INTO `onethink_model` VALUES ('3', 'download', '下载文档', '1', '', '1', '{\"1\":[\"29\",\"3\",\"2\",\"5\",\"27\",\"28\",\"30\",\"9\",\"10\",\"12\",\"15\",\"14\",\"11\",\"13\",\"31\",\"17\",\"16\",\"19\",\"32\",\"20\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1385714025', '1');
INSERT INTO `onethink_model` VALUES ('4', 'action', '行为定义', '0', '', '1', '{\"1\":[\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891262', '1383891784', '1');
INSERT INTO `onethink_model` VALUES ('5', 'action_log', '行为日志', '0', '', '1', '{\"1\":[\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891340', '1383891802', '1');
INSERT INTO `onethink_model` VALUES ('6', 'addons', '插件', '0', '', '1', '{\"1\":[\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891396', '1383891828', '1');
INSERT INTO `onethink_model` VALUES ('7', 'attachment', '附件', '0', '', '1', '{\"1\":[\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891410', '1383891847', '1');
INSERT INTO `onethink_model` VALUES ('8', 'attribute', '属性', '0', '', '1', '{\"1\":[\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891441', '1383891888', '1');
INSERT INTO `onethink_model` VALUES ('9', 'category', '分类', '0', '', '1', '{\"1\":[\"82\",\"83\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"91\",\"92\",\"93\",\"94\",\"95\",\"96\",\"97\",\"98\",\"99\",\"100\",\"101\",\"102\",\"103\",\"104\",\"105\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891453', '1383891904', '1');
INSERT INTO `onethink_model` VALUES ('10', 'channel', '前台菜单', '0', '', '1', '{\"1\":[\"106\",\"107\",\"108\",\"109\",\"110\",\"111\",\"112\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891460', '1383891939', '1');
INSERT INTO `onethink_model` VALUES ('11', 'config', '配置', '0', '', '1', '{\"1\":[\"113\",\"114\",\"115\",\"116\",\"117\",\"118\",\"119\",\"120\",\"121\",\"122\",\"123\"]}', '1:基础', '', '', '', '', 'id:编号\r\nname:名称:edit?id=[id]&model=[MODEL]\r\ntitle:配置', '0', 'title|name', '', '1383891466', '1384248402', '1');
INSERT INTO `onethink_model` VALUES ('12', 'file', '文件上传', '0', '', '1', '{\"1\":[\"124\",\"125\",\"126\",\"127\",\"128\",\"129\",\"130\",\"131\",\"132\",\"133\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891474', '1383891964', '1');
INSERT INTO `onethink_model` VALUES ('13', 'hooks', '钩子', '0', '', '1', '{\"1\":[\"134\",\"135\",\"136\",\"137\",\"138\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891480', '1384495820', '1');
INSERT INTO `onethink_model` VALUES ('14', 'member', '用户信息', '0', '', '1', '{\"1\":[\"139\",\"140\",\"141\",\"142\",\"143\",\"144\",\"145\",\"146\",\"147\",\"148\",\"149\",\"150\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891488', '1384151998', '1');
INSERT INTO `onethink_model` VALUES ('15', 'menu', '后台菜单', '0', '', '1', '{\"1\":[\"151\",\"152\",\"153\",\"154\",\"155\",\"156\",\"157\",\"158\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891503', '1383892107', '1');
INSERT INTO `onethink_model` VALUES ('16', 'model', '模型', '0', '', '1', '{\"1\":[\"159\",\"160\",\"161\",\"162\",\"163\",\"164\",\"165\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"174\",\"175\",\"176\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891514', '1383892121', '1');
INSERT INTO `onethink_model` VALUES ('17', 'picture', '图片上传', '0', '', '1', '{\"1\":[\"177\",\"178\",\"179\",\"180\",\"181\",\"182\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891522', '1383892140', '1');
INSERT INTO `onethink_model` VALUES ('18', 'url', '链接管理', '0', '', '1', '{\"1\":[\"183\",\"184\",\"185\",\"186\"]}', '1:基础', '', '', '', '', 'id:编号', '0', '', '', '1383891531', '1385617833', '1');

-- ----------------------------
-- Table structure for `onethink_order`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_order`;
CREATE TABLE `onethink_order` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `name` varchar(20) DEFAULT NULL COMMENT '收货人',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `area` varchar(50) DEFAULT NULL COMMENT '区域',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `ipprovince` varchar(30) DEFAULT NULL COMMENT '下单IP省份',
  `ipcity` varchar(50) DEFAULT NULL COMMENT '下单IP城市',
  `ip` char(15) DEFAULT NULL COMMENT 'IP',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态（1：未发货-成功付款，2：已发货-成功付款）',
  `addtime` int(11) DEFAULT NULL COMMENT '下单时间',
  `message` varchar(500) DEFAULT NULL COMMENT '备注',
  `proid` int(11) DEFAULT NULL COMMENT '产品ID',
  `title` text COMMENT '订单详情',
  `ordernum` char(16) DEFAULT NULL COMMENT '订单号',
  `paytime` int(11) DEFAULT NULL COMMENT '付款时间',
  `paytype` varchar(10) DEFAULT NULL COMMENT '支付方式(alipay:支付宝 , wechat:微信，huodao：货到付款)',
  `nid` varchar(50) DEFAULT NULL COMMENT '订购套餐ID',
  `total` float(11,2) DEFAULT NULL,
  `openid` varchar(225) DEFAULT NULL,
  `gzid` int(11) DEFAULT NULL COMMENT '投放ID',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别（0：女，1：男）',
  `age` tinyint(4) DEFAULT NULL COMMENT '年龄',
  `height` tinyint(4) DEFAULT NULL COMMENT '身高（CM）',
  `weight` tinyint(4) DEFAULT NULL COMMENT '体重（KG）',
  `idnumber` char(18) DEFAULT NULL COMMENT '身份证号',
  `tel` char(20) DEFAULT NULL COMMENT '电话号码',
  `code` char(6) DEFAULT NULL COMMENT '邮编 ',
  `qq` char(13) DEFAULT NULL COMMENT 'qq号',
  `wechat` char(30) DEFAULT NULL COMMENT '微信号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `size` varchar(100) DEFAULT NULL COMMENT '尺寸',
  `color` varchar(100) DEFAULT NULL COMMENT '颜色',
  `tid` int(11) DEFAULT NULL COMMENT '模板ID',
  `exp_com` varchar(50) DEFAULT NULL COMMENT '快递公司',
  `exp_num` varchar(30) DEFAULT NULL COMMENT '快递号',
  `alinum` char(32) DEFAULT NULL COMMENT '支付宝订单号',
  `explain` varchar(500) DEFAULT NULL COMMENT '补充说明',
  `sms` tinyint(1) DEFAULT '0' COMMENT '是否已经发送短信（0：否，1：是）',
  `note` varchar(1000) DEFAULT NULL COMMENT '备注',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `reclaim` tinyint(1) DEFAULT '0' COMMENT '回收站（0：没有回收，1：回收）',
  PRIMARY KEY (`orderid`),
  KEY `orderid` (`orderid`),
  KEY `ordernum` (`ordernum`),
  KEY `status` (`status`),
  KEY `paytype` (`paytype`),
  KEY `addtime` (`addtime`),
  KEY `proid` (`proid`),
  KEY `gzid` (`gzid`),
  KEY `openid` (`openid`),
  KEY `reclaim` (`reclaim`)
) ENGINE=MyISAM AUTO_INCREMENT=716 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_order
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_paycode`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_paycode`;
CREATE TABLE `onethink_paycode` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `thumb` varchar(100) DEFAULT NULL COMMENT '支付二维码',
  `price` float(11,2) DEFAULT NULL COMMENT '价格',
  `type` varchar(10) DEFAULT NULL COMMENT '支付类型',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_paycode
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_permissions`;
CREATE TABLE `onethink_permissions` (
  `perid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) DEFAULT NULL COMMENT '权限组名称',
  `system` varchar(255) DEFAULT NULL COMMENT '系统管理',
  `order` varchar(255) DEFAULT NULL COMMENT '订单管理',
  `product` varchar(255) DEFAULT NULL COMMENT '产品管理',
  `list` varchar(1000) DEFAULT NULL COMMENT '产品授权',
  PRIMARY KEY (`perid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_permissions
-- ----------------------------
INSERT INTO `onethink_permissions` VALUES ('1', '最高权限', 'system,source,source_add,source_del,source_update,order_field,user,user_add,user_del,user_update,per,per_add,per_del,per_update,database,paycode,paycode_add,paycode_del,paycode_update,actionlog', 'order_list,order_add,order_del,order_update,order_export,order_gz,order_sum', 'template,template_add,template_del,template_update,pro,pro_add,pro_del,pro_update,domain', null);
INSERT INTO `onethink_permissions` VALUES ('2', '运营权限', 'system,template,template_add,template_del,template_update,source_del,user,user_add,user_del,user_update,database,paycode,paycode_add,paycode_del,paycode_update,actionlog', 'order_list,order_add,order_del,order_update,order_export,order_gz,order_sum', 'pro', '5');

-- ----------------------------
-- Table structure for `onethink_picture`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_picture`;
CREATE TABLE `onethink_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xd_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_product`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_product`;
CREATE TABLE `onethink_product` (
  `proid` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `title` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `thumb` varchar(255) DEFAULT NULL,
  `images` text COMMENT '图组',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `number` int(11) DEFAULT NULL COMMENT '购买次数',
  `num_status` tinyint(1) DEFAULT NULL COMMENT '购买量状态（0：开启，1：关闭）',
  `oldprice` float(11,2) DEFAULT NULL COMMENT '原价',
  `price` float(11,2) DEFAULT NULL COMMENT '折后价',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `starttime` int(11) DEFAULT NULL COMMENT '开始时间',
  `endtime` int(11) DEFAULT NULL COMMENT '结束时间',
  `time_status` tinyint(1) DEFAULT NULL COMMENT '活动时间状态（0：开启，1：关闭）',
  `time_type` tinyint(1) DEFAULT NULL COMMENT '活动时间类型（1：设定开始时间，截止时间，2：循环时间）',
  `time_sum` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '状态（1：开启，2：关闭）',
  `template` int(11) DEFAULT NULL COMMENT '模板ID',
  `discount` char(5) DEFAULT NULL COMMENT '折扣',
  `review_status` tinyint(1) DEFAULT NULL COMMENT '评论状态（0：开始，1关闭）',
  `review` text COMMENT '评论内容',
  `style` char(6) DEFAULT NULL COMMENT '风格模板',
  `parameter` varchar(1000) DEFAULT NULL COMMENT '产品参数',
  `price_addition` varchar(255) DEFAULT NULL COMMENT '活动价附加说明',
  `song` varchar(255) DEFAULT NULL COMMENT '下单送',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序',
  `foot_thumb` varchar(100) DEFAULT NULL COMMENT '底部图片',
  `currency` varchar(10) DEFAULT '¥' COMMENT '货币符号',
  PRIMARY KEY (`proid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_product
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_product_data`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_product_data`;
CREATE TABLE `onethink_product_data` (
  `proid` int(11) DEFAULT NULL COMMENT '产品ID',
  `content` longtext COMMENT '内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_product_data
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_product_norms`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_product_norms`;
CREATE TABLE `onethink_product_norms` (
  `nid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `proid` int(11) DEFAULT NULL COMMENT '产品ID',
  `title` varchar(100) DEFAULT NULL COMMENT '名称',
  `thumb` varchar(100) DEFAULT NULL COMMENT '图片',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型（1：套餐和价格，2：产品尺寸大小，3：产品颜色）',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `price` float(11,2) DEFAULT NULL COMMENT '价格',
  `def` tinyint(4) DEFAULT '0' COMMENT '1（为默认）',
  PRIMARY KEY (`nid`),
  KEY `nid` (`nid`),
  KEY `proid` (`proid`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_product_norms
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_template`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_template`;
CREATE TABLE `onethink_template` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '模板名称',
  `title` varchar(100) DEFAULT NULL COMMENT '订单标题',
  `pro_class` tinyint(4) DEFAULT NULL COMMENT '产品选择方式（1：单选，2：单选+图片，3：多选，4：多选+图片，5：下拉）',
  `pro_title` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `size_class` tinyint(4) DEFAULT NULL COMMENT '尺码显示方式（1：单选，2：下拉）',
  `size_title` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `color_class` tinyint(4) DEFAULT NULL COMMENT '颜色显示方式（1：单选，2：单选+图片，3：下拉）',
  `color_title` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `options` varchar(500) DEFAULT NULL COMMENT '表单选项（1：订购数量，2：产品价格，3：姓名，4：性别，5：年龄，6：身高，7：体重，8：身份证号，9：手机号码，10：电话号码，11：地区选择，12：详情地址，13：邮编，14：QQ号，15：微信号，16：邮箱，17：邀请码，18：留言）',
  `pay_type` text COMMENT '付款方式（1：货到付款，2：支付宝付款，3：微信付款）',
  `sms` tinyint(1) DEFAULT NULL COMMENT '短信（0：开启，1：关闭）',
  `alert` tinyint(1) DEFAULT NULL COMMENT '订单提交设置开关（0：开启，1：关闭）',
  `alert_type` tinyint(1) DEFAULT NULL COMMENT '表单提交成功提示方式（1：跳转到成功页面，2：弹出对话框）',
  `alert_href` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `alert_content` varchar(255) DEFAULT NULL COMMENT '对话框内容',
  `delivery` tinyint(1) DEFAULT NULL COMMENT '显示发货通知开关(0：开启，1：关闭）',
  `delivery_title` varchar(100) DEFAULT NULL COMMENT '发货通知标题',
  `delivery_content` text COMMENT '自定义发货通知内容',
  `message` varchar(255) DEFAULT NULL COMMENT '默认留言内容',
  `nav` tinyint(1) DEFAULT NULL,
  `nav_temp` varchar(30) DEFAULT NULL COMMENT 'index,buy,tel,sms,qq,top',
  `phone` char(11) DEFAULT NULL COMMENT '电话咨询号码',
  `smsphone` char(11) DEFAULT NULL COMMENT '短信咨询号码',
  `qq` char(13) DEFAULT NULL COMMENT 'QQ咨询号码',
  `order` tinyint(1) DEFAULT NULL COMMENT '显示最新下单开关(0：开启，1：关闭）',
  `order_title` varchar(255) DEFAULT NULL COMMENT '自定义最新下单标题',
  `order_content` text COMMENT '自定义最新下单内容',
  `search` tinyint(1) DEFAULT '0' COMMENT '订单查询开关（0：开启，1：关闭）',
  `addtime` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`tid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_template
-- ----------------------------
INSERT INTO `onethink_template` VALUES ('1', '默认模板', '在线快速订购', '1', '订购产品', '1', '颜色', '1', '尺寸', 'a:7:{i:0;s:3:\"num\";i:1;s:5:\"price\";i:2;s:4:\"name\";i:3;s:5:\"phone\";i:4;s:4:\"area\";i:5;s:7:\"address\";i:6;s:7:\"message\";}', 'a:5:{s:6:\"huodao\";a:5:{s:6:\"status\";s:1:\"1\";s:8:\"discount\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:7:\"content\";s:90:\"温馨提示：选择货到付款在家等快递公司送货上门，先验货后付款！\";s:5:\"title\";s:12:\"货到付款\";}s:6:\"alipay\";a:5:{s:6:\"status\";s:1:\"0\";s:8:\"discount\";s:1:\"1\";s:4:\"sort\";s:1:\"2\";s:7:\"content\";s:84:\"温馨提示：全球领先的第三方支付平台，在线支付，安全可靠！\";s:5:\"title\";s:9:\"支付宝\";}s:6:\"wechat\";a:5:{s:6:\"status\";s:1:\"0\";s:8:\"discount\";s:1:\"1\";s:4:\"sort\";s:1:\"3\";s:7:\"content\";s:84:\"温馨提示：全球领先的第三方支付平台，在线支付，安全可靠！\";s:5:\"title\";s:6:\"微信\";}s:10:\"alipaycode\";a:5:{s:6:\"status\";s:1:\"0\";s:8:\"discount\";s:1:\"1\";s:4:\"sort\";s:1:\"4\";s:7:\"content\";s:84:\"温馨提示：全球领先的第三方支付平台，在线支付，安全可靠！\";s:5:\"title\";s:18:\"支付宝二维码\";}s:10:\"wechatcode\";a:5:{s:6:\"status\";s:1:\"0\";s:8:\"discount\";s:1:\"1\";s:4:\"sort\";s:1:\"5\";s:7:\"content\";s:84:\"温馨提示：全球领先的第三方支付平台，在线支付，安全可靠！\";s:5:\"title\";s:15:\"微信二维码\";}}', '1', '1', '1', 'https://www.baidu.com/', '恭喜您{name}，您已成功订购{title}！', '1', '发货通知', '{time}  {province}的{name}  {phone}  您订购的{title} 已发货！\r\n{time}  {province}的{name}  {phone}  您订购的{title} 已发货！\r\n{time}  {province}的{name}  {phone}  您订购的{title} 已发货！\r\n{time}  {province}的{name}  {phone}  您订购的{title} 已发货！\r\n{time}  {province}的{name}  {phone}  您订购的{title} 已发货！\r\n{time}  {province}的{name}  {phone}  您订购的{title} 已发货！\r\n{time}  {province}的{name}  {phone}  您订购的{title} 已发货！\r\n{time}  {province}的{name}  {phone}  您订购的{title} 已发货！', '请尽快安排发货，送货之前手机联系，谢谢！！', '1', '', '', null, null, '0', '发货通知', '{time} 郑**（187****9959）在5分钟前订购了【清香型2斤】√\r\n{time} 陈**（137****1210）在12分钟前订购了【清香型一斤+浓香型一斤】√\r\n{time} 赵**（134****4096）在38分钟前订购了【浓香型一斤】√\r\n{time}钱**（188****5466）在59分钟前订购了【清香型一斤】√\r\n{time} 刘**（153****5309）在1小时前订购了【清香型1斤+浓香型1斤】√\r\n{time} 张**（158****7649）在1小时前订购了【清香型】\r\n{time} 郑**（187****9959）在5分钟前订购了【清香型2斤】√\r\n{time} 陈**（137****1210）在12分钟前订购了【清香型一斤+浓香型一斤】√\r\n{time} 赵**（134****4096）在38分钟前订购了【浓香型一斤】√\r\n{time}钱**（188****5466）在59分钟前订购了【清香型一斤】√\r\n{time} 刘**（153****5309）在1小时前订购了【清香型1斤+浓香型1斤】√\r\n{time} 张**（158****7649）在1小时前订购了【清香型】\r\n{time} 郑**（187****9959）在5分钟前订购了【清香型2斤】√\r\n{time} 陈**（137****1210）在12分钟前订购了【清香型一斤+浓香型一斤】√\r\n{time} 赵**（134****4096）在38分钟前订购了【浓香型一斤】√\r\n{time}钱**（188****5466）在59分钟前订购了【清香型一斤】√\r\n{time} 刘**（153****5309）在1小时前订购了【清香型1斤+浓香型1斤】√\r\n{time} 张**（158****7649）在1小时前订购了【清香型】', '0', '1501123519');

-- ----------------------------
-- Table structure for `onethink_ucenter_admin`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_admin`;
CREATE TABLE `onethink_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of xd_ucenter_admin
-- ----------------------------
INSERT INTO `onethink_ucenter_admin` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `onethink_ucenter_app`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_app`;
CREATE TABLE `onethink_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of xd_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_ucenter_member`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_member`;
CREATE TABLE `onethink_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of xd_ucenter_member
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_ucenter_setting`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_setting`;
CREATE TABLE `onethink_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of xd_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_url`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_url`;
CREATE TABLE `onethink_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of xd_url
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_userdata`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_userdata`;
CREATE TABLE `onethink_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xd_userdata
-- ----------------------------
