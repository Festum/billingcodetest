/*
Navicat MySQL Data Transfer

Source Server         : Docker
Source Server Version : 50716
Source Host           : 192.168.126.132:3306
Source Database       : billingtest

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-11-30 16:12:29
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `billingtest` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `billingtest`;

-- ----------------------------
-- Table structure for customer_to_invoice
-- ----------------------------
DROP TABLE IF EXISTS `customer_to_invoice`;
CREATE TABLE `customer_to_invoice` (
  `zoho_books_contact_id` varchar(100) NOT NULL,
  PRIMARY KEY (`zoho_books_contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_to_invoice
-- ----------------------------
INSERT INTO `customer_to_invoice` VALUES ('ZBCID0000001');
INSERT INTO `customer_to_invoice` VALUES ('ZBCID0000002');
INSERT INTO `customer_to_invoice` VALUES ('ZBCID0000003');
INSERT INTO `customer_to_invoice` VALUES ('ZBCID0000004');
INSERT INTO `customer_to_invoice` VALUES ('ZBCID0000005');

-- ----------------------------
-- Table structure for lines_to_invoice
-- ----------------------------
DROP TABLE IF EXISTS `lines_to_invoice`;
CREATE TABLE `lines_to_invoice` (
  `zoho_books_contact_id` varchar(100) NOT NULL,
  `device_serial_number` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `rate` decimal(11,2) NOT NULL,
  PRIMARY KEY (`zoho_books_contact_id`,`device_serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lines_to_invoice
-- ----------------------------
INSERT INTO `lines_to_invoice` VALUES ('ZBCID0000001', 'DSN0000001', 'Contract: C0000001, Serial Number: DSN0000001, Mono Pages: 201 (0.11 per page), Colour Pages: 101 (0.21 per page)', '5.72');
INSERT INTO `lines_to_invoice` VALUES ('ZBCID0000001', 'DSN0000005', 'Contract: C0000005, Serial Number: DSN0000005, Mono Pages: 205 (0.15 per page), Colour Pages: 105 (0.25 per page)', '9.00');
INSERT INTO `lines_to_invoice` VALUES ('ZBCID0000002', 'DSN0000002', 'Contract: C0000002, Serial Number: DSN0000002, Mono Pages: 201 (0.12 per page), Colour Pages: 101 (0.22 per page)', '6.48');
INSERT INTO `lines_to_invoice` VALUES ('ZBCID0000003', 'DSN0000003', 'Contract: C0000003, Serial Number: DSN0000003, Mono Pages: 203 (0.13 per page), Colour Pages: 103 (0.23 per page)', '7.28');
INSERT INTO `lines_to_invoice` VALUES ('ZBCID0000004', 'DSN0000004', 'Contract: C0000004, Serial Number: DSN0000004, Mono Pages: 203 (0.14 per page), Colour Pages: 103 (0.24 per page)', '8.12');
