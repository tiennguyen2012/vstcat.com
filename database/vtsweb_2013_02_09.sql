/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : vtsweb

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-03-09 14:53:09
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO `Users` VALUES ('1', 'nguyenvantien2009@gmail.com', 'Tiển Nguyễn Văn', '123', 'nguyenvantien2009@gmail.com', 'vi', '12 Nguyen Van Bao F4 Gò Váp', '1', '0', '2013-03-09 13:23:20', null);
INSERT INTO `Users` VALUES ('2', 'tiennguyen', 'Tiển Nguyễn Văn', '123', 'nguyenvantien@gmail.com', 'vi', '12 Nguyen Van Bao F4 Gò Váp', '1', '0', '2013-03-09 13:32:20', null);
INSERT INTO `Users` VALUES ('3', 'tien', 'Tiển Nguyễn Văn', '202cb962ac59075b964b07152d234b70', 'tien.nguyen@kiss-concept.com', 'vi', '12 Nguyen Van Bao F4 Gò Váp', '1', '0', '2013-03-09 13:34:16', null);
INSERT INTO `Users` VALUES ('4', 'myxuyen', 'Huynh Thi My Xuyen', '202cb962ac59075b964b07152d234b70', 'huynhthimyxuyen@gmail.com', 'vi', '12 Nguyen Van Bao F4 Gò Váp', '1', '0', '2013-03-09 13:58:04', null);
INSERT INTO `Users` VALUES ('5', 'tiennguyenkiss', 'Nguyen Van Tien', '202cb962ac59075b964b07152d234b70', 'tiennguyenkiss@kiss-concept.com', 'vi', '12 Nguyen Van Bao F4 Gò Váp', '1', '0', '2013-03-09 14:24:12', null);
INSERT INTO `Users` VALUES ('6', 'tien123', 'Nguyen Van Tien', '202cb962ac59075b964b07152d234b70', 'tincongnghevn1@gmail.com', 'vi', '12 Nguyen Van Bao F4 Gò Váp', '1', '0', '2013-03-09 14:32:52', null);
INSERT INTO `Users` VALUES ('7', 'test@gmail.com', 'dfdf', '202cb962ac59075b964b07152d234b70', 'sadsad@gmail.com', 'au', 'sdasd', '1', '0', '2013-03-09 14:33:40', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Websites
-- ----------------------------
INSERT INTO `Websites` VALUES ('4', null, 'tiennguyen.com', null, null, '1', '0', null);
INSERT INTO `Websites` VALUES ('5', null, 'tiennguyen12.com', null, null, '1', '0', null);
