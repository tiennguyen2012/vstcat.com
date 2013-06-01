-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 01, 2013 at 02:37 PM
-- Server version: 5.5.31
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vtscat.com`
--

-- --------------------------------------------------------

--
-- Table structure for table `AccountTypes`
--

CREATE TABLE IF NOT EXISTS `AccountTypes` (
  `AccountTypeId` int(11) NOT NULL DEFAULT '0',
  `AccountTypeName` varchar(250) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `AccountTypeCode` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`AccountTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AccountTypes`
--

INSERT INTO `AccountTypes` (`AccountTypeId`, `AccountTypeName`, `Price`, `IsActive`, `AccountTypeCode`) VALUES
(1, 'Personal', 19, 1, 'PERSONAL'),
(2, 'Business', 29, 1, 'BUSINESS'),
(3, 'G-Business', 39, 1, 'G-BUSINESS');

-- --------------------------------------------------------

--
-- Table structure for table `Affiliates`
--

CREATE TABLE IF NOT EXISTS `Affiliates` (
  `AffiliateId` int(11) NOT NULL DEFAULT '0',
  `UserId` int(11) DEFAULT NULL,
  `AffiliateCode` varchar(250) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `UpdateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`AffiliateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Categorys`
--

CREATE TABLE IF NOT EXISTS `Categorys` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Categorys`
--

INSERT INTO `Categorys` (`CategoryId`, `CategoryName`, `CreatedDate`, `UpdatedDate`, `IsActive`, `IsDeleted`) VALUES
(1, 'Restaurants & Hotels', '2013-03-08 15:51:12', '2013-03-08 15:51:15', 1, 0),
(2, 'Companies & Educations', '2013-03-08 15:52:05', '2013-03-08 15:52:08', 1, 0),
(3, 'Fashsions & Shoes', '2013-03-08 15:53:33', '2013-03-08 15:53:36', 1, 0),
(4, 'Beers & Wines', '2013-05-23 21:24:30', '2013-05-23 21:24:33', 1, 0),
(5, 'Cars & Motos', '2013-05-23 21:27:13', '2013-05-23 21:27:16', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Contacts`
--

