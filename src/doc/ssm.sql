/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-04-19 21:38:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(4) NOT NULL COMMENT '字典类型编码',
  `SDVALUE` varchar(20) NOT NULL COMMENT '字典VALUE',
  `SDKEY` varchar(255) NOT NULL COMMENT '字典KEY',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '字典备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8 COMMENT='*系统字典表';

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1', '1000', '1', '是', null);
INSERT INTO `sys_dictionary` VALUES ('2', '1000', '2', '否', null);
INSERT INTO `sys_dictionary` VALUES ('3', '1001', '0', '身份证', null);
INSERT INTO `sys_dictionary` VALUES ('4', '1001', '1', '户口簿', null);
INSERT INTO `sys_dictionary` VALUES ('5', '1001', '2', '护照', null);
INSERT INTO `sys_dictionary` VALUES ('6', '1001', '3', '军官证', null);
INSERT INTO `sys_dictionary` VALUES ('7', '1001', '4', '士兵证', null);
INSERT INTO `sys_dictionary` VALUES ('8', '1001', '5', '港澳居民来往内地通行证', null);
INSERT INTO `sys_dictionary` VALUES ('9', '1001', '6', '台湾同胞来往内地通行证', null);
INSERT INTO `sys_dictionary` VALUES ('10', '1001', '7', '临时身份证', null);
INSERT INTO `sys_dictionary` VALUES ('11', '1001', '8', '外国人居留证', null);
INSERT INTO `sys_dictionary` VALUES ('12', '1001', '9', '警官证', null);
INSERT INTO `sys_dictionary` VALUES ('13', '1001', 'X', '其他证件', null);
INSERT INTO `sys_dictionary` VALUES ('14', '1002', '0', '未知的性别', null);
INSERT INTO `sys_dictionary` VALUES ('15', '1002', '1', '男性', null);
INSERT INTO `sys_dictionary` VALUES ('16', '1002', '2', '女性', null);
INSERT INTO `sys_dictionary` VALUES ('17', '1002', '9', '未说明的性别', null);
INSERT INTO `sys_dictionary` VALUES ('18', '1003', '90', '未说明的婚姻状况', '');
INSERT INTO `sys_dictionary` VALUES ('19', '1003', '10', '未婚', null);
INSERT INTO `sys_dictionary` VALUES ('20', '1003', '20', '已婚', null);
INSERT INTO `sys_dictionary` VALUES ('21', '1003', '21', '初婚', null);
INSERT INTO `sys_dictionary` VALUES ('22', '1003', '22', '再婚', null);
INSERT INTO `sys_dictionary` VALUES ('23', '1003', '23', '复婚', null);
INSERT INTO `sys_dictionary` VALUES ('24', '1003', '30', '丧偶', null);
INSERT INTO `sys_dictionary` VALUES ('25', '1003', '40', '离婚', null);
INSERT INTO `sys_dictionary` VALUES ('26', '1004', '99', '未知', '');
INSERT INTO `sys_dictionary` VALUES ('27', '1004', '10', '研究生及以上', null);
INSERT INTO `sys_dictionary` VALUES ('28', '1004', '20', '大学本科', '简称“大学”');
INSERT INTO `sys_dictionary` VALUES ('29', '1004', '30', '大学专科和专科学校', '简称“大专”');
INSERT INTO `sys_dictionary` VALUES ('30', '1004', '40', '中等专业学校或中等技术学校', null);
INSERT INTO `sys_dictionary` VALUES ('31', '1004', '50', '技术学校', null);
INSERT INTO `sys_dictionary` VALUES ('32', '1004', '60', '高中', null);
INSERT INTO `sys_dictionary` VALUES ('33', '1004', '70', '初中', null);
INSERT INTO `sys_dictionary` VALUES ('34', '1004', '80', '小学', null);
INSERT INTO `sys_dictionary` VALUES ('35', '1004', '90', '文盲或半文盲', null);
INSERT INTO `sys_dictionary` VALUES ('36', '1005', '9', '未知', null);
INSERT INTO `sys_dictionary` VALUES ('37', '1005', '0', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('38', '1005', '1', '名誉博士', null);
INSERT INTO `sys_dictionary` VALUES ('39', '1005', '2', '博士', null);
INSERT INTO `sys_dictionary` VALUES ('40', '1005', '3', '硕士', null);
INSERT INTO `sys_dictionary` VALUES ('41', '1005', '4', '学士', null);
INSERT INTO `sys_dictionary` VALUES ('42', '1006', 'Z', '未知', null);
INSERT INTO `sys_dictionary` VALUES ('43', '1006', '0', '国家机关、党群组织、企业、事业单位人员', null);
INSERT INTO `sys_dictionary` VALUES ('44', '1006', '1', '专业技术人员', null);
INSERT INTO `sys_dictionary` VALUES ('45', '1006', '3', '办事人员和有关人员', null);
INSERT INTO `sys_dictionary` VALUES ('46', '1006', '4', '商业、服务业人员', null);
INSERT INTO `sys_dictionary` VALUES ('47', '1006', '5', '农、林、牧、渔、水利业生产人员', null);
INSERT INTO `sys_dictionary` VALUES ('48', '1006', '6', '生产、运输设备操作人员及有关人员', null);
INSERT INTO `sys_dictionary` VALUES ('49', '1006', 'X', '军人', null);
INSERT INTO `sys_dictionary` VALUES ('50', '1006', 'Y', '不便分类的其他从业人员', null);
INSERT INTO `sys_dictionary` VALUES ('51', '1007', 'Z', '未知', null);
INSERT INTO `sys_dictionary` VALUES ('52', '1007', 'A', '农、林、牧、渔业', null);
INSERT INTO `sys_dictionary` VALUES ('53', '1007', 'B', '采掘业', null);
INSERT INTO `sys_dictionary` VALUES ('54', '1007', 'C', '制造业', null);
INSERT INTO `sys_dictionary` VALUES ('55', '1007', 'D', '电力、燃气及水的生产和供应业', null);
INSERT INTO `sys_dictionary` VALUES ('56', '1007', 'E', '建筑业', null);
INSERT INTO `sys_dictionary` VALUES ('57', '1007', 'F', '交通运输、仓储和邮政业', null);
INSERT INTO `sys_dictionary` VALUES ('58', '1007', 'G', '信息传输、计算机服务和软件业', null);
INSERT INTO `sys_dictionary` VALUES ('59', '1007', 'H', '批发和零售业', null);
INSERT INTO `sys_dictionary` VALUES ('60', '1007', 'I', '住宿和餐饮业', null);
INSERT INTO `sys_dictionary` VALUES ('61', '1007', 'J', '金融业', null);
INSERT INTO `sys_dictionary` VALUES ('62', '1007', 'K', '房地产业', null);
INSERT INTO `sys_dictionary` VALUES ('63', '1007', 'L', '租赁和商务服务业', null);
INSERT INTO `sys_dictionary` VALUES ('64', '1007', 'M', '科学研究、技术服务业和地质勘察业', null);
INSERT INTO `sys_dictionary` VALUES ('65', '1007', 'N', '水利、环境和公共设施管理业', null);
INSERT INTO `sys_dictionary` VALUES ('66', '1007', 'O', '居民服务和其他服务业', null);
INSERT INTO `sys_dictionary` VALUES ('67', '1007', 'P', '教育', null);
INSERT INTO `sys_dictionary` VALUES ('68', '1007', 'Q', '卫生、社会保障和社会福利业', null);
INSERT INTO `sys_dictionary` VALUES ('69', '1007', 'R', '文化、体育和娱乐业', null);
INSERT INTO `sys_dictionary` VALUES ('70', '1007', 'S', '公共管理和社会组织', null);
INSERT INTO `sys_dictionary` VALUES ('71', '1007', 'T', '国际组织', null);
INSERT INTO `sys_dictionary` VALUES ('72', '1008', '9', '未知', '');
INSERT INTO `sys_dictionary` VALUES ('73', '1008', '1', '高级管理', '行政级别局级及局级以上领导或大公司高级管理人员');
INSERT INTO `sys_dictionary` VALUES ('74', '1008', '2', '中级管理', '行政级别局级以下领导或大公司中级管理人员');
INSERT INTO `sys_dictionary` VALUES ('75', '1008', '3', '一般员工', null);
INSERT INTO `sys_dictionary` VALUES ('76', '1008', '4', '其他', '');
INSERT INTO `sys_dictionary` VALUES ('77', '1009', '0', '无', null);
INSERT INTO `sys_dictionary` VALUES ('78', '1009', '1', '高级', null);
INSERT INTO `sys_dictionary` VALUES ('79', '1009', '2', '中级', null);
INSERT INTO `sys_dictionary` VALUES ('80', '1009', '3', '初级', null);
INSERT INTO `sys_dictionary` VALUES ('81', '1009', '9', '未知', null);
INSERT INTO `sys_dictionary` VALUES ('82', '1010', '1', '自置', null);
INSERT INTO `sys_dictionary` VALUES ('83', '1010', '2', '按揭', null);
INSERT INTO `sys_dictionary` VALUES ('84', '1010', '3', '亲属楼宇', null);
INSERT INTO `sys_dictionary` VALUES ('85', '1010', '4', '集体宿舍', null);
INSERT INTO `sys_dictionary` VALUES ('86', '1010', '5', '租房', null);
INSERT INTO `sys_dictionary` VALUES ('87', '1010', '6', '共有住宅', null);
INSERT INTO `sys_dictionary` VALUES ('88', '1010', '7', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('89', '1010', '9', '未知', null);
INSERT INTO `sys_dictionary` VALUES ('90', '1011', '1', '党员', null);
INSERT INTO `sys_dictionary` VALUES ('91', '1011', '2', '群众', null);
INSERT INTO `sys_dictionary` VALUES ('92', '1012', '1', '汉族', null);
INSERT INTO `sys_dictionary` VALUES ('93', '1012', '2', '壮族', null);
INSERT INTO `sys_dictionary` VALUES ('94', '1012', '3', '满族', null);
INSERT INTO `sys_dictionary` VALUES ('95', '1012', '4', '回族', null);
INSERT INTO `sys_dictionary` VALUES ('96', '1012', '5', '苗族', null);
INSERT INTO `sys_dictionary` VALUES ('97', '1012', '6', '维吾尔族', null);
INSERT INTO `sys_dictionary` VALUES ('98', '1012', '7', '土家族', null);
INSERT INTO `sys_dictionary` VALUES ('99', '1012', '8', '彝族', null);
INSERT INTO `sys_dictionary` VALUES ('100', '1012', '9', '蒙古族', null);
INSERT INTO `sys_dictionary` VALUES ('101', '1012', '10', '藏族', null);
INSERT INTO `sys_dictionary` VALUES ('102', '1012', '11', '布依族', null);
INSERT INTO `sys_dictionary` VALUES ('103', '1012', '12', '侗族', null);
INSERT INTO `sys_dictionary` VALUES ('104', '1012', '13', '瑶族', null);
INSERT INTO `sys_dictionary` VALUES ('105', '1012', '14', '朝鲜族', null);
INSERT INTO `sys_dictionary` VALUES ('106', '1012', '15', '白族', null);
INSERT INTO `sys_dictionary` VALUES ('107', '1012', '16', '哈尼族', null);
INSERT INTO `sys_dictionary` VALUES ('108', '1012', '17', '哈萨克族', null);
INSERT INTO `sys_dictionary` VALUES ('109', '1012', '18', '黎族', null);
INSERT INTO `sys_dictionary` VALUES ('110', '1012', '19', '傣族', null);
INSERT INTO `sys_dictionary` VALUES ('111', '1012', '20', '畲族', null);
INSERT INTO `sys_dictionary` VALUES ('112', '1012', '21', '傈僳族', null);
INSERT INTO `sys_dictionary` VALUES ('113', '1012', '22', '仡佬族', null);
INSERT INTO `sys_dictionary` VALUES ('114', '1012', '23', '东乡族', null);
INSERT INTO `sys_dictionary` VALUES ('115', '1012', '24', '高山族', null);
INSERT INTO `sys_dictionary` VALUES ('116', '1012', '25', '拉祜族', null);
INSERT INTO `sys_dictionary` VALUES ('117', '1012', '26', '水族', null);
INSERT INTO `sys_dictionary` VALUES ('118', '1012', '27', '佤族', null);
INSERT INTO `sys_dictionary` VALUES ('119', '1012', '28', '纳西族', null);
INSERT INTO `sys_dictionary` VALUES ('120', '1012', '29', '羌族', null);
INSERT INTO `sys_dictionary` VALUES ('121', '1012', '30', '土族', null);
INSERT INTO `sys_dictionary` VALUES ('122', '1012', '31', '仫佬族', null);
INSERT INTO `sys_dictionary` VALUES ('123', '1012', '32', '锡伯族', null);
INSERT INTO `sys_dictionary` VALUES ('124', '1012', '33', '柯尔克孜族', null);
INSERT INTO `sys_dictionary` VALUES ('125', '1012', '34', '达斡尔族', null);
INSERT INTO `sys_dictionary` VALUES ('126', '1012', '35', '景颇族', null);
INSERT INTO `sys_dictionary` VALUES ('127', '1012', '36', '毛南族', null);
INSERT INTO `sys_dictionary` VALUES ('128', '1012', '37', '撒拉族', null);
INSERT INTO `sys_dictionary` VALUES ('129', '1012', '38', '布朗族', null);
INSERT INTO `sys_dictionary` VALUES ('130', '1012', '39', '塔吉克族', null);
INSERT INTO `sys_dictionary` VALUES ('131', '1012', '40', '阿昌族', null);
INSERT INTO `sys_dictionary` VALUES ('132', '1012', '41', '普米族', null);
INSERT INTO `sys_dictionary` VALUES ('133', '1012', '42', '鄂温克族', null);
INSERT INTO `sys_dictionary` VALUES ('134', '1012', '43', '怒族', null);
INSERT INTO `sys_dictionary` VALUES ('135', '1012', '44', '京族', null);
INSERT INTO `sys_dictionary` VALUES ('136', '1012', '45', '基诺族', null);
INSERT INTO `sys_dictionary` VALUES ('137', '1012', '46', '德昂族', null);
INSERT INTO `sys_dictionary` VALUES ('138', '1012', '47', '保安族', null);
INSERT INTO `sys_dictionary` VALUES ('139', '1012', '48', '俄罗斯族', null);
INSERT INTO `sys_dictionary` VALUES ('140', '1012', '49', '裕固族', null);
INSERT INTO `sys_dictionary` VALUES ('141', '1012', '50', '乌兹别克族', null);
INSERT INTO `sys_dictionary` VALUES ('142', '1012', '51', '门巴族', null);
INSERT INTO `sys_dictionary` VALUES ('143', '1012', '52', '鄂伦春族', null);
INSERT INTO `sys_dictionary` VALUES ('144', '1012', '53', '独龙族', null);
INSERT INTO `sys_dictionary` VALUES ('145', '1012', '54', '塔塔尔族', null);
INSERT INTO `sys_dictionary` VALUES ('146', '1012', '55', '赫哲族', null);
INSERT INTO `sys_dictionary` VALUES ('147', '1012', '56', '巴族', null);
INSERT INTO `sys_dictionary` VALUES ('148', '1013', '1', '良好', null);
INSERT INTO `sys_dictionary` VALUES ('149', '1013', '2', '一般', null);
INSERT INTO `sys_dictionary` VALUES ('150', '1013', '3', '较差', null);
INSERT INTO `sys_dictionary` VALUES ('151', '1014', '0', '常住户口', null);
INSERT INTO `sys_dictionary` VALUES ('152', '1014', '1', '临时户口', null);
INSERT INTO `sys_dictionary` VALUES ('153', '1015', '1', '城户', null);
INSERT INTO `sys_dictionary` VALUES ('154', '1015', '2', '农户', null);
INSERT INTO `sys_dictionary` VALUES ('155', '1015', '3', '工商户', null);
INSERT INTO `sys_dictionary` VALUES ('156', '1016', '1', '是', null);
INSERT INTO `sys_dictionary` VALUES ('157', '1016', '2', '有亲属', null);
INSERT INTO `sys_dictionary` VALUES ('158', '1016', '3', '否', null);
INSERT INTO `sys_dictionary` VALUES ('159', '1017', '1', '是', null);
INSERT INTO `sys_dictionary` VALUES ('160', '1017', '2', '有亲属', null);
INSERT INTO `sys_dictionary` VALUES ('161', '1017', '3', '否', null);
INSERT INTO `sys_dictionary` VALUES ('162', '1018', '0', '配偶', null);
INSERT INTO `sys_dictionary` VALUES ('163', '1018', '1', '父母', null);
INSERT INTO `sys_dictionary` VALUES ('165', '1018', '2', '子女', null);
INSERT INTO `sys_dictionary` VALUES ('176', '1019', '1', '处级以上', null);
INSERT INTO `sys_dictionary` VALUES ('177', '1019', '2', '科级', null);
INSERT INTO `sys_dictionary` VALUES ('178', '1019', '3', '科级以下', null);
INSERT INTO `sys_dictionary` VALUES ('179', '1020', '9', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('180', '1020', '1', '机关事业', null);
INSERT INTO `sys_dictionary` VALUES ('181', '1020', '2', '三资', null);
INSERT INTO `sys_dictionary` VALUES ('182', '1020', '3', '国营', null);
INSERT INTO `sys_dictionary` VALUES ('183', '1020', '4', '集体', null);
INSERT INTO `sys_dictionary` VALUES ('184', '1020', '5', '私营', null);
INSERT INTO `sys_dictionary` VALUES ('185', '1020', '6', '个体', null);
INSERT INTO `sys_dictionary` VALUES ('186', '1021', '1', '1人', null);
INSERT INTO `sys_dictionary` VALUES ('187', '1021', '2', '2人', null);
INSERT INTO `sys_dictionary` VALUES ('188', '1021', '3', '3人', null);
INSERT INTO `sys_dictionary` VALUES ('189', '1021', '4', '4人以上', null);
INSERT INTO `sys_dictionary` VALUES ('190', '1022', '1', '密切联系', null);
INSERT INTO `sys_dictionary` VALUES ('191', '1022', '2', '一般联系', null);
INSERT INTO `sys_dictionary` VALUES ('192', '1022', '3', '较少联系', null);
INSERT INTO `sys_dictionary` VALUES ('193', '1023', '1', '对公客户', null);
INSERT INTO `sys_dictionary` VALUES ('194', '1023', '2', '个人客户', null);
INSERT INTO `sys_dictionary` VALUES ('195', '1101', '1', '内资企业', null);
INSERT INTO `sys_dictionary` VALUES ('196', '1101', '2', '国有企业', null);
INSERT INTO `sys_dictionary` VALUES ('197', '1101', '4', '集体企业', null);
INSERT INTO `sys_dictionary` VALUES ('198', '1101', '5', '股份合作企业', null);
INSERT INTO `sys_dictionary` VALUES ('199', '1101', '6', '有限责任公司', null);
INSERT INTO `sys_dictionary` VALUES ('200', '1101', '7', '股份有限公司', null);
INSERT INTO `sys_dictionary` VALUES ('201', '1109', '4', '大型企业', null);
INSERT INTO `sys_dictionary` VALUES ('202', '1109', '5', '中型企业', null);
INSERT INTO `sys_dictionary` VALUES ('203', '1109', '6', '小型企业', null);
INSERT INTO `sys_dictionary` VALUES ('204', '1112', '1', '密切联系', null);
INSERT INTO `sys_dictionary` VALUES ('205', '1112', '2', '一般联系', null);
INSERT INTO `sys_dictionary` VALUES ('206', '1112', '3', '较少联系', null);
INSERT INTO `sys_dictionary` VALUES ('207', '1115', '1', '住房', null);
INSERT INTO `sys_dictionary` VALUES ('208', '1115', '2', '商铺', null);
INSERT INTO `sys_dictionary` VALUES ('209', '1115', '3', '办公房', null);
INSERT INTO `sys_dictionary` VALUES ('210', '1115', '4', '自建房', null);
INSERT INTO `sys_dictionary` VALUES ('211', '1115', '5', '工业用地', null);
INSERT INTO `sys_dictionary` VALUES ('212', '1115', '6', '商业用地', null);
INSERT INTO `sys_dictionary` VALUES ('213', '1115', '7', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('214', '1116', '1', '自置', null);
INSERT INTO `sys_dictionary` VALUES ('215', '1116', '2', '贷款', null);
INSERT INTO `sys_dictionary` VALUES ('216', '1116', '3', '赊欠', null);
INSERT INTO `sys_dictionary` VALUES ('217', '1116', '4', '继承', null);
INSERT INTO `sys_dictionary` VALUES ('218', '1116', '5', '赠与', null);
INSERT INTO `sys_dictionary` VALUES ('219', '1116', '6', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('220', '1117', '1', '自用', null);
INSERT INTO `sys_dictionary` VALUES ('221', '1117', '2', '出租', null);
INSERT INTO `sys_dictionary` VALUES ('222', '1117', '3', '闲置', null);
INSERT INTO `sys_dictionary` VALUES ('223', '1117', '4', '无偿为他人使用', null);
INSERT INTO `sys_dictionary` VALUES ('224', '1117', '5', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('225', '1118', '1', '养老保险', null);
INSERT INTO `sys_dictionary` VALUES ('226', '1118', '2', '医疗保险', null);
INSERT INTO `sys_dictionary` VALUES ('227', '1118', '3', '住房公积金', null);
INSERT INTO `sys_dictionary` VALUES ('228', '1118', '4', '失业保险金', null);
INSERT INTO `sys_dictionary` VALUES ('229', '1118', '5', '其它保险', null);
INSERT INTO `sys_dictionary` VALUES ('230', '1119', '1', '财产保险', null);
INSERT INTO `sys_dictionary` VALUES ('231', '1119', '2', '人寿保险', null);
INSERT INTO `sys_dictionary` VALUES ('232', '1119', '3', '意外伤害保险', null);
INSERT INTO `sys_dictionary` VALUES ('233', '1120', '1', '轿车', null);
INSERT INTO `sys_dictionary` VALUES ('234', '1120', '2', '客车', null);
INSERT INTO `sys_dictionary` VALUES ('235', '1120', '3', '货车', null);
INSERT INTO `sys_dictionary` VALUES ('236', '1120', '4', '越野车', null);
INSERT INTO `sys_dictionary` VALUES ('237', '1120', '5', '专用车', null);
INSERT INTO `sys_dictionary` VALUES ('238', '1121', '1', '自置', null);
INSERT INTO `sys_dictionary` VALUES ('239', '1121', '2', '贷款', null);
INSERT INTO `sys_dictionary` VALUES ('240', '1121', '3', '赊欠', null);
INSERT INTO `sys_dictionary` VALUES ('241', '1121', '4', '继承', null);
INSERT INTO `sys_dictionary` VALUES ('242', '1121', '5', '赠与', null);
INSERT INTO `sys_dictionary` VALUES ('243', '1121', '6', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('244', '1122', '1', '自用', null);
INSERT INTO `sys_dictionary` VALUES ('245', '1122', '2', '出租', null);
INSERT INTO `sys_dictionary` VALUES ('246', '1122', '3', '闲置', null);
INSERT INTO `sys_dictionary` VALUES ('247', '1122', '4', '无偿为他人使用', null);
INSERT INTO `sys_dictionary` VALUES ('248', '1122', '5', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('249', '1123', '1', '个人所得税', null);
INSERT INTO `sys_dictionary` VALUES ('250', '1123', '2', '营业税', null);
INSERT INTO `sys_dictionary` VALUES ('251', '1123', '3', '房产税', null);
INSERT INTO `sys_dictionary` VALUES ('252', '1123', '4', '契税', null);
INSERT INTO `sys_dictionary` VALUES ('253', '1123', '5', '土地增值税', null);
INSERT INTO `sys_dictionary` VALUES ('254', '1123', '6', '车辆购置税', null);
INSERT INTO `sys_dictionary` VALUES ('255', '1123', '7', '印花税', null);
INSERT INTO `sys_dictionary` VALUES ('256', '1123', '8', '消费税', null);
INSERT INTO `sys_dictionary` VALUES ('257', '1123', '9', '遗产与赠与税', null);
INSERT INTO `sys_dictionary` VALUES ('258', '1123', '10', '车船使用税', null);
INSERT INTO `sys_dictionary` VALUES ('259', '1123', '11', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('260', '1124', '1', '拒绝客户', null);
INSERT INTO `sys_dictionary` VALUES ('261', '1124', '2', '特别关注客户', null);
INSERT INTO `sys_dictionary` VALUES ('262', '1124', '3', '信用下降客户', null);
INSERT INTO `sys_dictionary` VALUES ('263', '1125', '0', '生效', null);
INSERT INTO `sys_dictionary` VALUES ('264', '1125', '1', '未生效', null);
INSERT INTO `sys_dictionary` VALUES ('265', '1126', 'CNY', '人民币', null);
INSERT INTO `sys_dictionary` VALUES ('266', '1128', '1', '专利权', null);
INSERT INTO `sys_dictionary` VALUES ('267', '1128', '2', '商标权', null);
INSERT INTO `sys_dictionary` VALUES ('268', '1128', '3', '著作权', null);
INSERT INTO `sys_dictionary` VALUES ('269', '1128', '4', '其它', null);
INSERT INTO `sys_dictionary` VALUES ('270', '2000', '1', '新增业务', null);
INSERT INTO `sys_dictionary` VALUES ('271', '2001', '1', '等额本息', null);
INSERT INTO `sys_dictionary` VALUES ('272', '2001', '2', '等额本金', null);
INSERT INTO `sys_dictionary` VALUES ('273', '2001', '3', '利随本清', null);
INSERT INTO `sys_dictionary` VALUES ('274', '2001', '4', '到期偿还本金按月结息', null);
INSERT INTO `sys_dictionary` VALUES ('277', '2002', '1', '固定利率', null);
INSERT INTO `sys_dictionary` VALUES ('285', '2003', '1', '短期贷款', null);
INSERT INTO `sys_dictionary` VALUES ('286', '2003', '2', '中期贷款', null);
INSERT INTO `sys_dictionary` VALUES ('287', '2003', '3', '长期贷款', null);
INSERT INTO `sys_dictionary` VALUES ('288', '2005', '1', '年利率', null);
INSERT INTO `sys_dictionary` VALUES ('289', '2005', '2', '月利率', null);
INSERT INTO `sys_dictionary` VALUES ('290', '2005', '3', '日利率', null);
INSERT INTO `sys_dictionary` VALUES ('291', '2006', '0', '否', null);
INSERT INTO `sys_dictionary` VALUES ('292', '2006', '1', '是', null);
INSERT INTO `sys_dictionary` VALUES ('293', '2007', '1', '质押', null);
INSERT INTO `sys_dictionary` VALUES ('294', '2007', '2', '抵押', null);
INSERT INTO `sys_dictionary` VALUES ('295', '2007', '3', '保证', null);
INSERT INTO `sys_dictionary` VALUES ('296', '2007', '4', '信用', null);
INSERT INTO `sys_dictionary` VALUES ('297', '2008', '112', '银行存单', '1开头的对应主担保方式中的质押贷款');
INSERT INTO `sys_dictionary` VALUES ('298', '2008', '120', '保证金', null);
INSERT INTO `sys_dictionary` VALUES ('299', '2008', '130', '国债', null);
INSERT INTO `sys_dictionary` VALUES ('300', '2008', '140', '支票', null);
INSERT INTO `sys_dictionary` VALUES ('301', '2008', '150', '股票', null);
INSERT INTO `sys_dictionary` VALUES ('302', '2008', '160', '保单', null);
INSERT INTO `sys_dictionary` VALUES ('303', '2008', '170', '承兑汇票', null);
INSERT INTO `sys_dictionary` VALUES ('304', '2008', '180', '汽车合格证', null);
INSERT INTO `sys_dictionary` VALUES ('305', '2008', '185', '债权质押', null);
INSERT INTO `sys_dictionary` VALUES ('306', '2008', '190', '权利质押', null);
INSERT INTO `sys_dictionary` VALUES ('307', '2008', '193', '工资履约', null);
INSERT INTO `sys_dictionary` VALUES ('308', '2008', '195', '仓单', null);
INSERT INTO `sys_dictionary` VALUES ('309', '2008', '199', '其他质押', null);
INSERT INTO `sys_dictionary` VALUES ('310', '2008', '211', '住房', '2开头的对应主担保方式中的抵押贷款');
INSERT INTO `sys_dictionary` VALUES ('311', '2008', '212', '商业用房', null);
INSERT INTO `sys_dictionary` VALUES ('312', '2008', '220', '土地使用权', null);
INSERT INTO `sys_dictionary` VALUES ('313', '2008', '230', '房产及土地使用权', null);
INSERT INTO `sys_dictionary` VALUES ('314', '2008', '240', '在建工程', null);
INSERT INTO `sys_dictionary` VALUES ('315', '2008', '250', '交通工具', null);
INSERT INTO `sys_dictionary` VALUES ('316', '2008', '260', '机械设备', null);
INSERT INTO `sys_dictionary` VALUES ('317', '2008', '270', '采矿权', null);
INSERT INTO `sys_dictionary` VALUES ('318', '2008', '280', '其他抵押', null);
INSERT INTO `sys_dictionary` VALUES ('319', '2008', '310', '政府保证', '3开头对应对应主担保方式中的保证贷款');
INSERT INTO `sys_dictionary` VALUES ('320', '2008', '320', '银行保证', null);
INSERT INTO `sys_dictionary` VALUES ('321', '2008', '330', '非银行金融机构保证', null);
INSERT INTO `sys_dictionary` VALUES ('322', '2008', '340', '法人企业担保', null);
INSERT INTO `sys_dictionary` VALUES ('323', '2008', '350', '组合担保', null);
INSERT INTO `sys_dictionary` VALUES ('324', '2008', '360', '自然人担保', null);
INSERT INTO `sys_dictionary` VALUES ('325', '2008', '390', '其他担保', null);
INSERT INTO `sys_dictionary` VALUES ('326', '2008', '410', '具有承诺函信用担保', '4开头对应对应主担保方式中的信用贷款');
INSERT INTO `sys_dictionary` VALUES ('327', '2008', '420', '其他信用担保', null);
INSERT INTO `sys_dictionary` VALUES ('328', '2009', '1', '普通', null);
INSERT INTO `sys_dictionary` VALUES ('329', '1102', '1', '国有企业', '公司、非公司制企业法人');
INSERT INTO `sys_dictionary` VALUES ('330', '1102', '2', '集体企业', '个人独资企业、合伙企业');
INSERT INTO `sys_dictionary` VALUES ('331', '1102', '3', '联营企业', null);
INSERT INTO `sys_dictionary` VALUES ('332', '1102', '4', '股份合作制企业', null);
INSERT INTO `sys_dictionary` VALUES ('333', '1102', '99', '私营企业', '国家机关、军队、社会团体等');
INSERT INTO `sys_dictionary` VALUES ('334', '1103', '100', '内资企业', null);
INSERT INTO `sys_dictionary` VALUES ('335', '1103', '110', '国有企业', '国有企业是指企业全部资产归国家所有，并按《中华人民共和国企业法人登记管理条例》规定登记注册的非公司制的经济组织。不包括有限责任公司中的国有独资公司。');
INSERT INTO `sys_dictionary` VALUES ('336', '1103', '120', '集体企业', '集体企业是指企业资产归集体所有，并按《中华人民共和国企业法人登记管理条例》规定登记注册的经济组织。');
INSERT INTO `sys_dictionary` VALUES ('337', '1103', '130', '股份合作企业', '股份合作企业是指以合作制为基础，由企业职工共同出资入股，吸收一定比例的社会资产投资组建，实行自主经营，自负盈亏，共同劳动，民主管理，按劳分配与按股分红相结合的一种集体经济组织。');
INSERT INTO `sys_dictionary` VALUES ('338', '1103', '140', '联营企业', '联营企业是指两个及两个以上相同或不同所有制性质的企业法人或事业单位法人，按自愿、平等、互利的原则，共同投资组成的经济组织。');
INSERT INTO `sys_dictionary` VALUES ('339', '1103', '150', '有限责任公司', '有限责任公司是指根据《中华人民共和国公司登记管理条例》规定登记注册，由两个以上，五十个以下的股东共同出资，每个股东以其所认缴的出资额对公司承担有限责任，公司以其全部资产对其债务承担责任的经济组织。');
INSERT INTO `sys_dictionary` VALUES ('340', '1103', '160', '股份有限公司', '股份有限公司是指根据《中华人民共和国公司登记管理条例》规定登记注册，其全部注册资本由等额股份构成并通过发行股票筹集资本，股东以其认购的股份对公司承担有限责任，公司以其全部资产对其债务承担责任的经济组织。');
INSERT INTO `sys_dictionary` VALUES ('341', '1103', '170', '私营企业', '私营企业是指由自然人投资设立或由自然人控股，以雇佣劳动为基础的营利性经济组织。包括按照《公司法》、《合伙企业法》、《私营企业暂行条例》规定登记注册的私营有限责任公司、私营股份有限公司、私营合伙企业和私营独资企业。');
INSERT INTO `sys_dictionary` VALUES ('342', '1103', '200', '三资企业（港、澳、台投资企业）', null);
INSERT INTO `sys_dictionary` VALUES ('343', '1103', '300', '外商投资企业', null);
INSERT INTO `sys_dictionary` VALUES ('344', '1103', '400', '个体经营', null);
INSERT INTO `sys_dictionary` VALUES ('345', '1103', '500', '其它', null);
INSERT INTO `sys_dictionary` VALUES ('346', '1104', '2', '大型企业', null);
INSERT INTO `sys_dictionary` VALUES ('347', '1104', '3', '中型企业', null);
INSERT INTO `sys_dictionary` VALUES ('348', '1104', '4', '小型企业', null);
INSERT INTO `sys_dictionary` VALUES ('349', '1104', '9', '其他', '非企业');
INSERT INTO `sys_dictionary` VALUES ('350', '1106', '1', '是', null);
INSERT INTO `sys_dictionary` VALUES ('351', '1106', '2', '否', null);
INSERT INTO `sys_dictionary` VALUES ('352', '1107', '1', '是', null);
INSERT INTO `sys_dictionary` VALUES ('353', '1107', '2', '否', null);
INSERT INTO `sys_dictionary` VALUES ('354', '1108', '1', '是', null);
INSERT INTO `sys_dictionary` VALUES ('355', '1108', '2', '否', null);
INSERT INTO `sys_dictionary` VALUES ('356', '1110', '01', '上海', null);
INSERT INTO `sys_dictionary` VALUES ('357', '1110', '02', '深圳', null);
INSERT INTO `sys_dictionary` VALUES ('358', '1110', '03', '香港', null);
INSERT INTO `sys_dictionary` VALUES ('359', '1110', '04', '新加坡', null);
INSERT INTO `sys_dictionary` VALUES ('360', '1110', '05', '伦敦', null);
INSERT INTO `sys_dictionary` VALUES ('361', '1110', '06', '纽约', null);
INSERT INTO `sys_dictionary` VALUES ('362', '1110', '07', '东京', null);
INSERT INTO `sys_dictionary` VALUES ('363', '1110', '99', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('364', '1111', '1', '自有', null);
INSERT INTO `sys_dictionary` VALUES ('365', '1111', '2', '租赁', null);
INSERT INTO `sys_dictionary` VALUES ('366', '1111', '3', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('367', '1113', '1', '法定代表人', '依照法律或法人组织章程规定，代表法人行使职权的负责人，是法人的法定代表人，没有正职的，由主持工作的副职负责人担任法定代表人，设有董事会的法人，以董事长为法定代表人，没有董事长的法人，经董事会授权的负责人可作为法人的法定代表人。');
INSERT INTO `sys_dictionary` VALUES ('368', '1113', '2', '总经理', '主持公司的生产经营管理工作，组织实施执行董事会决议，在生产经营活动中，对本单位的生产、质量、安全、营销等全面负责的人员。');
INSERT INTO `sys_dictionary` VALUES ('369', '1113', '3', '财务负责人', '最高的财务管理人员，可以是会计主管或者财务总监等');
INSERT INTO `sys_dictionary` VALUES ('370', '1114', '1', '配偶', null);
INSERT INTO `sys_dictionary` VALUES ('371', '1114', '2', '父母', null);
INSERT INTO `sys_dictionary` VALUES ('372', '1114', '3', '子女', null);
INSERT INTO `sys_dictionary` VALUES ('373', '1114', '4', '其他血亲', '祖父(爷爷)、祖母（奶奶）、外祖父（外公）、外祖母（外婆）、伯父/伯伯、叔父/叔叔、姑妈/姑姑、舅父/舅舅、姨妈/阿姨/姨母、兄、弟、姐、妹、堂兄、堂弟、堂姐、堂妹、表兄、表弟、表姐、表妹、侄子、侄女、外甥、外甥女、孙子、孙女、外孙、外孙女');
INSERT INTO `sys_dictionary` VALUES ('374', '1114', '5', '其他姻亲', '伯母、叔母、婶婶、姑父、姑丈、舅母、舅妈、姨父、姨丈、嫂、弟妇、弟妹、姐夫、姐丈、妹夫、妹婿、妹丈、公公、婆婆、岳父、岳母、伯、大伯哥、叔、小叔子、姑、大姑姐、小姑子、内兄、舅子、内弟、舅子、姨子、媳妇、儿媳、女婿');
INSERT INTO `sys_dictionary` VALUES ('375', '2012', '1', '重置成本法', null);
INSERT INTO `sys_dictionary` VALUES ('376', '2012', '2', '现值成本法', null);
INSERT INTO `sys_dictionary` VALUES ('377', '2012', '3', '现行市价法', null);
INSERT INTO `sys_dictionary` VALUES ('378', '2012', '4', '收益现值法', null);
INSERT INTO `sys_dictionary` VALUES ('379', '2012', '5', '其他方法', null);
INSERT INTO `sys_dictionary` VALUES ('380', '2014', '1', '出让', null);
INSERT INTO `sys_dictionary` VALUES ('381', '2014', '2', '划拨', null);
INSERT INTO `sys_dictionary` VALUES ('382', '2014', '9', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('383', '2015', '0', '否', null);
INSERT INTO `sys_dictionary` VALUES ('384', '2015', '1', '是', null);
INSERT INTO `sys_dictionary` VALUES ('385', '1127', 'CHN', '中华人民共和国', null);
INSERT INTO `sys_dictionary` VALUES ('386', '1129', 'A', '营业执照', null);
INSERT INTO `sys_dictionary` VALUES ('387', '2016', '3', '对公', null);
INSERT INTO `sys_dictionary` VALUES ('388', '2016', '4', '提前还款', null);
INSERT INTO `sys_dictionary` VALUES ('389', '2017', '1', '小额贷款有限公司', null);
INSERT INTO `sys_dictionary` VALUES ('390', '2017', '2', '信贷部', null);
INSERT INTO `sys_dictionary` VALUES ('391', '2017', '3', '风险部', null);
INSERT INTO `sys_dictionary` VALUES ('392', '2017', '4', '财务部', null);
INSERT INTO `sys_dictionary` VALUES ('393', '2017', '5', '贷审会', null);
INSERT INTO `sys_dictionary` VALUES ('394', '2017', '6', '风控部', null);
INSERT INTO `sys_dictionary` VALUES ('395', '2017', '7', '营销策划部', null);
INSERT INTO `sys_dictionary` VALUES ('396', '2018', '1', '银行转账', null);
INSERT INTO `sys_dictionary` VALUES ('397', '2018', '2', '现金', null);
INSERT INTO `sys_dictionary` VALUES ('398', '2019', '0', '未还款', null);
INSERT INTO `sys_dictionary` VALUES ('399', '2019', '1', '已还款', null);
INSERT INTO `sys_dictionary` VALUES ('400', '2019', '2', '欠款', null);
INSERT INTO `sys_dictionary` VALUES ('401', '2019', '3', '部分还款', null);
INSERT INTO `sys_dictionary` VALUES ('404', '4000', '1', '正常', '一级');
INSERT INTO `sys_dictionary` VALUES ('405', '4000', '2', '关注', '二级');
INSERT INTO `sys_dictionary` VALUES ('406', '4000', '3', '次级', '三级');
INSERT INTO `sys_dictionary` VALUES ('407', '4000', '4', '可疑', '四级');
INSERT INTO `sys_dictionary` VALUES ('408', '4000', '5', '损失', '五级');
INSERT INTO `sys_dictionary` VALUES ('409', '5600', '1', '不持股', '');
INSERT INTO `sys_dictionary` VALUES ('410', '5600', '2', '持股', '');
INSERT INTO `sys_dictionary` VALUES ('411', '5601', '1', '身份证', null);
INSERT INTO `sys_dictionary` VALUES ('412', '5601', '2', '营业执照', null);
INSERT INTO `sys_dictionary` VALUES ('413', '5602', '1', '自然人资本', null);
INSERT INTO `sys_dictionary` VALUES ('414', '5602', '2', '法人资本', null);
INSERT INTO `sys_dictionary` VALUES ('415', '5603', '1', '个人股', null);
INSERT INTO `sys_dictionary` VALUES ('416', '5603', '2', '法人股', null);
INSERT INTO `sys_dictionary` VALUES ('417', '5603', '3', '国家股', null);
INSERT INTO `sys_dictionary` VALUES ('418', '5603', '4', '外资股', null);
INSERT INTO `sys_dictionary` VALUES ('419', '5604', '1', '货币出资', null);
INSERT INTO `sys_dictionary` VALUES ('420', '5604', '2', '实物出资', null);
INSERT INTO `sys_dictionary` VALUES ('421', '5604', '3', '工业产权出资', null);
INSERT INTO `sys_dictionary` VALUES ('422', '5604', '4', '非专利出资', null);
INSERT INTO `sys_dictionary` VALUES ('423', '5604', '5', '土地使用权', null);
INSERT INTO `sys_dictionary` VALUES ('424', '5604', '6', '专利出资', null);
INSERT INTO `sys_dictionary` VALUES ('425', '5604', '7', '其他出资', null);
INSERT INTO `sys_dictionary` VALUES ('427', '5201', 'XS', '现收', '现金收入，则做现收凭证，\n既涉及现金又涉及银行存款，以贷方科目为准');
INSERT INTO `sys_dictionary` VALUES ('428', '5201', 'XF', '现付', '现金支出，则做现付凭证，\n既涉及现金又涉及银行存款，以贷方科目为准');
INSERT INTO `sys_dictionary` VALUES ('429', '5201', 'YS', '银收', '银行存款收入，则做银收凭证，\n既涉及现金又涉及银行存款，以贷方科目为准');
INSERT INTO `sys_dictionary` VALUES ('430', '5201', 'YF', '银付', '银行存款支出，则做银付凭证，\n既涉及现金又涉及银行存款，以贷方科目为准');
INSERT INTO `sys_dictionary` VALUES ('431', '5201', 'ZZ', '转账', '现金和银行存款都没有增加或减少就是转帐凭证(借贷双方都没有现金和银行存款)');
INSERT INTO `sys_dictionary` VALUES ('432', '3002', '1', '在职', '员工状态-1-在职');
INSERT INTO `sys_dictionary` VALUES ('433', '3002', '0', '试用', '员工状态-0-试用');
INSERT INTO `sys_dictionary` VALUES ('434', '3002', '2', '离职', '员工状态-2-离职');
INSERT INTO `sys_dictionary` VALUES ('435', '3003', '1', '一星级', '客户经理级别-1-一星级');
INSERT INTO `sys_dictionary` VALUES ('436', '3003', '2', '二星级', '客户经理级别-2-二星级');
INSERT INTO `sys_dictionary` VALUES ('437', '3003', '3', '三星级', '客户经理级别-3-三星级');
INSERT INTO `sys_dictionary` VALUES ('438', '3003', '4', '四星级', '客户经理级别-4-四星级');
INSERT INTO `sys_dictionary` VALUES ('439', '3003', '5', '五星级', '客户经理级别-5-五星级');
INSERT INTO `sys_dictionary` VALUES ('440', '3004', '0', '一般贷款', '贷款类型/类别-0-一般贷款');
INSERT INTO `sys_dictionary` VALUES ('441', '3009', '1', '对公', '产品客户类型-1-对公');
INSERT INTO `sys_dictionary` VALUES ('442', '3009', '2', '个人', '产品客户类型-2-个人');
INSERT INTO `sys_dictionary` VALUES ('443', '3009', '3', '共同', '产品客户类型-3-共同');
INSERT INTO `sys_dictionary` VALUES ('444', '3005', '0', '前台业务员', '操作员类型-0-前台业务员');
INSERT INTO `sys_dictionary` VALUES ('445', '3005', '1', '部门管理人员', '操作员类型-1-部门管理人员');
INSERT INTO `sys_dictionary` VALUES ('446', '3005', '4', '总部管理人员', '操作员类型-4-总部管理人员');
INSERT INTO `sys_dictionary` VALUES ('447', '', '9', '开发管理人员', '操作员类型-9-开发管理人员');
INSERT INTO `sys_dictionary` VALUES ('448', '5605', '1', '贷款审批流程', '贷款审批流程');
INSERT INTO `sys_dictionary` VALUES ('449', '5606', '0', '开发者角色', null);
INSERT INTO `sys_dictionary` VALUES ('450', '5606', '1', '系统管理角色', null);
INSERT INTO `sys_dictionary` VALUES ('451', '5606', '2', '业务管理角色', null);
INSERT INTO `sys_dictionary` VALUES ('453', '3006', '3', '机构人员', null);
INSERT INTO `sys_dictionary` VALUES ('457', '1030', '1', '企业', null);
INSERT INTO `sys_dictionary` VALUES ('458', '1030', '2', '事业单位', null);
INSERT INTO `sys_dictionary` VALUES ('459', '1030', '3', '机关', '典当的业务品种');
INSERT INTO `sys_dictionary` VALUES ('460', '1030', '4', '社会团体', null);
INSERT INTO `sys_dictionary` VALUES ('461', '1030', '7', '个体工商户', null);
INSERT INTO `sys_dictionary` VALUES ('462', '1030', '9', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('467', '1130', '1', '租赁', null);
INSERT INTO `sys_dictionary` VALUES ('468', '1130', '2', '自购', null);
INSERT INTO `sys_dictionary` VALUES ('469', '1102', '5', '个体户', null);
INSERT INTO `sys_dictionary` VALUES ('470', '1102', '6', '合伙企业', null);
INSERT INTO `sys_dictionary` VALUES ('471', '1102', '7', '有限责任公司', null);
INSERT INTO `sys_dictionary` VALUES ('472', '1102', '8', '股份有限公司', null);
INSERT INTO `sys_dictionary` VALUES ('490', '1201', '1', '推荐', '1-推荐,2-续贷,3-主动营销,4-客户上门');
INSERT INTO `sys_dictionary` VALUES ('491', '1201', '2', '续贷', '1-推荐,2-续贷,3-主动营销,4-客户上门');
INSERT INTO `sys_dictionary` VALUES ('492', '1201', '3', '主动营销', '1-推荐,2-续贷,3-主动营销,4-客户上门');
INSERT INTO `sys_dictionary` VALUES ('493', '1201', '4', '客户上门', '1-推荐,2-续贷,3-主动营销,4-客户上门');
INSERT INTO `sys_dictionary` VALUES ('499', '1203', '0', '未审核', '0-未审核 1-审核通过 2-审核不通过');
INSERT INTO `sys_dictionary` VALUES ('500', '1203', '1', '审核通过', '0-未审核 1-审核通过 2-审核不通过');
INSERT INTO `sys_dictionary` VALUES ('501', '1203', '2', '审核不通过', '0-未审核 1-审核通过 2-审核不通过');
INSERT INTO `sys_dictionary` VALUES ('502', '1204', '0', '否', ' 0-否 1-是');
INSERT INTO `sys_dictionary` VALUES ('503', '1204', '1', '是', ' 0-否 1-是');
INSERT INTO `sys_dictionary` VALUES ('518', '1024', '1', '自有住房(无贷款)', null);
INSERT INTO `sys_dictionary` VALUES ('519', '1024', '2', '贷款购房', null);
INSERT INTO `sys_dictionary` VALUES ('520', '1024', '3', '亲属合住(无产权)', null);
INSERT INTO `sys_dictionary` VALUES ('521', '1024', '4', '共有住房', null);
INSERT INTO `sys_dictionary` VALUES ('522', '1024', '5', '租房', null);
INSERT INTO `sys_dictionary` VALUES ('523', '1024', '6', '集体宿舍', null);
INSERT INTO `sys_dictionary` VALUES ('524', '1025', '1', 'AAA', null);
INSERT INTO `sys_dictionary` VALUES ('525', '1025', '2', 'AA', null);
INSERT INTO `sys_dictionary` VALUES ('526', '1025', '3', 'A', null);
INSERT INTO `sys_dictionary` VALUES ('527', '1025', '4', 'BBB', null);
INSERT INTO `sys_dictionary` VALUES ('528', '1025', '5', 'BB', null);
INSERT INTO `sys_dictionary` VALUES ('529', '1025', '6', 'B', null);
INSERT INTO `sys_dictionary` VALUES ('530', '1025', '7', 'CCC', null);
INSERT INTO `sys_dictionary` VALUES ('531', '1025', '8', 'CC', null);
INSERT INTO `sys_dictionary` VALUES ('532', '1025', '9', 'C', null);
INSERT INTO `sys_dictionary` VALUES ('533', '1025', '10', 'D', null);
INSERT INTO `sys_dictionary` VALUES ('534', '1026', '1', '个人', null);
INSERT INTO `sys_dictionary` VALUES ('535', '1026', '2', '企业', null);
INSERT INTO `sys_dictionary` VALUES ('536', '2020', '1', '一般保证责任', null);
INSERT INTO `sys_dictionary` VALUES ('537', '2020', '2', '连带保证责任', null);
INSERT INTO `sys_dictionary` VALUES ('538', '1027', '1', '基本账户', null);
INSERT INTO `sys_dictionary` VALUES ('539', '1027', '2', '一般账户', null);
INSERT INTO `sys_dictionary` VALUES ('540', '1027', '3', '个人账户', null);
INSERT INTO `sys_dictionary` VALUES ('541', '1025', '11', '无', null);
INSERT INTO `sys_dictionary` VALUES ('550', '1131', '1', '不动产（房产）', null);
INSERT INTO `sys_dictionary` VALUES ('551', '1131', '2', '不动产（土地）', null);
INSERT INTO `sys_dictionary` VALUES ('552', '1131', '3', '动产（汽车）', null);
INSERT INTO `sys_dictionary` VALUES ('553', '1131', '4', '动产（设备）', null);
INSERT INTO `sys_dictionary` VALUES ('554', '1131', '5', '动产（其他）', null);
INSERT INTO `sys_dictionary` VALUES ('555', '1131', '6', '股权质押', null);
INSERT INTO `sys_dictionary` VALUES ('556', '1131', '7', '应收账款', null);
INSERT INTO `sys_dictionary` VALUES ('557', '1131', '8', '承兑汇票', null);
INSERT INTO `sys_dictionary` VALUES ('558', '1131', '9', '仓单', null);
INSERT INTO `sys_dictionary` VALUES ('559', '1130', '3', '自建', null);
INSERT INTO `sys_dictionary` VALUES ('560', '2004', '11', '个人住房贷款', null);
INSERT INTO `sys_dictionary` VALUES ('561', '2004', '12', '个人商用房（包括商住两用）贷款', null);
INSERT INTO `sys_dictionary` VALUES ('562', '2004', '13', '个人住房公积金贷款', null);
INSERT INTO `sys_dictionary` VALUES ('563', '2004', '21', '个人汽车消费贷款', null);
INSERT INTO `sys_dictionary` VALUES ('564', '2004', '31', '个人助学贷款', null);
INSERT INTO `sys_dictionary` VALUES ('565', '2004', '41', '个人经营性贷款', null);
INSERT INTO `sys_dictionary` VALUES ('566', '2004', '51', '农户贷款', null);
INSERT INTO `sys_dictionary` VALUES ('567', '2004', '71', '准贷记卡', null);
INSERT INTO `sys_dictionary` VALUES ('568', '2004', '81', '贷记卡', null);
INSERT INTO `sys_dictionary` VALUES ('569', '2004', '91', '个人消费贷款', null);
INSERT INTO `sys_dictionary` VALUES ('570', '2004', '99', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('571', '2011', '1', '质押（含保证金）', null);
INSERT INTO `sys_dictionary` VALUES ('572', '2011', '2', '抵押', null);
INSERT INTO `sys_dictionary` VALUES ('573', '2011', '3', '自然人保证', null);
INSERT INTO `sys_dictionary` VALUES ('574', '2011', '4', '信用/免担保', null);
INSERT INTO `sys_dictionary` VALUES ('575', '2011', '5', '组合（含自然人保证）', null);
INSERT INTO `sys_dictionary` VALUES ('576', '2011', '6', '组合（不含自然人保证）', null);
INSERT INTO `sys_dictionary` VALUES ('577', '2011', '7', '农户联保', null);
INSERT INTO `sys_dictionary` VALUES ('578', '2011', '9', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('579', '4000', '9', '未知', null);
INSERT INTO `sys_dictionary` VALUES ('580', '1001', 'A', '香港身份证', null);
INSERT INTO `sys_dictionary` VALUES ('581', '1001', 'B', '澳门身份证', null);
INSERT INTO `sys_dictionary` VALUES ('582', '1001', 'C', '台湾身份证', null);
INSERT INTO `sys_dictionary` VALUES ('583', '1028', '1', '仅是基本户客户', null);
INSERT INTO `sys_dictionary` VALUES ('584', '1028', '2', '仅是信贷户客户', null);
INSERT INTO `sys_dictionary` VALUES ('585', '1028', '3', '既是基本户又是信贷户的客户', null);
INSERT INTO `sys_dictionary` VALUES ('586', '1028', 'X', '未知', null);
INSERT INTO `sys_dictionary` VALUES ('587', '1029', '01', '工商注册号', null);
INSERT INTO `sys_dictionary` VALUES ('588', '1029', '02', '机关和事业单位登记号', null);
INSERT INTO `sys_dictionary` VALUES ('589', '1029', '03', '社会团体登记号', null);
INSERT INTO `sys_dictionary` VALUES ('590', '1029', '04', '民办非企业单位登记号', null);
INSERT INTO `sys_dictionary` VALUES ('591', '1029', '05', '基金会登记号', null);
INSERT INTO `sys_dictionary` VALUES ('592', '1029', '06', '宗教活动场所登记号', null);
INSERT INTO `sys_dictionary` VALUES ('593', '1029', '99', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('594', '1031', '10', '企业法人', null);
INSERT INTO `sys_dictionary` VALUES ('595', '1031', '13', '个人独资、合伙企业', null);
INSERT INTO `sys_dictionary` VALUES ('596', '1031', '14', '企业的分支机构', null);
INSERT INTO `sys_dictionary` VALUES ('597', '1031', '11', '其他企业', null);
INSERT INTO `sys_dictionary` VALUES ('598', '1031', '12', '农民专业合作社', null);
INSERT INTO `sys_dictionary` VALUES ('599', '1031', '20', '事业法人', null);
INSERT INTO `sys_dictionary` VALUES ('600', '1031', '21', '未登记的事业单位', null);
INSERT INTO `sys_dictionary` VALUES ('601', '1031', '24', '事业单位的分支机构', null);
INSERT INTO `sys_dictionary` VALUES ('602', '1031', '30', '机关法人', null);
INSERT INTO `sys_dictionary` VALUES ('603', '1031', '31', '机关的内设机构', null);
INSERT INTO `sys_dictionary` VALUES ('604', '1031', '32', '机关的下设机构', null);
INSERT INTO `sys_dictionary` VALUES ('605', '1031', '40', '社会团体法人', null);
INSERT INTO `sys_dictionary` VALUES ('606', '1031', '41', '社会团体分支机构', null);
INSERT INTO `sys_dictionary` VALUES ('607', '1031', '51', '民办非企业', null);
INSERT INTO `sys_dictionary` VALUES ('608', '1031', '52', '基金会', null);
INSERT INTO `sys_dictionary` VALUES ('609', '1031', '53', '居委会', null);
INSERT INTO `sys_dictionary` VALUES ('610', '1031', '54', '村委会', null);
INSERT INTO `sys_dictionary` VALUES ('611', '1031', '60', '律师事务所、司法鉴定所', null);
INSERT INTO `sys_dictionary` VALUES ('612', '1031', '61', '宗教活动场所', null);
INSERT INTO `sys_dictionary` VALUES ('613', '1031', '62', '境外在境内成立的组织机构', null);
INSERT INTO `sys_dictionary` VALUES ('614', '1031', '70', '个体工商户', null);
INSERT INTO `sys_dictionary` VALUES ('615', '1031', '99', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('618', '1104', '5', '微型企业', null);
INSERT INTO `sys_dictionary` VALUES ('619', '1032', '01', '企业法人', null);
INSERT INTO `sys_dictionary` VALUES ('620', '1032', '02', '企业非法人', null);
INSERT INTO `sys_dictionary` VALUES ('621', '1032', '03', '个体工商户', null);
INSERT INTO `sys_dictionary` VALUES ('622', '1032', '04', '事业单位', null);
INSERT INTO `sys_dictionary` VALUES ('623', '1032', '99', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('624', '1033', '10', '内资', null);
INSERT INTO `sys_dictionary` VALUES ('625', '1033', '11', '国有全资', null);
INSERT INTO `sys_dictionary` VALUES ('626', '1033', '12', '集体全资', null);
INSERT INTO `sys_dictionary` VALUES ('627', '1033', '13', '股份合作', null);
INSERT INTO `sys_dictionary` VALUES ('628', '1033', '14', '联营', null);
INSERT INTO `sys_dictionary` VALUES ('629', '1033', '15', '有限责任公司', null);
INSERT INTO `sys_dictionary` VALUES ('630', '1033', '16', '股份有限公司', null);
INSERT INTO `sys_dictionary` VALUES ('631', '1033', '17', '私有', null);
INSERT INTO `sys_dictionary` VALUES ('632', '1033', '19', '其它内资', null);
INSERT INTO `sys_dictionary` VALUES ('633', '1033', '20', '港澳台投资', null);
INSERT INTO `sys_dictionary` VALUES ('634', '1033', '21', '内地和港澳台投资', null);
INSERT INTO `sys_dictionary` VALUES ('635', '1033', '22', '内地和港澳台合作', null);
INSERT INTO `sys_dictionary` VALUES ('636', '1033', '23', '港澳台独资', null);
INSERT INTO `sys_dictionary` VALUES ('637', '1033', '24', '港澳台投资股份有限公司', null);
INSERT INTO `sys_dictionary` VALUES ('638', '1033', '29', '其他港澳台投资', null);
INSERT INTO `sys_dictionary` VALUES ('639', '1033', '30', '国外投资', null);
INSERT INTO `sys_dictionary` VALUES ('640', '1033', '31', '中外合资', null);
INSERT INTO `sys_dictionary` VALUES ('641', '1033', '32', '中外合作', null);
INSERT INTO `sys_dictionary` VALUES ('642', '1033', '33', '外资', null);
INSERT INTO `sys_dictionary` VALUES ('643', '1033', '34', '国外投资股份有限公司', null);
INSERT INTO `sys_dictionary` VALUES ('644', '1033', '39', '其他国外投资', null);
INSERT INTO `sys_dictionary` VALUES ('645', '1033', '90', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('646', '1034', '1', '正常', null);
INSERT INTO `sys_dictionary` VALUES ('647', '1034', '2', '久悬', null);
INSERT INTO `sys_dictionary` VALUES ('648', '1034', '3', '注销', null);
INSERT INTO `sys_dictionary` VALUES ('649', '1034', '4', '待审核', null);
INSERT INTO `sys_dictionary` VALUES ('650', '1034', '9', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('651', '1034', 'X', '未知', null);
INSERT INTO `sys_dictionary` VALUES ('652', '1035', '1', '正常', null);
INSERT INTO `sys_dictionary` VALUES ('653', '1035', '2', '注销', null);
INSERT INTO `sys_dictionary` VALUES ('654', '1035', '9', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('655', '1035', 'X', '未知', null);
INSERT INTO `sys_dictionary` VALUES ('656', '1132', '1', '流动资金贷款', null);
INSERT INTO `sys_dictionary` VALUES ('657', '1132', '2', '固定资产贷款', null);
INSERT INTO `sys_dictionary` VALUES ('658', '1132', '3', '境外筹资转贷', null);
INSERT INTO `sys_dictionary` VALUES ('659', '1132', '4', '买方信贷', null);
INSERT INTO `sys_dictionary` VALUES ('660', '1132', '5', '出口卖方信贷', null);
INSERT INTO `sys_dictionary` VALUES ('661', '1132', '6', '项目融资', null);
INSERT INTO `sys_dictionary` VALUES ('662', '1132', '7', '其他贷款', null);
INSERT INTO `sys_dictionary` VALUES ('663', '1133', '1', '新增贷款', null);
INSERT INTO `sys_dictionary` VALUES ('664', '1133', '2', '收回再贷', null);
INSERT INTO `sys_dictionary` VALUES ('665', '1133', '3', '借新还旧', null);
INSERT INTO `sys_dictionary` VALUES ('666', '1133', '4', '资产重组', null);
INSERT INTO `sys_dictionary` VALUES ('667', '1133', '5', '转入', null);
INSERT INTO `sys_dictionary` VALUES ('668', '1133', '9', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('669', '1134', '1', '自营贷款', null);
INSERT INTO `sys_dictionary` VALUES ('670', '1134', '2', '资金来源于金融机构的委托贷款', null);
INSERT INTO `sys_dictionary` VALUES ('671', '1134', '3', '特定贷款', null);
INSERT INTO `sys_dictionary` VALUES ('672', '1134', '4', '信托贷款', null);
INSERT INTO `sys_dictionary` VALUES ('673', '1134', '5', '资金来源于中央及地方政府的委托贷款', null);
INSERT INTO `sys_dictionary` VALUES ('674', '1134', '6', '资金来源于企事业单位的委托贷款', null);
INSERT INTO `sys_dictionary` VALUES ('675', '1134', '7', '资金来源于个人的委托贷款', null);
INSERT INTO `sys_dictionary` VALUES ('676', '2021', '1', '房产', null);
INSERT INTO `sys_dictionary` VALUES ('677', '2021', '2', '土地使用权(包含土地附着物)', null);
INSERT INTO `sys_dictionary` VALUES ('678', '2021', '3', '在建工程', null);
INSERT INTO `sys_dictionary` VALUES ('679', '2021', '4', '交通工具', null);
INSERT INTO `sys_dictionary` VALUES ('680', '2021', '5', '机器设备', null);
INSERT INTO `sys_dictionary` VALUES ('681', '2021', '6', '其他类', null);
INSERT INTO `sys_dictionary` VALUES ('682', '2022', '1', '存单', null);
INSERT INTO `sys_dictionary` VALUES ('683', '2022', '2', '票据', null);
INSERT INTO `sys_dictionary` VALUES ('684', '2022', '3', '保单', null);
INSERT INTO `sys_dictionary` VALUES ('685', '2022', '4', '国债', null);
INSERT INTO `sys_dictionary` VALUES ('686', '2022', '5', '股权/股票', null);
INSERT INTO `sys_dictionary` VALUES ('687', '2022', '6', '其他权利', null);
INSERT INTO `sys_dictionary` VALUES ('688', '1036', '20', '实际控制人', null);
INSERT INTO `sys_dictionary` VALUES ('689', '1036', '21', '控制本企业', null);
INSERT INTO `sys_dictionary` VALUES ('690', '1036', '22', '受本企业控制', null);
INSERT INTO `sys_dictionary` VALUES ('691', '1036', '23', '受同一企业控制', null);
INSERT INTO `sys_dictionary` VALUES ('692', '1036', '24', '其他关联企业', null);
INSERT INTO `sys_dictionary` VALUES ('693', '4001', '1', '出售', null);
INSERT INTO `sys_dictionary` VALUES ('694', '4001', '2', '出租', null);
INSERT INTO `sys_dictionary` VALUES ('695', '4001', '3', '资产重组', null);
INSERT INTO `sys_dictionary` VALUES ('696', '4001', '4', '委托处置', null);
INSERT INTO `sys_dictionary` VALUES ('697', '4001', '5', '债权转让', null);
INSERT INTO `sys_dictionary` VALUES ('698', '4001', '6', '债券置换', null);
INSERT INTO `sys_dictionary` VALUES ('699', '4001', '7', '诉讼追偿', null);
INSERT INTO `sys_dictionary` VALUES ('700', '4001', '8', '破产清偿', null);
INSERT INTO `sys_dictionary` VALUES ('701', '4001', '9', '其他', null);
INSERT INTO `sys_dictionary` VALUES ('702', '1037', '10', '年报', null);
INSERT INTO `sys_dictionary` VALUES ('703', '1037', '20', '上半年', null);
INSERT INTO `sys_dictionary` VALUES ('704', '1037', '30', '下半年', null);
INSERT INTO `sys_dictionary` VALUES ('705', '1037', '40', '第一季度', null);
INSERT INTO `sys_dictionary` VALUES ('706', '1037', '50', '第二季度', null);
INSERT INTO `sys_dictionary` VALUES ('707', '1037', '60', '第三季度', null);
INSERT INTO `sys_dictionary` VALUES ('708', '1037', '70', '第四季度', null);
INSERT INTO `sys_dictionary` VALUES ('709', '1038', '1', '期初数', null);
INSERT INTO `sys_dictionary` VALUES ('710', '1038', '2', '期末数', null);
INSERT INTO `sys_dictionary` VALUES ('711', '1039', '1', '本部报表', null);
INSERT INTO `sys_dictionary` VALUES ('712', '1039', '2', '合并报表', null);
INSERT INTO `sys_dictionary` VALUES ('713', '1039', '9', '未知', null);
INSERT INTO `sys_dictionary` VALUES ('714', '1135', '0', '实际控制人', null);
INSERT INTO `sys_dictionary` VALUES ('715', '1135', '1', '董事长', null);
INSERT INTO `sys_dictionary` VALUES ('716', '1135', '2', '总经理/主要负责人', null);
INSERT INTO `sys_dictionary` VALUES ('717', '1135', '3', '财务负责人', null);
INSERT INTO `sys_dictionary` VALUES ('718', '1135', '4', '监事长', null);
INSERT INTO `sys_dictionary` VALUES ('719', '1135', '5', '法定代表人', null);
INSERT INTO `sys_dictionary` VALUES ('720', '5606', '3', '前台会员', null);

-- ----------------------------
-- Table structure for `sys_dictype`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictype`;
CREATE TABLE `sys_dictype` (
  `CODE` varchar(4) NOT NULL COMMENT '字典类型编号',
  `NAME` varchar(50) NOT NULL COMMENT '字典类型名称',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '字典备注说明',
  `FLAG` varchar(1) NOT NULL COMMENT '字典使用标识，是否使用',
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='*系统字典表类型';

-- ----------------------------
-- Records of sys_dictype
-- ----------------------------
INSERT INTO `sys_dictype` VALUES ('1000', '字典状态', '字典是否在使用，1：是 2：否', '1');
INSERT INTO `sys_dictype` VALUES ('1001', '证件类型', '按公安部规定，18位身份证号码的最后一位只能为0-9和“X”，商业银行在提取证件号码时，如果发现身份证的最后一位为小写字母“x”，应该统一用大写字母“X”替代。', '1');
INSERT INTO `sys_dictype` VALUES ('1002', '性别', null, '1');
INSERT INTO `sys_dictype` VALUES ('1003', '婚姻状况', null, '1');
INSERT INTO `sys_dictype` VALUES ('1004', '最高学历', null, '1');
INSERT INTO `sys_dictype` VALUES ('1005', '最高学位', null, '1');
INSERT INTO `sys_dictype` VALUES ('1006', '职业', null, '1');
INSERT INTO `sys_dictype` VALUES ('1007', '单位所属行业', null, '1');
INSERT INTO `sys_dictype` VALUES ('1008', '职务', null, '1');
INSERT INTO `sys_dictype` VALUES ('1009', '职称', null, '1');
INSERT INTO `sys_dictype` VALUES ('1010', '居住状况', '无法填报中，统一选“未知”填充', '1');
INSERT INTO `sys_dictype` VALUES ('1011', '政治面貌', null, '1');
INSERT INTO `sys_dictype` VALUES ('1012', '民族', null, '1');
INSERT INTO `sys_dictype` VALUES ('1013', '个人健康状况', null, '1');
INSERT INTO `sys_dictype` VALUES ('1014', '户口性质', null, '1');
INSERT INTO `sys_dictype` VALUES ('1015', '个人客户评分模式', null, '1');
INSERT INTO `sys_dictype` VALUES ('1016', '是否本公司员工', null, '1');
INSERT INTO `sys_dictype` VALUES ('1017', '是否本公司股东', null, '1');
INSERT INTO `sys_dictype` VALUES ('1018', '与客户关系', null, '1');
INSERT INTO `sys_dictype` VALUES ('1019', '职务级别', null, '1');
INSERT INTO `sys_dictype` VALUES ('1020', '单位性质', null, '1');
INSERT INTO `sys_dictype` VALUES ('1021', '主要供养人口', null, '1');
INSERT INTO `sys_dictype` VALUES ('1022', '与本公司关系', null, '1');
INSERT INTO `sys_dictype` VALUES ('1023', '客户类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('1024', '住宅性质', '住宅性质(1,自有住房(无贷款) 2,贷款购房  3 亲属合住(无产权))  4共有住房 5 租房   6 集体宿舍', '1');
INSERT INTO `sys_dictype` VALUES ('1025', '信用等级', '', '1');
INSERT INTO `sys_dictype` VALUES ('1026', '股东类型', '', '1');
INSERT INTO `sys_dictype` VALUES ('1027', '账户类型', '', '1');
INSERT INTO `sys_dictype` VALUES ('1028', '企业客户类型', '对应人行征信企业基础信息客户类型', '1');
INSERT INTO `sys_dictype` VALUES ('1029', '企业登记注册号类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('1030', '组织机构类别', null, '1');
INSERT INTO `sys_dictype` VALUES ('1031', '组织机构类别细分', null, '1');
INSERT INTO `sys_dictype` VALUES ('1032', '借款人性质', null, '1');
INSERT INTO `sys_dictype` VALUES ('1033', '经济类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('1034', '基本户状态', null, '1');
INSERT INTO `sys_dictype` VALUES ('1035', '机构状态', null, '1');
INSERT INTO `sys_dictype` VALUES ('1036', '企业关联类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('1037', '报表类型大类', null, '1');
INSERT INTO `sys_dictype` VALUES ('1038', '报表类型小类', null, '1');
INSERT INTO `sys_dictype` VALUES ('1039', '报表类型细分', null, '1');
INSERT INTO `sys_dictype` VALUES ('1101', '客户类别', null, '1');
INSERT INTO `sys_dictype` VALUES ('1102', '企业性质', null, '1');
INSERT INTO `sys_dictype` VALUES ('1103', '登记注册类型', '企业申办营业执照时的登记注册类型', '1');
INSERT INTO `sys_dictype` VALUES ('1104', '企业规模', null, '1');
INSERT INTO `sys_dictype` VALUES ('1105', '行业分类', '参照国标《国民经济行业分类》（GB/T4754―2002），细化到中类或以下', '1');
INSERT INTO `sys_dictype` VALUES ('1106', '集团客户标志', null, '1');
INSERT INTO `sys_dictype` VALUES ('1107', '进出口标志', null, '1');
INSERT INTO `sys_dictype` VALUES ('1108', '上市公司标志', null, '1');
INSERT INTO `sys_dictype` VALUES ('1109', '对公客户评分模式', null, '1');
INSERT INTO `sys_dictype` VALUES ('1110', '上市地', null, '1');
INSERT INTO `sys_dictype` VALUES ('1111', '经营场地所有权', null, '1');
INSERT INTO `sys_dictype` VALUES ('1112', '与本公司业务往来关系', null, '1');
INSERT INTO `sys_dictype` VALUES ('1113', '高管人员类别', null, '1');
INSERT INTO `sys_dictype` VALUES ('1114', '家族关系', null, '1');
INSERT INTO `sys_dictype` VALUES ('1115', '房屋土地资产类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('1116', '房屋土地购置情况', null, '1');
INSERT INTO `sys_dictype` VALUES ('1117', '房屋土地使用情况', null, '1');
INSERT INTO `sys_dictype` VALUES ('1118', '社会保险类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('1119', '商业保险类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('1120', '车辆种类', null, '1');
INSERT INTO `sys_dictype` VALUES ('1121', '车辆购买情况', null, '1');
INSERT INTO `sys_dictype` VALUES ('1122', '车辆使用状态', null, '1');
INSERT INTO `sys_dictype` VALUES ('1123', '税种', null, '1');
INSERT INTO `sys_dictype` VALUES ('1124', '黑名单等级', null, '1');
INSERT INTO `sys_dictype` VALUES ('1125', '生效状态', null, '1');
INSERT INTO `sys_dictype` VALUES ('1126', '币种', '参见GB/T 12406－1996《表示货币和资金的代码》', '1');
INSERT INTO `sys_dictype` VALUES ('1127', '国别', null, '1');
INSERT INTO `sys_dictype` VALUES ('1128', '无形资产类型', '', '1');
INSERT INTO `sys_dictype` VALUES ('1129', '企业证件类型', '营业执照', '1');
INSERT INTO `sys_dictype` VALUES ('1130', '经营场地所有权', '经营场地所有权', '2');
INSERT INTO `sys_dictype` VALUES ('1131', '资产类别', null, '1');
INSERT INTO `sys_dictype` VALUES ('1132', '贷款业务种类', null, '1');
INSERT INTO `sys_dictype` VALUES ('1133', '贷款形式', null, '1');
INSERT INTO `sys_dictype` VALUES ('1134', '贷款性质', null, '1');
INSERT INTO `sys_dictype` VALUES ('1135', '关系人类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('1201', '客户来源', '记录贷款意向客户来源', '1');
INSERT INTO `sys_dictype` VALUES ('1203', '审批状态', '贷款意向审批状态0-未审核 1-审核通过 2-审核不通过\n', '1');
INSERT INTO `sys_dictype` VALUES ('1204', '是否黑名单', '贷款意向  黑名单 0-否 1-是', '1');
INSERT INTO `sys_dictype` VALUES ('2000', '发生类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('2001', '还款方式', null, '1');
INSERT INTO `sys_dictype` VALUES ('2002', '计息方式', null, '1');
INSERT INTO `sys_dictype` VALUES ('2003', '期限种类', null, '1');
INSERT INTO `sys_dictype` VALUES ('2004', '业务种类细分', '贷款种类', '1');
INSERT INTO `sys_dictype` VALUES ('2005', '利率类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('2006', '固定利息提前收取', '已隐藏', '1');
INSERT INTO `sys_dictype` VALUES ('2007', '担保方式', null, '1');
INSERT INTO `sys_dictype` VALUES ('2008', '担保类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('2009', '合同性质', null, '1');
INSERT INTO `sys_dictype` VALUES ('2010', '申请用途', null, '1');
INSERT INTO `sys_dictype` VALUES ('2011', '担保方式（人行）', '上报人行对应的担保方式', '1');
INSERT INTO `sys_dictype` VALUES ('2012', '评估方法', null, '1');
INSERT INTO `sys_dictype` VALUES ('2014', '土地使用权类型', null, '1');
INSERT INTO `sys_dictype` VALUES ('2015', '是否补录它项权证', null, '1');
INSERT INTO `sys_dictype` VALUES ('2016', '贷款业务品种', null, '1');
INSERT INTO `sys_dictype` VALUES ('2017', '开办部门', null, '1');
INSERT INTO `sys_dictype` VALUES ('2018', '支付方式', null, '1');
INSERT INTO `sys_dictype` VALUES ('2019', '还款状态', null, '1');
INSERT INTO `sys_dictype` VALUES ('2020', '保证合同类型', '', '1');
INSERT INTO `sys_dictype` VALUES ('2021', '抵押物种类', null, '1');
INSERT INTO `sys_dictype` VALUES ('2022', '质押物种类', null, '1');
INSERT INTO `sys_dictype` VALUES ('3002', '员工状态', '在职/试用/离职', '1');
INSERT INTO `sys_dictype` VALUES ('3003', '客户经理级别', '一星/二星/三星/四星/五星', '1');
INSERT INTO `sys_dictype` VALUES ('3004', '贷款类型', '一般贷款', '1');
INSERT INTO `sys_dictype` VALUES ('3005', '操作员类型', '操作员类型-前台/管理/开发', '1');
INSERT INTO `sys_dictype` VALUES ('3009', '产品客户类型', '对公/个人/公用', '1');
INSERT INTO `sys_dictype` VALUES ('4000', '五级贷款分类', '五个级别分类', '1');
INSERT INTO `sys_dictype` VALUES ('4001', '不良资产处置', null, '1');
INSERT INTO `sys_dictype` VALUES ('5201', '凭证类型', '', '1');
INSERT INTO `sys_dictype` VALUES ('5600', '股东状态', '1——不持股\r\n2——持股', '1');
INSERT INTO `sys_dictype` VALUES ('5601', '股东证件类型', '1——身份证\n2——营业执照', '1');
INSERT INTO `sys_dictype` VALUES ('5602', '股东类别', '1——自然人资本\n2——法人资本', '1');
INSERT INTO `sys_dictype` VALUES ('5603', '股权性质', '1——个人股\n2——法人股3——法人股国家股\n4——外资股', '1');
INSERT INTO `sys_dictype` VALUES ('5604', '出资形式', '1——货币出资\n2——实物出资\n3——工业产权出资\n4——非专利出资\n5——土地使用权出资\n6——专利出资\n7——其他出资', '1');
INSERT INTO `sys_dictype` VALUES ('5605', '贷款流程类型', '审批流程的类型', '1');
INSERT INTO `sys_dictype` VALUES ('5606', ' 角色类型', null, '1');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mehtoddescription` varchar(250) DEFAULT NULL COMMENT '方法描述',
  `exceptionCode` varchar(350) DEFAULT NULL COMMENT '异常代码',
  `logtype` varchar(150) DEFAULT NULL COMMENT '日志类型 0正常 1 异常',
  `exceptionDetail` varchar(4000) DEFAULT NULL COMMENT '异常信息',
  `method` varchar(150) DEFAULT NULL COMMENT '方法',
  `params` varchar(400) DEFAULT NULL COMMENT '参数',
  `cmpno` varchar(30) DEFAULT NULL COMMENT '公司ID',
  `userno` varchar(20) DEFAULT NULL COMMENT '操作人',
  `createDate` varchar(20) DEFAULT NULL COMMENT '创建日期',
  `requestIp` varchar(20) DEFAULT NULL COMMENT '请求ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '用户登录系统', null, '1', '系统登录尝试,admin密码错误!', 'LoginController-->login', 'admin;a', null, null, '2017-04-19 00:14:35', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('2', '用户登录系统', null, '1', '系统登录尝试,admin密码错误!', 'LoginController-->login', 'admin;a', null, null, '2017-04-19 00:14:37', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('3', '用户登录系统', null, '1', '系统登录尝试,admin密码错误!', 'LoginController-->login', 'admin;a', null, null, '2017-04-19 00:14:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('4', '用户登录系统', null, '1', '系统登录尝试,admin密码错误!', 'LoginController-->login', 'admin;a', null, null, '2017-04-19 00:14:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('5', '用户登录系统', null, '0', null, 'LoginController-->login', 'admin;1', null, '1000', '2017-04-19 00:14:56', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('6', '跳到系统设置列表页面', null, '0', null, 'com.ez.system.controller.SysOptionController.list()', null, null, '1000', '2017-04-19 00:15:00', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('7', '跳到分页查询系统设置信息', null, '0', null, 'com.ez.system.controller.SysOptionController.showlist()', null, null, '1000', '2017-04-19 00:15:00', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('8', '跳到分页查询系统设置信息', null, '0', null, 'com.ez.system.controller.SysOptionController.showlist()', null, null, '1000', '2017-04-19 00:15:21', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('9', '跳到分页查询系统设置信息', null, '0', null, 'com.ez.system.controller.SysOptionController.showlist()', null, null, '1000', '2017-04-19 00:15:24', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('10', '用户登录系统', null, '0', null, 'LoginController-->login', 'admin;1', null, '1000', '2017-04-19 14:02:35', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('11', '跳到系统设置列表页面', null, '0', null, 'com.ez.system.controller.SysOptionController.list()', null, null, '1000', '2017-04-19 14:03:06', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('12', '跳到分页查询系统设置信息', null, '0', null, 'com.ez.system.controller.SysOptionController.showlist()', null, null, '1000', '2017-04-19 14:03:07', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('13', '跳到查询&修改系统设置单条记录页面', null, '0', null, 'com.ez.system.controller.SysOptionController.getById()', null, null, '1000', '2017-04-19 14:03:12', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('14', '跳到系统设置列表页面', null, '0', null, 'com.ez.system.controller.SysOptionController.list()', null, null, '1000', '2017-04-19 14:03:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('15', '跳到分页查询系统设置信息', null, '0', null, 'com.ez.system.controller.SysOptionController.showlist()', null, null, '1000', '2017-04-19 14:03:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('16', '跳到分页查询系统设置信息', null, '0', null, 'com.ez.system.controller.SysOptionController.showlist()', null, null, '1000', '2017-04-19 14:03:40', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('17', '跳到系统设置新增页面', null, '0', null, 'com.ez.system.controller.SysOptionController.addUI()', null, null, '1000', '2017-04-19 14:03:41', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('18', '保存系统设置新增信息', null, '0', null, 'com.ez.system.controller.SysOptionController.add()', null, null, '1000', '2017-04-19 14:03:49', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('19', '保存系统设置异常', 'org.springframework.jdbc.BadSqlGrammarException', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may involve com.ez.system.dao.SysOptionDao.add-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_option        ( optionValue,             optionName )      values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', 'com.ez.system.service.impl.SysOptionServiceImpl.add()', 'class com.ez.system.entity.SysOption;', null, '1000', '2017-04-19 02:10:47', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('20', '用户登录系统', null, '0', null, 'LoginController-->login', 'admin;1', null, '1000', '2017-04-19 14:45:23', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('21', '跳到系统设置列表页面', null, '0', null, 'com.ez.system.controller.SysOptionController.list()', null, null, '1000', '2017-04-19 14:45:28', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('22', '跳到分页查询系统设置信息', null, '0', null, 'com.ez.system.controller.SysOptionController.showlist()', null, null, '1000', '2017-04-19 14:45:29', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('23', '跳到系统设置新增页面', null, '0', null, 'com.ez.system.controller.SysOptionController.addUI()', null, null, '1000', '2017-04-19 14:45:30', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('24', '保存系统设置新增信息', null, '0', null, 'com.ez.system.controller.SysOptionController.add()', null, null, '1000', '2017-04-19 14:45:33', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('25', '保存异常', 'org.springframework.jdbc.BadSqlGrammarException', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may involve com.ez.system.dao.SysOptionDao.add-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_option        ( optionValue,             optionName )      values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', 'com.ez.system.service.impl.SysOptionServiceImpl.add()', 'class com.ez.system.entity.SysOption;', null, '1000', '2017-04-19 02:49:18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('26', '用户登录系统', null, '0', null, 'LoginController-->login', 'admin;1', null, '1000', '2017-04-19 17:24:18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('27', '跳到系统设置列表页面', null, '0', null, 'com.ez.system.controller.SysOptionController.list()', null, null, '1000', '2017-04-19 17:24:23', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('28', '跳到分页查询系统设置信息', null, '0', null, 'com.ez.system.controller.SysOptionController.showlist()', null, null, '1000', '2017-04-19 17:24:24', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('29', '跳到系统设置新增页面', null, '0', null, 'com.ez.system.controller.SysOptionController.addUI()', null, null, '1000', '2017-04-19 17:24:26', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('30', '保存系统设置新增信息', null, '0', null, 'com.ez.system.controller.SysOptionController.add()', null, null, '1000', '2017-04-19 17:24:49', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('31', '保存com.ez.system.service.impl.SysOptionServiceImpl异常', 'org.springframework.jdbc.BadSqlGrammarException', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may involve com.ez.system.dao.SysOptionDao.add-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_option        ( optionValue,             optionName )      values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', 'com.ez.system.service.impl.SysOptionServiceImpl.add()', 'class com.ez.system.entity.SysOption;', null, '1000', '2017-04-19 05:27:05', '127.0.0.1');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单主键',
  `MENU_NAME` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `MENU_URL` varchar(255) DEFAULT NULL COMMENT '菜单地址',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '父级ID',
  `MENU_ORDER` varchar(100) DEFAULT NULL COMMENT '菜单顺序',
  `MENU_ICON` varchar(30) DEFAULT NULL COMMENT '菜单图标',
  `MENU_TYPE` varchar(10) DEFAULT NULL COMMENT '菜单类型 0-开发 1-系统 2-业务',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='*系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '开发管理', '#', '0', '1', 'fa-laptop', '0');
INSERT INTO `sys_menu` VALUES ('2', '系统字典', '#', '1', '1', 'fa-desktop', '0');
INSERT INTO `sys_menu` VALUES ('3', '字典类型', 'ez/system/sysdictype/list.do', '2', '1', 'fa-caret-right', '0');
INSERT INTO `sys_menu` VALUES ('4', '字典名称', 'ez/system/sysdictionary/list.do', '2', '2', 'fa-caret-right', '0');
INSERT INTO `sys_menu` VALUES ('5', '菜单管理', '#', '1', '2', 'fa-list', '0');
INSERT INTO `sys_menu` VALUES ('6', '菜单维护', 'ez/system/sysmenu/list.do', '5', '1', 'fa-caret-right', '0');
INSERT INTO `sys_menu` VALUES ('7', '系统工具', '#', '1', '3', 'fa-th', '0');
INSERT INTO `sys_menu` VALUES ('8', '性能测试', 'druid/index.html', '7', '1', 'fa-caret-right', '0');
INSERT INTO `sys_menu` VALUES ('9', '系统管理', '#', '0', '2', 'fa-wrench', '1');
INSERT INTO `sys_menu` VALUES ('10', '系统管理', '#', '9', '1', 'fa-wrench', '1');
INSERT INTO `sys_menu` VALUES ('11', '系统参数', 'ez/system/syscompany/list.do', '10', '1', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('12', '系统日志', 'ez/system/syslog/list.do', '10', '2', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('13', '组织管理', '#', '9', '2', 'fa-sitemap', '1');
INSERT INTO `sys_menu` VALUES ('14', '组织设置', 'ez/system/sysorg/list.do', '13', '1', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('15', '角色管理', '#', '9', '3', ' fa-reddit', '1');
INSERT INTO `sys_menu` VALUES ('16', '角色设置', 'ez/system/sysrole/list.do', '15', '1', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('17', '用户管理', '#', '9', '4', 'fa-users', '1');
INSERT INTO `sys_menu` VALUES ('18', '会员管理', '#', '9', '5', 'fa-address-book', '1');
INSERT INTO `sys_menu` VALUES ('19', '流程管理', '#', '0', '3', 'fa-exchange', '1');
INSERT INTO `sys_menu` VALUES ('20', '用户设置', 'ez/system/sysuser/list/1.do', '17', '1', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('21', '会员设置', 'ez/system/sysuser/list/0.do', '18', '1', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('22', '流程设计', '#', '19', '1', 'fa-list', '1');
INSERT INTO `sys_menu` VALUES ('23', '流程图', 'ez/sysflow/list.do', '22', '1', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('24', '流程节点', 'ez/sysflowpoint/list.do', '22', '1', 'fa-caret-right', '1');
INSERT INTO `sys_menu` VALUES ('26', '系统参数', 'ez/system/sysoption/list.do', '7', '2', 'fa-caret-right', '0');

-- ----------------------------
-- Table structure for `sys_option`
-- ----------------------------
DROP TABLE IF EXISTS `sys_option`;
CREATE TABLE `sys_option` (
  `oId` varchar(63) NOT NULL COMMENT '参数id',
  `optionValue` text COMMENT '参数值',
  `optionName` varchar(100) DEFAULT NULL COMMENT '参数名称',
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='*系统设置';

-- ----------------------------
-- Records of sys_option
-- ----------------------------
INSERT INTO `sys_option` VALUES ('systemName', 'ezadmin管理系统', '后台系统名称');

-- ----------------------------
-- Table structure for `sys_org`
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `orgId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orgName` varchar(128) NOT NULL DEFAULT '' COMMENT '组织名称',
  `orgDescription` varchar(255) DEFAULT '' COMMENT '组织节点描述',
  `orgManager` varchar(30) DEFAULT NULL COMMENT '组织负责人id',
  `orgPhone` varchar(255) DEFAULT '' COMMENT '组织联系电话',
  `orgParentid` int(11) DEFAULT NULL COMMENT '上级组织的ID，顶级节点的ID为0',
  `orgEstablishTime` datetime DEFAULT NULL COMMENT '成立时间',
  `orgPath` varchar(512) DEFAULT '' COMMENT '从根节点到该节点的路径；默认根节点的值为0；节点间的分割符为“-”',
  `orgType` int(11) DEFAULT NULL COMMENT '组织类型',
  PRIMARY KEY (`orgId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='*组织结构表';

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('1', '安徽新华数据有限公司', '', '1000', '05513699088', '0', '2012-09-02 00:00:00', '0-1', '0');
INSERT INTO `sys_org` VALUES ('7', '客服部', '', '2000', '055136969055', '1', '2014-10-28 18:05:27', '0-1-7', '1');
INSERT INTO `sys_org` VALUES ('8', '研发部', '', '201703170021049600', '', '1', '2014-11-22 16:08:23', '0-1-8', '1');
INSERT INTO `sys_org` VALUES ('18', '财务部', '', null, '', '1', '2017-03-22 23:36:26', '0-1-18', null);
INSERT INTO `sys_org` VALUES ('19', '公司客户会员', '', '2000', '', '0', null, '0-19', '0');

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
INSERT INTO `sys_right` VALUES ('2c6eb574783e455586c22b609a218298', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('a99883e414e2411d888666693de9c42c', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('ac66961adaa2426da4470c72ffeec117', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('bd90b837805a4bad918f6f01c0b3ab39', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('c4d64f7f445446f9bbe9abab7b6544d5', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right` VALUES ('db8571bc865b459db0eb804ee9937ad2', '0', '0', '0', '0', '0', '0', '0', '0');
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
INSERT INTO `sys_right_gl` VALUES ('2c6eb574783e455586c22b609a218298', '2c6eb574783e455586c22b609a218298', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('a99883e414e2411d888666693de9c42c', '1', '1', '1', '1', '1', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('ac66961adaa2426da4470c72ffeec117', '1', '1', '0', '1', '1', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('bd90b837805a4bad918f6f01c0b3ab39', 'bd90b837805a4bad918f6f01c0b3ab39', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('c4d64f7f445446f9bbe9abab7b6544d5', 'c4d64f7f445446f9bbe9abab7b6544d5', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('db8571bc865b459db0eb804ee9937ad2', 'db8571bc865b459db0eb804ee9937ad2', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_right_gl` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '7', '1', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_TYPE` varchar(100) DEFAULT NULL COMMENT '角色类型',
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
INSERT INTO `sys_role` VALUES ('1', '开发管理员', '268435454', '0', '33554430', '33554430', '33554430', '33554430', '1');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '33553920', '1', '33553920', '33553920', '33553920', '33553920', '2');
INSERT INTO `sys_role` VALUES ('2c6eb574783e455586c22b609a218298', '前台黄金会员', '2359808', '3', '1', '1', '1', '1', '2c6eb574783e455586c22b609a218298');
INSERT INTO `sys_role` VALUES ('bd90b837805a4bad918f6f01c0b3ab39', '测试系统管理员角色', '65806334', '1', '2367006', '1', '2366976', '1', 'bd90b837805a4bad918f6f01c0b3ab39');
INSERT INTO `sys_role` VALUES ('c4d64f7f445446f9bbe9abab7b6544d5', '前台白银会员', '2359808', '3', '1', '1', '1', '1', 'c4d64f7f445446f9bbe9abab7b6544d5');
INSERT INTO `sys_role` VALUES ('db8571bc865b459db0eb804ee9937ad2', '系统操作员', '4193792', '2', '1', '1', '1', '1', 'db8571bc865b459db0eb804ee9937ad2');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USERNO` varchar(30) NOT NULL COMMENT '用户编号',
  `LOGNM` varchar(50) NOT NULL COMMENT '登陆账户',
  `LOGPWD` varchar(50) NOT NULL COMMENT '登陆密码',
  `DPTNO` varchar(30) DEFAULT NULL COMMENT '所属部门编号',
  `DPTNM` varchar(30) DEFAULT NULL COMMENT '所属部门名称',
  `RLID` varchar(100) DEFAULT NULL COMMENT '角色编号',
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
  `LASTLOGIN` varchar(255) DEFAULT NULL COMMENT '最近一次登陆时间',
  `LOGINIP` varchar(100) DEFAULT NULL COMMENT '登陆iP',
  `LOGINLOCATION` varchar(200) DEFAULT NULL COMMENT '登陆地区',
  PRIMARY KEY (`USERNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='*系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1000', 'admin', '1', '0', '组织机构树', '1', '开发管理员', '陈恩泽', null, '18654177028', null, null, '1', '1', '150', '20161020', null, '2017-04-19 17:24:18', '127.0.0.1', null);
INSERT INTO `sys_user` VALUES ('2000', 'zhangsan', '1', '1', '北京新华安徽数据服务有限公司', '2', '超级管理员', '张三', null, null, null, null, '1', '1', '150', '20161101', null, '2017-03-25 22:45:39', '127.0.0.1', null);
INSERT INTO `sys_user` VALUES ('201703170021049600', 'lisi', '1', '1', '北京新华安徽数据服务有限公司', 'db8571bc865b459db0eb804ee9937ad2', '系统操作员', '李四', null, null, null, null, '1', '1', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('201703170022271141', 'wangwu', '1', '19', '公司客户会员', '2c6eb574783e455586c22b609a218298', '前台黄金会员', '王五', null, null, null, null, '0', '1', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('201703170023084722', 'chenliu', '1', '19', '公司客户会员', 'c4d64f7f445446f9bbe9abab7b6544d5', '前台白银会员', '陈六', null, null, null, null, '0', '1', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('201703171629129590', 'test', '1', '18', '财务部', 'bd90b837805a4bad918f6f01c0b3ab39', '测试系统管理员角色', '测试', null, null, null, null, '1', '1', null, '2017-03-25', null, null, null, null);

-- ----------------------------
-- Procedure structure for `getbyid`
-- ----------------------------
DROP PROCEDURE IF EXISTS `getbyid`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getbyid`(IN `n` varchar(20),OUT `i` int)
BEGIN
	#Routine body goes here...
	DECLARE a int;
	SELECT id INTO a FROM sys_log WHERE logtype=n;
	set i=a;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `getUserInfo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `getUserInfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserInfo`(in date_day datetime)
BEGIN
declare _userName varchar(12); -- 用户名
declare _chinese int ; -- 语文
declare _math int ;    -- 数学
declare done int;
-- 定义游标
DECLARE rs_cursor CURSOR FOR SELECT username,chinese,math from userInfo where datediff(createDate, date_day)=0;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
-- 获取昨天的日期
if date_day is null then
   set date_day = date_add(now(),interval -1 day);
end if;
open rs_cursor; 
cursor_loop:loop
   FETCH rs_cursor into _userName, _chinese, _math; -- 取数据

   if done=1 then
    leave cursor_loop;
   end if;
   -- 更新表
   update infoSum set total=_chinese+_math where UserName=_userName;
end loop cursor_loop;
close rs_cursor;

    END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `TEST`
-- ----------------------------
DROP PROCEDURE IF EXISTS `TEST`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TEST`(IN N CHAR(20))
BEGIN
	IF N IS NULL OR N="" THEN
	SELECT * FROM sys_menu;
  ELSE
  SELECT * FROM sys_menu WHERE menu_name LIKE n;
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getPriority`
-- ----------------------------
DROP FUNCTION IF EXISTS `getPriority`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getPriority`(inID INT) RETURNS varchar(255) CHARSET utf8
    DETERMINISTIC
begin
    DECLARE gParentID INT DEFAULT 0;
		DECLARE gOderID INT DEFAULT 0;
    DECLARE gPriority VARCHAR(255) DEFAULT '';
   
    SELECT PARENT_ID,MENU_ORDER INTO gParentID,gOderID FROM sys_menu WHERE MENU_ID = inID;

		if gParentID > 0 then 
			SET gPriority = CONCAT(gOderID,inID);
		else 
			SET gPriority = inID;
		end if;		
		 
		WHILE gParentID > 0 DO  /*0为根*/
      SET gPriority = CONCAT(gParentID, '.', gPriority);
      SELECT PARENT_ID INTO gParentID FROM sys_menu WHERE MENU_ID = gParentID;
    END WHILE;
    RETURN gPriority;
  end
;;
DELIMITER ;
