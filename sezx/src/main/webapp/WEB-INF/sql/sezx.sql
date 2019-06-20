/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : sezx

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2019-06-10 16:43:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for m_answer
-- ----------------------------
DROP TABLE IF EXISTS `m_answer`;
CREATE TABLE `m_answer` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `answer` varchar(255) DEFAULT NULL COMMENT '答案',
  `answer_no` int(11) DEFAULT NULL COMMENT '答案号',
  `test_id` bigint(30) DEFAULT NULL COMMENT '题目号',
  `is_true` int(1) DEFAULT NULL COMMENT '是否正确(0:错误 1:正确）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_answer
-- ----------------------------
INSERT INTO `m_answer` VALUES ('1', '是', '1', '1', '1');
INSERT INTO `m_answer` VALUES ('2', '不是', '2', '1', '0');
INSERT INTO `m_answer` VALUES ('3', '不知道', '3', '1', '0');
INSERT INTO `m_answer` VALUES ('4', '你才是猪', '4', '1', '0');
INSERT INTO `m_answer` VALUES ('17', '你是啊哈', '1', '8', '1');
INSERT INTO `m_answer` VALUES ('18', '你不是啊哈', '2', '8', '0');
INSERT INTO `m_answer` VALUES ('19', '不，你不想', '3', '8', '0');
INSERT INTO `m_answer` VALUES ('20', '我才是', '4', '8', '0');

-- ----------------------------
-- Table structure for m_ccourse
-- ----------------------------
DROP TABLE IF EXISTS `m_ccourse`;
CREATE TABLE `m_ccourse` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_name` varchar(100) DEFAULT NULL COMMENT '课程名',
  `course_describe` varchar(100) DEFAULT NULL COMMENT '课程描述',
  `course_url` varchar(100) DEFAULT NULL COMMENT '课程地址',
  `course_type` int(11) DEFAULT '1' COMMENT '课程类型(0:必修课 1:选修课 2:学员作品)',
  `goods_id` bigint(30) DEFAULT NULL COMMENT '商品id',
  `goods_type` int(1) DEFAULT NULL COMMENT '商品类型(1:必修课程 2:试听课程 3:私人作品(学生) 4:私人作品(教师))',
  `goods_price` double(20,2) DEFAULT '0.00' COMMENT '价格',
  `hits` int(11) DEFAULT '0' COMMENT '点击量',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  `maker_id` bigint(30) DEFAULT NULL COMMENT '制作人id',
  `maker_name` varchar(50) DEFAULT NULL COMMENT '制作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_ccourse
-- ----------------------------
INSERT INTO `m_ccourse` VALUES ('1', 'oceans.webm', '2222', '/upload/2019031012470470oceans.webm', '1', null, null, null, '14', '2019-03-10 12:47:11', '15', 'xiaoming');
INSERT INTO `m_ccourse` VALUES ('2', 'oceans.webm', '测试自动上架', '/upload/201904011031359oceans.webm', '1', '9', '2', '200.00', '17', '2019-04-01 10:31:51', '15', 'xiaoming');

-- ----------------------------
-- Table structure for m_comment
-- ----------------------------
DROP TABLE IF EXISTS `m_comment`;
CREATE TABLE `m_comment` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `message` varchar(100) DEFAULT NULL COMMENT '评论',
  `user_type` int(11) DEFAULT '0' COMMENT '用户类型(0:学员 1:教师 2:管理员 )',
  `user_id` bigint(30) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(40) DEFAULT NULL COMMENT '用户名',
  `comment_time` datetime DEFAULT NULL COMMENT '评论时间',
  `p_id` bigint(30) DEFAULT NULL COMMENT '父信息',
  `works_id` bigint(30) DEFAULT NULL COMMENT '视频id',
  `works_type` bigint(1) DEFAULT '0' COMMENT '视频类型(0:学员作品 1:必修课 2:试听课)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_comment
-- ----------------------------
INSERT INTO `m_comment` VALUES ('6', '333', '0', '1', '小磊', '2019-03-09 09:39:31', null, '1', '0');
INSERT INTO `m_comment` VALUES ('7', '111', '0', '1', '小磊', '2019-03-10 09:21:37', null, '1', '0');
INSERT INTO `m_comment` VALUES ('8', '222', '0', '1', '小磊', '2019-03-10 09:59:54', '6', '1', '0');
INSERT INTO `m_comment` VALUES ('9', '333', '0', '1', '小磊', '2019-03-10 10:22:39', '6', '1', '0');
INSERT INTO `m_comment` VALUES ('12', 'wr3333', '0', '1', '小磊', '2019-03-10 11:55:10', '11', '8', '1');
INSERT INTO `m_comment` VALUES ('14', '888', '1', '10', '老刘', '2019-03-10 12:29:34', null, '8', '0');
INSERT INTO `m_comment` VALUES ('15', 'wr2222', '1', '10', '老刘', '2019-03-10 12:32:39', null, '8', '0');
INSERT INTO `m_comment` VALUES ('16', 'wr1111111', '1', '10', '老刘', '2019-03-10 12:34:06', null, '8', '1');
INSERT INTO `m_comment` VALUES ('17', '试听课评论', '1', '10', '老刘', '2019-03-10 12:47:34', null, '1', '2');
INSERT INTO `m_comment` VALUES ('18', null, '2', '15', 'xiaoming', '2019-03-10 22:20:21', null, null, '0');
INSERT INTO `m_comment` VALUES ('19', '还好', '2', '15', 'xiaoming', '2019-03-11 00:33:53', '8', '1', '0');
INSERT INTO `m_comment` VALUES ('20', '11111', '0', '1', '小磊', '2019-03-31 16:48:08', '17', '1', '2');
INSERT INTO `m_comment` VALUES ('30', '11111', '0', '1', '小磊', '2019-03-31 17:14:28', null, '1', '1');
INSERT INTO `m_comment` VALUES ('31', '1111', '0', '1', '小磊', '2019-03-31 17:15:23', null, '1', '2');
INSERT INTO `m_comment` VALUES ('32', '22222', '0', '1', '小磊', '2019-03-31 17:15:32', null, '1', '2');
INSERT INTO `m_comment` VALUES ('33', '33333', '0', '1', '小磊', '2019-03-31 17:15:37', null, '1', '2');
INSERT INTO `m_comment` VALUES ('34', '44444', '0', '1', '小磊', '2019-03-31 17:15:45', '33', '1', '2');
INSERT INTO `m_comment` VALUES ('35', '收费的方式', '0', '1', '小磊', '2019-03-31 17:54:08', '33', '1', '2');
INSERT INTO `m_comment` VALUES ('36', '哈哈哈哈', '0', '1', '小磊', '2019-03-31 18:31:38', '33', '1', '2');
INSERT INTO `m_comment` VALUES ('37', '晚上', '0', '1', '小磊', '2019-03-31 18:34:14', null, '1', '2');
INSERT INTO `m_comment` VALUES ('38', '事实上', '0', '1', '小磊', '2019-03-31 18:34:35', '17', '1', '2');
INSERT INTO `m_comment` VALUES ('39', '哈哈哈', '0', '1', '小磊', '2019-03-31 18:36:33', null, '9', '1');
INSERT INTO `m_comment` VALUES ('40', '666', '0', '1', '小磊', '2019-03-31 18:36:47', null, '2', '0');
INSERT INTO `m_comment` VALUES ('41', '哈哈哈', '0', '1', '小磊', '2019-03-31 22:52:21', null, '1', '2');
INSERT INTO `m_comment` VALUES ('42', '哈哈哈', '0', '1', '小磊', '2019-04-01 04:03:04', null, '2', '0');
INSERT INTO `m_comment` VALUES ('43', '呃呃呃', '0', '1', '小磊', '2019-04-01 11:03:55', null, '2', '2');
INSERT INTO `m_comment` VALUES ('44', '你是对的', '0', '1', '小磊', '2019-04-01 21:40:52', '39', '9', '1');
INSERT INTO `m_comment` VALUES ('45', '还好', '0', '1', '小磊', '2019-04-01 21:41:00', '39', '9', '1');
INSERT INTO `m_comment` VALUES ('46', '我觉得还行', '0', '1', '小磊', '2019-04-01 21:41:11', null, '9', '1');

-- ----------------------------
-- Table structure for m_discount
-- ----------------------------
DROP TABLE IF EXISTS `m_discount`;
CREATE TABLE `m_discount` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `discount_name` varchar(50) DEFAULT NULL COMMENT '折扣名称',
  `discount_expression` varchar(100) DEFAULT NULL COMMENT '折扣公式(P为当前价格占位）',
  `goods_type_id` bigint(30) DEFAULT NULL COMMENT '商品类别',
  `begin_time` datetime DEFAULT NULL COMMENT '折扣开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `is_open` int(1) DEFAULT '0' COMMENT '是否启用(0:不启用 1:启用)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_discount
-- ----------------------------
INSERT INTO `m_discount` VALUES ('1', '8折', 'P*0.8', '1', null, null, '1');
INSERT INTO `m_discount` VALUES ('2', '9折', 'P*0.98', '1', null, null, '0');
INSERT INTO `m_discount` VALUES ('3', '春节促销', '(P*0.8*(0.9+0.09))', '1', null, null, '1');
INSERT INTO `m_discount` VALUES ('7', '日常促销', 'P*1.01', '1', '2019-03-04 00:00:00', '2019-03-21 00:00:00', '0');

-- ----------------------------
-- Table structure for m_download
-- ----------------------------
DROP TABLE IF EXISTS `m_download`;
CREATE TABLE `m_download` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `file_name` varchar(30) DEFAULT NULL COMMENT '文件名',
  `file_url` varchar(50) DEFAULT NULL COMMENT '文件地址',
  `file_describe` varchar(50) DEFAULT NULL COMMENT '文件描述',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_download
-- ----------------------------
INSERT INTO `m_download` VALUES ('11', '2019032509484618图2.jpeg', '/upload/20190402222444952019032509484618图2.jpeg', '测试', '2019-03-07 03:24:38');

-- ----------------------------
-- Table structure for m_goods
-- ----------------------------
DROP TABLE IF EXISTS `m_goods`;
CREATE TABLE `m_goods` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `goods_type` varchar(100) DEFAULT NULL COMMENT '商品类别(多个用|隔开)',
  `goods_describe` varchar(100) DEFAULT NULL COMMENT '商品描述',
  `goods_unit_price` double(20,2) DEFAULT NULL COMMENT '商品单价',
  `user_id` bigint(30) DEFAULT NULL COMMENT '所属者id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '所属者名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_goods
-- ----------------------------
INSERT INTO `m_goods` VALUES ('1', '豆沙包', '1', '面包', '4.00', null, null);
INSERT INTO `m_goods` VALUES ('8', 'oceans.webm', '1', null, '100.00', '15', 'xiaoming');
INSERT INTO `m_goods` VALUES ('9', 'oceans.webm', '2', null, '200.00', '15', 'xiaoming');
INSERT INTO `m_goods` VALUES ('21', '测试前端上传视频', '3', null, '125.00', '1', '小磊');

-- ----------------------------
-- Table structure for m_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `m_goods_type`;
CREATE TABLE `m_goods_type` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_name` varchar(100) DEFAULT NULL COMMENT '类别名称',
  `type_describe` varchar(100) DEFAULT NULL COMMENT '类别描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_goods_type
