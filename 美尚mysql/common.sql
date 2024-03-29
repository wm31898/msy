/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 50624
Source Host           : 120.79.201.125:3306
Source Database       : common

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-08-21 16:55:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `user_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `consignee` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人',
  `detail_address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `tel_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '座机电话',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机电话',
  `is_default` tinyint(3) NOT NULL DEFAULT '0' COMMENT '1默认收货地址',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `province` varchar(200) NOT NULL DEFAULT '0' COMMENT '省',
  `city` varchar(200) NOT NULL DEFAULT '0' COMMENT '市',
  `area` varchar(200) NOT NULL DEFAULT '0' COMMENT '区',
  PRIMARY KEY (`id`),
  KEY `member_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='买家地址信息表';

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('92', '65', '小红', '20', '', '13430393577', '0', '0', '13', '1', '1');
INSERT INTO `address` VALUES ('93', '65', '小丹', '30号', '', '13688885555', '1', '0', '8', '0', '0');
INSERT INTO `address` VALUES ('94', '65', '武松打虎', '8号', '', '13430398888', '0', '0', '8', '0', '0');
INSERT INTO `address` VALUES ('95', '55', '11', '11', '', '15914540659', '1', '0', '2', '2', '2');
INSERT INTO `address` VALUES ('96', '65', '阿牛111', '18', '', '13522221111', '0', '0', '9', '1', '1');

-- ----------------------------
-- Table structure for address_c
-- ----------------------------
DROP TABLE IF EXISTS `address_c`;
CREATE TABLE `address_c` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `user_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `consignee` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人',
  `detail_address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `tel_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '座机电话',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机电话',
  `is_default` tinyint(3) NOT NULL DEFAULT '0' COMMENT '1默认收货地址',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `province` varchar(200) NOT NULL DEFAULT '0' COMMENT '省',
  `city` varchar(200) NOT NULL DEFAULT '0' COMMENT '市',
  `area` varchar(200) NOT NULL DEFAULT '0' COMMENT '区',
  PRIMARY KEY (`id`),
  KEY `member_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='vue版买家地址信息表';

-- ----------------------------
-- Records of address_c
-- ----------------------------
INSERT INTO `address_c` VALUES ('184', '65', '阿森纳', '河北省唐山市古冶区河北省唐山市古冶区河北省唐山市古冶区河北省唐山市古冶区杭州市西湖区 黄龙万科中心', '', '13679898380', '1', '0', '130000', '130200', '130204');
INSERT INTO `address_c` VALUES ('185', '65', '切尔西888', '台湾省台中市和平区辽宁省沈阳市和平区杭州市西湖区 黄龙万科中心', '', '13430393576', '0', '0', '710000', '710400', '710439');
INSERT INTO `address_c` VALUES ('186', '65', '曼联', '杭州市西湖区 黄龙万科中心', '', '13200008888', '0', '0', '230000', '230100', '230102');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `factory_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '产商id',
  `name` varchar(18) NOT NULL DEFAULT '' COMMENT '商标名称',
  `brand_img` varchar(200) NOT NULL DEFAULT '' COMMENT '商标图片',
  `certificate` varchar(200) NOT NULL DEFAULT '' COMMENT '商标证书',
  `authorization` varchar(200) NOT NULL DEFAULT '' COMMENT '授权书',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态标识位 0：正常 1：删除',
  `category_id_1` char(10) NOT NULL DEFAULT '0' COMMENT '所属商品一级分类',
  `auth_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核标识位 0：待审核 1：审核通过 2：审核不通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='商标表';

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('14', '9', '维雅', 'factory_brand/2018120311542381206.jpeg', 'factory_brand/2018120311543486047.jpeg', 'factory_brand/2018120311543606119.jpeg', '1543809277', '0', '0', '25,', '0');
INSERT INTO `brand` VALUES ('15', '12', '百雀羚', 'factory_brand/2018120314380183097.jpeg', 'factory_brand/2018120314382360742.jpeg', '', '1543819104', '0', '0', '25,', '0');
INSERT INTO `brand` VALUES ('16', '12', '相宜本草', 'factory_brand/2018120314402537754.jpeg', 'factory_brand/2018120314404178953.jpeg', '', '1543819242', '0', '0', '30,', '0');
INSERT INTO `brand` VALUES ('17', '12', '佰草集', 'factory_brand/2018120314413731017.jpeg', 'factory_brand/2018120314421020916.jpeg', '', '1543819331', '0', '0', '25,30,', '0');
INSERT INTO `brand` VALUES ('18', '14', '雅诗兰黛', 'factory_brand/2018120315510634499.jpeg', 'factory_brand/2018120315511952395.jpeg', '', '1543823487', '0', '0', '25,', '0');
INSERT INTO `brand` VALUES ('19', '14', '资生堂', 'factory_brand/2018120315532219560.jpeg', 'factory_brand/2018120315533392569.jpeg', '', '1543823614', '0', '0', '30,', '0');
INSERT INTO `brand` VALUES ('20', '14', '法国兰蔻', 'factory_brand/2018120315541103953.jpeg', 'factory_brand/2018120315542329983.jpeg', '', '1543823664', '0', '0', '25,30,', '0');
INSERT INTO `brand` VALUES ('21', '16', '美尚', 'factory_brand/2018120316522807538.jpeg', 'factory_brand/2018120316523564082.jpeg', 'factory_brand/2018120316523818446.jpeg', '1543827159', '0', '0', '25,', '0');
INSERT INTO `brand` VALUES ('22', '13', '麦当劳', 'factory_brand/2018120317154030810.jpeg', 'factory_brand/2018120317155325127.jpeg', '', '1543828554', '0', '0', '25,30,', '0');

