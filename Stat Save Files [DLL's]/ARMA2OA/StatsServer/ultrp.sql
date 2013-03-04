/*
Navicat MySQL Data Transfer

Source Server         : Localhost (MYS)
Source Server Version : 50518
Source Host           : localhost:3306
Source Database       : ultrp

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2012-09-23 19:07:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `banking`
-- ----------------------------
DROP TABLE IF EXISTS `banking`;
CREATE TABLE `banking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `Balance` int(6) NOT NULL,
  `Side` int(1) DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of banking
-- ----------------------------

-- ----------------------------
-- Table structure for `banking_transactions`
-- ----------------------------
DROP TABLE IF EXISTS `banking_transactions`;
CREATE TABLE `banking_transactions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` int(1) NOT NULL,
  `SourceUID` int(11) NOT NULL,
  `TargetUID` int(11) NOT NULL,
  `Amount` int(6) NOT NULL,
  `Date` datetime NOT NULL,
  `Side` int(1) DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of banking_transactions
-- ----------------------------

-- ----------------------------
-- Table structure for `licenses`
-- ----------------------------
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `LicenseName` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of licenses
-- ----------------------------

-- ----------------------------
-- Table structure for `skills`
-- ----------------------------
DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `SkillID` int(1) NOT NULL,
  `Points` float(5,2) NOT NULL,
  `Side` int(1) DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of skills
-- ----------------------------

-- ----------------------------
-- Table structure for `storage`
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `ItemID` int(3) NOT NULL,
  `Amount` int(6) NOT NULL,
  `Side` int(1) DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of storage
-- ----------------------------
