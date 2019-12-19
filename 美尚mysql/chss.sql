/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 50624
Source Host           : 120.79.201.125:3306
Source Database       : chss

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-08-21 16:56:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ad_positions
-- ----------------------------
DROP TABLE IF EXISTS `ad_positions`;
CREATE TABLE `ad_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告栏名',
  `key` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '广告类型 ',
  `shelf_status` tinyint(4) NOT NULL DEFAULT '3' COMMENT '是否打开广告位:1.关闭 3.打开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='广告类型表';

-- ----------------------------
-- Records of ad_positions
-- ----------------------------
INSERT INTO `ad_positions` VALUES ('1', '在线商城首页顶部广告', 'index_top', '1', '3');
INSERT INTO `ad_positions` VALUES ('2', '在线商城首页轮播广告', 'index_carousel', '1', '3');
INSERT INTO `ad_positions` VALUES ('3', '预约首页顶部广告', 'appointment_index_top', '1', '3');
INSERT INTO `ad_positions` VALUES ('4', '预约首页轮播广告', 'appointment_carousel', '1', '3');
INSERT INTO `ad_positions` VALUES ('5', '', '', '1', '3');
INSERT INTO `ad_positions` VALUES ('6', '', '', '1', '3');

-- ----------------------------
-- Table structure for advertise_details
-- ----------------------------
DROP TABLE IF EXISTS `advertise_details`;
CREATE TABLE `advertise_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `belong_to` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 1：在线商城首页顶部广告 2:预约首页顶部广告',
  `thumb_img` varchar(200) NOT NULL DEFAULT '' COMMENT '缩略图',
  `detail_img` varchar(2500) NOT NULL DEFAULT '' COMMENT '详情图',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态标识位 0：正常 1：删除',
  `share_title` varchar(255) NOT NULL DEFAULT '' COMMENT '分享标题',
  `share_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '分享描述',
  `thumb_img_desc` varchar(2000) DEFAULT '' COMMENT '缩略图简介',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='广告详情';

-- ----------------------------
-- Records of advertise_details
-- ----------------------------
INSERT INTO `advertise_details` VALUES ('2', '1', 'advertise/1565761646658417.jpg', 'advertise/1565754426752964.jpg,advertise/1565754426516403.jpg,advertise/1565754426619895.jpg,advertise/1565754427517369.jpg,advertise/1565754427625100.jpg,advertise/1565754427467602.jpg,advertise/1565754427329289.jpg,advertise/1565754427749259.jpg,advertise/1565754427149556.jpg,advertise/1565754427428611.jpg,advertise/1565754427637616.jpg,advertise/1565754427552507.jpg,advertise/1565754427766916.jpg', '1565755359', '1565761649', '0', '', '', '', '0', '');
INSERT INTO `advertise_details` VALUES ('3', '2', 'advertise/1565761679529931.jpg', 'advertise/1565761359173739.jpg,advertise/1565761360355381.jpg,advertise/1565761360705396.jpg,advertise/1565761360294282.jpg,advertise/1565761360315669.jpg,advertise/1565761361722560.jpg,advertise/1565761361296148.jpg,advertise/1565761361115598.jpg,advertise/1565761361390236.jpg,advertise/1565761361353740.jpg,advertise/1565761361648457.jpg', '1565761369', '1565761682', '0', '', '', '', '0', '');
INSERT INTO `advertise_details` VALUES ('4', '4', 'advertise/1566202163715291.jpg', 'advertise/1566202193148039.jpg,advertise/1566202193850973.jpg,advertise/1566202193129092.jpg,advertise/1566202193851141.jpg', '1566202198', '1566356898', '0', '', '', '', '0', '会员优惠');
INSERT INTO `advertise_details` VALUES ('5', '4', 'advertise/1566204699226973.jpg', 'advertise/1566204717822216.jpg,advertise/1566204717497590.jpg,advertise/1566204717986406.jpg,advertise/1566204717650882.jpg', '1566204719', '1566356874', '0', '', '', '', '0', '新客源');
INSERT INTO `advertise_details` VALUES ('6', '4', 'advertise/1566204890758512.jpg', 'advertise/1566204900222212.jpg,advertise/1566204900974573.jpg,advertise/1566204900399113.jpg,advertise/1566204900824455.jpg', '1566204903', '1566356864', '0', '', '', '', '0', '会员卡');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(18) NOT NULL DEFAULT '' COMMENT '商标名称',
  `type` char(10) NOT NULL DEFAULT '0' COMMENT '商标类别',
  `logo` varchar(200) NOT NULL DEFAULT '' COMMENT '商标图片',
  `certificate` varchar(200) NOT NULL DEFAULT '' COMMENT '商标证书',
  `authorization` varchar(200) NOT NULL DEFAULT '' COMMENT '授权书',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态标识位 0：正常 1：删除',
  `auth_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核标识位 0：待审核 1：审核通过 2：审核不通过',
  `is_default` tinyint(3) NOT NULL DEFAULT '0' COMMENT '1：默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商标表';

-- ----------------------------
-- Records of brand
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '买家id',
  `foreign_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '购买商品数量',
  `create_time` int(20) NOT NULL DEFAULT '0' COMMENT '加入购物车时间',
  `goods_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型：0 保留 1 商品 2项目',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1324 DEFAULT CHARSET=utf8 COMMENT='购物车数据表';

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for city_area
-- ----------------------------
DROP TABLE IF EXISTS `city_area`;
CREATE TABLE `city_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` int(11) DEFAULT '0' COMMENT '城市code',
  `province_name` varchar(200) DEFAULT '',
  `city_name` varchar(200) DEFAULT '',
  `province_code` int(11) DEFAULT '0' COMMENT '区域id',
  `level` tinyint(3) DEFAULT '0' COMMENT '城市级别',
  `cpmi_id` tinyint(3) DEFAULT '3' COMMENT '合伙人市场分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `city_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '申请状态：0 ：开放 1：关闭',
  `alone_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '资格款 没有使用统一价',
  `alone_earnest` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金 没有使用统一价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='国内城市区域表';

-- ----------------------------
-- Records of city_area
-- ----------------------------

-- ----------------------------
-- Table structure for city_partner
-- ----------------------------
DROP TABLE IF EXISTS `city_partner`;
CREATE TABLE `city_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sn` varchar(32) NOT NULL DEFAULT '' COMMENT '编号',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `company_name` varchar(25) NOT NULL DEFAULT '' COMMENT '企业名称',
  `applicant` varchar(25) NOT NULL DEFAULT '' COMMENT '申请人',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机电话',
  `province_code` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '省',
  `city_code` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '市',
  `city_name` varchar(200) DEFAULT '' COMMENT '市场名称',
  `city_level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '城市等级',
  `market_name` varchar(25) DEFAULT '' COMMENT '市场名称',
  `earnest` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '资格款',
  `payment_time` varchar(14) NOT NULL DEFAULT '' COMMENT '支付时间',
  `pay_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '支付订单号',
  `pay_code` varchar(10) NOT NULL DEFAULT '0' COMMENT '''支付方式：1 微信 2：支付宝 3：网银 4:线下支付',
  `balance_sn` varchar(32) NOT NULL DEFAULT '' COMMENT '尾款内部订单编号',
  `apply_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '申请状态：0：临时 1:选择城市 2:提交资料 3:待审核（已交定金） 4审核通过  5 交清尾款',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `earnest_sn` varchar(32) NOT NULL DEFAULT '' COMMENT '定金内部订单编号',
  `city_area_id` int(11) DEFAULT NULL COMMENT '城市区域id',
  `is_partner` tinyint(3) DEFAULT '0' COMMENT '1-合伙人，0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市合伙人申请表';

-- ----------------------------
-- Records of city_partner
-- ----------------------------

-- ----------------------------
-- Table structure for city_partner_market_info
-- ----------------------------
DROP TABLE IF EXISTS `city_partner_market_info`;
CREATE TABLE `city_partner_market_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(10) NOT NULL DEFAULT '0' COMMENT '市场名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '资格款',
  `earnest` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市合伙人市场价格表';

-- ----------------------------
-- Records of city_partner_market_info
-- ----------------------------

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'user_id',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(20) NOT NULL DEFAULT '0' COMMENT '加入时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：user.id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `score` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '分数',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单号',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单号',
  `title` varchar(200) NOT NULL DEFAULT '此用户没有填写标题' COMMENT '标题',
  `content` varchar(2000) NOT NULL DEFAULT '此用户没有填写评论' COMMENT '内容',
  `img` varchar(2000) NOT NULL DEFAULT '' COMMENT '图片',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'user_id',
  `company_name` varchar(300) NOT NULL DEFAULT '' COMMENT '机构名',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '个人名称',
  `mobile_phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员所属企业信息表';

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for express
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `name` varchar(50) NOT NULL COMMENT '公司名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态1启用 2弃用',
  `code` varchar(50) NOT NULL COMMENT '编号',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `order` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1常用0不常用',
  `url` varchar(100) NOT NULL COMMENT '公司网址',
  `tel` varchar(50) NOT NULL DEFAULT '0' COMMENT '客服电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递公司';

-- ----------------------------
-- Records of express
-- ----------------------------

