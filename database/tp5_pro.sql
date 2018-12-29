/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tp5_pro

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-12-29 17:35:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp5_admins
-- ----------------------------
DROP TABLE IF EXISTS `tp5_admins`;
CREATE TABLE `tp5_admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员昵称',
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员头像',
  `password` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '87d9bb400c0634691f0e3baaf1e2fd0d' COMMENT '管理员登录密码',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态标识',
  `content` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '世界上没有两片完全相同的叶子！' COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_admins
-- ----------------------------
INSERT INTO `tp5_admins` VALUES ('1', 'niuNeng@admin', '/cms/images/headshot/niuNeng.png', '87d9bb400c0634691f0e3baaf1e2fd0d', '1', '2018-02-11 21:02:43', '1', '世界上没有两片完全相同的叶子！');
INSERT INTO `tp5_admins` VALUES ('2', 'baZhaHei@admin', '/cms/images/headshot/baZhaHei.png', 'db69fc039dcbd2962cb4d28f5891aae1', '2', '2018-02-11 21:02:43', '1', '世界上没有两片完全相同的叶子！');
INSERT INTO `tp5_admins` VALUES ('3', 'moTzxx@admin', '/cms/images/headshot/wuHuang.png', 'db69fc039dcbd2962cb4d28f5891aae1', '1', '2018-02-11 21:02:43', '1', '世界上没有两片完全相同的叶子！');
INSERT INTO `tp5_admins` VALUES ('12', '1234567890', '/cms/images/headshot/baZhaHei.png', '42253fa978ca4bbf95668ec455e4844d', '1', '2018-12-21 15:01:46', '1', '123123');
INSERT INTO `tp5_admins` VALUES ('8', 'heze@admin', '/upload/20181220\\2a5c8c183217f1dab9785151a3e23afd.jpg', 'db69fc039dcbd2962cb4d28f5891aae1', '1', '2018-12-20 15:46:36', '1', 'heze@admin\r\nadmin');
INSERT INTO `tp5_admins` VALUES ('14', '123', '/cms/images/headshot/baZhaHei.png', '6fd742a61bd034804c00c49b18045020', '1', '2018-12-21 15:53:29', '1', '123');
INSERT INTO `tp5_admins` VALUES ('15', '001', '/cms/images/headshot/baZhaHei.png', 'cdd96d3cc73d1dbdaffa03cc6cd7339b', '1', '2018-12-21 15:53:48', '1', '1');
INSERT INTO `tp5_admins` VALUES ('16', '2', '/cms/images/headshot/baZhaHei.png', '0b7e7dee87b1c3b98e72131173dfbbbf', '1', '2018-12-21 15:54:02', '1', '2');
INSERT INTO `tp5_admins` VALUES ('17', '3', '/cms/images/headshot/baZhaHei.png', '0b24df25fe628797b3a50ae0724d2730', '1', '2018-12-21 15:54:14', '1', '3');
INSERT INTO `tp5_admins` VALUES ('18', '4', '/cms/images/headshot/baZhaHei.png', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2018-12-21 15:54:25', '1', '4');
INSERT INTO `tp5_admins` VALUES ('19', '5', '/cms/images/headshot/baZhaHei.png', '8b9af1f7f76daf0f02bd9c48c4a2e3d0', '1', '2018-12-21 15:54:38', '1', '5');

-- ----------------------------
-- Table structure for tp5_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `tp5_admin_log`;
CREATE TABLE `tp5_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id编号',
  `action` text NOT NULL COMMENT '行为名称',
  `performer` varchar(255) NOT NULL COMMENT '执行者',
  `timeline` int(11) NOT NULL COMMENT '执行时间',
  `ip` varchar(48) DEFAULT NULL COMMENT '执行者ip',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp5_admin_log