-- ----------------------------
-- Table structure for chat_message
-- ----------------------------
DROP TABLE IF EXISTS `chat_message`;
CREATE TABLE `chat_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `from_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送ID user.id',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '接收ID，依据receive_type：1 user.id，2 group.id',
  `read` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否已读：0 ：未读 1：已读',
  `receive_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '接收对象类型 0：保留 1：个人 2：群组',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 0：保留 1：文字 2：图片 3：文件 4：视频 5：定位',
  `content` varchar(2000) NOT NULL DEFAULT '' COMMENT '内容',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `send_sign` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发送标志 0：未发送 1：已发送',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8 COMMENT='聊天消息表';

-- ----------------------------
-- Records of chat_message
-- ----------------------------
INSERT INTO `chat_message` VALUES ('26', '0', '22', '17', '1', '1', '1', '充分恢复和文化v', '1545727913', '1');
INSERT INTO `chat_message` VALUES ('41', '0', '20', '17', '1', '1', '1', '有关人员故意', '1545728471', '1');
INSERT INTO `chat_message` VALUES ('105', '0', '22', '17', '1', '1', '1', 'abcdddd', '1545903566', '1');
INSERT INTO `chat_message` VALUES ('106', '0', '20', '17', '1', '1', '1', '水电费第三方', '1545964093', '1');
INSERT INTO `chat_message` VALUES ('120', '0', '17', '22', '1', '1', '1', '水电费都是', '1545967772', '1');
INSERT INTO `chat_message` VALUES ('159', '2', '17', '16', '0', '1', '1', 'adsfasdfdsa', '1546048291', '1');
INSERT INTO `chat_message` VALUES ('160', '0', '22', '17', '1', '1', '1', '人情味儿群无若', '1546494867', '1');
INSERT INTO `chat_message` VALUES ('161', '0', '17', '22', '1', '1', '1', '阿第三方第三方', '1546501945', '1');
INSERT INTO `chat_message` VALUES ('163', '0', '17', '22', '1', '1', '1', '的发士大夫撒发', '1546503202', '1');
INSERT INTO `chat_message` VALUES ('187', '0', '17', '20', '1', '1', '1', '12306预约抢票', '1546509018', '1');
INSERT INTO `chat_message` VALUES ('240', '0', '22', '17', '1', '1', '1', '的费大幅度', '1546672960', '1');
INSERT INTO `chat_message` VALUES ('241', '0', '17', '22', '1', '1', '1', 'rrrrfasdfa', '1546673038', '1');
INSERT INTO `chat_message` VALUES ('242', '0', '17', '22', '1', '1', '1', '按时发大水', '1546673053', '1');
INSERT INTO `chat_message` VALUES ('244', '0', '22', '17', '1', '1', '1', '嗯嗯嗯', '1546674002', '1');
INSERT INTO `chat_message` VALUES ('253', '0', '22', '17', '1', '1', '1', '发送到发', '1546828246', '1');
INSERT INTO `chat_message` VALUES ('254', '0', '17', '20', '1', '1', '1', '柔柔弱弱', '1546828261', '1');
INSERT INTO `chat_message` VALUES ('258', '0', '17', '22', '1', '1', '1', 'a斤斤计较', '1546839576', '1');
INSERT INTO `chat_message` VALUES ('259', '0', '17', '22', '1', '1', '1', '二万五', '1546839887', '1');
INSERT INTO `chat_message` VALUES ('260', '0', '17', '22', '1', '1', '1', '完全', '1546839899', '1');
INSERT INTO `chat_message` VALUES ('261', '0', '22', '17', '1', '1', '1', '大声道', '1546839958', '1');
INSERT INTO `chat_message` VALUES ('262', '0', '22', '17', '1', '1', '1', '范德萨发撒的', '1546839970', '1');
INSERT INTO `chat_message` VALUES ('263', '0', '22', '17', '1', '1', '1', '按方法', '1546842209', '1');
INSERT INTO `chat_message` VALUES ('264', '0', '20', '17', '1', '1', '1', '发大发', '1546842414', '1');
INSERT INTO `chat_message` VALUES ('265', '0', '20', '17', '1', '1', '1', '发多少', '1546843515', '1');
INSERT INTO `chat_message` VALUES ('270', '0', '20', '17', '1', '1', '1', '撒的发生', '1546843822', '1');
INSERT INTO `chat_message` VALUES ('271', '0', '16', '17', '1', '1', '1', '打算发大水', '1546844482', '1');
INSERT INTO `chat_message` VALUES ('272', '0', '16', '17', '1', '1', '1', '大沙发斯蒂芬', '1546844502', '1');
INSERT INTO `chat_message` VALUES ('273', '0', '17', '16', '1', '1', '1', '发送到发', '1546844506', '1');
INSERT INTO `chat_message` VALUES ('274', '0', '16', '17', '1', '1', '1', '恩我二翁日期', '1546844559', '1');
INSERT INTO `chat_message` VALUES ('275', '0', '17', '16', '1', '1', '1', '恩我热群无', '1546844568', '1');
INSERT INTO `chat_message` VALUES ('276', '0', '17', '16', '1', '1', '1', '发士大夫撒', '1546844679', '1');
INSERT INTO `chat_message` VALUES ('277', '0', '17', '16', '1', '1', '1', '大幅度', '1546844793', '1');
INSERT INTO `chat_message` VALUES ('278', '0', '16', '17', '1', '1', '1', '发生的发生', '1546844814', '1');
INSERT INTO `chat_message` VALUES ('279', '0', '17', '16', '1', '1', '1', '打发大水', '1546845509', '1');
INSERT INTO `chat_message` VALUES ('280', '0', '17', '16', '1', '1', '1', '阿啥的范德萨', '1546845572', '1');
INSERT INTO `chat_message` VALUES ('281', '0', '17', '16', '1', '1', '1', '爱的色放sad', '1546845694', '1');
INSERT INTO `chat_message` VALUES ('282', '0', '17', '16', '1', '1', '1', '发士大夫撒', '1546845706', '1');
INSERT INTO `chat_message` VALUES ('283', '0', '16', '17', '1', '1', '1', '阿斯顿发送到', '1546846031', '1');
INSERT INTO `chat_message` VALUES ('284', '0', '16', '17', '1', '1', '1', '爱的色放三', '1546846033', '1');
INSERT INTO `chat_message` VALUES ('285', '0', '17', '16', '1', '1', '1', '大发送到', '1546846036', '1');
INSERT INTO `chat_message` VALUES ('286', '0', '17', '16', '1', '1', '1', '大事发生的', '1546846038', '1');
INSERT INTO `chat_message` VALUES ('287', '0', '16', '17', '1', '1', '1', '阿斯顿发送到', '1546846042', '1');
INSERT INTO `chat_message` VALUES ('288', '0', '16', '17', '1', '1', '1', '父亲为区分', '1546846045', '1');
INSERT INTO `chat_message` VALUES ('289', '0', '17', '16', '1', '1', '1', '按时发送到', '1546846049', '1');
INSERT INTO `chat_message` VALUES ('290', '0', '16', '17', '1', '1', '1', '6666666', '1546846766', '1');
INSERT INTO `chat_message` VALUES ('291', '0', '16', '17', '1', '1', '1', '7777', '1546846769', '1');
INSERT INTO `chat_message` VALUES ('292', '0', '16', '17', '1', '1', '1', '00000', '1546846772', '1');
INSERT INTO `chat_message` VALUES ('293', '0', '16', '17', '1', '1', '1', '75676767', '1546846779', '1');
INSERT INTO `chat_message` VALUES ('294', '0', '16', '17', '1', '1', '1', '444444444444', '1546846796', '1');
INSERT INTO `chat_message` VALUES ('295', '0', '16', '17', '1', '1', '1', '5555555555555777', '1546846806', '1');
INSERT INTO `chat_message` VALUES ('296', '0', '16', '17', '1', '1', '1', '111111', '1546847061', '1');
INSERT INTO `chat_message` VALUES ('297', '0', '16', '17', '1', '1', '1', '22222', '1546847063', '1');
INSERT INTO `chat_message` VALUES ('298', '0', '16', '17', '1', '1', '1', '3333', '1546847065', '1');
INSERT INTO `chat_message` VALUES ('299', '0', '16', '17', '1', '1', '1', '4444', '1546847067', '1');
INSERT INTO `chat_message` VALUES ('300', '0', '16', '17', '1', '1', '1', '5555', '1546847069', '1');
INSERT INTO `chat_message` VALUES ('301', '0', '16', '17', '1', '1', '1', '中国', '1546847127', '1');
INSERT INTO `chat_message` VALUES ('302', '0', '16', '17', '1', '1', '1', '美国111111', '1546847132', '1');
INSERT INTO `chat_message` VALUES ('303', '0', '16', '17', '1', '1', '1', '发u过来', '1546847227', '1');
INSERT INTO `chat_message` VALUES ('304', '0', '16', '17', '1', '1', '1', '好的', '1546847232', '1');
INSERT INTO `chat_message` VALUES ('305', '0', '17', '20', '1', '1', '1', '时间浪费精神的雷锋精神的雷锋精神的路口附近时代里发就算了对方就是懒得翻记录顺德警方联手对付', '1546847491', '0');
INSERT INTO `chat_message` VALUES ('306', '0', '17', '20', '1', '1', '1', '打发打发士大夫的束缚对方的', '1546847497', '0');
INSERT INTO `chat_message` VALUES ('307', '0', '17', '22', '0', '1', '1', '适当放松的方式的方式的方式的防守对方', '1546847791', '0');
INSERT INTO `chat_message` VALUES ('308', '0', '17', '22', '0', '1', '1', '对方的说法', '1546847793', '0');
INSERT INTO `chat_message` VALUES ('309', '0', '17', '22', '0', '1', '1', '是打发士大夫的', '1546847795', '0');
INSERT INTO `chat_message` VALUES ('310', '0', '17', '22', '0', '1', '1', '适当放松的方式的', '1546847796', '0');
INSERT INTO `chat_message` VALUES ('311', '0', '17', '22', '0', '1', '1', '打发士大夫', '1546847798', '0');
INSERT INTO `chat_message` VALUES ('312', '0', '17', '22', '0', '1', '1', '适当放松的方式的', '1546847800', '0');
INSERT INTO `chat_message` VALUES ('313', '0', '17', '22', '0', '1', '1', '斯蒂芬收到fsd', '1546847801', '0');
INSERT INTO `chat_message` VALUES ('314', '0', '17', '20', '1', '1', '1', '对方挂断挂断否', '1546848057', '0');
INSERT INTO `chat_message` VALUES ('315', '0', '17', '20', '1', '1', '1', '生生世世是', '1546848213', '0');
INSERT INTO `chat_message` VALUES ('319', '0', '16', '17', '1', '1', '1', '大法师', '1546848946', '1');
INSERT INTO `chat_message` VALUES ('320', '0', '17', '16', '1', '1', '1', '7777', '1546848948', '1');
INSERT INTO `chat_message` VALUES ('321', '0', '17', '16', '1', '1', '1', '8888', '1546848949', '1');
INSERT INTO `chat_message` VALUES ('322', '0', '17', '16', '1', '1', '1', '99999999', '1546848951', '1');
INSERT INTO `chat_message` VALUES ('323', '0', '17', '16', '1', '1', '1', '00000000', '1546848952', '1');
INSERT INTO `chat_message` VALUES ('324', '0', '17', '16', '1', '1', '1', '787878', '1546848954', '1');
INSERT INTO `chat_message` VALUES ('325', '0', '17', '16', '1', '1', '1', '7867878', '1546848956', '1');
INSERT INTO `chat_message` VALUES ('326', '0', '17', '16', '1', '1', '1', '876878', '1546848958', '1');
INSERT INTO `chat_message` VALUES ('327', '0', '17', '16', '1', '1', '1', '6787878', '1546848961', '1');
INSERT INTO `chat_message` VALUES ('328', '0', '17', '16', '1', '1', '1', '6787687', '1546848965', '1');
INSERT INTO `chat_message` VALUES ('329', '0', '17', '16', '1', '1', '1', '99999999', '1546848978', '1');
INSERT INTO `chat_message` VALUES ('330', '0', '17', '16', '1', '1', '1', '按时发大水', '1546849534', '1');
INSERT INTO `chat_message` VALUES ('331', '0', '16', '17', '1', '1', '1', '发撒第三方', '1546849550', '1');
INSERT INTO `chat_message` VALUES ('332', '0', '17', '16', '1', '1', '1', '阿斯顿发生', '1546849556', '1');
INSERT INTO `chat_message` VALUES ('333', '0', '16', '17', '1', '1', '1', '阿斯顿发送到', '1546849565', '1');
INSERT INTO `chat_message` VALUES ('334', '0', '17', '16', '1', '1', '1', '爱的色放撒', '1546849591', '1');
INSERT INTO `chat_message` VALUES ('335', '0', '17', '22', '0', '1', '1', '88888', '1546850678', '0');
INSERT INTO `chat_message` VALUES ('336', '0', '17', '22', '0', '1', '1', '是反反复复', '1546851533', '0');
INSERT INTO `chat_message` VALUES ('337', '0', '16', '17', '1', '1', '1', 'sssfsdfsdf', '1546853651', '1');
INSERT INTO `chat_message` VALUES ('338', '0', '16', '17', '1', '1', '1', 'sdfsdfsdf', '1546853653', '1');
INSERT INTO `chat_message` VALUES ('339', '0', '16', '17', '1', '1', '1', '陈洁家就', '1546853832', '1');
INSERT INTO `chat_message` VALUES ('340', '0', '16', '17', '1', '1', '1', '的方式的防守对方', '1546853834', '1');
INSERT INTO `chat_message` VALUES ('341', '0', '16', '17', '1', '1', '1', '打发士大夫的是', '1546853836', '1');
INSERT INTO `chat_message` VALUES ('342', '0', '16', '17', '1', '1', '1', '是打发士大夫的', '1546853837', '1');
INSERT INTO `chat_message` VALUES ('343', '0', '16', '17', '1', '1', '1', '打发士大夫', '1546853839', '1');
INSERT INTO `chat_message` VALUES ('344', '0', '16', '17', '1', '1', '1', '烦烦烦烦烦烦烦烦烦烦烦烦烦', '1546853843', '1');
INSERT INTO `chat_message` VALUES ('345', '0', '16', '17', '1', '1', '1', '来啊来ill少少', '1546853852', '1');
INSERT INTO `chat_message` VALUES ('346', '0', '16', '17', '1', '1', '1', '888888888', '1546854180', '1');
INSERT INTO `chat_message` VALUES ('347', '0', '16', '17', '1', '1', '1', '刚发售股份股份', '1546854184', '1');
INSERT INTO `chat_message` VALUES ('348', '0', '16', '17', '1', '1', '1', '是打发打发士大夫', '1546854187', '1');
INSERT INTO `chat_message` VALUES ('349', '0', '16', '17', '1', '1', '1', '适当放松的方式的', '1546854189', '1');
INSERT INTO `chat_message` VALUES ('350', '0', '16', '17', '1', '1', '1', '反反复复发', '1546854193', '1');
INSERT INTO `chat_message` VALUES ('351', '0', '16', '17', '1', '1', '1', '反反复复发sgfdgsfg', '1546854239', '1');
INSERT INTO `chat_message` VALUES ('352', '0', '24', '17', '1', '1', '1', 'afssdf ', '1546912970', '1');
INSERT INTO `chat_message` VALUES ('353', '0', '17', '24', '1', '1', '1', 'dafdsaf', '1546912979', '1');
INSERT INTO `chat_message` VALUES ('354', '0', '24', '17', '1', '1', '1', 'asdfasdf', '1546913761', '1');
INSERT INTO `chat_message` VALUES ('355', '0', '17', '24', '1', '1', '1', 'fdsafa', '1546913765', '1');
INSERT INTO `chat_message` VALUES ('356', '0', '19', '17', '1', '1', '1', 'dgdfg', '1547174223', '1');
INSERT INTO `chat_message` VALUES ('357', '0', '19', '17', '1', '1', '1', 'fgfg', '1547519280', '0');
INSERT INTO `chat_message` VALUES ('358', '0', '17', '16', '1', '1', '1', '法国非官方官方', '1547532962', '0');
INSERT INTO `chat_message` VALUES ('359', '0', '19', '17', '1', '1', '1', 'fdfdfdfd', '1548305583', '0');
INSERT INTO `chat_message` VALUES ('360', '0', '19', '17', '1', '1', '1', 'hhhhhhhhhh', '1548312230', '0');
INSERT INTO `chat_message` VALUES ('361', '0', '17', '19', '1', '1', '1', '00000000000', '1548312659', '0');
INSERT INTO `chat_message` VALUES ('362', '0', '17', '19', '1', '1', '1', '11111111', '1548312730', '0');

-- ----------------------------
-- Table structure for factory
-- ----------------------------
DROP TABLE IF EXISTS `factory`;
CREATE TABLE `factory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `agent` varchar(25) NOT NULL DEFAULT '' COMMENT '代理人',
  `name` varchar(25) NOT NULL DEFAULT '' COMMENT '产商名称',
  `business_license` varchar(150) NOT NULL DEFAULT '' COMMENT '营业执照:URL',
  `auth_letter` varchar(150) NOT NULL DEFAULT '' COMMENT '授权信:URL',
  `auth_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '认证状态： 0：待审核 1：已审核 2：不通过',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '公司类型 1：供应商 2、店家 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='公司入驻表';

-- ----------------------------
-- Records of factory
-- ----------------------------
INSERT INTO `factory` VALUES ('9', '张敏', '维雅生物科技有限公司', 'factory_auto/2018120311443193640.jpeg', 'factory_auto/2018120311443209574.jpeg', '0', '0', '1543808672', '0', '2');
INSERT INTO `factory` VALUES ('10', 'fsd', 'df', 'factory_auto/2018120311482140894.jpeg', 'factory_auto/2018120311482222641.jpeg', '0', '0', '1543808903', '0', '1');
INSERT INTO `factory` VALUES ('11', '师傅', '方法', 'factory_auto/2018120312000565276.jpeg', 'factory_auto/2018120312000645770.jpeg', '0', '0', '1543809606', '0', '2');
INSERT INTO `factory` VALUES ('12', '周润发', '广东维观生物科技有限公司', 'factory_auto/2018120314112119257.jpeg', '', '0', '0', '1543817483', '0', '1');
INSERT INTO `factory` VALUES ('13', '梁朝伟', '广东美尚科技网络有限公司', 'factory_auto/2018120314124467072.jpeg', '', '0', '0', '1543817565', '0', '1');
INSERT INTO `factory` VALUES ('14', '马云', '阿里巴巴集团', 'factory_auto/2018120315341569097.jpeg', '', '0', '0', '1543822456', '0', '2');
INSERT INTO `factory` VALUES ('15', '马化腾', '腾讯控股有限公司', 'factory_auto/2018120315361348176.jpeg', '', '0', '0', '1543822574', '0', '2');
INSERT INTO `factory` VALUES ('16', '张敏', '美尚网络科技有限公司', 'factory_auto/2018120316503782620.jpeg', 'factory_auto/2018120316503772912.jpeg', '0', '0', '1543827038', '0', '1');
INSERT INTO `factory` VALUES ('17', 'sdfsdf', 'sdfsd', 'factory_auto/2019011912404436726.jpeg', 'factory_auto/2019011912404506814.jpeg', '0', '0', '1547872845', '0', '1');
INSERT INTO `factory` VALUES ('18', 'aa', 'aa', 'factory_auto/2019040915214170391.jpeg', 'factory_auto/2019040915214384321.jpeg', '0', '0', '1554794503', '0', '2');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `store_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '店铺Id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '商品名称',
  `trait` varchar(60) NOT NULL DEFAULT '' COMMENT '商品特点',
  `category_id_1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类1',
  `category_id_2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类2',
  `category_id_3` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类3',
  `thumb_img` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `main_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '首焦图',
  `goods_video` varchar(255) NOT NULL DEFAULT '' COMMENT '视频',
  `parameters` varchar(1000) NOT NULL DEFAULT '' COMMENT '参数',
  `details_img` varchar(255) NOT NULL DEFAULT '' COMMENT '详情图',
  `tag` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `retail_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '零售价格',
  `sale_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `settle_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算价格',
  `sale_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '销售类型 0：正常产品 1：场景产品 2：特价 ',
  `shelf_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '商品上下架标识位 1：下架 2：待审核 3 上架',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `rq_code_url` varchar(30) NOT NULL DEFAULT '' COMMENT '商品二维码图片',
  `inventory` int(10) NOT NULL DEFAULT '0' COMMENT '库存',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `line_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行数 排序',
  `special` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '特价',
  `run_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '经营类型 1：采购店铺 2：零售店铺 3：分成店铺',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商品类型：0：产品 1：服务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('18', '184', '美肤', '啊啊啊啊啊啊啊', '25', '26', '0', 'factory_goods/2018120611453168290.jpeg', 'factory_goods/2018120611453724301.jpeg,factory_goods/2018120611453754088.jpeg,factory_goods/2018120611453749234.jpeg,factory_goods/2018120611453737681.jpeg,factory_goods/2018120611453790385.jpeg,', '', 'sfdfsfsdfsdf', 'factory_goods/2018120611454649726.jpeg,factory_goods/2018120611454641285.jpeg,factory_goods/2018120611454677160.jpeg,factory_goods/2018120611454665210.jpeg,', '', '444.00', '44.00', '0.00', '0', '1', '0', '', '0', '1544067952', '0', '0', '0', '0.00', '3', '1');