-- ----------------------------
INSERT INTO `m_goods_type` VALUES ('1', '必修课程', '视频');
INSERT INTO `m_goods_type` VALUES ('2', '试听课程', '视频');
INSERT INTO `m_goods_type` VALUES ('3', '私人作品(学生)', '视频');
INSERT INTO `m_goods_type` VALUES ('4', '私人作品(教师)', '视频');

-- ----------------------------
-- Table structure for m_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `m_pay_record`;
CREATE TABLE `m_pay_record` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `payment_money` double(24,2) DEFAULT NULL COMMENT '支付金额',
  `purchase_xinxi_id` bigint(30) DEFAULT NULL COMMENT '购买信息表的id',
  `outtradeno` varchar(50) DEFAULT NULL COMMENT '商户订单号',
  `pay_type` int(10) DEFAULT NULL COMMENT '支付方式',
  `goods_detail` varchar(100) DEFAULT NULL COMMENT '商品详情',
  `trade_number` varchar(100) DEFAULT NULL COMMENT '支付宝或者微信返回的交易号',
  `content` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_pay_record
-- ----------------------------
INSERT INTO `m_pay_record` VALUES ('1', '2019-05-15 00:18:36', '80.00', '12', null, null, 'oceans.webm', null, null);

-- ----------------------------
-- Table structure for m_purchase_mingxi
-- ----------------------------
DROP TABLE IF EXISTS `m_purchase_mingxi`;
CREATE TABLE `m_purchase_mingxi` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_id` bigint(30) NOT NULL COMMENT '商品id',
  `goods_name` varchar(30) DEFAULT NULL COMMENT '商品名',
  `goods_unit_price` double(20,2) NOT NULL COMMENT '商品单价',
  `goods_amount` int(10) NOT NULL COMMENT '商品数量',
  `goods_total_price` double(20,2) DEFAULT NULL COMMENT '商品总价',
  `purchase_xinxi_id` bigint(30) NOT NULL COMMENT '购买信息表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_purchase_mingxi
-- ----------------------------
INSERT INTO `m_purchase_mingxi` VALUES ('2', '1', '豆沙包', '4.00', '2', '8.00', '2');
INSERT INTO `m_purchase_mingxi` VALUES ('3', '1', '豆沙包', '4.00', '2', '8.00', '2');
INSERT INTO `m_purchase_mingxi` VALUES ('4', '8', 'oceans.webm', '100.00', '1', '80.00', '6');
INSERT INTO `m_purchase_mingxi` VALUES ('5', '8', 'oceans.webm', '100.00', '1', '80.00', '7');
INSERT INTO `m_purchase_mingxi` VALUES ('6', '9', 'oceans.webm', '200.00', '1', '160.00', '8');
INSERT INTO `m_purchase_mingxi` VALUES ('7', '9', 'oceans.webm', '200.00', '1', '160.00', '9');
INSERT INTO `m_purchase_mingxi` VALUES ('8', '9', 'oceans.webm', '200.00', '1', '200.00', '10');
INSERT INTO `m_purchase_mingxi` VALUES ('9', '8', 'oceans.webm', '100.00', '1', '100.00', '11');
INSERT INTO `m_purchase_mingxi` VALUES ('10', '8', 'oceans.webm', '100.00', '1', '80.00', '12');

-- ----------------------------
-- Table structure for m_purchase_xinxi
-- ----------------------------
DROP TABLE IF EXISTS `m_purchase_xinxi`;
CREATE TABLE `m_purchase_xinxi` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bianhao` varchar(10) DEFAULT NULL COMMENT '购买编号',
  `purchase_num` int(20) DEFAULT NULL COMMENT '购买数量',
  `total_amount` double(20,2) DEFAULT NULL COMMENT '购买总金额',
  `customer_phone` varchar(11) DEFAULT NULL COMMENT '购买人手机',
  `customer_id` bigint(30) DEFAULT NULL COMMENT '顾客id',
  `discount_id` bigint(30) DEFAULT NULL COMMENT '折扣方式',
  `discount_amount` double DEFAULT NULL COMMENT '折扣后价格',
  `customer_name` varchar(20) DEFAULT NULL COMMENT '顾客姓名',
  `customer_type` int(1) DEFAULT NULL COMMENT '顾客类型(0:学员 1:教师)',
  `is_payment` int(4) DEFAULT '0' COMMENT '是否付款(0:未付款 1:已付款 2:付款失败)',
  `pay_type` int(4) DEFAULT NULL COMMENT '付款方式(0:现金交易1:支付宝2:微信3:刷卡支付)',
  `purchase_time` datetime DEFAULT NULL COMMENT '购买时间',
  `trade_number` varchar(50) DEFAULT NULL COMMENT '交易号（调支付宝或微信返回）',
  `ismakepact` int(2) DEFAULT '0' COMMENT '是否生成合同(0:未生成 1:生成)',
  `outTradeNo` varchar(50) DEFAULT NULL COMMENT '订单号',
  `pay_record_id` bigint(30) DEFAULT NULL COMMENT '付款记录id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_purchase_xinxi