-- ----------------------------
-- Table structure for franchise
-- ----------------------------
DROP TABLE IF EXISTS `franchise`;
CREATE TABLE `franchise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(25) NOT NULL DEFAULT '' COMMENT '加盟店名称',
  `applicant` varchar(25) NOT NULL DEFAULT '' COMMENT '申请人',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机电话',
  `province` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '省',
  `city` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '市',
  `area` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '区',
  `detail_address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `franchise_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加盟费',
  `payment_time` varchar(14) NOT NULL DEFAULT '' COMMENT '支付时间',
  `pay_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '支付订单号',
  `pay_code` varchar(10) NOT NULL DEFAULT '0' COMMENT '''支付方式：1 微信 2：支付宝 3：网银 4:线下支付',
  `sn` varchar(32) NOT NULL DEFAULT '' COMMENT '内部订单编号',
  `apply_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '申请状态：0：预定登记 1:待付款 2:已付款',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加盟店申请表';

-- ----------------------------
-- Records of franchise
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '商品名称',
  `headline` varchar(500) NOT NULL DEFAULT '' COMMENT '标题文案',
  `franchise_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加盟价',
  `sample_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '样品价格',
  `minimum_order_quantity` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '订单起订量',
  `minimum_sample_quantity` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '样品起订量',
  `share_title` varchar(255) NOT NULL DEFAULT '' COMMENT '分享标题',
  `share_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '分享描述',
  `specification` varchar(1000) NOT NULL DEFAULT '' COMMENT '商品规格',
  `purchase_specification_description` varchar(100) NOT NULL DEFAULT '' COMMENT '商品购买规格描述',
  `specification_unit` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商品规格的单位',
  `category_id_1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类1',
  `category_id_2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类2',
  `category_id_3` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类3',
  `intro` varchar(2000) NOT NULL DEFAULT '' COMMENT '商品介绍',
  `parameters` varchar(5000) NOT NULL DEFAULT '' COMMENT '参数',
  `thumb_img` varchar(200) NOT NULL DEFAULT '' COMMENT '缩略图',
  `thumb_img_desc` varchar(2000) DEFAULT '' COMMENT '缩略图简介',
  `thumb_img_type` tinyint(3) DEFAULT NULL COMMENT '1：大图2：小图',
  `main_img` varchar(2500) NOT NULL DEFAULT '' COMMENT '首焦图',
  `detail_img` varchar(2500) NOT NULL DEFAULT '' COMMENT '详情图',
  `goods_video` varchar(255) NOT NULL DEFAULT '' COMMENT '视频',
  `tag` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `shelf_status` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '商品上下架标识位 1：下架 2：待审核 3 上架',
  `rq_code_url` varchar(300) NOT NULL DEFAULT '' COMMENT '商品二维码图片',
  `inventory` int(10) NOT NULL DEFAULT '0' COMMENT '库存',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `purchase_unit` tinyint(3) NOT NULL DEFAULT '0' COMMENT '采购单位',
  `increase_quantity` smallint(5) NOT NULL DEFAULT '1' COMMENT '起订递增数量',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '店铺Id',
  `is_selection` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：不是精选 1：精选',
  `belong_to` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '归属：0 ：无 1：中心店 2：工作室。  使用二进制存储',
  `goods_code` varchar(300) NOT NULL DEFAULT '' COMMENT '商品货号',
  `retail_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `factory_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '出厂价',
  `agent_special_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '代理特价',
  `agent_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '代理价',
  `franchise_special_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加盟特价',
  `belong_to_member_buy` tinyint(3) unsigned NOT NULL DEFAULT '6' COMMENT '平台会员身份：1、普通会员, 2、加盟店家 4、城市合伙人 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品表';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('476', '黑森森多肽新生头皮原液', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '343.00', '0.00', '1', '1', '黑森森多肽新生头皮原液：拯救脱发掉发人群，防脱育发黑科技', '选用天然植萃做原材料，特添加血清蛋白和多肽等多种活性成分，有效改善脱发问题，强根健发、促发再生', '10mlx8，8次/盒', '', '0', '76', '0', '0', '选用天然植萃做原材料，特添加血清蛋白和多肽等多种活性成分，有效改善脱发问题，强根健发、促发再生。', '<p style=\"white-space: normal;\"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 宋体;\">产品规格</span></strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 宋体;\">净含量：</span></strong><span style=\"font-family: 宋体;\">10mlx8瓶</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 宋体;\">产品成分：</span></strong><span style=\"font-family: 宋体;\">水、1,2-戊二醇、肌醇、丁二醇、血清蛋白、香橙（CITRUS JUNOS）果提取物、精氨酸、野大豆（GLYCINE SOJA）胚芽提取物、小麦（TRITICUM VULGARE）胚芽提取物、黄芩（SCUTELLARIA BAICALENSIS）根提取物、芍药（PAEONIA ALBIFLORA）根提取物、泛醇、姜黄（CURCUMA LONGA）根茎提取物、苯氧乙醇、乙基己基甘油、侧柏（BIOTA ORIENTALIS）叶提取物、生物类黄酮、羟苯基丙酰胺苯甲酸、羟乙基纤维素、β-葡聚糖、聚乙二醇-115M、三肽-1 铜、棕榈酰寡肽、棕榈酰四肽-7、棕榈酰五肽-4</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">使用人群：所有肤质</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1565588537143458.jpg', '选用天然植萃做原材料特添加血清蛋白和多肽等多种活性成分真正激活毛囊干细胞有效改善脱发掉发问题', '1', 'hss_goods/1565588537143458.jpg,hss_goods/1560392422700634.jpg,hss_goods/1560392422597483.jpg,hss_goods/1560392422953547.jpg', 'hss_goods/1558426989114048.gif,hss_goods/1558426991926715.gif,hss_goods/1558427001822904.gif,hss_goods/1558427009374115.gif,hss_goods/1558427012809584.gif,hss_goods/1558427015991888.gif,hss_goods/1558427018500241.gif,hss_goods/1558427022469342.gif,hss_goods/1558427026103520.gif,hss_goods/1558427031384950.gif,hss_goods/1558427035736476.gif', '', '活性肽,防脱育发,原液', '3', 'hss_goods/compose/2019081509300360553.jpg', '0', '1565588578', '1565832603', '20', '0', '4', '1', '0', '0', '2', '', '980.00', '0.00', '0.00', '245.00', '0.00', '6');
INSERT INTO `goods` VALUES ('477', '黑森森多肽首乌头皮原液', '多肽首乌头皮原液乌发黑发血清蛋白活性肽头皮原液套居家护理白转黑', '343.00', '0.00', '1', '1', '黑森森多肽首乌头皮原液：直击根源，修复、激活毛囊细胞', '选用天然植萃做原材料，特添加血清蛋白和多肽等多种活性成分，有效改善白发问题，使白发转黑，再现年轻活力', '10mlx8，8次/盒', '', '0', '76', '0', '0', '选用天然植萃做原材料，特添加血清蛋白和多肽等多种活性成分，有效改善白发问题，使白发转黑，再现年轻活力。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\">产品规格</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">净含量：10mlx8</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\">产品成分：水、1,2-戊二醇、肌醇、血清蛋白、丁二醇、芍药（PAEONIA ALBIFLORA）根提取物、羟高铁血红素、泛醇、鸟苷、苯氧乙醇、乙基己基甘油、羟苯基丙酰胺苯甲酸、积雪草（CENTELLA ASIATICA）根提取物、羟乙基纤维素、β-葡聚糖、三肽-1 铜、聚乙二醇-115M、棕榈酰寡肽、棕榈酰四肽-7、棕榈酰五肽-4</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">使用人群：所有肤质</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1565588788498584.jpg', '选用天然植萃做原材料特添加血清蛋白和多肽等多种活性成分有效改善白发问题实现白发转黑再现年轻态', '1', 'hss_goods/1565588788498584.jpg,hss_goods/1560392328710472.jpg,hss_goods/1560392328101636.jpg,hss_goods/1560392328124130.jpg', 'hss_goods/1558425728655662.jpg,hss_goods/1558425728621178.jpg,hss_goods/1558425728961251.jpg,hss_goods/1558425728993772.jpg,hss_goods/1558425728951472.jpg,hss_goods/1558425728683792.jpg,hss_goods/1558425728386457.jpg,hss_goods/1558425728110883.jpg,hss_goods/1558425728752214.jpg,hss_goods/1558425728957608.jpg,hss_goods/1558425728932634.jpg', '', '活性肽,乌发黑发,原液', '3', 'hss_goods/compose/2019081409172834151.jpg', '0', '1565588819', '1565745447', '18', '0', '4', '1', '0', '0', '2', '', '980.00', '0.00', '0.00', '245.00', '0.00', '6');
INSERT INTO `goods` VALUES ('478', '黑森森植萃舒缓头皮清洁乳', '植萃舒缓头皮清洁乳天然植萃玻尿酸滋养舒缓止痒补水保湿敏感', '58.80', '0.00', '1', '1', '黑森森植萃舒缓头皮清洁乳：多重植萃精华提取，不伤敏感头皮', '专为头皮敏感人群研发，以天然植萃滋养头皮，温和舒缓不刺激，减轻头皮负担，敏感头皮不用怕！', '230ml，适合沙龙护理和居家使用', '', '0', '76', '0', '0', '添加多种植物萃取精华，滋润养护头皮，清洁的同时深入修护敏感头皮，使头皮的环境达到酸碱平衡，令头发强韧有光泽。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\">产品规格</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">净含量 ： 230ml</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\">产品成分：水、月桂醇聚醚硫酸酯钠、椰油酰谷氨酸二钠、月桂醇硫酸酯铵、椰油酰胺丙基甜菜碱、甘油、椰油酰胺 DEA、氯化钠、苯乙烯/丙烯酸（酯）类共聚物、异硬脂酰乳酰乳酸钠、巴巴苏籽油甘油聚醚-8 酯类、苯氧乙醇、乙基己基甘油、1,2-己二醇、柠檬酸、聚季铵盐-10、泛醇、香精、白鲜（DICTAMNUS DASYCARPUS）根皮提取物、芍药（PAEONIA ALBIFLORA）根提取物、马齿苋（PORTULACA OLERACEA）花/叶/茎提取物、EDTA 二钠、己脒定二（羟乙基磺酸）盐、透明质酸</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">适用人群：任何肤质&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560404472775068.jpg', '添加多种植萃精华清洁头皮同时深入修护敏感还原舒适', '2', 'hss_goods/1560404472775068.jpg,hss_goods/1560327569698190.jpg,hss_goods/1560327569431879.jpg,hss_goods/1560327569539810.jpg', 'hss_goods/1559552953560214.gif,hss_goods/1559552956706970.gif,hss_goods/1559552958366337.gif,hss_goods/1559552960769048.gif,hss_goods/1559552962171028.gif,hss_goods/1559552964597806.gif,hss_goods/1559552966244490.gif,hss_goods/1559552967595818.gif,hss_goods/1559552969806871.gif,hss_goods/1559552972686172.gif,hss_goods/1559552976694423.gif', '', '敏感,补水,头皮清洁', '3', 'hss_goods/compose/2019081409175425930.jpg', '0', '1565588969', '1565745473', '14', '0', '2', '1', '0', '0', '2', '', '168.00', '0.00', '0.00', '42.00', '0.00', '6');
INSERT INTO `goods` VALUES ('479', '黑森森多肽舒缓头皮原液', '多肽舒缓头皮原液敏感舒缓止痒多效修护易吸收头皮原液套装', '343.00', '0.00', '1', '1', '黑森森-多肽舒缓头皮原液产品详情', '选取血清蛋白及多重活性肽，有效改善头皮敏感问题，抗敏舒缓、激活自在！', '10mlx8，8次/盒', '', '0', '76', '0', '0', '选用天然植萃做原材料，特添加血清蛋白和多肽等多种活性成分，有效改善头皮敏感问题，使头皮自然不敏感，水润有弹性。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\">产品规格</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">净含量：10mlx8</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px;\">产品成分：水、1,2-戊二醇、肌醇、丁二醇、血清蛋白、芍药（PAEONIA ALBIFLORA）根提取物、泛醇、四氢甲基嘧啶羧酸、甘油磷酸肌醇胆碱盐、苯氧乙醇、乙基己基甘油、欧锦葵（MALVA SYLVESTRIS）花/叶/茎提取物、羟乙基纤维素、β-葡聚糖、聚乙二醇-115M、三肽-1 铜、三肽-3、四肽-3</span></p><p style=\"white-space: normal;\">&nbsp;</p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">使用人群：所有肤质</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560397994763275.jpg', '添加多肽血清蛋白真正修护受损角质舒缓敏感头皮症状', '2', 'hss_goods/1560397994763275.jpg,hss_goods/1560392369699181.jpg,hss_goods/1560392369161503.jpg,hss_goods/1560392369956930.jpg', 'hss_goods/1558424532136670.jpg,hss_goods/1558424532982025.jpg,hss_goods/1558424532159042.jpg,hss_goods/1558424532146992.jpg,hss_goods/1558424532670682.jpg,hss_goods/1558424532470670.jpg,hss_goods/1558424532656238.jpg,hss_goods/1558424532453916.jpg,hss_goods/1558424533787941.jpg', '', '活性肽,敏感修护,原液', '3', 'hss_goods/compose/2019081409173472288.jpg', '0', '1565589096', '1565745454', '17', '0', '4', '1', '0', '0', '2', '', '980.00', '0.00', '0.00', '245.00', '0.00', '6');
INSERT INTO `goods` VALUES ('480', '黑森森植萃祛屑头皮原液', '植萃祛屑头皮原液祛屑补水保湿多效修护易吸收正品头皮原液套装', '238.00', '0.00', '1', '1', '黑森森-植萃祛屑头皮原液产品详情', '呵护柔嫩头皮，不再“发如雪”，轻松赶跑头屑引起的小尴尬！', '10mlx8支，8次/盒', '', '0', '76', '0', '0', '选用天然植萃做原材料，蕴含丰富的天然成分，具有根源祛屑、舒敏止痒、补水保湿、防脱育发的作用。', '<p style=\"white-space: normal;\"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 宋体;\">产品规格</span></strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 宋体;\">净含量：</span></strong>10mlX8</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 宋体;\">产品成分：</span></strong><span style=\"font-family: 宋体;\">水、1,2-戊二醇、肌醇、丁二醇、乳酸杆菌/梨汁发酵产物滤液、o-伞花烃-5-醇、黄檗（PHELLODENDRON AMURENSE）树皮提取物、白柳（SALIX ALBA）树皮提取物、中国地黄（REHMANNIA CHINENSIS）根提取物、印度楝（MELIA AZADIRACHTA）叶提取物、黄芩（SCUTELLARIA BAICALENSIS）根提取物、鱼腥草（HOUTTUYNIA CORDATA）提取物、野大豆（GLYCINE SOJA）蛋白、芍药（PAEONIA ALBIFLORA）根提取物、泛醇、4-萜品醇、水杨酸、苯氧乙醇、乙基己基甘油、蛇床（CNIDIUM MONNIERI）果提取物、羟苯基丙酰胺苯甲酸、羟乙基纤维素、聚乙二醇-115M、β-葡聚糖</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 16px; font-family: 宋体;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">使用人群：所有肤质</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560404506134815.jpg', '添加多肽血清蛋白真正改善头皮干燥头屑繁多补水滋养', '2', 'hss_goods/1560404506134815.jpg,hss_goods/1560393511483732.jpg,hss_goods/1560393511315573.jpg,hss_goods/1560393511352275.jpg', 'hss_goods/1558509238929655.jpg,hss_goods/1558509238343614.jpg,hss_goods/1558509238468350.jpg,hss_goods/1558509238951968.jpg,hss_goods/1558509238234578.jpg,hss_goods/1558509238455600.jpg,hss_goods/1558509238811794.jpg,hss_goods/1558509238907523.jpg,hss_goods/1558509238836581.jpg,hss_goods/1558509238766513.jpg,hss_goods/1558509238875380.jpg', '', '活性肽,祛屑补水,原液', '3', 'hss_goods/compose/2019081409174266353.jpg', '0', '1565589242', '1565745461', '16', '0', '4', '1', '0', '0', '2', '', '680.00', '0.00', '0.00', '170.00', '0.00', '6');
INSERT INTO `goods` VALUES ('481', '黑森森植萃控油头皮原液', '植萃控油头皮原液深层控油平衡多效修护易吸收正品头皮原液套装', '238.00', '0.00', '1', '1', '黑森森多肽舒缓头皮原液：改善头皮敏感，抗敏舒缓、激活自在', '选用天然植萃，特添加血清蛋白和多肽等多种活性成分，有效改善头皮敏感问题，使头皮自然不敏感，水润有弹性', '10mlx8支，8次/盒', '', '0', '76', '0', '0', '选用天然植萃做原材料，蕴含丰富的天然成分，有效改善头油严重的问题，调节油脂分泌平衡，还有舒缓抗敏、补水保湿的功效。', '<p style=\"white-space: normal;\">产品规格</p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">净含量：10mlX8</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px;\">产品成分：水、1,2-戊二醇、肌醇、肉桂（CINNAMOMUM CASSIA）树皮提取物、姜（ZINGIBER OFFICINALE）根提取物、地榆（POTERIUM SANGUISORBA）根提取物、芍药（PAEONIA ALBIFLORA）根提取物、番石榴（PSIDIUM GUAJAVA）果提取物、极大螺旋藻（SPIRULINA MAXIMA）提取物、泛醇、羟乙基纤维素、聚乙二醇-115M、苯氧乙醇、乙基己基甘油、羟苯基丙酰胺苯甲酸</span></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">使用人群：所有肤质</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1565665220262826.jpg', '添加多重植萃精华和多肽血清蛋白真正调节油脂平衡深入头皮根源减少头油产生还原干爽舒适的无油秀发', '1', 'hss_goods/1565665220262826.jpg,hss_goods/1560393480456341.jpg,hss_goods/1560393480780729.jpg,hss_goods/1560412865829100.jpg', 'hss_goods/1559552862477008.gif,hss_goods/1559552864211166.gif,hss_goods/1559552866541807.gif,hss_goods/1559552868448882.gif,hss_goods/1559552870262212.gif,hss_goods/1559552872178248.gif,hss_goods/1559552874612531.gif,hss_goods/1559552876209019.gif,hss_goods/1559552880714846.gif,hss_goods/1559552885550383.gif,hss_goods/1559552889722179.gif', '', '活性肽,控油修护,原液', '3', 'hss_goods/compose/2019081509350739266.jpg', '0', '1565589363', '1565832907', '19', '0', '4', '1', '0', '0', '2', '', '680.00', '0.00', '0.00', '170.00', '0.00', '6');
INSERT INTO `goods` VALUES ('482', '黑森森祛屑水润头皮清洁乳', '祛屑水润头皮清洁乳天然植萃玻尿酸杀菌祛屑消炎止痒补水保湿', '58.80', '0.00', '1', '1', '黑森森祛屑水润头皮清洁乳：一瓶能补水的祛屑头皮清洁乳', '针对头屑严重的干性头皮研制，在多效祛屑的同时，能够温和地为头皮补充水分！这一刻，无屑可击！', '230ml，适合沙龙护理和居家使用', '', '0', '76', '0', '0', '添加多种植物萃取精华，清洁头皮，滋润养护头皮，对头油和头屑有良好的调节和改善作用，洗后清爽不油腻，头发柔顺水润有光泽。', '<p style=\"white-space: normal;\"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 宋体;\">产品规格</span></strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 宋体;\">净含量</span>&nbsp;</strong><strong><span style=\"font-family: 宋体;\">：</span>&nbsp;230ml</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 宋体;\">产品成分：</span></strong><span style=\"font-family: 宋体;\">水、月桂醇聚醚硫酸酯钠、椰油酰谷氨酸二钠、月桂醇硫酸酯铵、椰油酰胺丙基甜菜碱、甘油、椰油酰胺 DEA、氯化钠、苯乙烯/丙烯酸（酯）类共聚物、异硬脂酰乳酰乳酸钠、巴巴苏籽油甘油聚醚-8 酯类、苯氧乙醇、乙基己基甘油、1，2-己二醇、柠檬酸、聚季铵盐-10、泛醇、羟苯甲酯、4- 萜品醇、水杨酸、白柳（ SALIX ALBA ）树皮提取物、香精、蛇床（CNIDIUM MONNIERI）果提取物、 EDTA 二钠、己脒定二（羟乙基磺酸）盐、透明质酸</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560404637304079.jpg', '添加玻尿酸白柳树皮等精华清洁头皮杀菌祛屑补水保湿', '0', 'hss_goods/1560404637304079.jpg,hss_goods/1560393048302016.jpg,hss_goods/1560393048444957.jpg,hss_goods/1560412634383937.jpg', 'hss_goods/1560569804331754.jpg,hss_goods/1559552148429848.jpg,hss_goods/1559552148197171.jpg,hss_goods/1559552148407530.jpg,hss_goods/1559552148749296.jpg,hss_goods/1559552148675953.jpg,hss_goods/1559552148341315.jpg,hss_goods/1559552148547479.jpg,hss_goods/1559552148185987.jpg,hss_goods/1559552148837295.jpg,hss_goods/1559552148799677.jpg,hss_goods/1559552148753871.jpg,hss_goods/1559552148164713.jpg', '', '祛屑,补水,头皮清洁', '3', 'hss_goods/compose/2019081409174818485.jpg', '0', '1565589481', '1565745468', '15', '0', '2', '1', '0', '0', '2', '', '168.00', '0.00', '0.00', '42.00', '0.00', '6');
INSERT INTO `goods` VALUES ('483', '黑森森控油清爽头皮清洁啫喱', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '58.80', '0.00', '1', '1', '黑森森控油清爽头皮清洁啫喱：一瓶来自极寒冰山的控油神器', '针对油性头皮研发，有效清除头皮难洗油污和化学残留物，还原干爽头皮，极致冰爽体验，无惧夏日热浪', '230ml', '', '0', '76', '0', '0', '添加多种植物萃取精华，清洁头皮，滋润养护头皮，对头油和头屑有良好的调节和改善作用，洗后清爽不油腻，头发柔顺自然有光泽。', '<p style=\"white-space: normal;\">产品规格</p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">净含量 ： 230ml</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px;\">产品成分：水、丙烯酸（酯）类/硬脂醇聚醚-20 甲基丙烯酸酯共聚物、椰油酰胺丙基甜菜碱、辛基葡糖苷、椰油酰胺 DEA、巴巴苏籽油甘油聚醚-8 酯类、1,2-己二醇、苯氧乙醇、乙基己基甘油、泛醇、羟乙基纤维素、氢氧化钾、羟苯基丙酰胺苯甲酸、EDTA 二钠、薄荷酮甘油缩酮、氢化蓖麻油、肉桂（CINNAMOMUM CASSIA）树皮提取物、姜（ZINGIBER OFFICINALE）根提取物、地榆（POTERIUM SANGUISORBA）根提取物</span></p><p style=\"white-space: normal;\">适用人群：任何肤质，特别是油头肌肤&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1565665235495569.jpg', '添加肉桂皮生姜根等多重植萃精华清洁头皮减少油脂调节平衡极致清爽调理去油蓬松清洁毛囊使秀发干爽', '1', 'hss_goods/1565665235495569.jpg,hss_goods/1560392911166801.jpg,hss_goods/1560392911466470.jpg,hss_goods/1560392911336436.jpg', 'hss_goods/1559552035463269.jpg,hss_goods/1559552035220369.jpg,hss_goods/1559552035478378.jpg,hss_goods/1559552035397093.jpg,hss_goods/1559552035618581.jpg,hss_goods/1559552035557394.jpg,hss_goods/1559552035566471.jpg,hss_goods/1559552035967660.jpg,hss_goods/1559552035700999.jpg,hss_goods/1559552035918642.jpg,hss_goods/1559552035852047.jpg', '', '控油 清爽 头皮清洁', '3', 'hss_goods/compose/2019082009423983927.jpg', '0', '1565589595', '1566265359', '21', '0', '2', '1', '0', '0', '2', '', '168.00', '0.00', '0.00', '42.00', '0.00', '6');
INSERT INTO `goods` VALUES ('484', '草本精萃头皮舒缓粉', '草本精粹头皮舒缓粉中草药修护受损发质滋养养发护发头疗汤', '58.80', '0.00', '1', '1', '黑森森草本植萃头皮舒缓粉：精挑细选六味中药科学炮制而成', '精挑细选六味道地药材，注入黑森森科学理念，综合修护头皮和头发健康！每一滴，都是浓缩的精华', '100g', '', '0', '76', '0', '0', '蕴含多种中草药成分，改善头皮环境，补充头皮及发根营养，改善枯黄、开叉发质，促进血液循环，舒缓疲劳。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 16px;\"><strong>产品规格</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 微软雅黑, sans-serif; font-size: 14px;\">草本精萃头皮舒缓粉</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 14px; font-family: 微软雅黑, sans-serif;\">净含量</span>&nbsp;</strong><strong><span style=\"font-size: 14px; font-family: 微软雅黑, sans-serif;\">：</span>&nbsp; 100g</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 微软雅黑, sans-serif;\">产品成分：</span></strong><span style=\"font-family: 微软雅黑, sans-serif;\">薄荷（</span><span style=\"font-family: 宋体;\">MENTHA ARVENSIS</span><span style=\"font-family: 微软雅黑, sans-serif;\">）叶提取物、丹参（</span><span style=\"font-family: 宋体;\">SALVIA MILTIORRHIZA</span><span style=\"font-family: 微软雅黑, sans-serif;\">）根粉、当归（</span><span style=\"font-family: 宋体;\">ANGELICA SINENSIS</span><span style=\"font-family: 微软雅黑, sans-serif;\">）根粉、葛根（</span><span style=\"font-family: 宋体;\">PUERARIA LOBATA</span><span style=\"font-family: 微软雅黑, sans-serif;\">）提取物、黑灵芝（</span><span style=\"font-family: 宋体;\">GANODERMA ATRUM</span><span style=\"font-family: 微软雅黑, sans-serif;\">）提取物、红景天（</span><span style=\"font-family: 宋体;\">RHODIOLA ROSEA</span><span style=\"font-family: 微软雅黑, sans-serif;\">）根提取物</span></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">化妆品生产许可证：粤妆20161064</span></p><p><br/></p>', 'hss_goods/1560397819221772.jpg', '添加黑灵芝等六味药材精华\r\n滋养头发修护烫染受损发质', '2', 'hss_goods/1560397819221772.jpg,hss_goods/1560392261296383.jpg,hss_goods/1560392261723283.jpg,hss_goods/1560392261739170.jpg', 'hss_goods/1558423165595001.jpg,hss_goods/1558423165510947.jpg,hss_goods/1558423165437364.jpg,hss_goods/1558423166823253.jpg,hss_goods/1558423166921902.jpg,hss_goods/1558423166384104.jpg', '', '草本植萃,养发护发', '3', 'hss_goods/compose/2019081214014221453.jpg', '0', '1565589702', '0', '13', '2', '1', '1', '0', '0', '2', '', '168.00', '0.00', '0.00', '42.00', '0.00', '6');
INSERT INTO `goods` VALUES ('485', '草本精萃头皮舒缓粉', '草本精粹头皮舒缓粉中草药修护受损发质滋养养发护发头疗汤', '58.80', '0.00', '1', '1', '黑森森草本植萃头皮舒缓粉：精挑细选六味中药科学炮制而成', '精挑细选六味道地药材，注入黑森森科学理念，综合修护头皮和头发健康！每一滴，都是浓缩的精华', '100g', '', '0', '76', '0', '0', '蕴含多种中草药成分，改善头皮环境，补充头皮及发根营养，改善枯黄、开叉发质，促进血液循环，舒缓疲劳。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 16px;\"><strong>产品规格</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 微软雅黑, sans-serif; font-size: 14px;\">草本精萃头皮舒缓粉</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 14px; font-family: 微软雅黑, sans-serif;\">净含量</span>&nbsp;</strong><strong><span style=\"font-size: 14px; font-family: 微软雅黑, sans-serif;\">：</span>&nbsp; 100g</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 微软雅黑, sans-serif;\">产品成分：</span></strong><span style=\"font-family: 微软雅黑, sans-serif;\">薄荷（</span><span style=\"font-family: 宋体;\">MENTHA ARVENSIS</span><span style=\"font-family: 微软雅黑, sans-serif;\">）叶提取物、丹参（</span><span style=\"font-family: 宋体;\">SALVIA MILTIORRHIZA</span><span style=\"font-family: 微软雅黑, sans-serif;\">）根粉、当归（</span><span style=\"font-family: 宋体;\">ANGELICA SINENSIS</span><span style=\"font-family: 微软雅黑, sans-serif;\">）根粉、葛根（</span><span style=\"font-family: 宋体;\">PUERARIA LOBATA</span><span style=\"font-family: 微软雅黑, sans-serif;\">）提取物、黑灵芝（</span><span style=\"font-family: 宋体;\">GANODERMA ATRUM</span><span style=\"font-family: 微软雅黑, sans-serif;\">）提取物、红景天（</span><span style=\"font-family: 宋体;\">RHODIOLA ROSEA</span><span style=\"font-family: 微软雅黑, sans-serif;\">）根提取物</span></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">化妆品生产许可证：粤妆20161064</span></p><p><br/></p>', 'hss_goods/1560397819221772.jpg', '添加黑灵芝等六味药材精华滋养头发修护烫染受损发质', '2', 'hss_goods/1560397819221772.jpg,hss_goods/1560392261296383.jpg,hss_goods/1560392261723283.jpg,hss_goods/1560392261739170.jpg', 'hss_goods/1558423165595001.jpg,hss_goods/1558423165510947.jpg,hss_goods/1558423165437364.jpg,hss_goods/1558423166823253.jpg,hss_goods/1558423166921902.jpg,hss_goods/1558423166384104.jpg', '', '草本植萃,养发护发', '1', 'hss_goods/compose/2019081314140242315.jpg', '0', '1565589703', '1565676842', '0', '0', '1', '1', '0', '0', '2', '', '168.00', '0.00', '0.00', '42.00', '0.00', '6');
INSERT INTO `goods` VALUES ('486', '黑森森植萃新生洗发露', '植萃新生洗发露天然植物进口日本生姜首乌防脱育发生发滋养安全', '69.30', '0.00', '1', '1', '黑森森植萃新生洗发露：草本精粹提炼而成，助力毛发新生', '黑森森双重专利技术，有效萃取生姜等中药精华，最大程度的保留生姜等中药的功效，滋养毛囊，强健发根、防脱育发！', '480ml', '', '0', '77', '0', '0', '蕴含生姜及侧柏叶提取物等成分，为秀发提供所需营养及水分，让秀发滋养顺滑，柔软亮泽，洁净头皮头发，改善油脂分泌，强根固发。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 16px;\"><strong>产品规格</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\"><strong>净含量 ：480ml</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\"><strong>产品成分：</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\">水、月桂醇聚醚硫酸酯铵、月桂醇硫酸酯铵、聚二甲基硅氧烷、椰油酰胺丙基甜菜碱、乙二醇二硬脂酸酯、聚二甲基硅氧烷醇、椰油酰胺 MEA、月桂酰肌氨酸钠、月桂酰谷氨酸钠、聚季铵盐-7、糖基海藻糖、氢化淀粉水解物、鲸蜡硬脂醇、二（氢化牛脂基）邻苯二甲酸酰胺、氯化钠、甜菜碱、橄榄油 PEG-7 酯类、季铵盐-80、侧柏（BIOTA ORIENTALIS）叶提取物、北艾（ARTEMISIA VULGARIS）提取物、女贞（LIGUSTRUM LUCIDUM）果提取物、制何首乌（PLOYGONUM MULTFLORUM)提取物、川芎（LIGUSTICUM CHUANXIONG）根提取物、南方菟丝子（CUSCUTA AUSTRALIS）籽提取物、山柰（KAEMPFERIA GALANGA）根提取物、苦参（SOPHORA FLAVESCENS）根提取物、甘草（GLYCYRRHIZA URALENSIS）根提取物、柑橘（CITRUS RETICULATA）果皮提取物、花椒（ZANTHOXYLUM BUNGEANUM）果提取物、乙醇、十二烷基苯磺酸 TEA 盐、C12-15 链烷醇聚醚-3、双-氨丙基聚二甲基硅氧烷、十三烷醇聚醚-12、C11-15 链烷醇聚醚-9、聚硅氧烷季铵盐-16、十一烷醇聚醚-11、丁基辛醇、十一烷醇聚醚-5、姜（ZINGIBER OFFICINALE）提取物、聚季铵盐-10、瓜儿胶羟丙基三甲基氯化铵、香精、EDTA 二钠、苯氧乙醇、己脒定二（羟乙基磺酸）盐、双（羟甲基）咪唑烷基脲、焦糖色。</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1565589812903543.jpg', '添加侧柏叶及多种名贵中草药精华改善头皮的微环境深层滋养秀发同时激活毛囊干细胞促进毛发健康再生', '1', 'hss_goods/1565589812903543.jpg,hss_goods/1560327677522588.jpg,hss_goods/1560327677303676.jpg,hss_goods/1560327677986449.jpg', 'hss_goods/1559553023371027.jpg,hss_goods/1559553023200261.jpg,hss_goods/1559553023568363.jpg,hss_goods/1559553024232944.jpg,hss_goods/1559553024627734.jpg,hss_goods/1559553024513001.jpg,hss_goods/1559553024537637.jpg', '', '植萃,生姜,防脱育发', '3', 'hss_goods/compose/2019082009450299260.jpg', '0', '1565589830', '1566265501', '13', '0', '2', '1', '0', '0', '2', '', '198.00', '0.00', '0.00', '49.50', '0.00', '6');
INSERT INTO `goods` VALUES ('487', '黑森森赋活润养首乌洗发露', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '69.30', '0.00', '1', '1', '黑森森赋活润养首乌洗发露：一瓶能使白发变黑的魔法奇迹', '黑森森双重专利技术，有效萃取首乌等中药精华，最大程度的保留首乌等中药的功效，为毛囊提供足够的滋养！', '480ml', '', '0', '77', '0', '0', '为枯黄发质研制的洗发配方，富含何首乌及无患子提取物，补充头皮和头发养分，深层滋养，使头发保持乌黑亮泽。', '<p style=\"white-space: normal;\"><span style=\"font-size: 16px;\"><strong>产品规格</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\"><strong>净含量 ：480ml</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\"><strong>产品成分：</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\">水、月桂醇聚醚硫酸酯铵、月桂醇硫酸酯铵、聚二甲基硅氧烷、椰油酰胺丙基甜菜碱、乙二醇二硬脂酸酯、聚二甲基硅氧烷醇、椰油酰胺 MEA、月桂酰肌氨酸钠、月桂酰谷氨酸钠、聚季铵盐-7、糖基海藻糖、氢化淀粉水解物、C12-15 链烷醇聚醚-3、鲸蜡硬脂醇、二（氢化牛脂基）邻苯二甲酸酰胺、氯化钠、甜菜碱、橄榄油 PEG-7 酯类、季铵盐-80、十二烷基苯磺酸 TEA 盐、侧柏（BIOTA ORIENTALIS）叶提取物、北艾（ARTEMISIA VULGARIS）提取物、女贞（LIGUSTRUM LUCIDUM）果提取物、制何首乌（PLOYGONUM MULTFLORUM)提取物、川芎（LIGUSTICUM CHUANXIONG）根提取物、南方菟丝子（CUSCUTA AUSTRALIS）籽提取物、山柰（KAEMPFERIA GALANGA）根提取物、苦参（SOPHORA FLAVESCENS）根提取物、甘草（GLYCYRRHIZA URALENSIS）根提取物、柑橘（CITRUS RETICULATA）果皮提取物、花椒（ZANTHOXYLUM BUNGEANUM）果提取物、乙醇、双-氨丙基聚二甲基硅氧烷、十三烷醇聚醚-12、C11-15 链烷醇聚醚-9、聚硅氧烷季铵盐-16、十一烷醇聚醚-11、丁基辛醇、十一烷醇聚醚-5、无患子（SAPINDUS MUKUROSSI）果皮提取物、何首乌（POLYGONUM MULTIFLORUM）根提取物、聚季铵盐-10、瓜儿胶羟丙基三甲基氯化铵、香精、EDTA 二钠、苯氧乙醇、己脒定二（羟乙基磺酸）盐、双（羟甲基）咪唑烷基脲、焦糖色。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1565589925884286.jpg', '添加何首乌及多种名贵中草药精华改善头皮的微环境减少白发的产生促进新发增生最终还原乌黑健康秀发', '1', 'hss_goods/1565589925884286.jpg,hss_goods/1560392471708097.jpg,hss_goods/1560412818456925.jpg,hss_goods/1560392471543862.jpg', 'hss_goods/1558427648278529.jpg,hss_goods/1558427648788718.jpg,hss_goods/1558427648502193.jpg,hss_goods/1558427648271485.jpg,hss_goods/1558427648764639.jpg,hss_goods/1558427648214443.jpg,hss_goods/1558427648618577.jpg,hss_goods/1558427648594054.jpg', '', '植萃,首乌,乌发黑发', '3', 'hss_goods/compose/2019082009452517915.jpg', '0', '1565589937', '1566265525', '12', '0', '2', '1', '0', '0', '2', '', '198.00', '0.00', '0.00', '49.50', '0.00', '6');
INSERT INTO `goods` VALUES ('488', '黑森森舒缓修护洗发露', '舒缓修护洗发露天然植萃金缕梅温和滋养抗菌舒敏敏感头皮', '69.30', '0.00', '1', '1', '黑森森舒缓修护洗发露：多重植萃精华，温和修护敏感发质', '专为敏感发质人群研发，以多重植萃精华为基础，有效地抗菌舒敏、深层修护受损发质，给与秀发最温润的呵护！', '480ml', '', '0', '77', '0', '0', '蕴含金缕梅和无患子提取物等保湿成分，舒缓头皮不适，提高肌肤含水量，深度润养发丝，滋润毛躁发质，令秀发清爽有光泽。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 16px;\"><strong>产品规格</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\"><strong><span style=\"font-family: 微软雅黑, sans-serif;\">净含量</span>&nbsp;</strong><strong><span style=\"font-family: 微软雅黑, sans-serif;\">：</span>&nbsp;480ml</strong></span></p><p style=\"margin-bottom: 7px; white-space: normal; line-height: 32px;\"><span style=\"font-size: 12px; font-family: 宋体, SimSun;\"><strong><span style=\"font-size: 12px;\">产品成分：</span></strong><span style=\"font-size: 12px;\">水、月桂醇聚醚硫酸酯铵、月桂醇硫酸酯铵、聚二甲基硅氧烷、椰油酰胺丙基甜菜碱、乙二醇二硬脂酸酯、聚二甲基硅氧烷醇、椰油酰胺 MEA、月桂酰肌氨酸钠、月桂酰谷氨酸钠、聚季铵盐-7、C12-15 链烷醇聚醚-3、糖基海藻糖、氢化淀粉水解物、鲸蜡硬脂醇、二（氢化牛脂基）邻苯二甲酸酰胺、氯化钠、甜菜碱、橄榄油 PEG-7 酯类、季铵盐-80、十二烷基苯磺酸 TEA 盐、泛醇、双-氨丙基聚二甲基硅氧烷、十三烷醇聚醚-12、C11-15 链烷醇聚醚-9、聚硅氧烷季铵盐-16、十一烷醇聚醚-11、丁基辛醇、十一烷醇聚醚-5、无患子（SAPINDUS MUKUROSSI）果皮提取物、北美金缕梅（HAMAMELIS VIRGINIANA）水、聚季铵盐-10、瓜儿胶羟丙基三甲基氯化铵、香精、EDTA 二钠、苯氧乙醇、己脒定二（羟乙基磺酸）盐、双（羟甲基）咪唑烷基脲、焦糖色。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\"><strong>&nbsp;</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\"><strong>&nbsp;</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560404744117835.jpg', '添加金缕梅无患子植萃精华温和滋养修护舒缓敏感头皮', '2', 'hss_goods/1560404744117835.jpg,hss_goods/1560327048155678.jpg,hss_goods/1560327053941155.jpg,hss_goods/1560405117971295.jpg', 'hss_goods/1559552312795692.jpg,hss_goods/1559552312885829.jpg,hss_goods/1559552312457971.jpg,hss_goods/1559552312187852.jpg,hss_goods/1559552312656932.jpg,hss_goods/1559552312107148.jpg', '', '植萃,金缕梅,滋养修护', '3', 'hss_goods/compose/2019082009454632722.jpg', '0', '1565590060', '1566265545', '11', '0', '2', '1', '0', '0', '2', '', '198.00', '0.00', '0.00', '49.50', '0.00', '6');
INSERT INTO `goods` VALUES ('489', '黑森森控油清爽洗发露', '控油清爽洗发露天然氨基酸控油祛屑去污清爽多效修护蓬松去油', '69.30', '0.00', '1', '1', '黑森森控油清爽洗发露：无惧夏日油腻，享薄荷酷爽', '专为油性发质研发，以草本精粹提炼而成，特加入活性成分氨基酸，有效改善头皮、头发油腻状况！', '480ml', '', '0', '77', '0', '0', '长效控油，洁净头发，头皮清爽舒适，发丝轻盈不油腻。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 16px;\"><strong>产品规格</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\"><strong>净含量 ： 480ml</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\"><strong>产品成分：</strong>水、月桂醇聚醚硫酸酯铵、月桂醇硫酸酯铵、聚二甲基硅氧烷、椰油酰胺丙基甜菜碱、乙二醇二硬脂酸酯、聚二甲基硅氧烷醇、椰油酰胺<span style=\"font-family: 微软雅黑, sans-serif;\">&nbsp;MEA</span>、月桂酰肌氨酸钠、月桂酰谷氨酸钠、聚季铵盐<span style=\"font-family: 微软雅黑, sans-serif;\">-7</span>、糖基海藻糖、氢化淀粉水解物、<span style=\"font-family: 微软雅黑, sans-serif;\">C12-15&nbsp;</span>链烷醇聚醚<span style=\"font-family: 微软雅黑, sans-serif;\">-3</span>、瓜儿胶羟丙基三甲基氯化铵、鲸蜡硬脂醇、二（氢化牛脂基）邻苯二甲酸酰胺、氯化钠、十二烷基苯磺酸<span style=\"font-family: 微软雅黑, sans-serif;\">&nbsp;TEA&nbsp;</span>盐、甜菜碱、橄榄油<span style=\"font-family: 微软雅黑, sans-serif;\">&nbsp;PEG-7&nbsp;</span>酯类、季铵盐<span style=\"font-family: 微软雅黑, sans-serif;\">-80</span>、双<span style=\"font-family: 微软雅黑, sans-serif;\">-</span>氨丙基聚二甲基硅氧烷、十三烷醇聚醚<span style=\"font-family: 微软雅黑, sans-serif;\">-12</span>、<span style=\"font-family: 微软雅黑, sans-serif;\">C11-15&nbsp;</span>链烷醇聚醚<span style=\"font-family: 微软雅黑, sans-serif;\">-9</span>、聚硅氧烷季铵盐<span style=\"font-family: 微软雅黑, sans-serif;\">-16</span>、十一烷醇聚醚<span style=\"font-family: 微软雅黑, sans-serif;\">-11</span>、丁基辛醇、十一烷醇聚醚<span style=\"font-family: 微软雅黑, sans-serif;\">-5</span>、无患子（<span style=\"font-family: 微软雅黑, sans-serif;\">SAPINDUS MUKUROSSI</span>）果皮提取物、聚季铵盐<span style=\"font-family: 微软雅黑, sans-serif;\">-10</span>、香精、<span style=\"font-family: 微软雅黑, sans-serif;\">EDTA&nbsp;</span>二钠、<span style=\"font-family: 微软雅黑, sans-serif;\">PCA&nbsp;</span>锌、己脒定二（羟乙基磺酸）盐、苯氧乙醇、双（羟甲基）咪唑烷基脲。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560398275977536.jpg', '添加氨基酸无患子植萃精华清洁发丝控油调节油脂平衡', '2', 'hss_goods/1560398275977536.jpg,hss_goods/1560392947475484.jpg,hss_goods/1560392947459858.jpg,hss_goods/1560392947445270.jpg', 'hss_goods/1558488873293253.jpg,hss_goods/1558488873309715.jpg,hss_goods/1558488873677465.jpg,hss_goods/1558488873545515.jpg,hss_goods/1558488873160557.jpg,hss_goods/1558488873318018.jpg,hss_goods/1558488873193104.jpg,hss_goods/1558488873203188.jpg,hss_goods/1558488873382950.jpg', '', '植萃,无患子,控油', '3', 'hss_goods/compose/2019082009455836437.jpg', '0', '1565590178', '1566265557', '9', '0', '2', '1', '0', '0', '2', '', '198.00', '0.00', '0.00', '49.50', '0.00', '6');
INSERT INTO `goods` VALUES ('490', '黑森森祛屑水润洗发露', '祛屑水润洗发露天然植萃薄荷清凉止痒祛屑杀菌水润多效修护', '69.30', '0.00', '1', '1', '黑森森祛屑水润洗发露：温和补水、滋养秀发，让秀发无屑可击', '特含薄荷、甘草等中药，以低温射频技术提炼而成，有效保存中药精华，缓解头皮屑问题，并为秀发补充水分！', '480ml', '', '0', '77', '0', '0', '蕴含薄荷，甘草等成分，有效清洁头发、头屑和多余油脂，舒缓头皮瘙痒，为头发提供营养物质，滋养发根，柔顺秀发。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\">产品规格</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">净含量 ： 480ml</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\">产品成分：水、月桂醇聚醚硫酸酯铵、月桂醇硫酸酯铵、聚二甲基硅氧烷、椰油酰胺丙基甜菜碱、乙二醇二硬脂酸酯、聚二甲基硅氧烷醇、椰油酰胺 MEA、月桂酰肌氨酸钠、月桂酰谷氨酸钠、聚季铵盐-7、糖基海藻糖、氢化淀粉水解物、鲸蜡硬脂醇、二（氢化牛脂基）邻苯二甲酸酰胺、氯化钠、甜菜碱、橄榄油 PEG-7 酯类、C12-15 链烷醇聚醚-3、季铵盐-80、侧柏（BIOTA ORIENTALIS）叶提取物、北艾（ARTEMISIA VULGARIS）提取物、女贞（LIGUSTRUM LUCIDUM）果提取物、制何首乌（PLOYGONUM MULTFLORUM)提取物、川芎（LIGUSTICUM CHUANXIONG）根提取物、南方菟丝子（CUSCUTA AUSTRALIS）籽提取物、山柰（KAEMPFERIA GALANGA）根提取物、苦参（SOPHORA FLAVESCENS）根提取物、甘草（GLYCYRRHIZA URALENSIS）根提取物、柑橘（CITRUS RETICULATA）果皮提取物、花椒（ZANTHOXYLUM BUNGEANUM）果提取物、乙醇、十二烷基苯磺酸 TEA 盐、己脒定二（羟乙基磺酸）盐、双-氨丙基聚二甲基硅氧烷、十三烷醇聚醚-12、C11-15 链烷醇聚醚-9、聚硅氧烷季铵盐-16、十一烷醇聚醚-11、丁基辛醇、十一烷醇聚醚-5、薄荷醇、聚季铵盐-10、瓜儿胶羟丙基三甲基氯化铵、香精、EDTA 二钠、苯氧乙醇、双（羟甲基）咪唑烷基脲。</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560404661102129.jpg', '添加薄荷甘草天然植萃精华清凉止痒杀菌祛屑温和补水', '2', 'hss_goods/1560404661102129.jpg,hss_goods/1560393083766300.jpg,hss_goods/1560393083776694.jpg,hss_goods/1560393083246477.jpg', 'hss_goods/1559552201693011.jpg,hss_goods/1559552201208212.jpg,hss_goods/1559552201863111.jpg,hss_goods/1559552201289291.jpg,hss_goods/1559552201397962.jpg,hss_goods/1559552201517894.jpg,hss_goods/1559552201913715.jpg,hss_goods/1559552202108388.jpg', '', '植萃,薄荷,祛屑止痒', '3', 'hss_goods/compose/2019082009455256514.jpg', '0', '1565590290', '1566265552', '10', '0', '2', '1', '0', '0', '2', '', '198.00', '0.00', '0.00', '49.50', '0.00', '6');
INSERT INTO `goods` VALUES ('491', '黑森森玫瑰精华头发修护油', '玫瑰精华头发修护油天然植萃精华不油腻柔顺护发养发精油', '58.80', '0.00', '1', '1', '黑森森焕采多效修护发膜：“姜”护发进行到底！告别发质损伤', '提取生姜等草本精华，以黑森森专利技术提取，最大程度保留草本精华，改善枯黄、分叉、断发，还原亮丽发质', '30ml', '', '0', '77', '0', '0', '蕴含玫瑰萃取精华，滋润秀发，补充秀发养分，抚平毛躁发质，修护分叉发尾，令秀发柔亮光泽，水润柔滑。', '<p><span style=\"text-decoration: line-through;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 宋体;\">产品规格</span></strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 宋体;\">净含量</span>&nbsp;</strong><strong><span style=\"font-family: 宋体;\">：</span>230ml</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px;\"><strong><span style=\"font-family: 宋体;\">产品成分：</span></strong><span style=\"font-family: 宋体;\">矿油、葡萄（</span><span style=\"font-family: 微软雅黑, sans-serif;\">VITIS VINIFERA</span><span style=\"font-family: 宋体;\">）籽油、小麦（</span><span style=\"font-family: 微软雅黑, sans-serif;\">TRITICUM VULGARE</span><span style=\"font-family: 宋体;\">）胚芽油、植物甾醇类、玫瑰（</span><span style=\"font-family: 微软雅黑, sans-serif;\">ROSA RUGOSA</span><span style=\"font-family: 宋体;\">）花油、姜（</span><span style=\"font-family: 微软雅黑, sans-serif;\">ZINGIBER OFFICINALE</span><span style=\"font-family: 宋体;\">）根油、薄荷（</span><span style=\"font-family: 微软雅黑, sans-serif;\">MENTHA ARVENSIS</span><span style=\"font-family: 宋体;\">）叶油、迷迭香（</span><span style=\"font-family: 微软雅黑, sans-serif;\">ROSMARINUS OFFICINALIS</span><span style=\"font-family: 宋体;\">）叶油、红没药醇、姜（</span><span style=\"font-family: 微软雅黑, sans-serif;\">ZINGIBER OFFICINALE</span><span style=\"font-family: 宋体;\">）根提取物</span></span></p><p style=\"white-space: normal;\"><strong>&nbsp;</strong></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><span style=\"text-decoration: line-through;\"></span><br/></p>', 'hss_goods/1560398485609357.jpg', '精选有机重瓣玫瑰植萃精华滋养秀发抚平毛躁修护分叉', '2', 'hss_goods/1560398485609357.jpg,hss_goods/1560392976689424.jpg,hss_goods/1560392976947505.jpg,hss_goods/1560392976719329.jpg', 'hss_goods/1558516366284093.jpg,hss_goods/1559023703526769.jpg,hss_goods/1558516366636959.jpg,hss_goods/1559023708585506.jpg,hss_goods/1558516366798212.jpg,hss_goods/1562383818462416.jpg,hss_goods/1562383824139909.jpg,hss_goods/1562383828792603.jpg', '', '玫瑰,养发,精油', '3', 'hss_goods/compose/2019082009460529465.jpg', '0', '1565590467', '1566265565', '8', '0', '3', '1', '0', '0', '2', '', '168.00', '0.00', '0.00', '42.00', '0.00', '6');
INSERT INTO `goods` VALUES ('492', '黑森森山茶花润亮护发素', '山茶花润亮护发素天然植萃维生素E毛躁开叉烫染损伤保湿滋养', '48.30', '0.00', '1', '1', '黑森森山茶花润亮护发素：特含维生素E，让秀发E疏到底', '萃取大米提取物精华及维生素E，抚平毛躁、润亮发色，修复因烫染过度造成的发质损伤，让秀发享受SPA级护理！', '230ml', '', '0', '77', '0', '0', '山茶花芳香，乳液质地，蕴含多种天然有机植物精华，改善干枯毛躁分叉发丝，令秀发亮泽柔软，滑而不腻。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 16px;\"><strong>产品规格</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\"><strong>净含量 ：230ml</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\"><strong>产品成分：</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\">水、鲸蜡硬脂醇、辛酸<span style=\"font-size: 12px; font-family: 微软雅黑, sans-serif;\">/</span>癸酸甘油三酯、环五聚二甲基硅氧烷、环四聚二甲基硅氧烷、西曲氯铵、羟乙基纤维素、油橄榄（<span style=\"font-size: 12px; font-family: 微软雅黑, sans-serif;\">OLEA EUROPAEA</span>）果油、氨端聚二甲基硅氧烷、十三烷醇聚醚<span style=\"font-size: 12px; font-family: 微软雅黑, sans-serif;\">-12</span>、二甲基棕榈基胺、聚二甲基硅氧烷醇、生育酚乙酸酯、月桂醇聚醚<span style=\"font-size: 12px; font-family: 微软雅黑, sans-serif;\">-7</span>、异月桂醇聚醚<span style=\"font-size: 12px; font-family: 微软雅黑, sans-serif;\">-6</span>、甘油、泛醇、苯氧乙醇、聚季铵盐<span style=\"font-size: 12px; font-family: 微软雅黑, sans-serif;\">-10</span>、<span style=\"font-size: 12px; font-family: 微软雅黑, sans-serif;\">EDTA&nbsp;</span>二钠、香精、稻（<span style=\"font-size: 12px; font-family: 微软雅黑, sans-serif;\">ORYZA SATIVA</span>）胚芽提取物、乙醇、<span style=\"font-size: 12px; font-family: 微软雅黑, sans-serif;\">CI 19140</span>。</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\"><strong>适用人群：</strong>任何肤质<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560404708731665.jpg', '添加维生素E及山茶花精华改善干枯毛躁修护受损发质', '2', 'hss_goods/1560404708731665.jpg,hss_goods/1560393196610752.jpg,hss_goods/1560393196360108.jpg,hss_goods/1560393196985727.jpg', 'hss_goods/1558490733595489.jpg,hss_goods/1558490733758437.jpg,hss_goods/1558490733290354.jpg,hss_goods/1558490733473444.jpg,hss_goods/1558490733352771.jpg,hss_goods/1558490733142375.jpg,hss_goods/1558490733567666.jpg,hss_goods/1558490733990986.jpg,hss_goods/1558490733901862.jpg', '', '植萃,山茶花,护发素', '3', 'hss_goods/compose/2019082009461207059.jpg', '0', '1565590562', '1566265572', '7', '0', '2', '1', '0', '0', '2', '', '138.00', '0.00', '0.00', '34.50', '0.00', '6');
INSERT INTO `goods` VALUES ('493', '黑森森焕采多效修护发膜', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '58.80', '0.00', '1', '1', '黑森森焕采多效修护发膜：“姜”护发进行到底！告别发质损伤', '提取生姜等草本精华，以黑森森专利技术提取，最大程度保留草本精华，改善枯黄、分叉、断发，还原亮丽发质', '230ml', '', '0', '77', '0', '0', '蕴含油橄榄果油，生姜，维生素E等养发成分，在发丝表层形成滋润保护膜，修护发丝；丰润乳霜质地，滋养秀发，使秀发焕发光彩。', '<p style=\"white-space: normal;\"><span style=\"font-size: 16px;\"><strong>产品规格</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\"><strong>净含量 ：230ml</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px; font-family: 宋体, SimSun;\"><strong>产品成分：</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px; font-family: 宋体, SimSun;\">水、鲸蜡硬脂醇、辛酸<span style=\"font-size: 14px; font-family: 微软雅黑, sans-serif;\">/</span>癸酸甘油三酯、环五聚二甲基硅氧烷、环四聚二甲基硅氧烷、山嵛基三甲基氯化铵、硬脂基三甲基氯化铵、油橄榄（<span style=\"font-size: 14px; font-family: 微软雅黑, sans-serif;\">OLEA EUROPAEA</span>）果油、聚二甲基硅氧烷醇、氨端聚二甲基硅氧烷、西曲氯铵、十三烷醇聚醚<span style=\"font-size: 14px; font-family: 微软雅黑, sans-serif;\">-12</span>、二甲基棕榈基胺、苯氧乙醇、泛醇、生育酚乙酸酯、<span style=\"font-size: 14px; font-family: 微软雅黑, sans-serif;\">EDTA&nbsp;</span>二钠、异丙醇、乙醇、姜（<span style=\"font-size: 14px; font-family: 微软雅黑, sans-serif;\">ZINGIBER OFFICINALE</span>）提取物、香精、<span style=\"font-size: 14px; font-family: 微软雅黑, sans-serif;\">CI 19140</span>。</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560398089825218.jpg', '添加维生素E及油橄榄精华滋养发芯形成表面保护屏障', '2', 'hss_goods/1560398089825218.jpg,hss_goods/1560392519932410.jpg,hss_goods/1560392519906989.jpg,hss_goods/1560412684129704.jpg', 'hss_goods/1558428011388350.jpg,hss_goods/1558428011550952.jpg,hss_goods/1558428011638656.jpg,hss_goods/1558428011859844.jpg,hss_goods/1558428011230821.jpg,hss_goods/1558428011194903.jpg,hss_goods/1558428011764770.jpg,hss_goods/1558428011597164.jpg', '', '植萃,护发,发膜', '3', 'hss_goods/compose/2019082009461954531.jpg', '0', '1565590637', '1566265578', '6', '0', '2', '1', '0', '0', '2', '', '168.00', '0.00', '0.00', '24.50', '0.00', '6');
INSERT INTO `goods` VALUES ('494', '黑森森冰爽水润沐浴露', '冰爽水润沐浴露天然植萃薄荷清爽去油止痒滋养多效修护沐浴露大容量家庭装夏日', '58.80', '0.00', '1', '1', '黑森森冰爽水润沐浴露：无惧夏日热浪，赶跑流汗粘腻感', '提取薄荷和人参等植物精华，不添加防腐剂，沐浴在清凉薄荷的芬香中，享受薄荷般清凉舒爽的快感！', '780ml', '', '0', '78', '0', '0', '清新薄荷芳香，清凉冰爽触感；蕴含人参精华，清洁肌肤污垢同时滋养柔润肌肤，沐浴后肌肤倍感清爽柔嫩。', '<p style=\"white-space: normal;\">产品规格<br/></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">净含量 ： 780ml</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\">产品成分：水、月桂醇聚醚硫酸酯铵、月桂醇硫酸酯铵、聚二甲基硅氧烷、椰油酰胺丙基甜菜碱、乙二醇二硬脂酸酯、聚二甲基硅氧烷醇、椰油酰胺 MEA、月桂酰肌氨酸钠、月桂酰谷氨酸钠、聚季铵盐-7、糖基海藻糖、氢化淀粉水解物、鲸蜡硬脂醇、二（氢化牛脂基）邻苯二甲酸酰胺、氯化钠、甜菜碱、橄榄油 PEG-7 酯类、C12-15 链烷醇聚醚-3、季铵盐-80、侧柏（BIOTA ORIENTALIS）叶提取物、北艾（ARTEMISIA VULGARIS）提取物、女贞（LIGUSTRUM LUCIDUM）果提取物、制何首乌（PLOYGONUM MULTFLORUM)提取物、川芎（LIGUSTICUM CHUANXIONG）根提取物、南方菟丝子（CUSCUTA AUSTRALIS）籽提取物、山柰（KAEMPFERIA GALANGA）根提取物、苦参（SOPHORA FLAVESCENS）根提取物、甘草（GLYCYRRHIZA URALENSIS）根提取物、柑橘（CITRUS RETICULATA）果皮提取物、花椒（ZANTHOXYLUM BUNGEANUM）果提取物、乙醇、十二烷基苯磺酸 TEA 盐、己脒定二（羟乙基磺酸）盐、双-氨丙基聚二甲基硅氧烷、十三烷醇聚醚-12、C11-15 链烷醇聚醚-9、聚硅氧烷季铵盐-16、十一烷醇聚醚-11、丁基辛醇、十一烷醇聚醚-5、薄荷醇、聚季铵盐-10、瓜儿胶羟丙基三甲基氯化铵、香精、EDTA 二钠、苯氧乙醇、双（羟甲基）咪唑烷基脲。</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560397596301756.jpg', '添加薄荷辣木籽等植萃精华清洁肌肤去油止痒清凉舒适', '2', 'hss_goods/1560397596301756.jpg,hss_goods/1560392218861109.jpg,hss_goods/1560392218920540.jpg,hss_goods/1560392218359054.jpg', 'hss_goods/1558422212923293.jpg,hss_goods/1558422212199047.jpg,hss_goods/1558422212445786.jpg,hss_goods/1558422212592450.jpg,hss_goods/1558422212774908.jpg,hss_goods/1558422212719269.jpg,hss_goods/1558422212676125.jpg,hss_goods/1558422212636770.jpg,hss_goods/1558422212526702.jpg', '', '植萃,薄荷,去油止痒', '3', 'hss_goods/compose/2019082009463230295.jpg', '0', '1565590758', '1566265592', '5', '0', '2', '1', '0', '0', '2', '', '168.00', '0.00', '0.00', '42.00', '0.00', '6');
INSERT INTO `goods` VALUES ('495', '黑森森鼠尾草安肤沐浴露', '鼠尾草安肤沐浴露天然植祛痘止痒收缩毛孔美背修护沐浴露超大容量家庭装', '58.80', '0.00', '1', '1', '黑森森鼠尾草安肤沐浴露：你一定会喜欢这款小众香调沐浴露', '萃取苦参等中药精华，苦以味名、参以功名，能够祛痘润肤，滋养安神，快来沐浴在鼠尾草的小众甜香中吧', '780ml', '', '0', '78', '0', '0', '蕴含苦参提取物，深层洁净皮肤污垢；大米提取物和水杨酸高效保湿，深入肌肤底层，唤醒肌肤活力，提高皮肤的水润度。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\">产品规格</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">净含量 ： 780ml</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\">产品成分：水、月桂酸、椰油酰胺丙基羟基磺基甜菜碱、月桂醇聚醚硫酸酯钠、氢氧化钾、肉豆蔻酸、月桂醇硫酸酯钠、乙二醇二硬脂酸酯、丙烯酸（酯）类共聚物、椰油酰胺 MEA、甘油、聚丙烯酸、糖基海藻糖、氢化淀粉水解物、香精、聚硅氧烷季铵盐-18、苯氧乙醇、硅烷二醇水杨酸酯、EDTA 二钠、丁二醇、苦参（SOPHORA ANGUSTIFOLIA）根提取物、水解大米提取物、己二醇。</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\">&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560404777113597.jpg', '添加水杨酸苦参等植萃精华祛痘止痒滋养肌肤焕发活力', '2', 'hss_goods/1560404777113597.jpg,hss_goods/1560393233522390.jpg,hss_goods/1560394496473203.jpg,hss_goods/1560394496251121.jpg', 'hss_goods/1559552357268577.jpg,hss_goods/1559552357274017.jpg,hss_goods/1559552357286689.jpg,hss_goods/1559552357241746.jpg,hss_goods/1559552357340215.jpg,hss_goods/1559552357590335.jpg,hss_goods/1559552357705460.jpg,hss_goods/1559552357267364.jpg', '', '植萃,鼠尾草,祛痘止痒', '3', 'hss_goods/compose/2019082009463975928.jpg', '0', '1565590847', '1566265599', '4', '0', '2', '1', '0', '0', '2', '', '168.00', '0.00', '0.00', '42.00', '0.00', '6');
INSERT INTO `goods` VALUES ('496', '黑森森美肌香氛沐浴露', '美肌香氛沐浴露天然植萃玫瑰芳香亮肤保湿提亮修护', '58.80', '0.00', '1', '1', '黑森森美肌香氛沐浴露：在玫瑰浴的浓郁幸福中享受嫩肤美白', '萃取有机重瓣玫瑰精华而成，不添加防腐剂，有效缓解干燥瘙痒，改善肌肤暗哑状况，快来体验吧！', '780ml', '', '0', '78', '0', '0', '萃取玫瑰精华，保湿舒缓肌肤，令肌肤柔嫩有弹性；海藻糖优异保湿性，细腻的泡沫，滋养肌肤的同时给予肌肤活力。', '<p style=\"white-space: normal;\"><span style=\"font-size: 16px;\"><strong>产品规格</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\"><strong>净含量 ：780ml</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 12px; font-family: 宋体, SimSun;\"><strong>产品成分：</strong>水、月桂醇聚醚硫酸酯钠、甘油、椰油酰胺丙基甜菜碱、椰油酰胺<span style=\"font-size: 12px;\">&nbsp;DEA</span>、癸基葡糖苷、月桂醇硫酸酯钠、月桂酰肌氨酸钠、月桂酰谷氨酸钠、糖基海藻糖、氢化淀粉水解物、<span style=\"font-size: 12px;\">PCA&nbsp;</span>钠、海藻糖、氯化钠、苯乙烯<span style=\"font-size: 12px;\">/</span>丙烯酸（酯）类共聚物、苯氧乙醇、双（羟甲基）咪唑烷基脲、香精、<span style=\"font-size: 12px;\">EDTA&nbsp;</span>二钠、柠檬酸、玫瑰（<span style=\"font-size: 12px;\">ROSA RUGOSA</span>）花提取物、<span style=\"font-size: 12px;\">CI 16035</span>。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560404255174786.jpg', '添加玫瑰及海藻糖等提取物温和洁肤保湿舒缓提亮修护', '2', 'hss_goods/1560404255174786.jpg,hss_goods/1560393020552685.jpg,hss_goods/1560393020758897.jpg,hss_goods/1560393020991309.jpg', 'hss_goods/1559552095243150.jpg,hss_goods/1559552095591656.jpg,hss_goods/1559552095828600.jpg,hss_goods/1559552095568138.jpg,hss_goods/1559552095236792.jpg,hss_goods/1559552095835499.jpg,hss_goods/1559552095504890.jpg,hss_goods/1559552095524753.jpg', '', '植萃,玫瑰,保湿亮肤', '3', 'hss_goods/compose/2019082009464763321.jpg', '0', '1565590940', '1566265606', '3', '0', '2', '1', '0', '0', '2', '', '168.00', '0.00', '0.00', '42.00', '0.00', '6');
INSERT INTO `goods` VALUES ('497', '黑森森乳果滋润香体乳', '乳果滋润香体乳天然植萃乳果芬香滋润美白亮肤保湿香体乳', '58.80', '0.00', '1', '1', '黑森森-乳果滋润香体乳：初恋般的木瓜果香，让肌肤如牛奶般丝滑', '提取木瓜、海藻糖等纯天然草本植萃，并加入活性肽和玻尿酸，有效地软化角质、补水保湿，让肌肤丝滑嫩白', '230ml', '', '0', '78', '0', '0', '蕴含多种天然有机植物精华，帮助修护皮肤粗糙和不光滑，改善皮肤干燥保湿滋润肌肤。玫瑰芳香，乳液质地，润而不腻。', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun;\"><strong><span style=\"font-size: 19px;\">产品规格</span></strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 14px;\"><strong>净含量 ：230ml</strong></span></p><p style=\"white-space: normal;\"><span style=\"font-family: 宋体, SimSun; font-size: 12px;\"><strong>产品成分：</strong>水、甘油、丁二醇、矿油、辛酸<span style=\"font-family: 微软雅黑, sans-serif;\">/</span>癸酸甘油三酯、稻（<span style=\"font-family: 微软雅黑, sans-serif;\">ORYZA SATIVA</span>）糠油、海藻糖、棕榈酸乙基己酯、鲸蜡硬脂基葡糖苷、山梨坦橄榄油酸酯、鲸蜡硬脂醇、甘油硬脂酸酯、<span style=\"font-family: 微软雅黑, sans-serif;\">PEG-100&nbsp;</span>硬脂酸酯、聚二甲基硅氧烷、牛油果树（<span style=\"font-family: 微软雅黑, sans-serif;\">BUTYROSPERMUM PARKII</span>）果脂、甘油聚丙烯酸酯、对羟基苯乙酮、生育酚（维生素<span style=\"font-family: 微软雅黑, sans-serif;\">E</span>）、<span style=\"font-family: 微软雅黑, sans-serif;\">1,2-</span>己二醇、丙烯酰二甲基牛磺酸铵<span style=\"font-family: 微软雅黑, sans-serif;\">/VP&nbsp;</span>共聚物、尿囊素、甘草酸二钾、香精、季戊四醇四（双<span style=\"font-family: 微软雅黑, sans-serif;\">-</span>叔丁基羟基氢化肉桂酸）酯、红没药醇、姜（<span style=\"font-family: 微软雅黑, sans-serif;\">ZINGIBER OFFICINALE</span>）根提取物、<span style=\"font-family: 微软雅黑, sans-serif;\">1,2-</span>戊二醇、羟苯基丙酰胺苯甲酸、木瓜蛋白酶、尿素、丝氨酸、丙氨酸、脯氨酸、<span style=\"font-family: 微软雅黑, sans-serif;\">EDTA&nbsp;</span>二钠</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">适用人群：任何肤质&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">品牌：HSS黑森森</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">产地：广东省广州市</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">研发单位：广州美尚生物医药研究院有限公司</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">地址：广州市经济技术开发区科学城开源大道206号第2层</span></p><p><br/></p>', 'hss_goods/1560404684194446.jpg', '添加肌肽尿囊素和乳果精华木瓜果香滋润肌肤亮肤保湿', '2', 'hss_goods/1560404684194446.jpg,hss_goods/1560393148248980.jpg,hss_goods/1560393148171025.jpg,hss_goods/1560393148855068.jpg', 'hss_goods/1559552272628568.jpg,hss_goods/1559552272116441.jpg,hss_goods/1559552272124734.jpg,hss_goods/1559552272972803.jpg,hss_goods/1559552272287374.jpg,hss_goods/1559552272825615.jpg,hss_goods/1559552272183377.jpg', '', '植萃,乳果,滋润美白', '3', 'hss_goods/compose/2019082009465310792.jpg', '0', '1565591056', '1566265613', '2', '0', '2', '1', '0', '0', '2', '', '168.00', '0.00', '0.00', '42.00', '0.00', '6');

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
  `intro` varchar(2000) NOT NULL DEFAULT '' COMMENT '简介',
  `tag` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `belong_to` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '归属：0 ：无 1：中心店 2：工作室。  使用二进制存储',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES ('76', '头部皮肤管理', '0', '1', '0', '0', '0', '头皮养护', 'weiya_goods_gategory/2019080717033470372.png', '', '', '1');
INSERT INTO `goods_category` VALUES ('77', '头发SPA系列', '0', '1', '0', '0', '0', '头发养护', 'weiya_goods_gategory/2019080717043303750.png', '', '', '1');
INSERT INTO `goods_category` VALUES ('78', '身体SPA系列', '0', '1', '0', '0', '0', '高端洗护', 'weiya_goods_gategory/2019080717042391296.png', '', '', '1');

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `headline` varchar(60) NOT NULL DEFAULT '' COMMENT '标题',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：违规（禁售） 2：删除',
  `auth_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核标识位  -1：审核不通过 0:保留 1：待审核 2：审核通过',
  `sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `main_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '主图',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯';

-- ----------------------------
-- Records of information
-- ----------------------------

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'user_id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '平台会员身份：1、普通会员, 2、加盟店家 4、城市合伙人 ',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户平台会员身份表';

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for needs_message
-- ----------------------------
DROP TABLE IF EXISTS `needs_message`;
CREATE TABLE `needs_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名字',
  `mobile` varchar(15) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `message` varchar(2000) NOT NULL DEFAULT '' COMMENT '信息',
  `create_time` int(13) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='需求留言';

-- ----------------------------
-- Records of needs_message
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sn` varchar(32) NOT NULL COMMENT '编号',
  `pay_sn` varchar(33) NOT NULL DEFAULT '' COMMENT '支付单号',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：0、普通 1、团购 2、套餐',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '物流状态：0：临时 1:待付款 2:待收货 3:待评价 4:已完成 5:已取消 6:售后',
  `after_sale_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '售后服务状态 0：正常 1：待处理 2：已完成',
  `pay_code` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付方式：0：保留 1 微信 2：支付宝 3：网银 4:钱包',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `coupons_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '代金券支付金额',
  `actually_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '钱包支付金额',
  `remark` varchar(2000) NOT NULL DEFAULT '' COMMENT '备注说明',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：user.id',
  `coupons_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '代金券ID:coupons.id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  `payment_time` int(11) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `finished_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `consignee` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机电话',
  `province` varchar(20) NOT NULL DEFAULT '0' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '0' COMMENT '市',
  `area` varchar(20) NOT NULL DEFAULT '0' COMMENT '区',
  `detail_address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `express_sn` varchar(200) DEFAULT NULL COMMENT '物流单号',
  `exp_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '快递公司id',
  `receive_time` int(11) NOT NULL DEFAULT '0' COMMENT '确定收货时间',
  `order_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单购买类型：1：商品 2：项目',
  `complete_address` varchar(255) NOT NULL DEFAULT '' COMMENT '完整地址',
  `store_id` int(10) DEFAULT '0' COMMENT '店家id',
  `type_id` int(10) NOT NULL DEFAULT '0' COMMENT '购买的商品类型对应id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1437 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1278', '20190809162548647235561330430933', '', '0', '0', '0', '0', '0', '4900.00', '0.00', '4900.00', '', '53', '0', '1565339148', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '2', '', '1', '0');
INSERT INTO `order` VALUES ('1279', '20190809162748845139920889426129', '', '0', '0', '0', '0', '0', '4900.00', '0.00', '4900.00', '', '53', '0', '1565339268', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '2', '', '1', '0');
INSERT INTO `order` VALUES ('1280', '20190809164254517347618737061788', '', '0', '0', '1', '0', '0', '4900.00', '0.00', '4900.00', '', '53', '0', '1565340174', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '2', '', '1', '0');
INSERT INTO `order` VALUES ('1282', '20190809164606058144170078676335', '', '0', '0', '1', '0', '0', '9800.00', '0.00', '9800.00', '', '53', '0', '1565340366', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1283', '20190814163603048403802596592779', '', '0', '0', '0', '0', '0', '980.00', '0.00', '980.00', '', '65', '0', '1565771763', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1284', '20190814163719290379585207529490', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565771839', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1285', '20190815101152434187611762294955', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1565835112', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1286', '20190815101251177277626888809801', '', '0', '0', '0', '0', '0', '1344.00', '0.00', '1344.00', '', '65', '0', '1565835171', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1287', '20190815102319548040606897508110', '', '0', '0', '0', '0', '0', '336.00', '0.00', '336.00', '', '65', '0', '1565835799', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1288', '20190815102357775143580247579472', '', '0', '0', '0', '0', '0', '2940.00', '0.00', '2940.00', '', '65', '0', '1565835837', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1289', '20190815102605086738972218775070', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565835965', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1290', '20190815102623690778970950781214', '', '0', '0', '0', '0', '0', '138.00', '0.00', '138.00', '', '65', '0', '1565835983', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1291', '20190815103124371193147660911927', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565836284', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1292', '20190815103200285510794270530122', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565836320', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1293', '20190815103223769745646262025163', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565836343', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1294', '20190815103351659570196803046845', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565836431', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1295', '20190815103543341957535262929827', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565836543', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1296', '20190815103625627938166538599577', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565836585', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1297', '20190815103647923162281688175013', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565836607', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1298', '20190815103712835336215067837425', '', '0', '0', '0', '0', '0', '980.00', '0.00', '980.00', '', '65', '0', '1565836632', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1299', '20190815103737953804641238499236', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565836657', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1300', '20190815103752566068555933353400', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565836672', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1301', '20190815103814746041245551659594', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565836694', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1302', '20190815103912638637189684706323', '', '0', '0', '0', '0', '0', '680.00', '0.00', '680.00', '', '65', '0', '1565836752', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1303', '20190815103927402191753052257855', '', '0', '0', '0', '0', '0', '980.00', '0.00', '980.00', '', '65', '0', '1565836767', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1304', '20190815104014335737827272352106', '', '0', '0', '0', '0', '0', '980.00', '0.00', '980.00', '', '65', '0', '1565836814', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1305', '20190815104152687042277437611637', '', '0', '0', '0', '0', '0', '980.00', '0.00', '980.00', '', '65', '0', '1565836912', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1306', '20190815104227202595920781659606', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565836947', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1307', '20190815104336499624357114257528', '', '0', '0', '0', '0', '0', '980.00', '0.00', '980.00', '', '65', '0', '1565837016', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1308', '20190815111446201883447825739338', '', '0', '0', '0', '0', '0', '980.00', '0.00', '980.00', '', '65', '0', '1565838886', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1309', '20190815111807318456936652857833', '', '0', '0', '0', '0', '0', '980.00', '0.00', '980.00', '', '65', '0', '1565839087', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1310', '20190815111905395172527429054249', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565839145', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1311', '20190815112059546926768170972971', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565839259', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1312', '20190815112140752030773982497318', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565839300', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1313', '20190815112246509225808099957048', '', '0', '0', '0', '0', '0', '504.00', '0.00', '504.00', '', '65', '0', '1565839366', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1314', '20190815112415898498278775355505', '', '0', '0', '0', '0', '0', '6800.00', '0.00', '6800.00', '', '65', '0', '1565839455', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1315', '20190815113429932421049827085894', '', '0', '0', '0', '0', '0', '1680.00', '0.00', '1680.00', '', '65', '0', '1565840069', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1316', '20190815113731401639694628279137', '', '0', '0', '0', '0', '0', '336.00', '0.00', '336.00', '', '65', '0', '1565840251', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1317', '20190815120355003638905071473676', '', '0', '0', '0', '0', '0', '1980.00', '0.00', '1980.00', '', '65', '0', '1565841835', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1318', '20190815120520728126539914733258', '', '0', '0', '0', '0', '0', '9800.00', '0.00', '9800.00', '', '65', '0', '1565841920', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1319', '20190815120542372334437375475997', '', '0', '0', '0', '0', '0', '504.00', '0.00', '504.00', '', '65', '0', '1565841942', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1320', '20190815120603046004040818331128', '', '0', '0', '0', '0', '0', '7840.00', '0.00', '7840.00', '', '65', '0', '1565841963', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1321', '20190815120651221033626807300848', '', '0', '0', '0', '0', '0', '1680.00', '0.00', '1680.00', '', '65', '0', '1565842011', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1322', '20190815122011923524525870028864', '', '0', '0', '0', '0', '0', '336.00', '0.00', '336.00', '', '65', '0', '1565842811', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1323', '20190815122256397161992551374126', '', '0', '0', '0', '0', '0', '6800.00', '0.00', '6800.00', '', '65', '0', '1565842976', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1324', '20190815133539961820194588178594', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1565847339', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1325', '20190815133658071500315446341220', '', '0', '0', '0', '0', '0', '1008.00', '0.00', '1008.00', '', '65', '0', '1565847418', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1326', '20190815143034790607067358803535', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1565850634', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1327', '20190815143125099210446711852385', '', '0', '0', '0', '0', '0', '1176.00', '0.00', '1176.00', '', '65', '0', '1565850685', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1328', '20190815143253496799147395973411', '', '0', '0', '0', '0', '0', '2760.00', '0.00', '2760.00', '', '65', '0', '1565850773', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1329', '20190815143353042839342007135152', '', '0', '0', '0', '0', '0', '2760.00', '0.00', '2760.00', '', '65', '0', '1565850833', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1330', '20190815143635280986100204340410', '', '0', '0', '0', '0', '0', '2760.00', '0.00', '2760.00', '', '65', '0', '1565850995', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1331', '20190815143731017871639657472905', '', '0', '0', '0', '0', '0', '2760.00', '0.00', '2760.00', '', '65', '0', '1565851051', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1332', '20190815143819120999374457476943', '', '0', '0', '0', '0', '0', '1584.00', '0.00', '1584.00', '', '65', '0', '1565851099', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1333', '20190815143840947093218648695432', '', '0', '0', '0', '0', '0', '1176.00', '0.00', '1176.00', '', '65', '0', '1565851120', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1334', '20190815143850610018799058638848', '', '0', '0', '0', '0', '0', '2760.00', '0.00', '2760.00', '', '65', '0', '1565851130', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1335', '20190815143900071114827840300663', '', '0', '0', '0', '0', '0', '1920.00', '0.00', '1920.00', '', '65', '0', '1565851140', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1336', '20190815143938915180021210887521', '', '0', '0', '0', '0', '0', '2760.00', '0.00', '2760.00', '', '65', '0', '1565851178', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1337', '20190815143944168409451471491155', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1565851184', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1338', '20190815144012058382447765758814', '', '0', '0', '0', '0', '0', '1176.00', '0.00', '1176.00', '', '65', '0', '1565851212', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1339', '20190815144055309859344162803072', '', '0', '0', '0', '0', '0', '672.00', '0.00', '672.00', '', '65', '0', '1565851255', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1340', '20190815144120798769550040312927', '', '0', '0', '0', '0', '0', '336.00', '0.00', '336.00', '', '65', '0', '1565851280', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1341', '20190815144230671714905957179567', '', '0', '0', '0', '0', '0', '1176.00', '0.00', '1176.00', '', '65', '0', '1565851350', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1342', '20190815145508629476298049243193', '', '0', '0', '0', '0', '0', '1176.00', '0.00', '1176.00', '', '65', '0', '1565852108', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1343', '20190815150120098238479693260303', '', '0', '0', '0', '0', '0', '336.00', '0.00', '336.00', '', '65', '0', '1565852480', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1344', '20190815152136385354213876570733', '', '0', '0', '0', '0', '0', '2562.00', '0.00', '2562.00', '', '65', '0', '1565853696', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1345', '20190815152351509047061390768807', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1565853831', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1346', '20190816091952809918596716472095', '', '0', '0', '0', '0', '0', '2562.00', '0.00', '2562.00', '', '65', '0', '1565918392', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1347', '20190816110700242967841513137691', '', '0', '0', '0', '0', '0', '1148.00', '0.00', '1148.00', '', '55', '0', '1565924820', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1348', '20190816111041476415599827733038', '', '0', '0', '0', '0', '0', '1148.00', '0.00', '1148.00', '', '55', '0', '1565925041', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1349', '20190816111539109856038209073695', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '55', '0', '1565925339', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1350', '20190816113032452445457601365811', '', '0', '0', '0', '0', '0', '672.00', '0.00', '672.00', '', '65', '0', '1565926232', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1351', '20190816113105707288540462489351', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1565926265', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1352', '20190816114907957960295523512823', '', '0', '0', '0', '0', '0', '2562.00', '0.00', '2562.00', '', '65', '0', '1565927347', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1353', '20190816115137319269290026878901', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1565927497', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1354', '20190816172147147482220661980044', '', '0', '0', '0', '0', '0', '4900.00', '0.00', '4900.00', '', '65', '0', '1565947307', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1355', '20190816173253423165651181031661', '', '0', '0', '0', '0', '0', '336.00', '0.00', '336.00', '', '65', '0', '1565947973', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1356', '20190817093055526091216649870707', '', '0', '0', '0', '0', '0', '504.00', '0.00', '504.00', '', '65', '0', '1566005455', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1357', '20190817093506276890249651140535', '', '0', '0', '0', '0', '0', '2040.00', '0.00', '2040.00', '', '65', '0', '1566005706', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1358', '20190817094045328216433867338978', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566006045', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1359', '20190817105800285974725987309032', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566010680', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1360', '20190817105847213272170345919155', '', '0', '0', '0', '0', '0', '2562.00', '0.00', '2562.00', '', '65', '0', '1566010727', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1361', '20190817111931252996174504439297', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566011971', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1362', '20190817112029454829608169788140', '', '0', '0', '0', '0', '0', '336.00', '0.00', '336.00', '', '65', '0', '1566012029', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1363', '20190817112216450967414544126958', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566012136', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1364', '20190817112335045460177349624571', '', '0', '0', '0', '0', '0', '336.00', '0.00', '336.00', '', '65', '0', '1566012215', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1365', '20190817112458441614514563666809', '', '0', '0', '0', '0', '0', '2562.00', '0.00', '2562.00', '', '65', '0', '1566012298', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1366', '20190817112727648786730954059979', '', '0', '0', '0', '0', '0', '2562.00', '0.00', '2562.00', '', '65', '0', '1566012447', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1367', '20190817113030227090900277999066', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566012630', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1368', '20190817113658176224417361531230', '', '0', '0', '0', '0', '0', '2562.00', '0.00', '2562.00', '', '65', '0', '1566013018', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1369', '20190817113748846292337327167705', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566013068', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1370', '20190817114406952459000092198915', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566013446', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1371', '20190817114504662679286484439652', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566013504', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1372', '20190817114520264067202258746708', '', '0', '0', '0', '0', '0', '2970.00', '0.00', '2970.00', '', '65', '0', '1566013520', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1373', '20190817114809001658575392678914', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566013689', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1374', '20190817133507870165961341049255', '', '0', '0', '0', '0', '0', '9800.00', '0.00', '9800.00', '', '65', '0', '1566020107', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1375', '20190817134233323348957875631227', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566020553', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1376', '20190817140522263667671714718541', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566021922', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1377', '20190817141939960735919462061382', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566022779', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1378', '20190817144111143417231624444326', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566024071', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1379', '20190817144426999582200326021168', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566024266', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1380', '20190817144448122563435981558486', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566024288', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1381', '20190817144600651426108965353898', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566024360', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1382', '20190817144732068214962553572954', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566024452', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1383', '20190817145209742964854600058563', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566024729', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1384', '20190817150009071969677963952115', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566025209', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1385', '20190817150144148274071895252847', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566025304', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1386', '20190817151102158548508332699269', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566025862', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1387', '20190817151115514114889134638224', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566025875', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1388', '20190817152046256343787225290891', '', '0', '0', '0', '0', '0', '1386.00', '0.00', '1386.00', '', '65', '0', '1566026446', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1389', '20190817152847175024945965124120', '', '0', '0', '0', '0', '0', '1680.00', '0.00', '1680.00', '', '65', '0', '1566026927', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1390', '20190817152853171271113562478656', '', '0', '0', '0', '0', '0', '3066.00', '0.00', '3066.00', '', '65', '0', '1566026933', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1391', '20190817153314024039019725273851', '', '0', '0', '0', '0', '0', '3066.00', '0.00', '3066.00', '', '65', '0', '1566027194', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1392', '20190817161405133897650484467780', '', '0', '0', '0', '0', '0', '336.00', '0.00', '336.00', '', '65', '0', '1566029645', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1393', '20190817170255764095447115240782', '', '0', '0', '0', '0', '0', '3066.00', '0.00', '3066.00', '', '65', '0', '1566032575', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1394', '20190817170514656545902947304086', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566032714', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1395', '20190817170542388357738541177377', '', '0', '0', '0', '0', '0', '1148.00', '0.00', '1148.00', '', '55', '0', '1566032742', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1396', '20190817171613615483588028524641', '', '0', '0', '0', '0', '0', '3066.00', '0.00', '3066.00', '', '65', '0', '1566033373', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1397', '20190817172040022297363586773861', '', '0', '0', '0', '0', '0', '1344.00', '0.00', '1344.00', '', '17', '0', '1566033640', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1398', '20190817172154596260899147589837', '', '0', '0', '0', '0', '0', '1344.00', '0.00', '1344.00', '', '17', '0', '1566033714', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1399', '20190817172210204952749191958490', '', '0', '0', '0', '0', '0', '1344.00', '0.00', '1344.00', '', '17', '0', '1566033730', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1400', '20190817172348656998804134483098', '', '0', '0', '0', '0', '0', '1680.00', '0.00', '1680.00', '', '17', '0', '1566033828', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1401', '20190819092953536314082635249963', '', '0', '0', '0', '0', '0', '336.00', '0.00', '336.00', '', '17', '0', '1566178193', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1402', '20190819093452329953563498411666', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566178492', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1403', '20190819134845261981947496851406', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566193725', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1404', '20190819134856126437527609483815', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566193736', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1405', '20190819135047315842773823764116', '', '0', '0', '0', '0', '0', '1008.00', '0.00', '1008.00', '', '65', '0', '1566193847', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1406', '20190819140832705390207946322921', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566194912', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1407', '20190819141034727292732064921365', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1566195034', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1408', '20190819142325203460808480523280', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '55', '0', '1566195805', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1409', '20190819142654465540760066631613', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1566196014', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1410', '20190819143104379602246328848395', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1566196264', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1411', '20190819143345365591601186692686', '', '0', '0', '0', '0', '0', '1008.00', '0.00', '1008.00', '', '65', '0', '1566196425', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1412', '20190819143415917291391023253015', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1566196455', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1413', '20190819144101463442284301767094', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1566196861', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1414', '20190819144143770898508378712365', '', '0', '0', '0', '0', '0', '1008.00', '0.00', '1008.00', '', '65', '0', '1566196903', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1415', '20190819144257879623891509807387', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566196977', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1416', '20190819144450284285551200100481', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1566197090', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1417', '20190819144956603759756734273180', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1566197396', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1418', '20190819145409974183244874385742', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566197649', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1419', '20190819145526660206135971155750', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566197726', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1420', '20190819150709156067801981748084', '', '0', '0', '0', '0', '0', '168.00', '0.00', '168.00', '', '65', '0', '1566198429', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1421', '20190819151147101543501035973129', '', '0', '0', '0', '0', '0', '1680.00', '0.00', '1680.00', '', '65', '0', '1566198707', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1422', '20190819151700519704278618749904', '', '0', '0', '1', '0', '0', '3360.00', '0.00', '3360.00', '', '65', '0', '1566199020', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1423', '20190819153524726642480473371419', '', '0', '0', '1', '0', '0', '336.00', '0.00', '336.00', '', '65', '0', '1566200124', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1424', '20190819153840534231805721452195', '', '0', '0', '1', '0', '0', '1584.00', '0.00', '1584.00', '', '65', '0', '1566200320', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1425', '20190819155906528164929888410437', '', '0', '0', '1', '0', '0', '336.00', '0.00', '336.00', '', '65', '0', '1566201546', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1429', '20190820134116826647864001358697', '', '0', '0', '0', '0', '0', '2040.00', '0.00', '2040.00', '', '65', '0', '1566279676', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1430', '20190820134130176565273578018840', '', '0', '0', '0', '0', '0', '6800.00', '0.00', '6800.00', '', '65', '0', '1566279690', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1431', '20190820151008868295248906586167', '', '0', '0', '0', '0', '0', '504.00', '0.00', '504.00', '', '65', '0', '1566285008', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1432', '20190820155329810662824918800412', '', '0', '0', '0', '0', '0', '980.00', '0.00', '980.00', '', '65', '0', '1566287609', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1433', '20190820174033904340783031261130', '', '0', '0', '1', '0', '0', '168.00', '0.00', '168.00', '', '55', '0', '1566294033', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1434', '20190820174119395806021213904071', '', '0', '0', '1', '0', '0', '168.00', '0.00', '168.00', '', '55', '0', '1566294079', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1435', '20190820225825469689074371657515', '', '0', '0', '0', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566313105', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');
INSERT INTO `order` VALUES ('1436', '20190820225834012192516701296533', '', '0', '0', '1', '0', '0', '840.00', '0.00', '840.00', '', '65', '0', '1566313114', '0', '0', '', '', '0', '0', '0', '', null, '0', '0', '1', '', '1', '0');

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
  `store_id` int(10) NOT NULL,
  `goods_img` varchar(200) NOT NULL DEFAULT '' COMMENT '商品缩略图',
  `goods_name` varchar(60) NOT NULL DEFAULT '' COMMENT '商品名称',
  `specification` varchar(1000) NOT NULL DEFAULT '' COMMENT '商品规格',
  `goods_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '购买类型：1：商品 2：项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5636 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('5432', '0', '980.00', '5', '455', '53', '1275', '0', '1', '', '', '', '1');
INSERT INTO `order_detail` VALUES ('5433', '0', '980.00', '6', '456', '53', '1275', '0', '1', '', '', '', '1');
INSERT INTO `order_detail` VALUES ('5434', '0', '980.00', '5', '455', '53', '1276', '0', '1', 'hss_goods/1565073310791276.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5435', '0', '980.00', '6', '456', '53', '1276', '0', '1', 'hss_goods/1565073608259770.jpg', '多肽首乌头皮原液乌发黑发血清蛋白活性肽头皮原液套居家护理白转黑', '', '1');
INSERT INTO `order_detail` VALUES ('5436', '0', '980.00', '5', '24', '53', '1277', '0', '1', 'hss_project/2019080617411326280.jpeg', '黑森森白发转黑护理项目', '', '2');
INSERT INTO `order_detail` VALUES ('5437', '0', '980.00', '5', '24', '53', '1278', '0', '1', 'hss_project/2019080617411326280.jpeg', '黑森森白发转黑护理项目', '', '2');
INSERT INTO `order_detail` VALUES ('5438', '0', '980.00', '5', '24', '53', '1279', '0', '1', 'hss_project/2019080617411326280.jpeg', '黑森森白发转黑护理项目', '', '2');
INSERT INTO `order_detail` VALUES ('5439', '0', '980.00', '5', '24', '53', '1280', '0', '1', 'hss_project/2019080617411326280.jpeg', '黑森森白发转黑护理项目', '', '2');
INSERT INTO `order_detail` VALUES ('5440', '0', '980.00', '5', '456', '53', '1282', '0', '1', 'hss_goods/1565073608259770.jpg', '多肽首乌头皮原液乌发黑发血清蛋白活性肽头皮原液套居家护理白转黑', '', '1');
INSERT INTO `order_detail` VALUES ('5441', '0', '980.00', '5', '455', '53', '1282', '0', '1', 'hss_goods/1565073310791276.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5442', '0', '980.00', '1', '476', '65', '1283', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5443', '0', '168.00', '1', '483', '65', '1284', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5444', '0', '168.00', '5', '483', '65', '1285', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5445', '0', '168.00', '8', '483', '65', '1286', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5446', '0', '168.00', '2', '483', '65', '1287', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5447', '0', '980.00', '3', '476', '65', '1288', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5448', '0', '168.00', '1', '491', '65', '1289', '0', '1', 'hss_goods/1560398485609357.jpg', '玫瑰精华头发修护油天然植萃精华不油腻柔顺护发养发精油', '', '1');
INSERT INTO `order_detail` VALUES ('5449', '0', '138.00', '1', '492', '65', '1290', '0', '1', 'hss_goods/1560404708731665.jpg', '山茶花润亮护发素天然植萃维生素E毛躁开叉烫染损伤保湿滋养', '', '1');
INSERT INTO `order_detail` VALUES ('5450', '0', '168.00', '1', '478', '65', '1291', '0', '1', 'hss_goods/1560404472775068.jpg', '植萃舒缓头皮清洁乳天然植萃玻尿酸滋养舒缓止痒补水保湿敏感', '', '1');
INSERT INTO `order_detail` VALUES ('5451', '0', '168.00', '1', '483', '65', '1292', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5452', '0', '168.00', '1', '483', '65', '1293', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5453', '0', '168.00', '1', '483', '65', '1294', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5454', '0', '168.00', '1', '483', '65', '1295', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5455', '0', '168.00', '1', '483', '65', '1296', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5456', '0', '168.00', '1', '483', '65', '1297', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5457', '0', '980.00', '1', '476', '65', '1298', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5458', '0', '168.00', '1', '483', '65', '1299', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5459', '0', '168.00', '1', '483', '65', '1300', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5460', '0', '168.00', '1', '483', '65', '1301', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5461', '0', '680.00', '1', '481', '65', '1302', '0', '1', 'hss_goods/1565665220262826.jpg', '植萃控油头皮原液深层控油平衡多效修护易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5462', '0', '980.00', '1', '476', '65', '1303', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5463', '0', '980.00', '1', '476', '65', '1304', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5464', '0', '980.00', '1', '476', '65', '1305', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5465', '0', '168.00', '1', '483', '65', '1306', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5466', '0', '980.00', '1', '477', '65', '1307', '0', '1', 'hss_goods/1565588788498584.jpg', '多肽首乌头皮原液乌发黑发血清蛋白活性肽头皮原液套居家护理白转黑', '', '1');
INSERT INTO `order_detail` VALUES ('5467', '0', '980.00', '1', '479', '65', '1308', '0', '1', 'hss_goods/1560397994763275.jpg', '多肽舒缓头皮原液敏感舒缓止痒多效修护易吸收头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5468', '0', '980.00', '1', '476', '65', '1309', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5469', '0', '168.00', '1', '483', '65', '1310', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5470', '0', '168.00', '1', '483', '65', '1311', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5471', '0', '168.00', '1', '483', '65', '1312', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5472', '0', '168.00', '3', '483', '65', '1313', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5473', '0', '680.00', '10', '481', '65', '1314', '0', '1', 'hss_goods/1565665220262826.jpg', '植萃控油头皮原液深层控油平衡多效修护易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5474', '0', '168.00', '10', '483', '65', '1315', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5475', '0', '168.00', '2', '483', '65', '1316', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5476', '0', '198.00', '10', '487', '65', '1317', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5477', '0', '980.00', '10', '477', '65', '1318', '0', '1', 'hss_goods/1565588788498584.jpg', '多肽首乌头皮原液乌发黑发血清蛋白活性肽头皮原液套居家护理白转黑', '', '1');
INSERT INTO `order_detail` VALUES ('5478', '0', '168.00', '3', '478', '65', '1319', '0', '1', 'hss_goods/1560404472775068.jpg', '植萃舒缓头皮清洁乳天然植萃玻尿酸滋养舒缓止痒补水保湿敏感', '', '1');
INSERT INTO `order_detail` VALUES ('5479', '0', '980.00', '8', '477', '65', '1320', '0', '1', 'hss_goods/1565588788498584.jpg', '多肽首乌头皮原液乌发黑发血清蛋白活性肽头皮原液套居家护理白转黑', '', '1');
INSERT INTO `order_detail` VALUES ('5480', '0', '168.00', '10', '483', '65', '1321', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5481', '0', '168.00', '2', '497', '65', '1322', '0', '1', 'hss_goods/1560404684194446.jpg', '乳果滋润香体乳天然植萃乳果芬香滋润美白亮肤保湿香体乳', '', '1');
INSERT INTO `order_detail` VALUES ('5482', '0', '680.00', '10', '481', '65', '1323', '0', '1', 'hss_goods/1565665220262826.jpg', '植萃控油头皮原液深层控油平衡多效修护易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5483', '0', '168.00', '5', '483', '65', '1324', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5484', '0', '168.00', '6', '483', '65', '1325', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5485', '0', '168.00', '5', '483', '65', '1326', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5486', '0', '168.00', '2', '493', '65', '1327', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5487', '0', '168.00', '5', '483', '65', '1327', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5488', '0', '198.00', '8', '486', '65', '1328', '0', '1', 'hss_goods/1565589812903543.jpg', '植萃新生洗发露天然植物进口日本生姜首乌防脱育发生发滋养安全', '', '1');
INSERT INTO `order_detail` VALUES ('5489', '0', '168.00', '2', '493', '65', '1328', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5490', '0', '168.00', '5', '483', '65', '1328', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5491', '0', '198.00', '8', '486', '65', '1329', '0', '1', 'hss_goods/1565589812903543.jpg', '植萃新生洗发露天然植物进口日本生姜首乌防脱育发生发滋养安全', '', '1');
INSERT INTO `order_detail` VALUES ('5492', '0', '168.00', '2', '493', '65', '1329', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5493', '0', '168.00', '5', '483', '65', '1329', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5494', '0', '198.00', '8', '486', '65', '1330', '0', '1', 'hss_goods/1565589812903543.jpg', '植萃新生洗发露天然植物进口日本生姜首乌防脱育发生发滋养安全', '', '1');
INSERT INTO `order_detail` VALUES ('5495', '0', '168.00', '2', '493', '65', '1330', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5496', '0', '168.00', '5', '483', '65', '1330', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5497', '0', '198.00', '8', '486', '65', '1331', '0', '1', 'hss_goods/1565589812903543.jpg', '植萃新生洗发露天然植物进口日本生姜首乌防脱育发生发滋养安全', '', '1');
INSERT INTO `order_detail` VALUES ('5498', '0', '168.00', '2', '493', '65', '1331', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5499', '0', '168.00', '5', '483', '65', '1331', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5500', '0', '198.00', '8', '486', '65', '1332', '0', '1', 'hss_goods/1565589812903543.jpg', '植萃新生洗发露天然植物进口日本生姜首乌防脱育发生发滋养安全', '', '1');
INSERT INTO `order_detail` VALUES ('5501', '0', '168.00', '2', '493', '65', '1333', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5502', '0', '168.00', '5', '483', '65', '1333', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5503', '0', '198.00', '8', '486', '65', '1334', '0', '1', 'hss_goods/1565589812903543.jpg', '植萃新生洗发露天然植物进口日本生姜首乌防脱育发生发滋养安全', '', '1');
INSERT INTO `order_detail` VALUES ('5504', '0', '168.00', '2', '493', '65', '1334', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5505', '0', '168.00', '5', '483', '65', '1334', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5506', '0', '168.00', '2', '493', '65', '1335', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5507', '0', '198.00', '8', '486', '65', '1335', '0', '1', 'hss_goods/1565589812903543.jpg', '植萃新生洗发露天然植物进口日本生姜首乌防脱育发生发滋养安全', '', '1');
INSERT INTO `order_detail` VALUES ('5508', '0', '198.00', '8', '486', '65', '1336', '0', '1', 'hss_goods/1565589812903543.jpg', '植萃新生洗发露天然植物进口日本生姜首乌防脱育发生发滋养安全', '', '1');
INSERT INTO `order_detail` VALUES ('5509', '0', '168.00', '2', '493', '65', '1336', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5510', '0', '168.00', '5', '483', '65', '1336', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5511', '0', '168.00', '5', '483', '65', '1337', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5512', '0', '168.00', '5', '483', '65', '1338', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5513', '0', '168.00', '2', '493', '65', '1338', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5514', '0', '168.00', '4', '494', '65', '1339', '0', '1', 'hss_goods/1560397596301756.jpg', '冰爽水润沐浴露天然植萃薄荷清爽去油止痒滋养多效修护沐浴露大容量家庭装夏日', '', '1');
INSERT INTO `order_detail` VALUES ('5515', '0', '168.00', '2', '493', '65', '1340', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5516', '0', '168.00', '2', '493', '65', '1341', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5517', '0', '168.00', '5', '483', '65', '1341', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5518', '0', '168.00', '2', '493', '65', '1342', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5519', '0', '168.00', '5', '483', '65', '1342', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5520', '0', '168.00', '2', '493', '65', '1343', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5521', '0', '198.00', '7', '487', '65', '1344', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5522', '0', '168.00', '2', '493', '65', '1344', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5523', '0', '168.00', '5', '483', '65', '1344', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5524', '0', '168.00', '5', '496', '65', '1345', '0', '1', 'hss_goods/1560404255174786.jpg', '美肌香氛沐浴露天然植萃玫瑰芳香亮肤保湿提亮修护', '', '1');
INSERT INTO `order_detail` VALUES ('5525', '0', '198.00', '7', '487', '65', '1346', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5526', '0', '168.00', '2', '493', '65', '1346', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5527', '0', '168.00', '5', '483', '65', '1346', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5528', '0', '980.00', '1', '476', '55', '1347', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5529', '0', '168.00', '1', '483', '55', '1347', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5530', '0', '980.00', '1', '476', '55', '1348', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5531', '0', '168.00', '1', '483', '55', '1348', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5532', '0', '168.00', '1', '483', '55', '1349', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5533', '0', '168.00', '4', '483', '65', '1350', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5534', '0', '168.00', '1', '494', '65', '1351', '0', '1', 'hss_goods/1560397596301756.jpg', '冰爽水润沐浴露天然植萃薄荷清爽去油止痒滋养多效修护沐浴露大容量家庭装夏日', '', '1');
INSERT INTO `order_detail` VALUES ('5535', '0', '198.00', '7', '487', '65', '1352', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5536', '0', '168.00', '2', '493', '65', '1352', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5537', '0', '168.00', '5', '483', '65', '1352', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5538', '0', '168.00', '5', '483', '65', '1353', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5539', '0', '980.00', '5', '476', '65', '1354', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5540', '0', '168.00', '2', '483', '65', '1355', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5541', '0', '168.00', '3', '483', '65', '1356', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5542', '0', '680.00', '3', '481', '65', '1357', '0', '1', 'hss_goods/1565665220262826.jpg', '植萃控油头皮原液深层控油平衡多效修护易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5543', '0', '168.00', '5', '483', '65', '1358', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5544', '0', '168.00', '5', '478', '65', '1359', '0', '1', 'hss_goods/1560404472775068.jpg', '植萃舒缓头皮清洁乳天然植萃玻尿酸滋养舒缓止痒补水保湿敏感', '', '1');
INSERT INTO `order_detail` VALUES ('5545', '0', '198.00', '7', '487', '65', '1360', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5546', '0', '168.00', '2', '493', '65', '1360', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5547', '0', '168.00', '5', '483', '65', '1360', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5548', '0', '198.00', '7', '487', '65', '1361', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5549', '0', '168.00', '2', '493', '65', '1362', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5550', '0', '168.00', '5', '483', '65', '1363', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5551', '0', '168.00', '2', '493', '65', '1364', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5552', '0', '198.00', '7', '487', '65', '1365', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5553', '0', '168.00', '2', '493', '65', '1365', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5554', '0', '168.00', '5', '483', '65', '1365', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5555', '0', '198.00', '7', '487', '65', '1366', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5556', '0', '168.00', '2', '493', '65', '1366', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5557', '0', '168.00', '5', '483', '65', '1366', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5558', '0', '168.00', '5', '483', '65', '1367', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5559', '0', '198.00', '7', '487', '65', '1368', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5560', '0', '168.00', '2', '493', '65', '1368', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5561', '0', '168.00', '5', '483', '65', '1368', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5562', '0', '198.00', '7', '487', '65', '1369', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5563', '0', '198.00', '7', '487', '65', '1370', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5564', '0', '198.00', '7', '487', '65', '1371', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5565', '0', '198.00', '15', '487', '65', '1372', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5566', '0', '198.00', '7', '487', '65', '1373', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5567', '0', '980.00', '10', '476', '65', '1374', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5568', '0', '198.00', '7', '487', '65', '1375', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5569', '0', '198.00', '7', '487', '65', '1376', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5570', '0', '198.00', '7', '487', '65', '1377', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5571', '0', '198.00', '7', '487', '65', '1378', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5572', '0', '198.00', '7', '487', '65', '1379', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5573', '0', '198.00', '7', '487', '65', '1380', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5574', '0', '198.00', '7', '487', '65', '1381', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5575', '0', '198.00', '7', '487', '65', '1382', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5576', '0', '198.00', '7', '487', '65', '1383', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5577', '0', '198.00', '7', '487', '65', '1384', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5578', '0', '198.00', '7', '487', '65', '1385', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5579', '0', '198.00', '7', '487', '65', '1386', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5580', '0', '198.00', '7', '487', '65', '1387', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5581', '0', '198.00', '7', '487', '65', '1388', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5582', '0', '168.00', '10', '497', '65', '1389', '0', '1', 'hss_goods/1560404684194446.jpg', '乳果滋润香体乳天然植萃乳果芬香滋润美白亮肤保湿香体乳', '', '1');
INSERT INTO `order_detail` VALUES ('5583', '0', '168.00', '10', '497', '65', '1390', '0', '1', 'hss_goods/1560404684194446.jpg', '乳果滋润香体乳天然植萃乳果芬香滋润美白亮肤保湿香体乳', '', '1');
INSERT INTO `order_detail` VALUES ('5584', '0', '198.00', '7', '487', '65', '1390', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5585', '0', '168.00', '10', '497', '65', '1391', '0', '1', 'hss_goods/1560404684194446.jpg', '乳果滋润香体乳天然植萃乳果芬香滋润美白亮肤保湿香体乳', '', '1');
INSERT INTO `order_detail` VALUES ('5586', '0', '198.00', '7', '487', '65', '1391', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5587', '0', '168.00', '2', '483', '65', '1392', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5588', '0', '168.00', '10', '497', '65', '1393', '0', '1', 'hss_goods/1560404684194446.jpg', '乳果滋润香体乳天然植萃乳果芬香滋润美白亮肤保湿香体乳', '', '1');
INSERT INTO `order_detail` VALUES ('5589', '0', '198.00', '7', '487', '65', '1393', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5590', '0', '168.00', '5', '496', '65', '1394', '0', '1', 'hss_goods/1560404255174786.jpg', '美肌香氛沐浴露天然植萃玫瑰芳香亮肤保湿提亮修护', '', '1');
INSERT INTO `order_detail` VALUES ('5591', '0', '980.00', '1', '476', '55', '1395', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5592', '0', '168.00', '1', '483', '55', '1395', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5593', '0', '168.00', '10', '497', '65', '1396', '0', '1', 'hss_goods/1560404684194446.jpg', '乳果滋润香体乳天然植萃乳果芬香滋润美白亮肤保湿香体乳', '', '1');
INSERT INTO `order_detail` VALUES ('5594', '0', '198.00', '7', '487', '65', '1396', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5595', '0', '168.00', '8', '483', '17', '1397', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5596', '0', '168.00', '8', '483', '17', '1398', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5597', '0', '168.00', '8', '483', '17', '1399', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5598', '0', '168.00', '2', '478', '17', '1400', '0', '1', 'hss_goods/1560404472775068.jpg', '植萃舒缓头皮清洁乳天然植萃玻尿酸滋养舒缓止痒补水保湿敏感', '', '1');
INSERT INTO `order_detail` VALUES ('5599', '0', '168.00', '8', '483', '17', '1400', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5600', '0', '168.00', '2', '497', '17', '1401', '0', '1', 'hss_goods/1560404684194446.jpg', '乳果滋润香体乳天然植萃乳果芬香滋润美白亮肤保湿香体乳', '', '1');
INSERT INTO `order_detail` VALUES ('5601', '0', '168.00', '5', '483', '65', '1402', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5602', '0', '168.00', '5', '483', '65', '1403', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5603', '0', '168.00', '5', '483', '65', '1404', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5604', '0', '168.00', '1', '493', '65', '1405', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5605', '0', '168.00', '5', '483', '65', '1405', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5606', '0', '168.00', '5', '483', '65', '1406', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5607', '0', '168.00', '1', '493', '65', '1407', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5608', '0', '168.00', '1', '483', '55', '1408', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5609', '0', '168.00', '1', '493', '65', '1409', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5610', '0', '168.00', '1', '493', '65', '1410', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5611', '0', '168.00', '1', '493', '65', '1411', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5612', '0', '168.00', '5', '483', '65', '1411', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5613', '0', '168.00', '1', '493', '65', '1412', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5614', '0', '168.00', '1', '493', '65', '1413', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5615', '0', '168.00', '1', '493', '65', '1414', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5616', '0', '168.00', '5', '483', '65', '1414', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5617', '0', '168.00', '5', '483', '65', '1415', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5618', '0', '168.00', '1', '493', '65', '1416', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5619', '0', '168.00', '1', '493', '65', '1417', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5620', '0', '168.00', '5', '483', '65', '1418', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5621', '0', '168.00', '5', '483', '65', '1419', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5622', '0', '168.00', '1', '493', '65', '1420', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5623', '0', '168.00', '10', '493', '65', '1421', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5624', '0', '168.00', '20', '483', '65', '1422', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5625', '0', '168.00', '2', '493', '65', '1423', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5626', '0', '198.00', '8', '487', '65', '1424', '0', '1', 'hss_goods/1565589925884286.jpg', '赋活润养首乌洗发露天然植萃温和清洁乌发黑发滋养多效修护', '', '1');
INSERT INTO `order_detail` VALUES ('5627', '0', '168.00', '2', '493', '65', '1425', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5628', '0', '680.00', '3', '481', '65', '1429', '0', '1', 'hss_goods/1565665220262826.jpg', '植萃控油头皮原液深层控油平衡多效修护易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5629', '0', '680.00', '10', '481', '65', '1430', '0', '1', 'hss_goods/1565665220262826.jpg', '植萃控油头皮原液深层控油平衡多效修护易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5630', '0', '168.00', '3', '493', '65', '1431', '0', '1', 'hss_goods/1560398089825218.jpg', '焕采多效修护发膜天然植萃生姜维生素E毛躁开叉焕采柔顺发膜', '', '1');
INSERT INTO `order_detail` VALUES ('5631', '0', '980.00', '1', '476', '65', '1432', '0', '1', 'hss_goods/1565588537143458.jpg', '多肽新生头皮原液防脱育发生发血清蛋白易吸收正品头皮原液套装', '', '1');
INSERT INTO `order_detail` VALUES ('5632', '0', '168.00', '1', '483', '55', '1433', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5633', '0', '168.00', '1', '483', '55', '1434', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5634', '0', '168.00', '5', '483', '65', '1435', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');
INSERT INTO `order_detail` VALUES ('5635', '0', '168.00', '5', '483', '65', '1436', '0', '1', 'hss_goods/1565665235495569.jpg', '控油清爽头皮清洁啫喱天然植萃薄荷强效控油极致清爽调理去油蓬松清洁毛囊', '', '1');

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'user_id',
  `sn` varchar(32) NOT NULL COMMENT '内部订单编号',
  `actually_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `pay_code` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付方式：0：保留 1 微信 2：支付宝 3：网银 4:钱包',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付单方式：0：保留 1 订单 2：充值 3：加盟 4城市合伙人定金 5 城市合伙人尾款',
  `payment_time` varchar(14) NOT NULL DEFAULT '' COMMENT '支付时间',
  `pay_sn` varchar(33) NOT NULL DEFAULT '' COMMENT '支付单号',
  `pay_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：0：临时 1:待付款 2:已付款 ',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付表';

-- ----------------------------
-- Records of pay
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：违规（禁售） 2：删除',
  `shelf_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '上下架： 1：下架 2：待审核 3 上架',
  `sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `consume_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（分钟）',
  `thumb_decs` varchar(255) NOT NULL COMMENT '简介图简介',
  `thumb_img` varchar(600) NOT NULL DEFAULT '' COMMENT '简介图',
  `main_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '主图',
  `intro` text NOT NULL COMMENT '简介',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '编辑时间',
  `audit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核：0 审核中 1：通过 2：未通过',
  `tag` varchar(1000) NOT NULL DEFAULT '' COMMENT '标签',
  `is_selection` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：不是精选 1：精选',
  `detail_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '详情图 介绍',
  `video` varchar(600) NOT NULL DEFAULT '' COMMENT '视频url',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `background_img` varchar(200) NOT NULL DEFAULT '' COMMENT '背景颜色图',
  `process_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '流程图',
  `description` text NOT NULL COMMENT '描述',
  `remarks` text NOT NULL COMMENT '注意事项',
  `recommend_goods` varchar(300) DEFAULT '' COMMENT '推荐商品: 例 ''1,2,3''',
  `process` text NOT NULL COMMENT '项目流程 json',
  `share_title` varchar(255) NOT NULL DEFAULT '' COMMENT '分享标题',
  `share_desc` varchar(300) NOT NULL DEFAULT '' COMMENT '分享描述',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='项目表';

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('24', '黑森森白发转黑护理项目', '0', '3', '7', '0', '富含血清蛋白和多种活性成分根源激活毛囊干细胞促进白发转黑', 'hss_project/2019080617411326280.jpeg', 'hss_project/1565084420223209.jpg', '&lt;p&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif; font-size: 18.018px;\\&quot;&gt;血清蛋白及多种活性肽成分，激活毛囊干细胞，防止白发增生，并刺通过激黑色素的合成，使白发转黑，配合仪器操作，极大提高活性成分吸收及效果成倍呈现。&lt;/span&gt;&lt;/p&gt;', '1565084664', '1565331922', '1', '白转黑,预防白发,血清蛋白', '0', 'hss_project/1564972423267623.jpg,hss_project/1557813050448375.jpg,hss_project/1557813050939091.jpg,hss_project/1557813050853772.jpg', '', '黑森森白发转黑护理项目', '', 'hss_project/2019080617461259881.jpeg', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目名称：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;黑森森白发转黑护理&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;疗程设置：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;7&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;天／１次，&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;10&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;次为&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;1&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;个疗程&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目功效：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;激活毛囊细胞，防止白发增生，并刺通过激黑色素的合成，使白发转黑&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用人群：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用于工作压力大、用脑过度、作息不规律的患有发质损伤、头发发白、肾气不足的人群&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;使用仪器：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;互联头皮检测仪、纳米微晶促渗仪、头皮多功能导入仪&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理部位：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头皮、头发&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理时间：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;60&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;分钟&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-size: 19px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;注意事项&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头部皮肤溃烂者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;体质衰弱，患严重心脏病者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;临产期孕妇不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;建议护理后6小时内不要洗头&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;避免长时间暴晒，避免紫外线破坏真皮层&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '[{\"img\":\"hss_project\\/2019080617461259881.jpeg\",\"desc\":\"\"}]', '黑森森白发转黑护理项目：修护毛囊细胞，促进黑色素分泌', '利用血清蛋白及多种活性肽成分，激活毛囊干细胞，防止白发增生，并刺通过激黑色素的合成，使白发转黑', '980.00');
INSERT INTO `project` VALUES ('25', '黑森森防脱生发护理项目', '0', '3', '8', '0', '激活毛囊干细胞补充头发蛋白质修护发根促进秀发新生预防脱发', 'hss_project/2019081311233791806.jpeg', 'hss_project/1565666624524242.jpg', '&lt;p&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif; font-size: 18.018px; line-height: 15px;\\&quot;&gt;血清蛋白及多种活性肽成分，激活毛囊干细胞，促进头发蛋白质以及发根修护，延长头发生长期，促进秀发新生，预防脱发。配合仪器操作，极大提高活性成分吸收及效果成倍呈现。&lt;/span&gt;&lt;/p&gt;', '1565084762', '1565666638', '1', '预防脱发,生发育发,血清蛋白', '0', 'hss_project/1565666632693288.jpg,hss_project/1557813256553406.jpg,hss_project/1557813256646527.jpg,hss_project/1557813256241288.jpg', '', '黑森森防脱生发护理项目', '', 'hss_project/2019080617455389941.jpeg', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目名称：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;黑森森防脱生发护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;疗程设置：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;7&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;天／１次，&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;10&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;次为&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;1&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;个疗程&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目功效：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;深层滋养头皮，强健发根，延缓发际线后移，抑制谢顶趋势。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用人群：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用于有脱发倾向或现象，即表现为额角发际线后退、秃顶、发际线可看见少许头皮，头发稀疏等。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;使用仪器：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;互联头皮检测仪、纳米微晶促渗仪、头皮多功能导入仪&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理部位：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头皮、头发&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理时间：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;60&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;分钟&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-size: 19px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;注意事项&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头部皮肤溃烂者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;体质衰弱，患严重心脏病者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;临产期孕妇不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;建议护理后6小时内不要洗头&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;避免长时间暴晒，避免紫外线破坏真皮层&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '[{\"img\":\"hss_project\\/2019080617455389941.jpeg\",\"desc\":\"\"}]', '黑森森防脱生发护理项目：激活毛囊细胞，重新长出健康秀发', '利用血清蛋白及多种活性肽成分，激活毛囊干细胞，促进头发蛋白质以及发根修护，促进秀发新生，预防脱发', '980.00');
INSERT INTO `project` VALUES ('26', '黑森森头皮敏感修护项目', '0', '3', '6', '0', '舒缓头皮发红紧绷瘙痒等症状舒敏消炎滋养头皮增强头皮免疫力', 'hss_project/2019080617481719584.jpeg', 'hss_project/1565084882497346.jpg', '&lt;p&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif; font-size: 18.018px; line-height: 15px;\\&quot;&gt;有效舒缓头皮发红、紧绷、麻木、瘙痒等症状，舒敏消炎，滋润头皮，增强头皮免疫力，改善头皮亚健康状态。配合仪器操作，极大提高活性成分吸收及效果成倍呈现。&lt;/span&gt;&lt;/p&gt;', '1565084906', '1565331933', '1', '修护敏感,痘痘头皮,干燥瘙痒', '0', 'hss_project/1564972562556375.jpg,hss_project/1557812814186488.jpg,hss_project/1557812814764762.jpg,hss_project/1557812814116515.jpg', '', '黑森森头皮敏感修护项目', '', 'hss_project/2019080617481951659.jpeg', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目名称：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;黑森森头皮敏感修护&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;疗程设置：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;7&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;天／１次，&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;10&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;次为&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;1&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;个疗程&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目功效：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;有效舒缓头皮发红、紧绷、麻木、瘙痒等症状，舒敏消炎，滋润头皮，增强头皮免疫力，改善头皮亚健康状态。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal; line-height: 15px;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用人群：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用于频繁烫染、工作压力大、作息不规律造成的头皮敏感人群，头皮敏感人群常见的症状有：粉刺、红肿、炎症、水痘、溃疡、紧绷感等。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;使用仪器：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;互联头皮检测仪、纳米微晶促渗仪、头皮多功能导入仪&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理部位：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头皮、头发&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理时间：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;60&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;分钟&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-size: 19px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;注意事项&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头部皮肤溃烂者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;体质衰弱，患严重心脏病者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;临产期孕妇不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;建议护理后6小时内不要洗头&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;避免长时间暴晒，避免紫外线破坏真皮层&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '[{\"img\":\"hss_project\\/2019080617481951659.jpeg\",\"desc\":\"\"}]', '黑森森头皮敏感修护项目：抗菌舒敏、深层滋养，告别敏感', '有效舒缓头皮发红、紧绷、麻木、瘙痒等症状，舒敏消炎，滋润头皮，增强头皮免疫力，改善头皮亚健康状态', '398.00');
INSERT INTO `project` VALUES ('27', '黑森森头皮深层清洁项目', '0', '3', '5', '0', '祛除头发油脂污垢疏通毛孔使头皮保持清爽净透和秀发柔顺亮丽', 'hss_project/2019081311240784235.jpeg', 'hss_project/1565666654739097.jpg', '&lt;p&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif; font-size: 18.018px;\\&quot;&gt;有效袪除头发和头皮的油脂和污垢，疏通堵塞毛孔，净化毛囊，使头皮清爽净透，秀发柔顺亮丽。&lt;/span&gt;&lt;/p&gt;', '1565084997', '1565666666', '1', '头皮清洁,疏通毛囊,拓客', '0', 'hss_project/1565666660492168.jpg,hss_project/1557804264579414.jpg,hss_project/1557804264735590.jpg,hss_project/1557804264907069.jpg', '', '黑森森头皮深层清洁项目', '', 'hss_project/2019080617494900553.jpeg', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目名称：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;黑森森头皮深层清洁&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理次数：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;7&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;天／１次&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目功效：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;有效舒缓头发和头皮的油脂和净化污垢，疏通堵塞毛孔，通筋活络，使头皮干爽有弹性，秀发柔顺亮丽。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用人群：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用于所有人群。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;使用仪器：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;互联头皮检测仪、毛囊活力梳&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理部位：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头皮、头发&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理时间：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;35&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;分钟&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-size: 19px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;注意事项&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头部皮肤溃烂者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;体质衰弱，患严重心脏病者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;临产期孕妇不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;建议护理后6小时内不要洗头&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;避免长时间暴晒，避免紫外线破坏真皮层&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '[{\"img\":\"hss_project\\/2019080617494900553.jpeg\",\"desc\":\"\"}]', '黑森森头皮深层清洁项目：深层净化头皮，还原头皮健康', '有效袪除头发和头皮的油脂和污垢，疏通堵塞毛孔，净化毛囊，使头皮清爽净透，秀发柔顺亮丽', '98.00');
INSERT INTO `project` VALUES ('28', '黑森森头皮祛屑补水项目', '0', '3', '4', '0', '杀菌祛屑净化头皮毛囊毒素去除老化角质恢复头皮新陈代谢平衡', 'hss_project/2019080617505526658.jpeg', 'hss_project/1565085038328357.jpg', '&lt;p&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif; font-size: 18.018px; line-height: 15px;\\&quot;&gt;杀菌祛屑，净化头皮毛囊毒素，去除老化角质，恢复头皮新陈代谢平衡，彻底袪屑。配合仪器操作，极大提高活性成分吸收及效果成倍呈现。&lt;/span&gt;&lt;/p&gt;', '1565085064', '1565331955', '1', '祛除头屑,净化毛囊,去除角质', '0', 'hss_project/1564972607107333.jpg,hss_project/1557804808729979.jpg,hss_project/1557804808150283.jpg,hss_project/1557804808509263.jpg', '', '黑森森头皮祛屑补水项目', '', 'hss_project/2019080617505767901.jpeg', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目名称：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;黑森森头皮祛屑补水&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;疗程设置：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;7&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;天／１次，&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;10&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;次为&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;1&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;个疗程&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目功效：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;杀灭头部马拉色菌，头螨，移除菌尸，排除头皮毛囊毒素，修复头皮细胞，恢复头皮新陈代谢平衡，彻底袪屑。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用人群：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用于头发干燥，没有光泽、头屑明显且繁多、头皮瘙痒、患有瘢痕、皮炎湿疹的人群。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;使用仪器：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;互联头皮检测仪、头皮多功能导入仪&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理部位：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头皮、头发&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理时间：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;60&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;分钟&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-size: 19px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;注意事项&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头部皮肤溃烂者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;体质衰弱，患严重心脏病者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;临产期孕妇不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;建议护理后6小时内不要洗头&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;避免长时间暴晒，避免紫外线破坏真皮层&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '[{\"img\":\"hss_project\\/2019080617505767901.jpeg\",\"desc\":\"\"}]', '黑森森头皮祛屑补水项目：让头皮无屑可击，恢复紧致弹性', '杀菌祛屑，净化头皮毛囊毒素，去除老化角质，恢复头皮新陈代谢平衡，彻底袪屑，配合仪器效果更加乘', '298.00');
INSERT INTO `project` VALUES ('29', '黑森森头皮控油平衡项目', '0', '3', '3', '0', '植物萃取精华清洁头皮祛除头发头皮的油脂污垢令头发清爽舒适', 'hss_project/2019080617520706112.jpeg', 'hss_project/1565085116302927.jpg', '&lt;p&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;多种植物萃取精华，清洁头皮，&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;袪除头发和头皮的油脂污垢，&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;滋润养护头皮，对头油有良好的调节和改善作用，令头发清爽舒适。&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;配合仪器操作，极大提高活性成分吸收及效果成倍呈现。&lt;/span&gt;&lt;/p&gt;', '1565085141', '1565331962', '1', '控油平衡,清洁头皮,改善头油', '0', 'hss_project/1564972824491719.jpg,hss_project/1557812725166842.jpg,hss_project/1557812725679333.jpg,hss_project/1557812725506689.jpg', '', '黑森森头皮控油平衡项目', '', 'hss_project/2019080617520909925.jpeg', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目名称：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;黑森森头皮控油平衡&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;疗程设置：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;7&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;天／１次，&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;10&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;次为&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;1&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;个疗程&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目功效：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;袪除头发和头皮的油脂污垢，疏通头皮毛孔，滋养头皮，调节皮脂腺油脂分泌平衡，减少油脂分泌。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用人群：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用于油脂分泌旺盛，头发油腻，头皮油脂厚重、毛囊堵塞严重，发质微细，爱吃辛辣、经常熬夜的人群。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;使用仪器：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;互联头皮检测仪、头皮多功能导入仪&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理部位：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头部&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理时间：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;60&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;分钟&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-size: 19px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;注意事项&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头部皮肤溃烂者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;体质衰弱，患严重心脏病者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;临产期孕妇不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;建议护理后6小时内不要洗头&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;避免长时间暴晒，避免紫外线破坏真皮层&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '[{\"img\":\"hss_project\\/2019080617520909925.jpeg\",\"desc\":\"\"}]', '黑森森头皮控油平衡项目：根源调节油脂分泌，对头油说再见', '多种植萃精华，清洁头皮，清洁油污，滋润养护头皮，对头油有良好的调节和改善作用，令头发清爽舒适', '298.00');
INSERT INTO `project` VALUES ('30', '黑森森头部舒缓瑜伽项目', '0', '3', '2', '0', '头皮头发双重养护吸收精油营养修复受损发芯恢复发表弹性色泽', 'hss_project/2019080617533303607.jpeg', 'hss_project/1565085190280550.jpg', '&lt;p&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif; font-size: 18.018px; line-height: 15px;\\&quot;&gt;针对头皮头发双重养护抗衰，吸收精油营养，激活毛囊生发动力，修复发芯受损结构，恢复发表弹性色泽，令头皮恢复弹性，秀发滋润柔顺。&lt;/span&gt;&lt;/p&gt;', '1565085216', '1565331969', '1', '头疗瑜伽,改善毛躁,香氛SPA', '0', 'hss_project/1564972788420000.jpg,hss_project/1557813684370979.jpg,hss_project/1557813684908498.jpg,hss_project/1557813685722640.jpg', '', '黑森森头部舒缓瑜伽项目', '', 'hss_project/2019080617533458374.jpeg', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目名称：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;黑森森头部舒缓瑜伽&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理次数：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;1&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;次&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目功效：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;针对头皮头发双重养护抗衰，吸收精油营养，激活毛囊生发动力，修复发芯受损结构，恢复发表弹性色泽，令头皮恢复弹性，秀发滋润柔顺。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal; line-height: 15px;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用人群：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用于工作压力大、作息不规律，精神状态差，头皮紧绷，毛囊受损，头发干枯昏黄，发梢开叉，受头晕、头痛、脑胀困扰的人群。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;使用仪器：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;互联头皮检测仪、活氧生化仪&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理部位：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头皮、头发&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理时间：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;45&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;分钟&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-size: 19px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;注意事项&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头部皮肤溃烂者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;体质衰弱，患严重心脏病者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;临产期孕妇不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;建议护理后6小时内不要洗头&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;避免长时间暴晒，避免紫外线破坏真皮层&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '[{\"img\":\"hss_project\\/2019080617533458374.jpeg\",\"desc\":\"\"}]', '黑森森头部舒缓瑜伽项目：一头健康柔顺秀发，魅力满分', '针对头皮头发双重养护，激活毛囊生发动力，修复受损发芯，恢复发表弹性色泽，令头皮恢复弹性，秀发滋润柔顺', '128.00');
INSERT INTO `project` VALUES ('31', '黑森森肩颈舒缓护理项目', '0', '3', '1', '0', '缓解肩颈疼痛改善肩颈劳损和肩周炎疾病促进排毒祛湿改善气色', 'hss_project/2019080617542136524.jpeg', 'hss_project/1565085253113866.jpg', '&lt;p&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif; font-size: 18.018px;\\&quot;&gt;有效缓解肩颈疼痛，缓解肩颈部位肌肉紧绷，改善肩颈劳损和肩周炎等疾病，还可排毒祛湿，活血化瘀，缓解压力，改善气色，提高睡眠治疗等&lt;/span&gt;&lt;/p&gt;', '1565085277', '1565331782', '1', '肩颈酸痛,消脂瘦肩,舒经活络', '0', 'hss_project/1564972518132928.jpg,hss_project/1557813518250425.jpg,hss_project/1557813518994290.jpg,hss_project/1557813518737056.jpg', '', '黑森森肩颈舒缓护理项目', '', 'hss_project/2019080617542310515.jpeg', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目名称：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;黑森森肩颈舒缓护理&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;疗程设置：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;7&lt;/span&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 宋体;\\&quot;&gt;天／１次&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;项目功效：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;有效缓解肩颈疼痛、肌肉紧绷，改善肩颈劳损和肩周炎等疾病，还可排毒祛湿，活血化瘀，提神醒脑，缓解压力，改善气色，提高睡眠治疗等。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal; line-height: 15px;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用人群：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;适用于因长时间办公或其他原因造成经络不通，肌肉酸痛，肩颈僵硬、慢性劳损，患有肩周炎、内分泌失调、头痛头晕的人群。&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;使用仪器：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;热浪仪&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理部位：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;肩颈部位&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;护理时间：&lt;/span&gt;&lt;/strong&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;40&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;分钟&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;font-size: 19px; font-family: 微软雅黑, sans-serif;\\&quot;&gt;注意事项&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;头部皮肤溃烂者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;体质衰弱，患严重心脏病者不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;临产期孕妇不建议做此护理&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;建议护理后6小时内不要洗头&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;font-size: 18.018px; white-space: normal;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;★&lt;/span&gt;&lt;span style=\\&quot;font-family: 微软雅黑, sans-serif;\\&quot;&gt;避免长时间暴晒，避免紫外线破坏真皮层&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '[{\"img\":\"hss_project\\/2019080617542310515.jpeg\",\"desc\":\"\"}]', '黑森森肩颈舒缓护理项目：双重芳香精油配合专业护理手法', '有效缓解肩颈疼痛，缓解肩颈部位肌肉紧绷，改善肩颈劳损和肩周炎等疾病，还可排毒祛湿，活血化瘀，缓解压力', '199.00');