INSERT INTO `goods` VALUES ('19', '184', '美肤1111', '是否打发士大夫似的', '25', '29', '0', 'factory_goods/2018120611461603979.jpeg', 'factory_goods/2018120611462204008.jpeg,factory_goods/2018120611462235112.jpeg,factory_goods/2018120611462291369.jpeg,factory_goods/2018120611462225931.jpeg,factory_goods/2018120611462268791.jpeg,factory_goods/2018120611462296250.jpeg,', '', '是否适当方式定房', 'factory_goods/2018120611463273106.jpeg,factory_goods/2018120611463204526.jpeg,factory_goods/2018120611463223289.jpeg,', '', '56.00', '44.00', '0.00', '0', '1', '0', '', '0', '1544067993', '0', '0', '0', '0.00', '3', '1');
INSERT INTO `goods` VALUES ('20', '187', 'oui，', 'hi', '25', '29', '0', 'factory_goods/2019061113383964206.jpeg', 'factory_goods/2019061113384920655.jpeg,', '', '隔热瓦', 'factory_goods/2019061113391094667.jpeg,', '', '150.00', '150.00', '0.00', '0', '1', '0', '', '0', '1560231551', '0', '0', '0', '0.00', '4', '1');

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(90) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '级别：0 保留 1 一级 2 二级 3 三级',
  `parent_id_1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID1',
  `parent_id_2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID2',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `img` varchar(2000) NOT NULL DEFAULT '' COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES ('25', '美肤', '0', '1', '0', '0', '0', '美美美的', '');
INSERT INTO `goods_category` VALUES ('26', '面膜', '0', '2', '25', '0', '0', '好好用', '');
INSERT INTO `goods_category` VALUES ('27', '面膜1', '0', '2', '25', '0', '0', '', '');
INSERT INTO `goods_category` VALUES ('28', '面膜2', '0', '2', '25', '0', '0', '', '');
INSERT INTO `goods_category` VALUES ('29', '面膜3', '0', '2', '25', '0', '0', '', '');
INSERT INTO `goods_category` VALUES ('30', '电器', '0', '1', '0', '0', '0', '', '');
INSERT INTO `goods_category` VALUES ('31', '手机', '0', '2', '30', '0', '0', '', '');
INSERT INTO `goods_category` VALUES ('32', '笔记本', '0', '2', '30', '0', '0', '', '');
INSERT INTO `goods_category` VALUES ('33', '冰箱', '0', '2', '30', '0', '0', '', '');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sn` varchar(32) NOT NULL DEFAULT '' COMMENT '编号',
  `pay_sn` varchar(33) NOT NULL DEFAULT '' COMMENT '支付单号',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：0：普通 1：团购',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '物流状态：0：临时 1:待付款 2:待收货 3:待评价 4:已完成 5:已取消',
  `after_sale_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '售后服务状态 0：正常 1：待处理 2：已完成',
  `payment_code` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付方式：0 微信 1：支付宝 3：网银',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `coupons_pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '代金券支付金额',
  `wallet_pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '钱包支付金额',
  `actually_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额',
  `remark` varchar(2000) NOT NULL DEFAULT '' COMMENT '备注说明',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：user.id',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '地址ID:consignee_address.id',
  `coupons_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '代金券ID:coupons.id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  `payment_time` varchar(14) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `finished_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '20190103114422175967595627343488', '', '0', '0', '1', '0', '0', '44.00', '0.00', '0.00', '44.00', '', '16', '0', '0', '1546487062', '0', '0');