-- ----------------------------
INSERT INTO `m_purchase_xinxi` VALUES ('2', null, '2', '122.00', null, '2', '1', '97.6', '小小明', null, '1', '0', '2019-03-03 10:26:49', null, null, null, null);
INSERT INTO `m_purchase_xinxi` VALUES ('3', null, '1', '10.00', null, '3', '1', '8', '小吴', null, '1', '0', '2019-03-03 09:38:56', null, null, null, null);
INSERT INTO `m_purchase_xinxi` VALUES ('5', null, '2', '122.00', null, '9', '1', '98', '小何', null, '1', '0', '2019-03-03 10:26:44', null, null, null, null);
INSERT INTO `m_purchase_xinxi` VALUES ('6', null, '1', '100.00', '13310269247', '1', '1', '80', '小磊', '0', '1', null, '2019-04-01 13:00:33', null, '0', null, null);
INSERT INTO `m_purchase_xinxi` VALUES ('7', null, '1', '100.00', '13310269247', '1', '1', '80', '小磊', '0', '1', null, '2019-04-01 21:34:10', null, '0', null, null);
INSERT INTO `m_purchase_xinxi` VALUES ('8', null, '1', '200.00', '13310269247', '1', '1', '160', '小磊', '0', '1', null, '2019-04-04 04:02:44', null, '0', null, null);
INSERT INTO `m_purchase_xinxi` VALUES ('9', null, '1', '200.00', '13310269247', '1', '1', '160', '小磊', '0', '1', null, '2019-04-04 04:13:14', null, '0', null, null);
INSERT INTO `m_purchase_xinxi` VALUES ('10', null, '1', '200.00', '13310269247', '1', null, '200', '小磊', '0', '1', null, '2019-04-06 00:42:48', null, '0', null, null);
INSERT INTO `m_purchase_xinxi` VALUES ('11', null, '1', '100.00', '13310269247', '1', null, '100', '小磊', '0', '1', null, '2019-04-06 00:43:24', null, '0', null, null);
INSERT INTO `m_purchase_xinxi` VALUES ('12', null, '1', '100.00', '13310269247', '1', '1', '80', '小磊', '0', '1', null, '2019-05-15 00:00:02', null, '0', null, null);

-- ----------------------------
-- Table structure for m_rcourse
-- ----------------------------
DROP TABLE IF EXISTS `m_rcourse`;
CREATE TABLE `m_rcourse` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_name` varchar(100) DEFAULT NULL COMMENT '课程名',
  `course_describe` varchar(100) DEFAULT NULL COMMENT '课程描述',
  `course_url` varchar(100) DEFAULT NULL COMMENT '课程地址',
  `course_type` int(11) DEFAULT '0' COMMENT '课程类型(0:必修课 1:选修课 2:学员作品)',
  `goods_id` bigint(30) DEFAULT NULL COMMENT '商品id',
  `goods_type` int(1) DEFAULT NULL COMMENT '商品类型(1:必修课程 2:试听课程 3:私人作品(学生) 4:私人作品(教师))',
  `goods_price` double(20,2) DEFAULT '0.00' COMMENT '价格',
  `hits` int(11) DEFAULT '0' COMMENT '点击量',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  `maker_id` bigint(30) DEFAULT NULL COMMENT '制作人id',
  `maker_name` varchar(50) DEFAULT NULL COMMENT '制作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_rcourse
-- ----------------------------
INSERT INTO `m_rcourse` VALUES ('8', 'oceans.webm', 'aaa', '/upload/2019030820581441oceans.webm', '0', null, null, null, '12', '2019-03-08 03:20:08', '15', 'xiaoming');
INSERT INTO `m_rcourse` VALUES ('9', 'oceans.webm', 'sss', '/upload/2019031012394767oceans.webm', '0', null, null, null, '11', '2019-03-10 12:40:14', '15', 'xiaoming');
INSERT INTO `m_rcourse` VALUES ('10', 'oceans.webm', '测试自动上架', '/upload/2019040110295742oceans.webm', '0', '8', '1', '100.00', '10', '2019-04-01 10:30:21', '15', 'xiaoming');

-- ----------------------------
-- Table structure for m_student
-- ----------------------------
DROP TABLE IF EXISTS `m_student`;
CREATE TABLE `m_student` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `login_id` varchar(30) DEFAULT '' COMMENT '登录账号',
  `login_pwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `touxiang` varchar(255) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sign` varchar(100) DEFAULT NULL COMMENT '个性签名',
  `mobile` varchar(11) DEFAULT NULL COMMENT '联系手机',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `verify_code` varchar(6) DEFAULT NULL COMMENT '验证码',
  `verify_code_time` datetime DEFAULT NULL COMMENT '验证码发送时间',
  `ischeck` int(1) DEFAULT '1' COMMENT '是否通过审核(0:未通过 1:通过)',
  `status` int(1) DEFAULT '1' COMMENT '状态(0:未注册,1:注册)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nickname` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of m_student
