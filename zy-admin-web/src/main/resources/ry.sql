/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50721
Source Host           : 127.0.0.1:3306
Source Database       : ry

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2020-01-29 23:55:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_merchant
-- ----------------------------
DROP TABLE IF EXISTS `b_merchant`;
CREATE TABLE `b_merchant` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `merchant_name` varchar(100) NOT NULL COMMENT '商户名称',
  `merchant_no` varchar(50) NOT NULL COMMENT '商户号',
  `merchant_secret` varchar(100) NOT NULL COMMENT '商户秘钥',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='商户信息管理';

-- ----------------------------
-- Records of b_merchant
-- ----------------------------
INSERT INTO `b_merchant` VALUES ('38', '测试商户', 'venn', 'abc1234', '2019-11-20 14:04:21', 'venn');
INSERT INTO `b_merchant` VALUES ('50', '测试商户', 'venn1', 'abc1234', '2019-11-20 14:04:21', 'venn');

-- ----------------------------
-- Table structure for b_merchant_bank
-- ----------------------------
DROP TABLE IF EXISTS `b_merchant_bank`;
CREATE TABLE `b_merchant_bank` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `merchant_no` varchar(50) DEFAULT NULL COMMENT '商户号',
  `account_name` varchar(20) DEFAULT NULL COMMENT '收款人',
  `account_no` varchar(50) DEFAULT NULL COMMENT '收款账户',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '收款银行',
  `account_address` varchar(100) DEFAULT NULL COMMENT '收款支行地址',
  `flag` char(1) DEFAULT NULL COMMENT '删除标志',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商户银行卡';

-- ----------------------------
-- Records of b_merchant_bank
-- ----------------------------
INSERT INTO `b_merchant_bank` VALUES ('1', '1', '11', '111', '11', '11', null, '2019-12-18 14:59:30', null, null, null);

-- ----------------------------
-- Table structure for b_merchant_order
-- ----------------------------
DROP TABLE IF EXISTS `b_merchant_order`;
CREATE TABLE `b_merchant_order` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sys_order_no` varchar(50) NOT NULL COMMENT '系统订单号',
  `merchant_no` varchar(50) NOT NULL COMMENT '商户号',
  `mer_order_no` varchar(50) NOT NULL COMMENT '商户订单号',
  `pay_type` varchar(10) NOT NULL COMMENT '支付方式',
  `order_amount` int(38) NOT NULL COMMENT '订单金额',
  `order_fee_amount` double(24,2) NOT NULL COMMENT '订单手续费金额',
  `order_status` char(1) NOT NULL COMMENT '订单状态',
  `pay_time` datetime DEFAULT NULL COMMENT '订单支付时间',
  `return_url` varchar(100) NOT NULL COMMENT '同步地址',
  `notify_url` varchar(100) NOT NULL COMMENT '回调地址',
  `notify_status` char(1) NOT NULL COMMENT '回调状态',
  `notify_num` int(38) NOT NULL COMMENT '回调次数',
  `failure_reason` varchar(500) DEFAULT NULL COMMENT '回调失败原因',
  `product_name` varchar(100) NOT NULL COMMENT '产品名称',
  `remark` varchar(100) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商户订单记录';

-- ----------------------------
-- Records of b_merchant_order
-- ----------------------------
INSERT INTO `b_merchant_order` VALUES ('1', '202001222331068400001', 'venn', '20200109', '1001', '100', '3.80', '1', null, 'http://baidu.com', 'http://baidu.com', '1', '0', null, 'venn', '备注', '2020-01-22 23:31:07', '2020-01-22 23:31:07');
INSERT INTO `b_merchant_order` VALUES ('2', '202001222344338090001', 'venn', '20200109', '1001', '100', '3.80', '1', null, 'http://baidu.com', 'http://baidu.com', '1', '0', null, 'venn', '备注', '2020-01-22 23:44:34', '2020-01-22 23:44:34');

-- ----------------------------
-- Table structure for b_merchant_user
-- ----------------------------
DROP TABLE IF EXISTS `b_merchant_user`;
CREATE TABLE `b_merchant_user` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `merchant_no` varchar(50) NOT NULL COMMENT '商户号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `phone_number` varchar(50) NOT NULL COMMENT '手机号码',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `level` int(38) NOT NULL COMMENT '级别',
  `login_times` int(38) NOT NULL COMMENT '登录次数',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '上次登录地址',
  `this_login_time` datetime DEFAULT NULL COMMENT '本次登录时间',
  `this_login_ip` varchar(50) DEFAULT NULL COMMENT '本次登录地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='商户用户信息';

-- ----------------------------
-- Records of b_merchant_user
-- ----------------------------
INSERT INTO `b_merchant_user` VALUES ('83', '111111111111111', '11111111111111', '1111', '1111111', '1235454511@qq.cm', '1', '1', '2019-10-30 00:00:00', '1', '2019-10-31 00:00:00', '11', '2019-11-20 14:17:27', '11');

-- ----------------------------
-- Table structure for b_merchant_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `b_merchant_withdrawal`;
CREATE TABLE `b_merchant_withdrawal` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `merchant_no` varchar(50) NOT NULL COMMENT '商户号',
  `merchant_bank_id` int(38) NOT NULL COMMENT '商户收款银行编号',
  `amount` double(24,2) NOT NULL COMMENT '提现金额',
  `fee` double(24,2) NOT NULL COMMENT '手续费',
  `status` char(1) NOT NULL COMMENT '状态',
  `payment_url` varchar(100) DEFAULT NULL COMMENT '支付凭证',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提款记录';

-- ----------------------------
-- Records of b_merchant_withdrawal
-- ----------------------------

-- ----------------------------
-- Table structure for b_receipt_bank
-- ----------------------------
DROP TABLE IF EXISTS `b_receipt_bank`;
CREATE TABLE `b_receipt_bank` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `bank_code` varchar(50) NOT NULL COMMENT '银行编码',
  `bank_name` varchar(50) NOT NULL COMMENT '银行名称',
  `account_name` varchar(20) NOT NULL COMMENT '开户名',
  `account_no` varchar(50) NOT NULL COMMENT '开户卡号',
  `account_address` varchar(100) NOT NULL COMMENT '开户地址',
  `amount` double(24,2) NOT NULL COMMENT '存款金额',
  `flag` char(1) NOT NULL COMMENT '是否开启使用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `update_user` varchar(50) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='银行收据';

-- ----------------------------
-- Records of b_receipt_bank
-- ----------------------------
INSERT INTO `b_receipt_bank` VALUES ('19', '1001', 'xx银行', 'xxx', '555555555555555', 'xxxxxxxxxxxxxx', '0.00', '0', '2018-12-23 15:19:18', 'xx', '2019-12-05 22:28:28', 'xx');

-- ----------------------------
-- Table structure for b_user
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `agent` varchar(50) NOT NULL COMMENT '推荐人账号',
  `phone_number` varchar(50) NOT NULL COMMENT '手机号码',
  `commission_rate` double(24,4) NOT NULL COMMENT '佣金比例',
  `level` int(38) NOT NULL COMMENT '级别',
  `frequency` int(38) NOT NULL COMMENT '申请次数',
  `login_times` int(38) NOT NULL COMMENT '登录次数',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '上次登录地址',
  `this_login_time` datetime DEFAULT NULL COMMENT '本次登录时间',
  `this_login_ip` varchar(50) DEFAULT NULL COMMENT '本次登录地址',
  `status` char(1) NOT NULL COMMENT '状态',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  KEY `UNIQUE_INDEX1` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户管理表';

-- ----------------------------
-- Records of b_user
-- ----------------------------
INSERT INTO `b_user` VALUES ('1', 'venn', 'venn1234', 'venn', '13311102905', '1.0000', '1', '1', '1', '2019-12-05 22:41:52', '1', '2019-12-05 22:41:59', '127.0.0.1', '1', '2019-12-05 22:42:03');

-- ----------------------------
-- Table structure for b_user_deposit
-- ----------------------------
DROP TABLE IF EXISTS `b_user_deposit`;
CREATE TABLE `b_user_deposit` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `agent` varchar(50) DEFAULT NULL COMMENT '所属代理',
  `earnest_money` double(24,4) DEFAULT NULL COMMENT '保证金金额',
  `earnest_money_url` varchar(100) DEFAULT NULL COMMENT '保证金图片地址',
  `receipt_type` varchar(10) DEFAULT NULL COMMENT '收款二维码类型',
  `receipt_amount` double(24,4) DEFAULT NULL COMMENT '累计收款金额',
  `receipt_commission_amount` double(24,4) DEFAULT NULL COMMENT '累计佣金金额',
  `withdrawal_flag` char(1) DEFAULT NULL COMMENT '佣金提取标志',
  `withdrawal_time` datetime DEFAULT NULL COMMENT '佣金提取时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '佣金确认时间',
  `review_status` char(1) DEFAULT NULL COMMENT '审核状态 1未审核  2审核失败 3审核成功',
  `reason` varchar(100) DEFAULT NULL COMMENT '驳回原因',
  `review_time` datetime DEFAULT NULL COMMENT '审核时间',
  `flag` char(1) DEFAULT NULL COMMENT '是否开启使用 Y开启 N关闭',
  `status` char(1) DEFAULT NULL COMMENT '订单状态 1未确认 2已确认',
  `spread_amount` double(24,4) DEFAULT NULL COMMENT '补发金额',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `receipt_bank_id` int(38) DEFAULT NULL COMMENT '收款银行编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `UNIQUE_INDEX1` (`username`,`earnest_money`,`status`,`flag`,`review_status`,`receipt_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='缴纳保证金记录';

-- ----------------------------
-- Records of b_user_deposit
-- ----------------------------
INSERT INTO `b_user_deposit` VALUES ('11', null, 'admin', '10000.0000', '/profile/upload/2020/01/17/7951f2356771fc8fead21443ad778d72.jpg', '1001', '0.0000', '0.0000', null, null, null, '3', null, null, 'Y', '2', null, null, null, '2020-01-17 10:19:47');

