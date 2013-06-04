/*
Navicat MySQL Data Transfer

Source Server         : root_localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : vtscat.com

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-06-04 23:47:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `AccountTypes`
-- ----------------------------
DROP TABLE IF EXISTS `AccountTypes`;
CREATE TABLE `AccountTypes` (
  `AccountTypeId` int(11) NOT NULL DEFAULT '0',
  `AccountTypeName` varchar(250) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `AccountTypeCode` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`AccountTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of AccountTypes
-- ----------------------------
INSERT INTO `AccountTypes` VALUES ('1', 'Personal', '19', '1', 'PERSONAL');
INSERT INTO `AccountTypes` VALUES ('2', 'Business', '29', '1', 'BUSINESS');
INSERT INTO `AccountTypes` VALUES ('3', 'G-Business', '39', '1', 'G-BUSINESS');
INSERT INTO `AccountTypes` VALUES ('4', 'Trial', '0', '1', 'TRIAL');

-- ----------------------------
-- Table structure for `Affiliates`
-- ----------------------------
DROP TABLE IF EXISTS `Affiliates`;
CREATE TABLE `Affiliates` (
  `AffiliateId` int(11) NOT NULL DEFAULT '0',
  `UserId` int(11) DEFAULT NULL,
  `AffiliateCode` varchar(250) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `UpdateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`AffiliateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Affiliates
-- ----------------------------

-- ----------------------------
-- Table structure for `Categorys`
-- ----------------------------
DROP TABLE IF EXISTS `Categorys`;
CREATE TABLE `Categorys` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Categorys
-- ----------------------------
INSERT INTO `Categorys` VALUES ('1', 'Restaurants & Hotels', '2013-03-08 15:51:12', '2013-03-08 15:51:15', '1', '0');
INSERT INTO `Categorys` VALUES ('2', 'Companies & Educations', '2013-03-08 15:52:05', '2013-03-08 15:52:08', '1', '0');
INSERT INTO `Categorys` VALUES ('3', 'Fashsions & Shoes', '2013-03-08 15:53:33', '2013-03-08 15:53:36', '1', '0');
INSERT INTO `Categorys` VALUES ('4', 'Beers & Wines', '2013-05-23 21:24:30', '2013-05-23 21:24:33', '1', '0');
INSERT INTO `Categorys` VALUES ('5', 'Cars & Motos', '2013-05-23 21:27:13', '2013-05-23 21:27:16', '1', '0');

-- ----------------------------
-- Table structure for `Contacts`
-- ----------------------------
DROP TABLE IF EXISTS `Contacts`;
CREATE TABLE `Contacts` (
  `ContactId` int(11) NOT NULL AUTO_INCREMENT,
  `Fullname` varchar(250) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CountryCode` varchar(2) DEFAULT NULL,
  `Content` varchar(500) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ContactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `Countrys`
-- ----------------------------
DROP TABLE IF EXISTS `Countrys`;
CREATE TABLE `Countrys` (
  `CountryId` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(250) DEFAULT NULL,
  `CountryCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Countrys
-- ----------------------------
INSERT INTO `Countrys` VALUES ('1', 'Vietnam', 'vi');
INSERT INTO `Countrys` VALUES ('2', 'Australia', 'au');
INSERT INTO `Countrys` VALUES ('3', 'Unit State America', 'us');

-- ----------------------------
-- Table structure for `Languages`
-- ----------------------------
DROP TABLE IF EXISTS `Languages`;
CREATE TABLE `Languages` (
  `LanguageId` int(11) NOT NULL AUTO_INCREMENT,
  `LanguageName` varchar(150) DEFAULT NULL,
  `LanguageCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`LanguageId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Languages
-- ----------------------------
INSERT INTO `Languages` VALUES ('1', 'Tiếng Việt', 'vi');
INSERT INTO `Languages` VALUES ('2', 'English', 'en');

-- ----------------------------
-- Table structure for `Members`
-- ----------------------------
DROP TABLE IF EXISTS `Members`;
CREATE TABLE `Members` (
  `MemberId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Members
-- ----------------------------
INSERT INTO `Members` VALUES ('1', '15', null, null, '1', '0');

-- ----------------------------
-- Table structure for `ModuleCategorys`
-- ----------------------------
DROP TABLE IF EXISTS `ModuleCategorys`;
CREATE TABLE `ModuleCategorys` (
  `ModuleCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `ModuleCategoryName` varchar(200) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `Image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ModuleCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ModuleCategorys
-- ----------------------------
INSERT INTO `ModuleCategorys` VALUES ('1', 'Payment', '2013-03-09 00:44:41', '2013-03-09 00:44:43', '1', '0', null);
INSERT INTO `ModuleCategorys` VALUES ('2', 'Permission', '2013-03-09 00:45:23', '2013-03-09 00:45:25', '1', '0', null);

-- ----------------------------
-- Table structure for `Modules`
-- ----------------------------
DROP TABLE IF EXISTS `Modules`;
CREATE TABLE `Modules` (
  `ModuleId` int(11) NOT NULL AUTO_INCREMENT,
  `ModuleName` varchar(200) DEFAULT NULL,
  `ModuleDescription` varchar(250) DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ModuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Modules
-- ----------------------------

-- ----------------------------
-- Table structure for `OrderDetails`
-- ----------------------------
DROP TABLE IF EXISTS `OrderDetails`;
CREATE TABLE `OrderDetails` (
  `OrderDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) DEFAULT NULL,
  `ItemName` varchar(250) DEFAULT NULL,
  `ItemQuality` int(11) DEFAULT '1',
  `Price` float DEFAULT NULL,
  `PriceType` varchar(255) DEFAULT NULL,
  `ItemId` int(11) DEFAULT NULL,
  `ItemType` enum('TEMPLATE','ACCOUNT_TYPE','DOMAIN','MODULE') DEFAULT 'TEMPLATE',
  `ItemCode` varchar(200) DEFAULT NULL,
  `Options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`OrderDetailId`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of OrderDetails
-- ----------------------------
INSERT INTO `OrderDetails` VALUES ('1', '6', 'Fashsion 002', '1', '0', 'normal', null, '', null, null);
INSERT INTO `OrderDetails` VALUES ('2', '7', 'Fashsion 002', '1', '0', 'NORMAL', '2', '', null, null);
INSERT INTO `OrderDetails` VALUES ('3', '12', 'Fashsion 002', '1', '420', 'UNIQUE', '2', '', null, null);
INSERT INTO `OrderDetails` VALUES ('4', '14', 'Fashsion 002', '1', '20', 'NORMAL', '2', '', null, null);
INSERT INTO `OrderDetails` VALUES ('5', '15', 'Fashsion 002', '1', '420', 'UNIQUE', '2', '', null, null);
INSERT INTO `OrderDetails` VALUES ('6', '17', 'Fashsion 004', '1', '490', 'UNIQUE', '4', '', null, null);
INSERT INTO `OrderDetails` VALUES ('7', '18', 'Fashsion 004', '1', '240', 'NORMAL', '4', '', null, null);
INSERT INTO `OrderDetails` VALUES ('8', '19', 'Fashsion 004', '1', '490', 'UNIQUE', '4', '', null, null);
INSERT INTO `OrderDetails` VALUES ('9', '20', 'Fashsion 004', '1', '240', 'NORMAL', '4', '', null, null);
INSERT INTO `OrderDetails` VALUES ('10', '21', 'Fashsion 004', '1', '490', 'UNIQUE', '4', '', null, null);
INSERT INTO `OrderDetails` VALUES ('11', '22', 'Fashsion 004', '1', '490', 'UNIQUE', '4', '', null, null);
INSERT INTO `OrderDetails` VALUES ('12', '23', 'Fashsion 003', '1', '540', 'UNIQUE', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('13', '24', 'Fashsion 003', '1', '250', 'NORMAL', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('14', '25', 'Fashsion 003', '1', '250', 'NORMAL', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('15', '26', 'Fashsion 003', '1', '250', 'NORMAL', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('16', '27', 'Fashsion 004', '1', '240', 'NORMAL', '4', '', null, null);
INSERT INTO `OrderDetails` VALUES ('17', '28', 'Fashsion 003', '1', '250', 'NORMAL', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('18', '29', 'Fashsion 001', '1', '240', 'NORMAL', '1', '', null, null);
INSERT INTO `OrderDetails` VALUES ('19', '30', 'Fashsion 001', '1', '240', 'NORMAL', '1', '', null, null);
INSERT INTO `OrderDetails` VALUES ('20', '31', 'Fashsion 002', '1', '240', 'NORMAL', '2', '', null, null);
INSERT INTO `OrderDetails` VALUES ('21', '32', 'Fashsion 004', '1', '240', 'NORMAL', '4', '', null, null);
INSERT INTO `OrderDetails` VALUES ('22', '33', 'Fashsion 004', '1', '240', 'NORMAL', '4', '', null, null);
INSERT INTO `OrderDetails` VALUES ('23', '34', 'Fashsion 003', '1', '250', 'NORMAL', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('24', '35', 'Fashsion 003', '1', '250', 'NORMAL', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('25', '36', 'Fashsion 003', '1', '250', 'NORMAL', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('26', '37', 'Fashsion 003', '1', '250', 'NORMAL', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('27', '38', 'Fashsion 003', '1', '250', 'NORMAL', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('28', '39', 'Fashsion 003', '1', '250', 'NORMAL', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('29', '40', 'Fashsion 001', '1', '240', 'NORMAL', '1', '', null, null);
INSERT INTO `OrderDetails` VALUES ('30', '41', 'Fashsion 003', '1', '540', 'UNIQUE', '3', '', null, null);
INSERT INTO `OrderDetails` VALUES ('31', '42', 'Fashsion 001', '1', '240', 'NORMAL', '1', '', null, null);
INSERT INTO `OrderDetails` VALUES ('32', '43', 'Fashsion 001', '1', '20', 'NORMAL', '1', '', null, null);
INSERT INTO `OrderDetails` VALUES ('33', '44', 'Fashsion 002', '1', '400', 'UNIQUE', '2', 'TEMPLATE', null, null);
INSERT INTO `OrderDetails` VALUES ('34', '45', 'Fashsion 001', '1', '300', 'UNIQUE', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('35', '46', 'Fashsion 003', '1', '30', 'NORMAL', '3', '', '00003', null);
INSERT INTO `OrderDetails` VALUES ('36', '47', 'Fashsion 001', '1', '0', 'NORMAL', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('37', '48', 'Fashsion 001', '1', '0', 'NORMAL', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('38', '49', 'Fashsion 001', '1', '300', 'UNIQUE', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('39', '50', 'Fashsion 001', '1', '0', 'NORMAL', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('40', '51', 'Fashsion 001', '1', '0', 'NORMAL', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('41', '52', 'Fashsion 001', '1', '0', 'NORMAL', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('42', '53', 'Fashsion 001', '1', '0', 'NORMAL', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('43', '55', 'Fashsion 001', '1', '0', 'NORMAL', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('44', '56', 'Fashsion 001', '1', '0', 'NORMAL', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('45', '57', 'Fashsion 001', '1', '0', 'NORMAL', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('46', '58', 'Fashsion 001', '1', '0', 'NORMAL', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('47', '59', 'Fashsion 001', '1', '0', 'NORMAL', '1', 'TEMPLATE', '00001', null);
INSERT INTO `OrderDetails` VALUES ('48', '60', 'Fashsion 003', '1', '10', 'NORMAL', '3', 'TEMPLATE', '00003', null);
INSERT INTO `OrderDetails` VALUES ('49', '61', 'Fashsion 003', '1', '10', 'NORMAL', '3', 'TEMPLATE', '00003', null);
INSERT INTO `OrderDetails` VALUES ('50', '62', 'Fashsion 003', '1', '10', 'NORMAL', '3', 'TEMPLATE', '00003', null);
INSERT INTO `OrderDetails` VALUES ('51', '64', null, '1', '0', 'FREE', '2', 'TEMPLATE', '00002', null);
INSERT INTO `OrderDetails` VALUES ('52', '64', null, '1', '19', 'PERSONAL', '1', 'ACCOUNT_TYPE', 'PERSONAL', null);
INSERT INTO `OrderDetails` VALUES ('53', '64', null, '1', '0', '', '0', 'DOMAIN', '', null);
INSERT INTO `OrderDetails` VALUES ('54', '65', null, '1', '0', 'FREE', '2', 'TEMPLATE', '00002', null);
INSERT INTO `OrderDetails` VALUES ('55', '65', 'Business', '1', '29', 'BUSINESS', '2', 'ACCOUNT_TYPE', 'BUSINESS', null);
INSERT INTO `OrderDetails` VALUES ('56', '65', 'thanhnienvietnam.com', '1', '0', '', '0', 'DOMAIN', '', null);
INSERT INTO `OrderDetails` VALUES ('57', '66', 'Fashsion 002', '1', '0', 'FREE', '2', 'TEMPLATE', '00002', null);
INSERT INTO `OrderDetails` VALUES ('58', '66', 'Business', '1', '29', 'BUSINESS', '2', 'ACCOUNT_TYPE', 'BUSINESS', null);
INSERT INTO `OrderDetails` VALUES ('59', '66', 'truongthanhsang.com', '1', '0', '', '0', 'DOMAIN', '', null);
INSERT INTO `OrderDetails` VALUES ('60', '67', 'Fashsion 002', '1', '0', 'FREE', '2', 'TEMPLATE', '00002', null);
INSERT INTO `OrderDetails` VALUES ('61', '67', 'Personal', '1', '19', 'PERSONAL', '1', 'ACCOUNT_TYPE', 'PERSONAL', null);
INSERT INTO `OrderDetails` VALUES ('62', '67', 'truongthanhsang.com', '1', '0', '', '0', 'DOMAIN', '', null);
INSERT INTO `OrderDetails` VALUES ('63', '68', 'Fashsion 002', '1', '0', 'FREE', '2', 'TEMPLATE', '00002', null);
INSERT INTO `OrderDetails` VALUES ('64', '68', 'Personal', '1', '19', 'PERSONAL', '1', 'ACCOUNT_TYPE', 'PERSONAL', 'SIX_MONTHLY');
INSERT INTO `OrderDetails` VALUES ('65', '68', 'truongthanhsang.com', '1', '0', '', '0', 'DOMAIN', '', null);
INSERT INTO `OrderDetails` VALUES ('66', '69', 'Fashsion 002', '1', '0', 'FREE', '2', 'TEMPLATE', '00002', null);
INSERT INTO `OrderDetails` VALUES ('67', '69', 'Business', '1', '29', 'BUSINESS', '2', 'ACCOUNT_TYPE', 'BUSINESS', 'MONTHLY');
INSERT INTO `OrderDetails` VALUES ('68', '69', 'nguyevantien2009.com', '1', '0', '', '0', 'DOMAIN', '', null);
INSERT INTO `OrderDetails` VALUES ('69', '70', 'Fashsion 002', '1', '12', 'NORMAL', '2', 'TEMPLATE', '0406586', null);
INSERT INTO `OrderDetails` VALUES ('70', '70', 'Business', '1', '29', 'BUSINESS', '2', 'ACCOUNT_TYPE', 'BUSINESS', 'MONTHLY');
INSERT INTO `OrderDetails` VALUES ('71', '70', 'test123123.com', '1', '0', '', '0', 'DOMAIN', '', null);
INSERT INTO `OrderDetails` VALUES ('72', '71', 'Fashsion 002', '1', '12', 'NORMAL', '2', 'TEMPLATE', '00002', null);
INSERT INTO `OrderDetails` VALUES ('73', '71', 'Personal', '1', '19', 'PERSONAL', '1', 'ACCOUNT_TYPE', 'PERSONAL', 'MONTHLY');
INSERT INTO `OrderDetails` VALUES ('74', '71', 'test123123.com', '1', '0', '', '0', 'DOMAIN', '', null);
INSERT INTO `OrderDetails` VALUES ('75', '72', 'Fashsion 002', '1', '12', 'NORMAL', '2', 'TEMPLATE', '00002', null);
INSERT INTO `OrderDetails` VALUES ('76', '72', 'Personal', '1', '19', 'PERSONAL', '1', 'ACCOUNT_TYPE', 'PERSONAL', 'MONTHLY');
INSERT INTO `OrderDetails` VALUES ('77', '72', 'test123123.com', '1', '0', '', '0', 'DOMAIN', '', null);
INSERT INTO `OrderDetails` VALUES ('78', '73', 'Fashsion 002', '1', '12', 'NORMAL', '2', 'TEMPLATE', '00002', null);
INSERT INTO `OrderDetails` VALUES ('79', '73', 'Trial', '1', '0', 'trial', '4', 'ACCOUNT_TYPE', 'TRIAL', 'NONE');
INSERT INTO `OrderDetails` VALUES ('80', '73', 'test123123.com', '1', '0', '', '0', 'DOMAIN', '', null);

-- ----------------------------
-- Table structure for `Orders`
-- ----------------------------
DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` datetime DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `TotalPrice` float DEFAULT NULL,
  `OrderStatus` enum('PENDING','CANCEL','PAYMENT_FAIL','PURCHASED') NOT NULL DEFAULT 'PENDING',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `WebsiteId` int(11) DEFAULT NULL,
  `CycleBilling` enum('TWO_YEARLY','YEARLY','SIX_MONTHLY','NONE','MONTHLY') DEFAULT 'SIX_MONTHLY',
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Orders
-- ----------------------------
INSERT INTO `Orders` VALUES ('6', '15', '2013-03-23 12:22:19', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('7', '15', '2013-03-23 12:25:29', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('8', '15', '2013-03-23 12:27:56', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('9', '15', '2013-03-23 12:29:23', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('10', '15', '2013-03-23 12:31:22', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('11', '15', '2013-03-23 12:31:55', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('12', '15', '2013-03-23 12:33:51', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('13', '15', '2013-03-23 13:04:45', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('14', '15', '2013-03-23 13:05:04', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('15', '15', '2013-03-23 13:05:16', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('16', '15', '2013-03-23 13:05:29', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('17', '15', '2013-03-23 13:06:35', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('18', '15', '2013-03-23 13:06:47', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('19', '15', '2013-03-23 15:15:17', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('20', '15', '2013-03-23 15:16:19', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('21', '15', '2013-03-23 15:17:25', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('22', '15', '2013-03-23 15:18:09', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('23', '15', '2013-03-23 15:30:28', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('24', '15', '2013-03-23 15:33:04', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('25', '15', '2013-03-23 15:33:25', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('26', '15', '2013-03-23 15:33:58', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('27', '15', '2013-03-23 15:35:29', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('28', '15', '2013-03-23 16:13:45', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('29', '15', '2013-03-23 17:20:26', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('30', '15', '2013-03-23 17:36:15', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('31', '15', '2013-03-23 17:44:04', null, null, null, '0', 'PENDING', '0', '12', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('33', '15', '2013-03-23 17:54:04', null, null, null, '0', 'PENDING', '0', '14', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('34', '15', '2013-03-23 17:56:24', null, null, null, '0', 'PENDING', '0', '15', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('35', '15', '2013-03-23 17:58:08', null, null, null, '0', 'PENDING', '0', '16', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('36', '15', '2013-03-23 17:58:35', null, null, null, '0', 'PENDING', '0', '16', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('37', '15', '2013-03-23 17:58:44', null, null, null, '250', 'PENDING', '0', '16', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('38', '15', '2013-03-23 17:58:59', null, null, null, '250', 'PENDING', '0', '16', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('39', '15', '2013-03-23 22:06:41', null, null, null, '250', 'PENDING', '0', '17', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('40', '15', '2013-03-23 22:08:49', null, null, null, '240', 'PENDING', '0', '18', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('41', '15', '2013-03-23 22:10:52', null, null, null, '540', 'PENDING', '0', '19', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('42', '15', '2013-03-23 22:12:05', null, null, null, '240', 'PENDING', '0', '20', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('43', '15', '2013-03-23 22:15:45', null, null, null, '20', 'PENDING', '0', '23', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('44', '15', '2013-03-23 22:17:19', null, null, null, '400', 'PENDING', '0', '23', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('45', '15', '2013-03-23 22:22:42', null, null, null, '300', 'PENDING', '0', '23', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('46', '15', '2013-03-23 22:33:39', null, '2013-03-23 00:00:00', null, '30', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('47', '15', '2013-03-23 22:38:24', null, null, null, '0', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('48', '15', '2013-03-23 22:38:28', null, null, null, '0', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('49', '15', '2013-03-23 22:38:36', null, null, null, '300', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('50', '15', '2013-03-23 22:38:44', null, null, null, '0', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('51', '15', '2013-03-23 23:23:57', null, null, null, '0', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('52', '15', '2013-03-24 00:19:59', null, null, null, '0', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('53', '15', '2013-03-24 00:21:43', null, null, null, '0', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('54', '15', '2013-03-23 17:52:25', null, null, null, '0', 'PENDING', '0', '13', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('55', '15', '2013-03-24 00:23:48', null, null, null, '0', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('56', '15', '2013-03-24 00:24:12', null, null, null, '0', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('57', '15', '2013-03-24 00:24:23', null, null, null, '0', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('58', '15', '2013-03-24 00:33:56', null, null, null, '0', 'PURCHASED', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('59', '15', '2013-03-24 00:48:26', null, null, null, '0', 'PURCHASED', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('60', '15', '2013-03-24 01:00:41', null, null, null, '10', 'PENDING', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('61', '15', '2013-03-24 01:00:59', null, null, null, '10', 'PAYMENT_FAIL', '0', '24', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('62', '15', '2013-03-24 01:04:40', null, null, null, '10', 'PENDING', '0', '25', 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('63', '15', '2013-05-26 10:54:43', null, null, null, null, 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('64', '15', '2013-05-26 10:55:03', null, null, null, null, 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('65', '15', '2013-05-26 11:05:53', null, null, null, '0', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('66', '15', '2013-05-26 11:08:37', null, null, null, '29', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('67', '15', '2013-05-26 16:24:37', null, null, null, '19', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('68', '15', '2013-05-26 17:19:33', null, null, null, '19', 'PENDING', '0', null, 'SIX_MONTHLY');
INSERT INTO `Orders` VALUES ('69', '15', '2013-05-26 17:28:05', null, null, null, '29', 'PENDING', '0', null, 'MONTHLY');
INSERT INTO `Orders` VALUES ('70', '15', '2013-06-01 22:28:54', null, null, null, '41', 'PAYMENT_FAIL', '0', null, 'MONTHLY');
INSERT INTO `Orders` VALUES ('71', '15', '2013-06-04 23:34:05', null, null, null, '31', 'PENDING', '0', null, 'MONTHLY');
INSERT INTO `Orders` VALUES ('72', '15', '2013-06-04 23:34:22', null, null, null, '31', 'PENDING', '0', null, 'MONTHLY');
INSERT INTO `Orders` VALUES ('73', '15', '2013-06-04 23:39:04', null, null, null, '12', 'PENDING', '0', null, 'NONE');

-- ----------------------------
-- Table structure for `PageLangs`
-- ----------------------------
DROP TABLE IF EXISTS `PageLangs`;
CREATE TABLE `PageLangs` (
  `PageLangId` int(11) NOT NULL AUTO_INCREMENT,
  `PageName` varchar(250) DEFAULT NULL,
  `PageTitle` varchar(250) DEFAULT NULL,
  `PageContent` text,
  `Lang` varchar(2) DEFAULT NULL,
  `PageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`PageLangId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PageLangs
-- ----------------------------
INSERT INTO `PageLangs` VALUES ('1', 'gioi-thieu', 'Giới thiệu', '<p>\r\n	Giới thiệu</p>\r\n', 'vi', '1');
INSERT INTO `PageLangs` VALUES ('2', 'about-us', 'About Us', '<p>\r\n	About Us Page</p>\r\n', 'en', '1');
INSERT INTO `PageLangs` VALUES ('9', 'Terms of Use', 'Terms of Use', '<p>\r\n	Terms of use</p>\r\n', 'en', '16');
INSERT INTO `PageLangs` VALUES ('10', 'dieu-le', 'ĐIều lệ', '<p>\r\n	Điều lệ</p>\r\n', 'vi', '16');
INSERT INTO `PageLangs` VALUES ('11', 'Test new Page', 'Test new Page', '<p>\r\n	Test new Page</p>\r\n', 'en', '17');
INSERT INTO `PageLangs` VALUES ('12', 'Pravicy Information', 'Pravicy Information', '<p>\r\n	Pravicy Information</p>\r\n', 'en', '18');
INSERT INTO `PageLangs` VALUES ('13', 'Bảo mật', 'Bảo mật', '<p>\r\n	Bảo mật</p>\r\n', 'vi', '18');
INSERT INTO `PageLangs` VALUES ('14', 'Licensing Information', 'Licensing Information', '<p>\r\n	Licensing Information</p>\r\n', 'en', '19');
INSERT INTO `PageLangs` VALUES ('15', 'Bản quyền', 'Bản quyền', '<p>\r\n	Bản quyền</p>\r\n', 'vi', '19');
INSERT INTO `PageLangs` VALUES ('16', 'Affiliates', 'Affiliates', '<p>\r\n	We are buiding affiliates system.</p>\r\n', 'en', '20');
INSERT INTO `PageLangs` VALUES ('17', 'Affiliates', 'Affiliates', '<p>\r\n	X&acirc;y dựng hệ thống affiliates.</p>\r\n', 'vi', '20');
INSERT INTO `PageLangs` VALUES ('18', 'Sitemap', 'Sitemap', '<p>\r\n	Sitemap</p>\r\n', 'en', '21');
INSERT INTO `PageLangs` VALUES ('19', 'Sitemap', 'Sitemap', '<p>\r\n	Sitemap</p>\r\n', 'vi', '21');
INSERT INTO `PageLangs` VALUES ('20', 'Orders', 'Orders', '<p>\r\n	You can order template from system.</p>\r\n', 'en', '23');
INSERT INTO `PageLangs` VALUES ('21', 'Hóa đơn', 'Hóa đơn', '<p>\r\n	Bạn c&oacute; thể order trong tr&ecirc;n hệ thống của ch&uacute;ng t&ocirc;i.</p>\r\n', 'vi', '23');
INSERT INTO `PageLangs` VALUES ('22', 'Price', 'Price', '<p>\r\n	Price for product</p>\r\n', 'en', '24');
INSERT INTO `PageLangs` VALUES ('23', 'Giá cả', 'Giá cả', '<p>\r\n	Mua b&aacute;n sản phẩm gi&aacute; cả</p>\r\n', 'vi', '24');

-- ----------------------------
-- Table structure for `Pages`
-- ----------------------------
DROP TABLE IF EXISTS `Pages`;
CREATE TABLE `Pages` (
  `PageId` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `UpdateDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `PageCode` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PageId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Pages
-- ----------------------------
INSERT INTO `Pages` VALUES ('1', '2013-03-15 14:59:41', null, '1', '0', 'about-us');
INSERT INTO `Pages` VALUES ('16', null, null, '1', '0', 'terms-of-use');
INSERT INTO `Pages` VALUES ('18', null, null, '1', '0', 'pravicy-information');
INSERT INTO `Pages` VALUES ('19', null, null, '1', '0', 'licensing-information');
INSERT INTO `Pages` VALUES ('20', null, null, '1', '0', 'affiliates');
INSERT INTO `Pages` VALUES ('21', null, null, '1', '0', 'sitemap');
INSERT INTO `Pages` VALUES ('23', null, null, '1', '0', 'order');
INSERT INTO `Pages` VALUES ('24', null, null, '1', '0', 'price');

-- ----------------------------
-- Table structure for `PaymentMethods`
-- ----------------------------
DROP TABLE IF EXISTS `PaymentMethods`;
CREATE TABLE `PaymentMethods` (
  `PaymentMethodId` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentMehtodName` varchar(250) DEFAULT NULL,
  `Class` varchar(200) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `PaymentMethodCode` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`PaymentMethodId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PaymentMethods
-- ----------------------------
INSERT INTO `PaymentMethods` VALUES ('1', 'Paypal', 'Vts_Payment_Paypal', '2013-03-17 17:57:43', null, '1', '0', 'paypal');
INSERT INTO `PaymentMethods` VALUES ('2', 'Ngân Lượng', 'Vts_Payment_NganLuong', '2013-03-17 18:22:48', null, '0', '0', 'nganluong');
INSERT INTO `PaymentMethods` VALUES ('3', 'Bảo Kim', 'Vts_Payment_BaoKiem', '2013-03-17 18:22:49', null, '0', '0', 'baokim');

-- ----------------------------
-- Table structure for `Payments`
-- ----------------------------
DROP TABLE IF EXISTS `Payments`;
CREATE TABLE `Payments` (
  `PaymentId` int(11) NOT NULL AUTO_INCREMENT,
  `Params` varchar(255) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` datetime DEFAULT NULL,
  `PayerEmail` varchar(250) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `ItemName` varchar(250) DEFAULT NULL,
  `ItemQuality` varchar(255) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`PaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Payments
-- ----------------------------

-- ----------------------------
-- Table structure for `PaypalTransactions`
-- ----------------------------
DROP TABLE IF EXISTS `PaypalTransactions`;
CREATE TABLE `PaypalTransactions` (
  `PaymentId` int(11) DEFAULT NULL,
  `payment_type` varchar(200) DEFAULT NULL,
  `payment_date` varchar(200) DEFAULT NULL,
  `payment_status` varchar(200) DEFAULT NULL,
  `pending_reason` varchar(200) DEFAULT NULL,
  `address_status` varchar(200) DEFAULT NULL,
  `payer_status` varchar(200) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `payer_email` varchar(200) DEFAULT NULL,
  `payer_id` varchar(200) DEFAULT NULL,
  `address_name` varchar(200) DEFAULT NULL,
  `address_country_code` varchar(200) DEFAULT NULL,
  `address_zip` varchar(200) DEFAULT NULL,
  `address_state` varchar(200) DEFAULT NULL,
  `address_city` varchar(200) DEFAULT NULL,
  `address_street` varchar(200) DEFAULT NULL,
  `business` varchar(200) DEFAULT NULL,
  `receiver_email` varchar(200) DEFAULT NULL,
  `receiver_id` varchar(200) DEFAULT NULL,
  `residence_country` varchar(200) DEFAULT NULL,
  `item_name` varchar(200) DEFAULT NULL,
  `item_number` varchar(200) DEFAULT NULL,
  `item_name1` varchar(200) DEFAULT NULL,
  `item_number1` varchar(200) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantity1` int(11) DEFAULT NULL,
  `shipping` varchar(200) DEFAULT NULL,
  `tax` varchar(200) DEFAULT NULL,
  `mc_currency` varchar(200) DEFAULT NULL,
  `mc_fee` varchar(200) DEFAULT NULL,
  `mc_gross` varchar(200) DEFAULT NULL,
  `mc_gross1` varchar(200) DEFAULT NULL,
  `mc_handling` varchar(200) DEFAULT NULL,
  `mc_handling1` varchar(200) DEFAULT NULL,
  `mc_shipping` varchar(200) DEFAULT NULL,
  `mc_shipping1` varchar(200) DEFAULT NULL,
  `txn_type` varchar(200) DEFAULT NULL,
  `txn_id` varchar(200) DEFAULT NULL,
  `parent_txn_id` varchar(200) DEFAULT NULL,
  `notify_version` varchar(200) DEFAULT NULL,
  `custom` varchar(200) DEFAULT NULL,
  `invoice` varchar(200) DEFAULT NULL,
  `PaypalTransactionId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PaypalTransactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PaypalTransactions
-- ----------------------------

-- ----------------------------
-- Table structure for `TemplateLangs`
-- ----------------------------
DROP TABLE IF EXISTS `TemplateLangs`;
CREATE TABLE `TemplateLangs` (
  `TemplateLangId` int(11) NOT NULL AUTO_INCREMENT,
  `TemplateName` varchar(100) DEFAULT NULL,
  `TemplateDescription` varchar(500) DEFAULT NULL,
  `Lang` varchar(2) DEFAULT NULL,
  `TemplateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`TemplateLangId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TemplateLangs
-- ----------------------------
INSERT INTO `TemplateLangs` VALUES ('4', 'Template 0001', '<p>\r\n	Current I just description</p>\r\n', 'en', '1');
INSERT INTO `TemplateLangs` VALUES ('5', 'Template 0001', '<p>\r\n	Đ&acirc;y l&agrave; template về thời trang</p>\r\n', 'vi', '1');
INSERT INTO `TemplateLangs` VALUES ('6', 'Template 0001', '<p>\r\n	Current I just description</p>\r\n', 'en', '1');
INSERT INTO `TemplateLangs` VALUES ('7', 'Template 0001', '<p>\r\n	Current I just description</p>\r\n', 'en', '1');
INSERT INTO `TemplateLangs` VALUES ('8', 'Template 0001', '<p>\r\n	Current I just description</p>\r\n', 'en', '1');
INSERT INTO `TemplateLangs` VALUES ('9', 'Template 0001', '<p>\r\n	Current I just description</p>\r\n', 'en', '1');
INSERT INTO `TemplateLangs` VALUES ('10', 'Template 0001', '<p>\r\n	Current I just description</p>\r\n', 'en', '1');
INSERT INTO `TemplateLangs` VALUES ('11', 'Template 0001', '<p>\r\n	Current I just description</p>\r\n', 'en', '1');
INSERT INTO `TemplateLangs` VALUES ('12', 'Template 0001', '<p>\r\n	Current I just description</p>\r\n', 'en', '1');
INSERT INTO `TemplateLangs` VALUES ('13', 'Fashsion 002', '<p>\r\n	This is detail of template</p>\r\n', 'en', '2');
INSERT INTO `TemplateLangs` VALUES ('14', 'Test emplate d', '<p>\r\n	Have problem hace</p>\r\n', 'en', '5');
INSERT INTO `TemplateLangs` VALUES ('15', 'Fashsion 003', '<p>\r\n	No price</p>\r\n', 'en', '3');
INSERT INTO `TemplateLangs` VALUES ('16', 'Test emplate d', '<p>\r\n	Have problem hace</p>\r\n', 'en', '5');
INSERT INTO `TemplateLangs` VALUES ('17', 'Fashsion 004', '<p>\r\n	Test template</p>\r\n', 'en', '4');
INSERT INTO `TemplateLangs` VALUES ('18', 'Fashsion 004', '<p>\r\n	Test template</p>\r\n', 'en', '4');
INSERT INTO `TemplateLangs` VALUES ('19', 'Fashsion 004', '<p>\r\n	Test template</p>\r\n', 'en', '4');
INSERT INTO `TemplateLangs` VALUES ('20', 'Fashsion 003', '<p>\r\n	No price</p>\r\n', 'en', '3');
INSERT INTO `TemplateLangs` VALUES ('21', 'Fashsion 003', '<p>\r\n	No price</p>\r\n', 'en', '3');
INSERT INTO `TemplateLangs` VALUES ('22', 'Fashsion 002', '<p>\r\n	This is detail of template</p>\r\n', 'en', '2');

-- ----------------------------
-- Table structure for `TemplatePhotos`
-- ----------------------------
DROP TABLE IF EXISTS `TemplatePhotos`;
CREATE TABLE `TemplatePhotos` (
  `TemplatePhotoId` int(11) NOT NULL AUTO_INCREMENT,
  `TemplatePhotoName` varchar(200) DEFAULT NULL,
  `PhotoFile` varchar(500) DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `TemplateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`TemplatePhotoId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TemplatePhotos
-- ----------------------------
INSERT INTO `TemplatePhotos` VALUES ('1', 'Home page', '2013-03-07_210622.png', '1', '0', '2013-03-08 22:10:27', '2013-03-08 22:10:31', '1');
INSERT INTO `TemplatePhotos` VALUES ('2', 'Product detail', '2013-03-07_210622.png', '1', '0', '2013-03-08 22:12:09', '2013-03-08 22:12:11', '1');
INSERT INTO `TemplatePhotos` VALUES ('3', 'Service', '2013-03-07_210622.png', '1', '0', '2013-03-08 22:14:01', '2013-03-08 22:14:03', '1');
INSERT INTO `TemplatePhotos` VALUES ('4', 'Home page', '2013-03-07_210642.png', '1', '0', '2013-03-08 22:14:14', '2013-03-08 22:14:16', '2');
INSERT INTO `TemplatePhotos` VALUES ('5', 'Product detail', '2013-03-07_210642.png', '1', '0', '2013-03-08 22:14:32', '2013-03-08 22:14:34', '2');

-- ----------------------------
-- Table structure for `Templates`
-- ----------------------------
DROP TABLE IF EXISTS `Templates`;
CREATE TABLE `Templates` (
  `TemplateId` int(11) NOT NULL AUTO_INCREMENT,
  `TemplateCode` varchar(10) DEFAULT NULL,
  `TemplateName` varchar(150) DEFAULT NULL,
  `ImageDefault` varchar(200) DEFAULT NULL,
  `IsFreeMember` tinyint(4) DEFAULT '1',
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `CreatedDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `UniqueCurrentPrice` decimal(10,0) DEFAULT NULL,
  `NormalPrice` decimal(10,0) DEFAULT NULL,
  `TemplateTypeId` int(11) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `TemplateDescription` text,
  `TemplateCodeName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TemplateId`),
  UNIQUE KEY `UniqueTemplateCodeName` (`TemplateCodeName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Templates
-- ----------------------------
INSERT INTO `Templates` VALUES ('1', '00001', 'Template 0001', 'bandothanhpho (1).gif', '1', '1', '0', '2013-03-08 12:45:13', '2013-03-08 12:45:18', '300', '0', '1', '1', '<p>\r\n	Current I just description</p>\r\n', '00001');
INSERT INTO `Templates` VALUES ('2', '00002', 'Fashsion 002', '2013-03-07_210659.png', '0', '1', '0', '2013-03-08 15:36:30', '2013-03-08 15:36:33', '0', '12', '1', '1', '<p>\r\n	This is detail of template</p>\r\n', '00002');
INSERT INTO `Templates` VALUES ('3', '00003', 'Fashsion 003', '2013-03-07_210650 (1).png', '1', '1', '0', '2013-03-08 15:37:18', '2013-03-08 15:37:21', '0', '0', '1', '2', '<p>\r\n	No price</p>\r\n', '00003');
INSERT INTO `Templates` VALUES ('4', '00004', 'Fashsion 004', '2013-03-07_210659.png', '1', '1', '0', '2013-03-08 15:40:06', '2013-03-08 15:40:08', '0', '0', '1', '3', '<p>\r\n	Test template</p>\r\n', '00004');
INSERT INTO `Templates` VALUES ('5', 'MT00012', 'Test emplate d', '2013-03-07_210659.png', '0', '1', '0', null, null, '100', '10', '1', '1', '<p>\r\n	Have problem hace</p>\r\n', 'Template Add form');

-- ----------------------------
-- Table structure for `TemplateTypes`
-- ----------------------------
DROP TABLE IF EXISTS `TemplateTypes`;
CREATE TABLE `TemplateTypes` (
  `TemplateTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `TemplateTypeName` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`TemplateTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TemplateTypes
-- ----------------------------
INSERT INTO `TemplateTypes` VALUES ('1', 'Companies', '2013-03-08 15:57:41', '2013-03-08 15:57:44', '1', '0');
INSERT INTO `TemplateTypes` VALUES ('2', 'E-Commerce  ', '2013-03-08 15:57:52', '2013-03-08 15:57:54', '1', '0');

-- ----------------------------
-- Table structure for `Users`
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(250) DEFAULT NULL,
  `Fullname` varchar(250) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `CountryCode` varchar(2) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` datetime DEFAULT NULL,
  `Token` varchar(255) DEFAULT NULL,
  `TokenExpireDate` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO `Users` VALUES ('15', 'nguyenvantien2009@gmail.com', 'Tiển Nguyễn Văn', 'b67caeadd08813208b511ac9a14ecc12', 'nguyenvantien2009@gmail.com', 'vi', '12 Nguyen Van Bao F4 Gò Váp', '1', '0', '2013-03-12 15:12:17', null, '4e5b82f5a466a16905d14d5c2bbe7622', '2013-05-25 06:10:16');
INSERT INTO `Users` VALUES ('16', 'tien.nguyen@kiss-concept.com', 'Huynh Thi My Xuyen', '202cb962ac59075b964b07152d234b70', 'huynhthimyxuyen@gmail.com', 'au', '75 Nguyễn Thị Thập', '1', '0', '2013-03-19 22:31:22', null, null, null);
INSERT INTO `Users` VALUES ('17', 'myxuyen', 'Huynh Thi My Xuyen', '202cb962ac59075b964b07152d234b70', 'huynhthimyxuyen123@gmail.com', 'vi', '12 Nguyen Van Bao F4 Gò Vấp', '1', '0', '2013-03-24 01:02:07', null, null, null);
INSERT INTO `Users` VALUES ('18', 'truongthanhsang@gmail.com', 'Truong Thanh Sang', 'e10adc3949ba59abbe56e057f20f883e', 'truongthanhsang@gmail.com', 'vi', '12 Nguyen Van Bao F4 Gò Váp', '1', '0', '2013-05-26 09:40:20', null, null, null);

-- ----------------------------
-- Table structure for `Websites`
-- ----------------------------
DROP TABLE IF EXISTS `Websites`;
CREATE TABLE `Websites` (
  `WebsiteId` int(11) NOT NULL AUTO_INCREMENT,
  `WebsiteName` varchar(250) DEFAULT NULL,
  `Domain` varchar(250) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `UserId` int(11) DEFAULT NULL,
  `WebsiteType` enum('INSITE','DOWNLOAD') DEFAULT 'INSITE',
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`WebsiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Websites
-- ----------------------------
INSERT INTO `Websites` VALUES ('4', null, 'tiennguyen.com', null, null, '1', '0', null, 'INSITE', null);
INSERT INTO `Websites` VALUES ('5', null, 'tiennguyen12.com', null, null, '1', '0', null, 'INSITE', null);
INSERT INTO `Websites` VALUES ('6', null, 'nguyenvantien123.com', null, null, '1', '0', '12', 'INSITE', null);
INSERT INTO `Websites` VALUES ('7', null, 'nguyenvantien1234.com', null, null, '1', '0', '12', 'INSITE', null);
INSERT INTO `Websites` VALUES ('8', null, 'test.com', null, null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('9', null, 'testm3.com', null, null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('10', null, 'test123.com', null, null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('11', null, 'test345.com', null, null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('12', null, 'testwebsite.com', null, null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('13', null, 'testwebsite12.com', null, null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('14', null, 'testwebsite89.com', null, null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('15', null, 'testwwebs.com', null, null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('16', null, 'Testwwbeiste.com', null, null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('17', null, 'testcom.com', null, null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('18', null, 'thiscom.com', null, null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('19', null, 'testmen.com', '2013-03-23 22:10:52', null, '1', '0', '15', 'DOWNLOAD', null);
INSERT INTO `Websites` VALUES ('20', null, 'tincong.com', '2013-03-23 22:12:05', null, '1', '0', '15', 'DOWNLOAD', null);
INSERT INTO `Websites` VALUES ('21', null, 'testcom23.com', '2013-03-23 22:12:41', null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('22', null, 'hsafdysahd.com', '2013-03-23 22:13:32', null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('23', null, 'thanhpho.com', '2013-03-23 22:15:43', null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('24', null, 'testwebsite123.com', '2013-03-23 22:33:37', null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('25', null, 'huynhthimyxuyen.com', '2013-03-24 01:02:32', null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('26', null, 'truongngocanh.com', '2013-05-25 21:26:24', null, '1', '0', null, 'INSITE', null);
INSERT INTO `Websites` VALUES ('27', 'Fashsion 002', 'Fashsion 002', '2013-06-03 22:48:47', null, '1', '0', '15', 'INSITE', null);
INSERT INTO `Websites` VALUES ('30', 'test123123.com', 'test123123.com', '2013-06-03 23:04:11', null, '1', '0', '15', 'INSITE', null);