-- ----------------------------
INSERT INTO `m_student` VALUES ('1', '13310269246', '81dc9bdb52d04dc20036dbd8313ed055', '/upload/2019033119051225图1.jpg', '小磊', '我是小磊我是学员', '13310269247', '2018-05-17 00:00:00', '735881', '2018-06-01 00:00:00', '0', '1');
INSERT INTO `m_student` VALUES ('2', '18875016770', '202cb962ac59075b964b07152d234b70', '\\upload\\18875016770\\20180607\\QQ截图201806061047521.png', '小小明', null, '18875016770', '2018-06-06 00:00:00', null, '2018-06-06 00:00:00', '0', '1');
INSERT INTO `m_student` VALUES ('3', '18875015550', '202cb962ac59075b964b07152d234b70', '/upload/2019031102362792图1.jpg', '小吴', null, '18875015550', '2018-06-07 00:00:00', null, '2018-06-07 00:00:00', '0', '1');
INSERT INTO `m_student` VALUES ('4', '13310261234', '202cb962ac59075b964b07152d234b70', '/upload/2019031100255413图1.jpg', '小芳', null, '13310261234', '2018-06-07 00:00:00', null, '2018-06-07 00:00:00', '0', '1');
INSERT INTO `m_student` VALUES ('5', '13436153060', '202cb962ac59075b964b07152d234b70', '/upload/201903150028483图1.jpg', '小刘', null, '13436153060', '2018-06-09 00:00:00', null, '2018-06-09 00:00:00', '0', '1');
INSERT INTO `m_student` VALUES ('6', '18725651456', '202cb962ac59075b964b07152d234b70', null, '小毛', null, '18725651456', '2018-06-12 00:00:00', '117821', '2018-06-12 00:00:00', '0', '1');
INSERT INTO `m_student` VALUES ('8', '18602373640', '202cb962ac59075b964b07152d234b70', null, '小王', null, '18602373640', '2018-06-13 00:00:00', '519073', '2018-06-13 00:00:00', '0', '1');
INSERT INTO `m_student` VALUES ('9', '18602353640', '202cb962ac59075b964b07152d234b70', null, '小何', null, '18602373640', '2018-06-13 00:00:00', '519073', '2018-06-13 00:00:00', '0', '1');
INSERT INTO `m_student` VALUES ('10', '123456778', '202cb962ac59075b964b07152d234b70', null, '小钟', null, '15456578878', '2019-03-04 20:12:04', null, null, '1', '1');
INSERT INTO `m_student` VALUES ('11', 'shiju', '670b14728ad9902aecba32e22fa4f6bd', null, 'shiju', null, '18875016794', '2019-04-07 19:18:04', null, null, '1', '1');
INSERT INTO `m_student` VALUES ('15', 'shiju1', '670b14728ad9902aecba32e22fa4f6bd', null, 'shiju1', null, '18875016794', '2019-04-07 21:10:21', null, null, '1', '1');
INSERT INTO `m_student` VALUES ('16', 'shiju2', '670b14728ad9902aecba32e22fa4f6bd', null, 'shiju2', null, '18875016794', '2019-04-07 22:45:53', null, null, '1', '1');
INSERT INTO `m_student` VALUES ('17', 'shiju3', '670b14728ad9902aecba32e22fa4f6bd', null, 'shiju3', null, '18875016794', '2019-04-07 22:49:51', null, null, '1', '1');
INSERT INTO `m_student` VALUES ('18', 'shiju7', '670b14728ad9902aecba32e22fa4f6bd', null, 'shiju7', null, '18875016794', '2019-04-07 22:55:55', null, null, '1', '1');

-- ----------------------------
-- Table structure for m_teacher
-- ----------------------------
DROP TABLE IF EXISTS `m_teacher`;
CREATE TABLE `m_teacher` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `login_id` varchar(30) DEFAULT '' COMMENT '登录账号',
  `login_pwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `touxiang` varchar(255) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sign` varchar(100) DEFAULT NULL COMMENT '个性签名',
  `mobile` varchar(11) DEFAULT NULL COMMENT '联系手机',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `verify_code` varchar(6) DEFAULT NULL COMMENT '验证码',
  `verify_code_time` datetime DEFAULT NULL COMMENT '验证码发送时间',
  `ischeck` int(1) DEFAULT '1' COMMENT '是否通过审核(0:未通过 1:通过)',
  `status` int(1) DEFAULT '0' COMMENT '状态(0:未注册,1:注册)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nickname` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of m_teacher
-- ----------------------------
INSERT INTO `m_teacher` VALUES ('10', '1234', '202cb962ac59075b964b07152d234b70', '/upload/2019032509484618图2.jpeg', '老刘', '我是刘教师', '12345678999', '2019-02-25 04:01:11', null, null, '1', '0');
INSERT INTO `m_teacher` VALUES ('13', 'shiju4', '670b14728ad9902aecba32e22fa4f6bd', null, 'shiju4', null, '18875016794', '2019-04-07 22:51:12', null, null, '1', '0');
INSERT INTO `m_teacher` VALUES ('14', 'shiju5', '670b14728ad9902aecba32e22fa4f6bd', null, 'shiju5', null, '18875016794', '2019-04-07 22:54:08', null, null, '1', '0');
INSERT INTO `m_teacher` VALUES ('15', 'shiju8', '670b14728ad9902aecba32e22fa4f6bd', null, 'shiju8', null, '18875016794', '2019-04-07 22:56:46', null, null, '1', '0');

-- ----------------------------
-- Table structure for m_test
-- ----------------------------
DROP TABLE IF EXISTS `m_test`;
CREATE TABLE `m_test` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `question` varchar(255) DEFAULT NULL COMMENT '问题',
  `question_no` int(11) DEFAULT NULL COMMENT '题目号',
  `course_id` bigint(30) DEFAULT NULL COMMENT '课程id',
  `course_type` bigint(1) DEFAULT '1' COMMENT '试题类型(1:必修课 2:试听课)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_test
-- ----------------------------
INSERT INTO `m_test` VALUES ('1', '你是猪嘛？', '1', '8', '1');
INSERT INTO `m_test` VALUES ('8', '我是猪嘛？', '1', '1', '2');

-- ----------------------------
-- Table structure for m_works
-- ----------------------------
DROP TABLE IF EXISTS `m_works`;
CREATE TABLE `m_works` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `works_name` varchar(50) DEFAULT NULL COMMENT '作品名称',
  `works_type_id` bigint(30) DEFAULT NULL COMMENT '作品类型',
  `works_describe` varchar(100) DEFAULT NULL COMMENT '作品描述',
  `works_url` varchar(50) DEFAULT NULL COMMENT '作品存放地址',
  `wan_to_goods` int(11) DEFAULT '0' COMMENT '是否愿意上架(0:不愿意 1:愿意)',
  `is_goods` int(11) DEFAULT '0' COMMENT '是否上架(0:未上架 1:已上架 )',
  `goods_id` bigint(30) DEFAULT NULL COMMENT '商品id',
  `goods_type` int(1) DEFAULT NULL COMMENT '商品类型(1:必修课程 2:试听课程 3:私人作品(学生) 4:私人作品(教师))',
  `goods_price` double(20,2) DEFAULT '0.00' COMMENT '上架价格',
  `upload_time` datetime DEFAULT NULL COMMENT '上传日期',
  `hits` int(30) DEFAULT '0' COMMENT '点击量',
  `user_type` int(11) DEFAULT '0' COMMENT '上传人类型(0:学员1:教师)',
  `user_id` bigint(30) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_works
-- ----------------------------
INSERT INTO `m_works` VALUES ('2', '测试前端上传视频', '1', '测试编辑', '/upload/2019040403070975oceans.webm', '1', '1', '21', '3', '125.00', '2019-03-07 22:27:14', '18', '0', '1', '小磊');