-- ----------------------------
-- Table structure for project_category
-- ----------------------------
DROP TABLE IF EXISTS `project_category`;
CREATE TABLE `project_category` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目分类表';

-- ----------------------------
-- Records of project_category
-- ----------------------------

-- ----------------------------
-- Table structure for project_goods
-- ----------------------------
DROP TABLE IF EXISTS `project_goods`;
CREATE TABLE `project_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''状态：0 ：启用 1：禁用 2：删除''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目-商品-关联表';

-- ----------------------------
-- Records of project_goods
-- ----------------------------

-- ----------------------------
-- Table structure for project_promotion
-- ----------------------------
DROP TABLE IF EXISTS `project_promotion`;
CREATE TABLE `project_promotion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `promotion_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '促销ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''状态：0 ：启用 1：禁用 2：删除''',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='场景-方案-关联表';

-- ----------------------------
-- Records of project_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for promotion
-- ----------------------------
DROP TABLE IF EXISTS `promotion`;
CREATE TABLE `promotion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：违规（禁售） 2：删除',
  `shelf_status` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '上下架标识位 1：下架 2：待审核 3 上架',
  `sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `consume_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（分钟）',
  `thumb_img` varchar(200) NOT NULL DEFAULT '' COMMENT '主图',
  `share_title` varchar(255) NOT NULL DEFAULT '' COMMENT '分享标题',
  `share_desc` varchar(300) NOT NULL DEFAULT '' COMMENT '分享描述',
  `main_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '详情图片',
  `intro` text NOT NULL COMMENT '简介详情',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '编辑时间',
  `audit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核：0 审核中 1：通过 2：未通过',
  `tag` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `background_img` varchar(200) NOT NULL DEFAULT '' COMMENT '背景颜色图',
  `logo_img` varchar(200) NOT NULL DEFAULT '' COMMENT '品牌logo',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `retail_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '套餐价格',
  `remarks` varchar(2000) NOT NULL DEFAULT '' COMMENT '备注: ',
  `factory_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '出厂价',
  `agent_special_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '代理特价',
  `agent_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '代理价',
  `franchise_special_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加盟特价',
  `franchise_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加盟价|店家采购价',
  `belong_to_member_buy` tinyint(3) unsigned NOT NULL DEFAULT '6' COMMENT '平台会员身份：1、普通会员, 2、加盟店家 4、城市合伙人 ',
  `is_company_info` tinyint(3) DEFAULT '0' COMMENT '是否登记公司信息',
  `upgrade_member_level` tinyint(3) DEFAULT '0' COMMENT ' 购买后可以升级的会员等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销表';