-- ----------------------------
-- Table structure for b_user_extend
-- ----------------------------
DROP TABLE IF EXISTS `b_user_extend`;
CREATE TABLE `b_user_extend` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `wechat_flag` char(1) NOT NULL COMMENT '微信收款码审核标志',
  `wechat_reason` varchar(100) DEFAULT NULL COMMENT '微信收款码驳回原因',
  `alipay_flag` char(1) NOT NULL COMMENT '支付宝收款码审核标志',
  `alipay_reason` varchar(100) DEFAULT NULL COMMENT '支付宝收款码驳回原因',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_user_extend
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_order
-- ----------------------------
DROP TABLE IF EXISTS `b_user_order`;
CREATE TABLE `b_user_order` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `deposit_id` int(38) DEFAULT NULL COMMENT '存款编号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `merchant_no` varchar(50) NOT NULL COMMENT '商户号',
  `sys_order_no` varchar(50) NOT NULL COMMENT '系统订单号',
  `order_type` varchar(10) NOT NULL COMMENT '订单类型',
  `order_amount` int(38) NOT NULL COMMENT '订单金额',
  `pay_amount` double(24,2) DEFAULT NULL COMMENT '实际支付金额',
  `order_status` char(1) NOT NULL COMMENT '订单状态',
  `order_remark` varchar(50) DEFAULT NULL COMMENT '订单备注',
  `confirm_time` datetime DEFAULT NULL COMMENT '订单确认时间',
  `confirm_user` varchar(50) DEFAULT NULL COMMENT '订单确认人',
  `create_time` datetime NOT NULL COMMENT '订单创建时间',
  PRIMARY KEY (`id`),
  KEY `UNIQUE_INDEX1` (`username`) USING BTREE,
  KEY `UNIQUE_INDEX2` (`order_status`) USING BTREE,
  KEY `UNIQUE_INDEX3` (`create_time`) USING BTREE,
  KEY `UNIQUE_INDEX4` (`order_type`) USING BTREE,
  KEY `UNIQUE_INDEX5` (`username`,`order_type`,`order_status`) USING BTREE,
  KEY `UNIQUE_INDEX6` (`username`,`order_type`,`order_status`,`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_user_order
-- ----------------------------
INSERT INTO `b_user_order` VALUES ('1', null, 'venn', 'venn', '202001222344338090001', '1001', '100', '100.00', '1', 'gdrh', null, null, '2020-01-22 23:44:34');

-- ----------------------------
-- Table structure for b_user_qr_code
-- ----------------------------
DROP TABLE IF EXISTS `b_user_qr_code`;
CREATE TABLE `b_user_qr_code` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `receipt_type` varchar(10) NOT NULL COMMENT '收款二维码类型',
  `receipt_amount` int(38) NOT NULL COMMENT '收款金额',
  `receipt_qrcode_amount` double(24,2) NOT NULL COMMENT '收款二维码金额',
  `receipt_qrcode_url` varchar(100) NOT NULL COMMENT '收款二维码地址',
  `match_times` int(38) NOT NULL COMMENT '匹配次数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `UNIQUE_INDEX1` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_user_qr_code
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_qr_codeone
-- ----------------------------
DROP TABLE IF EXISTS `b_user_qr_codeone`;
CREATE TABLE `b_user_qr_codeone` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `receipt_type` varchar(10) NOT NULL COMMENT '收款二维码类型',
  `receipt_qrcode_url` varchar(100) NOT NULL COMMENT '收款二维码地址',
  `receipt_qrcode_code` varchar(128) NOT NULL COMMENT '二维码code',
  `agent` varchar(255) NOT NULL COMMENT '当前登录的用户名',
  `status` varchar(8) NOT NULL COMMENT '状态 Y开启 N关闭',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='收款码管理';

-- ----------------------------
-- Records of b_user_qr_codeone
-- ----------------------------
INSERT INTO `b_user_qr_codeone` VALUES ('7', 'venn', '1001', '/profile/upload/2020/01/08/c53d68d31959bf147c28efb91f38a702.jpg', 'wxp://f2f0xiuAKFbR5uNUnl5c-1ecG7FrXrEV13lN', 'admin', 'Y', '2020-01-08 11:38:31');

-- ----------------------------
-- Table structure for b_user_receipt
-- ----------------------------
DROP TABLE IF EXISTS `b_user_receipt`;
CREATE TABLE `b_user_receipt` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `agent` varchar(50) DEFAULT NULL,
  `wechat_receipt_times` int(38) NOT NULL COMMENT '微信收款次数',
  `alipay_receipt_times` int(38) NOT NULL COMMENT '支付宝收款次数',
  `status` varchar(8) NOT NULL COMMENT '二维码状态：Y开启 N关闭',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `UNIQUE_INDEX1` (`wechat_receipt_times`) USING BTREE,
  KEY `UNIQUE_INDEX2` (`alipay_receipt_times`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='收款次数';

-- ----------------------------
-- Records of b_user_receipt
-- ----------------------------
INSERT INTO `b_user_receipt` VALUES ('1', 'venn', null, '0', '0', '', '2020-01-05 23:51:35');
INSERT INTO `b_user_receipt` VALUES ('2', 'xeon', null, '1', '1', '', '2020-01-05 23:53:25');
INSERT INTO `b_user_receipt` VALUES ('3', 'jam', null, '2', '2', '', '2020-01-05 23:53:38');
INSERT INTO `b_user_receipt` VALUES ('4', 'zf', null, '0', '0', '', '2020-01-08 11:32:05');

-- ----------------------------
-- Table structure for b_user_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `b_user_withdrawal`;
CREATE TABLE `b_user_withdrawal` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `deposit_id` int(38) NOT NULL COMMENT '存款编号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `commission_amount` double(24,2) NOT NULL COMMENT '佣金金额',
  `receipt_qrcode_url` varchar(100) NOT NULL COMMENT '收款二维码地址',
  `order_status` char(1) NOT NULL COMMENT '订单状态',
  `create_time` datetime NOT NULL COMMENT '订单创建时间',
  `payment_url` varchar(100) DEFAULT NULL COMMENT '打款凭证地址',
  `payment_time` datetime DEFAULT NULL COMMENT '打款时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提款记录';

-- ----------------------------
-- Records of b_user_withdrawal
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('6', 'b_merchant', '商户信息', 'BMerchant', 'crud', 'com.ruoyi.zy', 'zy', 'merchant', '商户信息', 'zy', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-11-20 13:53:22', '', '2019-11-22 06:50:18', '');
INSERT INTO `gen_table` VALUES ('7', 'b_merchant_user', '商户用户信息', 'MerchantUser', 'crud', 'com.ruoyi.zy', 'zy', 'merchantUser', '商户用户信息', 'zy', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-11-20 13:53:22', '', '2019-11-20 15:10:40', '');
INSERT INTO `gen_table` VALUES ('8', 'b_merchant_order', '商户订单记录', 'MerchantOrder', 'crud', 'com.ruoyi.zy', 'zy', 'merchantOrder', '商户订单记录', 'zy', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-11-20 14:27:33', '', '2019-11-20 14:28:09', '');
INSERT INTO `gen_table` VALUES ('9', 'b_merchant_withdrawal', '提款记录', 'MerchantWithdrawal', 'crud', 'com.ruoyi.zy', 'zy', 'merchantWithdrawal', '提款记录', 'zy', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-11-20 14:44:43', '', '2019-11-20 15:10:54', '');
INSERT INTO `gen_table` VALUES ('10', 'b_user', '用户管理表', 'BUser', 'crud', 'com.ruoyi.zy', 'zy', 'user', '用户管理', 'ruoyi', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-11-22 06:25:03', '', '2019-11-22 06:26:14', '');
INSERT INTO `gen_table` VALUES ('11', 'sys_user', '用户信息表', 'SysUser', 'crud', 'com.ruoyi.system', 'system', 'user', '用户信息', 'ruoyi', null, 'admin', '2019-11-22 06:48:02', '', null, null);
INSERT INTO `gen_table` VALUES ('12', 'b_user_deposit', '缴纳保证金记录', 'UserDeposit', 'crud', 'com.ruoyi.zy', 'zy', 'userDeposit', '缴纳保证金记录', 'zf', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-11-22 07:33:31', '', '2019-11-28 17:47:09', '');
INSERT INTO `gen_table` VALUES ('13', 'b_user_extend', '收款码管理', 'BUserExtend', 'crud', 'com.ruoyi.zy', 'zy', 'extend', '收款码管理', 'ruoyi', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-11-22 07:33:39', '', '2019-11-22 07:38:16', '');
INSERT INTO `gen_table` VALUES ('14', 'b_user_order', '交易记录', 'BUserOrder', 'crud', 'com.ruoyi.zy', 'zy', 'order', '交易记录', 'ruoyi', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-11-22 07:33:43', '', '2019-11-22 07:38:38', '');
INSERT INTO `gen_table` VALUES ('15', 'b_user_withdrawal', '用户提款记录', 'UserWithdrawal', 'crud', 'com.ruoyi.zy', 'zy', 'userWithdrawal', '用户提款记录', 'zf', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-11-22 07:33:48', '', '2019-11-28 17:48:43', '');
INSERT INTO `gen_table` VALUES ('16', 'b_receipt_bank', '银行收据', 'ReceiptBank', 'crud', 'com.ruoyi.zy', 'zy', 'receiptBank', '银行收据', 'zf', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-11-28 21:49:02', '', '2019-12-01 03:16:32', '');
INSERT INTO `gen_table` VALUES ('17', 'b_user_qr_code', '用户收款码表', 'BUserQrCode', 'crud', 'com.ruoyi.zy', 'zy', 'qrcode', '用户收款码表', 'ruoyi', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-12-13 07:37:20', '', '2019-12-13 07:51:22', '');
INSERT INTO `gen_table` VALUES ('19', 's_system_parameter', '系统参数表', 'SSystemParameter', 'crud', 'com.ruoyi.zy', 'zy', 'systemparameter', '系统参数表', 'ruoyi', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-12-13 07:37:25', '', '2019-12-13 07:50:45', '');
INSERT INTO `gen_table` VALUES ('20', 'b_user_receipt', '收款次数', 'BUserReceipt', 'crud', 'com.ruoyi.zy', 'zy', 'receipt', '收款次数', 'ruoyi', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-12-18 07:56:44', '', '2019-12-18 07:57:14', '');
INSERT INTO `gen_table` VALUES ('21', 'b_merchant_bank', '商户银行卡', 'MerchantBank', 'crud', 'com.ruoyi.zy', 'zf', 'merchantBank', '商户银行卡', 'zy', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-12-18 22:20:23', '', '2019-12-18 22:22:56', '');
INSERT INTO `gen_table` VALUES ('22', 'b_user_qr_codeone', '收款码管理', 'UserQrCodeone', 'crud', 'com.ruoyi.zy', 'zy', 'usercodeone', '收款码管理', 'zy', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2020-01-08 17:38:11', '', '2020-01-08 17:40:01', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('54', '6', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-11-20 13:53:22', null, '2019-11-22 06:50:19');
INSERT INTO `gen_table_column` VALUES ('55', '6', 'merchant_name', '商户名称', 'varchar(100)', 'String', 'merchantName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2019-11-20 13:53:22', null, '2019-11-22 06:50:19');
INSERT INTO `gen_table_column` VALUES ('56', '6', 'merchant_no', '商户号', 'varchar(50)', 'String', 'merchantNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2019-11-20 13:53:22', null, '2019-11-22 06:50:20');
INSERT INTO `gen_table_column` VALUES ('57', '6', 'merchant_secret', '商户秘钥', 'varchar(100)', 'String', 'merchantSecret', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-11-20 13:53:22', null, '2019-11-22 06:50:20');
INSERT INTO `gen_table_column` VALUES ('58', '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '5', 'admin', '2019-11-20 13:53:22', null, '2019-11-22 06:50:20');
INSERT INTO `gen_table_column` VALUES ('59', '6', 'create_user', '创建人', 'varchar(50)', 'String', 'createUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-11-20 13:53:22', null, '2019-11-22 06:50:21');
INSERT INTO `gen_table_column` VALUES ('60', '7', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('61', '7', 'merchant_no', '商户号', 'varchar(50)', 'String', 'merchantNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('62', '7', 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('63', '7', 'password', '密码', 'varchar(50)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('64', '7', 'phone_number', '手机号码', 'varchar(50)', 'String', 'phoneNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('65', '7', 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('66', '7', 'level', '级别', 'int(38)', 'Long', 'level', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('67', '7', 'login_times', '登录次数', 'int(38)', 'Long', 'loginTimes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('68', '7', 'last_login_time', '上次登录时间', 'datetime', 'Date', 'lastLoginTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '9', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('69', '7', 'last_login_ip', '上次登录地址', 'varchar(50)', 'String', 'lastLoginIp', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('70', '7', 'this_login_time', '本次登录时间', 'datetime', 'Date', 'thisLoginTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '11', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('71', '7', 'this_login_ip', '本次登录地址', 'varchar(50)', 'String', 'thisLoginIp', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('72', '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '13', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('73', '7', 'create_user', '创建人', 'varchar(50)', 'String', 'createUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2019-11-20 13:53:22', null, '2019-11-20 15:10:40');
INSERT INTO `gen_table_column` VALUES ('74', '8', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('75', '8', 'sys_order_no', '系统订单号', 'varchar(50)', 'String', 'sysOrderNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('76', '8', 'merchant_no', '商户号', 'varchar(50)', 'String', 'merchantNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('77', '8', 'mer_order_no', '商户订单号', 'varchar(50)', 'String', 'merOrderNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('78', '8', 'pay_type', '支付方式', 'varchar(10)', 'String', 'payType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '5', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('79', '8', 'order_amount', '订单金额', 'int(38)', 'Long', 'orderAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('80', '8', 'order_fee_amount', '订单手续费金额', 'double(24,2)', 'Double', 'orderFeeAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('81', '8', 'order_status', '订单状态', 'char(1)', 'String', 'orderStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '8', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('82', '8', 'pay_time', '订单支付时间', 'datetime', 'Date', 'payTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '9', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('83', '8', 'return_url', '同步地址', 'varchar(100)', 'String', 'returnUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('84', '8', 'notify_url', '回调地址', 'varchar(100)', 'String', 'notifyUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('85', '8', 'notify_status', '回调状态', 'char(1)', 'String', 'notifyStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '12', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('86', '8', 'notify_num', '回调次数', 'int(38)', 'Long', 'notifyNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '13', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('87', '8', 'failure_reason', '回调失败原因', 'varchar(500)', 'String', 'failureReason', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '14', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('88', '8', 'product_name', '产品名称', 'varchar(100)', 'String', 'productName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '15', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('89', '8', 'remark', '备注', 'varchar(100)', 'String', 'remark', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', '16', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('90', '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '17', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('91', '8', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', null, null, 'EQ', 'datetime', '', '18', 'admin', '2019-11-20 14:27:33', null, '2019-11-20 14:28:09');
INSERT INTO `gen_table_column` VALUES ('92', '9', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-11-20 14:44:43', null, '2019-11-20 15:10:54');
INSERT INTO `gen_table_column` VALUES ('93', '9', 'merchant_no', '商户号', 'varchar(50)', 'String', 'merchantNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2019-11-20 14:44:43', null, '2019-11-20 15:10:54');
INSERT INTO `gen_table_column` VALUES ('94', '9', 'merchant_bank_id', '商户收款银行编号', 'int(38)', 'Long', 'merchantBankId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2019-11-20 14:44:43', null, '2019-11-20 15:10:54');
INSERT INTO `gen_table_column` VALUES ('95', '9', 'amount', '提现金额', 'double(24,2)', 'Double', 'amount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-11-20 14:44:43', null, '2019-11-20 15:10:54');
INSERT INTO `gen_table_column` VALUES ('96', '9', 'fee', '手续费', 'double(24,2)', 'Double', 'fee', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2019-11-20 14:44:43', null, '2019-11-20 15:10:54');
INSERT INTO `gen_table_column` VALUES ('97', '9', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '6', 'admin', '2019-11-20 14:44:43', null, '2019-11-20 15:10:54');
INSERT INTO `gen_table_column` VALUES ('98', '9', 'payment_url', '支付凭证', 'varchar(100)', 'String', 'paymentUrl', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-11-20 14:44:43', null, '2019-11-20 15:10:54');
INSERT INTO `gen_table_column` VALUES ('99', '9', 'payment_time', '支付时间', 'datetime', 'Date', 'paymentTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '8', 'admin', '2019-11-20 14:44:43', null, '2019-11-20 15:10:54');
INSERT INTO `gen_table_column` VALUES ('100', '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '9', 'admin', '2019-11-20 14:44:43', null, '2019-11-20 15:10:54');
INSERT INTO `gen_table_column` VALUES ('101', '9', 'create_user', '创建人', 'varchar(50)', 'String', 'createUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2019-11-20 14:44:43', null, '2019-11-20 15:10:54');
INSERT INTO `gen_table_column` VALUES ('102', '10', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-11-22 06:25:03', null, '2019-11-22 06:26:15');
INSERT INTO `gen_table_column` VALUES ('103', '10', 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2019-11-22 06:25:04', null, '2019-11-22 06:26:15');
INSERT INTO `gen_table_column` VALUES ('104', '10', 'password', '密码', 'varchar(50)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2019-11-22 06:25:04', null, '2019-11-22 06:26:15');
INSERT INTO `gen_table_column` VALUES ('105', '10', 'agent', '推荐人账号', 'varchar(50)', 'String', 'agent', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-11-22 06:25:04', null, '2019-11-22 06:26:16');
INSERT INTO `gen_table_column` VALUES ('106', '10', 'phone_number', '手机号码', 'varchar(50)', 'String', 'phoneNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2019-11-22 06:25:05', null, '2019-11-22 06:26:16');
INSERT INTO `gen_table_column` VALUES ('107', '10', 'commission_rate', '佣金比例', 'double(24,4)', 'Double', 'commissionRate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-11-22 06:25:05', null, '2019-11-22 06:26:17');
INSERT INTO `gen_table_column` VALUES ('108', '10', 'level', '级别', 'int(38)', 'Long', 'level', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-11-22 06:25:05', null, '2019-11-22 06:26:17');
INSERT INTO `gen_table_column` VALUES ('109', '10', 'frequency', '申请次数', 'int(38)', 'Long', 'frequency', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2019-11-22 06:25:06', null, '2019-11-22 06:26:18');
INSERT INTO `gen_table_column` VALUES ('110', '10', 'login_times', '登录次数', 'int(38)', 'Long', 'loginTimes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2019-11-22 06:25:06', null, '2019-11-22 06:26:18');
INSERT INTO `gen_table_column` VALUES ('111', '10', 'last_login_time', '上次登录时间', 'datetime', 'Date', 'lastLoginTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '10', 'admin', '2019-11-22 06:25:07', null, '2019-11-22 06:26:18');
INSERT INTO `gen_table_column` VALUES ('112', '10', 'last_login_ip', '上次登录地址', 'varchar(50)', 'String', 'lastLoginIp', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2019-11-22 06:25:07', null, '2019-11-22 06:26:19');
INSERT INTO `gen_table_column` VALUES ('113', '10', 'this_login_time', '本次登录时间', 'datetime', 'Date', 'thisLoginTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2019-11-22 06:25:07', null, '2019-11-22 06:26:19');
INSERT INTO `gen_table_column` VALUES ('114', '10', 'this_login_ip', '本次登录地址', 'varchar(50)', 'String', 'thisLoginIp', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '13', 'admin', '2019-11-22 06:25:08', null, '2019-11-22 06:26:19');
INSERT INTO `gen_table_column` VALUES ('115', '10', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '14', 'admin', '2019-11-22 06:25:08', null, '2019-11-22 06:26:20');
INSERT INTO `gen_table_column` VALUES ('116', '10', 'register_time', '注册时间', 'datetime', 'Date', 'registerTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '15', 'admin', '2019-11-22 06:25:08', null, '2019-11-22 06:26:20');
INSERT INTO `gen_table_column` VALUES ('117', '11', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-11-22 06:48:03', '', null);
INSERT INTO `gen_table_column` VALUES ('118', '11', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2019-11-22 06:48:03', '', null);
INSERT INTO `gen_table_column` VALUES ('119', '11', 'login_name', '登录账号', 'varchar(30)', 'String', 'loginName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2019-11-22 06:48:04', '', null);
INSERT INTO `gen_table_column` VALUES ('120', '11', 'user_name', '用户昵称', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2019-11-22 06:48:05', '', null);
INSERT INTO `gen_table_column` VALUES ('121', '11', 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '5', 'admin', '2019-11-22 06:48:05', '', null);
INSERT INTO `gen_table_column` VALUES ('122', '11', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-11-22 06:48:06', '', null);
INSERT INTO `gen_table_column` VALUES ('123', '11', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-11-22 06:48:07', '', null);
INSERT INTO `gen_table_column` VALUES ('124', '11', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '8', 'admin', '2019-11-22 06:48:07', '', null);
INSERT INTO `gen_table_column` VALUES ('125', '11', 'avatar', '头像路径', 'varchar(100)', 'String', 'avatar', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2019-11-22 06:48:08', '', null);
INSERT INTO `gen_table_column` VALUES ('126', '11', 'password', '密码', 'varchar(50)', 'String', 'password', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2019-11-22 06:48:09', '', null);
INSERT INTO `gen_table_column` VALUES ('127', '11', 'salt', '盐加密', 'varchar(20)', 'String', 'salt', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2019-11-22 06:48:09', '', null);
INSERT INTO `gen_table_column` VALUES ('128', '11', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', '', '12', 'admin', '2019-11-22 06:48:09', '', null);
INSERT INTO `gen_table_column` VALUES ('129', '11', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '13', 'admin', '2019-11-22 06:48:10', '', null);
INSERT INTO `gen_table_column` VALUES ('130', '11', 'login_ip', '最后登陆IP', 'varchar(50)', 'String', 'loginIp', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2019-11-22 06:48:10', '', null);
INSERT INTO `gen_table_column` VALUES ('131', '11', 'login_date', '最后登陆时间', 'datetime', 'Date', 'loginDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '15', 'admin', '2019-11-22 06:48:10', '', null);
INSERT INTO `gen_table_column` VALUES ('132', '11', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '16', 'admin', '2019-11-22 06:48:11', '', null);
INSERT INTO `gen_table_column` VALUES ('133', '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '17', 'admin', '2019-11-22 06:48:11', '', null);
INSERT INTO `gen_table_column` VALUES ('134', '11', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '18', 'admin', '2019-11-22 06:48:12', '', null);
INSERT INTO `gen_table_column` VALUES ('135', '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '19', 'admin', '2019-11-22 06:48:12', '', null);
INSERT INTO `gen_table_column` VALUES ('136', '11', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '20', 'admin', '2019-11-22 06:48:13', '', null);
INSERT INTO `gen_table_column` VALUES ('137', '12', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-11-22 07:33:32', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('138', '12', 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2019-11-22 07:33:32', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('139', '12', 'earnest_money', '保证金金额', 'int(38)', 'Long', 'earnestMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2019-11-22 07:33:33', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('140', '12', 'earnest_money_url', '保证金图片地址', 'varchar(100)', 'String', 'earnestMoneyUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-11-22 07:33:33', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('141', '12', 'receipt_type', '收款二维码类型', 'varchar(10)', 'String', 'receiptType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '5', 'admin', '2019-11-22 07:33:33', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('142', '12', 'receipt_amount', '累计收款金额', 'int(38)', 'Long', 'receiptAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-11-22 07:33:34', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('143', '12', 'receipt_commission_amount', '累计佣金金额', 'double(24,4)', 'Double', 'receiptCommissionAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-11-22 07:33:34', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('144', '12', 'withdrawal_flag', '佣金提取标志', 'char(1)', 'String', 'withdrawalFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2019-11-22 07:33:34', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('145', '12', 'withdrawal_time', '佣金提取时间', 'datetime', 'Date', 'withdrawalTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '9', 'admin', '2019-11-22 07:33:35', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('146', '12', 'confirm_time', '佣金确认时间', 'datetime', 'Date', 'confirmTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '10', 'admin', '2019-11-22 07:33:35', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('147', '12', 'review_status', '审核状态', 'char(1)', 'String', 'reviewStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '11', 'admin', '2019-11-22 07:33:36', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('148', '12', 'reason', '驳回原因', 'varchar(100)', 'String', 'reason', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2019-11-22 07:33:36', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('149', '12', 'review_time', '审核时间', 'datetime', 'Date', 'reviewTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '13', 'admin', '2019-11-22 07:33:36', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('150', '12', 'flag', '是否开启使用', 'char(1)', 'String', 'flag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2019-11-22 07:33:37', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('151', '12', 'status', '订单状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '15', 'admin', '2019-11-22 07:33:37', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('152', '12', 'spread_amount', '补发金额', 'int(38)', 'Long', 'spreadAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '16', 'admin', '2019-11-22 07:33:37', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('153', '12', 'remark', '备注', 'varchar(100)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '17', 'admin', '2019-11-22 07:33:38', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('154', '12', 'receipt_bank_id', '收款银行编号', 'int(38)', 'Long', 'receiptBankId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '18', 'admin', '2019-11-22 07:33:38', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('155', '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '19', 'admin', '2019-11-22 07:33:38', null, '2019-11-28 17:47:09');
INSERT INTO `gen_table_column` VALUES ('156', '13', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-11-22 07:33:39', null, '2019-11-22 07:38:16');
INSERT INTO `gen_table_column` VALUES ('157', '13', 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2019-11-22 07:33:40', null, '2019-11-22 07:38:16');
INSERT INTO `gen_table_column` VALUES ('158', '13', 'wechat_flag', '微信收款码审核标志', 'char(1)', 'String', 'wechatFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2019-11-22 07:33:40', null, '2019-11-22 07:38:17');
INSERT INTO `gen_table_column` VALUES ('159', '13', 'wechat_reason', '微信收款码驳回原因', 'varchar(100)', 'String', 'wechatReason', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-11-22 07:33:40', null, '2019-11-22 07:38:17');
INSERT INTO `gen_table_column` VALUES ('160', '13', 'alipay_flag', '支付宝收款码审核标志', 'char(1)', 'String', 'alipayFlag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2019-11-22 07:33:41', null, '2019-11-22 07:38:17');
INSERT INTO `gen_table_column` VALUES ('161', '13', 'alipay_reason', '支付宝收款码驳回原因', 'varchar(100)', 'String', 'alipayReason', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-11-22 07:33:41', null, '2019-11-22 07:38:18');
INSERT INTO `gen_table_column` VALUES ('162', '13', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '7', 'admin', '2019-11-22 07:33:41', null, '2019-11-22 07:38:18');
INSERT INTO `gen_table_column` VALUES ('163', '13', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', null, null, 'EQ', 'datetime', '', '8', 'admin', '2019-11-22 07:33:42', null, '2019-11-22 07:38:19');
INSERT INTO `gen_table_column` VALUES ('164', '14', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-11-22 07:33:43', null, '2019-11-22 07:38:38');
INSERT INTO `gen_table_column` VALUES ('165', '14', 'deposit_id', '存款编号', 'int(38)', 'Long', 'depositId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2019-11-22 07:33:44', null, '2019-11-22 07:38:39');
INSERT INTO `gen_table_column` VALUES ('166', '14', 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2019-11-22 07:33:44', null, '2019-11-22 07:38:39');
INSERT INTO `gen_table_column` VALUES ('167', '14', 'merchant_no', '商户号', 'varchar(50)', 'String', 'merchantNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-11-22 07:33:45', null, '2019-11-22 07:38:39');
INSERT INTO `gen_table_column` VALUES ('168', '14', 'sys_order_no', '系统订单号', 'varchar(50)', 'String', 'sysOrderNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2019-11-22 07:33:45', null, '2019-11-22 07:38:40');
INSERT INTO `gen_table_column` VALUES ('169', '14', 'order_type', '订单类型', 'varchar(10)', 'String', 'orderType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '6', 'admin', '2019-11-22 07:33:45', null, '2019-11-22 07:38:40');
INSERT INTO `gen_table_column` VALUES ('170', '14', 'order_amount', '订单金额', 'int(38)', 'Long', 'orderAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-11-22 07:33:46', null, '2019-11-22 07:38:40');
INSERT INTO `gen_table_column` VALUES ('171', '14', 'pay_amount', '实际支付金额', 'double(24,2)', 'Double', 'payAmount', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2019-11-22 07:33:46', null, '2019-11-22 07:38:41');
INSERT INTO `gen_table_column` VALUES ('172', '14', 'order_status', '订单状态', 'char(1)', 'String', 'orderStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '9', 'admin', '2019-11-22 07:33:46', null, '2019-11-22 07:38:41');
INSERT INTO `gen_table_column` VALUES ('173', '14', 'order_remark', '订单备注', 'varchar(50)', 'String', 'orderRemark', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2019-11-22 07:33:47', null, '2019-11-22 07:38:41');
INSERT INTO `gen_table_column` VALUES ('174', '14', 'confirm_time', '订单确认时间', 'datetime', 'Date', 'confirmTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '11', 'admin', '2019-11-22 07:33:47', null, '2019-11-22 07:38:42');
INSERT INTO `gen_table_column` VALUES ('175', '14', 'confirm_user', '订单确认人', 'varchar(50)', 'String', 'confirmUser', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2019-11-22 07:33:47', null, '2019-11-22 07:38:42');
INSERT INTO `gen_table_column` VALUES ('176', '14', 'create_time', '订单创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '13', 'admin', '2019-11-22 07:33:48', null, '2019-11-22 07:38:42');
INSERT INTO `gen_table_column` VALUES ('177', '15', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-11-22 07:33:49', null, '2019-11-28 17:48:43');
INSERT INTO `gen_table_column` VALUES ('178', '15', 'deposit_id', '存款编号', 'int(38)', 'Long', 'depositId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2019-11-22 07:33:49', null, '2019-11-28 17:48:43');
INSERT INTO `gen_table_column` VALUES ('179', '15', 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2019-11-22 07:33:49', null, '2019-11-28 17:48:43');
INSERT INTO `gen_table_column` VALUES ('180', '15', 'commission_amount', '佣金金额', 'double(24,2)', 'Double', 'commissionAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-11-22 07:33:50', null, '2019-11-28 17:48:43');
INSERT INTO `gen_table_column` VALUES ('181', '15', 'receipt_qrcode_url', '收款二维码地址', 'varchar(100)', 'String', 'receiptQrcodeUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2019-11-22 07:33:50', null, '2019-11-28 17:48:43');
INSERT INTO `gen_table_column` VALUES ('182', '15', 'order_status', '订单状态', 'char(1)', 'String', 'orderStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '6', 'admin', '2019-11-22 07:33:50', null, '2019-11-28 17:48:43');
INSERT INTO `gen_table_column` VALUES ('183', '15', 'create_time', '订单创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '7', 'admin', '2019-11-22 07:33:51', null, '2019-11-28 17:48:43');
INSERT INTO `gen_table_column` VALUES ('184', '15', 'payment_url', '打款凭证地址', 'varchar(100)', 'String', 'paymentUrl', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2019-11-22 07:33:51', null, '2019-11-28 17:48:43');
INSERT INTO `gen_table_column` VALUES ('185', '15', 'payment_time', '打款时间', 'datetime', 'Date', 'paymentTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '9', 'admin', '2019-11-22 07:33:51', null, '2019-11-28 17:48:43');
INSERT INTO `gen_table_column` VALUES ('186', '15', 'confirm_time', '确认时间', 'datetime', 'Date', 'confirmTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '10', 'admin', '2019-11-22 07:33:52', null, '2019-11-28 17:48:44');
INSERT INTO `gen_table_column` VALUES ('187', '16', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:33');
INSERT INTO `gen_table_column` VALUES ('188', '16', 'bank_code', '银行编码', 'varchar(50)', 'String', 'bankCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:34');
INSERT INTO `gen_table_column` VALUES ('189', '16', 'bank_name', '银行名称', 'varchar(50)', 'String', 'bankName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:35');
INSERT INTO `gen_table_column` VALUES ('190', '16', 'account_name', '开户名', 'varchar(20)', 'String', 'accountName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:36');
INSERT INTO `gen_table_column` VALUES ('191', '16', 'account_no', '开户卡号', 'varchar(50)', 'String', 'accountNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:37');
INSERT INTO `gen_table_column` VALUES ('192', '16', 'account_address', '开户地址', 'varchar(100)', 'String', 'accountAddress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:38');
INSERT INTO `gen_table_column` VALUES ('193', '16', 'amount', '存款金额', 'double(24,2)', 'Double', 'amount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:39');
INSERT INTO `gen_table_column` VALUES ('194', '16', 'flag', '是否开启使用', 'char(1)', 'String', 'flag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '8', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:41');
INSERT INTO `gen_table_column` VALUES ('195', '16', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '9', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:43');
INSERT INTO `gen_table_column` VALUES ('196', '16', 'create_user', '创建人', 'varchar(50)', 'String', 'createUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:48');
INSERT INTO `gen_table_column` VALUES ('197', '16', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', null, null, 'EQ', 'datetime', '', '11', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:51');
INSERT INTO `gen_table_column` VALUES ('198', '16', 'update_user', '修改人', 'varchar(50)', 'String', 'updateUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2019-11-28 21:49:02', null, '2019-12-01 03:16:52');
INSERT INTO `gen_table_column` VALUES ('199', '17', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-12-13 07:37:20', null, '2019-12-13 07:51:22');
INSERT INTO `gen_table_column` VALUES ('200', '17', 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2019-12-13 07:37:21', null, '2019-12-13 07:51:22');
INSERT INTO `gen_table_column` VALUES ('201', '17', 'receipt_type', '收款二维码类型', 'varchar(10)', 'String', 'receiptType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '3', 'admin', '2019-12-13 07:37:21', null, '2019-12-13 07:51:23');
INSERT INTO `gen_table_column` VALUES ('202', '17', 'receipt_amount', '收款金额', 'int(38)', 'Long', 'receiptAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-12-13 07:37:21', null, '2019-12-13 07:51:23');
INSERT INTO `gen_table_column` VALUES ('203', '17', 'receipt_qrcode_amount', '收款二维码金额', 'double(24,2)', 'Double', 'receiptQrcodeAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2019-12-13 07:37:21', null, '2019-12-13 07:51:23');
INSERT INTO `gen_table_column` VALUES ('204', '17', 'receipt_qrcode_url', '收款二维码地址', 'varchar(100)', 'String', 'receiptQrcodeUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-12-13 07:37:22', null, '2019-12-13 07:51:24');
INSERT INTO `gen_table_column` VALUES ('205', '17', 'match_times', '匹配次数', 'int(38)', 'Long', 'matchTimes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-12-13 07:37:22', null, '2019-12-13 07:51:24');
INSERT INTO `gen_table_column` VALUES ('206', '17', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '8', 'admin', '2019-12-13 07:37:22', null, '2019-12-13 07:51:24');
INSERT INTO `gen_table_column` VALUES ('213', '19', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-12-13 07:37:25', null, '2019-12-13 07:50:46');
INSERT INTO `gen_table_column` VALUES ('214', '19', 'category', '类别', 'varchar(50)', 'String', 'category', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2019-12-13 07:37:26', null, '2019-12-13 07:50:46');
INSERT INTO `gen_table_column` VALUES ('215', '19', 'code', '项编码', 'varchar(50)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2019-12-13 07:37:26', null, '2019-12-13 07:50:46');
INSERT INTO `gen_table_column` VALUES ('216', '19', 'value', '项内容', 'varchar(1000)', 'String', 'value', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', '4', 'admin', '2019-12-13 07:37:26', null, '2019-12-13 07:50:47');
INSERT INTO `gen_table_column` VALUES ('217', '19', 'description', '描述', 'varchar(1000)', 'String', 'description', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '5', 'admin', '2019-12-13 07:37:26', null, '2019-12-13 07:50:47');
INSERT INTO `gen_table_column` VALUES ('218', '19', 'flag', '是否开启使用', 'char(1)', 'String', 'flag', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-12-13 07:37:27', null, '2019-12-13 07:50:47');
INSERT INTO `gen_table_column` VALUES ('219', '19', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '7', 'admin', '2019-12-13 07:37:27', null, '2019-12-13 07:50:47');
INSERT INTO `gen_table_column` VALUES ('220', '19', 'create_user', '创建人', 'varchar(50)', 'String', 'createUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2019-12-13 07:37:27', null, '2019-12-13 07:50:48');
INSERT INTO `gen_table_column` VALUES ('221', '19', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', null, null, 'EQ', 'datetime', '', '9', 'admin', '2019-12-13 07:37:28', null, '2019-12-13 07:50:48');
INSERT INTO `gen_table_column` VALUES ('222', '19', 'update_user', '修改人', 'varchar(50)', 'String', 'updateUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2019-12-13 07:37:28', null, '2019-12-13 07:50:48');
INSERT INTO `gen_table_column` VALUES ('223', '20', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-12-18 07:56:45', null, '2019-12-18 07:57:14');
INSERT INTO `gen_table_column` VALUES ('224', '20', 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2019-12-18 07:56:45', null, '2019-12-18 07:57:15');
INSERT INTO `gen_table_column` VALUES ('225', '20', 'wechat_receipt_times', '微信收款次数', 'int(38)', 'Long', 'wechatReceiptTimes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2019-12-18 07:56:46', null, '2019-12-18 07:57:16');
INSERT INTO `gen_table_column` VALUES ('226', '20', 'alipay_receipt_times', '支付宝收款次数', 'int(38)', 'Long', 'alipayReceiptTimes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-12-18 07:56:46', null, '2019-12-18 07:57:17');
INSERT INTO `gen_table_column` VALUES ('227', '20', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', null, null, 'EQ', 'datetime', '', '5', 'admin', '2019-12-18 07:56:47', null, '2019-12-18 07:57:17');
INSERT INTO `gen_table_column` VALUES ('228', '21', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-12-18 22:20:23', null, '2019-12-18 22:22:56');
INSERT INTO `gen_table_column` VALUES ('229', '21', 'merchant_no', '商户号', 'varchar(50)', 'String', 'merchantNo', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2019-12-18 22:20:23', null, '2019-12-18 22:22:56');
INSERT INTO `gen_table_column` VALUES ('230', '21', 'account_name', '收款人', 'varchar(20)', 'String', 'accountName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2019-12-18 22:20:23', null, '2019-12-18 22:22:56');
INSERT INTO `gen_table_column` VALUES ('231', '21', 'account_no', '收款账户', 'varchar(50)', 'String', 'accountNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-12-18 22:20:23', null, '2019-12-18 22:22:56');
INSERT INTO `gen_table_column` VALUES ('232', '21', 'bank_name', '收款银行', 'varchar(50)', 'String', 'bankName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '5', 'admin', '2019-12-18 22:20:23', null, '2019-12-18 22:22:56');
INSERT INTO `gen_table_column` VALUES ('233', '21', 'account_address', '收款支行地址', 'varchar(100)', 'String', 'accountAddress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-12-18 22:20:23', null, '2019-12-18 22:22:56');
INSERT INTO `gen_table_column` VALUES ('234', '21', 'flag', '删除标志', 'char(1)', 'String', 'flag', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-12-18 22:20:23', null, '2019-12-18 22:22:56');
INSERT INTO `gen_table_column` VALUES ('235', '21', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '8', 'admin', '2019-12-18 22:20:23', null, '2019-12-18 22:22:56');
INSERT INTO `gen_table_column` VALUES ('236', '21', 'create_user', '创建人', 'varchar(50)', 'String', 'createUser', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2019-12-18 22:20:23', null, '2019-12-18 22:22:56');
INSERT INTO `gen_table_column` VALUES ('237', '21', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '10', 'admin', '2019-12-18 22:20:23', null, '2019-12-18 22:22:56');
INSERT INTO `gen_table_column` VALUES ('238', '21', 'update_user', '修改人', 'varchar(50)', 'String', 'updateUser', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2019-12-18 22:20:23', null, '2019-12-18 22:22:56');
INSERT INTO `gen_table_column` VALUES ('239', '22', 'id', '编号', 'int(38)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-01-08 17:38:11', null, '2020-01-08 17:40:01');
INSERT INTO `gen_table_column` VALUES ('240', '22', 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2020-01-08 17:38:11', null, '2020-01-08 17:40:01');
INSERT INTO `gen_table_column` VALUES ('241', '22', 'receipt_type', '收款二维码类型', 'varchar(10)', 'String', 'receiptType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '3', 'admin', '2020-01-08 17:38:11', null, '2020-01-08 17:40:01');
INSERT INTO `gen_table_column` VALUES ('242', '22', 'receipt_qrcode_url', '收款二维码地址', 'varchar(100)', 'String', 'receiptQrcodeUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-01-08 17:38:11', null, '2020-01-08 17:40:01');
INSERT INTO `gen_table_column` VALUES ('243', '22', 'receipt_qrcode_code', '二维码code', 'varchar(128)', 'String', 'receiptQrcodeCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-01-08 17:38:11', null, '2020-01-08 17:40:01');
INSERT INTO `gen_table_column` VALUES ('244', '22', 'agent', '当前登录的用户名', 'varchar(255)', 'String', 'agent', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-01-08 17:38:11', null, '2020-01-08 17:40:01');
INSERT INTO `gen_table_column` VALUES ('245', '22', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', null, null, null, 'EQ', 'datetime', '', '7', 'admin', '2020-01-08 17:38:11', null, '2020-01-08 17:40:01');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-24UE4NK1580312168330', '1580313312473', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1578979990000', '-1', '5', 'PAUSED', 'CRON', '1578979982000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1578979995000', '-1', '5', 'PAUSED', 'CRON', '1578979982000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('29', '1', '微信', '1001', 'sys_receipt_type', null, null, 'N', '0', 'admin', '2019-11-29 19:03:48', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('30', '2', '支付宝', '1002', 'sys_receipt_type', null, null, 'N', '0', 'admin', '2019-11-29 19:04:01', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('31', '1', '未审核', '1', 'sys_review_status', null, null, 'N', '0', 'admin', '2019-11-29 19:03:48', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('32', '2', '审核失败', '2', 'sys_review_status', null, null, 'N', '0', 'admin', '2019-11-29 19:03:48', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('33', '3', '审核成功', '3', 'sys_review_status', null, null, 'N', '0', 'admin', '2019-11-29 19:03:48', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('34', '1', '未确认', '1', 'sys_status', null, null, 'N', '0', 'admin', '2019-11-29 19:03:48', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('35', '2', '已确认', '2', 'sys_status', null, null, 'N', '0', 'admin', '2019-11-29 19:03:48', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('36', '1', 'Y', '开启', 'sys_y_n', '', '', 'Y', '0', 'admin', '2020-01-17 18:18:13', 'admin', '2020-01-17 18:18:50', '');
INSERT INTO `sys_dict_data` VALUES ('37', '2', 'N', '关闭', 'sys_y_n', '', '', 'Y', '0', 'admin', '2020-01-17 18:18:31', 'admin', '2020-01-17 18:18:44', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('11', '收款类型', 'sys_receipt_type', '0', 'admin', '2019-11-29 19:03:03', '', null, '收款类型');
INSERT INTO `sys_dict_type` VALUES ('12', '是否开启使用YN', 'sys_y_n', '0', 'admin', '2020-01-17 18:17:44', '', null, '是否开启使用 Y开启 N关闭');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 10:31:41');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-11-19 10:32:27');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 10:32:32');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 11:14:18');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 11:56:06');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-19 12:53:57');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 13:36:22');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 14:58:14');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 15:08:06');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 15:10:37');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '10.10.12.33', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 15:12:02');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 15:13:03');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 15:21:36');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 15:28:56');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-19 15:33:14');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-19 15:38:10');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-19 15:39:26');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-11-20 13:46:14');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-20 13:46:16');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-20 14:01:57');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-20 14:10:50');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-20 14:14:34');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-20 14:32:17');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-20 15:09:55');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-20 15:12:42');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-11-20 15:17:29');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-20 15:17:32');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-20 15:21:56');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-20 15:24:27');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-21 09:19:21');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-21 09:28:01');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-21 10:13:38');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-21 21:43:24');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-11-22 06:10:26');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-22 06:10:30');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-25 17:15:06');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-25 17:16:39');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-25 21:45:06');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-28 17:05:56');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-11-28 17:40:26');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-11-28 17:40:28');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-28 17:40:33');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-28 17:55:35');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-28 18:01:08');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-11-28 18:11:05');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-28 18:11:08');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-11-28 18:23:40');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-28 21:31:26');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-28 21:54:17');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-28 22:55:42');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-29 17:14:02');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-29 18:54:30');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-11-29 21:25:44');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-29 21:25:45');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-29 21:35:44');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-29 22:03:52');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-29 22:25:20');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-11-29 22:45:41');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-29 22:45:44');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-11-29 23:02:32');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-29 23:02:34');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-29 23:06:01');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-29 23:12:18');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-11-29 23:21:07');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-05 17:33:09');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-12-05 18:56:10');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-05 18:56:13');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-05 18:57:14');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-05 18:59:28');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-05 19:05:56');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-12-05 19:10:05');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-05 19:10:08');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2019-12-05 19:11:44');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-05 19:11:47');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-14 01:09:07');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-18 21:48:19');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-18 22:17:57');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-18 22:30:49');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-18 22:36:02');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-18 22:59:05');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-18 23:02:42');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-18 23:05:12');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-18 23:08:37');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2019-12-19 00:07:07');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-07 05:44:10');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-08 17:20:03');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-08 18:08:29');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-08 18:52:49');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-08 19:02:27');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-08 19:14:38');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-08 19:18:35');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-08 19:31:25');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2020-01-14 17:58:22');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2020-01-14 17:58:25');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 17:58:29');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 18:00:53');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 18:45:21');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 18:55:51');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 21:13:26');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 21:24:40');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 21:34:42');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 22:28:14');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 22:29:49');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 22:33:40');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '1', '验证码错误', '2020-01-14 22:35:10');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 22:35:18');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 22:45:33');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 22:49:37');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-14 22:56:29');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-15 00:14:07');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-15 00:16:44');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-15 00:21:54');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-17 17:47:16');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-17 17:47:26');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '127.0.0.1', '内网IP', 'Opera 12', 'Windows Vista', '0', '登录成功', '2020-01-17 18:12:07');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-01-20 22:33:48');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-20 22:34:04');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4236 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '商户管理', '0', '4', '#', 'menuItem', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'admin', '2020-01-29 23:50:24', '中心管理目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '账户解锁', '501', '4', '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '在线查询', '109', '1', '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '批量强退', '109', '2', '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '单条强退', '109', '3', '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务查询', '110', '1', '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务新增', '110', '2', '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务修改', '110', '3', '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '任务删除', '110', '4', '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '状态修改', '110', '5', '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务详细', '110', '6', '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '任务导出', '110', '7', '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成查询', '114', '1', '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '生成修改', '114', '2', '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1059', '生成删除', '114', '3', '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1060', '预览代码', '114', '4', '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1061', '生成代码', '114', '5', '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2006', '门店', '3', '1', '/zy/kitchen', '', 'C', '0', 'zy:kitchen:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '门店菜单');
INSERT INTO `sys_menu` VALUES ('2007', '门店查询', '2006', '1', '#', '', 'F', '0', 'zy:kitchen:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2008', '门店新增', '2006', '2', '#', '', 'F', '0', 'zy:kitchen:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2009', '门店修改', '2006', '3', '#', '', 'F', '0', 'zy:kitchen:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2010', '门店删除', '2006', '4', '#', '', 'F', '0', 'zy:kitchen:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2011', '门店导出', '2006', '5', '#', '', 'F', '0', 'zy:kitchen:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2012', '代理管理', '0', '5', '#', 'menuItem', 'M', '0', '', 'fa fa-address-book', 'admin', '2019-11-20 13:54:49', 'admin', '2020-01-29 23:50:16', '');
INSERT INTO `sys_menu` VALUES ('2037', '商户用户信息', '2012', '1', '/zy/merchantUser', 'menuItem', 'C', '0', 'zy:merchantUser:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-11-20 15:24:55', '商户用户信息菜单');
INSERT INTO `sys_menu` VALUES ('2038', '商户用户信息查询', '2037', '1', '#', '', 'F', '0', 'zy:merchantUser:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2039', '商户用户信息新增', '2037', '2', '#', '', 'F', '0', 'zy:merchantUser:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2040', '商户用户信息修改', '2037', '3', '#', '', 'F', '0', 'zy:merchantUser:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2041', '商户用户信息删除', '2037', '4', '#', '', 'F', '0', 'zy:merchantUser:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2042', '商户用户信息导出', '2037', '5', '#', '', 'F', '0', 'zy:merchantUser:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2043', '商户订单记录', '2012', '2', '/zy/merchantOrder', 'menuItem', 'C', '0', 'zy:merchantOrder:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-11-20 15:25:18', '商户订单记录菜单');
INSERT INTO `sys_menu` VALUES ('2044', '商户订单记录查询', '2043', '1', '#', '', 'F', '0', 'zy:merchantOrder:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2045', '商户订单记录新增', '2043', '2', '#', '', 'F', '0', 'zy:merchantOrder:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2046', '商户订单记录修改', '2043', '3', '#', '', 'F', '0', 'zy:merchantOrder:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2047', '商户订单记录删除', '2043', '4', '#', '', 'F', '0', 'zy:merchantOrder:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2048', '商户订单记录导出', '2043', '5', '#', '', 'F', '0', 'zy:merchantOrder:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2049', '提款记录', '2012', '3', '/zy/merchantWithdrawal', 'menuItem', 'C', '0', 'zy:merchantWithdrawal:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-11-20 15:25:33', '提款记录菜单');
INSERT INTO `sys_menu` VALUES ('2050', '提款记录查询', '2049', '1', '#', '', 'F', '0', 'zy:merchantWithdrawal:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2051', '提款记录新增', '2049', '2', '#', '', 'F', '0', 'zy:merchantWithdrawal:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2052', '提款记录修改', '2049', '3', '#', '', 'F', '0', 'zy:merchantWithdrawal:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2053', '提款记录删除', '2049', '4', '#', '', 'F', '0', 'zy:merchantWithdrawal:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2054', '提款记录导出', '2049', '5', '#', '', 'F', '0', 'zy:merchantWithdrawal:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4000', '账户管理', '4', '1', '/zy/bank', '', 'C', '0', 'zy:bank:view', 'fa fa-gear', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '账户管理');
INSERT INTO `sys_menu` VALUES ('4001', '账户查询', '4000', '1', '#', '', 'F', '0', 'zy:bank:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4002', '账户新增', '4000', '2', '#', '', 'F', '0', 'zy:bank:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4003', '账户修改', '4000', '3', '#', '', 'F', '0', 'zy:bank:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4004', '账户删除', '4000', '4', '#', '', 'F', '0', 'zy:bank:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4100', '用户管理', '4', '2', '/zy/user', '', 'C', '0', 'zy:user:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('4101', '用户管理查询', '4100', '1', '#', '', 'F', '0', 'zy:user:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4102', '用户管理新增', '4100', '2', '#', '', 'F', '0', 'zy:user:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4103', '用户管理修改', '4100', '3', '#', '', 'F', '0', 'zy:user:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4104', '用户管理删除', '4100', '4', '#', '', 'F', '0', 'zy:user:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4200', '商户管理', '4', '3', '/zy/merchant', '', 'C', '0', 'zy:merchant:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '商户信息菜单');
INSERT INTO `sys_menu` VALUES ('4201', '商户信息查询', '4200', '1', '#', '', 'F', '0', 'zy:merchant:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4202', '商户信息新增', '4200', '2', '#', '', 'F', '0', 'zy:merchant:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4203', '商户信息修改', '4200', '3', '#', '', 'F', '0', 'zy:merchant:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4204', '商户信息删除', '4200', '4', '#', '', 'F', '0', 'zy:merchant:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4205', '用户提款记录', '4211', '3', '/zy/userWithdrawal', 'menuItem', 'C', '0', 'zy:userWithdrawal:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-11-28 17:56:53', '用户提款记录菜单');
INSERT INTO `sys_menu` VALUES ('4206', '用户提款记录查询', '4205', '1', '#', '', 'F', '0', 'zy:userWithdrawal:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4207', '用户提款记录新增', '4205', '2', '#', '', 'F', '0', 'zy:userWithdrawal:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4208', '用户提款记录修改', '4205', '3', '#', '', 'F', '0', 'zy:userWithdrawal:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4209', '用户提款记录删除', '4205', '4', '#', '', 'F', '0', 'zy:userWithdrawal:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4210', '用户提款记录导出', '4205', '5', '#', '', 'F', '0', 'zy:userWithdrawal:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4211', '财务管理', '0', '6', '#', 'menuItem', 'M', '0', null, 'fa fa-building-o', 'admin', '2019-11-28 17:56:33', '', null, '');
INSERT INTO `sys_menu` VALUES ('4212', '缴纳保证金记录', '4211', '2', '/zy/userDeposit', 'menuItem', 'C', '0', 'zy:userDeposit:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-11-28 18:01:36', '缴纳保证金记录菜单');
INSERT INTO `sys_menu` VALUES ('4213', '缴纳保证金记录查询', '4212', '1', '#', '', 'F', '0', 'zy:userDeposit:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4214', '缴纳保证金记录新增', '4212', '2', '#', '', 'F', '0', 'zy:userDeposit:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4215', '缴纳保证金记录修改', '4212', '3', '#', '', 'F', '0', 'zy:userDeposit:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4216', '缴纳保证金记录删除', '4212', '4', '#', '', 'F', '0', 'zy:userDeposit:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4217', '缴纳保证金记录导出', '4212', '5', '#', '', 'F', '0', 'zy:userDeposit:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4218', '银行收据', '4211', '1', '/zy/receiptBank', 'menuItem', 'C', '0', 'zy:receiptBank:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-11-28 21:54:51', '银行收据菜单');
INSERT INTO `sys_menu` VALUES ('4219', '银行收据查询', '4218', '1', '#', '', 'F', '0', 'zy:receiptBank:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4220', '银行收据新增', '4218', '2', '#', '', 'F', '0', 'zy:receiptBank:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4221', '银行收据修改', '4218', '3', '#', '', 'F', '0', 'zy:receiptBank:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4222', '银行收据删除', '4218', '4', '#', '', 'F', '0', 'zy:receiptBank:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4223', '银行收据导出', '4218', '5', '#', '', 'F', '0', 'zy:receiptBank:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4224', '账户管理', '2012', '1', '/zy/merchantBank', 'menuItem', 'C', '0', 'zy:merchantBank:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-18 22:48:16', '商户银行卡菜单');
INSERT INTO `sys_menu` VALUES ('4225', '商户银行卡查询', '4224', '1', '#', '', 'F', '0', 'zy:merchantBank:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4226', '商户银行卡新增', '4224', '2', '#', '', 'F', '0', 'zy:merchantBank:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4227', '商户银行卡修改', '4224', '3', '#', '', 'F', '0', 'zy:merchantBank:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4228', '商户银行卡删除', '4224', '4', '#', '', 'F', '0', 'zy:merchantBank:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4229', '商户银行卡导出', '4224', '5', '#', '', 'F', '0', 'zy:merchantBank:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4230', '收款码管理', '2012', '1', '/zy/usercodeone', 'menuItem', 'C', '0', 'zy:usercodeone:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-01-08 17:47:12', '收款码管理菜单');
INSERT INTO `sys_menu` VALUES ('4231', '收款码管理查询', '4230', '1', '#', '', 'F', '0', 'zy:usercodeone:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4232', '收款码管理新增', '4230', '2', '#', '', 'F', '0', 'zy:usercodeone:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4233', '收款码管理修改', '4230', '3', '#', '', 'F', '0', 'zy:usercodeone:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4234', '收款码管理删除', '4230', '4', '#', '', 'F', '0', 'zy:usercodeone:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('4235', '收款码管理导出', '4230', '5', '#', '', 'F', '0', 'zy:usercodeone:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', 'null', '1', '不允许操作超级管理员用户', '2019-11-19 10:34:39');
INSERT INTO `sys_oper_log` VALUES ('101', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 10:34:47');
INSERT INTO `sys_oper_log` VALUES ('102', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_kitchen\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:04:17');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/t_kitchen', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-19 15:04:22');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/t_kitchen', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-19 15:08:27');
INSERT INTO `sys_oper_log` VALUES ('105', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:13:20');
INSERT INTO `sys_oper_log` VALUES ('106', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_kitchen\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:13:36');
INSERT INTO `sys_oper_log` VALUES ('107', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/t_kitchen', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-19 15:13:46');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"存在子菜单,不允许删除\",\r\n  \"code\" : 301\r\n}', '0', null, '2019-11-19 15:22:11');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"存在子菜单,不允许删除\",\r\n  \"code\" : 301\r\n}', '0', null, '2019-11-19 15:22:18');
INSERT INTO `sys_oper_log` VALUES ('110', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2001', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:22:22');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:22:29');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2003', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:22:36');
INSERT INTO `sys_oper_log` VALUES ('113', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2004', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:22:43');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2005', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:22:52');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:22:57');
INSERT INTO `sys_oper_log` VALUES ('116', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:29:05');
INSERT INTO `sys_oper_log` VALUES ('117', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_kitchen\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:29:09');
INSERT INTO `sys_oper_log` VALUES ('118', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/t_kitchen', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-19 15:29:20');
INSERT INTO `sys_oper_log` VALUES ('119', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:43:23');
INSERT INTO `sys_oper_log` VALUES ('120', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"sex\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-19 15:43:26');
INSERT INTO `sys_oper_log` VALUES ('121', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_merchant\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 13:52:15');
INSERT INTO `sys_oper_log` VALUES ('122', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_merchant_user\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 13:52:26');
INSERT INTO `sys_oper_log` VALUES ('123', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 13:53:01');
INSERT INTO `sys_oper_log` VALUES ('124', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"5\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 13:53:03');
INSERT INTO `sys_oper_log` VALUES ('125', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_merchant,b_merchant_user\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 13:53:22');
INSERT INTO `sys_oper_log` VALUES ('126', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"商户管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-address-book\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 13:54:49');
INSERT INTO `sys_oper_log` VALUES ('127', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_merchant', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-20 13:55:19');
INSERT INTO `sys_oper_log` VALUES ('128', '商户信息', '1', 'com.ruoyi.web.controller.zy.BMerchantController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/merchant/add', '127.0.0.1', '内网IP', '{\r\n  \"merchantName\" : [ \"11\" ],\r\n  \"merchantNo\" : [ \"11\" ],\r\n  \"merchantSecret\" : [ \"11\" ],\r\n  \"createUser\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 14:04:20');
INSERT INTO `sys_oper_log` VALUES ('129', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_merchant_user', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-20 14:05:31');
INSERT INTO `sys_oper_log` VALUES ('130', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2019\" ],\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"商户用户信息\" ],\r\n  \"url\" : [ \"/zy/user\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"zy:user:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 14:16:19');
INSERT INTO `sys_oper_log` VALUES ('131', '商户用户信息', '1', 'com.ruoyi.web.controller.zy.BMerchantUserController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/user/add', '127.0.0.1', '内网IP', '{\r\n  \"merchantNo\" : [ \"111111111111111\" ],\r\n  \"username\" : [ \"11111111111111\" ],\r\n  \"password\" : [ \"1111\" ],\r\n  \"phoneNumber\" : [ \"1111111\" ],\r\n  \"email\" : [ \"1235454511@qq.cm\" ],\r\n  \"level\" : [ \"1\" ],\r\n  \"loginTimes\" : [ \"1\" ],\r\n  \"lastLoginTime\" : [ \"2019-10-30\" ],\r\n  \"lastLoginIp\" : [ \"1\" ],\r\n  \"thisLoginTime\" : [ \"2019-10-31\" ],\r\n  \"thisLoginIp\" : [ \"11\" ],\r\n  \"createUser\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 14:17:27');
INSERT INTO `sys_oper_log` VALUES ('132', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_merchant_order\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 14:27:33');
INSERT INTO `sys_oper_log` VALUES ('133', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"8\" ],\r\n  \"tableName\" : [ \"b_merchant_order\" ],\r\n  \"tableComment\" : [ \"商户订单记录\" ],\r\n  \"className\" : [ \"MerchantOrder\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"74\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"75\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"系统订单号\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"sysOrderNo\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"76\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"商户号\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"merchantNo\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"77\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"商户订单号\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"merOrderNo\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 14:28:09');
INSERT INTO `sys_oper_log` VALUES ('134', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_merchant_order', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-20 14:28:13');
INSERT INTO `sys_oper_log` VALUES ('135', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2025\" ],\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"商户订单记录\" ],\r\n  \"url\" : [ \"/zy/merchantOrder\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"zy:merchantOrder:view\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 14:33:45');
INSERT INTO `sys_oper_log` VALUES ('136', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_merchant_withdrawal\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 14:44:43');
INSERT INTO `sys_oper_log` VALUES ('137', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"9\" ],\r\n  \"tableName\" : [ \"b_merchant_withdrawal\" ],\r\n  \"tableComment\" : [ \"提款记录\" ],\r\n  \"className\" : [ \"BMerchantWithdrawal\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"92\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"93\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"商户号\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"merchantNo\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"94\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"商户收款银行编号\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"merchantBankId\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"95\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"提现金额\" ],\r\n  \"columns[3].javaType\" : [ \"Double\" ],\r\n  \"columns[3].javaField\" : [ \"amount\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" ', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 14:45:21');
INSERT INTO `sys_oper_log` VALUES ('138', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', null, '/tool/gen/genCode/b_merchant_withdrawal', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-20 14:45:25');
INSERT INTO `sys_oper_log` VALUES ('139', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"7\" ],\r\n  \"tableName\" : [ \"b_merchant_user\" ],\r\n  \"tableComment\" : [ \"商户用户信息\" ],\r\n  \"className\" : [ \"MerchantUser\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"60\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"61\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"商户号\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"merchantNo\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"62\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"用户名\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"username\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"63\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"密码\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"password\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"colu', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 15:10:18');
INSERT INTO `sys_oper_log` VALUES ('140', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"7\" ],\r\n  \"tableName\" : [ \"b_merchant_user\" ],\r\n  \"tableComment\" : [ \"商户用户信息\" ],\r\n  \"className\" : [ \"MerchantUser\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"60\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"61\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"商户号\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"merchantNo\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"62\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"用户名\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"username\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"63\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"密码\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"password\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"colu', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 15:10:40');
INSERT INTO `sys_oper_log` VALUES ('141', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"9\" ],\r\n  \"tableName\" : [ \"b_merchant_withdrawal\" ],\r\n  \"tableComment\" : [ \"提款记录\" ],\r\n  \"className\" : [ \"MerchantWithdrawal\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"92\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"93\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"商户号\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"merchantNo\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"94\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"商户收款银行编号\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"merchantBankId\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"95\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"提现金额\" ],\r\n  \"columns[3].javaType\" : [ \"Double\" ],\r\n  \"columns[3].javaField\" : [ \"amount\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" :', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 15:10:54');
INSERT INTO `sys_oper_log` VALUES ('142', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_merchant_user', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-20 15:13:01');
INSERT INTO `sys_oper_log` VALUES ('143', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_merchant_order', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-20 15:17:57');
INSERT INTO `sys_oper_log` VALUES ('144', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_merchant_withdrawal', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-20 15:22:14');
INSERT INTO `sys_oper_log` VALUES ('145', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2037\" ],\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"商户用户信息\" ],\r\n  \"url\" : [ \"/zy/merchantUser\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"zy:merchantUser:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 15:24:55');
INSERT INTO `sys_oper_log` VALUES ('146', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2043\" ],\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"商户订单记录\" ],\r\n  \"url\" : [ \"/zy/merchantOrder\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"zy:merchantOrder:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 15:25:18');
INSERT INTO `sys_oper_log` VALUES ('147', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2049\" ],\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"提款记录\" ],\r\n  \"url\" : [ \"/zy/merchantWithdrawal\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"zy:merchantWithdrawal:view\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-20 15:25:33');
INSERT INTO `sys_oper_log` VALUES ('148', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_user\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-22 06:25:09');
INSERT INTO `sys_oper_log` VALUES ('149', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"10\" ],\r\n  \"tableName\" : [ \"b_user\" ],\r\n  \"tableComment\" : [ \"用户管理表\" ],\r\n  \"className\" : [ \"BUser\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"102\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"103\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"104\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"密码\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"password\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"105\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"推荐人账号\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"agent\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].colum', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-22 06:26:21');
INSERT INTO `sys_oper_log` VALUES ('150', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_user', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-22 06:27:09');
INSERT INTO `sys_oper_log` VALUES ('151', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"sys_user\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-22 06:48:14');
INSERT INTO `sys_oper_log` VALUES ('152', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"6\" ],\r\n  \"tableName\" : [ \"b_merchant\" ],\r\n  \"tableComment\" : [ \"商户信息\" ],\r\n  \"className\" : [ \"BMerchant\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"54\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"55\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"商户名称\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"merchantName\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"56\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"商户号\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"merchantNo\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"57\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"商户秘钥\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"merchantSecret\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"c', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-22 06:50:22');
INSERT INTO `sys_oper_log` VALUES ('153', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_merchant\" ]\r\n}', 'null', '0', null, '2019-11-22 06:50:31');
INSERT INTO `sys_oper_log` VALUES ('154', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_user_extend,b_user_deposit,b_user_withdrawal,b_user_order\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-22 07:33:53');
INSERT INTO `sys_oper_log` VALUES ('155', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"15\" ],\r\n  \"tableName\" : [ \"b_user_withdrawal\" ],\r\n  \"tableComment\" : [ \"用户提款记录\" ],\r\n  \"className\" : [ \"BUserWithdrawal\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"177\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"178\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"存款编号\" ],\r\n  \"columns[1].javaType\" : [ \"Long\" ],\r\n  \"columns[1].javaField\" : [ \"depositId\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"179\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"用户名\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"username\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"180\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"佣金金额\" ],\r\n  \"columns[3].javaType\" : [ \"Double\" ],\r\n  \"columns[3].javaField\" : [ \"commissionAmount\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictTyp', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-22 07:34:52');
INSERT INTO `sys_oper_log` VALUES ('156', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"14\" ],\r\n  \"tableName\" : [ \"b_user_order\" ],\r\n  \"tableComment\" : [ \"交易记录\" ],\r\n  \"className\" : [ \"BUserOrder\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"164\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"165\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"存款编号\" ],\r\n  \"columns[1].javaType\" : [ \"Long\" ],\r\n  \"columns[1].javaField\" : [ \"depositId\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"166\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"用户名\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"username\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"167\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"商户号\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"merchantNo\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"co', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-22 07:37:28');
INSERT INTO `sys_oper_log` VALUES ('157', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"13\" ],\r\n  \"tableName\" : [ \"b_user_extend\" ],\r\n  \"tableComment\" : [ \"收款码管理\" ],\r\n  \"className\" : [ \"BUserExtend\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"156\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"157\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"158\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"微信收款码审核标志\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"wechatFlag\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"159\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"微信收款码驳回原因\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"wechatReason\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" ', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-22 07:38:19');
INSERT INTO `sys_oper_log` VALUES ('158', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"14\" ],\r\n  \"tableName\" : [ \"b_user_order\" ],\r\n  \"tableComment\" : [ \"交易记录\" ],\r\n  \"className\" : [ \"BUserOrder\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"164\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"165\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"存款编号\" ],\r\n  \"columns[1].javaType\" : [ \"Long\" ],\r\n  \"columns[1].javaField\" : [ \"depositId\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"166\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"用户名\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"username\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"167\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"商户号\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"merchantNo\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"co', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-22 07:38:43');
INSERT INTO `sys_oper_log` VALUES ('159', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"15\" ],\r\n  \"tableName\" : [ \"b_user_withdrawal\" ],\r\n  \"tableComment\" : [ \"用户提款记录\" ],\r\n  \"className\" : [ \"BUserWithdrawal\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"177\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"178\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"存款编号\" ],\r\n  \"columns[1].javaType\" : [ \"Long\" ],\r\n  \"columns[1].javaField\" : [ \"depositId\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"179\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"用户名\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"username\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"180\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"佣金金额\" ],\r\n  \"columns[3].javaType\" : [ \"Double\" ],\r\n  \"columns[3].javaField\" : [ \"commissionAmount\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictTyp', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-22 07:38:56');
INSERT INTO `sys_oper_log` VALUES ('160', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"12\" ],\r\n  \"tableName\" : [ \"b_user_deposit\" ],\r\n  \"tableComment\" : [ \"保证金记录\" ],\r\n  \"className\" : [ \"BUserDeposit\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"137\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"138\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"139\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"保证金金额\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"earnestMoney\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"140\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"保证金图片地址\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"earnestMoneyUrl\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-22 07:39:34');
INSERT INTO `sys_oper_log` VALUES ('161', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_user_withdrawal,b_user_order,b_user_deposit,b_user_extend\" ]\r\n}', 'null', '0', null, '2019-11-22 07:49:37');
INSERT INTO `sys_oper_log` VALUES ('162', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"15\" ],\r\n  \"tableName\" : [ \"b_user_withdrawal\" ],\r\n  \"tableComment\" : [ \"提款记录\" ],\r\n  \"className\" : [ \"UserWithdrawal\" ],\r\n  \"functionAuthor\" : [ \"zf\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"177\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"178\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"存款编号\" ],\r\n  \"columns[1].javaType\" : [ \"Long\" ],\r\n  \"columns[1].javaField\" : [ \"depositId\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"179\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"用户名\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"username\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"180\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"佣金金额\" ],\r\n  \"columns[3].javaType\" : [ \"Double\" ],\r\n  \"columns[3].javaField\" : [ \"commissionAmount\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-28 17:46:23');
INSERT INTO `sys_oper_log` VALUES ('163', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"12\" ],\r\n  \"tableName\" : [ \"b_user_deposit\" ],\r\n  \"tableComment\" : [ \"缴纳保证金记录\" ],\r\n  \"className\" : [ \"UserDeposit\" ],\r\n  \"functionAuthor\" : [ \"zf\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"137\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"138\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"139\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"保证金金额\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"earnestMoney\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"140\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"保证金图片地址\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"earnestMoneyUrl\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" ', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-28 17:47:09');
INSERT INTO `sys_oper_log` VALUES ('164', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"15\" ],\r\n  \"tableName\" : [ \"b_user_withdrawal\" ],\r\n  \"tableComment\" : [ \"用户提款记录\" ],\r\n  \"className\" : [ \"UserWithdrawal\" ],\r\n  \"functionAuthor\" : [ \"zf\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"177\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"178\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"存款编号\" ],\r\n  \"columns[1].javaType\" : [ \"Long\" ],\r\n  \"columns[1].javaField\" : [ \"depositId\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"179\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"用户名\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"username\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"180\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"佣金金额\" ],\r\n  \"columns[3].javaType\" : [ \"Double\" ],\r\n  \"columns[3].javaField\" : [ \"commissionAmount\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" :', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-28 17:48:44');
INSERT INTO `sys_oper_log` VALUES ('165', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_user_withdrawal', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-28 17:51:14');
INSERT INTO `sys_oper_log` VALUES ('166', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"财务管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"6\" ],\r\n  \"icon\" : [ \"fa fa-building-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-28 17:56:33');
INSERT INTO `sys_oper_log` VALUES ('167', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"4205\" ],\r\n  \"parentId\" : [ \"4211\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"用户提款记录\" ],\r\n  \"url\" : [ \"/zy/userWithdrawal\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"zy:userWithdrawal:view\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-28 17:56:53');
INSERT INTO `sys_oper_log` VALUES ('168', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_user_deposit', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-28 17:57:49');
INSERT INTO `sys_oper_log` VALUES ('169', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"4212\" ],\r\n  \"parentId\" : [ \"4211\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"缴纳保证金记录\" ],\r\n  \"url\" : [ \"/zy/userDeposit\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"zy:userDeposit:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-28 18:01:36');
INSERT INTO `sys_oper_log` VALUES ('170', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"3\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-28 18:13:49');
INSERT INTO `sys_oper_log` VALUES ('171', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_receipt_bank\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-28 21:49:02');
INSERT INTO `sys_oper_log` VALUES ('172', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"16\" ],\r\n  \"tableName\" : [ \"b_receipt_bank\" ],\r\n  \"tableComment\" : [ \"银行收据\" ],\r\n  \"className\" : [ \"ReceiptBank\" ],\r\n  \"functionAuthor\" : [ \"zf\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"187\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"188\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"银行编码\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"bankCode\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"189\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"银行名称\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"bankName\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"190\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"开户名\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"accountName\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"LIKE\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-28 21:49:22');
INSERT INTO `sys_oper_log` VALUES ('173', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_receipt_bank', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-28 21:49:54');
INSERT INTO `sys_oper_log` VALUES ('174', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"4218\" ],\r\n  \"parentId\" : [ \"4211\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"银行收据\" ],\r\n  \"url\" : [ \"/zy/receiptBank\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"zy:receiptBank:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-28 21:54:51');
INSERT INTO `sys_oper_log` VALUES ('175', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"收款类型\" ],\r\n  \"dictType\" : [ \"sys_receipt_type\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"收款类型\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 19:03:03');
INSERT INTO `sys_oper_log` VALUES ('176', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"微信\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"sys_receipt_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 19:03:48');
INSERT INTO `sys_oper_log` VALUES ('177', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"支付宝\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"sys_receipt_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 19:04:01');
INSERT INTO `sys_oper_log` VALUES ('178', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"QQ\" ],\r\n  \"dictValue\" : [ \"3\" ],\r\n  \"dictType\" : [ \"sys_receipt_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 19:04:17');
INSERT INTO `sys_oper_log` VALUES ('179', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1\" ],\r\n  \"earnestMoneyUrl\" : [ \"1\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'username\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.zy.mapper.UserDepositMapper.insertUserDeposit-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into b_user_deposit          ( earnest_money,             earnest_money_url,             receipt_type,                                                                                                                                                                                      create_time )           values ( ?,             ?,             ?,                                                                                                                                                                                      ? )\r\n### Cause: java.sql.SQLException: Field \'username\' doesn\'t have a default value\n; Field \'username\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'username\' doesn\'t have a default value', '2019-11-29 21:33:18');
INSERT INTO `sys_oper_log` VALUES ('180', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1\" ],\r\n  \"earnestMoneyUrl\" : [ \"1\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'username\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.zy.mapper.UserDepositMapper.insertUserDeposit-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into b_user_deposit          ( earnest_money,             earnest_money_url,             receipt_type,                                                                                                                                                                                      create_time )           values ( ?,             ?,             ?,                                                                                                                                                                                      ? )\r\n### Cause: java.sql.SQLException: Field \'username\' doesn\'t have a default value\n; Field \'username\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'username\' doesn\'t have a default value', '2019-11-29 21:39:21');
INSERT INTO `sys_oper_log` VALUES ('181', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 22:05:00');
INSERT INTO `sys_oper_log` VALUES ('182', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 22:05:56');
INSERT INTO `sys_oper_log` VALUES ('183', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 22:06:49');
INSERT INTO `sys_oper_log` VALUES ('184', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1\" ],\r\n  \"earnestMoneyUrl\" : [ \"1\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 22:15:10');
INSERT INTO `sys_oper_log` VALUES ('185', '缴纳保证金记录', '3', 'com.ruoyi.web.controller.zy.UserDepositController.remove()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 22:15:15');
INSERT INTO `sys_oper_log` VALUES ('186', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 22:26:05');
INSERT INTO `sys_oper_log` VALUES ('187', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 22:27:05');
INSERT INTO `sys_oper_log` VALUES ('188', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1\" ],\r\n  \"receiptType\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 22:56:33');
INSERT INTO `sys_oper_log` VALUES ('189', '缴纳保证金记录', '3', 'com.ruoyi.web.controller.zy.UserDepositController.remove()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 22:57:23');
INSERT INTO `sys_oper_log` VALUES ('190', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 23:21:18');
INSERT INTO `sys_oper_log` VALUES ('191', '缴纳保证金记录', '3', 'com.ruoyi.web.controller.zy.UserDepositController.remove()', 'POST', '1', 'admin', null, '/zy/userDeposit/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"3\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 23:23:20');
INSERT INTO `sys_oper_log` VALUES ('192', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', null, '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1\" ],\r\n  \"receiptType\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-29 23:23:34');
INSERT INTO `sys_oper_log` VALUES ('193', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"16\" ],\r\n  \"tableName\" : [ \"b_receipt_bank\" ],\r\n  \"tableComment\" : [ \"银行收据\" ],\r\n  \"className\" : [ \"ReceiptBank\" ],\r\n  \"functionAuthor\" : [ \"zf\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"187\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"188\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"银行编码\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"bankCode\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"189\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"银行名称\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"bankName\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"190\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"开户名\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"accountName\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"LIKE\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-01 03:15:19');
INSERT INTO `sys_oper_log` VALUES ('194', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_receipt_bank', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-01 03:15:28');
INSERT INTO `sys_oper_log` VALUES ('195', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"16\" ],\r\n  \"tableName\" : [ \"b_receipt_bank\" ],\r\n  \"tableComment\" : [ \"银行收据\" ],\r\n  \"className\" : [ \"ReceiptBank\" ],\r\n  \"functionAuthor\" : [ \"zf\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"187\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"188\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"银行编码\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"bankCode\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"189\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"银行名称\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"bankName\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"190\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"开户名\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"accountName\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"LIKE\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-01 03:16:55');
INSERT INTO `sys_oper_log` VALUES ('196', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"123\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 17:33:51');
INSERT INTO `sys_oper_log` VALUES ('197', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"12\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 17:37:48');
INSERT INTO `sys_oper_log` VALUES ('198', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-05 18:36:46');
INSERT INTO `sys_oper_log` VALUES ('199', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"22\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-05 18:38:52');
INSERT INTO `sys_oper_log` VALUES ('200', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"1\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 18:39:53');
INSERT INTO `sys_oper_log` VALUES ('201', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"122\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 19:01:21');
INSERT INTO `sys_oper_log` VALUES ('202', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', null, '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"1111\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 19:02:19');
INSERT INTO `sys_oper_log` VALUES ('203', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"file\" : [ \"undefined\" ],\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"1111111\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : null,\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-05 19:06:20');
INSERT INTO `sys_oper_log` VALUES ('204', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"file\" : [ \"undefined\" ],\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"1111111\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : null,\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-05 19:06:35');
INSERT INTO `sys_oper_log` VALUES ('205', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"file\" : [ \"undefined\" ],\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"1111111\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : null,\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-05 19:07:04');
INSERT INTO `sys_oper_log` VALUES ('206', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"file\" : [ \"undefined\" ],\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"1111111\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : null,\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-05 19:07:05');
INSERT INTO `sys_oper_log` VALUES ('207', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"file\" : [ \"undefined\" ],\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"1111111\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : null,\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-05 19:07:28');
INSERT INTO `sys_oper_log` VALUES ('208', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"1111222\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : null,\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-05 19:08:49');
INSERT INTO `sys_oper_log` VALUES ('209', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"1111222\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : null,\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-05 19:09:01');
INSERT INTO `sys_oper_log` VALUES ('210', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"1111222\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : null,\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-05 19:10:26');
INSERT INTO `sys_oper_log` VALUES ('211', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"11112\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 19:12:06');
INSERT INTO `sys_oper_log` VALUES ('212', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"11112\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 19:12:21');
INSERT INTO `sys_oper_log` VALUES ('213', '账户管理', '2', 'com.ruoyi.web.controller.zy.BReceiptBankController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/bank/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"19\" ],\r\n  \"bankCode\" : [ \"1001\" ],\r\n  \"bankName\" : [ \"xx银行\" ],\r\n  \"accountName\" : [ \"xxx\" ],\r\n  \"accountNo\" : [ \"555555555555555\" ],\r\n  \"accountAddress\" : [ \"xxxxxxxxxxxxxx\" ],\r\n  \"amount\" : [ \"0.0\" ],\r\n  \"flag\" : [ \"0\" ],\r\n  \"createUser\" : [ \"xx\" ],\r\n  \"updateUser\" : [ \"xx\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-06 06:29:27');
INSERT INTO `sys_oper_log` VALUES ('214', '用户管理', '1', 'com.ruoyi.web.controller.zy.BUserController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/user/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"venn\" ],\r\n  \"password\" : [ \"venn1234\" ],\r\n  \"agent\" : [ \"venn\" ],\r\n  \"phoneNumber\" : [ \"13311102905\" ],\r\n  \"commissionRate\" : [ \"1\" ],\r\n  \"level\" : [ \"1\" ],\r\n  \"frequency\" : [ \"1\" ],\r\n  \"loginTimes\" : [ \"1\" ],\r\n  \"lastLoginTime\" : [ \"2019-12-05\" ],\r\n  \"lastLoginIp\" : [ \"fei\" ],\r\n  \"thisLoginTime\" : [ \"2019-12-05\" ],\r\n  \"thisLoginIp\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"registerTime\" : [ \"2019-02-28\" ]\r\n}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.zy.mapper.BUserMapper.insertBUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into b_user          ( username,             password,             agent,             phone_number,             commission_rate,             level,             frequency,             login_times,             last_login_time,             last_login_ip,             this_login_time,                                       register_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2019-12-06 06:41:38');
INSERT INTO `sys_oper_log` VALUES ('215', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_user_qr_codeone,s_system_parameter,b_user_qr_code\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-13 07:37:29');
INSERT INTO `sys_oper_log` VALUES ('216', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"19\" ],\r\n  \"tableName\" : [ \"s_system_parameter\" ],\r\n  \"tableComment\" : [ \"系统参数表\" ],\r\n  \"className\" : [ \"SSystemParameter\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"213\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"214\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"类别\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"category\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"215\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"项编码\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"code\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"216\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"项内容\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"value\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"textarea\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n ', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-13 07:45:27');
INSERT INTO `sys_oper_log` VALUES ('217', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"18\" ],\r\n  \"tableName\" : [ \"b_user_qr_codeone\" ],\r\n  \"tableComment\" : [ \"收款码管理\" ],\r\n  \"className\" : [ \"BUserQrCodeone\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"207\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"208\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"209\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"收款二维码类型\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"receiptType\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"select\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"210\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"收款二维码地址\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"receiptQrcodeUrl\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-13 07:46:59');
INSERT INTO `sys_oper_log` VALUES ('218', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"17\" ],\r\n  \"tableName\" : [ \"b_user_qr_code\" ],\r\n  \"tableComment\" : [ \"用户收款码表\" ],\r\n  \"className\" : [ \"BUserQrCode\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"199\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"200\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"201\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"收款二维码类型\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"receiptType\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"select\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"202\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"收款金额\" ],\r\n  \"columns[3].javaType\" : [ \"Long\" ],\r\n  \"columns[3].javaField\" : [ \"receiptAmount\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" :', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-13 07:50:23');
INSERT INTO `sys_oper_log` VALUES ('219', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"19\" ],\r\n  \"tableName\" : [ \"s_system_parameter\" ],\r\n  \"tableComment\" : [ \"系统参数表\" ],\r\n  \"className\" : [ \"SSystemParameter\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"213\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"214\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"类别\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"category\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"215\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"项编码\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"code\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"216\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"项内容\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"value\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"textarea\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n ', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-13 07:50:49');
INSERT INTO `sys_oper_log` VALUES ('220', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"17\" ],\r\n  \"tableName\" : [ \"b_user_qr_code\" ],\r\n  \"tableComment\" : [ \"用户收款码表\" ],\r\n  \"className\" : [ \"BUserQrCode\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"199\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"200\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"201\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"收款二维码类型\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"receiptType\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"select\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"202\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"收款金额\" ],\r\n  \"columns[3].javaType\" : [ \"Long\" ],\r\n  \"columns[3].javaField\" : [ \"receiptAmount\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" :', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-13 07:51:25');
INSERT INTO `sys_oper_log` VALUES ('221', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"18\" ],\r\n  \"tableName\" : [ \"b_user_qr_codeone\" ],\r\n  \"tableComment\" : [ \"收款码管理\" ],\r\n  \"className\" : [ \"BUserQrCodeone\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"207\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"208\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"209\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"收款二维码类型\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"receiptType\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"select\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"210\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"收款二维码地址\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"receiptQrcodeUrl\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-13 07:51:38');
INSERT INTO `sys_oper_log` VALUES ('222', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"s_system_parameter,b_user_qr_codeone,b_user_qr_code\" ]\r\n}', 'null', '0', null, '2019-12-13 07:51:48');
INSERT INTO `sys_oper_log` VALUES ('223', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/s_system_parameter', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-18 07:41:02');
INSERT INTO `sys_oper_log` VALUES ('224', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_user_receipt\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-18 07:56:48');
INSERT INTO `sys_oper_log` VALUES ('225', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"20\" ],\r\n  \"tableName\" : [ \"b_user_receipt\" ],\r\n  \"tableComment\" : [ \"收款次数\" ],\r\n  \"className\" : [ \"BUserReceipt\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"223\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"224\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"225\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"微信收款次数\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"wechatReceiptTimes\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"226\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"支付宝收款次数\" ],\r\n  \"columns[3].javaType\" : [ \"Long\" ],\r\n  \"columns[3].javaField\" : [ \"alipayReceiptTimes\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].d', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-18 07:57:18');
INSERT INTO `sys_oper_log` VALUES ('226', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', null, '/tool/gen/genCode/b_user_receipt', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-18 07:57:28');
INSERT INTO `sys_oper_log` VALUES ('227', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_user_qr_codeone', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-18 08:03:19');
INSERT INTO `sys_oper_log` VALUES ('228', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_user_qr_codeone,b_user_qr_code\" ]\r\n}', 'null', '0', null, '2019-12-18 08:03:57');
INSERT INTO `sys_oper_log` VALUES ('229', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"4\" ],\r\n  \"earnestMoney\" : [ \"11112\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-18 22:08:53');
INSERT INTO `sys_oper_log` VALUES ('230', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_merchant_bank\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-18 22:20:23');
INSERT INTO `sys_oper_log` VALUES ('231', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"21\" ],\r\n  \"tableName\" : [ \"b_merchant_bank\" ],\r\n  \"tableComment\" : [ \"商户银行卡\" ],\r\n  \"className\" : [ \"MerchantBank\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"228\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"229\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"商户号\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"merchantNo\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"230\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"收款人\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"accountName\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"231\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"收款账户\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"accountNo\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ]', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-18 22:21:11');
INSERT INTO `sys_oper_log` VALUES ('232', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"21\" ],\r\n  \"tableName\" : [ \"b_merchant_bank\" ],\r\n  \"tableComment\" : [ \"商户银行卡\" ],\r\n  \"className\" : [ \"MerchantBank\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"228\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"229\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"商户号\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"merchantNo\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"230\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"收款人\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"accountName\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"231\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"收款账户\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"accountNo\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ]', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-18 22:21:38');
INSERT INTO `sys_oper_log` VALUES ('233', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"21\" ],\r\n  \"tableName\" : [ \"b_merchant_bank\" ],\r\n  \"tableComment\" : [ \"商户银行卡\" ],\r\n  \"className\" : [ \"MerchantBank\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"228\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"229\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"商户号\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"merchantNo\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"230\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"收款人\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"accountName\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"LIKE\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"231\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"收款账户\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"accountNo\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" : [ \"232\" ]', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-18 22:22:56');
INSERT INTO `sys_oper_log` VALUES ('234', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_merchant_bank', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-18 22:22:59');
INSERT INTO `sys_oper_log` VALUES ('235', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"4224\" ],\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"账户管理\" ],\r\n  \"url\" : [ \"/zy/merchantBank\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"zy:merchantBank:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-18 22:48:16');
INSERT INTO `sys_oper_log` VALUES ('236', '商户银行卡', '1', 'com.ruoyi.web.controller.zy.MerchantBankController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/merchantBank/add', '127.0.0.1', '内网IP', '{\r\n  \"merchantNo\" : [ \"1\" ],\r\n  \"accountName\" : [ \"11\" ],\r\n  \"accountNo\" : [ \"111\" ],\r\n  \"bankName\" : [ \"11\" ],\r\n  \"accountAddress\" : [ \"11\" ],\r\n  \"flag\" : [ \"\" ],\r\n  \"createUser\" : [ \"\" ],\r\n  \"updateUser\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-18 22:59:16');
INSERT INTO `sys_oper_log` VALUES ('237', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"18\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 17:38:06');
INSERT INTO `sys_oper_log` VALUES ('238', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"b_user_qr_codeone\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 17:38:11');
INSERT INTO `sys_oper_log` VALUES ('239', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"22\" ],\r\n  \"tableName\" : [ \"b_user_qr_codeone\" ],\r\n  \"tableComment\" : [ \"收款码管理\" ],\r\n  \"className\" : [ \"BUserQrCodeone\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"239\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"240\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"241\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"收款二维码类型\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"receiptType\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"select\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"242\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"收款二维码地址\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"receiptQrcodeUrl\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].d', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 17:38:49');
INSERT INTO `sys_oper_log` VALUES ('240', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"22\" ],\r\n  \"tableName\" : [ \"b_user_qr_codeone\" ],\r\n  \"tableComment\" : [ \"收款码管理\" ],\r\n  \"className\" : [ \"UserQrCodeone\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"239\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"240\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"241\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"收款二维码类型\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"receiptType\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"select\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"242\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"收款二维码地址\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"receiptQrcodeUrl\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].di', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 17:39:40');
INSERT INTO `sys_oper_log` VALUES ('241', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"22\" ],\r\n  \"tableName\" : [ \"b_user_qr_codeone\" ],\r\n  \"tableComment\" : [ \"收款码管理\" ],\r\n  \"className\" : [ \"UserQrCodeone\" ],\r\n  \"functionAuthor\" : [ \"zy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"239\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"编号\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"240\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"用户名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"username\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"241\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"收款二维码类型\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"receiptType\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"select\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"242\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"收款二维码地址\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"receiptQrcodeUrl\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].di', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 17:40:01');
INSERT INTO `sys_oper_log` VALUES ('242', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/b_user_qr_codeone', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2020-01-08 17:40:15');
INSERT INTO `sys_oper_log` VALUES ('243', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"4230\" ],\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"收款码管理\" ],\r\n  \"url\" : [ \"/zy/usercodeone\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"zy:usercodeone:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 17:47:12');
INSERT INTO `sys_oper_log` VALUES ('244', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"\\r\\n### Error updating database.  Cause: java.sql.SQLException: Field \'receipt_type\' doesn\'t have a default value\\r\\n### The error may involve com.ruoyi.zy.mapper.UserQrCodeoneMapper.insertUserQrCodeone-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into b_user_qr_codeone          ( username,                          receipt_qrcode_url,                          agent,             create_time )           values ( ?,                          ?,                          ?,             ? )\\r\\n### Cause: java.sql.SQLException: Field \'receipt_type\' doesn\'t have a default value\\n; Field \'receipt_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'receipt_type\' doesn\'t have a default value\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 18:09:12');
INSERT INTO `sys_oper_log` VALUES ('245', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"\\r\\n### Error updating database.  Cause: java.sql.SQLException: Field \'receipt_qrcode_code\' doesn\'t have a default value\\r\\n### The error may involve com.ruoyi.zy.mapper.UserQrCodeoneMapper.insertUserQrCodeone-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into b_user_qr_codeone          ( username,             receipt_type,             receipt_qrcode_url,                          agent,             create_time )           values ( ?,             ?,             ?,                          ?,             ? )\\r\\n### Cause: java.sql.SQLException: Field \'receipt_qrcode_code\' doesn\'t have a default value\\n; Field \'receipt_qrcode_code\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'receipt_qrcode_code\' doesn\'t have a default value\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 18:09:16');
INSERT INTO `sys_oper_log` VALUES ('246', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"111\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 18:15:24');
INSERT INTO `sys_oper_log` VALUES ('247', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 18:53:13');
INSERT INTO `sys_oper_log` VALUES ('248', '收款码管理', '3', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.remove()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 19:00:48');
INSERT INTO `sys_oper_log` VALUES ('249', '收款码管理', '3', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.remove()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 19:00:50');
INSERT INTO `sys_oper_log` VALUES ('250', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"Can\'t read input file!\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 19:01:00');
INSERT INTO `sys_oper_log` VALUES ('251', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"Can\'t read input file!\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 19:03:00');
INSERT INTO `sys_oper_log` VALUES ('252', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"Can\'t read input file!\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 19:05:57');
INSERT INTO `sys_oper_log` VALUES ('253', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"Can\'t read input file!\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 19:06:35');
INSERT INTO `sys_oper_log` VALUES ('254', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"Can\'t read input file!\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 19:08:57');
INSERT INTO `sys_oper_log` VALUES ('255', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"Can\'t read input file!\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 19:09:10');
INSERT INTO `sys_oper_log` VALUES ('256', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 19:13:18');
INSERT INTO `sys_oper_log` VALUES ('257', '收款码管理', '3', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.remove()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"3\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 19:14:45');
INSERT INTO `sys_oper_log` VALUES ('258', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"Can\'t read input file!\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 19:18:05');
INSERT INTO `sys_oper_log` VALUES ('259', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"Can\'t read input file!\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 19:18:05');
INSERT INTO `sys_oper_log` VALUES ('260', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"Can\'t read input file!\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 19:18:05');
INSERT INTO `sys_oper_log` VALUES ('261', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 19:19:03');
INSERT INTO `sys_oper_log` VALUES ('262', '收款码管理', '3', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.remove()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 19:19:35');
INSERT INTO `sys_oper_log` VALUES ('263', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 19:19:58');
INSERT INTO `sys_oper_log` VALUES ('264', '收款码管理', '3', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.remove()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"5\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 19:31:31');
INSERT INTO `sys_oper_log` VALUES ('265', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"\\r\\n### Error updating database.  Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\\r\\n### The error may involve com.ruoyi.zy.mapper.BUserReceiptMapper.insertBUserReceipt-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into b_user_receipt          ( username,             wechat_receipt_times,             alipay_receipt_times )           values ( ?,             ?,             ? )\\r\\n### Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\\n; Field \'update_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-08 19:31:43');
INSERT INTO `sys_oper_log` VALUES ('266', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"zf\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 19:34:12');
INSERT INTO `sys_oper_log` VALUES ('267', '收款码管理', '3', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.remove()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"6\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 19:40:27');
INSERT INTO `sys_oper_log` VALUES ('268', '收款码管理', '1', 'com.ruoyi.web.controller.zy.UserQrCodeoneController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/usercodeone/add', '127.0.0.1', '内网IP', '{\r\n  \"username\" : [ \"admin\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-08 19:40:38');
INSERT INTO `sys_oper_log` VALUES ('269', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1000\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"系统找不到指定的路径。\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-16 07:21:00');
INSERT INTO `sys_oper_log` VALUES ('270', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1000\" ],\r\n  \"receiptType\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-16 07:24:17');
INSERT INTO `sys_oper_log` VALUES ('271', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"123123\" ],\r\n  \"receiptType\" : [ \"1001\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-16 08:37:15');
INSERT INTO `sys_oper_log` VALUES ('272', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1221\" ],\r\n  \"receiptType\" : [ \"1001\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-17 18:02:42');
INSERT INTO `sys_oper_log` VALUES ('273', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"是否开启使用YN\" ],\r\n  \"dictType\" : [ \"sys_y_n\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"是否开启使用 Y开启 N关闭\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-17 18:17:44');
INSERT INTO `sys_oper_log` VALUES ('274', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"sys_y\" ],\r\n  \"dictValue\" : [ \"开启\" ],\r\n  \"dictType\" : [ \"sys_y_n\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-17 18:18:13');
INSERT INTO `sys_oper_log` VALUES ('275', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"sys_n\" ],\r\n  \"dictValue\" : [ \"关闭\" ],\r\n  \"dictType\" : [ \"sys_y_n\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-17 18:18:31');
INSERT INTO `sys_oper_log` VALUES ('276', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"37\" ],\r\n  \"dictLabel\" : [ \"N\" ],\r\n  \"dictValue\" : [ \"关闭\" ],\r\n  \"dictType\" : [ \"sys_y_n\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-17 18:18:44');
INSERT INTO `sys_oper_log` VALUES ('277', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"36\" ],\r\n  \"dictLabel\" : [ \"Y\" ],\r\n  \"dictValue\" : [ \"开启\" ],\r\n  \"dictType\" : [ \"sys_y_n\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-17 18:18:50');
INSERT INTO `sys_oper_log` VALUES ('278', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"123\" ],\r\n  \"receiptType\" : [ \"1001\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-17 18:20:10');
INSERT INTO `sys_oper_log` VALUES ('279', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1\" ],\r\n  \"receiptType\" : [ \"1001\" ]\r\n}', '{\r\n  \"msg\" : \"\\r\\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\\r\\n### The error may involve com.ruoyi.zy.mapper.UserDepositMapper.insertUserDeposit-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into b_user_deposit          ( agent,             earnest_money,             earnest_money_url,             receipt_type,             receipt_amount,             receipt_commission_amount,                                                    review_status,                                       flag,             status,                                                    create_time )           values ( ?,             ?,             ?,             ?,             ?,                                                    ?,                                       ?,             ?,                                                    ? )\\r\\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1\",\r\n  \"code\" : 500\r\n}', '0', null, '2020-01-17 18:21:18');
INSERT INTO `sys_oper_log` VALUES ('280', '缴纳保证金记录', '1', 'com.ruoyi.web.controller.zy.UserDepositController.addSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/add', '127.0.0.1', '内网IP', '{\r\n  \"earnestMoney\" : [ \"1\" ],\r\n  \"receiptType\" : [ \"1001\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-17 18:22:19');
INSERT INTO `sys_oper_log` VALUES ('281', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-20 22:35:10');
INSERT INTO `sys_oper_log` VALUES ('282', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"sex\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-20 22:35:14');
INSERT INTO `sys_oper_log` VALUES ('283', '缴纳保证金记录', '2', 'com.ruoyi.web.controller.zy.UserDepositController.editSave()', 'POST', '1', 'admin', '研发部门', '/zy/userDeposit/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"11\" ],\r\n  \"earnestMoney\" : [ \"10000\" ],\r\n  \"receiptType\" : [ \"1001\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-20 23:02:31');
INSERT INTO `sys_oper_log` VALUES ('284', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', '1', 'admin', '研发部门', '/system/dept/remove/109', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-29 23:10:26');
INSERT INTO `sys_oper_log` VALUES ('285', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', '1', 'admin', '研发部门', '/system/dept/remove/103', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"部门存在用户,不允许删除\",\r\n  \"code\" : 301\r\n}', '0', null, '2020-01-29 23:10:30');
INSERT INTO `sys_oper_log` VALUES ('286', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', '1', 'admin', '研发部门', '/system/dept/remove/106', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-29 23:10:36');
INSERT INTO `sys_oper_log` VALUES ('287', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', '1', 'admin', '研发部门', '/system/dept/remove/104', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-29 23:10:41');
INSERT INTO `sys_oper_log` VALUES ('288', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', '1', 'admin', '研发部门', '/system/dept/remove/107', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-29 23:10:44');
INSERT INTO `sys_oper_log` VALUES ('289', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2012\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"商户管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"fa fa-address-book\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-29 23:13:55');
INSERT INTO `sys_oper_log` VALUES ('290', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2012\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"代理管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"fa fa-address-book\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-29 23:50:16');
INSERT INTO `sys_oper_log` VALUES ('291', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"4\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"商户管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-gear\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2020-01-29 23:50:24');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');
INSERT INTO `sys_role_menu` VALUES ('2', '1061');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2020/01/20/6e0c0235d8071c6cea445bab8cbd4c04.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2020-01-20 22:34:04', 'admin', '2018-03-16 11:33:00', 'ry', '2020-01-20 22:35:14', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '0', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'admin', '2019-11-19 10:34:47', '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('68e98a48-1c92-4048-b972-c059185d721e', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2020-01-29 22:50:07', '2020-01-29 23:52:15', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');

-- ----------------------------
-- Table structure for s_jump_address
-- ----------------------------
DROP TABLE IF EXISTS `s_jump_address`;
CREATE TABLE `s_jump_address` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `jump_url` varchar(100) NOT NULL COMMENT '跳转路径',
  `image_url` varchar(100) NOT NULL COMMENT '图片地址',
  `flag` char(1) NOT NULL COMMENT '是否使用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `update_user` varchar(50) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_jump_address
-- ----------------------------

-- ----------------------------
-- Table structure for s_operator
-- ----------------------------
DROP TABLE IF EXISTS `s_operator`;
CREATE TABLE `s_operator` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `login_times` int(38) NOT NULL COMMENT '登录次数',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '上次登录地址',
  `this_login_time` datetime DEFAULT NULL COMMENT '本次登录时间',
  `this_login_ip` varchar(50) DEFAULT NULL COMMENT '本次登录地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='账户管理';

-- ----------------------------
-- Records of s_operator
-- ----------------------------
INSERT INTO `s_operator` VALUES ('14', 'admin', 'F517CE6F1E1B3785104D69DDD96DBEC8', '29', '2019-06-27 14:34:33', '120.29.85.236', '2019-06-29 05:25:13', '120.29.85.141', '2018-12-23 17:14:01', 'system');

-- ----------------------------
-- Table structure for s_system_parameter
-- ----------------------------
DROP TABLE IF EXISTS `s_system_parameter`;
CREATE TABLE `s_system_parameter` (
  `id` int(38) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `category` varchar(50) NOT NULL COMMENT '类别',
  `code` varchar(50) NOT NULL COMMENT '项编码',
  `value` varchar(1000) NOT NULL COMMENT '项内容',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `flag` char(1) NOT NULL COMMENT '是否开启使用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `update_user` varchar(50) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_system_parameter
-- ----------------------------
INSERT INTO `s_system_parameter` VALUES ('1', '9999', 'SMS', 'Y', '短信反转开关参数', 'Y', '2018-09-26 09:33:25', 'system', '2018-09-26 09:33:30', 'system');
INSERT INTO `s_system_parameter` VALUES ('2', '8888', 'SMS_PARAM', '131629#074e09681c4ad9fe1ed322f58dc82b2d1', '匹配短信验证码参数', 'Y', '2018-12-23 21:38:31', 'system', '2018-12-23 21:38:31', 'system');
INSERT INTO `s_system_parameter` VALUES ('3', '7777', 'SMS_PARAM', '131627#074e09681c4ad9fe1ed322f58dc82b2d', '注册短信验证码参数', 'Y', '2018-12-23 21:38:31', 'system', '2018-12-23 21:38:31', 'system');
INSERT INTO `s_system_parameter` VALUES ('4', '6666', 'SMS_PARAM', '131628#074e09681c4ad9fe1ed322f58dc82b2d', '商户短信验证码参数', 'Y', '2018-12-23 21:38:31', 'system', '2018-12-23 21:38:31', 'system');
INSERT INTO `s_system_parameter` VALUES ('5', 'venn', '1001', '0.038', 'test商户微信费率', 'Y', '2019-02-26 01:35:11', 'system', '2019-02-26 01:35:28', 'system');
INSERT INTO `s_system_parameter` VALUES ('6', '1001', '2000', '微信扫码', 'venn测试', 'Y', '2020-01-05 23:16:53', 'system', '2020-01-05 23:17:02', 'system');

-- ----------------------------
-- Table structure for t_kitchen
-- ----------------------------
DROP TABLE IF EXISTS `t_kitchen`;
CREATE TABLE `t_kitchen` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `kitchen_id` int(11) DEFAULT NULL COMMENT '门店id',
  `userName` varchar(32) DEFAULT NULL COMMENT '门店管理员账号',
  `password` varchar(32) DEFAULT NULL COMMENT '管理员密码',
  `name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `person` varchar(255) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_token` varchar(32) DEFAULT NULL COMMENT '用户token',
  `status` int(11) DEFAULT NULL COMMENT '是否 禁用\r\n0 否 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='门店表';

-- ----------------------------
-- Records of t_kitchen
-- ----------------------------
INSERT INTO `t_kitchen` VALUES ('1', '1', 'santint', '123456', '三华餐厅', 'test', '三华', '13523567912', '2018-10-22 11:57:10', 'f3888306c434f9f6a1acafedb9ded371', '0');
INSERT INTO `t_kitchen` VALUES ('2', '2', 'santint2', '123456', '测试餐厅', '测试餐厅', '测试餐厅', '15538378915', '2019-01-08 10:31:06', 'dc9c5d11b1cace01e1ee846782983adb', '0');
INSERT INTO `t_kitchen` VALUES ('3', '666', 'santint_test2', '123456', '测试餐厅2', '测试餐厅2', '测试餐厅2', '15538378914', '2019-01-09 10:07:40', null, '0');
INSERT INTO `t_kitchen` VALUES ('16', '3', '222', '222222', 'test', 'test', '11', '15538378913', '2019-08-28 15:25:33', '11', '1');
INSERT INTO `t_kitchen` VALUES ('17', '1', '1', '1', '1', '1', '1', '1', '2019-11-19 09:47:53', '1', '1');

-- ----------------------------
-- Event structure for myevent
-- ----------------------------
DROP EVENT IF EXISTS `myevent`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` EVENT `myevent` ON SCHEDULE EVERY 1 DAY STARTS '2018-10-14 12:00:01' ON COMPLETION NOT PRESERVE ENABLE DO update b_user_receipt t set  t.wechat_receipt_times = 0,t.alipay_receipt_times = 0
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