-- ----------------------------
-- Table structure for ssrs_menu
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_menu`;
CREATE TABLE `ssrs_menu` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `sequence` int(4) NOT NULL COMMENT '排序序号',
  `icon` varchar(50) NOT NULL COMMENT '菜单图标',
  `title` varchar(50) NOT NULL COMMENT '路径地址',
  `url` varchar(100) NOT NULL,
  `parent_id` int(5) DEFAULT NULL COMMENT '上级id',
  `permission_id` bigint(20) NOT NULL COMMENT '权限id',
  `system_menu` int(2) NOT NULL COMMENT '是否允许编辑 |  1:允许，2：不允许',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `ssrs_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ssrs_menu` (`id`),
  CONSTRAINT `ssrs_menu_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `ssrs_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_menu
-- ----------------------------
INSERT INTO `ssrs_menu` VALUES ('2', '1', '&#xe614;', '系统设置', '/', null, '1', '1');
INSERT INTO `ssrs_menu` VALUES ('4', '2', '&#xe62e;', '菜单设置', '/menu/index', '2', '3', '1');
INSERT INTO `ssrs_menu` VALUES ('7', '3', '&#xe62e;', '角色设置', '/role/index', '2', '11', '1');
INSERT INTO `ssrs_menu` VALUES ('9', '4', '&#xe62e;', '权限设置', '/permission/index', '2', '17', '1');
INSERT INTO `ssrs_menu` VALUES ('14', '5', '&#xe62e;', '管理员设置', '/user/list', '2', '26', '1');
INSERT INTO `ssrs_menu` VALUES ('17', '80', '&#xe613;', '人员信息管理', '/', null, '33', '1');
INSERT INTO `ssrs_menu` VALUES ('18', '2', '&#xe612;', '学员信息管理', '/student/list', '17', '34', '1');
INSERT INTO `ssrs_menu` VALUES ('20', '1', '&#xe612;', '教师信息管理', '/teacher/list', '17', '36', '1');
INSERT INTO `ssrs_menu` VALUES ('21', '70', '&#xe62a;', '订单管理', '/', null, '37', '1');
INSERT INTO `ssrs_menu` VALUES ('22', '5', '&#xe63c;', '订单', '/px/list', '21', '38', '1');
INSERT INTO `ssrs_menu` VALUES ('23', '2', '&#xe63c;', '优惠折扣信息管理', '/discount/list', '21', '39', '1');
INSERT INTO `ssrs_menu` VALUES ('24', '60', '&#xe857;', '学员作品管理', '/', null, '40', '1');
INSERT INTO `ssrs_menu` VALUES ('25', '30', '&#xe630;', '课程管理', '/', null, '41', '1');
INSERT INTO `ssrs_menu` VALUES ('26', '5', '&#xe705;', '必修课管理', '/rcourse/list', '25', '42', '1');
INSERT INTO `ssrs_menu` VALUES ('27', '3', '&#xe705;', '试听课管理', '/ccourse/list', '25', '43', '1');
INSERT INTO `ssrs_menu` VALUES ('28', '99', '&#xe60a;', '前台页面导航栏配置', '/discount/list', '2', '44', '1');
INSERT INTO `ssrs_menu` VALUES ('30', '4', '&#xe63c;', '订单明细', '/pxmx/detaillist', '21', '56', '1');
INSERT INTO `ssrs_menu` VALUES ('32', '4', '&#xe634;', '学员作品管理', '/works/list', '24', '67', '1');
INSERT INTO `ssrs_menu` VALUES ('33', '10', '&#xe620;', '软件下载管理', '/', null, '71', '1');
INSERT INTO `ssrs_menu` VALUES ('34', '3', '&#xe6fc;', '软件下载管理', '/download/list', '33', '72', '1');
INSERT INTO `ssrs_menu` VALUES ('37', '1', '&#xe68e;', '评论管理课程', '/comment/list', '25', '89', '1');
INSERT INTO `ssrs_menu` VALUES ('38', '1', '&#xe68e;', '评论学员管理', '/comment/list', '24', '90', '1');
INSERT INTO `ssrs_menu` VALUES ('42', '1', '&#xe68e;', '试题必修管理', '/test/list', '25', '105', '1');

-- ----------------------------
-- Table structure for ssrs_permission
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_permission`;
CREATE TABLE `ssrs_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_permission
-- ----------------------------
INSERT INTO `ssrs_permission` VALUES ('1', '/', '系统设置', null);
INSERT INTO `ssrs_permission` VALUES ('2', '/webSet/index', '网站设置', '1');
INSERT INTO `ssrs_permission` VALUES ('3', '/menu/index', '菜单设置', '1');
INSERT INTO `ssrs_permission` VALUES ('8', '/menu/update', '菜单编辑', '3');
INSERT INTO `ssrs_permission` VALUES ('9', '/menu/del', '菜单删除', '3');
INSERT INTO `ssrs_permission` VALUES ('11', '/role/index', '角色管理', '1');
INSERT INTO `ssrs_permission` VALUES ('12', '/role/add', '角色添加', '11');
INSERT INTO `ssrs_permission` VALUES ('13', '/role/update', '角色编辑', '11');
INSERT INTO `ssrs_permission` VALUES ('14', '/role/del', '角色删除', '11');
INSERT INTO `ssrs_permission` VALUES ('15', '/menu/add', '菜单添加', '3');
INSERT INTO `ssrs_permission` VALUES ('17', '/permission/index', '权限设置', '1');
INSERT INTO `ssrs_permission` VALUES ('20', '/', '测试顶级菜单', null);
INSERT INTO `ssrs_permission` VALUES ('22', '/permission/add', '权限添加', '17');
INSERT INTO `ssrs_permission` VALUES ('23', '/permission/del', '权限删除', '17');
INSERT INTO `ssrs_permission` VALUES ('24', '/permission/update', '权限修改', '17');
INSERT INTO `ssrs_permission` VALUES ('26', '/user/list', '管理员设置', '1');
INSERT INTO `ssrs_permission` VALUES ('27', '/user/add', '管理员添加', '26');
INSERT INTO `ssrs_permission` VALUES ('28', '/user/update', '管理员编辑', '26');
INSERT INTO `ssrs_permission` VALUES ('29', '/user/del', '管理员删除', '26');
INSERT INTO `ssrs_permission` VALUES ('30', '/member/index', '在线用户设置', '1');
INSERT INTO `ssrs_permission` VALUES ('31', '/member/changeSessionStatus', '用户状态改变', '30');
INSERT INTO `ssrs_permission` VALUES ('32', '/systemLog/index', '系统日志', '1');
INSERT INTO `ssrs_permission` VALUES ('33', '/', '人员信息管理', null);
INSERT INTO `ssrs_permission` VALUES ('34', '/student/list', '学生信息管理', '33');
INSERT INTO `ssrs_permission` VALUES ('36', '/teacher/list', '教师信息管理', '33');
INSERT INTO `ssrs_permission` VALUES ('37', '/', '订单管理', null);
INSERT INTO `ssrs_permission` VALUES ('38', '/px/list', '订单', '37');
INSERT INTO `ssrs_permission` VALUES ('39', '/discount/list', '优惠折扣信息管理', '37');
INSERT INTO `ssrs_permission` VALUES ('40', '/works/list', '学员作品管理', null);
INSERT INTO `ssrs_permission` VALUES ('41', '/', '课程管理', null);
INSERT INTO `ssrs_permission` VALUES ('42', '/rcourse/list', '必修课管理', '41');
INSERT INTO `ssrs_permission` VALUES ('43', '/ccourse/list', '试听课管理', '41');
INSERT INTO `ssrs_permission` VALUES ('44', '/reception/list', '前台页面配置', '1');
INSERT INTO `ssrs_permission` VALUES ('45', '/student/add', '学员信息新增', '34');
INSERT INTO `ssrs_permission` VALUES ('46', '/student/update', '学员信息编辑', '34');
INSERT INTO `ssrs_permission` VALUES ('47', '/student/del', '学员信息删除', '34');
INSERT INTO `ssrs_permission` VALUES ('49', '/teacher/add', '教师信息新增', '36');
INSERT INTO `ssrs_permission` VALUES ('50', '/teacher/update', '教师信息编辑', '36');
INSERT INTO `ssrs_permission` VALUES ('51', '/teacher/del', '教师信息删除', '36');
INSERT INTO `ssrs_permission` VALUES ('52', '/px/add', '订单新增', '38');
INSERT INTO `ssrs_permission` VALUES ('53', '/px/update', '订单修改', '38');
INSERT INTO `ssrs_permission` VALUES ('54', '/px/del', '订单删除', '38');
INSERT INTO `ssrs_permission` VALUES ('55', '/px/detail', '订单查看详情', '38');
INSERT INTO `ssrs_permission` VALUES ('56', '/pxmx/detaillist', '订单明细', '38');
INSERT INTO `ssrs_permission` VALUES ('59', '/pxmx/add', '订单明细新增', '38');
INSERT INTO `ssrs_permission` VALUES ('60', '/pxmx/update', '订单明细修改', '38');
INSERT INTO `ssrs_permission` VALUES ('61', '/pxmx/del', '订单明细删除', '38');
INSERT INTO `ssrs_permission` VALUES ('63', '/discount/add', '折扣新增', '39');
INSERT INTO `ssrs_permission` VALUES ('64', '/discount/update', '折扣修改', '39');
INSERT INTO `ssrs_permission` VALUES ('65', '/discount/del', '折扣删除', '39');
INSERT INTO `ssrs_permission` VALUES ('66', '/download/list', '下载管理', null);
INSERT INTO `ssrs_permission` VALUES ('67', 'works/list', '学员作品管理', '40');
INSERT INTO `ssrs_permission` VALUES ('68', '/works/add', '作品新增', '40');
INSERT INTO `ssrs_permission` VALUES ('69', '/works/update', '作品修改', '40');
INSERT INTO `ssrs_permission` VALUES ('70', '/works/del', '作品删除', '40');
INSERT INTO `ssrs_permission` VALUES ('71', '/', '软件下载', null);
INSERT INTO `ssrs_permission` VALUES ('72', '/download/list', '软件下载', '71');
INSERT INTO `ssrs_permission` VALUES ('74', '/download/add', '软件下载新增', '71');
INSERT INTO `ssrs_permission` VALUES ('75', '/download/update', '软件下载修改', '71');
INSERT INTO `ssrs_permission` VALUES ('76', '/download/del', '软件下载删除', '71');
INSERT INTO `ssrs_permission` VALUES ('77', '/rcourse/add', '必修课新增', '42');
INSERT INTO `ssrs_permission` VALUES ('78', '/rcourse/update', '必修课修改', '42');
INSERT INTO `ssrs_permission` VALUES ('79', '/rcourse/del', '必修课删除', '42');
INSERT INTO `ssrs_permission` VALUES ('80', '/ccourse/add', '试听课新增', '43');
INSERT INTO `ssrs_permission` VALUES ('81', '/ccourse/update', '试听课修改', '43');
INSERT INTO `ssrs_permission` VALUES ('82', '/ccourse/del', '试听课删除', '43');
INSERT INTO `ssrs_permission` VALUES ('84', '/comment/list', '评论管理学员', '42');
INSERT INTO `ssrs_permission` VALUES ('86', '/comment/list', '试听课评论管理', '43');
INSERT INTO `ssrs_permission` VALUES ('89', '/comment/list', '评论管理课程', '41');
INSERT INTO `ssrs_permission` VALUES ('90', '/comment/list', '评论学员管理', '40');
INSERT INTO `ssrs_permission` VALUES ('91', '/comment/list', '学员作品管理', '40');
INSERT INTO `ssrs_permission` VALUES ('92', '/comment/add', '学员评论添加', '84');
INSERT INTO `ssrs_permission` VALUES ('93', '/comment/add', '学员评论新增', '90');
INSERT INTO `ssrs_permission` VALUES ('94', '/comment/update', '学员评论修改', '90');
INSERT INTO `ssrs_permission` VALUES ('95', '/comment/del', '学员评论删除', '84');
INSERT INTO `ssrs_permission` VALUES ('99', '/test/update', '试题修改', '103');
INSERT INTO `ssrs_permission` VALUES ('100', '/test/del', '试题删除', '103');
INSERT INTO `ssrs_permission` VALUES ('101', '/test/add', '试题添加', '103');
INSERT INTO `ssrs_permission` VALUES ('105', '/test/list', '试题必修管理', '41');
INSERT INTO `ssrs_permission` VALUES ('106', '/test/list', '试题必修管理', '105');
INSERT INTO `ssrs_permission` VALUES ('107', '/test/goAdd', '试题去添加', '105');

-- ----------------------------
-- Table structure for ssrs_role
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_role`;
CREATE TABLE `ssrs_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_role
-- ----------------------------
INSERT INTO `ssrs_role` VALUES ('1', '超级管理员', 'admin');
INSERT INTO `ssrs_role` VALUES ('2', '测试角色', 'test');

-- ----------------------------
-- Table structure for ssrs_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_role_permission`;
CREATE TABLE `ssrs_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_role_permission
-- ----------------------------
INSERT INTO `ssrs_role_permission` VALUES ('4', '1');
INSERT INTO `ssrs_role_permission` VALUES ('4', '2');
INSERT INTO `ssrs_role_permission` VALUES ('2', '1');
INSERT INTO `ssrs_role_permission` VALUES ('2', '2');
INSERT INTO `ssrs_role_permission` VALUES ('2', '3');
INSERT INTO `ssrs_role_permission` VALUES ('2', '8');
INSERT INTO `ssrs_role_permission` VALUES ('2', '9');
INSERT INTO `ssrs_role_permission` VALUES ('2', '15');
INSERT INTO `ssrs_role_permission` VALUES ('1', '1');
INSERT INTO `ssrs_role_permission` VALUES ('1', '11');
INSERT INTO `ssrs_role_permission` VALUES ('1', '12');
INSERT INTO `ssrs_role_permission` VALUES ('1', '13');
INSERT INTO `ssrs_role_permission` VALUES ('1', '14');
INSERT INTO `ssrs_role_permission` VALUES ('1', '26');
INSERT INTO `ssrs_role_permission` VALUES ('1', '27');
INSERT INTO `ssrs_role_permission` VALUES ('1', '28');
INSERT INTO `ssrs_role_permission` VALUES ('1', '29');
INSERT INTO `ssrs_role_permission` VALUES ('1', '30');
INSERT INTO `ssrs_role_permission` VALUES ('1', '31');
INSERT INTO `ssrs_role_permission` VALUES ('1', '32');
INSERT INTO `ssrs_role_permission` VALUES ('1', '44');
INSERT INTO `ssrs_role_permission` VALUES ('1', '20');
INSERT INTO `ssrs_role_permission` VALUES ('1', '33');
INSERT INTO `ssrs_role_permission` VALUES ('1', '34');
INSERT INTO `ssrs_role_permission` VALUES ('1', '45');
INSERT INTO `ssrs_role_permission` VALUES ('1', '46');
INSERT INTO `ssrs_role_permission` VALUES ('1', '47');
INSERT INTO `ssrs_role_permission` VALUES ('1', '36');
INSERT INTO `ssrs_role_permission` VALUES ('1', '49');
INSERT INTO `ssrs_role_permission` VALUES ('1', '50');
INSERT INTO `ssrs_role_permission` VALUES ('1', '51');
INSERT INTO `ssrs_role_permission` VALUES ('1', '37');
INSERT INTO `ssrs_role_permission` VALUES ('1', '38');
INSERT INTO `ssrs_role_permission` VALUES ('1', '52');
INSERT INTO `ssrs_role_permission` VALUES ('1', '53');
INSERT INTO `ssrs_role_permission` VALUES ('1', '54');
INSERT INTO `ssrs_role_permission` VALUES ('1', '55');
INSERT INTO `ssrs_role_permission` VALUES ('1', '56');
INSERT INTO `ssrs_role_permission` VALUES ('1', '59');
INSERT INTO `ssrs_role_permission` VALUES ('1', '60');
INSERT INTO `ssrs_role_permission` VALUES ('1', '61');
INSERT INTO `ssrs_role_permission` VALUES ('1', '39');
INSERT INTO `ssrs_role_permission` VALUES ('1', '63');
INSERT INTO `ssrs_role_permission` VALUES ('1', '64');
INSERT INTO `ssrs_role_permission` VALUES ('1', '65');
INSERT INTO `ssrs_role_permission` VALUES ('1', '40');
INSERT INTO `ssrs_role_permission` VALUES ('1', '67');
INSERT INTO `ssrs_role_permission` VALUES ('1', '68');
INSERT INTO `ssrs_role_permission` VALUES ('1', '69');
INSERT INTO `ssrs_role_permission` VALUES ('1', '70');
INSERT INTO `ssrs_role_permission` VALUES ('1', '90');
INSERT INTO `ssrs_role_permission` VALUES ('1', '93');
INSERT INTO `ssrs_role_permission` VALUES ('1', '94');
INSERT INTO `ssrs_role_permission` VALUES ('1', '91');
INSERT INTO `ssrs_role_permission` VALUES ('1', '41');
INSERT INTO `ssrs_role_permission` VALUES ('1', '42');
INSERT INTO `ssrs_role_permission` VALUES ('1', '77');
INSERT INTO `ssrs_role_permission` VALUES ('1', '78');
INSERT INTO `ssrs_role_permission` VALUES ('1', '79');
INSERT INTO `ssrs_role_permission` VALUES ('1', '84');
INSERT INTO `ssrs_role_permission` VALUES ('1', '92');
INSERT INTO `ssrs_role_permission` VALUES ('1', '95');
INSERT INTO `ssrs_role_permission` VALUES ('1', '43');
INSERT INTO `ssrs_role_permission` VALUES ('1', '80');
INSERT INTO `ssrs_role_permission` VALUES ('1', '81');
INSERT INTO `ssrs_role_permission` VALUES ('1', '82');
INSERT INTO `ssrs_role_permission` VALUES ('1', '86');
INSERT INTO `ssrs_role_permission` VALUES ('1', '89');
INSERT INTO `ssrs_role_permission` VALUES ('1', '105');
INSERT INTO `ssrs_role_permission` VALUES ('1', '106');
INSERT INTO `ssrs_role_permission` VALUES ('1', '107');
INSERT INTO `ssrs_role_permission` VALUES ('1', '66');
INSERT INTO `ssrs_role_permission` VALUES ('1', '71');
INSERT INTO `ssrs_role_permission` VALUES ('1', '72');
INSERT INTO `ssrs_role_permission` VALUES ('1', '74');
INSERT INTO `ssrs_role_permission` VALUES ('1', '75');
INSERT INTO `ssrs_role_permission` VALUES ('1', '76');

-- ----------------------------
-- Table structure for ssrs_system_log
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_system_log`;
CREATE TABLE `ssrs_system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(30) DEFAULT NULL,
  `uri` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `param_dara` longtext,
  `session_id` varchar(100) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `return_time` datetime DEFAULT NULL,
  `return_data` longtext,
  `http_status_code` varchar(10) DEFAULT NULL,
  `time_consuming` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_system_log
-- ----------------------------

-- ----------------------------
-- Table structure for ssrs_user
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_user`;
CREATE TABLE `ssrs_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_user
-- ----------------------------
INSERT INTO `ssrs_user` VALUES ('15', 'xiaoming', 'xiaoming@qq.com', '8c862951e5a59bac0c900fc4de0f6c5c', '2018-08-03 19:09:08', '2019-05-14 23:54:46', '1');

-- ----------------------------
-- Table structure for ssrs_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_user_role`;
CREATE TABLE `ssrs_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_user_role
-- ----------------------------
INSERT INTO `ssrs_user_role` VALUES ('16', '1');
INSERT INTO `ssrs_user_role` VALUES ('15', '1');

-- ----------------------------
-- Table structure for student_teacher
-- ----------------------------
DROP TABLE IF EXISTS `student_teacher`;
CREATE TABLE `student_teacher` (
  `student_id` int(30) NOT NULL COMMENT '学员id',
  `teacher_id` int(30) NOT NULL COMMENT '教师id',
  PRIMARY KEY (`student_id`,`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_teacher
