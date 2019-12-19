/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 50624
Source Host           : 120.79.201.125:3306
Source Database       : sjds

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-08-21 16:57:34
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `buy_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型：0 保留 1 批量 2 样品',
  `brand_name` varchar(100) NOT NULL DEFAULT '' COMMENT '品牌名',
  `brand_id` int(10) NOT NULL DEFAULT '0' COMMENT '品牌id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车数据表';

-- ----------------------------
-- Records of cart
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
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '商品名称',
  `headline` varchar(500) NOT NULL DEFAULT '' COMMENT '标题文案',
  `bulk_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '批量价格',
  `sample_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '样品价格',
  `minimum_order_quantity` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '订单起订量',
  `minimum_sample_quantity` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '样品起订量',
  `specification` varchar(1000) NOT NULL DEFAULT '' COMMENT '商品规格',
  `specification_unit` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商品规格的单位',
  `category_id_1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类1',
  `category_id_2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类2',
  `category_id_3` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类3',
  `intro` varchar(2000) NOT NULL DEFAULT '' COMMENT '商品介绍',
  `parameters` varchar(5000) NOT NULL DEFAULT '' COMMENT '参数',
  `thumb_img` varchar(200) NOT NULL DEFAULT '' COMMENT '缩略图',
  `main_img` varchar(2500) NOT NULL DEFAULT '' COMMENT '首焦图',
  `detail_img` varchar(2500) NOT NULL DEFAULT '' COMMENT '详情图',
  `goods_video` varchar(255) NOT NULL DEFAULT '' COMMENT '视频',
  `tag` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `shelf_status` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '商品上下架标识位 1：下架 2：待审核 3 上架',
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品表';

-- ----------------------------
-- Records of goods
-- ----------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of goods_category
-- ----------------------------

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
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：0：普通 1：团购',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '物流状态：0：临时 1:待付款 2:待收货 3:待评价 4:已完成 5:已取消 6:售后',
  `after_sale_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '售后服务状态 0：正常 1：待处理 2：已完成',
  `payment_code` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付方式：0：保留 1 微信 2：支付宝 3：网银 4:钱包',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `coupons_pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '代金券支付金额',
  `wallet_pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '钱包支付金额',
  `actually_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额',
  `remark` varchar(2000) NOT NULL DEFAULT '' COMMENT '备注说明',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID：user.id',
  `coupons_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '代金券ID:coupons.id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  `payment_time` varchar(14) NOT NULL DEFAULT '' COMMENT '支付时间',
  `finished_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `consignee` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机电话',
  `province` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '省',
  `city` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '市',
  `area` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '区',
  `detail_address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `brand_name` varchar(255) NOT NULL DEFAULT '' COMMENT '定制的品牌名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of order
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
  `buy_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '购买类型：1：批量 2：样品',
  `store_id` int(10) NOT NULL,
  `brand_name` varchar(100) NOT NULL DEFAULT '' COMMENT '品牌名',
  `brand_id` int(10) NOT NULL DEFAULT '0' COMMENT '品牌id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `category_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级分类id',
  `category_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级分类id',
  `category_id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '三级分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：启用 1：违规（禁售） 2：删除',
  `shelf_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '上下架：0：保留 1：上架 2：下架',
  `sort` tinyint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `consume_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（分钟）',
  `thumb_img` varchar(600) NOT NULL DEFAULT '' COMMENT '主图',
  `main_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '详情图片',
  `intro` text NOT NULL COMMENT '简介',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '编辑时间',
  `audit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核：0 审核中 1：通过 2：未通过',
  `tag` varchar(1000) NOT NULL DEFAULT '' COMMENT '标签',
  `is_selection` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：不是精选 1：精选',
  `detail_img` varchar(2000) NOT NULL DEFAULT '' COMMENT '详情图',
  `belong_to` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '归属：0 ：无 1：中心店 2：工作室。  使用二进制存储',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目表';

