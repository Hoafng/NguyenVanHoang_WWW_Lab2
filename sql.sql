-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.3.0-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mydb
DROP DATABASE IF EXISTS `mydb`;
CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `mydb`;

-- Dumping structure for table mydb.customer
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `cust_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(250) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `cust_name` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table mydb.employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(250) NOT NULL,
  `dob` datetime(6) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `full_name` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table mydb.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) NOT NULL,
  `cust_id` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_orders_employee_id` (`employee_id`),
  KEY `FK_orders_cust_id` (`cust_id`),
  CONSTRAINT `FK_orders_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `FK_orders_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table mydb.order_detail
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `note` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `quantity` double NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `FK_order_detail_product_id` (`product_id`),
  CONSTRAINT `FK_order_detail_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_order_detail_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table mydb.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) NOT NULL,
  `manufacturer_name` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `unit` varchar(25) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table mydb.product_image
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE IF NOT EXISTS `product_image` (
  `image_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alternative` varchar(250) DEFAULT NULL,
  `path` varchar(250) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `FK_product_image_product_id` (`product_id`),
  CONSTRAINT `FK_product_image_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table mydb.product_price
DROP TABLE IF EXISTS `product_price`;
CREATE TABLE IF NOT EXISTS `product_price` (
  `price_date_time` datetime(6) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`price_date_time`,`product_id`),
  KEY `FK_product_price_product_id` (`product_id`),
  CONSTRAINT `FK_product_price_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