-- ----------------------------
-- Records of promotion
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_goods
-- ----------------------------
DROP TABLE IF EXISTS `promotion_goods`;
CREATE TABLE `promotion_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `promotion_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '场景ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''状态：0 ：启用 1：禁用 2：删除''',
  `goods_num` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销-商品-关联表';

-- ----------------------------
-- Records of promotion_goods
-- ----------------------------

-- ----------------------------
-- Table structure for recommend_goods
-- ----------------------------
DROP TABLE IF EXISTS `recommend_goods`;
CREATE TABLE `recommend_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `recommend_goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推荐商品ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''状态：0 ：启用 1：禁用 2：删除''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品-推荐商品-关联表';

-- ----------------------------
-- Records of recommend_goods
-- ----------------------------

-- ----------------------------
-- Table structure for scene
-- ----------------------------
DROP TABLE IF EXISTS `scene`;
CREATE TABLE `scene` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：违规（禁售） 2：删除',
  `shelf_status` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '上下架标识位 1：下架 2：待审核 3 上架',
  `sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `consume_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（分钟）',
  `thumb_img` varchar(200) NOT NULL DEFAULT '' COMMENT '主图',
  `main_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '详情图片',
  `intro` varchar(2000) NOT NULL COMMENT '简介详情',
  `share_title` varchar(255) NOT NULL DEFAULT '' COMMENT '分享标题',
  `share_desc` varchar(300) NOT NULL DEFAULT '' COMMENT '分享描述',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '编辑时间',
  `audit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核：0 审核中 1：通过 2：未通过',
  `tag` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `is_selection` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：不是精选 1：精选',
  `background_img` varchar(250) NOT NULL DEFAULT '' COMMENT '背景颜色图',
  `logo_img` varchar(200) NOT NULL DEFAULT '' COMMENT '品牌logo',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '场景类型：1 场景， 2 分类，3项目',
  `display_type` varchar(60) NOT NULL DEFAULT 'detail' COMMENT '展示类型： detail 场景详情，sort 分类，project 项目',
  `tag_category` tinyint(2) NOT NULL DEFAULT '0' COMMENT '标签类别：1-黑森森，2-门店场景应用，3-门店护理项目，4-新零售应用场景，5-新零售商品分类',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='场景表';