-- ----------------------------
-- Table structure for order_child
-- ----------------------------
DROP TABLE IF EXISTS `order_child`;
CREATE TABLE `order_child` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `father_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '父订单id 关联order表 id',
  `sn` varchar(32) NOT NULL COMMENT '编号',
  `payment_code` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付方式：0 微信 1：支付宝 3：网银',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `actually_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额',
  `remark` varchar(2000) NOT NULL DEFAULT '' COMMENT '备注说明',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：user.id',
  `coupons_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '代金券ID:coupons.id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  `payment_time` varchar(14) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态：0：临时 1:待付款 2:待收货 3:待评价 4:已完成 5:已取消',
  `after_sale_status` tinyint(1) unsigned NOT NULL COMMENT '售后服务状态 0：正常 1：待处理 2：已完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子订单表';

-- ----------------------------
-- Records of order_child
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成交价格',
  `num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '成交数量',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品id 关联goods表',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：user.id',
  `father_order_id` int(10) NOT NULL DEFAULT '0' COMMENT '父订单 关联order表id',
  `child_order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拆分后子订单ID 关联order_childk表id ',
  `goods_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品类型：1：商品 2：项目',
  `store_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1', '0', '44.00', '1', '18', '16', '1', '0', '0', '184');

-- ----------------------------
-- Table structure for passage
-- ----------------------------
DROP TABLE IF EXISTS `passage`;
CREATE TABLE `passage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tweet_id` int(11) NOT NULL DEFAULT '0' COMMENT '推文id',
  `illustration` varchar(2000) NOT NULL DEFAULT '' COMMENT '推文插图',
  `passage` varchar(2000) NOT NULL DEFAULT '' COMMENT '段落文字',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章段落文字+图片';

-- ----------------------------
-- Records of passage
-- ----------------------------

-- ----------------------------
-- Table structure for plugin
-- ----------------------------
DROP TABLE IF EXISTS `plugin`;
CREATE TABLE `plugin` (
  `code` varchar(13) DEFAULT NULL COMMENT '插件编码',
  `name` varchar(55) DEFAULT NULL COMMENT '中文名字',
  `version` varchar(255) DEFAULT NULL COMMENT '插件的版本',
  `config` text COMMENT '配置信息',
  `config_value` text COMMENT '配置值信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `type` varchar(50) DEFAULT NULL COMMENT '插件类型 payment支付 login 登陆 shipping物流',
  `bank_code` text COMMENT '网银配置信息',
  `scene` tinyint(1) DEFAULT '0' COMMENT '使用场景 0PC+手机 1手机 2PC 3APP 4小程序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of plugin
-- ----------------------------

-- ----------------------------
-- Table structure for promotion
-- ----------------------------
DROP TABLE IF EXISTS `promotion`;
CREATE TABLE `promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '促销活动名称',
  `first_img` varchar(200) NOT NULL DEFAULT '' COMMENT '促销活动图片',
  `second_img` varchar(200) NOT NULL DEFAULT '' COMMENT '促销活动图片',
  `goods_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '商品ids',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '促销开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '促销结束时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产商id',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `run_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '经营类型 1：采购店铺 2：零售店铺 3：分成店铺',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='促销活动表';