CREATE TABLE IF NOT EXISTS `Contacts` (
  `ContactId` int(11) NOT NULL AUTO_INCREMENT,
  `Fullname` varchar(250) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CountryCode` varchar(2) DEFAULT NULL,
  `Content` varchar(500) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ContactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Countrys`
--

CREATE TABLE IF NOT EXISTS `Countrys` (
  `CountryId` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(250) DEFAULT NULL,
  `CountryCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Countrys`
--

INSERT INTO `Countrys` (`CountryId`, `CountryName`, `CountryCode`) VALUES
(1, 'Vietnam', 'vi'),
(2, 'Australia', 'au'),
(3, 'Unit State America', 'us');

-- --------------------------------------------------------

--
-- Table structure for table `Languages`
--

CREATE TABLE IF NOT EXISTS `Languages` (
  `LanguageId` int(11) NOT NULL AUTO_INCREMENT,
  `LanguageName` varchar(150) DEFAULT NULL,
  `LanguageCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`LanguageId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Languages`
--

INSERT INTO `Languages` (`LanguageId`, `LanguageName`, `LanguageCode`) VALUES
(1, 'Tiếng Việt', 'vi'),
(2, 'English', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `Members`
--

CREATE TABLE IF NOT EXISTS `Members` (
  `MemberId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`MemberId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Members`
--

INSERT INTO `Members` (`MemberId`, `UserId`, `StartDate`, `EndDate`, `IsActive`, `IsDeleted`) VALUES
(1, 15, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ModuleCategorys`
--

CREATE TABLE IF NOT EXISTS `ModuleCategorys` (
  `ModuleCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `ModuleCategoryName` varchar(200) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `Image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ModuleCategoryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ModuleCategorys`
--

INSERT INTO `ModuleCategorys` (`ModuleCategoryId`, `ModuleCategoryName`, `CreatedDate`, `UpdatedDate`, `IsActive`, `IsDeleted`, `Image`) VALUES
(1, 'Payment', '2013-03-09 00:44:41', '2013-03-09 00:44:43', 1, 0, NULL),
(2, 'Permission', '2013-03-09 00:45:23', '2013-03-09 00:45:25', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Modules`
--

CREATE TABLE IF NOT EXISTS `Modules` (
  `ModuleId` int(11) NOT NULL AUTO_INCREMENT,
  `ModuleName` varchar(200) DEFAULT NULL,
  `ModuleDescription` varchar(250) DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ModuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `OrderDetails`
--

CREATE TABLE IF NOT EXISTS `OrderDetails` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `OrderDetails`
--

INSERT INTO `OrderDetails` (`OrderDetailId`, `OrderId`, `ItemName`, `ItemQuality`, `Price`, `PriceType`, `ItemId`, `ItemType`, `ItemCode`, `Options`) VALUES
(31, 42, 'Fashsion 001', 1, 240, 'NORMAL', 1, '', NULL, NULL),
(32, 43, 'Fashsion 001', 1, 20, 'NORMAL', 1, '', NULL, NULL),
(33, 44, 'Fashsion 002', 1, 400, 'UNIQUE', 2, 'TEMPLATE', NULL, NULL),
(34, 45, 'Fashsion 001', 1, 300, 'UNIQUE', 1, 'TEMPLATE', '00001', NULL),
(35, 46, 'Fashsion 003', 1, 30, 'NORMAL', 3, '', '00003', NULL),
(36, 47, 'Fashsion 001', 1, 0, 'NORMAL', 1, 'TEMPLATE', '00001', NULL),
(37, 48, 'Fashsion 001', 1, 0, 'NORMAL', 1, 'TEMPLATE', '00001', NULL),
(38, 49, 'Fashsion 001', 1, 300, 'UNIQUE', 1, 'TEMPLATE', '00001', NULL),
(39, 50, 'Fashsion 001', 1, 0, 'NORMAL', 1, 'TEMPLATE', '00001', NULL),
(40, 51, 'Fashsion 001', 1, 0, 'NORMAL', 1, 'TEMPLATE', '00001', NULL),
(41, 52, 'Fashsion 001', 1, 0, 'NORMAL', 1, 'TEMPLATE', '00001', NULL),
(42, 53, 'Fashsion 001', 1, 0, 'NORMAL', 1, 'TEMPLATE', '00001', NULL),
(43, 55, 'Fashsion 001', 1, 0, 'NORMAL', 1, 'TEMPLATE', '00001', NULL),
(44, 56, 'Fashsion 001', 1, 0, 'NORMAL', 1, 'TEMPLATE', '00001', NULL),
(45, 57, 'Fashsion 001', 1, 0, 'NORMAL', 1, 'TEMPLATE', '00001', NULL),
(46, 58, 'Fashsion 001', 1, 0, 'NORMAL', 1, 'TEMPLATE', '00001', NULL),
(47, 59, 'Fashsion 001', 1, 0, 'NORMAL', 1, 'TEMPLATE', '00001', NULL),
(48, 60, 'Fashsion 003', 1, 10, 'NORMAL', 3, 'TEMPLATE', '00003', NULL),
(49, 61, 'Fashsion 003', 1, 10, 'NORMAL', 3, 'TEMPLATE', '00003', NULL),
(50, 62, 'Fashsion 003', 1, 10, 'NORMAL', 3, 'TEMPLATE', '00003', NULL),
(51, 64, NULL, 1, 0, 'FREE', 2, 'TEMPLATE', '00002', NULL),
(52, 64, NULL, 1, 19, 'PERSONAL', 1, 'ACCOUNT_TYPE', 'PERSONAL', NULL),
(53, 64, NULL, 1, 0, '', 0, 'DOMAIN', '', NULL),
(54, 65, NULL, 1, 0, 'FREE', 2, 'TEMPLATE', '00002', NULL),
(55, 65, 'Business', 1, 29, 'BUSINESS', 2, 'ACCOUNT_TYPE', 'BUSINESS', NULL),
(56, 65, 'thanhnienvietnam.com', 1, 0, '', 0, 'DOMAIN', '', NULL),
(57, 66, 'Fashsion 002', 1, 0, 'FREE', 2, 'TEMPLATE', '00002', NULL),
(58, 66, 'Business', 1, 29, 'BUSINESS', 2, 'ACCOUNT_TYPE', 'BUSINESS', NULL),
(59, 66, 'truongthanhsang.com', 1, 0, '', 0, 'DOMAIN', '', NULL),
(60, 67, 'Fashsion 002', 1, 0, 'FREE', 2, 'TEMPLATE', '00002', NULL),
(61, 67, 'Personal', 1, 19, 'PERSONAL', 1, 'ACCOUNT_TYPE', 'PERSONAL', NULL),
(62, 67, 'truongthanhsang.com', 1, 0, '', 0, 'DOMAIN', '', NULL),
(63, 68, 'Fashsion 002', 1, 0, 'FREE', 2, 'TEMPLATE', '00002', NULL),
(64, 68, 'Personal', 1, 19, 'PERSONAL', 1, 'ACCOUNT_TYPE', 'PERSONAL', 'SIX_MONTHLY'),
(65, 68, 'truongthanhsang.com', 1, 0, '', 0, 'DOMAIN', '', NULL),
(66, 69, 'Fashsion 002', 1, 0, 'FREE', 2, 'TEMPLATE', '00002', NULL),
(67, 69, 'Business', 1, 29, 'BUSINESS', 2, 'ACCOUNT_TYPE', 'BUSINESS', 'MONTHLY'),
(68, 69, 'nguyevantien2009.com', 1, 0, '', 0, 'DOMAIN', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE IF NOT EXISTS `Orders` (
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
  `CycleBilling` enum('TWO_YEARLY','YEARLY','SIX_MONTHLY','MONTHLY') DEFAULT 'SIX_MONTHLY',
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderId`, `UserId`, `CreatedDate`, `UpdatedDate`, `StartDate`, `EndDate`, `TotalPrice`, `OrderStatus`, `IsDeleted`, `WebsiteId`, `CycleBilling`) VALUES
(37, 15, '2013-03-23 13:58:44', NULL, NULL, NULL, 250, 'PENDING', 0, 16, 'SIX_MONTHLY'),
(38, 15, '2013-03-23 13:58:59', NULL, NULL, NULL, 250, 'PENDING', 0, 16, 'SIX_MONTHLY'),
(39, 15, '2013-03-23 18:06:41', NULL, NULL, NULL, 250, 'PENDING', 0, 17, 'SIX_MONTHLY'),
(40, 15, '2013-03-23 18:08:49', NULL, NULL, NULL, 240, 'PENDING', 0, 18, 'SIX_MONTHLY'),
(41, 15, '2013-03-23 18:10:52', NULL, NULL, NULL, 540, 'PENDING', 0, 19, 'SIX_MONTHLY'),
(42, 15, '2013-03-23 18:12:05', NULL, NULL, NULL, 240, 'PENDING', 0, 20, 'SIX_MONTHLY'),
(43, 15, '2013-03-23 18:15:45', NULL, NULL, NULL, 20, 'PENDING', 0, 23, 'SIX_MONTHLY'),
(44, 15, '2013-03-23 18:17:19', NULL, NULL, NULL, 400, 'PENDING', 0, 23, 'SIX_MONTHLY'),
(45, 15, '2013-03-23 18:22:42', NULL, NULL, NULL, 300, 'PENDING', 0, 23, 'SIX_MONTHLY'),
(46, 15, '2013-03-23 18:33:39', NULL, '2013-03-23 00:00:00', NULL, 30, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(47, 15, '2013-03-23 18:38:24', NULL, NULL, NULL, 0, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(48, 15, '2013-03-23 18:38:28', NULL, NULL, NULL, 0, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(49, 15, '2013-03-23 18:38:36', NULL, NULL, NULL, 300, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(50, 15, '2013-03-23 18:38:44', NULL, NULL, NULL, 0, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(51, 15, '2013-03-23 19:23:57', NULL, NULL, NULL, 0, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(52, 15, '2013-03-23 20:19:59', NULL, NULL, NULL, 0, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(53, 15, '2013-03-23 20:21:43', NULL, NULL, NULL, 0, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(54, 15, '2013-03-23 13:52:25', NULL, NULL, NULL, 0, 'PENDING', 0, 13, 'SIX_MONTHLY'),
(55, 15, '2013-03-23 20:23:48', NULL, NULL, NULL, 0, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(56, 15, '2013-03-23 20:24:12', NULL, NULL, NULL, 0, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(57, 15, '2013-03-23 20:24:23', NULL, NULL, NULL, 0, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(58, 15, '2013-03-23 20:33:56', NULL, NULL, NULL, 0, 'PURCHASED', 0, 24, 'SIX_MONTHLY'),
(59, 15, '2013-03-23 20:48:26', NULL, NULL, NULL, 0, 'PURCHASED', 0, 24, 'SIX_MONTHLY'),
(60, 15, '2013-03-23 21:00:41', NULL, NULL, NULL, 10, 'PENDING', 0, 24, 'SIX_MONTHLY'),
(61, 15, '2013-03-23 21:00:59', NULL, NULL, NULL, 10, 'PAYMENT_FAIL', 0, 24, 'SIX_MONTHLY'),
(62, 15, '2013-03-23 21:04:40', NULL, NULL, NULL, 10, 'PENDING', 0, 25, 'SIX_MONTHLY'),
(63, 15, '2013-05-26 06:54:43', NULL, NULL, NULL, NULL, 'PENDING', 0, NULL, 'SIX_MONTHLY'),
(64, 15, '2013-05-26 06:55:03', NULL, NULL, NULL, NULL, 'PENDING', 0, NULL, 'SIX_MONTHLY'),
(65, 15, '2013-05-26 07:05:53', NULL, NULL, NULL, 0, 'PENDING', 0, NULL, 'SIX_MONTHLY'),
(66, 15, '2013-05-26 07:08:37', NULL, NULL, NULL, 29, 'PENDING', 0, NULL, 'SIX_MONTHLY'),
(67, 15, '2013-05-26 12:24:37', NULL, NULL, NULL, 19, 'PENDING', 0, NULL, 'SIX_MONTHLY'),
(68, 15, '2013-05-26 13:19:33', NULL, NULL, NULL, 19, 'PENDING', 0, NULL, 'SIX_MONTHLY'),
(69, 15, '2013-05-26 13:28:05', NULL, NULL, NULL, 29, 'PENDING', 0, NULL, 'MONTHLY');

-- --------------------------------------------------------

--
-- Table structure for table `PageLangs`
--

CREATE TABLE IF NOT EXISTS `PageLangs` (
  `PageLangId` int(11) NOT NULL AUTO_INCREMENT,
  `PageName` varchar(250) DEFAULT NULL,
  `PageTitle` varchar(250) DEFAULT NULL,
  `PageContent` text,
  `Lang` varchar(2) DEFAULT NULL,
  `PageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`PageLangId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `PageLangs`
--

INSERT INTO `PageLangs` (`PageLangId`, `PageName`, `PageTitle`, `PageContent`, `Lang`, `PageId`) VALUES
(1, 'gioi-thieu', 'Giới thiệu', '<p>\r\n	Giới thiệu</p>\r\n', 'vi', 1),
(2, 'about-us', 'About Us', '<p>\r\n	VTSCat is a production of VTS Group. VTSCat help you manage manage your web site that you do not need to spend a lot of wasted costs for hosting and maintenance.</p>\r\n<p>\r\n	<u>To use a very simple vtscat</u>. You only need to register the account type, theme, and you will be supporting us to build your website (depending on the type of account you choose). You will be supporting our consulting and installation services for your business.</p>\r\n<p>\r\n	<u>Theme:</u> We always develop the theme you can change to suit your website depending on demand each time that you do not need to take any additional cost.</p>\r\n<p>\r\n	<u>Payment method</u>: You have more flexible payment methods to reduce unnecessary costs. For example: monthly, 6 months, 1 yearly&hellip; We will send email to you so that you can easily pay us.</p>\r\n<p>\r\n	<u>Support</u>: We will assist you to install, design, install additional counseling support program for your webmaster. You can use the support system and email to contact our help.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;VTS Cat<br />\r\n	Thanks.</p>\r\n', 'en', 1),
(9, 'Terms of Use', 'Terms of Use', '<p>\r\n	VTSCat with the conditions of use. Please fully read our terms before you sign up to use our services.</p>\r\n<p>\r\n	<strong>1.&nbsp;USE OF WEBSITE</strong></p>\r\n<ul>\r\n	<li>\r\n		You are permitted to use our website for your own purposes and to print and download material from this Website provided that you do not modify any content without our consent. Material on this website must not be republished online or offline without our permission.</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		The copyright and other intellectual property rights in all material on this Website are owned by us or our licensors and must not be reproduced without our prior consent.</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		Your website content is managed by you, we do not assume any liability for your content. You must be responsible before the law for all your content.</li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong>2.&nbsp;SITE UPTIME</strong></p>\r\n<ul>\r\n	<li>\r\n		We take all reasonable steps to ensure that this Website is available 24 hours every day, 365 days per year. However, websites do sometimes encounter downtime due to server and, other technical issues. Therefore we will not be liable if this website is unavailable at any time.</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		This Website may be temporarily unavailable due to issues such as system failure, maintenance or repair or for reasons beyond our control. Where possible we will try to give our visitors advance warning of maintenance issues but shall not be obliged to do so.</li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong>3.&nbsp;TYPE OF ACCOUNT</strong></p>\r\n<ul>\r\n	<li>\r\n		You need to pay us on time regulations. We will ensure your data after 10 days. If after 10 days you still do not pay we will delete your account. If you have special problems, please contact us by emai.</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		With all account types. After a period of time you will use 12 months with an option to download your code to install on your server. If there are special reasons for which you want to install on your server, please contact us by email.</li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	We will supplement the terms whenever we see invasive operation and security interests without prior notice to you.</p>\r\n<p>\r\n	VTSCat<br />\r\n	Thanks</p>\r\n', 'en', 16),
(10, 'dieu-le', 'ĐIều lệ', '<p>\r\n	Điều lệ</p>\r\n', 'vi', 16),
(11, 'Test new Page', 'Test new Page', '<p>\r\n	Test new Page</p>\r\n', 'en', 17),
(12, 'Pravicy Information', 'Pravicy Information', '<p>\r\n	Pravicy Information</p>\r\n', 'en', 18),
(13, 'Bảo mật', 'Bảo mật', '<p>\r\n	Bảo mật</p>\r\n', 'vi', 18),
(14, 'Licensing Information', 'Licensing Information', '<p>\r\n	Licensing Information</p>\r\n', 'en', 19),
(15, 'Bản quyền', 'Bản quyền', '<p>\r\n	Bản quyền</p>\r\n', 'vi', 19),
(16, 'Affiliates', 'Affiliates', '<p>\r\n	We are buiding affiliates system.</p>\r\n', 'en', 20),
(17, 'Affiliates', 'Affiliates', '<p>\r\n	X&acirc;y dựng hệ thống affiliates.</p>\r\n', 'vi', 20),
(18, 'Sitemap', 'Sitemap', '<ul>\r\n	<li>\r\n		<a href="http://www.vtscat.com/">Home</a>\r\n		<ul>\r\n			<li>\r\n				<a href="http://www.vtscat.com/template">Templates</a></li>\r\n			<li>\r\n				<a href="http://www.vtscat.com/module">Modules</a></li>\r\n			<li>\r\n				<a href="http://www.vtscat.com/document">Documents</a></li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<a href="http://www.vtscat.com/page/detail/code/about-us">About Us</a></li>\r\n	<li>\r\n		<a href="http://www.vtscat.com/page/detail/code/affiliates">Affiliates</a></li>\r\n	<li>\r\n		<a href="http://www.vtscat.com/page/detail/code/order">Orders</a></li>\r\n	<li>\r\n		<a href="http://www.vtscat.com/page/price">Price</a></li>\r\n	<li>\r\n		<a href="http://www.vtscat.com/contact">Contact</a></li>\r\n</ul>\r\n', 'en', 21),
(19, 'Sitemap', 'Sitemap', '<p>\r\n	Sitemap</p>\r\n', 'vi', 21),
(20, 'Orders', 'Orders', '<p>\r\n	You can order template from system.</p>\r\n', 'en', 23),
(21, 'Hóa đơn', 'Hóa đơn', '<p>\r\n	Bạn c&oacute; thể order trong tr&ecirc;n hệ thống của ch&uacute;ng t&ocirc;i.</p>\r\n', 'vi', 23),
(22, 'Price', 'Price', '<p>\r\n	Price for product</p>\r\n', 'en', 24),
(23, 'Giá cả', 'Giá cả', '<p>\r\n	Mua b&aacute;n sản phẩm gi&aacute; cả</p>\r\n', 'vi', 24);

-- --------------------------------------------------------

--
-- Table structure for table `Pages`
--

CREATE TABLE IF NOT EXISTS `Pages` (
  `PageId` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `UpdateDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `PageCode` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PageId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `Pages`
--

INSERT INTO `Pages` (`PageId`, `CreatedDate`, `UpdateDate`, `IsActive`, `IsDeleted`, `PageCode`) VALUES
(1, '2013-03-15 10:59:41', NULL, 1, 0, 'about-us'),
(16, '2013-06-01 07:15:46', NULL, 1, 0, 'terms-of-use'),
(18, NULL, NULL, 1, 0, 'pravicy-information'),
(19, NULL, NULL, 1, 0, 'licensing-information'),
(20, NULL, NULL, 1, 0, 'affiliates'),
(21, NULL, NULL, 1, 0, 'sitemap'),
(23, NULL, NULL, 1, 0, 'order'),
(24, NULL, NULL, 1, 0, 'price');

-- --------------------------------------------------------

--
-- Table structure for table `PaymentMethods`
--

CREATE TABLE IF NOT EXISTS `PaymentMethods` (
  `PaymentMethodId` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentMehtodName` varchar(250) DEFAULT NULL,
  `Class` varchar(200) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `PaymentMethodCode` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`PaymentMethodId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `PaymentMethods`
--

INSERT INTO `PaymentMethods` (`PaymentMethodId`, `PaymentMehtodName`, `Class`, `CreatedDate`, `UpdatedDate`, `IsActive`, `IsDeleted`, `PaymentMethodCode`) VALUES
(1, 'Paypal', 'Vts_Payment_Paypal', '2013-03-17 13:57:43', NULL, 1, 0, 'paypal'),
(2, 'Ngân Lượng', 'Vts_Payment_NganLuong', '2013-03-17 14:22:48', NULL, 0, 0, 'nganluong'),
(3, 'Bảo Kim', 'Vts_Payment_BaoKiem', '2013-03-17 14:22:49', NULL, 0, 0, 'baokim');

-- --------------------------------------------------------

--
-- Table structure for table `Payments`
--

CREATE TABLE IF NOT EXISTS `Payments` (
  `PaymentId` int(11) NOT NULL AUTO_INCREMENT,
  `Params` varchar(255) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` datetime DEFAULT NULL,
  `PayerEmail` varchar(250) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `ItemName` varchar(250) DEFAULT NULL,
  `ItemQuality` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PaypalTransactions`
--

CREATE TABLE IF NOT EXISTS `PaypalTransactions` (
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

-- --------------------------------------------------------

--
-- Table structure for table `TemplateLangs`
--

CREATE TABLE IF NOT EXISTS `TemplateLangs` (
  `TemplateLangId` int(11) NOT NULL AUTO_INCREMENT,
  `TemplateName` varchar(100) DEFAULT NULL,
  `TemplateDescription` varchar(500) DEFAULT NULL,
  `Lang` varchar(2) DEFAULT NULL,
  `TemplateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`TemplateLangId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- Table structure for table `TemplatePhotos`
--

CREATE TABLE IF NOT EXISTS `TemplatePhotos` (
  `TemplatePhotoId` int(11) NOT NULL AUTO_INCREMENT,
  `TemplatePhotoName` varchar(200) DEFAULT NULL,
  `PhotoFile` varchar(500) DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `TemplateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`TemplatePhotoId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `Templates`
--

CREATE TABLE IF NOT EXISTS `Templates` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `TemplateTypes`
--

CREATE TABLE IF NOT EXISTS `TemplateTypes` (
  `TemplateTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `TemplateTypeName` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT '1',
  `IsDeleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`TemplateTypeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `TemplateTypes`
--

INSERT INTO `TemplateTypes` (`TemplateTypeId`, `TemplateTypeName`, `CreatedDate`, `UpdatedDate`, `IsActive`, `IsDeleted`) VALUES
(1, 'Companies', '2013-03-08 15:57:41', '2013-03-08 15:57:44', 1, 0),
(2, 'E-Commerce  ', '2013-03-08 15:57:52', '2013-03-08 15:57:54', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserId`, `Username`, `Fullname`, `Password`, `Email`, `CountryCode`, `Address`, `IsActive`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Token`, `TokenExpireDate`) VALUES
(15, 'nguyenvantien2009@gmail.com', 'Tiển Nguyễn Văn', 'b67caeadd08813208b511ac9a14ecc12', 'nguyenvantien2009@gmail.com', 'vi', '12 Nguyen Van Bao F4 Gò Váp', 1, 0, '2013-03-12 11:12:17', NULL, '4e5b82f5a466a16905d14d5c2bbe7622', '2013-05-25 06:10:16'),
(16, 'tien.nguyen@kiss-concept.com', 'Huynh Thi My Xuyen', '202cb962ac59075b964b07152d234b70', 'huynhthimyxuyen@gmail.com', 'au', '75 Nguyễn Thị Thập', 1, 0, '2013-03-19 18:31:22', NULL, NULL, NULL),
(17, 'myxuyen', 'Huynh Thi My Xuyen', '202cb962ac59075b964b07152d234b70', 'huynhthimyxuyen123@gmail.com', 'vi', '12 Nguyen Van Bao F4 Gò Vấp', 1, 0, '2013-03-23 21:02:07', NULL, NULL, NULL),
(18, 'truongthanhsang@gmail.com', 'Truong Thanh Sang', 'e10adc3949ba59abbe56e057f20f883e', 'truongthanhsang@gmail.com', 'vi', '12 Nguyen Van Bao F4 Gò Váp', 1, 0, '2013-05-26 05:40:20', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Websites`
--

CREATE TABLE IF NOT EXISTS `Websites` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