-- ----------------------------
-- Records of project
-- ----------------------------

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
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '编辑时间',
  `audit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核：0 审核中 1：通过 2：未通过',
  `tag` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `is_selection` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0 ：不是精选 1：精选',
  `background_img` varchar(250) NOT NULL DEFAULT '' COMMENT '背景颜色图',
  `group` tinyint(3) NOT NULL DEFAULT '1' COMMENT '分组',
  `belong_to` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '归属：0 ：无 1：中心店 2：工作室。  使用二进制存储',
  `row_number` tinyint(3) NOT NULL DEFAULT '2' COMMENT '一行的场景数量',
  `logo_img` varchar(200) NOT NULL DEFAULT '' COMMENT '品牌logo',
  `template` varchar(60) NOT NULL DEFAULT 'detail' COMMENT '对应的方法名 detail 场景，sort 分类，project 项目',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '场景类型：1 场景， 2 分类，3项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场景表';

-- ----------------------------
-- Records of scene
-- ----------------------------

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
-- Table structure for scene_project
-- ----------------------------
DROP TABLE IF EXISTS `scene_project`;
CREATE TABLE `scene_project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `scene_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '场景ID',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''状态：0 ：启用 1：禁用 2：删除''',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='场景-项目-关联表';

-- ----------------------------
-- Records of scene_project
-- ----------------------------

-- ----------------------------
-- Table structure for scene_scheme
-- ----------------------------
DROP TABLE IF EXISTS `scene_scheme`;
CREATE TABLE `scene_scheme` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `scene_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '场景ID',
  `scheme_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '方案ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''状态：0 ：启用 1：禁用 2：删除''',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='场景-商品-关联表';

-- ----------------------------
-- Records of scene_scheme
-- ----------------------------

-- ----------------------------
-- Table structure for scheme
-- ----------------------------
DROP TABLE IF EXISTS `scheme`;
CREATE TABLE `scheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '活动名称',
  `thumb_img` varchar(200) NOT NULL DEFAULT '' COMMENT '简介图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='方案表';

