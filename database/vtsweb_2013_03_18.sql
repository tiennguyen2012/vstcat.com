/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : vtsweb

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-03-18 23:47:32
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Categorys
-- ----------------------------
INSERT INTO `Categorys` VALUES ('1', 'Companies', '2013-03-08 15:51:12', '2013-03-08 15:51:15', '1', '0');
INSERT INTO `Categorys` VALUES ('2', 'Restaurants & Hotels', '2013-03-08 15:52:05', '2013-03-08 15:52:08', '1', '0');
INSERT INTO `Categorys` VALUES ('3', 'Fashsions & Beautifull', '2013-03-08 15:53:33', '2013-03-08 15:53:36', '1', '0');

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
INSERT INTO `Languages` VALUES ('1', 'Vietnamese', 'vi');
INSERT INTO `Languages` VALUES ('2', 'English', 'en');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
INSERT INTO `PageLangs` VALUES ('16', 'Affiliates', 'Affiliates', '<p>\r\n	Affiliates</p>\r\n', 'en', '20');
INSERT INTO `PageLangs` VALUES ('17', 'Affiliates', 'Affiliates', '<p>\r\n	Affiliates</p>\r\n', 'vi', '20');
INSERT INTO `PageLangs` VALUES ('18', 'Sitemap', 'Sitemap', '<p>\r\n	Sitemap</p>\r\n', 'en', '21');
INSERT INTO `PageLangs` VALUES ('19', 'Sitemap', 'Sitemap', '<p>\r\n	Sitemap</p>\r\n', 'vi', '21');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Pages
-- ----------------------------
INSERT INTO `Pages` VALUES ('1', '2013-03-15 14:59:41', null, '1', '0', 'about-us');
INSERT INTO `Pages` VALUES ('16', null, null, '1', '0', 'terms-of-use');
INSERT INTO `Pages` VALUES ('18', null, null, '1', '0', 'pravicy-information');
INSERT INTO `Pages` VALUES ('19', null, null, '1', '0', 'licensing-information');
INSERT INTO `Pages` VALUES ('20', null, null, '1', '0', 'affiliates');
INSERT INTO `Pages` VALUES ('21', null, null, '1', '0', 'sitemap');

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
  PRIMARY KEY (`PaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Payments
-- ----------------------------

-- ----------------------------
-- Table structure for `PaypalTransaction`
-- ----------------------------
DROP TABLE IF EXISTS `PaypalTransaction`;
CREATE TABLE `PaypalTransaction` (
  `PaymentId` int(11) NOT NULL,
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
  PRIMARY KEY (`PaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PaypalTransaction
-- ----------------------------

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
  PRIMARY KEY (`TemplateId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Templates
-- ----------------------------
INSERT INTO `Templates` VALUES ('1', '00001', 'Fashsion 001', '2013-03-07_210622.png', '1', '1', '0', '2013-03-08 12:45:13', '2013-03-08 12:45:18', '300', null, '1', '1', 'This template have some problem with Iphone device');
INSERT INTO `Templates` VALUES ('2', '00002', 'Fashsion 002', '2013-03-07_210642.png', '1', '1', '0', '2013-03-08 15:36:30', '2013-03-08 15:36:33', '400', null, '1', '1', null);
INSERT INTO `Templates` VALUES ('3', '00003', 'Fashsion 003', '2013-03-07_210650.png', '0', '1', '0', '2013-03-08 15:37:18', '2013-03-08 15:37:21', '300', '10', '2', '2', null);
INSERT INTO `Templates` VALUES ('4', '00004', 'Fashsion 004', '2013-03-07_210659.png', '1', '1', '0', '2013-03-08 15:40:06', '2013-03-08 15:40:08', '250', null, '3', '3', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TemplateTypes
-- ----------------------------
INSERT INTO `TemplateTypes` VALUES ('1', 'CSS Template', '2013-03-08 15:57:41', '2013-03-08 15:57:44', '1', '0');
INSERT INTO `TemplateTypes` VALUES ('2', 'Flash Template', '2013-03-08 15:57:52', '2013-03-08 15:57:54', '1', '0');
INSERT INTO `TemplateTypes` VALUES ('3', 'Flash CSS Template', '2013-03-08 15:58:07', '2013-03-08 15:58:09', '1', '0');

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
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO `Users` VALUES ('15', 'nguyenvantien2009@gmail.com', 'Tiển Nguyễn Văn', '202cb962ac59075b964b07152d234b70', 'nguyenvantien2009@gmail.com', 'vi', '12 Nguyen Van Bao F4 Gò Váp', '1', '0', '2013-03-12 15:12:17', null);

-- ----------------------------
-- Table structure for `Websites`
-- ----------------------------
DROP TABLE IF EXISTS `Websites`;
CREATE TABLE `Websites` (
  `WebsiteId` int(11) NOT NULL AUTO_INCREMENT,
  `WebsiteName` varchar(250) DEFAULT NULL,
  `Domain` varchar(250) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`WebsiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Websites
-- ----------------------------
INSERT INTO `Websites` VALUES ('4', null, 'tiennguyen.com', null, null, '1', '0', null);
INSERT INTO `Websites` VALUES ('5', null, 'tiennguyen12.com', null, null, '1', '0', null);
INSERT INTO `Websites` VALUES ('6', null, 'nguyenvantien123.com', null, null, '1', '0', '12');
INSERT INTO `Websites` VALUES ('7', null, 'nguyenvantien1234.com', null, null, '1', '0', '12');