-- ----------------------------

-- ----------------------------
-- Procedure structure for init_quella_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_quella_data`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `init_quella_data`()
BEGIN
	SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ssrs_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_menu`;
CREATE TABLE `ssrs_menu` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `sequence` int(4) NOT NULL COMMENT '排序序号',
  `icon` varchar(50) NOT NULL COMMENT '菜单图标',
  `title` varchar(50) NOT NULL COMMENT '路径地址',
  `url` varchar(100) NOT NULL,
  `parent_id` int(5) DEFAULT NULL COMMENT '上级id',
  `permission_id` bigint(20) NOT NULL COMMENT '权限id',
  `system_menu` int(2) NOT NULL COMMENT '是否允许编辑 |  1:允许，2：不允许',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `ssrs_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ssrs_menu` (`id`),
  CONSTRAINT `ssrs_menu_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `ssrs_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_menu
-- ----------------------------
INSERT INTO `ssrs_menu` VALUES ('2', '1', '&#xe614;', '系统设置', '/', null, '1', '1');
INSERT INTO `ssrs_menu` VALUES ('3', '1', '&#xe62e;', '网站设置', '/webSet/index', '2', '2', '2');
INSERT INTO `ssrs_menu` VALUES ('4', '2', '&#xe62e;', '菜单设置', '/menu/index', '2', '3', '1');
INSERT INTO `ssrs_menu` VALUES ('7', '3', '&#xe62e;', '角色设置', '/role/index', '2', '11', '1');
INSERT INTO `ssrs_menu` VALUES ('9', '4', '&#xe62e;', '权限设置', '/permission/index', '2', '17', '1');
INSERT INTO `ssrs_menu` VALUES ('12', '2', '&#xe614;', '测试顶级菜单', '/', null, '20', '1');
INSERT INTO `ssrs_menu` VALUES ('13', '1', '&#xe62e;', '测试子菜单', '/test/test1', '12', '21', '1');
INSERT INTO `ssrs_menu` VALUES ('14', '5', '&#xe62e;', '管理员设置', '/user/list', '2', '26', '1');
INSERT INTO `ssrs_menu` VALUES ('15', '6', '&#xe62e;', '在线用户', '/member/index', '2', '30', '1');
INSERT INTO `ssrs_menu` VALUES ('16', '7', '&#xe62e;', '系统日志', '/systemLog/index', '2', '32', '1');

