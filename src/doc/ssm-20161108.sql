/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2016-11-08 09:04:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mehtoddescription` varchar(250) DEFAULT NULL COMMENT '方法描述',
  `exceptionCode` varchar(350) DEFAULT NULL COMMENT '异常代码',
  `logtype` varchar(150) DEFAULT NULL COMMENT '日志类型 0正常 1 异常',
  `exceptionDetail` varchar(300) DEFAULT NULL COMMENT '异常信息',
  `method` varchar(150) DEFAULT NULL COMMENT '方法',
  `params` varchar(400) DEFAULT NULL COMMENT '参数',
  `cmpno` varchar(30) DEFAULT NULL COMMENT '公司ID',
  `userno` varchar(20) DEFAULT NULL COMMENT '操作人',
  `createDate` varchar(20) DEFAULT NULL,
  `requestIp` varchar(20) DEFAULT NULL COMMENT '请求ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-24 09:34:56', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('2', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-24 10:16:22', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('3', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 08:53:21', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('4', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 08:54:26', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('5', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 08:55:51', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('6', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 09:58:10', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('7', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 10:07:29', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('8', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 10:23:27', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 10:24:06', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 10:26:47', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('11', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 10:27:14', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('12', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 10:34:30', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('13', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 10:41:06', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('14', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 10:43:40', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('15', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 10:44:55', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('16', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 10:47:29', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('17', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 10:56:44', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('18', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 11:00:33', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('19', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 11:36:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('20', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 11:36:29', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('21', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 11:39:45', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('22', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 11:41:15', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('23', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 13:47:07', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('24', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 14:20:03', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('25', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 14:48:08', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('26', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 14:49:13', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('27', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 14:50:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('28', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 14:54:18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('29', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 15:03:28', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('30', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 15:05:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('31', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 15:26:24', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('32', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-27 16:18:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('33', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-28 09:14:38', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('34', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 09:12:08', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('35', '用户登录', null, '0', '系统登录尝试sdf 用户名不存在', 'LoginController-->login', 'sdf ,234', null, null, '2016-10-31 09:18:14', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('36', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 09:18:27', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('37', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 09:31:08', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('38', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 09:31:19', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('39', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 09:58:13', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('40', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 10:02:55', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('41', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 10:20:05', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('42', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 10:24:33', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('43', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 10:39:08', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('44', '用户登录', null, '0', null, 'LoginController-->login', 'admin,1234567', null, '1000', '2016-10-31 13:42:05', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('45', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 14:30:35', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('46', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 14:41:07', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('47', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 14:50:16', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('48', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 14:55:50', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('49', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 14:58:43', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('50', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 15:10:52', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('51', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 15:54:49', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('52', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 16:32:07', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('53', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 16:39:29', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('54', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 16:52:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('55', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 17:29:57', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('56', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 17:33:24', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('57', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 20:24:13', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('58', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 20:32:53', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('59', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-10-31 20:47:07', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('60', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 08:52:41', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('61', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 08:57:51', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('62', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 09:01:52', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('63', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 09:08:23', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('64', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 09:14:24', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('65', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 09:18:04', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('66', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 09:29:04', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('67', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 10:02:14', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('68', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 11:08:21', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('69', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 11:10:16', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('70', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 11:26:30', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('71', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 11:48:50', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('72', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 11:52:42', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('73', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 11:56:20', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('74', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 16:14:38', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('75', '用户登录', null, '0', null, 'LoginController-->login', 'chen,123456', null, '2000', '2016-11-01 16:19:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('76', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 16:41:57', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('77', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 16:43:06', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('78', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 17:25:44', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('79', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 17:38:49', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('80', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-01 17:40:49', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('81', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 10:27:17', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('82', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 10:29:58', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('83', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 10:38:46', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('84', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 11:02:44', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('85', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 11:03:40', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('86', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 11:08:47', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('87', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 11:14:11', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('88', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 11:21:41', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('89', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 11:25:33', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('90', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 11:26:50', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('91', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 11:43:37', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('92', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 11:49:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('93', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 11:54:15', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('94', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 12:03:10', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('95', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 13:39:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('96', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 13:44:15', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('97', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 13:46:00', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('98', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 14:03:00', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('99', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 14:28:07', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('100', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 15:01:29', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('101', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 15:28:47', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('102', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 16:19:12', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('103', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 16:29:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('104', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 16:58:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('105', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 17:13:46', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('106', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 20:11:16', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('107', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 20:31:31', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('108', '用户登录', null, '0', null, 'LoginController-->login', 'admin,12345', null, '1000', '2016-11-02 20:45:58', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('109', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 21:36:52', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('110', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-02 22:03:29', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('111', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 10:01:57', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('112', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 10:02:38', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('113', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 10:02:38', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('114', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 10:02:38', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('115', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 10:44:36', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('116', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 10:46:28', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('117', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:02:45', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('118', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:05:18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('119', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:05:41', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('120', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:05:41', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('121', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:05:42', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('122', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:06:54', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('123', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:06:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('124', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:08:16', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('125', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:08:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('126', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:09:21', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('127', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:22:23', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('128', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:22:30', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('129', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:48:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('130', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:48:48', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('131', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:56:29', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('132', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:57:05', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('133', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:57:16', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('134', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 11:59:52', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('135', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 12:00:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('136', '用户登录', null, '0', '系统登录尝试,admin多名用户拥有相同的登录名和密码!', 'LoginController-->login', 'admin,123456', null, null, '2016-11-03 13:39:49', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('137', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 13:56:42', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('138', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:11:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('139', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:11:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('140', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:11:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('141', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:11:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('142', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:11:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('143', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:11:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('144', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:11:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('145', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:11:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('146', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:12:29', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('147', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:13:37', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('148', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:18:40', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('149', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:18:57', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('150', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:20:41', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('151', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:21:23', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('152', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:41:13', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('153', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 14:45:27', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('154', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:10:42', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('155', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:10:45', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('156', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:13:27', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('157', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:13:33', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('158', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:33:44', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('159', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:33:44', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('160', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:33:44', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('161', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:49:26', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('162', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:54:27', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('163', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:55:05', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('164', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:59:21', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('165', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 15:59:41', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('166', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 16:03:01', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('167', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 16:33:29', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('168', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 16:33:44', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('169', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 16:33:46', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('170', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 16:34:23', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('171', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 16:34:24', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('172', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 16:36:04', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('173', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 16:36:06', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('174', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 16:39:34', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('175', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 16:39:37', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('176', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 16:40:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('177', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 16:42:33', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('178', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 16:43:20', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('179', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 16:58:20', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('180', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:04:31', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('181', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:04:31', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('182', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:05:12', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('183', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:08:32', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('184', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:15:54', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('185', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:15:58', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('186', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:15:58', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('187', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:15:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('188', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:15:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('189', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:15:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('190', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:21:05', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('191', '用户登录', null, '0', '系统登录尝试null用户名不存在', 'LoginController-->login', 'null,null', null, null, '2016-11-03 17:26:04', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('192', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 18:46:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('193', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 18:46:41', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('194', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 18:50:37', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('195', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 18:50:40', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('196', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 23:36:10', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('197', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 23:45:37', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('198', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 23:47:58', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('199', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-03 23:49:37', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('200', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 08:38:06', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('201', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 10:40:35', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('202', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 11:06:15', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('203', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 11:38:33', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('204', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 11:41:23', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('205', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 11:43:50', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('206', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 11:48:28', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('207', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 11:57:50', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('208', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 13:47:43', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('209', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 14:02:30', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('210', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 14:10:20', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('211', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 14:12:49', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('212', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 14:13:27', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('213', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 14:29:18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('214', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 15:42:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('215', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 15:50:53', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('216', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 15:55:23', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('217', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 16:03:40', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('218', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 16:04:45', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('219', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 16:07:43', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('220', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 16:14:13', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('221', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 16:18:19', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('222', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 16:23:00', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('223', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 16:31:43', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('224', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 16:44:47', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('225', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 16:55:01', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('226', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-04 17:36:45', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('227', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 08:48:33', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('228', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 09:10:23', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('229', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 10:04:05', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('230', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 10:45:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('231', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 10:58:10', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('232', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 11:53:55', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('233', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 15:02:32', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('234', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 15:29:21', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('235', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 15:42:21', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('236', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 16:02:52', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('237', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 16:03:49', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('238', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 16:31:05', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('239', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 16:33:43', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('240', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 16:51:58', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('241', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 17:24:47', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('242', '用户登录', null, '0', null, 'LoginController-->login', 'admin,123456', null, '1000', '2016-11-07 17:27:03', '127.0.0.1');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL COMMENT '菜单主键',
  `MENU_NAME` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `MENU_URL` varchar(255) DEFAULT NULL COMMENT '菜单地址',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '父级ID',
  `MENU_ORDER` varchar(100) DEFAULT NULL COMMENT '菜单顺序',
  `MENU_ICON` varchar(30) DEFAULT NULL COMMENT '菜单图标',
  `MENU_TYPE` varchar(10) DEFAULT NULL COMMENT '菜单类型',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='*系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'fa-desktop', '1');
INSERT INTO `sys_menu` VALUES ('2', '组织管理', 'role.do', '1', '2', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('4', '会员管理', 'happuser/listUsers.do', '1', '4', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('5', '系统用户', 'user/listUsers.do', '1', '3', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('6', '信息管理', '#', '0', '2', 'fa-list', '2');
INSERT INTO `sys_menu` VALUES ('7', '图片管理', 'pictures/list.do', '6', '1', 'fa-caret-right', '2');
INSERT INTO `sys_menu` VALUES ('8', '性能监控', 'druid/index.html', '9', '1', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('9', '系统工具', '#', '0', '3', 'fa-th', '1');
INSERT INTO `sys_menu` VALUES ('10', '接口测试', 'tool/interfaceTest.do', '9', '2', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('11', '发送邮件', 'tool/goSendEmail.do', '9', '3', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('12', '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('13', '多级别树', 'tool/ztree.do', '9', '5', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('14', '地图工具', 'tool/map.do', '9', '6', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('15', '微信管理', '#', '0', '2', 'fa-comments', '2');
INSERT INTO `sys_menu` VALUES ('16', '文本回复', 'textmsg/list.do', '15', '2', 'fa-caret-right', '2');
INSERT INTO `sys_menu` VALUES ('17', '应用命令', 'command/list.do', '15', '4', 'fa-caret-right', '2');
INSERT INTO `sys_menu` VALUES ('18', '图文回复', 'imgmsg/list.do', '15', '3', 'fa-caret-right', '2');
INSERT INTO `sys_menu` VALUES ('19', '关注回复', '#', '15', '1', 'fa-caret-right', '2');
INSERT INTO `sys_menu` VALUES ('20', '在线管理', 'onlinemanager/list.do', '1', '5', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('21', '打印测试', 'tool/printTest.do', '9', '7', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('22', '客户管理', 'sdfsdf/index.do', '1', '1', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('23', '菜单管理', 'ez/system/sysmenu/list.html', '19', '1', 'fa-leaf green', '2');
INSERT INTO `sys_menu` VALUES ('24', '三级1', '#', '19', '2', 'fa-pencil orange', '2');
INSERT INTO `sys_menu` VALUES ('25', '四级', 'sdfs/index.do', '24', '1', 'fa-caret-right', '2');

-- ----------------------------
-- Table structure for `sys_right`
-- ----------------------------
DROP TABLE IF EXISTS `sys_right`;
CREATE TABLE `sys_right` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='*系统用户权限表';

-- ----------------------------
-- Records of sys_right
-- ----------------------------
INSERT INTO `sys_right` VALUES ('1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_right` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('68f23fc0caee475bae8d52244dea8444', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('a99883e414e2411d888666693de9c42c', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('ac66961adaa2426da4470c72ffeec117', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('e74f713314154c35bd7fc98897859fe3', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `sys_right_gl`
-- ----------------------------
DROP TABLE IF EXISTS `sys_right_gl`;
CREATE TABLE `sys_right_gl` (
  `GL_ID` varchar(100) NOT NULL COMMENT '用户编号',
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '角色编号',
  `FX_QX` int(10) DEFAULT NULL,
  `FW_QX` int(10) DEFAULT NULL,
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='*系统管理权限表';

-- ----------------------------
-- Records of sys_right_gl
-- ----------------------------
INSERT INTO `sys_right_gl` VALUES ('1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_right_gl` VALUES ('2', '1', '0', '0', '1', '1', '1', '1');
INSERT INTO `sys_right_gl` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '7', '0', '0', '1', '0', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('68f23fc0caee475bae8d52244dea8444', '7', '0', '0', '1', '1', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('a99883e414e2411d888666693de9c42c', '1', '1', '1', '1', '1', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('ac66961adaa2426da4470c72ffeec117', '1', '1', '0', '1', '1', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '7', '1', '0', '1', '1', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('e74f713314154c35bd7fc98897859fe3', '6', '1', '1', '1', '1', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '7', '1', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `QX_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='*系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '4194384', '0', '1', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '8388598', '1', '230', '50', '34', '54', '2');
INSERT INTO `sys_role` VALUES ('4', '用户组', '118', '0', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '特级会员', '498', '7', '0', '0', '0', '0', '55896f5ce3c0494fa6850775a4e29ff6');
INSERT INTO `sys_role` VALUES ('6', '客户组', '18', '0', '1', '1', '1', '1', null);
INSERT INTO `sys_role` VALUES ('68f23fc0caee475bae8d52244dea8444', '中级会员', '498', '7', '0', '0', '0', '0', '68f23fc0caee475bae8d52244dea8444');
INSERT INTO `sys_role` VALUES ('7', '会员组', '498', '0', '0', '0', '0', '1', null);
INSERT INTO `sys_role` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '管理员B', '4194294', '1', '246', '0', '0', '0', '7dfd8d1f7b6245d283217b7e63eec9b2');
INSERT INTO `sys_role` VALUES ('a99883e414e2411d888666693de9c42c', '管理员C', '4194294', '1', '0', '0', '0', '0', 'a99883e414e2411d888666693de9c42c');
INSERT INTO `sys_role` VALUES ('ac66961adaa2426da4470c72ffeec117', '管理员A', '4194294', '1', '54', '54', '0', '246', 'ac66961adaa2426da4470c72ffeec117');
INSERT INTO `sys_role` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '高级会员', '498', '7', '0', '0', '0', '0', 'b0c77c29dfa140dc9b14a29c056f824f');
INSERT INTO `sys_role` VALUES ('e74f713314154c35bd7fc98897859fe3', '黄金客户', '18', '6', '1', '1', '1', '1', 'e74f713314154c35bd7fc98897859fe3');
INSERT INTO `sys_role` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '初级会员', '498', '7', '1', '1', '1', '1', 'f944a9df72634249bbcb8cb73b0c9b86');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USERNO` varchar(30) NOT NULL COMMENT '用户编号',
  `LOGNM` varchar(50) NOT NULL COMMENT '登陆账户',
  `LOGPWD` varchar(50) NOT NULL COMMENT '登陆密码',
  `DPTNO` varchar(20) DEFAULT NULL COMMENT '所属部门编号',
  `DPTNM` varchar(20) DEFAULT NULL COMMENT '所属部门名称',
  `RLID` varchar(20) DEFAULT NULL COMMENT '角色编号',
  `RLNM` varchar(20) DEFAULT NULL COMMENT '角色名',
  `USERRELNM` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `IDNUM` varchar(30) DEFAULT NULL COMMENT '身份证号',
  `MOBILE` varchar(30) DEFAULT NULL COMMENT '手机号码',
  `USERICOM` varchar(100) DEFAULT NULL COMMENT '头像',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `OPTYPE` varchar(2) NOT NULL COMMENT '操作员类型',
  `ISUSED` varchar(1) DEFAULT NULL COMMENT '是否启用',
  `OPRIGHT` varchar(800) DEFAULT NULL COMMENT '权限标识',
  `UPTDATE` varchar(20) DEFAULT NULL COMMENT '更新日期',
  `BSBSKND` varchar(200) DEFAULT NULL COMMENT '开办业务',
  `INPOSTN` varchar(2) DEFAULT NULL COMMENT '是否在岗',
  `CSTMRTYPE` varchar(2) DEFAULT NULL COMMENT '客户类型',
  `CMPNO` varchar(30) DEFAULT NULL COMMENT '公司编号',
  PRIMARY KEY (`USERNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='*系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1000', 'admin', '123456', null, null, '1', '系统管理员', '系统管理员名称', null, '18654177028', null, null, '1', '1', '1133671055321055258374707980945218933803269864762743594642571294', '20161020', null, '1', null, null);
INSERT INTO `sys_user` VALUES ('2000', 'chen', '123456', null, null, '2', '超级管理员', '超级管理员名称', null, null, null, null, '1', '1', '1133671055321055258374707980945218933803269864762743594642571294', '20161101', null, '1', null, null);