-- ----------------------------
-- Records of scene
-- ----------------------------
INSERT INTO `scene` VALUES ('90', '项目', '0', '3', '0', '0', 'hss_scene/2019081311230824358.jpeg', 'hss_scene/1565083841434562.jpg', '&lt;p&gt;烦得很&lt;/p&gt;', '', '', '1565083844', '1565666590', '1', '', '0', '', '', '1', 'project', '1', '涣发大号');
INSERT INTO `scene` VALUES ('91', '在线商城', '0', '1', '0', '0', 'hss_scene/2019080713400440562.jpeg', 'hss_scene/1565156416463261.jpg', '', '黑森森在线商城', '黑森森在线商城', '1565156418', '1565156418', '1', '', '0', '', '', '1', 'detail', '1', '在线商城');

-- ----------------------------
-- Table structure for scene_goods
-- ----------------------------
DROP TABLE IF EXISTS `scene_goods`;
CREATE TABLE `scene_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `scene_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '场景ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''状态：0 ：启用 1：禁用 2：删除''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场景-商品-关联表';

-- ----------------------------
-- Records of scene_goods
-- ----------------------------

-- ----------------------------
-- Table structure for scene_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `scene_goods_category`;
CREATE TABLE `scene_goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `scene_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '场景ID',
  `goods_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''状态：0 ：启用 1：禁用 2：删除''',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='场景-商品分类-关联表';

-- ----------------------------
-- Records of scene_goods_category
-- ----------------------------

-- ----------------------------
-- Table structure for scene_promotion
-- ----------------------------
DROP TABLE IF EXISTS `scene_promotion`;
CREATE TABLE `scene_promotion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `scene_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '场景ID',
  `promotion_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '促销ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''状态：0 ：启用 1：禁用 2：删除''',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='场景-方案-关联表';