-- ----------------------------
-- Records of promotion
-- ----------------------------

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `factory_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '企业/机构 ID',
  `company_img` varchar(50) NOT NULL DEFAULT '' COMMENT '企业/机构 首图',
  `logo_img` varchar(255) NOT NULL DEFAULT '' COMMENT '企业/机构 标志',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '企业/机构 简称',
  `ideas` varchar(2000) NOT NULL DEFAULT '' COMMENT '企业/机构 理念',
  `introduction` varchar(1000) NOT NULL DEFAULT '' COMMENT '企业/机构简介',
  `factory_video` varchar(2000) NOT NULL DEFAULT '' COMMENT '企业/机构视频',
  `glory_img` varchar(6500) NOT NULL DEFAULT '' COMMENT '专利荣耀',
  `rb_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '企业研发生产照片',
  `team_activity` varchar(2000) NOT NULL DEFAULT '' COMMENT '机构团队活动照片',
  `store_profile pictures` varchar(2000) NOT NULL DEFAULT '' COMMENT '机构店面活动图片',
  `license` varchar(2000) NOT NULL DEFAULT '' COMMENT '执照',
  `detail_address` varchar(50) NOT NULL DEFAULT '' COMMENT '详细地址',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `province` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '省',
  `city` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '市',
  `area` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='档案表';

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('18', '9', 'factory_record/2018120311492784355.jpeg', 'factory_record/2018120311493596165.jpeg', '维雅', '', 'dfasdfasdf', '', '[{\"fileSrc\":\"factory_record\\/2018120311501260687.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120311494480578.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120311495056716.jpeg\",\"fileText\":\"\"}]', '', '[{\"fileSrc\":\"factory_record\\/2018120311500686303.jpeg\",\"fileText\":\"\"}]', 'fdsafasdfasd', '0', '1543809019', '1557476859', '3', '3', '3');
INSERT INTO `record` VALUES ('19', '8', 'factory_record/2018120311565282707.jpeg', 'factory_record/2018120311570572470.jpeg', '123', '', '11111', '', '[{\"fileSrc\":\"factory_record\\/2018120311564254602.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311564299826.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311564284830.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311564238559.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311564265935.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120311572012965.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311572011596.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311572041448.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311572024408.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311572045769.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120311564959483.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311564954367.jpeg\",\"fileText\":\"\"}]', '', '[{\"fileSrc\":\"factory_record\\/2018120311572806955.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311572878035.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311572886248.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120311572879292.jpeg\",\"fileText\":\"\"}]', '20', '0', '1543809449', '0', '28', '0', '0');
INSERT INTO `record` VALUES ('20', '12', 'factory_record/2018120314193353610.jpeg', 'factory_record/2018120315255145482.jpeg', '维观科技', '', '1、适用项目：摩力沱活肤补水,摩力沱焕彩亮白,海皙曼全效修复,海皙曼柔亮润白,海皙曼紧致V脸,元气道拨筋-亮眼醒脑术,元气道拨筋-肩颈舒筋术,元气道拨筋-挺胸提气术,元气道拨筋-平腹塑腰术,元气道拨筋-柔肤美背术,沁氧森林-背臀腿Spa,依兰诱惑-胸腹Spa,嘉诗顿妮-活氧明眸眼部精护,元气道拨筋-任意拨筋,补水拨筋术,和风舒缓清源拨筋术,和风舒缓增益调理拨筋术,健康疏通调理平衡术,莲萃面部修复舒缓术,优波美疏乳排毒,私人订制精油SPA,私人订制精油补水疗法,元气身体拨筋术,海皙曼修复新生拨筋术,海皙曼冻龄美肌拨筋术,淋巴排毒疗法,无针水光·冷萃净妆,无针水光·玻尿酸锁水,无针水光·魔法净痘,无针水光·肌肤再生,活力肩颈拨筋术（4人份）,眼疲劳缓解术（4人份）,手臂经络活血术（4人份）,补水肩背能量术,海皙曼面部拨筋组合,产后通乳,摩力沱美眼水肤全脸精护,海皙曼美肌明眸全脸精护,芬香佳媛胸部精护,欧甘草水光亮白,莲 · 玻尿酸补水,花青素眼部赋活,脊养四肢疗法,私密三宝疗法,塑颜排毒疗法\r\n', '', '[{\"fileSrc\":\"factory_record\\/2018120314243757885.jpeg\",\"fileText\":\"\\u653f\\u7b56\\u89e3\\u8bfb\\uff1a\\u91c7\\u8d2d\\u5e73\\u53f0\\u5546\\u54c1\\/\\u670d\\u52a1\\u7edf\\u4e00\\u91c7\\u8d2d\\u7ed3\\u7b97\\u4ef7\\u683c\\uff0c\\u6309\\u8fd4\\u70b9\\u653f\\u7b56\\u6267\\u884c\\u7ea2\\u5229\\u7ed3\\u7b97\\u3002\\u4e91\\u63a8\\u5ba2\\u63a8\\u8350\\u5173\\u6ce8\\u4e00\\u7ecf\\u7ed1\\u5b9a5%\\u6c38\\u4e45\\u6709\\u6548\\uff0c\\u91d1\\u724c\\u548c\\u9ad8\\u7ea7\\u91c7\\u8d2d\\u5546\\u81ea\\u8eab\\u6309\\u68af\\u5ea6\\u6267\\u884c\\u8fd4\\u70b9\\u5206\\u7ea2\\uff1b\\u91d1\\u724c\\/\\u9ad8\\u7ea7\\u91c7\\u8d2d\\u5546\\u5982\\u4f5c\\u4e3a\\u8054\\u5408\\u91c7\\u8d2d\\u53d1\\u8d77\\u4eba\\u53ef\\u4eab\\u53d7\\u53c2\\u4e0e\\u8005\\u7684\\u91c7\\u8d2d\\u989d5\\/10%\\u5206\\u7ea2\\u3002\"},{\"fileSrc\":\"factory_record\\/2018120314243739238.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314243768685.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314243712644.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314243797940.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314243756952.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314243756937.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314243701459.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314243786257.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314243765397.jpeg\",\"fileText\":\"\\u653f\\u7b56\\u89e3\\u8bfb\\uff1a\\u91c7\\u8d2d\\u5e73\\u53f0\\u5546\\u54c1\\/\\u670d\\u52a1\\u7edf\\u4e00\\u91c7\\u8d2d\\u7ed3\\u7b97\\u4ef7\\u683c\\uff0c\\u6309\\u8fd4\\u70b9\\u653f\\u7b56\\u6267\\u884c\\u7ea2\\u5229\\u7ed3\\u7b97\\u3002\\u4e91\\u63a8\\u5ba2\\u63a8\\u8350\\u5173\\u6ce8\\u4e00\\u7ecf\\u7ed1\\u5b9a5%\\u6c38\\u4e45\\u6709\\u6548\\uff0c\\u91d1\\u724c\\u548c\\u9ad8\\u7ea7\\u91c7\\u8d2d\\u5546\\u81ea\\u8eab\\u6309\\u68af\\u5ea6\\u6267\\u884c\\u8fd4\\u70b9\\u5206\\u7ea2\\uff1b\\u91d1\\u724c\\/\\u9ad8\\u7ea7\\u91c7\\u8d2d\\u5546\\u5982\\u4f5c\\u4e3a\\u8054\\u5408\\u91c7\\u8d2d\\u53d1\\u8d77\\u4eba\\u53ef\\u4eab\\u53d7\\u53c2\\u4e0e\\u8005\\u7684\\u91c7\\u8d2d\\u989d5\\/10%\\u5206\\u7ea2\\u3002\"}]', '[{\"fileSrc\":\"factory_record\\/2018120314221680913.jpeg\",\"fileText\":\"\\u653f\\u7b56\\u89e3\\u8bfb\\uff1a\\u91c7\\u8d2d\\u5e73\\u53f0\\u5546\\u54c1\\/\\u670d\\u52a1\\u7edf\\u4e00\\u91c7\\u8d2d\\u7ed3\"},{\"fileSrc\":\"factory_record\\/2018120314221680467.jpeg\",\"fileText\":\"\\u653f\\u7b56\\u89e3\\u8bfb\\uff1a\\u91c7\\u8d2d\\u5e73\\u53f0\\u5546\\u54c1\\/\\u670d\\u52a1\\u7edf\\u4e00\\u91c7\\u8d2d\\u7ed3\\u7b97\\u4ef7\\u683c\\uff0c\"},{\"fileSrc\":\"factory_record\\/2018120314221613274.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314221641160.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314221694886.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314221603114.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314221664150.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314221666195.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314221666374.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314221648979.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120314304921361.jpeg\",\"fileText\":\"\\u653f\\u7b56\\u89e3\\u8bfb\\uff1a\\u91c7\\u8d2d\\u5e73\\u53f0\\u5546\\u54c1\\/\\u670d\\u52a1\\u7edf\\u4e00\\u91c7\\u8d2d\\u7ed3\\u7b97\\u4ef7\\u683c\\uff0c\\u6309\\u8fd4\\u70b9\\u653f\\u7b56\\u6267\\u884c\\u7ea2\\u5229\\u7ed3\\u7b97\\u3002\\u4e91\\u63a8\\u5ba2\\u63a8\\u8350\\u5173\\u6ce8\\u4e00\\u7ecf\\u7ed1\\u5b9a5%\\u6c38\\u4e45\\u6709\\u6548\\uff0c\\u91d1\\u724c\\u548c\\u9ad8\\u7ea7\\u91c7\\u8d2d\\u5546\\u81ea\\u8eab\\u6309\\u68af\\u5ea6\\u6267\\u884c\\u8fd4\\u70b9\\u5206\\u7ea2\\uff1b\"},{\"fileSrc\":\"factory_record\\/2018120314304987653.jpeg\",\"fileText\":\"\\u653f\\u7b56\\u89e3\\u8bfb\\uff1a\\u91c7\\u8d2d\\u5e73\\u53f0\\u5546\\u54c1\\/\\u670d\\u52a1\\u7edf\\u4e00\\u91c7\\u8d2d\\u7ed3\\u7b97\\u4ef7\\u683c\\uff0c\\u6309\\u8fd4\\u70b9\\u653f\\u7b56\\u6267\\u884c\\u7ea2\\u5229\\u7ed3\\u7b97\\u3002\\u4e91\\u63a8\\u5ba2\\u63a8\\u8350\\u5173\\u6ce8\\u4e00\\u7ecf\\u7ed1\\u5b9a5%\\u6c38\\u4e45\\u6709\\u6548\\uff0c\\u91d1\\u724c\\u548c\\u9ad8\\u7ea7\\u91c7\\u8d2d\\u5546\\u81ea\\u8eab\\u6309\\u68af\\u5ea6\\u6267\\u884c\\u8fd4\\u70b9\\u5206\\u7ea2\\uff1b\\u91d1\\u724c\"},{\"fileSrc\":\"factory_record\\/2018120314304949122.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314304975086.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314304940795.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314304984216.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314304907568.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314304994369.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314304994576.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314304958656.jpeg\",\"fileText\":\"\"}]', '', '[{\"fileSrc\":\"factory_record\\/2018120314235470264.jpeg\",\"fileText\":\"\\u653f\\u7b56\\u89e3\\u8bfb\\uff1a\\u91c7\\u8d2d\\u5e73\\u53f0\\u5546\\u54c1\\/\\u670d\\u52a1\\u7edf\\u4e00\\u91c7\\u8d2d\\u7ed3\\u7b97\\u4ef7\\u683c\\uff0c\\u6309\\u8fd4\\u70b9\\u653f\\u7b56\\u6267\\u884c\\u7ea2\\u5229\\u7ed3\\u7b97\\u3002\\u4e91\\u63a8\\u5ba2\\u63a8\\u8350\\u5173\\u6ce8\\u4e00\\u7ecf\\u7ed1\\u5b9a5%\\u6c38\\u4e45\\u6709\\u6548\\uff0c\\u91d1\\u724c\\u548c\\u9ad8\\u7ea7\\u91c7\\u8d2d\\u5546\\u81ea\\u8eab\\u6309\\u68af\\u5ea6\\u6267\\u884c\\u8fd4\\u70b9\\u5206\\u7ea2\\uff1b\\u91d1\\u724c\\/\\u9ad8\\u7ea7\\u91c7\\u8d2d\\u5546\\u5982\\u4f5c\\u4e3a\\u8054\\u5408\\u91c7\\u8d2d\\u53d1\\u8d77\"},{\"fileSrc\":\"factory_record\\/2018120314235480391.jpeg\",\"fileText\":\"\\u653f\\u7b56\\u89e3\\u8bfb\\uff1a\\u91c7\\u8d2d\\u5e73\\u53f0\\u5546\\u54c1\\/\\u670d\\u52a1\\u7edf\\u4e00\\u91c7\\u8d2d\\u7ed3\\u7b97\\u4ef7\\u683c\\uff0c\\u6309\\u8fd4\\u70b9\\u653f\\u7b56\\u6267\\u884c\\u7ea2\\u5229\\u7ed3\\u7b97\\u3002\\u4e91\\u63a8\\u5ba2\\u63a8\\u8350\\u5173\\u6ce8\\u4e00\\u7ecf\\u7ed1\\u5b9a5%\\u6c38\\u4e45\\u6709\\u6548\\uff0c\\u91d1\\u724c\\u548c\\u9ad8\\u7ea7\\u91c7\\u8d2d\\u5546\\u81ea\\u8eab\\u6309\\u68af\\u5ea6\\u6267\\u884c\\u8fd4\\u70b9\\u5206\\u7ea2\\uff1b\\u91d1\\u724c\\/\\u9ad8\\u7ea7\\u91c7\\u8d2d\\u5546\"},{\"fileSrc\":\"factory_record\\/2018120314235443583.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314235431498.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314235434860.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314235443168.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314235462214.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314235466854.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314235445483.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120314235496137.jpeg\",\"fileText\":\"\"}]', '珠江帝景苑', '0', '1543818369', '1543821952', '18', '0', '2');
INSERT INTO `record` VALUES ('21', '14', 'factory_record/2018120315425374687.jpeg', 'factory_record/2018120315424014629.jpeg', '阿里巴巴', '', '1、适用项目：摩力沱活肤补水,摩力沱焕彩亮白,海皙曼全效修复,海皙曼柔亮润白,海皙曼紧致V脸,元气道拨筋-亮眼醒脑术,元气道拨筋-肩颈舒筋术,元气道拨筋-挺胸提气术,元气道拨筋-平腹塑腰术,元气道拨筋-柔肤美背术,沁氧森林-背臀腿Spa,依兰诱惑-胸腹Spa,嘉诗顿妮-活氧明眸眼部精护,元气道拨筋-任意拨筋,补水拨筋术,和风舒缓清源拨筋术,和风舒缓增益调理拨筋术,健康疏通调理平衡术,莲萃面部修复舒缓术,优波美疏乳排毒,私人订制精油SPA,私人订制精油补水疗法,元气身体拨筋术,海皙曼修复新生拨筋术,海皙曼冻龄美肌拨筋术,淋巴排毒疗法,无针水光·冷萃净妆,无针水光·玻尿酸锁水,无针水光·魔法净痘,无针水光·肌肤再生,活力肩颈拨筋术（4人份）,眼疲劳缓解术（4人份）,手臂经络活血术（4人份）,补水肩背能量术,海皙曼面部拨筋组合,产后通乳,摩力沱美眼水肤全脸精护,海皙曼美肌明眸全脸精护,芬香佳媛胸部精护,欧甘草水光亮白,莲 · 玻尿酸补水,花青素眼部赋活,脊养四肢疗法,私密三宝疗法,塑颜排毒疗法\r\n', '', '[{\"fileSrc\":\"factory_record\\/2018120315465647950.jpeg\",\"fileText\":\"\\u5bf9\\u4e8e\\u5916\\u5356\\u4e0d\\u591f\\u5065\\u5eb7\\uff0c\\u53ef\\u80fd\\u5f88\\u591a\\u4eba\\u90fd\\u591a\\u5c11\\u77e5\\u9053\\u4e00\\u70b9\\u3002\"},{\"fileSrc\":\"factory_record\\/2018120715420755131.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315465643710.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315465635374.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315465695464.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315465655923.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315465608758.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315465637481.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315465655379.jpeg\",\"fileText\":\"\\u5bf9\\u4e8e\\u5916\\u5356\\u4e0d\\u591f\\u5065\\u5eb7\\uff0c\\u53ef\\u80fd\\u5f88\\u591a\\u4eba\\u90fd\\u591a\\u5c11\\u77e5\\u9053\\u4e00\\u70b9\\u3002\"},{\"fileSrc\":\"factory_record\\/2018120315465634718.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120315434267036.jpeg\",\"fileText\":\"\\u5bf9\\u4e8e\\u5916\\u5356\\u4e0d\\u591f\\u5065\\u5eb7\\uff0c\\u53ef\\u80fd\\u5f88\\u591a\\u4eba\\u90fd\\u591a\\u5c11\\u77e5\\u9053\\u4e00\\u70b9\\u3002\"},{\"fileSrc\":\"factory_record\\/2018120315434203764.jpeg\",\"fileText\":\"\\u5bf9\\u4e8e\\u5916\\u5356\\u4e0d\\u591f\\u5065\\u5eb7\\uff0c\\u53ef\\u80fd\\u5f88\\u591a\\u4eba\\u90fd\\u591a\\u5c11\\u77e5\\u9053\\u4e00\\u70b9\\u3002\"},{\"fileSrc\":\"factory_record\\/2018120315434269534.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315434229583.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315434264478.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315434205801.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315434264504.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315434287124.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315434282736.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315434271413.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120315440774022.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315440784918.jpeg\",\"fileText\":\"\\u5bf9\\u4e8e\\u5916\\u5356\\u4e0d\\u591f\\u5065\\u5eb7\\uff0c\\u53ef\\u80fd\\u5f88\\u591a\\u4eba\\u90fd\\u591a\\u5c11\\u77e5\\u9053\\u4e00\\u70b9\\u3002\"},{\"fileSrc\":\"factory_record\\/2018120315440784139.jpeg\",\"fileText\":\"\\u5bf9\\u4e8e\\u5916\\u5356\\u4e0d\\u591f\\u5065\\u5eb7\\uff0c\\u53ef\\u80fd\\u5f88\\u591a\\u4eba\\u90fd\\u591a\\u5c11\\u77e5\\u9053\\u4e00\\u70b9\\u3002\"},{\"fileSrc\":\"factory_record\\/2018120315440702347.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315440781700.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315440762253.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315440766902.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315440740825.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315440778321.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315440715971.jpeg\",\"fileText\":\"\"}]', '', '[{\"fileSrc\":\"factory_record\\/2018120315460348312.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315460331459.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315460355279.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315460362487.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315460303461.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315460352213.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315460319733.jpeg\",\"fileText\":\"\\u5bf9\\u4e8e\\u5916\\u5356\\u4e0d\\u591f\\u5065\\u5eb7\\uff0c\\u53ef\\u80fd\\u5f88\\u591a\\u4eba\\u90fd\\u591a\\u5c11\\u77e5\\u9053\\u4e00\\u70b9\\u3002\"},{\"fileSrc\":\"factory_record\\/2018120315460390859.jpeg\",\"fileText\":\"\\u5bf9\\u4e8e\\u5916\\u5356\\u4e0d\\u591f\\u5065\\u5eb7\\uff0c\\u53ef\\u80fd\\u5f88\\u591a\\u4eba\\u90fd\\u591a\\u5c11\\u77e5\\u9053\\u4e00\\u70b9\\u3002\"},{\"fileSrc\":\"factory_record\\/2018120315460381472.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2018120315460370637.jpeg\",\"fileText\":\"\\u5bf9\\u4e8e\\u5916\\u5356\\u4e0d\\u591f\\u5065\\u5eb7\\uff0c\\u53ef\\u80fd\\u5f88\\u591a\\u4eba\\u90fd\\u591a\\u5c11\\u77e5\\u9053\\u4e00\\u70b9\\u3002\"}]', '阳台北路80号', '0', '1543823248', '1544168594', '12', '0', '0');
INSERT INTO `record` VALUES ('22', '16', 'factory_record/2018120316510288579.jpeg', 'factory_record/2018120316511389706.jpeg', '美尚', '', 'dsfaadsfasd', '', '[{\"fileSrc\":\"factory_record\\/2018120316514275362.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120316512447623.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120316512990622.jpeg\",\"fileText\":\"\"}]', '', '[{\"fileSrc\":\"factory_record\\/2018120316513624329.jpeg\",\"fileText\":\"\"}]', 'asfdadsfsa', '0', '1543827108', '0', '4', '4', '4');
INSERT INTO `record` VALUES ('23', '13', 'factory_record/2018120317082787233.jpeg', 'factory_record/2018120317091765306.jpeg', '美尚科技', '', '对于外卖不够健康，可能很多人都多少知道一点。', '', '[{\"fileSrc\":\"factory_record\\/2018120317121589862.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120317095986142.jpeg\",\"fileText\":\"\\u5bf9\\u4e8e\\u5916\\u5356\\u4e0d\\u591f\\u5065\\u5eb7\\uff0c\\u53ef\\u80fd\\u5f88\\u591a\\u4eba\\u90fd\\u591a\\u5c11\\u77e5\\u9053\\u4e00\\u70b9\\u3002\"}]', '[{\"fileSrc\":\"factory_record\\/2018120317111114270.jpeg\",\"fileText\":\"\"}]', '', '[{\"fileSrc\":\"factory_record\\/2018120317115080307.jpeg\",\"fileText\":\"\\u5bf9\\u4e8e\\u5916\\u5356\\u4e0d\\u591f\\u5065\\u5eb7\\uff0c\\u53ef\\u80fd\\u5f88\\u591a\\u4eba\\u90fd\\u591a\\u5c11\\u77e5\\u9053\\u4e00\\u70b9\\u3002\"}]', '烟台北路80号', '0', '1543828361', '0', '5', '10', '0');
INSERT INTO `record` VALUES ('24', '10', 'factory_record/2018120611433558806.jpeg', 'factory_record/2018120611434294964.jpeg', 'hggh', '', 'sdfsdfsdfds', '', '[{\"fileSrc\":\"factory_record\\/2018120611435411076.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120611435037681.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2018120611440190045.jpeg\",\"fileText\":\"\"}]', '', '[{\"fileSrc\":\"factory_record\\/2018120611435709132.jpeg\",\"fileText\":\"\"}]', '33', '0', '1544067846', '0', '12', '2', '2');
INSERT INTO `record` VALUES ('25', '11', 'factory_record/2019011509535202941.jpeg', 'factory_record/2019011509540484179.jpeg', '123456', '', 'dfgdfgdfgdfgdfgfdgfd', '', '[{\"fileSrc\":\"factory_record\\/2019011509541975014.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2019011509540848029.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2019011509542327503.jpeg\",\"fileText\":\"\"}]', '', '[{\"fileSrc\":\"factory_record\\/2019011509545389136.jpeg\",\"fileText\":\"\"}]', '55', '0', '1547517294', '1547517303', '8', '3', '3');
INSERT INTO `record` VALUES ('26', '17', 'factory_record/2019011912414230827.jpeg', 'factory_record/2019011912414715327.jpeg', 'aa', '', 'sdfsdfsdf', '', '[{\"fileSrc\":\"factory_record\\/2019011912423587923.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2019011912422714258.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2019011912423191441.jpeg\",\"fileText\":\"\"}]', '', '[{\"fileSrc\":\"factory_record\\/2019011912424119483.jpeg\",\"fileText\":\"\"}]', 'dd', '0', '1547872966', '0', '3', '3', '3');
INSERT INTO `record` VALUES ('27', '18', 'factory_record/2019041511104068723.jpeg', 'factory_record/2019040915221478443.jpeg', 'aa', '', 'aaaa', '', '[{\"fileSrc\":\"factory_record\\/2019040915224146571.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2019040915222680041.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2019041511054217640.jpeg\",\"fileText\":\"\"}]', '[{\"fileSrc\":\"factory_record\\/2019040915223107647.jpeg\",\"fileText\":\"\"},{\"fileSrc\":\"factory_record\\/2019041511055590979.jpeg\",\"fileText\":\"\"}]', '', '[{\"fileSrc\":\"factory_record\\/2019040915223550834.jpeg\",\"fileText\":\"\"}]', 'ada', '0', '1554794572', '1555297860', '1', '1', '0');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `foreign_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '外键 id : store_type为1 档案id record_id;store_type为1=2 品牌id brand_id',
  `store_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '店铺类型 0：保留 1：企业旗舰店 2：品牌旗舰店',
  `run_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '经营类型 供应商类型 1:美尚采购店铺 2:美尚分成店铺 美尚会店铺 4:在线商城',
  `operational_model` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '和平台合作运营方式 0 :保留 1：联营 2：自营',
  `auth_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '营业状态 -2：未通过-1：关闭 0：待审核 1：建设中 2：经营中',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `factory_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '厂商 id',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认厂商 1：默认 0：不默认',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '公司类型 1：供应商 2、采购商 ',
  `consignee_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `consignee_mobile_phone` varchar(15) NOT NULL DEFAULT '' COMMENT '收货人手机号码',
  `province` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '省',
  `city` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '市',
  `area` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '区',
  `detail_address` varchar(512) NOT NULL DEFAULT '' COMMENT '详细地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='店铺表';

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('164', '18', '1', '4', '1', '0', '0', '1543809052', '0', '9', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('165', '18', '1', '3', '1', '0', '0', '1543809065', '0', '9', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('166', '14', '2', '3', '1', '0', '0', '1543809299', '0', '9', '1', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('167', '14', '2', '4', '1', '0', '0', '1543809308', '0', '9', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('168', '19', '1', '3', '1', '0', '0', '1543809549', '0', '8', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('169', '20', '1', '1', '1', '0', '0', '1543819341', '0', '12', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('170', '20', '1', '2', '1', '0', '0', '1543819349', '0', '12', '0', '0', '蓝胖子', '13087799222', '18', '0', '2', '珠江帝景苑');
INSERT INTO `store` VALUES ('171', '20', '1', '3', '1', '0', '0', '1543819358', '0', '12', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('172', '15', '2', '1', '1', '0', '0', '1543819366', '0', '12', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('173', '16', '2', '2', '1', '0', '0', '1543819390', '0', '12', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('174', '17', '2', '3', '1', '0', '0', '1543819400', '0', '12', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('175', '21', '1', '3', '1', '0', '0', '1543823676', '0', '14', '1', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('176', '21', '1', '4', '1', '0', '0', '1543823683', '0', '14', '0', '0', '八戒', '18263366522', '12', '0', '1', '西湖北路110号');
INSERT INTO `store` VALUES ('177', '18', '2', '3', '1', '0', '0', '1543823689', '0', '14', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('178', '19', '2', '4', '1', '0', '0', '1543823696', '0', '14', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('179', '22', '1', '1', '1', '0', '0', '1543827123', '0', '16', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('180', '21', '2', '2', '1', '0', '0', '1543827171', '0', '16', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('181', '23', '1', '1', '1', '0', '0', '1543828564', '0', '13', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('182', '23', '1', '2', '1', '0', '0', '1543828571', '0', '13', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('183', '23', '1', '3', '1', '0', '0', '1543828576', '0', '13', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('184', '24', '1', '3', '1', '0', '0', '1544067881', '0', '10', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('185', '25', '1', '3', '1', '0', '0', '1547692220', '0', '11', '1', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('186', '26', '1', '1', '1', '0', '0', '1547872996', '0', '17', '0', '0', '', '', '0', '0', '0', '');
INSERT INTO `store` VALUES ('187', '27', '1', '4', '1', '0', '0', '1554794593', '0', '18', '1', '0', '', '', '0', '0', '0', '');

-- ----------------------------
-- Table structure for tweet
-- ----------------------------
DROP TABLE IF EXISTS `tweet`;
CREATE TABLE `tweet` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `img` varchar(4000) NOT NULL DEFAULT '' COMMENT '推文标题图',
  `img_description` varchar(2000) NOT NULL DEFAULT '' COMMENT '图片描述或消息类推文消息文本',
  `video` varchar(4000) NOT NULL DEFAULT '' COMMENT '视频',
  `video_description` varchar(2000) NOT NULL DEFAULT '' COMMENT '视频说明',
  `goods_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '商品ids',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产商id',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `run_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '经营类型 1：采购店铺 2：零售店铺 3：分成店铺',
  `release_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '推文类型 1：图片消息 2：视频消息 3：文章',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推文表';

-- ----------------------------
-- Records of tweet
-- ----------------------------

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `key` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '键',
  `value` varchar(30) NOT NULL DEFAULT '' COMMENT '值',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单位表';

-- ----------------------------
-- Records of unit
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名（即账号），可用于登录系统',
  `nickname` varchar(64) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `mobile_phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号，可用于登录系统',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态 0：正常； 1：禁用 ；2：删除',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型 0：不可登陆 1：游客，可登陆 2：已实名认证',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码',
  `role_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户角色id',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '盐值',
  `birthday` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('17', '张敏', '', '18819362618', '0', '1', 'ae020c13647d47182e178951c98fa1f3', '1', 'user_avatar/2019081717253663528.jpeg', '0', 'qkLISmHeOG', '0', '1566128014', '1561345595', '0');
INSERT INTO `user` VALUES ('48', 'GFrien', '', '13265155634', '0', '1', '757146f34f494332a368f78826c6a7ed', '0', 'user_avatar/2019061210062327981.jpeg', '0', 'YaAelLcKEv', '0', '1561715120', '0', '0');
INSERT INTO `user` VALUES ('54', '翁先生', '', '13422826641', '0', '1', '56923613efb916e45dd4140b5bec924d', '1', 'user_avatar/2019060609260964384.png', '0', 'VXukixEAtQ', '0', '1566179111', '1559783169', '1564558618');
INSERT INTO `user` VALUES ('55', '楠楠', '', '15914540659', '0', '1', 'ae49547da680549422cc86aafc0dc3b4', '1', 'user_avatar/201906271915388803106695.jpeg', '0', 'zldFiMkHDN', '0', '1566294030', '1559802761', '0');
INSERT INTO `user` VALUES ('56', '戴宏彬', '', '13710651399', '0', '1', '1fcea49f87a068e4746e0cc492f78414', '1', 'user_avatar/2019060617031059688.jpeg', '0', 'UqidAlIRDt', '0', '1564585644', '1559807236', '1563240271');
INSERT INTO `user` VALUES ('61', '申文彰@黑森森', '', '13202029172', '0', '1', 'c166239e44279e96291bd68db8f4cb36', '1', 'user_avatar/201906251541024780486162.jpeg', '0', 'RtIzXoHPvq', '0', '1562383121', '1561034690', '1562383121');
INSERT INTO `user` VALUES ('64', '杨观保', '', '18664368697', '0', '1', '7b5619709cb2e214fb241b27c89056ca', '1', 'user_avatar/2019081610505874163.jpeg', '0', 'cPOoJBgaCV', '0', '1566206233', '1561344118', '0');
INSERT INTO `user` VALUES ('65', '小朱888', '', '13679898380', '0', '1', '5a3ad5db7b3b7566bbceba72aa8fed4f', '1', 'user_avatar/2019081611104264834.jpeg', '0', 'WrsVDzIgtf', '0', '1566377419', '1561345595', '1565772271');
INSERT INTO `user` VALUES ('66', '夏麟溪～新营销指导～超级方案', '', '15874097913', '0', '1', 'db0877cdb9dcb1aa59b030050ebad811', '0', 'user_avatar/201906261712436818343106.jpeg', '0', 'HVYrbigopL', '0', '1561540363', '1561540363', '0');
INSERT INTO `user` VALUES ('67', '吴亚南', '', '18588502656', '0', '1', 'f6f640db504f12080726d135e2fe27a8', '0', 'user_avatar/2019081920220521117.jpeg', '0', 'cQostuYCyT', '0', '1566217244', '1561675014', '0');
INSERT INTO `user` VALUES ('68', '丁丁', '', '13580598866', '0', '1', '2ca4f08a7be40549cfffcf1934a73b93', '0', 'user_avatar/201906281604037198643709.jpeg', '0', 'jRBvxMKQeA', '0', '1561708974', '1561708974', '0');
INSERT INTO `user` VALUES ('70', '美惠子', '', '15000937849', '0', '1', 'f3224b9de9210eb289b64ded35482cd2', '0', 'user_avatar/201906290004074331990091.jpeg', '0', 'DhIMYXidTb', '0', '1561737709', '1561737709', '0');
INSERT INTO `user` VALUES ('71', 'Sunshine', '', '13725317046', '0', '1', '6454e919e3a4d0dc3d99e77c5e0f45c4', '0', 'user_avatar/201907011234065760172840.jpeg', '0', 'KziEZujnxa', '0', '1561955646', '1561955646', '0');
INSERT INTO `user` VALUES ('72', '习·俊', '', '13250591333', '0', '1', 'e7d395cf84187f01fa8992a73fd4a620', '0', 'user_avatar/201907011305199865250847.jpeg', '0', 'pMSJALcRHx', '0', '1561957519', '1561957519', '0');
INSERT INTO `user` VALUES ('73', '兰兰', '', '18092240389', '0', '1', '45f2c35fda04c1f1fc40ddef1515ed55', '0', 'user_avatar/201907011356263314589075.jpeg', '0', 'ezwOojaVAC', '0', '1561960586', '1561960586', '0');
INSERT INTO `user` VALUES ('74', '韵如帆', '', '13711117953', '0', '1', '0c58803ebc9548d7260c69336ed1c247', '0', 'user_avatar/201907030817448669308684.jpeg', '0', 'dvyZFkIhlL', '0', '1562113020', '1562113020', '0');
INSERT INTO `user` VALUES ('75', '维观孙月恒', '', '15918567008', '0', '1', '3a07dae3c97f1c658894465e933838bd', '0', 'user_avatar/201907052232138415406676.jpeg', '0', 'TtEmZdhkwg', '0', '1562337116', '1562337116', '0');
INSERT INTO `user` VALUES ('76', '爱的海洋', '', '18057198666', '0', '1', '5c3cedeb659a15789fee08eb57486e0b', '0', 'user_avatar/201907061105423741272013.jpeg', '0', 'krtSjoyzWU', '0', '1562379562', '1562379562', '0');
INSERT INTO `user` VALUES ('77', '魏北京', '', '13113988802', '0', '1', 'e9164f316019ea4dc5e5273f39950154', '0', 'user_avatar/201907080748479849095833.jpeg', '0', 'LZdCzgJnak', '0', '1562543295', '1562543295', '0');
INSERT INTO `user` VALUES ('78', '一切随缘', '', '18984552671', '0', '1', 'e478c79a567dd64722a75a6ea903793b', '0', 'user_avatar/201907090855585990471905.jpeg', '0', 'stAfVuYczj', '0', '1562633758', '1562633758', '0');
INSERT INTO `user` VALUES ('79', '江西溢珊红美业生态运行商', '', '17370450285', '0', '1', '8a4f8f1e5f71bda6ea843148c539a29a', '0', 'user_avatar/201907171349416530414230.jpeg', '0', 'MTfALjYXeC', '0', '1563342581', '1563342581', '0');
INSERT INTO `user` VALUES ('80', '红鲈鱼与绿鲈鱼与驴', '', '15816810345', '0', '1', 'e42650322cc42e8bc5b088cb6197d6e7', '0', 'user_avatar/201907172026141069357825.jpeg', '0', 'zgdpNrOJKk', '0', '1564196385', '1563366260', '0');
INSERT INTO `user` VALUES ('81', '', '', '13719453459', '0', '1', 'f6175a6f0e82688f754ba0faf20a0e74', '0', '', '0', 'uLpXIHfJCr', '0', '1563519576', '1563519576', '0');
INSERT INTO `user` VALUES ('82', 'H☆H萍℡', '', '15013141043', '0', '1', '2e96fdea41bf9b1f1f7c94524dbbdda3', '0', 'user_avatar/201907231527125627063049.jpeg', '0', 'BiznCAgVGk', '0', '1563866832', '1563866832', '0');
INSERT INTO `user` VALUES ('83', '張栋', '', '13078517711', '0', '1', '368a5701134da512b58fb9c1a65ece10', '0', 'user_avatar/201908071701308931239005.jpeg', '0', 'iQpHLsojuf', '0', '1565168437', '1565168437', '0');
INSERT INTO `user` VALUES ('84', '杨洪华', '', '15188885599', '0', '1', '7a82b85912f21389f9961fcf6306b48a', '0', 'user_avatar/201908131036107464699842.jpeg', '0', 'eQzNSBnqkh', '0', '1565663430', '1565663430', '0');

-- ----------------------------
-- Table structure for user_factory
-- ----------------------------
DROP TABLE IF EXISTS `user_factory`;
CREATE TABLE `user_factory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态 0：正常； 1：禁用 ；2：删除',
  `factory_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '厂商ID：factory.id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：user.id',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认厂商 1：默认 0：不默认',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型：0：保留 1：拥有者 2:管理员 3：店长 4：员工',
  `factory_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '公司类型 1：供应商 2、采购商 ',
  `user_name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户在机构中的昵称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COMMENT='用户-公司-关联表';

-- ----------------------------
-- Records of user_factory
-- ----------------------------
INSERT INTO `user_factory` VALUES ('149', '0', '8', '16', '0', '1', '2', '');
INSERT INTO `user_factory` VALUES ('150', '0', '9', '17', '1', '1', '2', '');
INSERT INTO `user_factory` VALUES ('151', '0', '10', '16', '0', '1', '1', '');
INSERT INTO `user_factory` VALUES ('152', '0', '11', '19', '1', '1', '2', '');
INSERT INTO `user_factory` VALUES ('153', '0', '12', '20', '1', '1', '1', '');
INSERT INTO `user_factory` VALUES ('154', '0', '13', '20', '0', '1', '1', '');
INSERT INTO `user_factory` VALUES ('155', '0', '12', '22', '0', '2', '1', '周润发');
INSERT INTO `user_factory` VALUES ('156', '0', '12', '23', '0', '2', '1', '彭于晏');
INSERT INTO `user_factory` VALUES ('157', '2', '12', '24', '0', '2', '1', '黎明');
INSERT INTO `user_factory` VALUES ('158', '0', '12', '25', '0', '2', '1', '梅兰芳');
INSERT INTO `user_factory` VALUES ('159', '0', '14', '20', '1', '1', '2', '');
INSERT INTO `user_factory` VALUES ('160', '0', '15', '20', '0', '1', '2', '');
INSERT INTO `user_factory` VALUES ('161', '0', '14', '34', '0', '2', '2', '笑傲江湖');
INSERT INTO `user_factory` VALUES ('162', '0', '14', '35', '0', '2', '2', '神雕侠侣');
INSERT INTO `user_factory` VALUES ('163', '0', '14', '36', '0', '2', '2', '倚天屠龙记');
INSERT INTO `user_factory` VALUES ('164', '2', '14', '37', '0', '2', '2', '连');
INSERT INTO `user_factory` VALUES ('165', '0', '16', '17', '0', '1', '1', '');
INSERT INTO `user_factory` VALUES ('167', '0', '17', '19', '1', '1', '1', '');
INSERT INTO `user_factory` VALUES ('168', '0', '17', '19', '0', '2', '1', 'aa111');
INSERT INTO `user_factory` VALUES ('169', '0', '11', '19', '1', '2', '2', '涉及到法律是定金付了定金');
INSERT INTO `user_factory` VALUES ('170', '0', '18', '16', '1', '1', '2', '');
INSERT INTO `user_factory` VALUES ('171', '0', '9', '19', '0', '2', '2', '123');

-- ----------------------------
-- Table structure for user_store
-- ----------------------------
DROP TABLE IF EXISTS `user_store`;
CREATE TABLE `user_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0：正常； 1：禁用 ；2：删除',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：user.id',
  `factory_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '供应商ID：factory.id',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID：organize.id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型：0：保留 1：拥有者 3：店长 4：员工',
  `user_name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户在店铺中的昵称',
  `post` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '岗位：0 ：保留 其他：见配置文件permission.php',
  `duty` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '职务：0 ：保留 其他：见配置文件permission.php',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COMMENT='用户-店铺-关联表';

-- ----------------------------
-- Records of user_store
-- ----------------------------
INSERT INTO `user_store` VALUES ('176', '0', '17', '9', '164', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('177', '0', '17', '9', '165', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('178', '0', '17', '9', '166', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('179', '0', '17', '9', '167', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('180', '0', '16', '8', '168', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('181', '0', '16', '8', '168', '3', '阿三', '0', '0');
INSERT INTO `user_store` VALUES ('182', '0', '20', '12', '169', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('183', '0', '20', '12', '170', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('184', '0', '20', '12', '171', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('185', '0', '20', '12', '172', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('186', '0', '20', '12', '173', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('187', '0', '20', '12', '174', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('188', '2', '27', '12', '171', '3', '阿里巴', '0', '0');
INSERT INTO `user_store` VALUES ('189', '0', '26', '12', '170', '3', '阿里巴巴', '0', '0');
INSERT INTO `user_store` VALUES ('190', '0', '26', '12', '171', '3', '腾讯', '0', '0');
INSERT INTO `user_store` VALUES ('191', '2', '26', '12', '172', '3', '百度', '0', '0');
INSERT INTO `user_store` VALUES ('192', '0', '26', '12', '169', '3', '百度', '0', '0');
INSERT INTO `user_store` VALUES ('206', '0', '29', '9', '165', '3', '关羽', '0', '0');
INSERT INTO `user_store` VALUES ('208', '0', '30', '0', '165', '4', '王小波', '12', '12');
INSERT INTO `user_store` VALUES ('209', '0', '28', '0', '170', '4', '名侦探柯南', '11', '12');
INSERT INTO `user_store` VALUES ('210', '0', '31', '0', '170', '4', '小丸子', '13', '14');
INSERT INTO `user_store` VALUES ('211', '0', '32', '0', '170', '4', '犬夜叉1', '14', '13');
INSERT INTO `user_store` VALUES ('214', '0', '33', '0', '170', '4', '多啦A梦', '16', '14');
INSERT INTO `user_store` VALUES ('215', '0', '20', '14', '175', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('216', '0', '20', '14', '176', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('217', '0', '20', '14', '177', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('218', '0', '20', '14', '178', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('219', '2', '22', '14', '176', '3', '逍遥子', '0', '0');
INSERT INTO `user_store` VALUES ('220', '0', '22', '14', '176', '3', '逍遥子', '0', '0');
INSERT INTO `user_store` VALUES ('221', '0', '22', '14', '175', '3', '令狐冲', '0', '0');
INSERT INTO `user_store` VALUES ('223', '0', '23', '0', '176', '4', '孙悟空', '11', '11');
INSERT INTO `user_store` VALUES ('224', '0', '24', '0', '176', '4', '唐僧', '12', '12');
INSERT INTO `user_store` VALUES ('225', '0', '25', '0', '176', '4', '猪八戒', '13', '13');
INSERT INTO `user_store` VALUES ('226', '0', '17', '16', '179', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('227', '0', '17', '16', '180', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('228', '0', '20', '13', '181', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('229', '0', '20', '13', '182', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('230', '0', '20', '13', '183', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('231', '0', '16', '10', '184', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('232', '0', '16', '10', '184', '3', '阿三', '0', '0');
INSERT INTO `user_store` VALUES ('233', '0', '19', '11', '185', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('234', '0', '19', '17', '186', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('235', '0', '19', '17', '186', '3', 'bb', '0', '0');
INSERT INTO `user_store` VALUES ('236', '0', '19', '11', '185', '3', '11', '0', '0');
INSERT INTO `user_store` VALUES ('237', '0', '16', '18', '187', '1', '', '0', '0');
INSERT INTO `user_store` VALUES ('238', '0', '16', '18', '187', '3', 'aa', '0', '0');
INSERT INTO `user_store` VALUES ('239', '0', '17', '9', '164', '3', 'aa', '0', '0');
INSERT INTO `user_store` VALUES ('240', '0', '29', '9', '166', '3', 'test', '0', '0');
INSERT INTO `user_store` VALUES ('241', '0', '29', '9', '167', '3', 'test1', '0', '0');

-- ----------------------------
-- Table structure for user_store_node
-- ----------------------------
DROP TABLE IF EXISTS `user_store_node`;
CREATE TABLE `user_store_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0：正常； 1：禁用 ；2：删除',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型：0：保留',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：user.id',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID：store.id',
  `node_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '节点ID：permission.authentication.node.id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='用户-店铺-节点-关联表';

-- ----------------------------
-- Records of user_store_node
-- ----------------------------
INSERT INTO `user_store_node` VALUES ('13', '0', '1', '30', '165', '12');
INSERT INTO `user_store_node` VALUES ('19', '0', '1', '28', '170', '11');
INSERT INTO `user_store_node` VALUES ('20', '0', '1', '28', '170', '12');
INSERT INTO `user_store_node` VALUES ('21', '0', '1', '28', '170', '13');
INSERT INTO `user_store_node` VALUES ('22', '0', '1', '31', '170', '11');
INSERT INTO `user_store_node` VALUES ('23', '0', '1', '31', '170', '14');
INSERT INTO `user_store_node` VALUES ('24', '0', '1', '31', '170', '31');
INSERT INTO `user_store_node` VALUES ('25', '0', '1', '31', '170', '51');
INSERT INTO `user_store_node` VALUES ('26', '0', '1', '31', '170', '54');
INSERT INTO `user_store_node` VALUES ('27', '0', '1', '31', '170', '71');
INSERT INTO `user_store_node` VALUES ('28', '0', '1', '31', '170', '91');
INSERT INTO `user_store_node` VALUES ('29', '0', '1', '32', '170', '12');
INSERT INTO `user_store_node` VALUES ('30', '0', '1', '32', '170', '15');
INSERT INTO `user_store_node` VALUES ('40', '0', '1', '33', '170', '15');
INSERT INTO `user_store_node` VALUES ('41', '0', '1', '33', '170', '12');
INSERT INTO `user_store_node` VALUES ('42', '0', '1', '33', '170', '52');
INSERT INTO `user_store_node` VALUES ('43', '0', '1', '33', '170', '72');
INSERT INTO `user_store_node` VALUES ('44', '0', '1', '33', '170', '92');
INSERT INTO `user_store_node` VALUES ('48', '0', '1', '23', '176', '11');
INSERT INTO `user_store_node` VALUES ('49', '0', '1', '23', '176', '12');
INSERT INTO `user_store_node` VALUES ('51', '0', '1', '24', '176', '11');
INSERT INTO `user_store_node` VALUES ('52', '0', '1', '24', '176', '14');
INSERT INTO `user_store_node` VALUES ('53', '0', '1', '25', '176', '12');
INSERT INTO `user_store_node` VALUES ('54', '0', '1', '25', '176', '15');
INSERT INTO `user_store_node` VALUES ('55', '0', '1', '25', '176', '52');
INSERT INTO `user_store_node` VALUES ('56', '0', '1', '25', '176', '72');
INSERT INTO `user_store_node` VALUES ('57', '0', '1', '25', '176', '92');