-- ----------------------------
-- Table structure for `ssrs_permission`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_permission`;
CREATE TABLE `ssrs_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_permission
-- ----------------------------
INSERT INTO `ssrs_permission` VALUES ('1', '/', '系统设置', null);
INSERT INTO `ssrs_permission` VALUES ('2', '/webSet/index', '网站设置', '1');
INSERT INTO `ssrs_permission` VALUES ('3', '/menu/index', '菜单设置', '1');
INSERT INTO `ssrs_permission` VALUES ('8', '/menu/update', '菜单编辑', '3');
INSERT INTO `ssrs_permission` VALUES ('9', '/menu/del', '菜单删除', '3');
INSERT INTO `ssrs_permission` VALUES ('11', '/role/index', '角色管理', '1');
INSERT INTO `ssrs_permission` VALUES ('12', '/role/add', '角色添加', '11');
INSERT INTO `ssrs_permission` VALUES ('13', '/role/update', '角色编辑', '11');
INSERT INTO `ssrs_permission` VALUES ('14', '/role/del', '角色删除', '11');
INSERT INTO `ssrs_permission` VALUES ('15', '/menu/add', '菜单添加', '3');
INSERT INTO `ssrs_permission` VALUES ('17', '/permission/index', '权限设置', '1');
INSERT INTO `ssrs_permission` VALUES ('20', '/', '测试顶级菜单', null);
INSERT INTO `ssrs_permission` VALUES ('21', '/test/test1', '测试子菜单', '20');
INSERT INTO `ssrs_permission` VALUES ('22', '/permission/add', '权限添加', '17');
INSERT INTO `ssrs_permission` VALUES ('23', '/permission/del', '权限删除', '17');
INSERT INTO `ssrs_permission` VALUES ('24', '/permission/update', '权限修改', '17');
INSERT INTO `ssrs_permission` VALUES ('26', '/user/list', '管理员设置', '1');
INSERT INTO `ssrs_permission` VALUES ('27', '/user/add', '管理员添加', '26');
INSERT INTO `ssrs_permission` VALUES ('28', '/user/update', '管理员编辑', '26');
INSERT INTO `ssrs_permission` VALUES ('29', '/user/del', '管理员删除', '26');
INSERT INTO `ssrs_permission` VALUES ('30', '/member/index', '在线用户设置', '1');
INSERT INTO `ssrs_permission` VALUES ('31', '/member/changeSessionStatus', '用户状态改变', '30');
INSERT INTO `ssrs_permission` VALUES ('32', '/systemLog/index', '系统日志', '1');