-- ----------------------------
-- Records of scene_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for shortcut
-- ----------------------------
DROP TABLE IF EXISTS `shortcut`;
CREATE TABLE `shortcut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_position_id` int(11) DEFAULT NULL COMMENT '广告类型id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告名称',
  `thumb_img` varchar(200) NOT NULL DEFAULT '' COMMENT '广告图',
  `ad_link` varchar(255) NOT NULL DEFAULT '' COMMENT '广告链接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '广告类型 ',
  `shelf_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '上下架： 1：下架 2：待审核 3 上架',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用  2：删除',
  `end_time` int(11) DEFAULT '0' COMMENT '广告结束显示时间',
  `start_time` int(11) DEFAULT '0' COMMENT '广告开始显示时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='广告表';

-- ----------------------------
-- Records of shortcut
-- ----------------------------

-- ----------------------------
-- Table structure for sign_up
-- ----------------------------
DROP TABLE IF EXISTS `sign_up`;
CREATE TABLE `sign_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(25) NOT NULL DEFAULT '' COMMENT '名称',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机电话',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参加会议申请表';

-- ----------------------------
-- Records of sign_up
-- ----------------------------

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：违规（禁售） 2：删除',
  `shelf_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '上下架： 1：下架 2：待审核 3 上架',
  `sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `consume_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（分钟）',
  `thumb_img` varchar(600) NOT NULL DEFAULT '' COMMENT '简介图',
  `main_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '主图',
  `intro` text NOT NULL COMMENT '简介',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '编辑时间',
  `audit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核：0 审核中 1：通过 2：未通过',
  `tag` varchar(1000) NOT NULL DEFAULT '' COMMENT '标签',
  `is_selection` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：不是精选 1：精选',
  `detail_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '详情图',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `background_img` varchar(200) NOT NULL DEFAULT '' COMMENT '背景颜色图',
  `process_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '流程图-相关培训',
  `recommend_goods` varchar(300) NOT NULL DEFAULT '' COMMENT '推荐商品: 例 ''1,2,3''',
  `share_title` varchar(255) NOT NULL DEFAULT '' COMMENT '分享标题',
  `share_desc` varchar(300) NOT NULL DEFAULT '' COMMENT '分享描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目表';

-- ----------------------------
-- Records of sort
-- ----------------------------

-- ----------------------------
-- Table structure for sort_goods
-- ----------------------------
DROP TABLE IF EXISTS `sort_goods`;
CREATE TABLE `sort_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sort_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品类ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''状态：0 ：启用 1：禁用 2：删除''',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目-商品-关联表';

-- ----------------------------
-- Records of sort_goods
-- ----------------------------

-- ----------------------------
-- Table structure for sort_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sort_promotion`;
CREATE TABLE `sort_promotion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sort_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品类ID',
  `promotion_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '促销ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''状态：0 ：启用 1：禁用 2：删除''',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场景-方案-关联表';