-- ----------------------------
INSERT INTO `tp5_admin_log` VALUES ('1', '修改角色，id：13；123123 \"数据无变动，修改失败\"', 'heze@admin(终级管理员)', '1545637959', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('2', '新增菜单，邮件管理 \"菜单添加成功\"', 'heze@admin(终级管理员)', '1545893379', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('3', '修改角色，id：1；终级管理员 \"角色修改成功\"', 'heze@admin(终级管理员)', '1545893395', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('4', '修改菜单，邮件管理 \"菜单修改成功\"', 'heze@admin(终级管理员)', '1545901370', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('5', '修改菜单，邮件管理 \"菜单修改成功\"', 'heze@admin(终级管理员)', '1545969328', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('6', '新增邮件，123123 \"添加成功\"', 'heze@admin(终级管理员)', '1545975792', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('7', '新增邮件，2018-12-28 \"添加成功\"', 'heze@admin(终级管理员)', '1545975974', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('8', '新增邮件，授权码 \"添加成功\"', 'heze@admin(终级管理员)', '1545976107', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('9', '新增邮件，test \"添加成功\"', 'heze@admin(终级管理员)', '1545976947', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('10', '新增邮件，test02 \"添加成功\"', 'heze@admin(终级管理员)', '1545977017', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('11', '新增邮件，test03 \"添加成功\"', 'heze@admin(终级管理员)', '1545977043', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('12', '新增邮件，test04 \"添加成功\"', 'heze@admin(终级管理员)', '1545977089', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('13', '新增邮件，test05 \"添加成功\"', 'heze@admin(终级管理员)', '1545977163', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('14', '新增邮件，test06 \"添加成功\"', 'heze@admin(终级管理员)', '1545977182', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('15', '新增邮件，test07 \"添加成功\"', 'heze@admin(终级管理员)', '1545977262', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('16', '新增邮件，test08 \"添加成功\"', 'heze@admin(终级管理员)', '1545977589', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('17', '新增邮件，test09 \"添加成功\"', 'heze@admin(终级管理员)', '1545977605', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('18', '新增邮件，test09 \"添加成功\"', 'heze@admin(终级管理员)', '1545980121', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('19', '修改邮件，test10 \"修改成功\"', 'heze@admin(终级管理员)', '1545981330', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('20', '修改邮件，test101 \"修改成功\"', 'heze@admin(终级管理员)', '1545981353', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('21', '修改邮件，test0901 \"修改成功\"', 'heze@admin(终级管理员)', '1545981686', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('22', '修改邮件，test0901 \"修改成功\"', 'heze@admin(终级管理员)', '1545981701', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('23', '修改邮件，test08 \"修改成功\"', 'heze@admin(终级管理员)', '1545982572', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('24', '新增邮件，test11 \"添加成功\"', 'heze@admin(终级管理员)', '1545982981', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('25', '新增邮件，test12 \"添加成功\"', 'heze@admin(终级管理员)', '1545983051', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('26', '新增邮件，test13 \"添加成功\"', 'heze@admin(终级管理员)', '1545983193', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('27', '新增邮件，test14 \"添加成功\"', 'heze@admin(终级管理员)', '1545983252', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('28', '修改邮件，test14 \"修改成功\"', 'heze@admin(终级管理员)', '1545984025', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('29', '修改邮件，test13 \"数据无变动\"', 'heze@admin(终级管理员)', '1545984084', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('30', '修改邮件，test13 \"修改成功\"', 'heze@admin(终级管理员)', '1545984124', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('31', '修改邮件，test13 \"修改成功\"', 'heze@admin(终级管理员)', '1545984180', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('32', '修改邮件，test13 \"修改成功\"', 'heze@admin(终级管理员)', '1545984266', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('33', '修改邮件，test13 \"修改成功\"', 'heze@admin(终级管理员)', '1545984320', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('34', '修改邮件，test13 \"修改成功\"', 'heze@admin(终级管理员)', '1545984351', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('35', '修改邮件，test13 \"修改成功\"', 'heze@admin(终级管理员)', '1545984417', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('36', '修改邮件，test13 \"修改成功\"', 'heze@admin(终级管理员)', '1545984594', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('37', '修改邮件，test13 \"修改成功\"', 'heze@admin(终级管理员)', '1545984692', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('38', '修改邮件，test13 \"修改成功\"', 'heze@admin(终级管理员)', '1545984732', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('39', '修改邮件，test13 \"修改成功\"', 'heze@admin(终级管理员)', '1545984815', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('40', '修改邮件，test13 \"修改成功\"', 'heze@admin(终级管理员)', '1545984846', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('41', '修改邮件，test14 \"修改成功\"', 'heze@admin(终级管理员)', '1545984855', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('42', '修改邮件，test14 \"修改成功\"', 'heze@admin(终级管理员)', '1545984872', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('43', '修改邮件，test14 \"修改成功\"', 'heze@admin(终级管理员)', '1545984895', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('44', '修改邮件，test14 \"修改成功\"', 'heze@admin(终级管理员)', '1545984968', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('45', '修改邮件，test14 \"修改成功\"', 'heze@admin(终级管理员)', '1545985122', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('46', '修改邮件，test145 \"修改成功\"', 'heze@admin(终级管理员)', '1545985163', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('47', '修改邮件，test145 \"修改成功\"', 'heze@admin(终级管理员)', '1545985539', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('48', '修改邮件，test08 \"修改成功\"', 'heze@admin(终级管理员)', '1545985763', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('49', '修改邮件，test08 \"修改成功\"', 'heze@admin(终级管理员)', '1545985832', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('50', '修改邮件，test145 \"修改成功\"', 'heze@admin(终级管理员)', '1545986354', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('51', '新增邮件，123 \"添加成功\"', 'heze@admin(终级管理员)', '1545986551', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('52', '新增邮件，123 \"添加成功\"', 'heze@admin(终级管理员)', '1545986703', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('53', '修改邮件，授权码 \"修改成功\"', 'heze@admin(终级管理员)', '1545987946', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('54', '修改邮件，指向一个按钮触发上传，一般配合 auto: false 来使用。值为选择器或DOM对象，如：bindAction: \'#btn\' \"修改成功\"', 'heze@admin(终级管理员)', '1545988012', '127.0.0.1', null);
INSERT INTO `tp5_admin_log` VALUES ('55', '修改邮件，指向一个按钮触发上传，一般配合 auto: false 来使用。值为选择器或DOM对象，如：bindAction: \'#btn\' \"修改成功\"', 'heze@admin(终级管理员)', '1545988111', '127.0.0.1', null);

-- ----------------------------
-- Table structure for tp5_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `tp5_admin_roles`;
CREATE TABLE `tp5_admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '角色称呼',
  `nav_menu_ids` text COLLATE utf8_unicode_ci NOT NULL COMMENT '权限下的菜单ID',
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_admin_roles
-- ----------------------------
INSERT INTO `tp5_admin_roles` VALUES ('1', '终级管理员', '1|7|6|2|50|3|4|5|51|52|53|54|', '2018-02-11 21:02:43', '1');
INSERT INTO `tp5_admin_roles` VALUES ('2', '初级管理员', '1|7|6|2|3|4|5|', '2018-02-11 21:02:43', '1');
INSERT INTO `tp5_admin_roles` VALUES ('13', '123123', '1|7|6|2|50|3|4|5|45|48|49|51|52|53|', '2018-12-21 14:54:31', '1');

-- ----------------------------
-- Table structure for tp5_articles
-- ----------------------------
DROP TABLE IF EXISTS `tp5_articles`;
CREATE TABLE `tp5_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Article 主键',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '作者ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `list_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序标识 越大越靠前',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_articles
-- ----------------------------
INSERT INTO `tp5_articles` VALUES ('1', '这是今年最好的演讲：生命来来往往，来日并不方长', '1', '2018-02-11 21:02:42', '2018-12-21 10:12:03', '0', '<p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"letter-spacing: 0.544px; margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">视频中的演讲者算了一笔时间帐，如果一个人活到</span><span style=\"letter-spacing: 0.544px; margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; color: rgb(153, 0, 0); box-sizing: border-box !important; overflow-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">78岁</strong></span><span style=\"letter-spacing: 0.544px; margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">，那么：</span><br/></p><p class=\"\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">要花大概</span><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(153, 0, 0);\">28.3年</span></strong><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">在睡觉上，足足占据人生的三分之一；</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">要花大概</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(153, 0, 0);\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">10.5年</span></strong></span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">在工作上；并且很可能这份工作不尽人意；</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">同时花在电视和社交媒体上的时间，也将占据</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(153, 0, 0);\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">9.5年</strong></span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">；</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">另外，还有吃饭、化妆、照顾孩子等等，也都是不小的时间开销。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">算到最后，真正留给自己的岁月不过</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(153, 0, 0); font-size: 18px;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">9年</strong></span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">而已。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">而如何利用这空白的9年，对每个人都有重大意义。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><img class=\" __bg_gif\" src=\"https://mmbiz.qpic.cn/mmbiz_gif/8DoQ2HTrG9wsKos14ib0E4YOyZEEtnoPwHXtHib4nT6qD8agbyicVRQgoH7d8WxAMYjHykZFrDcLB1YMgnTiaVuqZw/640?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1\"/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">我们每天都有</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(153, 0, 0);\">86400</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">秒存入自己的生命账户，一天结束后，第二天你将拥有新的86400秒。</span><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">如果这是一笔钱，没有人会任它白白溜走，但现实中我们却一天天浪费永不再来的时间。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">佛祖说，</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(153, 0, 0);\">人生最大的错误就是认为自己有时间</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">总以为岁月漫漫，有的是时间挥霍等待。</span><br/></p><p class=\"\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">总以为明天很多，很多事不必急于一时，很多人无需立刻相见。</span></p><p class=\"\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">但其实，人生来来往往，真的没有那么多来日方长。</span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(153, 0, 0);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">余生很贵，经不起浪费。</span></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(153, 0, 0);\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></strong></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><img class=\" __bg_gif\" src=\"https://mmbiz.qpic.cn/mmbiz_gif/8DoQ2HTrG9wsKos14ib0E4YOyZEEtnoPwCab90RLp84I8T3bNXE0FGlfWChHjwiaNfianCysBUhVvYKaaCL3YY6SA/640?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1\"/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">就像三毛所说，</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(153, 0, 0);\">我来不及认真地年轻，待明白过来时，只能选择认真地老去。</span></p><p class=\"\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">趁阳光正好，趁微风不燥，见想见的人，做想做的事，就是对人生最大的不辜负。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">所以，</span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">去爱吧，就像从来没有受过伤害一样</span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">跳舞吧，如同没有任何人注视你一样</span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">活着吧，如同今天就是末日一样</span></strong></p><p class=\"\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(51, 51, 51);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(153, 0, 0); font-size: 15px;\">生命来来往往，来日并不方长，别等，别遗憾。</span></p>');
INSERT INTO `tp5_articles` VALUES ('2', '真正放下一个人，不是拉黑，也不是删除', '2', '2018-02-11 21:02:43', '2018-11-21 09:11:31', '0', '<p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">有人说，越在乎，越假装不在乎；越放不下，越假装放得下。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px; color: rgb(153, 0, 0);\">没错。成年人的我们的确有着数不清的佯装，就连感情也难逃此劫。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">那个曾被置顶、秒回消息、熬夜畅聊的人，连同那些曾经炽热的喜欢，深夜不眠畅谈的欢快和被宠着重视着的小雀跃，现如今都安安静静地躺在黑名单中。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">不论是因为无所谓的小事而生气地冲动而为，还是因为有矛盾闹别扭时矫情地想博得关注，还是因为心碎而绝望地断绝关系，那看似干脆利落的拉黑、删除，都透露着在乎和放不下。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">大张旗鼓的离开都是试探，试探对方是否像自己一样还在乎；假装洒脱的放下不过是自欺欺人，欺骗自己反正我也不怕离开他。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px; color: rgb(153, 0, 0);\">其实，你很在乎他，也害怕离开他。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">拉黑或删除，不过是你害怕自己再次联系，不愿让自己卑微到尘埃里，想保留自己最后的尊严，而采取的无可奈何的强制手段；又或者是你期待着对方的主动联系，想证明他还在乎你，他离不开你，而实施的小手段。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">而真正放下一个人，从来就不是拉黑和删除，不是明明在乎着却假装不在乎，明明放不下却假装已放下。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(51, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">真正的放下，是不闻不问，是沉默不语，是无动于衷。</span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(51, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"></span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px; color: rgb(153, 0, 0);\">但感情结束的那个瞬间，过去你深爱着的，深爱着你的那个人，便不再存在了。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">他的美好，你们感情的默契，不过都是你记忆里的样子而已。而你的记忆常常会被你加上滤镜，就像相亲对象开了美颜的“照骗”一样，美好但不真实。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">而这份值得回忆和珍藏的美好，只属于曾经，从不曾属于现在。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(51, 51, 51);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">要知道，执拗地坚持着不该坚持的，本就不是深情，是愚钝；而故作洒脱的拉黑、删除，又何尝不是因为放不下。</span></p>');
INSERT INTO `tp5_articles` VALUES ('4', '真正在乎你的人，绝不会说这句话', '1', '2018-11-21 01:11:42', '2018-12-21 10:12:45', '0', '<p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); text-align: center;\"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">在乎你的男人，绝不会说“我很忙，没时间”。<br/></strong></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">去年一封61岁老伯的辞职信火遍网络。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><img class=\" \" src=\"https://mmbiz.qpic.cn/mmbiz_jpg/GTJa0VtlmibJ9sbn9TYvApMBiaT6wzjmejyNQ92NocoaVfEc1CTicLic46G5DgWq06iaCzcpy6aiab9IAf0aK4iaAzjjA/640?wx_fmt=jpeg&wxfrom=5&wx_lazy=1&wx_co=1\"/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">你看，爱你的男人生怕陪你不够，爱你不够，给你不够，又怎会在你主动关心他，联系他的时候用“没时间”“我很忙”敷衍你呢？</strong></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">网上有一段话，想陪你吃饭的人酸甜苦辣都想吃，想送你回家的人东南西北都顺路，<span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">想见你的人 24小时都有空 。</span></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(153, 0, 0); font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">生活中没有谁是真的忙，只看他愿不愿你为你花时间。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">如果一个男人总是不回你信息，你想见他的时候，想联系他的时候经常用“没时间”“我很忙”来搪塞你。<br/></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">那么，他或许并没有你想象的那般在乎你。</span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><br/></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">在乎你的男人，绝不会说“你很烦”。</strong><br/></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">电影《十二夜》中张柏芝和陈奕迅分手时的争吵让很多妹子看哭。</span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">对男人而言，哪有什么高冷，只不过他暖的不是你。</strong></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">我见过所谓的钢铁直男，为买一个女友喜欢的手办，跑遍全市的商店。也见过看起来高冷无比的青年才俊，女友生病，满心焦急为其洗手作羹汤。还有日理万机的公司高层，妻子外地遇到麻烦，打个飞的过去帮忙处理。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(153, 0, 0); font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">真的在乎你的男人，绝对不会将“你真烦”三个字挂在嘴边。</span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><br/></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">我们终其一生寻寻觅觅，无非是想找一个懂自己在乎自己的人，相偎依着取暖，共同走过生活中那些孤独冰冷的日子。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">余生岁月漫长，遇见一个真心在乎你的人，少了忽冷忽热的不确定，少了患得患失的不安感。</strong></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">他懂得你的喜乐，将你的感受放到心上，生活中有再多坎坷，感情中有再多波折，有了他，你就不怕了。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">据说，人一生会遇到8263563人。其中，会打招呼的是39778人，会熟悉的是3619人，会亲近的只剩下275人，留在身边的少之又少，真正在乎你的人更是难得。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">所以如果遇到了，请好好珍惜。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(51, 51, 51);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">如果没有，也别将热情一次次消耗在不珍惜你的人身上，你要留着最好的自己，等待那个对的人。</span></p>');
INSERT INTO `tp5_articles` VALUES ('3', '年轻人，我劝你没事多存点钱', '1', '2018-11-21 02:11:13', '2018-12-21 10:12:54', '0', '<section><section><section><section><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 1.75em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 255, 255); background-color: rgb(153, 0, 0); font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;\">你的存款，就是你选择权<br/></span></p></section></section></section></section><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">我曾经和闺蜜去过一次“非同凡响”的毕业旅游。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">当时的我们还是大学生，每个月的生活费只会有超支，不会有结余，整天理所当然地做着月光族。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">直到我们站在旅行社的门外盯着别人的海报，才猛然发现自己简直就是拿着买大宝的钱，跑去买人家的SK2。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">最后，不得不厚着脸皮问家里人拿了一笔小小的旅游基金，报了一个超级特惠团。</span></p><section><section><section><section><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; overflow-wrap: break-word !important;\"><br/></p></section></section></section></section><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 255, 255); background-color: rgb(153, 0, 0); font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;\">你的存款，能够让你更加懂得消费</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">最近几年，越来越多的文章都在鼓吹消费，更有言辞偏激者，直接认为存钱只是傻x的操作。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">存钱傻不傻x我不知道，但是乱给别人贴标签的，绝对就是傻x无疑了。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">存钱，并不是一味把收入节省下来，不分青红皂白地存进各种银行卡，而是有计划、有目标地去消费，同时把不必要的支出节省出来，留作一笔存款。</span></p><section><section><section><section><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></p></section></section></section></section><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 255, 255); background-color: rgb(153, 0, 0); font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;\">你的存款，是你离不开的勇气</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">经常会听到一些身边人的抱怨：</span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">每次他们抱怨的时候，情绪都非常激动，感觉下一秒就能原地爆炸一样。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">可是当你提出一些建议，比如说让他们搬离自己家里、跟男朋友分手，又或者赶紧辞职的时候，他们就会开始冷静下来：</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><blockquote style=\"white-space: normal; margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(219, 219, 219); caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;\">“咦，可是自己租房子好贵啊！”</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;\">“但是，平时他也会送我一些喜欢的礼物，也不算对我太差~”</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;\">“工作哪有那么容易找，我现在还负债好几万呢！”</span></p></blockquote><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">归根究底，就是没钱。</span></p>');
INSERT INTO `tp5_articles` VALUES ('11', '我有一个梦想（I Have A Dream）', '1', '2018-12-20 16:12:49', '2018-12-20 16:12:23', '0', '<p>我有一梦想，你能陪我去实现吗<br/></p>');

-- ----------------------------
-- Table structure for tp5_article_points
-- ----------------------------
DROP TABLE IF EXISTS `tp5_article_points`;
CREATE TABLE `tp5_article_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID 标识',
  `article_id` int(11) DEFAULT NULL COMMENT '文章标识',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '文章浏览量',
  `keywords` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `picture` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文章配图',
  `abstract` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文章摘要',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_article_points
-- ----------------------------
INSERT INTO `tp5_article_points` VALUES ('1', '1', '2', '', '/home/images/article1.png', '如今科技进步，时代向前，人的平均寿命越来越长了。但长长的一生中，究竟有多少时间真正属于我们自己呢？', '1');
INSERT INTO `tp5_article_points` VALUES ('2', '2', '12', '', '/home/images/article2.png', '我的小天地，我闯荡的大江湖，我的浩瀚星辰和璀璨日月，再与你无关；而你的天地，你行走的江湖，你的日月和星辰，我也再不惦念。从此，一别两宽，各生欢喜。', '1');
INSERT INTO `tp5_article_points` VALUES ('4', '4', '0', '', '/home/images/article4.png', '人都是对喜欢的东西最上心。他若真的在乎你，一分一秒都不想失去你的消息，更不会不时玩消失，不会对你忽冷忽热，因为他比你还害怕失去。所有的不主动都是由于不喜欢，喜欢你的人永远不忙。', '1');
INSERT INTO `tp5_article_points` VALUES ('3', '3', '0', '', '/home/images/article3.png', '因为穷，所以要努力赚钱；努力赚钱，就会没时间找对象；找不到对象就算了，钱也没赚多少，难免开始焦虑；一旦焦虑，每天洗头的时候，掉出来的头发会告诉你什么才是真正的“绝望”。', '1');

-- ----------------------------
-- Table structure for tp5_comments
-- ----------------------------
DROP TABLE IF EXISTS `tp5_comments`;
CREATE TABLE `tp5_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `reply_id` int(11) NOT NULL DEFAULT '0' COMMENT '所回复的评论ID,0表示原始评论',
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_comments
-- ----------------------------
INSERT INTO `tp5_comments` VALUES ('1', '1', '2', '0', '这是一个神奇的世界，你是个神奇的人！', '2018-02-11 21:02:43', '2018-02-11 21:02:43');
INSERT INTO `tp5_comments` VALUES ('2', '1', '1', '1', '嗯，你说的对！', '2018-02-11 21:02:43', '2018-02-11 21:02:43');
INSERT INTO `tp5_comments` VALUES ('3', '2', '2', '0', '我们啊，其实都一样', '2018-02-11 21:02:43', '2018-02-11 21:02:43');

-- ----------------------------
-- Table structure for tp5_emails
-- ----------------------------
DROP TABLE IF EXISTS `tp5_emails`;
CREATE TABLE `tp5_emails` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'id 编号',
  `sender_email` varchar(50) NOT NULL COMMENT '发件人邮箱',
  `sender` varchar(100) NOT NULL COMMENT '发件人名称',
  `send_emails` varchar(255) NOT NULL COMMENT '收件人地址（多个使用‘; ’分号+空格隔开）',
  `title` varchar(255) NOT NULL COMMENT '邮件标题',
  `content` text NOT NULL COMMENT '邮件内容',
  `attachment` varchar(255) NOT NULL COMMENT '附件地址',
  `timeline` int(11) NOT NULL COMMENT '发送时间',
  `attachment_name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `update_timeline` int(11) DEFAULT NULL COMMENT '修改时间',
  `send_timeline` int(11) DEFAULT NULL COMMENT '发送时间',
  `status` int(10) DEFAULT '0' COMMENT '发送状态 0：未发送；1：已发送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp5_emails
-- ----------------------------
INSERT INTO `tp5_emails` VALUES ('3', '2441561897@qq.com', '何泽小生', '2929006594@qq.com2929006594@qq.com2929006594@qq.com2929006594@qq.com', '授权码', '<p>开通邮件第三方登录 <br/></p>', '/upload/20181228\\6ed7f0fa04d923082a9608b2eee7b6c5.png', '1545976107', '', '1545987945', null, '0');
INSERT INTO `tp5_emails` VALUES ('4', '2441561897@qq.com', '何泽小生', 'test', 'test', '<p>test<br/></p>', '/upload/20181228\\358475e089bd5e2fd41c92a98d2555ed.png', '1545976947', null, null, null, '0');
INSERT INTO `tp5_emails` VALUES ('5', '2441561897@qq.com', '何泽小生', 'test02', 'test02', '<p>test02</p>', '', '1545977017', null, null, null, '0');
INSERT INTO `tp5_emails` VALUES ('6', '2441561897@qq.com', '何泽小生', 'test03', 'test03', '<p>test03<br/></p>', '/upload/20181228\\1700b2bb13f129766f4f41235f3b3cf1.png', '1545977042', null, null, null, '0');
INSERT INTO `tp5_emails` VALUES ('7', '2441561897@qq.com', '何泽小生', 'test04', 'test04', '<p>test04</p>', '', '1545977089', null, null, null, '0');
INSERT INTO `tp5_emails` VALUES ('8', '2441561897@qq.com', '何泽小生', 'test05', 'test05', '<p>test05</p>', '', '1545977163', null, null, null, '0');
INSERT INTO `tp5_emails` VALUES ('9', '2441561897@qq.com', '何泽小生', 'test06', 'test06', '<p>test06</p>', '', '1545977182', null, null, null, '0');
INSERT INTO `tp5_emails` VALUES ('10', '2441561897@qq.com', '何泽小生', 'test07', 'test07', '<p>test07</p><p><br/></p>', '/upload/20181228\\5ad062e36764daddd13619dcb3a1ddba.png', '1545977262', null, null, null, '0');
INSERT INTO `tp5_emails` VALUES ('11', '2441561897@qq.com', '何泽小生', 'test08', 'test08', '<p>test08</p><p><br/></p>', '/upload/20181228\\bb97a1221328807cb1116a4516a8a760.jpg', '1545977589', 'PHPMailer-master.zip', '1545985832', null, '0');
INSERT INTO `tp5_emails` VALUES ('12', '2441561897@qq.com', '何泽小生', 'test0901', 'test0901', '<p>test0901</p>', '/upload/20181228\\70530732e33bf84e520beb54528dc59b.rar', '1545977605', 'jiaoben789.rar', '1545981700', null, '0');
INSERT INTO `tp5_emails` VALUES ('13', '2441561897@qq.com', '何泽小生', 'test101', 'test101', '<p>test101</p>', '/upload/20181228\\4a68149488dc582b0cf15d9dc27c8c5f.png', '1545980120', '/upload/20181228\\4a68149488dc582b0cf15d9dc27c8c5f.png', '1545981353', null, '0');
INSERT INTO `tp5_emails` VALUES ('14', '2441561897@qq.com', '何泽小生', 'test11', 'test11', '<p>test11</p>', '/upload/20181228\\037ed5d04b5bc2ee0f640359a4b90492.zip', '1545982981', '1545963460503.zip', null, null, '0');
INSERT INTO `tp5_emails` VALUES ('15', '2441561897@qq.com', '何泽小生', 'test12', 'test12', '<p>test12</p>', '/upload/20181228\\2453e25bcda2037f38188b74efa3d71b.zip', '1545983051', '字段管理(字段管理).zip', null, null, '0');
INSERT INTO `tp5_emails` VALUES ('19', '2441561897@qq.com', '何泽小生', '2442561897@qq.com; 2442561897@qq.com; 2442561897@qq.com; 2442561897@qq.com; ', '指向一个按钮触发上传，一般配合 auto: false 来使用。值为选择器或DOM对象，如：bindAction: \'#btn\'', '<p>123<br/></p>', '', '1545986703', '', '1545988110', null, '1');

-- ----------------------------
-- Table structure for tp5_emails_config
-- ----------------------------
DROP TABLE IF EXISTS `tp5_emails_config`;
CREATE TABLE `tp5_emails_config` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'id编号',
  `sender` varchar(100) NOT NULL COMMENT '发件人名称',
  `smtp_email` varchar(50) NOT NULL COMMENT 'SMTP服务开通邮箱',
  `smtp_pwd` varchar(50) NOT NULL COMMENT 'SMTP服务授权密码',
  `smtp_port` varchar(30) NOT NULL DEFAULT '465' COMMENT 'SMTP服务器端口',
  `smtp_url` varchar(100) NOT NULL COMMENT '服务器地址',
  `test_email` varchar(100) NOT NULL COMMENT '测试邮箱',
  `test_title` varchar(255) DEFAULT NULL COMMENT '测试邮件标题',
  `test_content` text COMMENT '测试邮件内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp5_emails_config
-- ----------------------------

-- ----------------------------
-- Table structure for tp5_migrations
-- ----------------------------
DROP TABLE IF EXISTS `tp5_migrations`;
CREATE TABLE `tp5_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tp5_migrations
-- ----------------------------
INSERT INTO `tp5_migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `tp5_migrations` VALUES ('2', '2017_12_25_111038_create_articles_table', '1');
INSERT INTO `tp5_migrations` VALUES ('3', '2017_12_26_063736_create_comments_table', '1');
INSERT INTO `tp5_migrations` VALUES ('4', '2018_01_01_115202_create_nav_menus_table', '1');
INSERT INTO `tp5_migrations` VALUES ('5', '2018_01_09_074013_create_article_points_table', '1');
INSERT INTO `tp5_migrations` VALUES ('6', '2018_01_09_075218_create_today_words_table', '1');
INSERT INTO `tp5_migrations` VALUES ('7', '2018_01_28_081729_create_admin_roles_table', '1');
INSERT INTO `tp5_migrations` VALUES ('8', '2018_01_28_081817_create_admins_table', '1');
INSERT INTO `tp5_migrations` VALUES ('9', '2018_02_07_105721_create_sessions_table', '1');

-- ----------------------------
-- Table structure for tp5_nav_menus
-- ----------------------------
DROP TABLE IF EXISTS `tp5_nav_menus`;
CREATE TABLE `tp5_nav_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'navMenu 主键',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级菜单ID',
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'action地址（etc:admin/home）',
  `icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '自定义图标样式',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，-1：删除',
  `list_order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序标识，越大越靠前',
  `created_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(2) DEFAULT '0' COMMENT '导航类型 0：菜单类  1：权限链接',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_nav_menus
-- ----------------------------
INSERT INTO `tp5_nav_menus` VALUES ('45', '根级菜单', '0', '', '/cms/images/icon/menu_icon.png', '1', '0', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_nav_menus` VALUES ('2', '菜单管理', '1', 'cms/menu/index', '/cms/images/icon/menu_list.png', '1', '0', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_nav_menus` VALUES ('3', '前台管理', '0', '', '/cms/images/icon/desktop.png', '1', '1', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_nav_menus` VALUES ('4', '今日赠言', '3', 'cms/todayWord/index', '/cms/images/icon/diplom.png', '1', '0', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_nav_menus` VALUES ('5', '文章列表', '3', 'cms/article/index', '/cms/images/icon/adaptive.png', '1', '0', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_nav_menus` VALUES ('1', '管理分配', '0', '', '/cms/images/icon/manage.png', '1', '3', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_nav_menus` VALUES ('6', '管理人员', '1', 'cms/admin/index', '/cms/images/icon/admin.png', '1', '2', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_nav_menus` VALUES ('7', '角色管理', '1', 'cms/admin/role', '/cms/images/icon/role.png', '1', '3', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_nav_menus` VALUES ('29', '添加导航菜单', '2', 'cms/menu/add', '/', '1', '0', '2018-11-23 20:32:29', '1');
INSERT INTO `tp5_nav_menus` VALUES ('30', '导航菜单修改', '2', 'cms/menu/edit', '/', '1', '0', '2018-11-23 20:34:54', '1');
INSERT INTO `tp5_nav_menus` VALUES ('31', '菜单权限设置', '2', 'cms/menu/auth', '/', '1', '0', '2018-11-23 20:35:33', '1');
INSERT INTO `tp5_nav_menus` VALUES ('32', '分页获取菜单数据', '2', 'cms/menu/ajaxOpForPage', '/', '1', '0', '2018-11-23 20:35:57', '1');
INSERT INTO `tp5_nav_menus` VALUES ('33', '添加今日赠言', '4', 'cms/todayWord/add', '/', '1', '0', '2018-11-23 20:37:59', '1');
INSERT INTO `tp5_nav_menus` VALUES ('34', '修改今日赠言', '4', 'cms/todayWord/edit', '/', '1', '0', '2018-11-23 20:38:17', '1');
INSERT INTO `tp5_nav_menus` VALUES ('35', '分页获取今日赠言数据', '4', 'cms/todayWord/ajaxOpForPage', '/', '1', '0', '2018-11-23 20:38:43', '1');
INSERT INTO `tp5_nav_menus` VALUES ('36', '添加文章数据', '5', 'cms/article/add', '/', '1', '0', '2018-11-23 20:39:02', '1');
INSERT INTO `tp5_nav_menus` VALUES ('37', '修改文章数据', '5', 'cms/article/edit', '/', '1', '0', '2018-11-23 20:39:22', '1');
INSERT INTO `tp5_nav_menus` VALUES ('38', '添加管理员', '6', 'cms/admin/add', '/', '1', '0', '2018-11-23 20:46:18', '1');
INSERT INTO `tp5_nav_menus` VALUES ('39', '修改管理员数据', '6', 'cms/admin/edit', '/', '1', '0', '2018-11-23 20:46:35', '1');
INSERT INTO `tp5_nav_menus` VALUES ('40', '分页获取管理员数据', '6', 'cms/admin/ajaxOpForPage', '/', '1', '0', '2018-11-23 20:48:08', '1');
INSERT INTO `tp5_nav_menus` VALUES ('41', '增加角色', '7', 'cms/admin/addRole', '/', '1', '0', '2018-11-23 20:48:52', '1');
INSERT INTO `tp5_nav_menus` VALUES ('42', '修改角色数据', '7', 'cms/admin/editRole', '/', '1', '0', '2018-11-23 20:49:08', '1');
INSERT INTO `tp5_nav_menus` VALUES ('43', '分页获取文章数据', '5', 'cms/article/ajaxOpForPage', '/', '1', '0', '2018-11-24 16:28:33', '1');
INSERT INTO `tp5_nav_menus` VALUES ('48', '会员中心', '0', 'cms/admin/user', '/cms/images/icon/nav_default.png', '1', '0', '2018-12-17 16:34:05', '0');
INSERT INTO `tp5_nav_menus` VALUES ('49', '测试模块', '0', 'cms/test/index', '/cms/images/icon/nav_default.png', '1', '0', '2018-12-17 16:34:27', '0');
INSERT INTO `tp5_nav_menus` VALUES ('50', '行为日志', '1', 'cms/log/index', '/upload/20181219\\7efa4a149c7686e36ba8f96f3f47c46e.png', '1', '0', '2018-12-19 16:27:33', '0');
INSERT INTO `tp5_nav_menus` VALUES ('51', '扩展插件', '0', '', '/upload/20181219\\f6c4c8560f6eafd7305bc0c9a4d97000.png', '1', '0', '2018-12-19 16:40:21', '0');
INSERT INTO `tp5_nav_menus` VALUES ('52', '插件管理', '51', 'cms/plug/index', '/upload/20181219\\8e476e94a0b1821fbc6131223b3ab22a.png', '1', '0', '2018-12-19 16:45:12', '0');
INSERT INTO `tp5_nav_menus` VALUES ('53', '已装插件', '51', 'cms/plug/pluged', '/upload/20181219\\e1707558baf3ee92f57eaa26844eb01c.png', '1', '0', '2018-12-19 16:48:22', '0');
INSERT INTO `tp5_nav_menus` VALUES ('54', '邮件管理', '51', 'cms/email/index', '/upload/20181228\\0610715c4409bd003c0ae8e126e2efb7.png', '1', '0', '2018-12-27 14:49:39', '0');

-- ----------------------------
-- Table structure for tp5_photos
-- ----------------------------
DROP TABLE IF EXISTS `tp5_photos`;
CREATE TABLE `tp5_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片存放位置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_photos
-- ----------------------------
INSERT INTO `tp5_photos` VALUES ('8', '/cms/images/headshot/user8.png');
INSERT INTO `tp5_photos` VALUES ('2', '/cms/images/headshot/user2.png');
INSERT INTO `tp5_photos` VALUES ('4', '/cms/images/headshot/user4.png');
INSERT INTO `tp5_photos` VALUES ('7', '/cms/images/headshot/user7.png');
INSERT INTO `tp5_photos` VALUES ('6', '/cms/images/headshot/user6.png');
INSERT INTO `tp5_photos` VALUES ('3', '/cms/images/headshot/user3.png');
INSERT INTO `tp5_photos` VALUES ('1', '/cms/images/headshot/user1.png');
INSERT INTO `tp5_photos` VALUES ('9', '/cms/images/headshot/user9.png');
INSERT INTO `tp5_photos` VALUES ('5', '/cms/images/headshot/user5.png');

-- ----------------------------
-- Table structure for tp5_plugs
-- ----------------------------
DROP TABLE IF EXISTS `tp5_plugs`;
CREATE TABLE `tp5_plugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id编号',
  `example` varchar(100) NOT NULL COMMENT '标识名',
  `plugname` varchar(100) NOT NULL COMMENT '插件名',
  `version` varchar(50) NOT NULL,
  `author` varchar(100) NOT NULL DEFAULT '无名' COMMENT '作者',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `path` varchar(255) NOT NULL COMMENT '安装路径',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '是否启用 0：禁用；1：启用；',
  `sql_name` varchar(100) DEFAULT NULL COMMENT '插件使用数据库名称',
  `timeline` int(11) NOT NULL COMMENT '安装时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp5_plugs
-- ----------------------------

-- ----------------------------
-- Table structure for tp5_today_words
-- ----------------------------
DROP TABLE IF EXISTS `tp5_today_words`;
CREATE TABLE `tp5_today_words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '摘句内容，不要太长',
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '出处',
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '插图',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，-1：删除',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_today_words
-- ----------------------------
INSERT INTO `tp5_today_words` VALUES ('1', '谁的青春不迷茫，其实我们都一样！', '谁的青春不迷茫', '/home/images/ps.png', '1', '2018-11-20 19:58:05');
INSERT INTO `tp5_today_words` VALUES ('2', '想和你重新认识一次 从你叫什么名字说起', '你的名字', '/home/images/ps2.png', '1', '2018-02-11 21:02:43');
INSERT INTO `tp5_today_words` VALUES ('3', '我是一只雁，你是南方云烟。但愿山河宽，相隔只一瞬间.                ', '秦时明月', '/home/images/ps3.png', '1', '2018-11-20 23:23:46');
INSERT INTO `tp5_today_words` VALUES ('4', '人老了的好处，就是可失去的东西越来越少了.', '哈尔的移动城堡', '/home/images/ps4.png', '1', '2018-11-20 23:23:42');
INSERT INTO `tp5_today_words` VALUES ('5', '到底要怎么才能证明自己成长了 那种事情我也不知道啊 但是只要那一抹笑容尚存 我便心无旁骛 ', '声之形', '/home/images/ps5.png', '1', '2018-11-20 23:23:51');
INSERT INTO `tp5_today_words` VALUES ('6', '你觉得被圈养的鸟儿为什么无法自由地翱翔天际？是因为鸟笼不是属于它的东西', '东京食尸鬼', '/home/images/ps6.png', '1', '2018-11-20 23:23:37');
INSERT INTO `tp5_today_words` VALUES ('7', '我手里拿着刀，没法抱你。我放下刀，没法保护你', '死神', '/home/images/ps7.png', '1', '2018-02-11 21:02:43');
INSERT INTO `tp5_today_words` VALUES ('8', '不管前方的路有多苦，只要走的方向正确，不管多么崎岖不平，都比站在原地更接近幸福                ', '千与千寻', '/home/images/ps8.png', '1', '2018-12-21 10:39:25');
INSERT INTO `tp5_today_words` VALUES ('12', '发个非官方个', 'dfdffdfdf大概', '/cms/images/headshot/wuHuang.png', '-1', '2018-11-20 23:28:36');

-- ----------------------------
-- Table structure for tp5_users
-- ----------------------------
DROP TABLE IF EXISTS `tp5_users`;
CREATE TABLE `tp5_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User 主键',
  `user_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '登录密码',
  `head_portrait` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `age` tinyint(4) NOT NULL DEFAULT '0' COMMENT '年龄',
  `signature` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '个性签名',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_users
-- ----------------------------
INSERT INTO `tp5_users` VALUES ('1', 'MoTzxx', 'e10adc3949ba59abbe56e057f20f883e', 'home/images/user_img1.jpg', '25', '你若盛开，清风自来', '2018-02-11 21:02:43', '2018-02-11 21:02:43');
INSERT INTO `tp5_users` VALUES ('2', '百里守约', 'c33367701511b4f6020ec61ded352059', 'home/images/user_img2.jpg', '25', '放心，我一直都在！', '2018-02-11 21:02:43', '2018-02-11 21:02:43');
INSERT INTO `tp5_users` VALUES ('3', '牧云骑星', 'e10adc3949ba59abbe56e057f20f883e', 'home/images/user_img3.jpg', '22', '天上的每一颗星星，都是一个值得还念的故人！', '2018-02-11 21:02:43', '2018-02-11 21:02:43');