-- ----------------------------
-- Table structure for `ssrs_role`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_role`;
CREATE TABLE `ssrs_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_role
-- ----------------------------
INSERT INTO `ssrs_role` VALUES ('1', '超级管理员', 'admin');
INSERT INTO `ssrs_role` VALUES ('2', '测试角色', 'test');

-- ----------------------------
-- Table structure for `ssrs_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_role_permission`;
CREATE TABLE `ssrs_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_role_permission
-- ----------------------------
INSERT INTO `ssrs_role_permission` VALUES ('1', '1');
INSERT INTO `ssrs_role_permission` VALUES ('1', '2');
INSERT INTO `ssrs_role_permission` VALUES ('1', '3');
INSERT INTO `ssrs_role_permission` VALUES ('1', '8');
INSERT INTO `ssrs_role_permission` VALUES ('1', '9');
INSERT INTO `ssrs_role_permission` VALUES ('1', '11');
INSERT INTO `ssrs_role_permission` VALUES ('1', '12');
INSERT INTO `ssrs_role_permission` VALUES ('1', '13');
INSERT INTO `ssrs_role_permission` VALUES ('1', '14');
INSERT INTO `ssrs_role_permission` VALUES ('1', '15');
INSERT INTO `ssrs_role_permission` VALUES ('4', '1');
INSERT INTO `ssrs_role_permission` VALUES ('4', '2');
INSERT INTO `ssrs_role_permission` VALUES ('1', '17');
INSERT INTO `ssrs_role_permission` VALUES ('1', '20');
INSERT INTO `ssrs_role_permission` VALUES ('1', '21');
INSERT INTO `ssrs_role_permission` VALUES ('1', '22');
INSERT INTO `ssrs_role_permission` VALUES ('1', '23');
INSERT INTO `ssrs_role_permission` VALUES ('1', '24');
INSERT INTO `ssrs_role_permission` VALUES ('1', '25');
INSERT INTO `ssrs_role_permission` VALUES ('1', '26');
INSERT INTO `ssrs_role_permission` VALUES ('1', '27');
INSERT INTO `ssrs_role_permission` VALUES ('2', '1');
INSERT INTO `ssrs_role_permission` VALUES ('2', '2');
INSERT INTO `ssrs_role_permission` VALUES ('2', '3');
INSERT INTO `ssrs_role_permission` VALUES ('2', '8');
INSERT INTO `ssrs_role_permission` VALUES ('2', '9');
INSERT INTO `ssrs_role_permission` VALUES ('2', '15');
INSERT INTO `ssrs_role_permission` VALUES ('1', '28');
INSERT INTO `ssrs_role_permission` VALUES ('1', '29');
INSERT INTO `ssrs_role_permission` VALUES ('1', '30');
INSERT INTO `ssrs_role_permission` VALUES ('1', '31');
INSERT INTO `ssrs_role_permission` VALUES ('1', '32');

-- ----------------------------
-- Table structure for `ssrs_system_log`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_system_log`;
CREATE TABLE `ssrs_system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(30) DEFAULT NULL,
  `uri` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `param_dara` longtext,
  `session_id` varchar(100) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `return_time` datetime DEFAULT NULL,
  `return_data` longtext,
  `http_status_code` varchar(10) DEFAULT NULL,
  `time_consuming` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=935 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ssrs_system_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ssrs_user`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_user`;
CREATE TABLE `ssrs_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_user
-- ----------------------------
INSERT INTO `ssrs_user` VALUES ('15', 'ssrs', 'ssrs@qq.com', '1317e6a8b03222040618c475337c67c6', '2018-08-03 19:09:08', '2018-08-17 11:15:25', '1');

-- ----------------------------
-- Table structure for `ssrs_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `ssrs_user_role`;
CREATE TABLE `ssrs_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssrs_user_role
-- ----------------------------
INSERT INTO `ssrs_user_role` VALUES ('15', '1');
INSERT INTO `ssrs_user_role` VALUES ('16', '1');
END
;;
DELIMITER ;