-- ----------------------------
-- Records of sort_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for two_dimensional_code
-- ----------------------------
DROP TABLE IF EXISTS `two_dimensional_code`;
CREATE TABLE `two_dimensional_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '买家id',
  `code_url` varchar(255) DEFAULT '' COMMENT '用户平台分享二维码路径',
  `two_dimensional_code_url` varchar(200) NOT NULL DEFAULT '0' COMMENT '用户平台最终分享图片路径',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `create_time` int(20) NOT NULL DEFAULT '0' COMMENT '加入时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户平台二维码';

-- ----------------------------
-- Records of two_dimensional_code
-- ----------------------------

-- ----------------------------
-- Table structure for user_test
-- ----------------------------
DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test` (
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user_test
-- ----------------------------

-- ----------------------------
-- Table structure for wallet
-- ----------------------------
DROP TABLE IF EXISTS `wallet`;
CREATE TABLE `wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：user.id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '盐值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='钱包表';

-- ----------------------------
-- Records of wallet
-- ----------------------------

-- ----------------------------
-- Table structure for wallet_detail
-- ----------------------------
DROP TABLE IF EXISTS `wallet_detail`;
CREATE TABLE `wallet_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sn` varchar(32) NOT NULL DEFAULT '' COMMENT '编号',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：user.id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型：0：保留 1：充值 2：支付',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：禁用 2：删除',
  `recharge_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '充值状态：0 未完成 1：待处理 -已支付 2：已完成',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `actually_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `pay_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '支付订单号',
  `pay_code` varchar(10) NOT NULL DEFAULT '0' COMMENT '''支付方式：1 微信 2：支付宝 3：网银 4:线下支付',
  `payment_time` varchar(20) NOT NULL DEFAULT '' COMMENT '支付时间',
  `voucher_img` varchar(255) NOT NULL DEFAULT '' COMMENT '汇款凭证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='钱包-明细表';

-- ----------------------------
-- Records of wallet_detail
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_share
-- ----------------------------
DROP TABLE IF EXISTS `weixin_share`;
CREATE TABLE `weixin_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '分享链接',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '分享标题',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '分享描述',
  `thumb_img` varchar(200) NOT NULL DEFAULT '' COMMENT '分享图片',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用  2：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='微信分享管理';

-- ----------------------------
-- Records of weixin_share
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_user
-- ----------------------------
DROP TABLE IF EXISTS `weixin_user`;
CREATE TABLE `weixin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '平台user_id',
  `referee` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人',
  `openid` varchar(200) NOT NULL DEFAULT '' COMMENT '微信id',
  `nickname` varchar(200) NOT NULL DEFAULT '' COMMENT '昵称',
  `remark` varchar(20) NOT NULL DEFAULT '' COMMENT '备注',
  `sex` varchar(4) NOT NULL DEFAULT '' COMMENT '性别',
  `country` varchar(10) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(16) NOT NULL DEFAULT '' COMMENT '城市',
  `headimgurl` varchar(250) NOT NULL DEFAULT '' COMMENT '头像',
  `heartbeat` varchar(15) NOT NULL DEFAULT '' COMMENT '最后心跳',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：没关注 1：关注',
  `subscribe_scene` varchar(100) NOT NULL DEFAULT '' COMMENT '返回用户关注的渠道来源，ADD_SCENE_SEARCH 公众号搜索，ADD_SCENE_ACCOUNT_MIGRATION 公众号迁移，ADD_SCENE_PROFILE_CARD 名片分享，ADD_SCENE_QR_CODE 扫描二维码，ADD_SCENEPROFILE LINK 图文页内名称点击，ADD_SCENE_PROFILE_ITEM 图文页右上角菜单，ADD_SCENE_PAID 支付后关注，ADD_SCENE_OTHERS 其他',
  `subscribe_time` varchar(20) NOT NULL DEFAULT '' COMMENT '关注时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=MyISAM AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_user
-- ----------------------------