-- ----------------------------
-- Records of scheme
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user_test
-- ----------------------------
INSERT INTO `user_test` VALUES ('16', '杨观保', '', '18664368697', '0', '1', '9d3568bc04dbb7f3be80e743c106851d', '1', '', '0', 'JtXIYWyqnH', '0', '1557048656', '1543808109', '0');
INSERT INTO `user_test` VALUES ('17', '张敏', '', '18819362618', '0', '1', '7fed115a6c3ba4cbb9c80a2743730732', '1', 'user_avatar/2019041511173369697.jpeg', '0', 'OXDQhuxUFl', '0', '1557477743', '1543808634', '0');
INSERT INTO `user_test` VALUES ('19', '阿三', '', '13679898380', '0', '1', '5e18390ad3a1f3c8bfd5929c61730d0f', '0', '', '0', 'HuXZipnIzD', '0', '1551345195', '1543809573', '0');
INSERT INTO `user_test` VALUES ('20', '刘德华', '', '15802011548', '0', '1', '5fa21c8da874f3b3903c0858dfd6361d', '0', '', '0', 'DbrzfVjSFP', '0', '1551345734', '1543817348', '0');
INSERT INTO `user_test` VALUES ('22', '彭于晏', '', '18263366521', '0', '1', '64db3efafa19a6652b26dd7cc36992d4', '0', '', '0', 'MvCLZlaNhf', '0', '1546826788', '1543817640', '0');
INSERT INTO `user_test` VALUES ('23', '胡歌', '', '18263366522', '0', '1', '', '0', '', '0', '', '0', '0', '1543817674', '0');
INSERT INTO `user_test` VALUES ('24', '周星驰', '', '18263366523', '0', '1', '3a95ae49d0c8dd11778abad63ac25d93', '0', '', '0', 'HUMsxJZXbS', '0', '1546912484', '1543817700', '0');
INSERT INTO `user_test` VALUES ('25', '梅艳芳', '', '18263366524', '0', '1', '', '0', '', '0', '', '0', '0', '1543817873', '0');
INSERT INTO `user_test` VALUES ('26', '阿里巴巴', '', '13087799220', '0', '1', '53c7574b0b5649aca0e70f61b990888f', '0', '', '0', 'pDYrksNaIJ', '0', '1543822008', '1543819465', '0');
INSERT INTO `user_test` VALUES ('27', '阿里巴', '', '13087799221', '0', '1', '', '0', '', '0', '', '0', '0', '1543819478', '0');
INSERT INTO `user_test` VALUES ('28', '樱桃小丸子', '', '13087799222', '0', '1', '', '0', '', '0', '', '0', '0', '1543819968', '0');
INSERT INTO `user_test` VALUES ('29', '关羽', '', '18819996658', '0', '1', 'bd38fc5e8adbb3a25c4a508e28ecb15c', '0', '', '0', 'raqdkSPQTv', '0', '1543820141', '1543820055', '0');
INSERT INTO `user_test` VALUES ('30', '王小波', '', '18819665568', '0', '1', '', '0', '', '0', '', '0', '0', '1543820183', '0');
INSERT INTO `user_test` VALUES ('31', '樱桃小丸子', '', '13087799223', '0', '1', '', '0', '', '0', '', '0', '0', '1543820674', '0');
INSERT INTO `user_test` VALUES ('32', '犬夜叉', '', '13087799224', '0', '1', '', '0', '', '0', '', '0', '0', '1543820766', '0');
INSERT INTO `user_test` VALUES ('33', '多啦A梦', '', '13087799225', '0', '1', '', '0', '', '0', '', '0', '0', '1543821611', '0');
INSERT INTO `user_test` VALUES ('34', '笑傲江湖', '', '13187799220', '0', '1', '', '0', '', '0', '', '0', '0', '1543822670', '0');
INSERT INTO `user_test` VALUES ('35', '神雕侠侣', '', '13187799221', '0', '1', '731b8b72b303d29dd7adfd4471954807', '0', '', '0', 'pWvilZcjye', '0', '1545357927', '1543822729', '0');
INSERT INTO `user_test` VALUES ('36', '倚天屠龙记', '', '13187799222', '0', '1', '', '0', '', '0', '', '0', '0', '1543822773', '0');
INSERT INTO `user_test` VALUES ('37', '连城诀', '', '13187799223', '0', '1', '', '0', '', '0', '', '0', '0', '1543822800', '0');
INSERT INTO `user_test` VALUES ('38', '西游记', '', '18163366521', '0', '1', '', '0', '', '0', '', '0', '0', '1543823989', '0');
INSERT INTO `user_test` VALUES ('39', '水浒传', '', '18163366520', '0', '1', 'ee08a3bc153b9cf268f0e4dbe5ae5c53', '0', '', '0', 'FPnBDovKOe', '0', '1543824692', '1543824519', '0');
INSERT INTO `user_test` VALUES ('40', '乔峰', '', '18664368698', '0', '1', 'febc7803f8bb505084e20c195213f168', '0', '', '0', 'uSdqrXWODm', '0', '1545885215', '1545643641', '0');
INSERT INTO `user_test` VALUES ('41', '', '', '13265155634', '0', '1', '757146f34f494332a368f78826c6a7ed', '0', '', '0', 'YaAelLcKEv', '0', '1557476424', '0', '0');

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
  `recharge_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '充值状态：0 未完成 1 完成',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `pay_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '支付订单号',
  `payment_code` varchar(10) NOT NULL DEFAULT '0' COMMENT '''支付方式：1:支付宝 2:weixin 3:银联',
  `payment_time` varchar(20) NOT NULL DEFAULT '' COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='钱包-明细表';

-- ----------------------------
-- Records of wallet_detail
-- ----------------------------
