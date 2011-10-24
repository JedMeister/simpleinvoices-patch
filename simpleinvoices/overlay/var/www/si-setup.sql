-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 10, 2011 at 02:48 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `simple_invoices`
--
/*CREATE DATABASE `simple_invoices` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci*/;
/*USE `simple_invoices`*/;

-- --------------------------------------------------------

--
-- Table structure for table `si_biller`
--

CREATE TABLE IF NOT EXISTS `si_biller` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8_unicode_ci,
  `paypal_business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_notify_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eway_customer_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `custom_field1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `si_biller`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_cron`
--

CREATE TABLE IF NOT EXISTS `si_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurrence` int(11) NOT NULL,
  `recurrence_type` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email_biller` int(1) DEFAULT NULL,
  `email_customer` int(1) DEFAULT NULL,
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `si_cron`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_cron_log`
--

CREATE TABLE IF NOT EXISTS `si_cron_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `cron_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `run_date` date NOT NULL,
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `si_cron_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_custom_fields`
--

CREATE TABLE IF NOT EXISTS `si_custom_fields` (
  `cf_id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_custom_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cf_custom_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cf_display` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `domain_id` int(11) NOT NULL,
  PRIMARY KEY (`cf_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `si_custom_fields`
--

INSERT INTO `si_custom_fields` (`cf_id`, `cf_custom_field`, `cf_custom_label`, `cf_display`, `domain_id`) VALUES
(1, 'biller_cf1', NULL, '0', 1),
(2, 'biller_cf2', NULL, '0', 1),
(3, 'biller_cf3', NULL, '0', 1),
(4, 'biller_cf4', NULL, '0', 1),
(5, 'customer_cf1', NULL, '0', 1),
(6, 'customer_cf2', NULL, '0', 1),
(7, 'customer_cf3', NULL, '0', 1),
(8, 'customer_cf4', NULL, '0', 1),
(9, 'product_cf1', NULL, '0', 1),
(10, 'product_cf2', NULL, '0', 1),
(11, 'product_cf3', NULL, '0', 1),
(12, 'product_cf4', NULL, '0', 1),
(13, 'invoice_cf1', NULL, '0', 1),
(14, 'invoice_cf2', NULL, '0', 1),
(15, 'invoice_cf3', NULL, '0', 1),
(16, 'invoice_cf4', NULL, '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `si_customers`
--

CREATE TABLE IF NOT EXISTS `si_customers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `attention` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_holder_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_expiry_month` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_expiry_year` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `custom_field1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `si_customers`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_extensions`
--

CREATE TABLE IF NOT EXISTS `si_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `si_extensions`
--

INSERT INTO `si_extensions` (`id`, `domain_id`, `name`, `description`, `enabled`) VALUES
(1, 0, 'core', 'Core part of Simple Invoices - always enabled', '1');

-- --------------------------------------------------------

--
-- Table structure for table `si_index`
--

CREATE TABLE IF NOT EXISTS `si_index` (
  `id` int(11) NOT NULL,
  `node` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_node` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_node_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `si_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_inventory`
--

CREATE TABLE IF NOT EXISTS `si_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(25,6) NOT NULL,
  `cost` decimal(25,6) DEFAULT NULL,
  `date` date NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `si_inventory`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_invoice_item_tax`
--

CREATE TABLE IF NOT EXISTS `si_invoice_item_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax_type` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `tax_rate` decimal(25,6) NOT NULL,
  `tax_amount` decimal(25,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `si_invoice_item_tax`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_invoice_items`
--

CREATE TABLE IF NOT EXISTS `si_invoice_items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) NOT NULL DEFAULT '0',
  `quantity` decimal(25,6) NOT NULL DEFAULT '0.000000',
  `product_id` int(10) DEFAULT '0',
  `unit_price` decimal(25,6) DEFAULT '0.000000',
  `tax_amount` decimal(25,6) DEFAULT '0.000000',
  `gross_total` decimal(25,6) DEFAULT '0.000000',
  `description` text COLLATE utf8_unicode_ci,
  `total` decimal(25,6) DEFAULT '0.000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `si_invoice_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_invoice_type`
--

CREATE TABLE IF NOT EXISTS `si_invoice_type` (
  `inv_ty_id` int(11) NOT NULL AUTO_INCREMENT,
  `inv_ty_description` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`inv_ty_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `si_invoice_type`
--

INSERT INTO `si_invoice_type` (`inv_ty_id`, `inv_ty_description`) VALUES
(1, 'Total'),
(2, 'Itemised'),
(3, 'Consulting');

-- --------------------------------------------------------

--
-- Table structure for table `si_invoices`
--

CREATE TABLE IF NOT EXISTS `si_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `index_id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `biller_id` int(10) NOT NULL DEFAULT '0',
  `customer_id` int(10) NOT NULL DEFAULT '0',
  `type_id` int(10) NOT NULL DEFAULT '0',
  `preference_id` int(10) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `custom_field1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`domain_id`,`id`),
  KEY `domain_id` (`domain_id`),
  KEY `biller_id` (`biller_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `si_invoices`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_log`
--

CREATE TABLE IF NOT EXISTS `si_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sqlquerie` text COLLATE utf8_unicode_ci NOT NULL,
  `last_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `si_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_payment`
--

CREATE TABLE IF NOT EXISTS `si_payment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ac_inv_id` int(11) NOT NULL,
  `ac_amount` decimal(25,6) NOT NULL,
  `ac_notes` text COLLATE utf8_unicode_ci NOT NULL,
  `ac_date` datetime NOT NULL,
  `ac_payment_type` int(10) NOT NULL DEFAULT '1',
  `domain_id` int(11) NOT NULL,
  `online_payment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`domain_id`,`id`),
  KEY `domain_id` (`domain_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `si_payment`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_payment_types`
--

CREATE TABLE IF NOT EXISTS `si_payment_types` (
  `pt_id` int(10) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `pt_description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `pt_enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain_id`,`pt_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `si_payment_types`
--

INSERT INTO `si_payment_types` (`pt_id`, `domain_id`, `pt_description`, `pt_enabled`) VALUES
(1, 1, 'Cash', '1'),
(2, 1, 'Credit Card', '1');

-- --------------------------------------------------------

--
-- Table structure for table `si_preferences`
--

CREATE TABLE IF NOT EXISTS `si_preferences` (
  `pref_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `pref_description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_currency_sign` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_heading` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_wording` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_detail_heading` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_detail_line` text COLLATE utf8_unicode_ci,
  `pref_inv_payment_method` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_payment_line1_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_payment_line1_value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_payment_line2_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_payment_line2_value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `status` int(1) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `index_group` int(11) NOT NULL,
  `currency_code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `include_online_payment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_position` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`domain_id`,`pref_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `si_preferences`
--

INSERT INTO `si_preferences` (`pref_id`, `domain_id`, `pref_description`, `pref_currency_sign`, `pref_inv_heading`, `pref_inv_wording`, `pref_inv_detail_heading`, `pref_inv_detail_line`, `pref_inv_payment_method`, `pref_inv_payment_line1_name`, `pref_inv_payment_line1_value`, `pref_inv_payment_line2_name`, `pref_inv_payment_line2_value`, `pref_enabled`, `status`, `locale`, `language`, `index_group`, `currency_code`, `include_online_payment`, `currency_position`) VALUES
(1, 1, 'Invoice', '$', 'Invoice', 'Invoice', 'Details', 'Payment is to be made within 14 days of the invoice being sent', 'Electronic Funds Transfer', 'Account name', 'H. & M. Simpson', 'Account number:', '0123-4567-7890', '1', 1, 'en_GB', 'en_GB', 1, 'USD', NULL, 'left'),
(2, 1, 'Receipt', '$', 'Receipt', 'Receipt', 'Details', '<br />This transaction has been paid in full, please keep this receipt as proof of purchase.<br /> Thank you', '', '', '', '', '', '1', 1, 'en_GB', 'en_GB', 1, 'USD', NULL, 'left'),
(3, 1, 'Estimate', '$', 'Estimate', 'Estimate', 'Details', '<br />This is an estimate of the final value of services rendered.<br />Thank you', '', '', '', '', '', '1', 1, 'en_GB', 'en_GB', 1, 'USD', NULL, 'left'),
(4, 1, 'Quote', '$', 'Quote', 'Quote', 'Details', '<br />This is a quote of the final value of services rendered.<br />Thank you', '', '', '', '', '', '1', 1, 'en_GB', 'en_GB', 1, 'USD', NULL, 'left');

-- --------------------------------------------------------

--
-- Table structure for table `si_products`
--

CREATE TABLE IF NOT EXISTS `si_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` decimal(25,6) DEFAULT '0.000000',
  `default_tax_id` int(11) DEFAULT NULL,
  `default_tax_id_2` int(11) DEFAULT NULL,
  `cost` decimal(25,6) DEFAULT '0.000000',
  `reorder_level` int(11) DEFAULT NULL,
  `custom_field1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `si_products`
--


-- --------------------------------------------------------

--
-- Table structure for table `si_sql_patchmanager`
--

CREATE TABLE IF NOT EXISTS `si_sql_patchmanager` (
  `sql_id` int(11) NOT NULL AUTO_INCREMENT,
  `sql_patch_ref` int(11) NOT NULL,
  `sql_patch` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sql_release` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sql_statement` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sql_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=798 ;

--
-- Dumping data for table `si_sql_patchmanager`
--

INSERT INTO `si_sql_patchmanager` (`sql_id`, `sql_patch_ref`, `sql_patch`, `sql_release`, `sql_statement`) VALUES
(1, 1, 'Create sql_patchmanger table', '20060514', 'CREATE TABLE si_sql_patchmanager (sql_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,sql_patch_ref VARCHAR( 50 ) NOT NULL ,sql_patch VARCHAR( 255 ) NOT NULL ,sql_release VARCHAR( 25 ) NOT NULL ,sql_statement TEXT NOT NULL) ENGINE = MYISAM '),
(2, 2, '', '', ''),
(3, 3, '', '', ''),
(4, 4, '', '', ''),
(5, 5, '', '', ''),
(6, 6, '', '', ''),
(7, 7, '', '', ''),
(8, 8, '', '', ''),
(9, 9, '', '', ''),
(10, 10, '', '', ''),
(11, 11, '', '', ''),
(12, 12, '', '', ''),
(13, 13, '', '', ''),
(14, 14, '', '', ''),
(15, 15, '', '', ''),
(16, 16, '', '', ''),
(17, 17, '', '', ''),
(18, 18, '', '', ''),
(19, 19, '', '', ''),
(20, 20, '', '', ''),
(21, 21, '', '', ''),
(22, 22, '', '', ''),
(23, 23, '', '', ''),
(24, 24, '', '', ''),
(25, 25, '', '', ''),
(26, 26, '', '', ''),
(27, 27, '', '', ''),
(28, 28, '', '', ''),
(29, 29, '', '', ''),
(30, 30, '', '', ''),
(31, 31, '', '', ''),
(32, 32, '', '', ''),
(33, 33, '', '', ''),
(34, 34, '', '', ''),
(35, 35, '', '', ''),
(36, 36, '', '', ''),
(37, 0, 'Start', '20060514', ''),
(38, 37, '', '', ''),
(39, 38, '', '', ''),
(40, 39, '', '', ''),
(41, 40, '', '', ''),
(42, 41, '', '', ''),
(43, 42, '', '', ''),
(44, 43, '', '', ''),
(45, 44, '', '', ''),
(46, 45, '', '', ''),
(47, 46, '', '', ''),
(48, 47, '', '', ''),
(49, 48, '', '', ''),
(50, 49, '', '', ''),
(51, 50, '', '', ''),
(52, 51, '', '', ''),
(53, 52, '', '', ''),
(54, 53, '', '', ''),
(599, 54, '', '', ''),
(600, 55, '', '', ''),
(601, 56, '', '', ''),
(602, 57, '', '', ''),
(603, 58, '', '', ''),
(604, 59, '', '', ''),
(605, 60, '', '', ''),
(606, 61, '', '', ''),
(607, 62, '', '', ''),
(608, 63, '', '', ''),
(609, 64, '', '', ''),
(610, 65, '', '', ''),
(611, 66, '', '', ''),
(612, 67, '', '', ''),
(613, 68, '', '', ''),
(614, 69, '', '', ''),
(615, 70, '', '', ''),
(616, 71, '', '', ''),
(617, 72, '', '', ''),
(618, 73, '', '', ''),
(619, 74, '', '', ''),
(620, 75, '', '', ''),
(621, 76, '', '', ''),
(622, 77, '', '', ''),
(623, 78, '', '', ''),
(624, 79, '', '', ''),
(625, 80, '', '', ''),
(626, 81, '', '', ''),
(627, 82, '', '', ''),
(628, 83, '', '', ''),
(629, 84, '', '', ''),
(630, 85, '', '', ''),
(631, 86, '', '', ''),
(632, 87, '', '', ''),
(633, 88, '', '', ''),
(634, 89, '', '', ''),
(635, 90, '', '', ''),
(636, 91, '', '', ''),
(637, 92, '', '', ''),
(638, 93, '', '', ''),
(639, 94, '', '', ''),
(640, 95, '', '', ''),
(641, 96, '', '', ''),
(642, 97, '', '', ''),
(643, 98, '', '', ''),
(644, 99, '', '', ''),
(645, 100, '', '', ''),
(646, 101, '', '', ''),
(647, 102, '', '', ''),
(648, 103, '', '', ''),
(649, 104, '', '', ''),
(650, 105, '', '', ''),
(651, 106, '', '', ''),
(652, 107, '', '', ''),
(653, 108, '', '', ''),
(654, 109, '', '', ''),
(655, 110, '', '', ''),
(656, 111, '', '', ''),
(657, 112, '', '', ''),
(658, 113, '', '', ''),
(659, 114, '', '', ''),
(660, 115, '', '', ''),
(661, 116, '', '', ''),
(662, 117, '', '', ''),
(663, 118, '', '', ''),
(664, 119, '', '', ''),
(665, 120, '', '', ''),
(666, 121, '', '', ''),
(667, 122, '', '', ''),
(668, 123, '', '', ''),
(669, 124, '', '', ''),
(670, 125, '', '', ''),
(671, 126, '', '', ''),
(672, 127, '', '', ''),
(673, 128, '', '', ''),
(674, 129, '', '', ''),
(675, 130, '', '', ''),
(676, 131, '', '', ''),
(677, 132, '', '', ''),
(678, 133, '', '', ''),
(679, 134, '', '', ''),
(680, 135, '', '', ''),
(681, 136, '', '', ''),
(682, 137, '', '', ''),
(683, 138, '', '', ''),
(684, 139, '', '', ''),
(685, 140, '', '', ''),
(686, 141, '', '', ''),
(687, 142, '', '', ''),
(688, 143, '', '', ''),
(689, 144, '', '', ''),
(690, 145, '', '', ''),
(691, 146, '', '', ''),
(692, 147, '', '', ''),
(693, 148, '', '', ''),
(694, 149, '', '', ''),
(695, 150, '', '', ''),
(696, 151, '', '', ''),
(697, 152, '', '', ''),
(698, 153, '', '', ''),
(699, 154, '', '', ''),
(700, 155, '', '', ''),
(701, 156, '', '', ''),
(702, 157, '', '', ''),
(703, 158, '', '', ''),
(704, 159, '', '', ''),
(705, 160, '', '', ''),
(706, 161, '', '', ''),
(707, 162, '', '', ''),
(708, 163, '', '', ''),
(709, 164, '', '', ''),
(710, 165, '', '', ''),
(711, 166, '', '', ''),
(712, 167, '', '', ''),
(713, 168, '', '', ''),
(714, 169, '', '', ''),
(715, 170, '', '', ''),
(716, 171, '', '', ''),
(717, 172, '', '', ''),
(718, 173, '', '', ''),
(719, 174, '', '', ''),
(720, 175, '', '', ''),
(721, 176, '', '', ''),
(722, 177, '', '', ''),
(723, 178, '', '', ''),
(724, 179, '', '', ''),
(725, 180, '', '', ''),
(726, 181, '', '', ''),
(727, 182, '', '', ''),
(728, 183, '', '', ''),
(729, 184, '', '', ''),
(730, 185, '', '', ''),
(731, 186, '', '', ''),
(732, 187, '', '', ''),
(733, 188, '', '', ''),
(734, 189, '', '', ''),
(735, 190, '', '', ''),
(736, 191, '', '', ''),
(737, 192, '', '', ''),
(738, 193, '', '', ''),
(739, 194, '', '', ''),
(740, 195, '', '', ''),
(741, 196, '', '', ''),
(742, 197, '', '', ''),
(743, 198, '', '', ''),
(744, 199, '', '', ''),
(745, 200, 'Update extensions table', '20090529', 'UPDATE si_extensions SET id = 0 WHERE name = core LIMIT 1'),
(746, 201, 'Set domain_id on system defaults table to 1', '20090622', 'UPDATE si_system_defaults SET domain_id = 1'),
(747, 202, 'Set extension_id on system defaults table to 1', '20090622', 'UPDATE si_system_defaults SET extension_id = 1'),
(748, 203, 'Move all old consulting style invoices to itemised', '20090704', 'UPDATE si_invoices SET type_id = 2 where type_id = 3'),
(749, 204, '', '', ''),
(750, 205, '', '', ''),
(751, 206, '', '', ''),
(752, 207, '', '', ''),
(753, 208, '', '', ''),
(754, 209, '', '', ''),
(755, 210, '', '', ''),
(756, 210, '', '', ''),
(757, 211, '', '', ''),
(758, 212, '', '', ''),
(759, 213, '', '', ''),
(760, 214, '', '', ''),
(761, 215, '', '', ''),
(762, 216, '', '', ''),
(763, 217, '', '', ''),
(764, 218, '', '', ''),
(765, 219, '', '', ''),
(766, 220, '', '', ''),
(767, 221, '', '', ''),
(768, 222, '', '', ''),
(769, 223, '', '', ''),
(770, 224, '', '', ''),
(771, 225, '', '', ''),
(772, 226, '', '', ''),
(773, 227, '', '', ''),
(774, 228, '', '', ''),
(775, 229, '', '', ''),
(776, 230, '', '', ''),
(777, 231, '', '', ''),
(778, 232, '', '', ''),
(779, 233, '', '', ''),
(780, 234, '', '', ''),
(781, 235, '', '', ''),
(782, 236, '', '', ''),
(783, 237, '', '', ''),
(784, 238, '', '', ''),
(785, 239, '', '', ''),
(786, 240, '', '', ''),
(787, 241, '', '', ''),
(788, 242, '', '', ''),
(789, 243, '', '', ''),
(790, 244, '', '', ''),
(791, 245, '', '', ''),
(792, 246, '', '', ''),
(793, 247, '', '', ''),
(794, 248, '', '', ''),
(795, 249, '', '', ''),
(796, 250, '', '', ''),
(797, 251, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `si_system_defaults`
--

CREATE TABLE IF NOT EXISTS `si_system_defaults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `domain_id` int(5) NOT NULL DEFAULT '0',
  `extension_id` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`domain_id`,`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `si_system_defaults`
--

INSERT INTO `si_system_defaults` (`id`, `name`, `value`, `domain_id`, `extension_id`) VALUES
(1, 'biller', '4', 1, 1),
(2, 'customer', '3', 1, 1),
(3, 'tax', '1', 1, 1),
(4, 'preference', '1', 1, 1),
(5, 'line_items', '5', 1, 1),
(6, 'template', 'default', 1, 1),
(7, 'payment_type', '1', 1, 1),
(8, 'language', 'en_GB', 1, 1),
(9, 'dateformate', 'Y-m-d', 1, 1),
(10, 'spreadsheet', 'xls', 1, 1),
(11, 'wordprocessor', 'doc', 1, 1),
(12, 'pdfscreensize', '800', 1, 1),
(13, 'pdfpapersize', 'A4', 1, 1),
(14, 'pdfleftmargin', '15', 1, 1),
(15, 'pdfrightmargin', '15', 1, 1),
(16, 'pdftopmargin', '15', 1, 1),
(17, 'pdfbottommargin', '15', 1, 1),
(18, 'emailhost', 'localhost', 1, 1),
(19, 'emailusername', '', 1, 1),
(20, 'emailpassword', '', 1, 1),
(21, 'logging', '0', 1, 1),
(22, 'delete', 'N', 1, 1),
(23, 'tax_per_line_item', '1', 1, 1),
(24, 'inventory', '0', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `si_tax`
--

CREATE TABLE IF NOT EXISTS `si_tax` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_percentage` decimal(25,6) DEFAULT '0.000000',
  `type` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `domain_id` int(11) NOT NULL,
  PRIMARY KEY (`domain_id`,`tax_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `si_tax`
--

INSERT INTO `si_tax` (`tax_id`, `tax_description`, `tax_percentage`, `type`, `tax_enabled`, `domain_id`) VALUES
(1, 'GST', 10.000000, '%', '1', 1),
(2, 'VAT', 10.000000, '%', '1', 1),
(3, 'Sales Tax', 10.000000, '%', '1', 1),
(4, 'No Tax', 0.000000, '%', '1', 1),
(5, 'Postage', 20.000000, '$', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `si_user`
--

CREATE TABLE IF NOT EXISTS `si_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `domain_id` int(11) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` int(1) NOT NULL,
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `si_user`
--

INSERT INTO `si_user` (`id`, `email`, `role_id`, `domain_id`, `password`, `enabled`) VALUES
(1, 'demo@simpleinvoices.org', 1, 1, 'fe01ce2a7fbac8fafaed7c982a04e229', 1);

-- --------------------------------------------------------

--
-- Table structure for table `si_user_domain`
--

CREATE TABLE IF NOT EXISTS `si_user_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `si_user_domain`
--

INSERT INTO `si_user_domain` (`id`, `name`) VALUES
(1, 'default');

-- --------------------------------------------------------

--
-- Table structure for table `si_user_role`
--

CREATE TABLE IF NOT EXISTS `si_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `si_user_role`
--

INSERT INTO `si_user_role` (`id`, `name`) VALUES
(1, 'administrator');


-- --------------------------------------------------------

--
-- Bits added by JedMeister (post SQL dump)
/*Adds specific SI MySQL user - ideally random password should be created on first boot I think.*/;
--

GRANT ALL PRIVILEGES ON simple_invoices.* TO 'simpleinv_usr'@'localhost' IDENTIFIED BY 'random-password';
