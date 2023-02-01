-- MariaDB dump 10.19  Distrib 10.9.4-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: sunsetmusic
-- ------------------------------------------------------
-- Server version	10.9.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_store_user_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_store_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES
(1,'stm3y3r@icloud.com',1,1,'944e5ce45e554be49b7c19e4a600d3b7'),
(2,'tigerlost@me.com',1,1,'c8fef892e63a4a42b40e1171a665c38e'),
(3,'info@medeux.fr',1,1,'e4c2b5c70936468c88b833b3f39e6cea'),
(4,'zaza@zaza.com',1,1,'e961928818bf48359b101d6ef34a1310');
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add content type',4,'add_contenttype'),
(14,'Can change content type',4,'change_contenttype'),
(15,'Can delete content type',4,'delete_contenttype'),
(16,'Can view content type',4,'view_contenttype'),
(17,'Can add session',5,'add_session'),
(18,'Can change session',5,'change_session'),
(19,'Can delete session',5,'delete_session'),
(20,'Can view session',5,'view_session'),
(21,'Can add site',6,'add_site'),
(22,'Can change site',6,'change_site'),
(23,'Can delete site',6,'delete_site'),
(24,'Can view site',6,'view_site'),
(25,'Can add email address',7,'add_emailaddress'),
(26,'Can change email address',7,'change_emailaddress'),
(27,'Can delete email address',7,'delete_emailaddress'),
(28,'Can view email address',7,'view_emailaddress'),
(29,'Can add email confirmation',8,'add_emailconfirmation'),
(30,'Can change email confirmation',8,'change_emailconfirmation'),
(31,'Can delete email confirmation',8,'delete_emailconfirmation'),
(32,'Can view email confirmation',8,'view_emailconfirmation'),
(33,'Can add social account',9,'add_socialaccount'),
(34,'Can change social account',9,'change_socialaccount'),
(35,'Can delete social account',9,'delete_socialaccount'),
(36,'Can view social account',9,'view_socialaccount'),
(37,'Can add social application',10,'add_socialapp'),
(38,'Can change social application',10,'change_socialapp'),
(39,'Can delete social application',10,'delete_socialapp'),
(40,'Can view social application',10,'view_socialapp'),
(41,'Can add social application token',11,'add_socialtoken'),
(42,'Can change social application token',11,'change_socialtoken'),
(43,'Can delete social application token',11,'delete_socialtoken'),
(44,'Can view social application token',11,'view_socialtoken'),
(45,'Can add user',12,'add_user'),
(46,'Can change user',12,'change_user'),
(47,'Can delete user',12,'delete_user'),
(48,'Can view user',12,'view_user'),
(49,'Can add Adresse',13,'add_address'),
(50,'Can change Adresse',13,'change_address'),
(51,'Can delete Adresse',13,'delete_address'),
(52,'Can view Adresse',13,'view_address'),
(53,'Can add category',14,'add_category'),
(54,'Can change category',14,'change_category'),
(55,'Can delete category',14,'delete_category'),
(56,'Can view category',14,'view_category'),
(57,'Can add country',15,'add_country'),
(58,'Can change country',15,'change_country'),
(59,'Can delete country',15,'delete_country'),
(60,'Can view country',15,'view_country'),
(61,'Can add order',16,'add_order'),
(62,'Can change order',16,'change_order'),
(63,'Can delete order',16,'delete_order'),
(64,'Can view order',16,'view_order'),
(65,'Can add VAT rate',17,'add_vat'),
(66,'Can change VAT rate',17,'change_vat'),
(67,'Can delete VAT rate',17,'delete_vat'),
(68,'Can view VAT rate',17,'view_vat'),
(69,'Can add supplier',18,'add_supplier'),
(70,'Can change supplier',18,'change_supplier'),
(71,'Can delete supplier',18,'delete_supplier'),
(72,'Can view supplier',18,'view_supplier'),
(73,'Can add product',19,'add_product'),
(74,'Can change product',19,'change_product'),
(75,'Can delete product',19,'delete_product'),
(76,'Can view product',19,'view_product'),
(77,'Can add order detail',20,'add_orderdetail'),
(78,'Can change order detail',20,'change_orderdetail'),
(79,'Can delete order detail',20,'delete_orderdetail'),
(80,'Can view order detail',20,'view_orderdetail');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_store_user_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_store_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2022-10-14 10:01:01.162122','84','Gibson SG ´61 Standard Maestro BK Spk (504613)',1,'[{\"added\": {}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(2,'2022-10-14 10:02:44.857584','84','Gibson SG ´61 Standard Maestro BK Spk (504613)',2,'[{\"changed\": {\"fields\": [\"Price\", \"Pic\"]}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(3,'2022-11-03 14:46:27.678669','2','TFHBS2 2022-10-17 (Stéphane MEYER)',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(4,'2022-11-03 14:46:53.488960','2','TFHBS2 2022-10-17 (Stéphane MEYER)',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(5,'2022-11-03 14:47:23.394181','2','TFHBS2 2022-10-17 (Stéphane MEYER)',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(6,'2022-11-03 14:51:22.279544','4','NLOVE0 2022-10-19 (Hermes Æpteny) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(7,'2022-11-03 14:54:58.976820','1','S402KC 2022-10-17 (Stéphane MEYER) [x]',2,'[{\"changed\": {\"fields\": [\"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(8,'2022-11-03 14:55:08.442963','1','S402KC 2022-10-17 (Stéphane MEYER) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(9,'2022-11-03 14:55:14.782873','4','NLOVE0 2022-10-19 (Hermes Æpteny) [OK]',2,'[]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(10,'2022-11-03 14:56:37.772845','2','TFHBS2 2022-10-17 (Stéphane MEYER) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(11,'2022-11-03 15:07:02.901690','e4c2b5c7-0936-468c-88b8-33b3f39e6cea','info@medeux.fr',2,'[{\"changed\": {\"fields\": [\"Business customer\"]}}]',12,'944e5ce45e554be49b7c19e4a600d3b7'),
(12,'2022-11-03 15:53:12.568500','5','MAQQQW 2022-11-03 (Albert Ebasque) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(13,'2022-11-03 15:53:22.476585','6','J98851 2022-11-03 (Albert Ebasque) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(14,'2022-11-07 11:12:46.948034','30','Teenage Engineering',1,'[{\"added\": {}}]',18,'944e5ce45e554be49b7c19e4a600d3b7'),
(15,'2022-11-07 11:12:51.235819','85','Teenage Engineering OP-1 field (544439)',1,'[{\"added\": {}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(16,'2022-11-07 11:14:22.987241','85','Teenage Engineering OP-1 field (544439)',2,'[{\"changed\": {\"fields\": [\"Price\", \"Pic\"]}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(17,'2022-11-07 11:18:55.647041','86','Teenage Engineering TX-6 (542726)',1,'[{\"added\": {}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(18,'2022-11-07 11:22:27.809589','7','WS03JS 2022-11-07 (Stéphane MEYER) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(19,'2022-11-10 14:15:13.272060','944e5ce4-5e55-4be4-9b7c-19e4a600d3b7','stm3y3r@icloud.com',2,'[{\"changed\": {\"fields\": [\"Business customer\"]}}]',12,'944e5ce45e554be49b7c19e4a600d3b7'),
(20,'2022-11-10 14:21:19.487020','944e5ce4-5e55-4be4-9b7c-19e4a600d3b7','stm3y3r@icloud.com',2,'[{\"changed\": {\"fields\": [\"Business customer\"]}}]',12,'944e5ce45e554be49b7c19e4a600d3b7'),
(21,'2022-11-10 14:23:19.371848','86','Teenage Engineering TX-6 (542726)',2,'[{\"changed\": {\"fields\": [\"Pic\", \"Active\"]}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(22,'2022-11-10 14:24:05.640736','86','Teenage Engineering TX-6 (542726)',2,'[{\"changed\": {\"fields\": [\"Pic\", \"Active\"]}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(23,'2022-11-10 14:46:57.532445','1','S402KC 2022-10-17 (Stéphane MEYER) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(24,'2023-01-10 11:42:58.545744','87','Gibson Lzzy Hale Explorerbird CR (543063)',1,'[{\"added\": {}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(25,'2023-01-10 11:43:59.332277','87','Gibson Lzzy Hale Explorerbird CR (543063)',2,'[{\"changed\": {\"fields\": [\"Price\", \"Pic\"]}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(26,'2023-01-10 11:46:04.476189','10','NWNQG8 2023-01-10 (Stéphane MEYER) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(27,'2023-01-10 11:46:12.155850','9','RY94J3 2022-11-10 (Zaza Zaza) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(28,'2023-01-10 11:46:24.430386','8','07NJGW 2022-11-10 (Stéphane MEYER) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(29,'2023-01-10 11:46:32.457547','3','JVTUS6 2022-10-17 (Stéphane MEYER) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7'),
(30,'2023-02-01 13:17:40.562993','88','Monkey Banana Turbo 6 Red (230053)',1,'[{\"added\": {}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(31,'2023-02-01 13:18:21.745896','88','Monkey Banana Turbo 6 Red (230053)',2,'[{\"changed\": {\"fields\": [\"Pic\", \"Category\"]}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(32,'2023-02-01 13:23:37.687293','89','Monkey Banana Turbo 10s red (230091)',1,'[{\"added\": {}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(33,'2023-02-01 13:39:06.886002','31','Phil Jones Bass',1,'[{\"added\": {}}]',18,'944e5ce45e554be49b7c19e4a600d3b7'),
(34,'2023-02-01 13:39:17.184190','90','Phil Jones X4 Nanobass Red (545625)',1,'[{\"added\": {}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(35,'2023-02-01 13:45:19.842033','34','Effets pour guitares électriques (1600)',1,'[{\"added\": {}}]',14,'944e5ce45e554be49b7c19e4a600d3b7'),
(36,'2023-02-01 13:58:11.117535','32','Boss',1,'[{\"added\": {}}]',18,'944e5ce45e554be49b7c19e4a600d3b7'),
(37,'2023-02-01 13:58:17.383041','91','Boss DS-1w Distortion (552256)',1,'[{\"added\": {}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(38,'2023-02-01 13:59:37.636842','91','Boss DS-1w Distortion (552256)',2,'[{\"changed\": {\"fields\": [\"Price\", \"Pic\"]}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(39,'2023-02-01 14:01:13.069174','91','Boss DS-1w Distortion (552256)',2,'[{\"changed\": {\"fields\": [\"Desc\", \"Pic\"]}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(40,'2023-02-01 14:01:42.015103','91','Boss DS-1w Distortion (552256)',2,'[{\"changed\": {\"fields\": [\"Pic\"]}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(41,'2023-02-01 14:04:40.476575','92','Boss BF-3 (152062)',1,'[{\"added\": {}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(42,'2023-02-01 14:10:58.371135','93','Boss CE-2w (393030)',1,'[{\"added\": {}}]',19,'944e5ce45e554be49b7c19e4a600d3b7'),
(43,'2023-02-01 14:13:27.719430','11','5VLH2T 2023-02-01 (Stéphane MEYER) [OK]',2,'[{\"changed\": {\"fields\": [\"Shipped\", \"Shipped date\"]}}]',16,'944e5ce45e554be49b7c19e4a600d3b7');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(7,'account','emailaddress'),
(8,'account','emailconfirmation'),
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'contenttypes','contenttype'),
(5,'sessions','session'),
(6,'sites','site'),
(9,'socialaccount','socialaccount'),
(10,'socialaccount','socialapp'),
(11,'socialaccount','socialtoken'),
(13,'store','address'),
(14,'store','category'),
(15,'store','country'),
(16,'store','order'),
(20,'store','orderdetail'),
(19,'store','product'),
(18,'store','supplier'),
(12,'store','user'),
(17,'store','vat');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2022-10-05 12:12:52.773333'),
(2,'contenttypes','0002_remove_content_type_name','2022-10-05 12:12:53.173313'),
(3,'auth','0001_initial','2022-10-05 12:12:54.798842'),
(4,'auth','0002_alter_permission_name_max_length','2022-10-05 12:12:55.271368'),
(5,'auth','0003_alter_user_email_max_length','2022-10-05 12:12:55.290590'),
(6,'auth','0004_alter_user_username_opts','2022-10-05 12:12:55.307273'),
(7,'auth','0005_alter_user_last_login_null','2022-10-05 12:12:55.323381'),
(8,'auth','0006_require_contenttypes_0002','2022-10-05 12:12:55.330651'),
(9,'auth','0007_alter_validators_add_error_messages','2022-10-05 12:12:55.354994'),
(10,'auth','0008_alter_user_username_max_length','2022-10-05 12:12:55.366654'),
(11,'auth','0009_alter_user_last_name_max_length','2022-10-05 12:12:55.374441'),
(12,'auth','0010_alter_group_name_max_length','2022-10-05 12:12:55.549241'),
(13,'auth','0011_update_proxy_permissions','2022-10-05 12:12:55.567256'),
(14,'auth','0012_alter_user_first_name_max_length','2022-10-05 12:12:55.582972'),
(15,'store','0001_initial','2022-10-05 12:13:04.041490'),
(16,'account','0001_initial','2022-10-05 12:13:05.157166'),
(17,'account','0002_email_max_length','2022-10-05 12:13:05.384794'),
(18,'admin','0001_initial','2022-10-05 12:13:06.208849'),
(19,'admin','0002_logentry_remove_auto_add','2022-10-05 12:13:06.242667'),
(20,'admin','0003_logentry_add_action_flag_choices','2022-10-05 12:13:06.292930'),
(21,'sessions','0001_initial','2022-10-05 12:13:06.617334'),
(22,'sites','0001_initial','2022-10-05 12:13:06.811469'),
(23,'sites','0002_alter_domain_unique','2022-10-05 12:13:07.067790'),
(24,'socialaccount','0001_initial','2022-10-05 12:13:10.501875'),
(25,'socialaccount','0002_token_max_lengths','2022-10-05 12:13:11.088510'),
(26,'socialaccount','0003_extra_data_default_dict','2022-10-05 12:13:11.123056');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('4m3qxlnsrhgx263acya5tr4tyugbu76k','.eJxVjEsOwjAMBe-SNY0cEtcNS_acobIThxZQK_WzQtydVuoCdk-amfc2La9L166zTm2fzcXEEBSThgoVsQqyrSiUKhc1cA2QvZA5_WbC6anD3uYHD_fRpnFYpl7srtiDzvY2Zn1dD_fvoOO52-rio-TkuHATI6HzKbkGYsnYBIYirJqUyVM4N4QAIFhq0JKL894Rmc8XFatBgA:1os2dH:bzdYLm_-8xAXgEd26cNlwCv0FRFuMvTqcFrBhyUFksE','2022-11-21 13:57:47.960052'),
('95iwx5p889kwht4fx5esocw0wte7r5vt','eyJfcGFzc3dvcmRfcmVzZXRfa2V5IjoiYmVvazFoLTc1MTAyMTAxZDEwYWUyZDIzOWZlMjRhMGQ1MDJhNGZiIiwidGVzdGNvb2tpZSI6IndvcmtlZCJ9:1ot9iI:jTquoK_ugXfruM-N7iHIGTNyGEBB_ouy40xGY0S9PM0','2022-11-24 15:43:34.953388'),
('9nmppiioh6ve5f9jn0xr25arg4aoxpwl','.eJxVjsEOwiAQRP-Fs20WgVI8evcbmmVZLNYUU9qoMf671XjpbZI3bzIvMXOZKechsTiIe54GDmInOlzmvlsKT10KK3BasyHWlWFjKu3X5LylSjrW2AAE5e1W80gDj183XHA855ryOE_J199K_aelPuXA1-O_uxnosfSrHZXzgSRGbJ2zRioi2YKLwbQaIXpkJkarrN631gCAN7EBjiFKpaT9vSpcSspjx49bmp7iAO8PqtpQcQ:1okgjr:tSJAw6NFi_96Xthi9SsB0dnPMFIkerNCWXyJhUZX2qM','2022-11-01 07:10:11.196635'),
('jvv99rqyrc17gvg2rlvjhk6zht4uw1zl','.eJxVjsEOwiAQRP-Fs20WgVI8evcbmmVZLNYUU9qoMf671XjpbZI3bzIvMXOZKechsTiIe54GDmInOlzmvlsKT10KK3BasyHWlWFjKu3X5LylSjrW2AAE5e1W80gDj183XHA855ryOE_J199K_aelPuXA1-O_uxnosfSrHZXzgSRGbJ2zRioi2YKLwbQaIXpkJkarrN631gCAN7EBjiFKpaT9vSpcSspjx49bmp7iAO8PqtpQcQ:1oqcWW:nC1mzLyq1MRGlrYTIynCUhLnjnxaUjibkh9HM7hvjNM','2022-11-17 15:52:56.048154'),
('ms41bxsz91wcqqnl9whw1waurctaqcyx','.eJxVjsEOwiAQRP-FsyUgUIpH735Ds-wuttaUpNB4MP67bdKD3iaZeS_zFj2sdejXwks_kriIYC07ZNs4dq6xcUshemx0YAutUmSiF6dfLAJOPO8sPWC-Z4l5rssY5T6RR1vkLRM_r8f2TzBAGTY6mRAJNSToQvBOG0TdqZDIdRZUisCMDN54e-68U0pFl1rFiZI2Rvv9VeVSMedp5M33ysvEJD5fDKNJNA:1os0D5:t5V8_HlYQBT5m_ZOY3Y2FMKK8aa5qfpj5wm0kV7RNYs','2022-11-21 11:22:35.070684'),
('na4ndnjdi9grmhkw81zt4071u2v1fzww','.eJxVjUFugzAQRe_idUB2xmNMltn3DGhszxSHCEeYqImq3r0gsWjX_733v9VAz3UcnpWXISd1UdELi-_PDTugxpI9N8FqbozpDDmHETyr018tUJx43t10o_mztLHM65JDuyPtsdb2oyS-Xw_2X2CkOm42kxgRjGy0Y0GtUVIgcUYM2uAdAgCit9D1NoITMJZ7giC66yKg3aOVa81lHvj1yMtbXfRJrVzXWMqUefv4KsvESf38AvYiT9w:1ol3lx:QNtJ2XSrHztYga1GNAUVhyjys3Vclk_Aio1QqohBVJE','2022-11-02 07:45:53.779283'),
('npyq8u4sp3nh9r25gcn5iceq0fkgu2cc','.eJxVjsEOwiAQRP-Fs20WgVJ69O43NMuyWKwpptSoMf671XjQ2yQzb2YeosfLMvSXwnOfguiE05oNsa4MG1NpvyrnLVXSscYGIChvxeYX80gjT282HHE65JrytMzJ1-9I_XVLvc-BT7tv9q9gwDKsdFTOB5IYsXXOGqmIZAsuBtNqhOiRmRitsnrbWgMA3sQGOIYolZL286pwKSlPPd_Oab6LDjZi4bJQzmPideOa55GDeL4AFEZQcQ:1pNDqr:V3ojg6v_iU-RRAXMf0roW1A3shWjLnXPBfbw_a5g3tA','2023-02-15 14:12:41.489750'),
('pbomdlnactcsgruhz9coefv4oekdogla','.eJxVjsEOwiAQRP-Fs20WgVJ69O43kGVZbNUUU9pEY_x3W-NBb5PMe5N5Co_L3Pul8OSHKDrhtGZDrCvDxlQ6rMkFS5V0rLEBiCpYsfvVAtKFx82NZxxPuaY8ztMQ6g2pv22pjzny9fBl_wZ6LP1qJ-VCJIkJW-eskYpItuBSNK1GSAGZidEqq_etNQAQTGqAU0xSKWk_rwqXMuTR8_02TA_RwesNfgFIvQ:1ojHVU:-lYpKpOsa7ve6qcJxv_RO003HyElhNDDefsmbsIuPJQ','2022-10-28 10:01:32.260732'),
('qly2sckxesrqnh5fz5fky2tk2whhak3w','.eJxVkMFuxCAMRP8l5yaCACH02Hu_AdnYbtJUYRVYtatV_72k2svexpp51mjuXeVSU87byt1r952Pjal76eIFSmkXxYML17jxrdm4VJi3fjQyeZ60FyuajAsjCKIhZckaSnjycK1LvBY-4kqNDNayS2x7x871FpsK6FOvA1uYlCKD_hlDSBvvJ0ufsH_kIeW9HisOZ2R4uGV4z8Rfb4_s04MFytJoMQEpaRCYQ_BOm5T0rIKQmy0oQWBODN54O87eKaXQyaRYSLQx2v-3KlzKmvfIP5f1aEOo3z-AO2Tn:1pFDAr:n9_Ecw9LdkObjSWvnbgsevI65c2PWFsgmuv74OSsZkk','2023-01-24 11:52:13.935794'),
('ty5xr5125mcgsu80qaf01eldr64zbv6o','.eJxVjU1ugzAQhe_idUE24zEmu_Yi1niYEVZdRwqQTZS7J6nYsHw_33sPQ8zXvW3pLreiReYkf1SqubS91i-TaN-WtK9yS2U2F8NRReM0dBKAOk9-6LK30jk3OgoBGaKYE5aJf6V9WKr1Y_fHY__fOeK1_34raVth2sq1_RzUaWqhdXnvCKlTRRZngyhaizpn0uDUoc8xIAAgRg_j5BmCgvMyEWS148iA3jxfmidQxQ:1og5bg:gvi07Ugak38jrNSd6T3vnz8iB1mRu3eMb3rUV3q1uv0','2022-10-19 14:42:44.365750'),
('z65m1lop84pj7ypwzeo5l0orroi3zxdb','.eJxVjsEOwiAQRP-Fs20WgVJ69O43NMuyWKwpptSoMf671XjQ2yQzb2YeosfLMvSXwnOfguiE05oNsa4MG1NpvyrnLVXSscYGIChvxeYX80gjT282HHE65JrytMzJ1-9I_XVLvc-BT7tv9q9gwDKsdFTOB5IYsXXOGqmIZAsuBtNqhOiRmRitsnrbWgMA3sQGOIYolZL286pwKSlPPd_Oab6LDjZi4bJQzmPideOa55GDeL4AFEZQcQ:1okROp:31YZfZiRebo-O2hZEXAf33eQFAWROjuZyCF8WjaOrQI','2022-10-31 14:47:27.668789');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES
(1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_social_user_id_8146e70c_fk_store_use` (`user_id`),
  CONSTRAINT `socialaccount_social_user_id_8146e70c_fk_store_use` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_address`
--

DROP TABLE IF EXISTS `store_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `address1` varchar(127) NOT NULL,
  `address2` varchar(127) NOT NULL,
  `city` varchar(64) NOT NULL,
  `zipcode` varchar(15) NOT NULL,
  `address_type` int(11) NOT NULL,
  `use_for_shipping` tinyint(1) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique address title` (`title`,`user_id`),
  UNIQUE KEY `Unique address` (`address1`,`city`,`zipcode`,`country_id`,`user_id`),
  KEY `store_address_country_id_dcb5f6c7_fk_store_country_id` (`country_id`),
  KEY `store_address_user_id_34317815_fk_store_user_user_id` (`user_id`),
  CONSTRAINT `store_address_country_id_dcb5f6c7_fk_store_country_id` FOREIGN KEY (`country_id`) REFERENCES `store_country` (`id`),
  CONSTRAINT `store_address_user_id_34317815_fk_store_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_address`
--

LOCK TABLES `store_address` WRITE;
/*!40000 ALTER TABLE `store_address` DISABLE KEYS */;
INSERT INTO `store_address` VALUES
(1,'Maison','7 Rue De L\'Église','','MANDEURE','25350',0,1,73,'c8fef892e63a4a42b40e1171a665c38e'),
(2,'Domicile','54 Rue Du Bois Bourgeois','','MONTBÉLIARD','25200',0,1,73,'944e5ce45e554be49b7c19e4a600d3b7'),
(3,'Medeux','14 Quai De Somme','','AMIENS','80000',0,1,73,'e4c2b5c70936468c88b833b3f39e6cea'),
(4,'Maison','1 Rue De La Paix','','AMIENS','80000',1,0,73,'e961928818bf48359b101d6ef34a1310'),
(5,'Afpa','70 Rue De Poulainville','','AMIENS','80000',0,0,73,'e961928818bf48359b101d6ef34a1310');
/*!40000 ALTER TABLE `store_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_category`
--

DROP TABLE IF EXISTS `store_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `shortname` varchar(15) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_category_parent_id_85132b84_fk_store_category_id` (`parent_id`),
  KEY `store_category_slug_525260be` (`slug`),
  CONSTRAINT `store_category_parent_id_85132b84_fk_store_category_id` FOREIGN KEY (`parent_id`) REFERENCES `store_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_category`
--

LOCK TABLES `store_category` WRITE;
/*!40000 ALTER TABLE `store_category` DISABLE KEYS */;
INSERT INTO `store_category` VALUES
(1,'Guitares et basses','guitares','Guit./Basses',NULL,'store/ico/icon-guitars.png',1000),
(4,'Guitares électriques','guitares-electriques','Guit. élec.',1,'store/ico/icon-elec-gtr.png',1100),
(9,'Basses électriques','basses-elec','Basses élec.',1,'store/ico/icon-bass-gtr.png',1300),
(10,'Amplificateurs pour guitares électriques','ampli-gtr-elec','Amplis guit.',1,'store/ico/icon-amp.png',1400),
(11,'Amplificateurs pour basses électriques','amplis-basses-elec','Amplis basses',1,'store/ico/icon-amp.png',1500),
(12,'Studio et enregistrement','studio','Studio',NULL,'store/ico/icon-studio.png',3000),
(13,'Guitares classiques, acoustiques...','guitares-classiques','Guit. class.',1,'store/ico/icon-classic-gtr.png',1200),
(14,'Synthétiseurs, workstations...','synthetiseurs','Synthés',NULL,'store/ico/icon-keys.png',2000),
(15,'Accessoires','accessoires','Accessoires',NULL,'store/ico/icon-plug.png',4000),
(16,'Interfaces audio','interfaces','Int. audio',12,'store/ico/icon-dai.png',3100),
(17,'Enceintes de monitoring','monitoring','Monitoring',12,'store/ico/icon-monitor.png',3200),
(18,'Microphones','micros','Micros',12,'store/ico/icon-mic.png',3300),
(19,'Casques et amplificateurs','casques','Casques',12,'store/ico/icon-headphone.png',3400),
(20,'Casques studio','casques-studio','Casques studio',19,'store/ico/icon-headphone.png',3410),
(21,'Amplificateurs pour casques','amplis-casques','Amplis casques',19,'store/ico/icon-headamp.png',3420),
(22,'Moniteurs actifs','moniteurs-actifs','Mon. actifs',17,'store/ico/icon-monitor.png',3210),
(23,'Caissons de basses','subwoofers','Caiss. basses',17,'store/ico/icon-subwoofer.png',3220),
(24,'Synthétiseurs','synthetiseurs','Synthés',14,'store/ico/icon-keys.png',2100),
(25,'Workstations','workstations','Workstations',14,'store/ico/icon-keys.png',2200),
(26,'Grooveboxes et boîtes à rythmes','grooveboxes','Grooveboxes',14,'store/ico/icon-groovebox.png',2300),
(27,'Contrôleurs','controleurs','Contrôleurs',12,'store/ico/icon-studio.png',3500),
(28,'Claviers maîtres','claviers-maitres','Clav. maîtres',27,'store/ico/icon-keys.png',3510),
(29,'Contrôleurs DAW','controleurs-daw','Contr. DAW',27,'store/ico/icon-studio.png',3520),
(30,'Effets et périphériques','effets','Effets',12,'store/ico/icon-fx.png',3600),
(31,'Câbles','cables','Câbles',15,'store/ico/icon-plug.png',4100),
(32,'Câbles pour instruments','cables-instruments','Câbles Instr.',31,'store/ico/icon-elec-gtr.png',4110),
(33,'Câbles pour microphones','cables-micro','Câbles micro',31,'store/ico/icon-mic.png',4120),
(34,'Effets pour guitares électriques','effets-gtr','Effets',1,'store/ico/icon-guitars.png',1600);
/*!40000 ALTER TABLE `store_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_country`
--

DROP TABLE IF EXISTS `store_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_country`
--

LOCK TABLES `store_country` WRITE;
/*!40000 ALTER TABLE `store_country` DISABLE KEYS */;
INSERT INTO `store_country` VALUES
(1,'Afghanistan','AF'),
(2,'Albania','AL'),
(3,'Algeria','DZ'),
(4,'American Samoa','AS'),
(5,'Andorra','AD'),
(6,'Angola','AO'),
(7,'Anguilla','AI'),
(8,'Antarctica','AQ'),
(9,'Antigua and Barbuda','AG'),
(10,'Argentina','AR'),
(11,'Armenia','AM'),
(12,'Aruba','AW'),
(13,'Australia','AU'),
(14,'Austria','AT'),
(15,'Azerbaijan','AZ'),
(16,'Bahamas','BS'),
(17,'Bahrain','BH'),
(18,'Bangladesh','BD'),
(19,'Barbados','BB'),
(20,'Belarus','BY'),
(21,'Belgium','BE'),
(22,'Belize','BZ'),
(23,'Benin','BJ'),
(24,'Bermuda','BM'),
(25,'Bhutan','BT'),
(26,'Bolivia','BO'),
(27,'Bosnia and Herzegovina','BA'),
(28,'Botswana','BW'),
(29,'Brazil','BR'),
(30,'British Indian Ocean Territory','IO'),
(31,'British Virgin Islands','VG'),
(32,'Brunei','BN'),
(33,'Bulgaria','BG'),
(34,'Burkina Faso','BF'),
(35,'Burundi','BI'),
(36,'Cambodia','KH'),
(37,'Cameroon','CM'),
(38,'Canada','CA'),
(39,'Cape Verde','CV'),
(40,'Cayman Islands','KY'),
(41,'Central African Republic','CF'),
(42,'Chad','TD'),
(43,'Chile','CL'),
(44,'China','CN'),
(45,'Christmas Island','CX'),
(46,'Cocos Islands','CC'),
(47,'Colombia','CO'),
(48,'Comoros','KM'),
(49,'Cook Islands','CK'),
(50,'Costa Rica','CR'),
(51,'Croatia','HR'),
(52,'Cuba','CU'),
(53,'Curacao','CW'),
(54,'Cyprus','CY'),
(55,'Czech Republic','CZ'),
(56,'Democratic Republic of the Congo','CD'),
(57,'Denmark','DK'),
(58,'Djibouti','DJ'),
(59,'Dominica','DM'),
(60,'Dominican Republic','DO'),
(61,'East Timor','TL'),
(62,'Ecuador','EC'),
(63,'Egypt','EG'),
(64,'El Salvador','SV'),
(65,'Equatorial Guinea','GQ'),
(66,'Eritrea','ER'),
(67,'Estonia','EE'),
(68,'Ethiopia','ET'),
(69,'Falkland Islands','FK'),
(70,'Faroe Islands','FO'),
(71,'Fiji','FJ'),
(72,'Finland','FI'),
(73,'France','FR'),
(74,'French Polynesia','PF'),
(75,'Gabon','GA'),
(76,'Gambia','GM'),
(77,'Georgia','GE'),
(78,'Germany','DE'),
(79,'Ghana','GH'),
(80,'Gibraltar','GI'),
(81,'Greece','GR'),
(82,'Greenland','GL'),
(83,'Grenada','GD'),
(84,'Guam','GU'),
(85,'Guatemala','GT'),
(86,'Guernsey','GG'),
(87,'Guinea','GN'),
(88,'GuineaBissau','GW'),
(89,'Guyana','GY'),
(90,'Haiti','HT'),
(91,'Honduras','HN'),
(92,'Hong Kong','HK'),
(93,'Hungary','HU'),
(94,'Iceland','IS'),
(95,'India','IN'),
(96,'Indonesia','ID'),
(97,'Iran','IR'),
(98,'Iraq','IQ'),
(99,'Ireland','IE'),
(100,'Isle of Man','IM'),
(101,'Israel','IL'),
(102,'Italy','IT'),
(103,'Ivory Coast','CI'),
(104,'Jamaica','JM'),
(105,'Japan','JP'),
(106,'Jersey','JE'),
(107,'Jordan','JO'),
(108,'Kazakhstan','KZ'),
(109,'Kenya','KE'),
(110,'Kiribati','KI'),
(111,'Kosovo','XK'),
(112,'Kuwait','KW'),
(113,'Kyrgyzstan','KG'),
(114,'Laos','LA'),
(115,'Latvia','LV'),
(116,'Lebanon','LB'),
(117,'Lesotho','LS'),
(118,'Liberia','LR'),
(119,'Libya','LY'),
(120,'Liechtenstein','LI'),
(121,'Lithuania','LT'),
(122,'Luxembourg','LU'),
(123,'Macau','MO'),
(124,'Macedonia','MK'),
(125,'Madagascar','MG'),
(126,'Malawi','MW'),
(127,'Malaysia','MY'),
(128,'Maldives','MV'),
(129,'Mali','ML'),
(130,'Malta','MT'),
(131,'Marshall Islands','MH'),
(132,'Mauritania','MR'),
(133,'Mauritius','MU'),
(134,'Mayotte','YT'),
(135,'Mexico','MX'),
(136,'Micronesia','FM'),
(137,'Moldova','MD'),
(138,'Monaco','MC'),
(139,'Mongolia','MN'),
(140,'Montenegro','ME'),
(141,'Montserrat','MS'),
(142,'Morocco','MA'),
(143,'Mozambique','MZ'),
(144,'Myanmar','MM'),
(145,'Namibia','NA'),
(146,'Nauru','NR'),
(147,'Nepal','NP'),
(148,'Netherlands','NL'),
(149,'Netherlands Antilles','AN'),
(150,'New Caledonia','NC'),
(151,'New Zealand','NZ'),
(152,'Nicaragua','NI'),
(153,'Niger','NE'),
(154,'Nigeria','NG'),
(155,'Niue','NU'),
(156,'North Korea','KP'),
(157,'Northern Mariana Islands','MP'),
(158,'Norway','NO'),
(159,'Oman','OM'),
(160,'Pakistan','PK'),
(161,'Palau','PW'),
(162,'Palestine','PS'),
(163,'Panama','PA'),
(164,'Papua New Guinea','PG'),
(165,'Paraguay','PY'),
(166,'Peru','PE'),
(167,'Philippines','PH'),
(168,'Pitcairn','PN'),
(169,'Poland','PL'),
(170,'Portugal','PT'),
(171,'Puerto Rico','PR'),
(172,'Qatar','QA'),
(173,'Republic of the Congo','CG'),
(174,'Reunion','RE'),
(175,'Romania','RO'),
(176,'Russia','RU'),
(177,'Rwanda','RW'),
(178,'Saint Barthelemy','BL'),
(179,'Saint Helena','SH'),
(180,'Saint Kitts and Nevis','KN'),
(181,'Saint Lucia','LC'),
(182,'Saint Martin','MF'),
(183,'Saint Pierre and Miquelon','PM'),
(184,'Saint Vincent and the Grenadines','VC'),
(185,'Samoa','WS'),
(186,'San Marino','SM'),
(187,'Sao Tome and Principe','ST'),
(188,'Saudi Arabia','SA'),
(189,'Senegal','SN'),
(190,'Serbia','RS'),
(191,'Seychelles','SC'),
(192,'Sierra Leone','SL'),
(193,'Singapore','SG'),
(194,'Sint Maarten','SX'),
(195,'Slovakia','SK'),
(196,'Slovenia','SI'),
(197,'Solomon Islands','SB'),
(198,'Somalia','SO'),
(199,'South Africa','ZA'),
(200,'South Korea','KR'),
(201,'South Sudan','SS'),
(202,'Spain','ES'),
(203,'Sri Lanka','LK'),
(204,'Sudan','SD'),
(205,'Suriname','SR'),
(206,'Svalbard and Jan Mayen','SJ'),
(207,'Swaziland','SZ'),
(208,'Sweden','SE'),
(209,'Switzerland','CH'),
(210,'Syria','SY'),
(211,'Taiwan','TW'),
(212,'Tajikistan','TJ'),
(213,'Tanzania','TZ'),
(214,'Thailand','TH'),
(215,'Togo','TG'),
(216,'Tokelau','TK'),
(217,'Tonga','TO'),
(218,'Trinidad and Tobago','TT'),
(219,'Tunisia','TN'),
(220,'Turkey','TR'),
(221,'Turkmenistan','TM'),
(222,'Turks and Caicos Islands','TC'),
(223,'Tuvalu','TV'),
(224,'U.S. Virgin Islands','VI'),
(225,'Uganda','UG'),
(226,'Ukraine','UA'),
(227,'United Arab Emirates','AE'),
(228,'United Kingdom','GB'),
(229,'United States','US'),
(230,'Uruguay','UY'),
(231,'Uzbekistan','UZ'),
(232,'Vanuatu','VU'),
(233,'Vatican','VA'),
(234,'Venezuela','VE'),
(235,'Vietnam','VN'),
(236,'Wallis and Futuna','WF'),
(237,'Western Sahara','EH'),
(238,'Yemen','YE'),
(239,'Zambia','ZM'),
(240,'Zimbabwe','ZW');
/*!40000 ALTER TABLE `store_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order`
--

DROP TABLE IF EXISTS `store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_ref` varchar(6) DEFAULT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `shipped` tinyint(1) NOT NULL,
  `shipped_date` datetime(6) DEFAULT NULL,
  `shipping_address_id` bigint(20) DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  `vat_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_ref` (`order_ref`),
  KEY `store_order_vat_id_aaa81bf4_fk_store_vat_id` (`vat_id`),
  KEY `store_order_shipping_address_id_9d19a8a7_fk_store_address_id` (`shipping_address_id`),
  KEY `store_order_user_id_ae5f7a5f_fk_store_user_user_id` (`user_id`),
  CONSTRAINT `store_order_shipping_address_id_9d19a8a7_fk_store_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `store_address` (`id`),
  CONSTRAINT `store_order_user_id_ae5f7a5f_fk_store_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`user_id`),
  CONSTRAINT `store_order_vat_id_aaa81bf4_fk_store_vat_id` FOREIGN KEY (`vat_id`) REFERENCES `store_vat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order`
--

LOCK TABLES `store_order` WRITE;
/*!40000 ALTER TABLE `store_order` DISABLE KEYS */;
INSERT INTO `store_order` VALUES
(1,'S402KC','2022-10-17 08:25:12.000000',1,'2022-11-10 14:46:51.000000',2,'944e5ce45e554be49b7c19e4a600d3b7',1),
(2,'TFHBS2','2022-10-17 08:35:18.000000',1,'2022-11-03 14:56:35.000000',2,'944e5ce45e554be49b7c19e4a600d3b7',1),
(3,'JVTUS6','2022-10-17 08:38:46.000000',1,'2023-01-10 11:46:30.000000',2,'944e5ce45e554be49b7c19e4a600d3b7',1),
(4,'NLOVE0','2022-10-19 07:18:26.006947',1,'2022-11-03 15:52:10.000000',1,'c8fef892e63a4a42b40e1171a665c38e',1),
(5,'MAQQQW','2022-11-03 15:09:42.000000',1,'2022-11-03 15:53:11.000000',3,'e4c2b5c70936468c88b833b3f39e6cea',1),
(6,'J98851','2022-11-03 15:51:52.000000',1,'2022-11-03 15:53:21.000000',3,'e4c2b5c70936468c88b833b3f39e6cea',1),
(7,'WS03JS','2022-11-07 11:21:09.000000',1,'2022-11-07 11:22:25.000000',2,'944e5ce45e554be49b7c19e4a600d3b7',1),
(8,'07NJGW','2022-11-10 13:04:00.000000',1,'2023-01-10 11:46:23.000000',2,'944e5ce45e554be49b7c19e4a600d3b7',1),
(9,'RY94J3','2022-11-10 14:12:35.000000',1,'2023-01-10 11:46:10.000000',4,'e961928818bf48359b101d6ef34a1310',1),
(10,'NWNQG8','2023-01-10 11:45:20.000000',1,'2023-01-10 11:46:02.000000',2,'944e5ce45e554be49b7c19e4a600d3b7',1),
(11,'5VLH2T','2023-02-01 14:12:35.000000',1,'2023-02-01 14:13:23.000000',2,'944e5ce45e554be49b7c19e4a600d3b7',1);
/*!40000 ALTER TABLE `store_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_orderdetail`
--

DROP TABLE IF EXISTS `store_orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_orderdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_orderdetail_order_id_97a32c77_fk_store_order_id` (`order_id`),
  KEY `store_orderdetail_product_id_ca3e983e_fk_store_product_id` (`product_id`),
  CONSTRAINT `store_orderdetail_order_id_97a32c77_fk_store_order_id` FOREIGN KEY (`order_id`) REFERENCES `store_order` (`id`),
  CONSTRAINT `store_orderdetail_product_id_ca3e983e_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_orderdetail`
--

LOCK TABLES `store_orderdetail` WRITE;
/*!40000 ALTER TABLE `store_orderdetail` DISABLE KEYS */;
INSERT INTO `store_orderdetail` VALUES
(1,1,5333,1,84),
(2,1,9,1,79),
(3,1,429,1,4),
(4,1,259,2,56),
(5,2,798,2,82),
(6,1,689,2,83),
(7,1,109,2,50),
(8,2,210,2,30),
(9,2,198,2,18),
(10,1,130,2,71),
(11,3,45,2,80),
(12,1,549,3,64),
(13,1,429,3,4),
(14,1,9,3,79),
(15,1,549,4,64),
(16,1,429,4,4),
(17,1,9,4,79),
(18,10,5991.67,5,43),
(19,2,3915,6,58),
(20,2,3308.33,6,57),
(21,2,8165,6,61),
(22,1,1999,7,85),
(23,1,1139,7,86),
(24,1,719,7,43),
(25,1,529,7,19),
(26,1,549,8,64),
(27,1,429,8,4),
(28,1,9,8,79),
(29,1,5333,9,84),
(30,1,429,9,4),
(31,1,9,9,79),
(32,1,2790,10,87),
(33,1,429,10,4),
(34,1,9,10,79),
(35,2,758,11,88),
(36,1,699,11,89),
(37,1,159,11,38),
(38,3,45,11,80),
(39,1,129,11,52),
(40,2,210,11,30),
(41,1,2790,11,87),
(42,1,369,11,90),
(43,4,36,11,79),
(44,1,159,11,91),
(45,1,149,11,92),
(46,1,248,11,93);
/*!40000 ALTER TABLE `store_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ref` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `short_desc` varchar(100) DEFAULT NULL,
  `desc` longtext NOT NULL,
  `price` double NOT NULL,
  `pic` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_product_category_id_c18cc4e7_fk_store_category_id` (`category_id`),
  KEY `store_product_supplier_id_d57cfd56_fk_store_supplier_id` (`supplier_id`),
  CONSTRAINT `store_product_category_id_c18cc4e7_fk_store_category_id` FOREIGN KEY (`category_id`) REFERENCES `store_category` (`id`),
  CONSTRAINT `store_product_supplier_id_d57cfd56_fk_store_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `store_supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES
(1,'147148','Gibson Les Paul Custom EB GH','Guitare électrique 22 frettes. Corps et manche en acajou, table en érable et touche en ébène...','<h2>Guitare électrique</h2>\r\n<ul>\r\n  <li>Custom Shop</li>\r\n  <li>Corps en acajou</li>\r\n  <li>Table bombée en érable</li>\r\n  <li>Manche en acajou (tenon long)</li>\r\n  <li>Touche en ébène</li>\r\n  <li>Repères blocs en nacre</li>\r\n  <li>22 frettes</li>\r\n  <li>Diapason: 628 mm</li>\r\n  <li>Filet 5 plis</li>\r\n  <li>1 micro double bobinage 490R (manche)</li>\r\n  <li>1 micro double bobinage 498T (chevalet)</li>\r\n  <li>Chevalet Tune-o-matic</li>\r\n  <li>Cordier Stop Bar</li>\r\n  <li>Accastillage doré</li>\r\n  <li>Couleur: Ebony</li>\r\n  <li>Livrée en étui</li>\r\n  <li>Fabriquée aux USA</li>\r\n</ul>',3741.666666666667,'147148.jpg',20000,4,3,'2022-08-29 00:39:51.176022',1),
(2,'545731','Fender Kingfish Tele Deluxe','Guitare électrique 21 frettes. Touche en palissandre, corps en aulne, manche en érable...','<h2>Guitare électrique</h2>\r\n<ul>\r\n  <li>Corps en aulne</li>\r\n  <li>Manche vissé en érable</li>\r\n  <li>Touche en palissandre</li>\r\n  <li>Repères \"points\" Perloïd blanc</li>\r\n  <li>Profil du manche en V</li>\r\n  <li>Diapason: 648 mm (25,5\")</li>\r\n  <li>Rayon de la touche: 12\"</li>\r\n  <li>Largeur au sillet: 42,9 mm (1,69\")</li>\r\n  <li>Sillet en os</li>\r\n  <li>21 frettes Medium Jumbo</li>\r\n  <li>2 micros double bobinage Fender Kingfish Custom</li>\r\n  <li>2 réglages de volume</li>\r\n  <li>2 réglages de tonalité</li>\r\n  <li>Sélecteur 3 positions</li>\r\n  <li>Pickguard 3 plis noir</li>\r\n  <li>Chevalet Adjusto-Matic</li>\r\n  <li>Cordier</li>\r\n  <li>Mécaniques Fender Vintage</li>\r\n  <li>Accastillage nickelé</li>\r\n  <li>Couleur: Mississippi Night</li>\r\n  <li>Livrée en étui Deluxe</li>\r\n  <li>Fabriquée aux USA</li>\r\n</ul>',2036.6666666666667,'545731.jpg',20000,4,1,'2022-08-29 00:39:51.176022',1),
(3,'502025','Epiphone Casino Worn Ebony','Guitare électrique 22 frettes. Corps et table en érable, manche en acajou...','<h2>Guitare électrique</h2>\r\n<ul>\r\n  <li>Semi-Hollow</li>\r\n  <li>Table en contreplaqué d\'érable</li>\r\n  <li>Corps en contreplaqué d\'érable</li>\r\n  <li>Manche en acajou</li>\r\n  <li>Touche en laurier indien</li>\r\n  <li>Repères trapézoïdes</li>\r\n  <li>Tête classique en forme d\'aile de colombe inclinée</li>\r\n  <li>Filet couleur crème</li>\r\n  <li>Diapason: 628 mm (24,724\")</li>\r\n  <li>Largeur au sillet: 43 mm (1,693\")</li>\r\n  <li>Sillet Graph Tech NuBone</li>\r\n  <li>22 frettes</li>\r\n  <li>2 micros Epiphone Pro P90</li>\r\n  <li>Chevalet LockTone Tune-o-matic</li>\r\n  <li>Couleur: Worn Ebony</li>\r\n</ul>',370,'502025.jpg',20000,4,4,'2022-08-29 00:39:51.176022',1),
(4,'422011','Marshall DSL5CR','Amplificateur combo à lampe 5W. 2 canaux...','<h2>Combo guitare</h2>\r\n<ul>\r\n  <li>Série Reissue</li>\r\n  <li>Son authentique DSL</li>\r\n  <li>Circuit Low-Power de 5 Watt à 0,5 Watt</li>\r\n  <li>2 canaux commutables par footswitch: Classic Gain & Ultra Gain</li>\r\n  <li>1 haut-parleur 10\" Celestion Ten-30</li>\r\n  <li>Lampes de préamplification: 2 x ECC83</li>\r\n  <li>Lampe d\'amplification: 1 x 12BH7/ECC99</li>\r\n  <li>Bouton Tone Shift pour configuration des médiums</li>\r\n  <li>Commutateur Bass pour ajout d\'un Bass Boost résonnant</li>\r\n  <li>Contrôles indépendants du volume et du gain pour les deux canaux</li>\r\n  <li>Contrôle de tonalité commun (aigus, médiums, graves, réverbération)</li>\r\n  <li>Sortie ligne émulée</li>\r\n  <li>Boucle d\'effets en série</li>\r\n  <li>Dimensions: (L x P x H): 450 x 240 x 420 mm</li>\r\n  <li>Poids: 12,7 kg</li>\r\n  <li>Footswitch incl.</li>\r\n</ul>',357.5,'422011.jpg',19992,10,2,'2022-08-29 00:39:51.176022',1),
(5,'429353','Fender Rumble Studio 40','Amplificateur combo numérique à transistors, 40 Watts avec égaliseur 3 bandes...','<h2>Combo basse numérique</h2>\r\n<ul>\r\n  <li>Contient plus de 15 modèles d\'amplificateurs et plus de 40 effets</li>\r\n  <li>Puissance: 40 Watt</li>\r\n  <li>1 haut-parleur 10\" Fender Special Design</li>\r\n  <li>1 moteur à compression</li>\r\n  <li>1 entrée sur Jack 6,3 mm</li>\r\n  <li>Contrôles: Gain, Bass, Middle, Treble, Master</li>\r\n  <li>3 boutons Layer, encodeur, bouton FX, bouton Save, bouton Menu, bouton Tap</li>\r\n  <li>Boucle d\'effets</li>\r\n  <li>Sortie ligne stéréo sur XLR</li>\r\n  <li>Entrée Aux sur mini Jack 3,5 mm</li>\r\n  <li>Sortie casque sur mini Jack 3,5 mm</li>\r\n  <li>Sortie enregistrement sur port USB</li>\r\n  <li>Connectivité Wi-Fi</li>\r\n  <li>Streaming audio Bluetooth</li>\r\n  <li>Compatible avec l\'application Fender Tone</li>\r\n  <li>Dimensions (H x L x P): 429 x 419 x 304 mm</li>\r\n  <li>Poids: 8,6 kg</li>\r\n</ul>',351.6666666666667,'429353.jpg',19999,11,1,'2022-08-29 00:39:51.176022',1),
(6,'331985','Fender Rumble 40','Amplificateur combo de classe D 40 Watts avec égaliseur 4 bandes...','<h2>Combo basse</h2>\r\n<ul>\r\n  <li>Classe D</li>\r\n  <li>Puissance: 40 Watt</li>\r\n  <li>1 haut-parleur 10\" Fender Special Design</li>\r\n  <li>1 entrée sur Jack</li>\r\n  <li>1 canal</li>\r\n  <li>Commutateur Bright</li>\r\n  <li>Commutateur Contour Vintage</li>\r\n  <li>Overdrive</li>\r\n  <li>Contrôles: Gain, Bright on/off, Contour on/off, Vintage on/off, Drive, Overdrive on/off, Level, Bass, low- Mid, high-Mid, Treble</li>\r\n  <li>Sortie casque</li>\r\n  <li>Entrée Aux sur mini Jack stéréo 3,5 mm</li>\r\n  <li>Sortie ligne sur XLR avec interrupteur de masse</li>\r\n  <li>Boutons radio \"Soft Touch\"</li>\r\n  <li>Revêtement en vinyle noir texturé</li>\r\n  <li>Grille en tissu argenté</li>\r\n  <li>Dimensions (HxLxP): 419 x 419 x 304 mm</li>\r\n  <li>Poids: 8,16 kg</li>\r\n</ul>',249.16666666666669,'331985.jpg',20000,11,1,'2022-08-29 00:39:51.176022',1),
(7,'510890','Fender 68 Custom Vibro Champ','Amplificateur combo à lampe de 5 Watts, 1 canal...','<h2>Combo guitare</h2>\r\n<ul>\r\n  <li>1 canal</li>\r\n  <li>Puissance: 5 Watt</li>\r\n  <li>Lampes de préamplification: 2 x 12AX7</li>\r\n  <li>Lampe d\'amplification: 1 x 6L6</li>\r\n  <li>1 haut-parleur 10\" Celestion TEN 30</li>\r\n  <li>Contrôles: Volume, Treble, Bass, Reverb, Speed, Intensity</li>\r\n  <li>Effets: Réverbération, Vibrato</li>\r\n  <li>2 entrées instrument sur Jack 6,3 mm</li>\r\n  <li>Entrée footswitch sur Jack 6,3 mm</li>\r\n  <li>Sortie baffle externe sur Jack 6,3 mm</li>\r\n  <li>Dimensions (LxPxH): 429 x 206 x 356 mm</li>\r\n  <li>Poids: 9,5 kg</li>\r\n</ul>',729.1666666666667,'510890.jpg',20000,10,1,'2022-08-29 00:39:51.176022',1),
(8,'439257','Fender Player Series P-Bass MN 3TS','Basse électrique 4 cordes, 20 frettes. Table en aulne, manche et touche en érable, diapason long...','<h2>Basse électrique</h2>\r\n<ul>\r\n  <li>4 cordes</li>\r\n  <li>Corps en aulne</li>\r\n  <li>Manche en érable mat</li>\r\n  <li>Touche en érable</li>\r\n  <li>20 frettes</li>\r\n  <li>Largeur au sillet: 41,3 mm</li>\r\n  <li>Diapason: 864 mm (Long Scale)</li>\r\n  <li>1 micro simple bobinage splitté New Player Alnico V Precision</li>\r\n  <li>1 réglage de volume</li>\r\n  <li>1 réglage de tonalité</li>\r\n  <li>Mécaniques ouvertes Standard</li>\r\n  <li>Cordes Fender 7250M / .045 - .105</li>\r\n  <li>Couleur: 3-Tone Sunburst</li>\r\n</ul>',695.8333333333334,'439257.jpg',20000,9,1,'2022-08-29 07:45:06.026940',1),
(9,'439273','Fender Player Series P-Bass PF 3TS','Basse électrique 4 cordes, 20 frettes. Table en aulne, manche en érable, touche en pau ferro...','<h2>Basse électrique</h2>\r\n<ul>\r\n  <li>4 cordes</li>\r\n  <li>Corps en aulne</li>\r\n  <li>Manche en érable mat</li>\r\n  <li>Touche en pau ferro</li>\r\n  <li>20 frettes</li>\r\n  <li>Largeur au sillet: 41,3 mm</li>\r\n  <li>Diapason: 864 mm (Long Scale)</li>\r\n  <li>1 micro simple bobinage splitté New Player Alnico V Precision</li>\r\n  <li>1 réglage de volume</li>\r\n  <li>1 réglage de tonalité</li>\r\n  <li>Mécaniques ouvertes Standard</li>\r\n  <li>Cordes Fender 7250M / .045 - .105</li>\r\n  <li>Couleur: 3-Tone Sunburst</li>\r\n</ul>',704.1666666666667,'439273.jpg',20000,9,1,'2022-08-29 07:49:26.105457',1),
(10,'477249','Fender AM Ultra J Bass MN Texas Tea','Basse électrique 4 cordes, 21 frettes. Corps en aulne, Manche et touche en érable, diapason long...','<h2>Basse électrique</h2>\r\n<ul>\r\n  <li>4 cordes</li>\r\n  <li>Corps en aulne</li>\r\n  <li>Manche vissé en érable</li>\r\n  <li>Touche en érable</li>\r\n  <li>Repères \"points\" Perloïd noir</li>\r\n  <li>Profil du manche: Modern D</li>\r\n  <li>Rayon de la touche composé: 254 - 356 mm (10\" - 14\")</li>\r\n  <li>Diapason: 864 mm (34,02\")</li>\r\n  <li>Largeur au sillet: 38 mm (1,5\")</li>\r\n  <li>Sillet en os</li>\r\n  <li>21 frettes Medium Jumbo</li>\r\n  <li>2 micros simple bobinage Ultra Noiseless Vintage Jazz Bass</li>\r\n  <li>Contrôles: Master Volume, Pan Pot (Pickup Blend), Treble Boost/Cut, Midrange Boost/Cut, Bass Boost/Cut et contrôle de tonalité passif</li>\r\n  <li>Sélecteur miniature actif/passif</li>\r\n  <li>Pickguard 1 pli en aluminium anodisé or</li>\r\n  <li>Chevalet Hi Mass Vintage avec 4 pontets</li>\r\n  <li>Mécaniques Fender \"F\" Light-Weight Vintage</li>\r\n  <li>Accastillage nickel/chrome</li>\r\n  <li>Cordes Fender USA Bass 7250M NPS .045 - .105</li>\r\n  <li>Couleur: Texas Tea</li>\r\n  <li>Livrée en étui Elite</li>\r\n  <li>Fabriquée aux USA</li>\r\n</ul>',1915.8333333333335,'477249.jpg',20000,9,1,'2022-08-29 07:53:16.633034',1),
(11,'516698','Squier Aff. Jazz Bass MN Black','Basse électrique 20 frettes. Corps en peuplier, manche et touche en érable, diapason long...','<h2>Basse électrique</h2>\r\n<ul>\r\n  <li>4 cordes</li>\r\n  <li>Série Affinity</li>\r\n  <li>Corps en peuplier</li>\r\n  <li>Manche vissé en érable</li>\r\n  <li>Profil du manche en C</li>\r\n  <li>Touche en érable</li>\r\n  <li>Repères \"points\" noirs</li>\r\n  <li>20 frettes Medium Jumbo</li>\r\n  <li>Sillet en os synthétique</li>\r\n  <li>Largeur au sillet: 38,1 mm (1,5\")</li>\r\n  <li>Diapason: 864 mm (34\")</li>\r\n  <li>Rayon de la touche: 241 mm (9,49\")</li>\r\n  <li>Pickguard 3 plis noir</li>\r\n  <li>2 micros simple bobinage Jazz Bass avec aimants en céramique</li>\r\n  <li>2 réglages de volume</li>\r\n  <li>1 réglage de tonalité</li>\r\n  <li>Chevalet Standard avec 4 pontets</li>\r\n  <li>Accastillage chromé</li>\r\n  <li>Mécaniques style Vintage</li>\r\n  <li>Cordes NPS .045 - .105</li>\r\n  <li>Couleur: Noir</li>\r\n</ul>',212.5,'516698.jpg',20000,9,5,'2022-08-29 08:02:47.109731',1),
(12,'522180','Ibanez XPTB620-BKF','Guitare électrique 24 frettes. Corps en okoumé, manche en érable et noyer, touche en ébène...','<h2>Guitare électrique</h2>\r\n<ul>\r\n  <li>Série Iron Label</li>\r\n  <li>Corps en okoumé</li>\r\n  <li>Manche traversant 5 pièces en érable/noyer</li>\r\n  <li>Touche en ébène</li>\r\n  <li>Profil du manche: Wizard II</li>\r\n  <li>Epaisseur à la 1ère frette: 19 mm</li>\r\n  <li>Epaisseur à la 12ème frette: 21 mm</li>\r\n  <li>Rayon de la touche: 400 mm</li>\r\n  <li>Sillet bloquant</li>\r\n  <li>Largeur au sillet: 43 mm</li>\r\n  <li>Diapason: 648 mm</li>\r\n  <li>24 frettes Jumbo</li>\r\n  <li>2 micros double bobinage DiMarzio D-Activator</li>\r\n  <li>1 réglage de volume</li>\r\n  <li>1 réglage de tonalité</li>\r\n  <li>Sélecteur 3 positions</li>\r\n  <li>Vibrato Edge-Zero II</li>\r\n  <li>Accastillage noir</li>\r\n  <li>Mécaniques Gotoh</li>\r\n  <li>Cordes .010 - .052</li>\r\n  <li>Couleur: Black Flat</li>\r\n  <li>Livrée en housse</li>\r\n</ul>',1082.5,'522180.jpg',20000,4,6,'2022-08-29 08:26:43.921631',1),
(13,'505579','Ramirez Anniversary','Guitare classique exceptionnelle. Edition limitée à 125 exemplaires...','<h2>Guitare classique</h2>\r\n<b class=\"small\">Edition limitée à 125 exemplaires<b>\r\n<ul>\r\n  <li>Table en cèdre massif</li>\r\n  <li>Fond et éclisses en palissandre de Madagascar massif</li>\r\n  <li>Manche en cedro</li>\r\n  <li>Touche en ébène</li>\r\n  <li>Diapason: 650 mm</li>\r\n  <li>Largeur au sillet: 52 mm</li>\r\n  <li>Mécaniques uniques</li>\r\n  <li>Finition: Haute brillance</li>\r\n  <li>Etui Ramirez en ABS incl.</li>\r\n  <li>Fabriquée en Espagne</li>\r\n</ul>',20741.666666666668,'505579.jpg',250000,13,7,'2022-08-29 13:30:47.749894',1),
(15,'468428','Focusrite Scarlett Solo 3rd Gen','Interface audio 2 canaux USB 2.0. Résolution 24 bits / 192 kHz...','<h2>Interface audio 2 canaux USB 2.0</h2>\r\n<ul>\r\n  <li>Connexion USB-C</li>\r\n  <li>Résolution Max 24 Bit / 192 kHz</li>\r\n  <li>1 préampli micro Scarlett</li>\r\n  <li>Alimentation fantôme +48 V</li>\r\n  <li>Fonction Air commutable</li>\r\n  <li>1 entrée micro XLR</li>\r\n  <li>1 entrée ligne/instrument jack 6,3 mm</li>\r\n  <li>2 sorties ligne : jack 6,3 mm symétriques</li>\r\n  <li>Sortie casque stéréo : jack 6,3 mm</li>\r\n  <li>Port USB-C</li>\r\n  <li>Convient pour PC/Mac</li>\r\n  <li>Dimensions (L x H x P) : 143,5 x 43,5 x 95,8 mm</li>\r\n  <li>Poids : 0,32 kg</li>\r\n  <li>Livrée avec câble USB (type C vers A) ainsi qu\'Ableton Live Lite, Focusrite Red 2 & Red 3 Plug-in Suite, Softube Time & Tone Bundle et un instrument logiciel de 4 XLN Audio Addictive Key de votre choix</li>\r\n</ul>',90.83333333333334,'468428.jpg',19998,16,9,'2022-09-05 10:21:32.904908',1),
(16,'407080','Roland Rubix22','Interface audio USB 2 entrées / 2 sorties. Résolution 24 bits jusqu\'à 192 kHz...','<h2>Interface audio USB</h2>\r\n<ul>\r\n  <li>Pour Mac, PC et iPad</li>\r\n  <li>Résolutions: 24 bits / 44.1 kHz, 48 kHz, 96 kHz, 192 kHz</li>\r\n  <li>2 entrées / 2 sorties</li>\r\n  <li>2 préamplis micro faible bruit avec prises combo jack / XLR</li>\r\n  <li>Entrée haute impédance pour guitares / basses et autres sources à haute impédance</li>\r\n  <li>Conception extrêmement blindée et silencieuse</li>\r\n  <li>Boîtier métallique robuste</li>\r\n  <li>Entrée et Sortie MIDI</li>\r\n  <li>2 sorties master jack 6,3 mm</li>\r\n  <li>1 sortie casque (réglable séparément)</li>\r\n  <li>Pilote compatible classe USB avec faible latence</li>\r\n  <li>Grands écrans LED</li>\r\n  <li>Alimentation fantôme 48 V et entrée Hi-Z commutables séparément</li>\r\n  <li>Interrupteur de masse et commutateur de monitoring direct</li>\r\n  <li>Logiciel Ableton Live Lite et câble USB inclus</li>\r\n  <li>Dimensions (L x P x H): 145 x 165 x 46 mm</li>\r\n  <li>Poids: 1 kg</li>\r\n</ul>',124.16666666666667,'407080.jpg',19999,16,10,'2022-09-05 10:33:06.865716',1),
(18,'135709','Sony MDR-7506','Casque studio fermé. Bande passante 10 Hz - 20 kHz...','<h2>Casque studio/DJ</h2>\r\n<ul>\r\n  <li>Fermé</li>\r\n  <li>Circum-aural</li>\r\n  <li>Impédance: 63 Ohm</li>\r\n  <li>SPL max.: 106 dB</li>\r\n  <li>Bande passante: 10 - 20.000 Hz</li>\r\n  <li>Câble de 1,2 m avec fiche mini Jack stéréo 3,5 mm</li>\r\n  <li>Adaptateur vissable 6,3 mm incl.</li>\r\n  <li>Poids avec câble: 298 g</li>\r\n  <li>Poids sans câble: 230 g</li>\r\n  <li>Trousse incl.</li>\r\n</ul>',82.5,'135709.jpg',19995,20,11,'2022-09-05 11:09:30.428994',1),
(19,'542889','Neumann NDH 20 Black Edition','Casque studio. Bande passante 5 Hz - 30 kHz...','<h2>Casque studio</h2>\r\n<ul>\r\n  <li>Bande passante: 5 - 30000 Hz</li>\r\n  <li>Impédance: 150 Ohm</li>\r\n  <li>Transducteurs dynamiques de 38 mm avec aimants néodyme</li>\r\n  <li>Puissance nominale: 200 mW</li>\r\n  <li>Sensibilité: 114 dB SPL (1 kHz /1 Vrms)</li>\r\n  <li>Taux de distorsion harmoniquer: < 0.10% (1 kHz, 100 dB SPL)</li>\r\n  <li>Coussinets d\'oreille en mousse à mémoire de forme</li>\r\n  <li>Bandeau réglable en acier flexible</li>\r\n  <li>Coques d\'écouteurs en aluminium léger</li>\r\n  <li>Casque pliable</li>\r\n  <li>Ecouteurs avc marquage L/R</li>\r\n  <li>Prise mini Jack stéréo 3,5 mm</li>\r\n  <li>Poids sans câble: 388 g</li>\r\n  <li>Couleur: Noir</li>\r\n  <li>Adaptateur Jack stéréo 6,3 mm, câble de connexion symétrique, sac en tissu et guide de démarrage rapide incl.</li>\r\n</ul>',440.83333333333337,'542889.jpg',19999,20,12,'2022-09-05 11:17:46.021950',1),
(20,'396901','Genelec 8350 APM','Moniteur de studio actif 2 voies 200 + 150 Watts (unité). Réponse en fréquence 33 Hz - 22kHz...','<h2>Moniteur de studio actif 2 voies</h2>\r\n<ul>\r\n  <li>Réponse en fréquence: 33 - 22 kHz (-6 dB) ou 38 Hz - 20 kHz (±1,5 dB)</li>\r\n  <li>SPL max: 121 dB (crête pour une paire @ 1 mètre)</li>\r\n  <li>Haut-parleur 8\" et tweeter 1\"</li>\r\n  <li>Amplification: 200 Watt + 150 Watt</li>\r\n  <li>Connexions: 2x XLR, 2x RJ45, 2x XLR AES/EBU</li>\r\n  <li>Blindage magnétique</li>\r\n  <li>Pad d\'isolation inclus</li>\r\n  <li>Dimensions: 433 x 286 x 278 mm (HxLxP)</li>\r\n  <li>Poids: 12,8 kg</li>\r\n  <li>Prix pour une pièce</li>\r\n</ul>',1482.5,'396901.jpg',40000,22,13,'2022-09-05 11:27:43.122515',1),
(21,'365449','Genelec 7040 APM','Caisson de basses actif 6,5\" 50 Watts. Réponse en fréquence 30 Hz - 90 Hz...','<h2>Caisson de basses actif 6,5\"</h2>\r\n<ul>\r\n  <li>Puissance: 50 Watts</li>\r\n  <li>Réponse en fréquence: 30 - 90 Hz (-6 dB), 33 - 85 Hz (±3 dB)</li>\r\n  <li>SPL max: 100 dB</li>\r\n  <li>2x entrées XLR</li>\r\n  <li>2x sorties XLR</li>\r\n  <li>Dimensions: 410 x 350 x 205 mm (HxLxP)</li>\r\n  <li>Poids: 11,3 kg</li>\r\n</ul>',540.8333333333334,'365449.jpg',20000,23,13,'2022-09-05 11:48:17.393052',1),
(23,'397647','Genelec 7360 APM','Caisson de basses actifs 10\" 300 Watts. Réponse en fréquence 19 Hz - 100 Hz','<h2>Caisson de basses actif 10\"</h2>\r\n<ul>\r\n  <li>Amplification de classe D</li>\r\n  <li>Puissance: 300 Watt</li>\r\n  <li>Réponse en fréquence: 19 - 100 Hz (-6 dB) / canal LFE: 19 - 150 Hz</li>\r\n  <li>Filtre DSP pour égalisation de pièce</li>\r\n  <li>Adaptation de phase</li>\r\n  <li>Commutateur DIP pour égalisation</li>\r\n  <li>Entrées et sorties XLR analogiques 7.1</li>\r\n  <li>1x entrée XLR AES / EBU</li>\r\n  <li>1x sortie XLR AES / EBU</li>\r\n  <li>Tension d\'alimentation commutable 100 - 240V</li>\r\n  <li>Dimensions (H x L x P): 527 x 462 x 363 mm</li>\r\n  <li>Poids: 27 kg</li>\r\n</ul>',1633.3333333333335,'397647.jpg',20000,23,13,'2022-09-05 11:56:01.282600',1),
(24,'398238','Roland System-8','Synthétiseur plug out 49 touches...','<h2>Synthétiseur Plug Out</h2><ul>  <li>49 touches</li>  <li>Technologie Analog Circuit Behavior (ACB)</li>  <li>Générateur de sons offrant des sons analogiques classiques et des sons dynamiques modernes</li>  <li>Peut contrôler jusqu\'à 3 synthétiseurs Plug Out</li>  <li>Filtres détaillés passe-bas, passe-haut et bande latérale avec réglages haute résolution</li>  <li>Contrôle en temps réel via potentiomètres, curseurs et boutons dédiés</li>  <li>Séquenceur à pas polyphonique avec interface TR-REC, arpégiateur, vocoder et fonctions de mémoire d\'accords polyphoniques</li>  <li>Sorties CV/Gate pour contrôle de synthétiseurs modulaires et instruments Vintage</li>  <li>Large éventail d\'effets intégrés avec contrôleurs dédiés</li>  <li>Interface USB-Audio/MIDI et mode de contrôle</li>  <li>Dimensions: 881 x 364 x 109 mm</li>  <li>Poids: 5,9 kg</li>  <li>Bloc d\'alimentation, licence pour JUPITER-8 PLUG-OUT, JUNO-106 et JX-3P PLUG-OUT</li></ul>',1265.8333333333335,'398238.jpg',19998,24,10,'2022-09-05 12:16:05.574282',1),
(25,'308808','Korg MS-20 mini','Synthétiseur monophonique analogique 37 touches miniatures...','<h2>Synthétiseur monophonique analogique</h2>\r\n<ul>\r\n  <li>37 touches miniatures</li>\r\n  <li>Reproduction du circuit analogique d\'origine</li>\r\n  <li>2 x VCO, 2 x VCA, 2 x VCF, 2 x EG, 1 x LFO</li>\r\n  <li>Filtres passe-haut et passe-bas auto-oscillants avec distorsion</li>\r\n  <li>Processeur de signal externe (ESP)</li>\r\n  <li>Système de patch flexible</li>\r\n  <li>Entrée ligne sur mini Jack 3,5 mm</li>\r\n  <li>Sortie casque sur mini Jack 3,5 mm</li>\r\n  <li>Entrée MIDI</li>\r\n  <li>Port USB</li>\r\n  <li>Dimensions: 493 x 257 x 208 mm</li>\r\n  <li>Poids: 4,8 kg</li>\r\n  <li>Bloc d\'alimentation et 10 câbles de patch incl.</li>\r\n</ul>',462.5,'308808.jpg',20000,24,14,'2022-09-05 12:25:48.122891',1),
(26,'273948','Korg Monotron Duo','Synthétiseur analogique à ruban...','<h2>Synthétiseur analogique à ruban</h2>\r\n<ul>\r\n  <li>2 oscillateurs analogiques (VCO) accordables individuellement</li>\r\n  <li>Circuit de modulation croisée du Korg Mono/Poly</li>\r\n  <li>Clavier de contrôle à bande</li>\r\n  <li>Filtre analogique identique aux modèles Korg MS-10 et MS-20</li>\r\n  <li>Entrée Aux sur mini Jack stéréo</li>\r\n  <li>Haut-parleur intégré</li>\r\n  <li>Sortie casque sur mini Jack stéréo</li>\r\n  <li>Fonctionne avec 2 piles Alkaline AAA</li>\r\n  <li>Dimensions: 120 x 72 x 28 mm</li>\r\n  <li>Poids: 95 g</li>\r\n</ul>',40.833333333333336,'273948.jpg',200000,24,14,'2022-09-05 12:32:59.770415',1),
(27,'543478','Roland J-6','Synthétiseur d\'accords compact AIRA...','<h2>Synthétiseur d\'accords compact AIRA</h2>\r\n<ul>\r\n  <li>Moteur de synthèse Juno-60 (4 voix)</li>\r\n  <li>Technologie de modélisation ACB</li>\r\n  <li>64 presets de son et contrôles pour le filtre et l\'enveloppe</li>\r\n  <li>Effets: Delay et réverbération</li>\r\n  <li>Séquenceur d\'accords programmable avec un maximum de 64 pas et 64 patterns</li>\r\n  <li>Choix parmi 100 accords disponibles</li>\r\n  <li>Les accords peuvent être variés avec des arpèges ou des phrases rythmiques (9 styles avec 12 variations chacun)</li>\r\n  <li>Entrée Mix sur mini Jack stéréo 3,5 mm</li>\r\n  <li>Sortie ligne/casque sur mini Jack stéréo 3,5 mm</li>\r\n  <li>Entrée/sortie Sync sur mini Jack 3,5 mm</li>\r\n  <li>Entrée/sortie MIDI (mini Jack stéréo 3,5 mm, type A)</li>\r\n  <li>Port USB-C pour USB audio/MIDI et alimentation</li>\r\n  <li>Batterie lithium-ion intégrée pour jusqu\'à 3,5 heures de fonctionnement</li>\r\n  <li>Dimensions (L x P x H): 188 x 106 x 36,2 mm</li>\r\n  <li>Poids: 295 g</li>\r\n  <li>Câble USB incl.</li>\r\n</ul>',165.83333333333334,'543478.jpg',20000,24,10,'2022-09-05 12:37:13.542255',1),
(28,'379515','Yamaha Montage 7','Workstation / Synthétiseur 76 touches...','<h2>Synthétiseur</h2>\r\n<ul>\r\n  <li>Synthétiseur</li>\r\n  <li>76 touches (FSX)</li>\r\n  <li>Technologie Motion Control Synthesis</li>\r\n  <li>Générateurs de sons FM-X et AWM2 (polyphonie 128 voix chacun)</li>\r\n  <li>1920 presets de performances</li>\r\n  <li>640 performances utilisateur</li>\r\n  <li>Bibliothèque de 5120 performances</li>\r\n  <li>Mode Live Set pour organiser les sons en fonction de listes ou de thèmes définis</li>\r\n  <li>Fonctions de clavier maître</li>\r\n  <li>Ecran couleur tactile VGA 7\"</li>\r\n  <li>ROM de formes d\'ondes de 5,67 GB</li>\r\n  <li>Flash ROM de 1,75 GB</li>\r\n  <li>Seamless Sound Switching (commutation transparente entre les performances)</li>\r\n  <li>Super Knob pour contrôler en parallèle différents paramètres</li>\r\n  <li>Suiveur d\'enveloppe</li>\r\n  <li>Générateur de sons AWM2 directement compatible au MOTIF XF</li>\r\n  <li>Logiciel de conversion pour sons DX et TX</li>\r\n  <li>Fonctions OS V3: Séquenceur de patterns avec 128 patterns</li>\r\n  <li>16 pistes, 8 scènes de 256 mesure, mini filtre, fichier Wave, LFO haute vitesse, Global Micro Tuning et plus encore</li>\r\n  <li>USB audio/MIDI (également pour appareils iOS) avec 24 bits / 44,1 kHz pour 16 canaux audio ou 192 kHz pour 4 canaux audio stéréo</li>\r\n  <li>4 sorties ligne (2 x stéréo) sur Jack 6,3 mm symétriques</li>\r\n</ul>',2832.5,'379515.jpg',20000,25,15,'2022-09-05 13:00:54.927995',1),
(29,'507060','Korg Nautilus 61','Workstation 61 touches semi-lestées avec 9 moteurs de synthèse...','<h2>Workstation</h2><ul>  <li>61 touches semi-lestées sensibles à la vélocité</li>  <li>9 moteurs de synthèse: SGX-2, EP-1, HD-1, AL-1, CX-3, STR-1, MOD-7, MS-20EX & PolysixEX</li>  <li>Polyphonie jusqu\'à 200 voix (suivant le moteur de synthèse)  <li>Ecran TouchView 7\" (800 x 480 pixels) avec mode sombre</li>  <li>Contrôleur en temps réel (rétractable) pour le réglage des sons</li>  <li>Arpégiateur polyphonique</li>  <li>Piste de batterie et séquenceur pas à pas (4 scènes chacun)</li>  <li>Fonction Set-List</li>  <li>Fonction de recherche et de prévisualisation des sons et des combinaisons</li>  <li>Fonction Favorite-Sound</li>  <li>EQ 3 bandes pour les pistes individuelles (MIDI et audio)</li>  <li>Technologie Smooth Sound (empêche les décrochages lors du changement de sons)</li>  <li>Contrôle Dynamics pour des réglages sonores expressifs</li>  <li>Boutons Mode & Quick Access</li>  <li>Fonction d\'échantillonnage</li>  <li>Séquenceur MIDI 16 pistes</li>  <li>Enregistreur audio 16 pistes (24 bits/48 kHz)</li>  <li>16 processeurs d\'effets</li>  <li>2 chemins d\'effets Master et 2 effets totaux</li>  <li>Port USB type A pour contrôleur MIDI et connexion de clavier</li>  <li>Port USB type B pour USB MIDI et audio</li>  <li>Sorties (L/Mono, R) sur Jack 6,3 mm</li>  <li>4 sorties individuelles sur Jack 6,3 mm symétriques</li>  <li>Sortie casque sur Jack stéréo 6,3 mm</li>  <li>2 entrées (Mic/Line) sur Jack 6,3 symétriques</li>  <li>MIDI In/Out/Thru</li>  <li>Connexion pour pédale d\'expression (reconnaissance continue)</li>  <li>Connexion pour pédale switch assignable</li>  <li>Connexion pour pédale assignable</li>  <li>Disque dur SSD 60 GB intégré (2,5\")</li>  <li>Dimensions: 1062 x 386 x 116 mm</li>  <li>Poids: 13 kg</li>  <li>Bundle de logiciels (téléchargement) incl.: Logiciel d\'instruments Korg, Reason Lite, Ozone Elements, Skoove</li></ul>',1498.3333333333335,'507060.jpg',20000,25,14,'2022-09-05 13:06:11.095371',1),
(30,'105768','Shure SM57 LC','Micro dynamique cardioïde polyvalent...','<h2>Micro dynamique polyvalent</h2>\r\n<ul>\r\n  <li>Directivité: cardioïde</li>\r\n  <li>Réponse en fréquence: 40 Hz - 15 kHz</li>\r\n  <li>SPL max: 94 SPL</li>\r\n  <li>Sensibilité: -56,0 dBV / Pa (1,6 mV)</li>\r\n  <li>Impédance: 310 Ohm</li>\r\n  <li>Dimensions: 157 x 32 mm</li>\r\n  <li>Poids: 284 g</li>\r\n  <li>Pince micro avec adaptateur de pas de vis 3/8\" et trousse de transport inclus</li>\r\n  <li>Idéal pour les caisses claires et autres percussions, guitare électrique et certainement beaucoup plus encore!</li>\r\n</ul>',87.5,'105768.jpg',19992,18,16,'2022-09-05 13:22:48.317646',1),
(31,'105825','Neumann U87 Ai','Micro <b>légendaire</b> à condensateur large membrane...','<h2>Micro à condensateur large membrane</h2>\r\n<ul>\r\n  <li>Directivités: omnidirectionnelle, cardioïde et figure en 8</li>\r\n  <li>Réponse en fréquence: 20 Hz - 20 kHz</li>\r\n  <li>SPL max: 127 dB</li>\r\n  <li>Pad atténuateur: -10 dB</li>\r\n  <li>Micro légendaire pour les voix et overheads</li>\r\n</ul>',2049.166666666667,'105825.jpg',19999,18,12,'2022-09-05 13:28:16.813108',1),
(32,'359571','Rode NTR','Micro à ruban actif...','<h2>Micro à ruban actif</h2>\r\n<ul>\r\n  <li>Ruban d\'aluminium extrêmement fin (1,8 micron)</li>\r\n  <li>Logement du cadre ruban découplé avec le boitier, assure la protection lors du transport</li>\r\n  <li>Transformateur spécialement mis au point et fabriqué pour ce micro</li>\r\n  <li>Pré-amplificateur à faible bruit</li>\r\n  <li>Réponse en fréquence: 20 - 20000 Hz</li>\r\n  <li>Alimentation fantôme 48V</li>\r\n  <li>Haute sensibilité (30 mV)</li>\r\n  <li>Bruit faible (15 dBA)</li>\r\n  <li>SPL: 130 dB</li>\r\n  <li>Impédance de sortie: 200 Ohms</li>\r\n  <li>Longueur: 21,6 cm</li>\r\n  <li>Diamètre: 6,5 cm</li>\r\n  <li>Poids: 1047 g</li>\r\n  <li>Trépied RM2 et étui inclus</li>\r\n</ul>',460.83333333333337,'359571.jpg',20000,18,17,'2022-09-05 13:35:38.400756',1),
(33,'396310','Rupert Neve Designs RNHP','Amplificateur casque de précision...','<h2>Ampli casque de précision</h2>\r\n<ul>\r\n  <li>Basé sur l\'ampli casque utilisé dans le 5060 Centerpiece</li>\r\n  <li>3 entrées (ligne, RCA, mini-jack 3,5 mm TRS)</li>\r\n  <li>Impédance de sortie : 0,08 Ohm @ 1 kHz</li>\r\n  <li>Impédance de charge : 16 - 150 Ohm (entrée @ 0 dB)</li>\r\n  <li>Réponse en fréquence : ±0,2 dB de 10 Hz à 120 kHz</li>\r\n  <li>Alimentation électrique : 24 V via un bloc d\'alimentation externe de 6 Watt (inclus dans la livraison) ou via batterie</li>\r\n  <li>Dimensions (LxPxH) : 165 x 117 x 48 mm</li>\r\n</ul>',582.5,'396310.jpg',20000,21,18,'2022-09-05 13:45:35.306159',1),
(34,'328094','SPL Phonitor 2 Black','Amplificateur casque / pré-ampli / contrôleur d\'enceintes...','<h2>Pré-ampli / contrôleur d\'enceinte</h2>\r\n<ul>\r\n  <li>Réglage de niveau commutable: + 6 dB, + 12 dB</li>\r\n  <li>Pré-amplification du signal niveau ligne pour 3 sources</li>\r\n  <li>Simulation de lecture sur enceinte via le casque</li>\r\n  <li>Télécommande pour contrôle de volume (motorisé)</li>\r\n  <li>Convient pour tous les types de casque: dynamique, symétrique, électrostatique</li>\r\n  <li>Technology 120 V</li>\r\n  <li>VU-mètres analogiques</li>\r\n  <li>Fonction muet pour casque et enceinte</li>\r\n  <li>Alimentation intégrée</li>\r\n  <li>Format de bureau</li>\r\n  <li>Dimensions: 325 x 275 x 92 mm</li>\r\n</ul>',1457.5,'328094.jpg',20000,21,19,'2022-09-05 13:58:58.633489',1),
(35,'530726','Roland JD-08','Synthétiseur compact. Réplique du synthétiseur JD-800...','<h2>Synthétiseur compact</h2>\r\n<ul>\r\n  <li>Réplique du synthétiseur JD-800</li>\r\n  <li>Polyphonie 128 voix</li>\r\n  <li>108 formes d\'onde pour des possibilités étendues de design de patch</li>\r\n  <li>Contient 64 presets originaux et 21 nouveaux presets supplémentaires</li>\r\n  <li>256 emplacements mémoire de preset</li>\r\n  <li>Arpégiateur et séquenceur polyphonique 2 parties 64 pas avec enregistrement de mouvement, générateur de patterns aléatoires et mémoire pour 128 patterns</li>\r\n  <li>Multitimbral 2 parties avec polyphonie étendue</li>\r\n  <li>Structure en quatre parties pour la superposition de sons</li>\r\n  <li>Réplique de la section multi-effets à deux étages du JD-800</li>\r\n  <li>Effets intégrés: Distortion, Phaser, Spektrum, Enhancer, Reverb, Chorus, Delay</li>\r\n  <li>3 enveloppes à plusieurs étages</li>\r\n  <li>Interface utilisateur avec curseurs et boutons pour un réglage rapide des paramètres</li>\r\n  <li>Interface audio/MIDI USB-C</li>\r\n  <li>Haut-parleur miniature pour un monitoring direct</li>\r\n  <li>Ecran LED</li>\r\n  <li>Sortie ligne sur mini Jack stéréo 3,5 mm</li>\r\n  <li>Sortie casque sur mini Jack stéréo 3,5 mm</li>\r\n  <li>Entrée ligne sur mini Jack stéréo 3,5 mm</li>\r\n  <li>Entrée horloge sur mini Jack 3,5 mm</li>\r\n  <li>MIDI In/Out sur DIN 5 broches</li>\r\n  <li>Port USB-C</li>\r\n  <li>Alimentation via 4 piles AA (incluses) ou port USB-C</li>\r\n  <li>Compatible avec Boutique Dock DK-01 398239 (optionnel non-fourni)</li>\r\n  <li>Compatible avec Boutique K-25m Keyboard 372624 (optionnel non-fourni)</li>\r\n  <li>Dimensions (LxPxH): 300 x 128 x 49 mm</li>\r\n  <li>Poids avec piles: 840 g</li>\r\n</ul>',315.83333333333337,'530726.jpg',20000,24,10,'2022-09-05 14:24:23.826551',1),
(36,'486110','Elektron Model:Cycles','Groovebox FM 6 pistes...','<h2>Groovebox FM 6 pistes</h2>\r\n<ul>\r\n  <li>6 machines: Kick, Snare, Metal, Perc, Tone, Chord</li>\r\n  <li>4 contrôleurs pour le traitement direct du son en fonction de la machine sélectionnée: Color, Shape, Sweep, Contour</li>\r\n  <li>6 pistes audio également utilisables comme pistes MIDI</li>\r\n  <li>6 pads sensibles à la vélocité</li>\r\n  <li>96 projets</li>\r\n  <li>96 patterns par projet</li>\r\n  <li>Delay et réverbération</li>\r\n  <li>Saisie en temps réel et pas à pas des notes et des paramètres</li>\r\n  <li>Sortie casque sur Jack 6,3 mm</li>\r\n  <li>2 sorties sur Jack 6,3 mm TRS</li>\r\n  <li>MIDI In: 1 mini Jack audio standard 3,5 mm TRS</li>\r\n  <li>MIDI Out/Thru: 1 mini Jack audio standard 3,5 mm TRS</li>\r\n  <li>Dimensions avec boutons et pieds en caoutchouc: 270 x 180 x 40 mm</li>\r\n  <li>Poids: env. 814 g</li>\r\n  <li>Bloc d\'alimentation PSU-4, câble USB et adaptateur MIDI (fiche 5 broches vers mini Jack 3,5 mm TRS)</li>\r\n</ul>',265.83333333333337,'486110.jpg',20000,26,20,'2022-09-05 14:47:08.968293',1),
(37,'102976','Alesis SR16','Boîte à rythmes avec 16 voix de polyphonie et 233 sonorités naturelles stéréo...','<h2>Boîte à rythmes</h2>\r\n<ul>\r\n  <li>Polyphonie 16 voix</li>\r\n  <li>233 sonorités naturelles stéréo</li>\r\n  <li>50 Preset + 50 kits utilisateur</li>\r\n  <li>Tempo réglable de 20 à 255 bpm</li>\r\n  <li>4 sorties (2 sorties stéréo)</li>\r\n  <li>2 connexions pour pédales (Start/Stop, Count/A/B/Fill)</li>\r\n  <li>Grand écran LCD</li>\r\n  <li>Synchronisation MIDI Clock/Song Position Pointer</li>\r\n  <li>12 pads sensibles à la vélocité</li>\r\n  <li>Dimensions: 235 x 38 x 165 mm</li>\r\n  <li>Poids: 1,1 kg</li>\r\n  <li>Bloc d\'alimentation incl.</li>\r\n</ul>',123.33333333333334,'102976.jpg',19999,26,21,'2022-09-06 07:07:43.862830',1),
(38,'467950','Focusrite Scarlett 2i2 3rd Gen','Interface audio 2 canaux USB 2.0. Résolution 24 bits / 192 kHz...','<h2>Interface audio 2 canaux USB2.0</h2>\r\n<ul>\r\n  <li>Connexion USB-C</li>\r\n  <li>Résolution Max 24 Bit / 192 kHz</li>\r\n  <li>2 préamplis micro Scarlett</li>\r\n  <li>Alimentation fantôme +48 V</li>\r\n  <li>Fonction Air commutable</li>\r\n  <li>2 entrées micro/instrument/ligne : Combo XLR / Jack 6,3 mm symétriques</li>\r\n  <li>2 sorties ligne : jack 6,3 mm symétriques</li>\r\n  <li>Sortie casque stéréo : jack 6,3 mm</li>\r\n  <li>Port USB-C</li>\r\n  <li>Convient pour PC/Mac</li>\r\n  <li>Alimentation via USB</li>\r\n  <li>Dimensions (L x H x P) : 175 x 47,5 x 98,8 mm</li>\r\n  <li>Poids : 0,47 kg</li>\r\n  <li>Livrée avec câble USB (type C vers A) ainsi qu\'Ableton Live Lite, Focusrite Red 2 & Red 3 Plug-in Suite, Softube Time & Tone Bundle et un instrument logiciel de 4 XLN Audio Addictive Key de votre choix</li>\r\n</ul>',132.5,'467950.jpg',19999,16,9,'2022-09-11 05:34:36.552450',1),
(39,'478035','Motu M2','Interface audio USB C 2 canaux...','<h2>Interface audio USB C 2 canaux</h2>\r\n<ul>\r\n  <li>Convertisseur AN/NA 24 bits / 192 kHz</li>\r\n  <li>2 préamplis micro avec alimentation fantôme +48 V chacun commutable individuellement</li>\r\n  <li>2 entrées ligne : combo XLR/jack 6,3 mm (entrée instrument Hi-Z commutable)</li>\r\n  <li>2 sorties ligne : jack 6,3 mm symétriques</li>\r\n  <li>2 sorties asymétriques (symétriques) : Cinch</li>\r\n  <li>Sortie casque stéréo : jack 6,3 mm</li>\r\n  <li>Entrée / Sortie MIDI</li>\r\n  <li>Fonction de bouclage</li>\r\n  <li>Affichage de niveau LCD</li>\r\n  <li>Livré avec MOTU Performer Lite, Ableton Live Lite et plus de 6 Go de boucles et échantillons</li>\r\n</ul>',165,'478035.jpg',20000,16,22,'2022-09-11 05:49:13.841577',1),
(40,'297910','Epiphone L-00 Studio','Guitare électro-acoustique 19 frettes. Table en épicéa, dos et éclisses en acajou...','<h2>Guitare électro-acoustique</h2>\r\n<ul>\r\n  <li>Petit corps</li>\r\n  <li>Table en épicéa massif</li>\r\n  <li>Fond et éclisses en acajou</li>\r\n  <li>Profil du manche: Slim Taper D</li>\r\n  <li>Manche en acajou</li>\r\n  <li>Touche en palissandre</li>\r\n  <li>19 frettes</li>\r\n  <li>Accastillage nickelé</li>\r\n  <li>Largeur au sillet: 43 mm</li>\r\n  <li>Diapason: 628 mm</li>\r\n  <li>Système de micro Fishman Sonitone</li>\r\n  <li>Réglage de tonalité et volume dans la rosace</li>\r\n  <li>Couleur: Vintage Sunburst</li>\r\n</ul>',277.5,'297910.jpg',20000,13,4,'2022-09-12 13:30:25.112422',1),
(41,'516654','Squier Affinity Tele MN 3-SB','Guitare électrique 21 frettes. Touche et manche en érable, corps en peuplier, diapason 648mm...','<h2>Guitare électrique</h2>\r\n<ul>\r\n  <li>Série Affinity</li>\r\n  <li>Corps en peuplier</li>\r\n  <li>Manche vissé en érable</li>\r\n  <li>Profil du manche en C</li>\r\n  <li>Touche en érable</li>\r\n  <li>Repères \"points\" noirs</li>\r\n  <li>21 frettes Medium Jumbo</li>\r\n  <li>Sillet en os synthétique</li>\r\n  <li>Largeur au sillet: 42 mm (1,65\")</li>\r\n  <li>Diapason: 648 mm (25,51\")</li>\r\n  <li>Rayon de la touche: 241 mm (9,49\")</li>\r\n  <li>Pickguard 3 plis noir</li>\r\n  <li>2 micros simple bobinage avec aimants en céramique</li>\r\n  <li>1 réglage de volume</li>\r\n  <li>1 réglage de tonalité</li>\r\n  <li>Sélecteur 3 positions</li>\r\n  <li>Chevalet Tele avec 6 pontets (cordes traversantes)</li>\r\n  <li>Accastillage chromé</li>\r\n  <li>Mécaniques fermées scellées sous pression avec axes splittés</li>\r\n  <li>Cordes: NPS .009 - .042</li>\r\n  <li>Couleur: 3-Color Sunburst</li>\r\n</ul>',170.83333333333334,'516654.jpg',20000,4,5,'2022-09-13 07:52:19.216185',1),
(42,'197068','Yamaha F370 BL','Guitare acoustique 21 frettes. Table en épicéa, dos et éclisses en nato, touche en palissandre...','<h2>Guitare acoustique</h2>\r\n<ul>\r\n  <li>Table en épicéa</li>\r\n  <li>Fond et éclisses en nato</li>\r\n  <li>Manche en nato</li>\r\n  <li>Touche en palissandre</li>\r\n  <li>21 frettes</li>\r\n  <li>Mécaniques Gotoh chromées moulées sous pression</li>\r\n  <li>Couleur: Noir</li>\r\n</ul>',149.16666666666669,'197068.jpg',20000,13,15,'2022-09-13 08:00:11.720912',1),
(43,'431568','Elektron Digitone','Synthétiseur numérique multi-timbral et séquenceur 4 pistes...','<h2>Synthétiseur numérique</h2>\r\n<ul>\r\n  <li>Polyphonie 8 voix (multitimbral)</li>\r\n  <li>Algorithmes FM multiples</li>\r\n  <li>1 filtre multimode, 1 filtre largeur/base, 1 overdrive et 2 LFOs assignables par voix</li>\r\n  <li>Séquenceur avec 4 pistes de synthés et 4 pistes MIDI</li>\r\n  <li>1 arpégiateur par piste</li>\r\n  <li>Séquençage polyphonique</li>\r\n  <li>Longueur de piste individuelle</li>\r\n  <li>Verrouillage des paramètres</li>\r\n  <li>Micro timing</li>\r\n  <li>Trig conditions</li>\r\n  <li>Changement de son par pas</li>\r\n  <li>Départ d\'effets & Master</li>\r\n  <li>Départ d\'effet Panoramic Chorus</li>\r\n  <li>Départ d\'effet Saturator Delay</li>\r\n  <li>Départ d\'effet Supervoid Reverb</li>\r\n  <li>Effet Overdrive Master</li>\r\n  <li>Ecran OLED ultra clair pour une visibilité optimale dans un environnement sombre</li>\r\n  <li>Boutons rotatifs précis en caoutchouc robuste et rétro-éclairés</li>\r\n  <li>Dimensions: 215 x 176 x 63 mm</li>\r\n  <li>Poids: 1,45 kg</li>\r\n</ul>',599.1666666666667,'431568.jpg',19988,26,20,'2022-09-13 09:55:47.228818',1),
(44,'465337','Elektron Digitone Keys','Synthétiseur numérique multi-timbral avec clavier 37 touches semi-lestées...','<h2>Synthétiseur numérique</h2>\r\n<ul>\r\n  <li>37 touches semi-lestées sensibles à la vélocité avec aftertouch</li>\r\n  <li>Polyphonie 8 voix (multitimbral)</li>\r\n  <li>5 boutons dédiés pour un accès direct aux fonctions/menus: Portamento, Arp Menu, Map Setup, Ext. Setup, Add/Chord</li>\r\n  <li>Mode Multi Map</li>\r\n  <li>1 x filtre multi-mode, 1 x filtre base/width, 1 x overdrive par voix</li>\r\n  <li>Séquenceur avec 4 pistes Synth et 4 pistes MIDI</li>\r\n  <li>Arpégiateur par piste Synth</li>\r\n  <li>Longueur de piste individuelle</li>\r\n  <li>Parameter Locks, Micro Timing, Trig Conditions, Sound par Step Change</li>\r\n  <li>Effets Send & Master</li>\r\n  <li>Convertisseurs N/A et A/N 48 kHz/24 bits</li>\r\n  <li>Dimensions: 868 x 185 x 90 mm</li>\r\n  <li>Poids: 6 kg</li>\r\n</ul>\r\n<h3>Connexions:</h3>\r\n<ul>\r\n  <li>MIDI In/Out/Thru avec DIN Sync Out</li>\r\n  <li>2 sorties Main sur Jack symétriques 6,3 mm</li>\r\n  <li>8 sorties Track sur Jack symétriques 6,3 mm</li>\r\n  <li>1 sortie casque sur Jack stéréo 6,3 mm</li>\r\n  <li>2 sorties audio sur Jack 6,3 mm</li>\r\n  <li>2 connexions CV/Expression/Sustain sur Jack 6,3 mm</li>\r\n</ul>',832.5,'465337.jpg',19999,25,20,'2022-09-13 10:18:41.160168',1),
(45,'529081','Universal Audio Volt 2 Studio Pack','Ensemble composé d\'une interface audio USB 2x2 avec microphone à condensateur, casque fermé...','<h2>Ensemble studio</h2>\r\n<ul>\r\n  <li>Ensemble composé de : Interface audio USB 2x2 avec microphone à condensateur, casque fermé et câble XLR de 3 m</li>\r\n  <li>Convertisseur AN/NA : 24 bits / 192 kHz</li>\r\n  <li>Préampli micro intégré avec mode préampli micro vintage</li>\r\n  <li>Alimentation fantôme +48 V commutable</li>\r\n  <li>Amplificateur de casque</li>\r\n  <li>Monitoring direct</li>\r\n  <li>Alimentation par bus USB</li>\r\n  <li>Compatible avec PC (Windows 10 64 bit), Mac (macOS 10.14 Mojave ou supérieur), iPad et iPhone (iOS 14 ou supérieur)</li>\r\n  <li>Dimensions (L x H x P) : 228 x 94 x 175 mm</li>\r\n  <li>Poids : 1 kg</li>\r\n  <li>Livré avec câble USB-C vers USB-A et câble XLR de 3 m</li>\r\n</ul>\r\n<h3>Logiciel inclus :</h3>\r\n<ul>\r\n  <li>Ableton Live Lite</li>\r\n  <li>Softube Marshall Plexi Classic Amp Softube Time & Tone Bundle</li>\r\n  <li>Celemony Melodyne Essential</li>\r\n  <li>Relab LX480 Essentials</li>\r\n  <li>Plugin Alliance Ampeg SVT-VR Classic</li>\r\n  <li>Brainworx bx_tuner et Brainworx bx_masterdesk Classic</li>\r\n  <li>UJAM Virtual Drummer DEEP et Virtual Bassist DANDY</li>\r\n  <li>Spitfire LABS</li>\r\n</ul>\r\n<h3>Connexions :</h3>\r\n<ul>\r\n  <li>2 entrées combo micro/instrument/ligne : XLR / jack 6,3 mm</li>\r\n  <li>2 sorties ligne : jack 6,3 mm</li>\r\n  <li>Sortie casque stéréo : jack 6,3 mm</li>\r\n  <li>1 entrée et sortie MIDI</li>\r\n  <li>Entrée 5V DC pour le bloc d\'alimentation en option</li>\r\n  <li>Connecteur USB-C</li>\r\n</ul>',249.16666666666669,'529081.jpg',20000,16,23,'2022-09-13 10:39:06.428896',1),
(46,'505927','M-Audio Oxygen Pro Mini','Clavier maître USB 32 touches, 8 pads, 4 potentiomètres, et 4 faders...','<h2>Clavier maître USB</h2>\r\n<ul>\r\n  <li>32 touches semi-lestées sensibles à la vélocité</li>\r\n  <li>8 pads RGB sensibles à la vélocité</li>\r\n  <li>Fonction Note Repeat</li>\r\n  <li>4 potentiomètres</li>\r\n  <li>4 faders</li>\r\n  <li>Mode Smart Chord</li>\r\n  <li>Mode Smart Scale</li>\r\n  <li>Arpégiateur</li>\r\n  <li>Boutons de transport et de navigation</li>\r\n  <li>Molettes de pitch et de modulation</li>\r\n  <li>Entrée pour pédale de sustain sur Jack 6,3 mm</li>\r\n  <li>Port USB-MIDI et sortie MIDI (Jack 3,5 mm, Type A)</li>\r\n  <li>Ecran OLED</li>\r\n  <li>Dimensions (L x l x H): 401 x 191 x 65 mm</li>\r\n  <li>Poids: 1,2 kg</li>\r\n  <li>Pack de logiciels (téléchargements) incl.: Ableton Live Lite, Mini Grand, Velvet, Hybrid 3, Touch Loops, MPC Beats</li>\r\n</ul>',90.83333333333334,'505927.jpg',19998,28,24,'2022-09-14 13:21:12.647114',1),
(47,'374935','Korg microKEY 49 MkII','Clavier maître compact USB 49 touches...','<h2>Clavier maître USB</h2>\r\n<ul>\r\n  <li>Clavier compact, sensation naturelle</li>\r\n  <li>49 mini-touches sensibles à la vélocité</li>\r\n  <li>Port USB</li>\r\n  <li>Molettes de Pitch Bend et de modulation</li>\r\n  <li>Touches Octave Up/Down</li>\r\n  <li>Alimentation via USB</li>\r\n  <li>Dimensions: 709 x 139 x 54 mm</li>\r\n  <li>Poids: 1,4 kg</li>\r\n  <li>Logiciels Korg Bundle Code et câble USB inclus</li>\r\n  <li>Compatible Windows 7 SP1 32 et 64 bit (ou ultérieur) et Mac OSX 10.8 Mountain Lion ou ultérieur, iOS 8 ou ultérieur (Apple camera kit nécessaire)</li>\r\n</ul>',99.16666666666667,'374935.jpg',20000,28,14,'2022-09-14 13:29:42.159512',1),
(48,'413254','Genelec 8020 DPM','Moniteur actif 2 voies : 50 Watts + 50 Watts. Réponse en fréquence linéaire 62 Hz - 20 kHz...','<h2>Moniteur de studio actif 2 voies</h2>\r\n<ul>\r\n  <li>Haut-parleur 105 mm (4\")</li>\r\n  <li>Tweeter en métal 19 mm (3/4\") en forme de dôme avec DCW (Directivity Control Waveguide)</li>\r\n  <li>Puissance de l\'amplificateur: 50 Watt + 50 Watt</li>\r\n  <li>Réponse en fréquence linéaire : 62 Hz - 20 kHz (±2,5 dB)</li>\r\n  <li>SPL (crête pour une paire avec musique à 1 m) : 107 dB</li>\r\n  <li>Enceinte Bass-Reflex en aluminium</li>\r\n  <li>Fréquence de coupure active et des circuits de protection efficaces</li>\r\n  <li>Blindage magnétique</li>\r\n  <li>Connexion encastrée</li>\r\n  <li>Différentes méthodes d\'installation possible</li>\r\n  <li>Veille / mise sou tension automatique automatique</li>\r\n  <li>Alimentation secteur fournie</li>\r\n  <li>Diverses options de montage</li>\r\n  <li>Dimensions (H x L x P) : 230 x 151 x 142 mm</li>\r\n  <li>Hauteur avec Iso-Pod : 242 mm</li>\r\n  <li>Poids : 3,2 kg</li>\r\n  <li>Couleur : anthracite</li>\r\n  <li>Prix pour une pièce</li>\r\n</ul>',357.5,'413254.jpg',20000,22,13,'2022-09-15 08:03:16.166784',1),
(49,'336276','Genelec 8010 AP','Moniteur de studio compact 2 voies 25 Watts + 25 Watts. Réponse en fréquence 74 Hz - 20 kHz...','<h2>Moniteur de studio compact</h2>\r\n<ul>\r\n  <li>Haut-parleur 3\" - puissance: 25 Watts</li>\r\n  <li>Tweeter 3/4\" - puissance: 25 Watts</li>\r\n  <li>Réponse en fréquence: 74 Hz - 20 kHz (±2,5 dB)</li>\r\n  <li>SPL Max (1 m): 105 dB</li>\r\n  <li>Fonction démarrage automatique</li>\r\n  <li>Connecteur XLR</li>\r\n  <li>Boitier en aluminium</li>\r\n  <li>Dimensions: 195 x 121 x 116 mm (HxLxP) Iso-Pod inclus</li>\r\n  <li>Poids: 1,5 kg</li>\r\n  <li>Couleur: anthracite</li>\r\n</ul>',265.83333333333337,'336276.jpg',20000,22,13,'2022-09-15 12:37:38.451018',1),
(50,'105767','Shure SM58 LC','Microphone dynamique cardioïde...','<h2>Microphone de chant dynamique</h2>\r\n<ul>\r\n  <li>Version sans interrupteur marche/arrêt</li>\r\n  <li>Directivité: Cardioïde</li>\r\n  <li>Réponse en fréquence: 50 - 15.000 Hz</li>\r\n  <li>Sensibilité: -56 dBV/Pa (1,85 mV)</li>\r\n  <li>Dimensions: 23 x 162 x 51 mm</li>\r\n  <li>Poids: 298 g</li>\r\n  <li>Pince, adaptateur de réduction de pas de vis 3/8\" et trousse incl.</li>\r\n</ul>',90.8333333333333,'105767.jpg',19998,18,16,'2022-09-19 09:29:32.161681',1),
(51,'537868','Universal Audio SD-1','Microphone dynamique cardioïde...','<h2>Microphone dynamique</h2>\r\n<ul>\r\n  <li>Convient pour l\'enregistrement et les applications live</li>\r\n  <li>Directivité : cardioïde</li>\r\n  <li>Réponse en fréquence : 50 - 16000 Hz</li>\r\n  <li>Sensibilité : -58 dB (1.3 mV) ref 1V à 1 Pa @ 1 kHz</li>\r\n  <li>Impédance de sortie : 200 Ohms</li>\r\n  <li>Commutateur pour filtre coupe-bas (200 Hz) et boost de présence (3 - 5 kHz)</li>\r\n  <li>Préréglages Apollo Channel Strip</li>\r\n  <li>Support et filtre pop intégrés</li>\r\n  <li>Connexion : XLR</li>\r\n  <li>Dimensions (longueur x diamètre) : 195 x 60 mm</li>\r\n  <li>Poids : 735 g</li>\r\n  <li>Adaptateur de filetage 5/8\" à 3/8\" inclus</li>\r\n</ul>',249.16666666666669,'537868.jpg',20000,18,23,'2022-09-19 09:33:14.500106',1),
(52,'320336','Audio-Technica AT2020 USB+','Micro à condensateur moyenne membrane USB...','<h2>Micro à condensateur moyenne membrane - USB</h2>\r\n<ul>\r\n  <li>Directivité: cardioïde</li>\r\n  <li>Réponse en fréquence: 20 Hz - 20 kHz</li>\r\n  <li>SPL max: 144 dB</li>\r\n  <li>Sortie casque avec contrôle du volume</li>\r\n  <li>Pince micro et étui inclus</li>\r\n</ul>',107.5,'320336.jpg',19999,18,25,'2022-09-19 09:44:42.538610',1),
(53,'358068','Audio-Technica ATH-R70 X','Casque studio de référence, bande passante : 5 Hz - 40 kHz...','<h2>Casque studio de référence</h2>\r\n<ul>\r\n  <li>Circum-aural</li>\r\n  <li>Ouvert</li>\r\n  <li>Système d\'arceau 3D</li>\r\n  <li>Gestion du câble des deux côtés</li>\r\n  <li>Coussinets auto-respirants</li>\r\n  <li>Aimants haute performance</li>\r\n  <li>Transducteurs 45 mm</li>\r\n  <li>Bande passante: 5 - 40.000 Hz</li>\r\n  <li>Puissance admissible max.: 1000 mW / 1 kHz</li>\r\n  <li>Impédance: 470 Ohm</li>\r\n  <li>SPL max.: 98 dB</li>\r\n  <li>Poids sans câble: 210 g</li>\r\n  <li>Couleur: Noir</li>\r\n</ul>',253.333333333333,'358068.jpg',19999,20,25,'2022-09-19 09:50:07.427872',1),
(54,'508557','SSL UF8','Surface de contrôle USB...','<h2>Surface de contrôle USB</h2>\r\n<ul>\r\n  <li>8 faders motorisés de 100 mm sensibles au toucher</li>\r\n  <li>8 + 1 boutons avec fonction poussoir</li>\r\n  <li>8 écrans couleur TFT LCD</li>\r\n  <li>Boutons RGB \"Soft Feel\" éclairés</li>\r\n  <li>Un maximum de 4 UF8 peuvent être montés en cascade via USB (32 faders maximum)</li>\r\n  <li>Contrôlez 3 DAW différents simultanément</li>\r\n  <li>Communication DAW : HUI/MCU</li>\r\n  <li>Codeur principal multifonctionnel et cranté pour la navigation</li>\r\n  <li>Banque de pistes et émulation de la molette de la souris</li>\r\n  <li>43 boutons assignables individuellement pour les raccourcis/macros fréquemment utilisés (5 x 8 plus 3 touches rapides)</li>\r\n  <li>Programmation via le logiciel SSL 360° pour Mac et PC</li>\r\n  <li>Livré avec plug-ins Vocalstrip 2 et Drumstrip (téléchargement après enregistrement)</li>\r\n  <li>Boîtier en métal</li>\r\n  <li>Dimensions (L x H x P) : 431 x 62,7 x 266 mm</li>\r\n  <li>Poids : 2,9 kg</li>\r\n  <li>Livré avec alimentation électrique externe</li>\r\n</ul>',874.1666666666667,'508557.jpg',20000,29,26,'2022-09-19 10:12:14.191875',1),
(55,'481700','SSL 2','Interface audio USB-C 2 canaux...','<h2>Interface audio USB-C 2 canaux</h2>\r\n<ul>\r\n  <li>Convertisseur AKM 24-bits / 192 kHz</li>\r\n  <li>Préamplificateur de microphone (62 dB de gain, 130,5 dBu ON)</li>\r\n  <li>Fiches Neutrik</li>\r\n  <li>Potentiomètre Alps</li>\r\n  <li>Commutateur \"4K\" par canal pour la coloration du son, inspiré de la légendaire série SSL 4000</li>\r\n  <li>Alimentation fantôme +48 V</li>\r\n  <li>Affichage du niveau à 5 chiffres pour chaque entrée</li>\r\n  <li>2 entrées micro/ligne/instrument : Combo XLR / jack 6,3 mm</li>\r\n  <li>2 sorties moniteur : jack 6,3 mm symétriques</li>\r\n  <li>Sortie casque stéréo : jack 6,3 mm</li>\r\n  <li>Alimenté par le bus USB</li>\r\n  <li>Dimensions (L x H x P) : 234 x 70 x 157 mm</li>\r\n  <li>Poids : 0,88 kg</li>\r\n  <li>Livrée avec licences logicielles pour PlugIns natifs SSL (Vocalstrip 2 & Drumstrip), Ableton Live Lite, Loopcloud Samples & Hybrid Keys / Démarrage complet</li>\r\n</ul>',165.83333333333334,'481700.jpg',20000,16,26,'2022-09-19 10:17:17.845134',1),
(56,'481703','SSL 2+','Interface audio USB-C 2x4...','<h2>Interface audio USB-C 2x4</h2>\r\n<ul>\r\n  <li>Convertisseur AKM 24-bit / 192 kHz</li>\r\n  <li>Préamplificateur de microphone (+62 dB de gain, 130,5 dBu ON)</li>\r\n  <li>Fiches Neutrik</li>\r\n  <li>Potentiomètre Alps</li>\r\n  <li>Commutateur \"4K\" par canal pour la coloration du son, inspiré de la légendaire série SSL 4000</li>\r\n  <li>Alimentation fantôme +48 V</li>\r\n  <li>Affichage de niveau à 5 chiffres pour chaque entrée</li>\r\n  <li>Entrée et sortie MIDI</li>\r\n  <li>Deux sorties casque réglables indépendamment</li>\r\n  <li>2 entrées micro/ligne/instrument : Combo XLR/jack 6,3 mm</li>\r\n   <li>2 sorties moniteur : jack 6,3 mm symétriques</li>\r\n  <li>2 sorties ligne : Cinch</li>\r\n  <li>2 sorties casque stéréo : jack 6,3 mm</li>\r\n  <li>Entrée et sortie MIDI</li>\r\n  <li>Alimenté par le bus USB</li>\r\n  <li>Dimensions (L x H x P) : 234 x 70 x 157 mm</li>\r\n  <li>Poids : 0,88 kg</li>\r\n  <li>Livré avec licence logicielle pour PlugIns natifs SSL (Vocalstrip 2 & Drumstrip), Ableton Live Lite, Loopcloud Samples & Hybrid Keys / Démarrage complet</li>\r\n</ul>',215.833333333333,'481703.jpg',19998,16,26,'2022-09-19 10:37:25.010541',1),
(57,'450167','SSL Fusion','Processeur Master analogique stéréo...','<h2>Processeur Master analogique stéréo</h2>\r\n<ul>\r\n  <li>inclut 6 nouveaux circuits pour le traitement du signal et la coloration du son dans un seul appareil</li>\r\n  <li>Vintage Drive : niveau de saturation pour des nuances harmonieuses et une compression subtile</li>\r\n  <li>Violet EQ : nouvel égaliseur 2 bandes (caractéristique Shelving) avec 4 fréquences sélectionnables par bande et une pente de +/- 9 dB.</li>\r\n  <li>Compresseur haute fréquence : compresseur sélectif en fréquence pour compléter la gamme des hautes fréquences et contrôler les transitoires indésirables.</li>\r\n  <li>Image stéréo : matrice Mid/Side analogique pour la diffusion stéréo\r\n  <li>Transformateur : transformateur SSL commutable pour une accentuation subtile des basses et des hautes fréquences</li>\r\n  <li>Listen Mic Compressor : compression puissante avec beaucoup de punch, idéale pour la batterie, par exemple mais aussi pour la compression parallèle via le contrôle Dry / Wet</li>\r\n  <li>Insert commutable</li>\r\n  <li>Commandes des niveaux d\'entrée et de sortie</li>\r\n  <li>Filtre passe-haut commutable à 3 fréquences</li>\r\n  <li>Affichage du niveau</li>\r\n  <li>Interrupteur de dérivation</li>\r\n  <li>2 entrées XLR</li>\r\n  <li>2 sorties XLR</li>\r\n  <li>Format rack 19\" - 2U</li>\r\n</ul>',1654.1666666666667,'450167.jpg',19998,30,26,'2022-09-19 12:31:03.871689',1),
(58,'540426','SSL BUS+','Compresseur analogique stéréo / dual mono / bus MS, contrôlé numériquement...','<h2>Compresseur analogique stéréo / dual mono / bus MS, contrôlé numériquement</h2>\r\n<ul>\r\n  <li>Circuit de compression de bus SSL authentique avec VCA 2181 THAT haute performance</li>\r\n  <li>4 modes de fonctionnement : Stéréo, S/C stéréo, Dual Mono, Mid-Side\r\n  <li>Options Attack & Release pour plus de flexibilité dans les réglages de détails</li>\r\n  <li>3 caractéristiques de compression spécifiques pour une utilisation individuelle ou combinée (4K - Single VCA avec VHD, LOW THD avec réduction LF, mode F/B)</li>\r\n  <li>Égaliseur dynamique 2 bandes intégré (D-EQ)</li>\r\n  <li>Expandeur de transitoires</li>\r\n  <li>Processing configurable (Compressor pré/post D-EQ)</li>\r\n  <li>Entrées/sorties Side Chain externes intégrées</li>\r\n  <li>Réglage HPF jusqu\'à 300 Hz (par paliers de 10 Hz)</li>\r\n  <li>Mix Control pour compression parallèle instantanée</li>\r\n  <li>Potentiomètres crantés</li>\r\n  <li>Format rack 19\" - 2U</li>\r\n  <li>Poids : env. 7 kg</li>\r\n</ul>',1957.5,'540426.jpg',19998,30,26,'2022-09-19 12:36:06.134716',1),
(59,'264739','DBX 215S','Égaliseur graphique 2x 15 bandes...','<h2>Égaliseur graphique 2x 15 bandes</h2>\r\n<ul>\r\n  <li>Pente constante</li>\r\n  <li>Plage ±6 ou ±12 dB commutable</li>\r\n  <li>Affichage du niveau de sortie à 4 LED</li>\r\n  <li>Entrées et sorties XLR et TRS</li>\r\n  <li>Réponse en fréquence: <10 Hz à >50 kHz</li>\r\n  <li>Plage dynamique: >108 dB</li>\r\n  <li>Format rack 19\" - 1U</li>\r\n</ul>',129.16666666666669,'264739.jpg',20000,30,27,'2022-09-19 12:49:36.128238',1),
(60,'259111','DBX 286S','Pré-ampli et processeur de dynamique 1 canal...','<h2>Pré-ampli et processeur de dynamique 1 canal</h2>\r\n<ul>\r\n  <li>Entrée micro XLR, ligne jack TRS</li>\r\n  <li>Alimentation Phantom +48V</li>\r\n  <li>De-esser</li>\r\n  <li>Compresseur</li>\r\n  <li>Enhancer</li>\r\n  <li>Gate</li>\r\n  <li>Format rack 19\" - 1U</li>\r\n</ul>',149.16666666666669,'259111.jpg',20000,30,27,'2022-09-19 12:55:25.204987',1),
(61,'507320','Rupert Neve Designs Portico II Master Bus Black','Compresseur 2 canaux...','<h2>Compresseur 2 canaux</h2>\r\n<ul>\r\n  <li>Liaison stéréo ou double mono</li>\r\n  <li>Technologie 75V</li>\r\n  <li>Gain de rattrapage : -6 dB à +20 dB</li>\r\n  <li>Compression parallèle réglable</li>\r\n  <li>Contrôle de la texture avec modes Silk et Silk+</li>\r\n  <li>Limiteur musical</li>\r\n  <li>Éditeur de champ stéréo</li>\r\n  <li>Routing flexible, permet un traitement dynamique indépendant des canaux centraux et latéraux</li>\r\n  <li>Affichage complet des niveaux</li>\r\n  <li>Connexions d\'entrée/sortie : XLR</li>\r\n  <li>Connexion pour départ/retour Sidechain : prise jack 6,3 mm</li>\r\n  <li>Interrupteur de masse</li>\r\n  <li>Dimensions : format rack 19\" - 2U</li>\r\n  <li>Poids : 9,7 kg</li>\r\n</ul>',4082.5,'507320.jpg',19998,30,18,'2022-09-19 13:07:02.067619',1),
(62,'263612','DBX 266 XS','Compresseur gate stéréo...','<h2>Compresseur gate stéréo</h2>\r\n<ul>\r\n  <li>Alimentation interne</li>\r\n  <li>Mode \"Easy\"</li>\r\n  <li>Attaque et relâchement automatique</li>\r\n  <li>Ratio du compresseur de 1:1 à -1</li>\r\n  <li>Entrées sorties XLR</li>\r\n  <li>Niveau d\'entrée +4 dBu ou -10 dBV sélectionnable</li>\r\n  <li>Mode stéréo</li>\r\n  <li>Format rack 19\" - 1U</li>\r\n</ul>',124.16666666666667,'263612.jpg',20000,30,27,'2022-09-19 13:18:55.526854',1),
(63,'535968','Gretsch G5422G-12 Electromatic SBB','Guitare électrique 12 cordes...','<h2>Guitare électrique</h2>\r\n<ul>\r\n  <li>12 cordes</li>\r\n  <li>Hollow Body</li>\r\n  <li>Double pan coupé</li>\r\n  <li>Corps en érable laminé</li>\r\n  <li>Barrage Trestle</li>\r\n  <li>Profondeur du corps: 57 mm (2,25\")</li>\r\n  <li>Manche en érable</li>\r\n  <li>Touche en laurier</li>\r\n  <li>Repères \"bosses/blocs\" Perloïd</li>\r\n  <li>Profil du manche: Classic \"C\"</li>\r\n  <li>Sillet Graph Tech NuBone</li>\r\n  <li>Largeur au sillet: 45 mm (1,77\")</li>\r\n  <li>22 frettes Medium Jumbo</li>\r\n  <li>2 micros double bobinage Filter\'Tron FT-5E</li>\r\n  <li>1 réglage de volume pour le micro manche</li>\r\n  <li>1 réglage de volume pour le micro chevalet</li>\r\n  <li>1 réglage de volume général avec circuit Treble Bleed</li>\r\n  <li>1 réglage de tonalité général</li>\r\n  <li>Pickguard en plexi doré avec logos Gretsch & Electromatic noirs</li>\r\n  <li>Chevalet Adjusto-Matic avec embase en laurier</li>\r\n  <li>Cordier Gretsch G-Cutout</li>\r\n  <li>Mécaniques fermées moulées sous pression</li>\r\n  <li>Accastillage doré</li>\r\n  <li>Cordes .011 - .049</li>\r\n  <li>Couleur: Single Barrel Burst</li>\r\n</ul>',831.6666666666667,'535968.jpg',20000,4,28,'2022-09-19 13:28:03.799229',1),
(64,'512051','Gretsch G2622T-P90 Strml CB DC BrStone','Guitare électrique série Streamliner hollow body, 22 frettes. Corps et table en acajou laminé...','<h2>Guitare électrique</h2>\r\n<ul>\r\n  <li>Série Streamliner</li>\r\n  <li>Hollow Body</li>\r\n  <li>Double pan coupé</li>\r\n  <li>Table en acajou laminé</li>\r\n  <li>Corps en acajou laminé</li>\r\n  <li>Manche collé en nato</li>\r\n  <li>Profil du manche: U mince</li>\r\n  <li>Touche en laurier</li>\r\n  <li>Repères ovales Perloïd</li>\r\n  <li>22 frettes Medium Jumbo</li>\r\n  <li>Sillet en os synthétique</li>\r\n  <li>Largeur au sillet: 42,9 mm (1,69\")</li>\r\n  <li>Diapason: 629 mm (24,76\")</li>\r\n  <li>Rayon de la touche: 305 mm (12,01\")</li>\r\n  <li>Pickguard 1 pli noir</li>\r\n  <li>2 micros FideliSonic 90</li>\r\n  <li>2 réglages de volume</li>\r\n  <li>1 réglage de volume général</li>\r\n  <li>1 réglage de tonalité général</li>\r\n  <li>Sélecteur 3 positions</li>\r\n  <li>Chevalet Adjusto-Matic</li>\r\n  <li>Vibrato Bigsby B70</li>\r\n  <li>Accastillage nickelé</li>\r\n  <li>Mécaniques moulées sous pression</li>\r\n  <li>Cordes NPS .010 - .046</li>\r\n  <li>Couleur: Brownstone</li>\r\n</ul>',457.5,'512051.jpg',19996,4,28,'2022-09-19 13:33:55.362691',1),
(65,'464691','Yamaha BB734 A DCSG RW','Basse électrique 4 cordes...','<h2>Basse électrique</h2>\r\n<ul>\r\n  <li>4 cordes</li>\r\n  <li>Corps en aule/érable/aulne laminé</li>\r\n  <li>Manche 5 pièces en érable/acajou</li>\r\n  <li>Touche en palissandre</li>\r\n  <li>21 frettes Medium</li>\r\n  <li>Diapason: 864 mm (Long Scale)</li>\r\n  <li>1 micro simple bobinage splitté</li>\r\n  <li>1 micro simple bobinage</li>\r\n  <li>Contrôles: Volume, Balance, Bass, Middle, Treble</li>\r\n  <li>EQ actif 3 bandes</li>\r\n  <li>Commutateur actif/passif</li>\r\n  <li>Pickguard 3 plis noir</li>\r\n  <li>Accastillage Yamaha chromé</li>\r\n  <li>Couleur: Dark Coffee Sunburst Gloss</li>\r\n  <li>Livrée en housse</li>\r\n</ul>',832.5,'464691.jpg',20000,9,15,'2022-09-19 13:49:40.801401',1),
(66,'538281','Fender 59 P-Bass C3CS Relic MBVT','Basse électrique 4 cordes Custom Shop...','<h2>Basse électrique</h2>\r\n<ul>\r\n  <li>4 cordes</li>\r\n  <li>Custom Shop</li>\r\n  <li>Fabriquée par Vincent van Trigt</li>\r\n  <li>Corps en frêne</li>\r\n  <li>Manche en érable teinté (sciage Rift)</li>\r\n  <li>Touche en érable</li>\r\n  <li>Profil du manche: \'57 Soft \"V\" P-Bass</li>\r\n  <li>Rayon de la touche: 7,25\"</li>\r\n  <li>Largeur au sillet: 44,5 mm</li>\r\n  <li>20 frettes 6150</li>\r\n  <li>1 micro splité \'62 Precision Bass bobiné à la main par Josefina</li>\r\n  <li>Pickguard \"El Dorado Cowhide\"</li>\r\n  <li>Mécaniques Gotoh GB650 Res-O-Lite</li>\r\n  <li>Accastillage nickelé</li>\r\n  <li>Finition: Relic</li>\r\n  <li>Couleur: Chocolate 3-Color Sunburst</li>\r\n  <li>Livrée en étui Fender</li>\r\n  <li>Fabriquée aux USA</li>\r\n</ul>',7777.5,'538281.jpg',19999,9,1,'2022-09-19 14:00:32.168217',1),
(67,'481764','Ibanez GSR205SM-NGT','Basse électrique 5 cordes...','<h2>Basse électrique</h2>\r\n<ul>\r\n  <li>5 cordes</li>\r\n  <li>Table en érable marbré</li>\r\n  <li>Corps en peuplier</li>\r\n  <li>Manche vissé en érable</li>\r\n  <li>Touche en jatoba</li>\r\n  <li>Repères \"points\" blancs</li>\r\n  <li>Rayon de la touche: 305 mm (12,01\")</li>\r\n  <li>Diapason: 864 mm (34,02\")</li>\r\n  <li>Largeur au sillet: 45 mm (1,77\")</li>\r\n  <li>Sillet en plastique</li>\r\n  <li>22 frettes Medium</li>\r\n  <li>2 micros double bobinage Dynamix H</li>\r\n  <li>Electronique Phat II</li>\r\n  <li>2 réglages de volume</li>\r\n  <li>1 réglage de tonalité</li>\r\n  <li>1 réglage Phat II</li>\r\n  <li>Chevalet B15</li>\r\n  <li>Mécaniques Ibanez</li>\r\n  <li>Accastillage noir</li>\r\n  <li>Couleur: Natural Gray Burst</li>\r\n</ul>',307.5,'481764.jpg',20000,9,6,'2022-09-19 14:06:51.622732',1),
(68,'501916','Epiphone Flying V Prophecy Yellow Tiger 2','Guitare électrique 1958 Flying V...','<h2>Guitare électrique</h2>\r\n<ul>\r\n  <li>1958 Flying V</li>\r\n  <li>Corps en acajou</li>\r\n  <li>Table en placage d\'érable flammé AAA</li>\r\n  <li>Manche en okoumé</li>\r\n  <li>Touche en ébène</li>\r\n  <li>Repères blocs & triangles en abalone</li>\r\n  <li>Profil du manche: Slim Taper asymétrique</li>\r\n  <li>Filet multiplis</li>\r\n  <li>Diapason: 628 mm (24,724\")</li>\r\n  <li>Largeur au sillet: 43 mm (1,693\")</li>\r\n  <li>Sillet Graph Tech NuBone</li>\r\n  <li>24 frettes</li>\r\n  <li>2 micros double bobinage Fishman Fluence</li>\r\n  <li>1 réglage de volume</li>\r\n  <li>1 réglage de tonalité Push/Pull (sélection de voix)</li>\r\n  <li>Chevalet LockTone Tune-o-matic</li>\r\n  <li>Cordier LockTone Stop Bar</li>\r\n  <li>Mécaniques bloquantes Grover Rotomatics</li>\r\n  <li>Couleur: Yellow Tiger Aged Gloss</li>\r\n</ul>',662.5,'501916.jpg',20000,4,4,'2022-09-19 14:12:43.583539',1),
(69,'501920','Epiphone Prophecy Extura Purple Tiger','Guitare électrique 24 frettes, corps et manche en acajou, table en placage d\'érable flammé AAA...','<h2>Guitare électrique</h2>\r\n<ul>\r\n  <li>Corps en acajou</li>\r\n  <li>Table en placage d\'érable flammé AAA</li>\r\n  <li>Filet de table</li>\r\n  <li>Manche en acajou</li>\r\n  <li>Touche en ébène</li>\r\n  <li>Repères blocs & triangles en abalone</li>\r\n  <li>Profil du manche: Slim Taper asymétrique</li>\r\n  <li>Diapason: 628 mm (24,724\")</li>\r\n  <li>Largeur au sillet: 43 mm (1,693\")</li>\r\n  <li>Sillet Graph Tech NuBone</li>\r\n  <li>24 frettes</li>\r\n  <li>2 micros double bobinage Fishman Fluence</li>\r\n  <li>1 réglage de volume</li>\r\n  <li>1 réglage de tonalité Push/Pull (sélection de voix)</li>\r\n  <li>Chevalet LockTone Tune-o-matic</li>\r\n  <li>Cordier LockTone Stop Bar</li>\r\n  <li>Mécaniques bloquantes Grover Rotomatics</li>\r\n  <li>Couleur: Purple Tiger Aged Gloss</li>\r\n</ul>',740,'501920.jpg',19999,4,4,'2022-09-19 14:16:12.608868',1),
(70,'528607','Alesis V49 MKII','Clavier contrôleur USB/MIDI','<h2>Clavier contrôleur USB/MIDI</h2>\r\n<ul>\r\n  <li>49 touches sensibles à la vélocité</li>\r\n  <li>8 pads de déclenchement sensibles à la vélocité avec fonctions Note Repeat & Full Level</li>\r\n  <li>Arpégiateur avec 6 modes</li>\r\n  <li>Fonctions Tap Tempo & Time Division</li>\r\n  <li>Fonctions Gate & Swing</li>\r\n  <li>4 contrôleurs rotatifs assignables</li>\r\n  <li>Molettes de pitch bend et de modulation</li>\r\n  <li>Sélecteur d\'octave</li>\r\n  <li>Entrée pour pédale de sustain sur Jack 6,3 mm</li>\r\n  <li>USB 2.0 (alimenté par bus)</li>\r\n  <li>Dimensions (L x P x H): 812 x 244 x 94 mm</li>\r\n  <li>Poids: 2,75 kg</li>\r\n  <li>Pack de logiciels (téléchargements) incl.: MPC Beats + 7 Beats Expansions Melodics</li>\r\n</ul>',82.5,'528607.jpg',19998,28,21,'2022-09-19 14:21:50.059965',1),
(71,'445578','M-Audio Keystation 61 MK3','Clavier maître MIDI/USB','<ul>Clavier maître MIDI/USB</ul>\r\n<ul>\r\n  <li>61 touches sensibles à la vélocité</li>\r\n  <li>Molettes de Pitch Bend et Modulation</li>\r\n  <li>Sélecteur d\'octave</li>\r\n  <li>Boutons de transport pour contrôle DAW</li>\r\n  <li>1 fader</li>\r\n  <li>Entrée sur Jack 6,3 mm pour pédale de sustain optionnelle non-fournie</li>\r\n  <li>Sortie MIDI</li>\r\n  <li>Alimentation via USB</li>\r\n  <li>Entrée pour bloc d\'alimentation optionnel non-fourni</li>\r\n  <li>Plug&Play pour Mac & PC</li>\r\n  <li>Dimensions: 995 x 189 x 68 mm</li>\r\n  <li>Poids: 4,1 kg</li>\r\n  <li>Pack de logiciels (téléchargements) incl.: Ableton Live Lite, Xpand!2, Mini Grand, Velvet, Touch Loops, MPC Beats</li>\r\n</ul>',108.33333333333334,'445578.jpg',19999,28,24,'2022-09-19 14:24:52.394141',1),
(72,'463834','Yamaha HS 5 SG','Enceinte de proximité active 2 voies 5\" + 1\" 45 Watts + 25 Watts...','<h2>Enceinte de proximité active 2 voies 5\" + 1\"</h2>\r\n<ul>\r\n  <li>Double amplification: 45 Watt + 25 Watt</li>\r\n  <li>Montage Bass-Reflex</li>\r\n  <li>Réponse en fréquence: 54 Hz - 30 kHz</li>\r\n  <li>Entrée XLR symétrique et jack TR 6,3 mm asymétrique</li>\r\n  <li>Niveau d\'entrée ajustable</li>\r\n  <li>Contrôles des aigus</li>\r\n  <li>Dimensions: 170 x 285 x 222 mm (LxHxP)</li>\r\n  <li>Poids: 5,3 kg</li>\r\n  <li>Couleur: gris</li>\r\n  <li>Prix pour une enceinte</li>\r\n</ul>',140.83333333333334,'463834.jpg',39998,22,15,'2022-09-19 14:35:57.011977',1),
(73,'415894','Alesis M1 Active MK3','Moniteur 5\" actif de référence','<h2>Moniteur 5\" actif de référence</h2>\r\n<ul>\r\n  <li>Puissance: 65 Watts</li>\r\n  <li>Tweeter 1\" (25 mm) d\'une puissance de 25 Watts</li>\r\n  <li>Haut-parleur de 5\" (127 mm) en aluminium de 40 Watts</li>\r\n  <li>Amplificateur: bi-amplification de 65 Watt RMS de classe A / B\r\n  <li>Réponse en fréquence: 45 - 22000 Hz</li>\r\n  <li>Entrée: entrée combo XLR / jack symétrique</li>\r\n  <li>Protection: circuit de protection de surchauffe</li>\r\n  <li>Commandes: contrôle du volume, interrupteur marche / arrêt</li>\r\n  <li>Boîtier: noir mat avec revêtement doux au toucher, MDF enduit de vinyle</li>\r\n  <li>Alimentation: alimentation interne 100-120 / 220-240 V CA ~50/60 Hz</li>\r\n  <li>Dimensions: 183 x 216 x 267 mm</li>\r\n  <li>Poids: 5,49 kg</li>\r\n  <li>Câble d\'alimentation et manuel inclus</li>\r\n</ul>',113.33,'415894.jpg',39998,22,21,'2022-09-23 07:54:01.882041',1),
(74,'458328','Neumann KH 750 DSP','Caisson de basses de studio actif avec DSP 256 W...','<h2>Caisson de basses de studio actif avec DSP</h2>\r\n<ul>\r\n  <li>Équipement : haut-parleur de graves de 10\"</li>\r\n  <li>Puissance nominale : 256 W</li>\r\n  <li>Niveau maximal : 105,0 dB</li>\r\n  <li>Réponse en fréquence : 18 - 750 Hz</li>\r\n  <li>4 modes de LFE différents sélectionnables</li>\r\n  <li>Fréquence de coupure : 80 Hz, fixe ou 60 - 100 Hz via Neumann.Control-App</li>\r\n  <li>Contrôle acoustique avec 8 filtres entièrement paramétriques via l\'application Neumann</li>\r\n  <li>Filtre FIR : Correction de phase pour sorties analogiques</li>\r\n  <li>Mode veille commutable</li>\r\n  <li>Entrées/sorties analogiques en XLR</li>\r\n  <li>Entrées/sorties numériques en BNC (75 Ohm, AES3)</li>\r\n  <li>Connexion au logiciel Neumann.Control via connecteur RJ45</li>\r\n  <li>Dimensions : 383 x 330 x 383 mm</li>\r\n  <li>Poids : 19,5 kg</li>\r\n</ul>',1241.666,'458328.jpg',20000,23,12,'2022-09-23 07:59:48.383069',1),
(75,'255902','Neumann KH 120 A','Enceinte large bande active 2 voies 5,25\" + 1\"','<h2>Enceinte large bande active 2 voies 5,25\" + 1\"</h2>\r\n<ul>\r\n  <li>Puissance (bi-amplification): 100 Watt (50W + 50W)</li>\r\n  <li>Réponse en fréquence: 52 Hz - 21 kHz (±3 dB)</li>\r\n  <li>SPL max: 112,2 dB</li>\r\n  <li>EQ basse, médium, aigüe</li>\r\n  <li>Contrôle de niveau de sortie</li>\r\n  <li>Limiteur</li>\r\n  <li>Blindage magnétique</li>\r\n  <li>Entrée XLR symétrique</li>\r\n  <li>Dimensions: 277 x 182 x 220 mm</li>\r\n  <li>Poids: 6,2 kg</li>\r\n</ul>',565.83,'255902.jpg',40000,22,12,'2022-09-23 08:03:35.070383',1),
(76,'406223','Neumann KH 80 DSP','Moniteur de studio actif et DSP...','Moniteur de studio actif et DSP\r\n<ul>\r\n  <li>Haut-parleur 4\" + tweeter 1\"</li>\r\n  <li>Résolution numérique: 24 bit - 48 kHz</li>\r\n  <li>Réponse en fréquence: 57 Hz - 21 kHz (±3 dB)</li>\r\n  <li>SPL max: 108,8 dB</li>\r\n  <li>Puissance d\'amplification: 140 Watt (bi-amplification: 90W + 50W)</li>\r\n  <li>Panneau de commande pour veille et de contrôles acoustiques</li>\r\n  <li>Limiteurs de crête électroniques séparés pour chaque voie et circuit de protection thermique</li>\r\n  <li>Contrôle du niveau d\'entrée / sortie</li>\r\n  <li>Fréquence de coupure via DSP linéaire de phase multisegment 8ème ordre</li>\r\n  <li>Contrôles acoustiques de pièce 4 positions pour bas-médium et 8 filtres iiR PEQ/premier ordre et filtres Shelf aigus et graves</li>\r\n  <li>Fonction de retard de 70 ms et paramètres Lipsync</li>\r\n  <li>Bruit propre: <20 dB (A) à 10 cm</li>\r\n  <li>Entrée: XLR symétrique, blindage magnétique</li>\r\n  <li>Entrée réseau</li>\r\n  <li>2x pas de vis M6 pour pieds / supports</li>\r\n  <li>Dimensions (H x L x P): 233 x 154 x 194 mm</li>\r\n  <li>Poids: 3,5 kg</li>\r\n</ul>',1241.666,'406223.jpg',20000,22,12,'2022-09-23 08:06:28.974964',1),
(77,'313059','Yamaha HS 8S','Caisson de basses actif 8\"...','<h2>Caisson de basses actif 8\"</h2>\r\n<ul>\r\n  <li>Conception Bass-Reflex</li>\r\n  <li>Puissance: 150 W</li>\r\n  <li>Réponse en fréquence: 22 Hz - 150 Hz</li>\r\n  <li>Filtre coupe bas ajustable: 80 - 120 Hz</li>\r\n  <li>Filtre coupe-haut ajustable: 80 - 120 Hz</li>\r\n  <li>Inverseur de phase</li>\r\n  <li>Entrée: XLR / TRS 6,3 mm</li>\r\n  <li>Sorties XLR stéréo + mono</li>\r\n  <li>Dimensions: 300 x 350 x 389 mm</li>\r\n  <li>Poids: 12,5 kg</li>\r\n</ul>',415.83,'313059.jpg',39998,23,15,'2022-09-23 08:12:51.317262',1),
(78,'457631','Fender Prof. Cable Angle Plug 90cm','Câble instrument avec fiches coudées 90cm...','<h2>Câble instrument avec fiches coudées</h2>\r\n<ul>\r\n  <li>Longueur : 90 cm</li>\r\n  <li>Manchon en PVC de 8 mm pour éviter tout bruit supplémentaire</li>\r\n  <li>Blindage : 95% cuivre</li>\r\n  <li>Couleur : Noir</li>\r\n</ul>',7.42,'457631.jpg',400000,32,1,'2022-09-26 14:41:23.000421',1),
(79,'457663','Fender Deluxe Patch Cable Angle 90cm','Câble instrument fiches jack coudées 90cm...','<h2>Câble instrument</h2>\r\n<ul>\r\n  <li>Longueur : 90 cm</li>\r\n  <li>Avec prises jack coudées plaquées or 24K</li>\r\n  <li>Manchon en PVC de 8 mm pour éviter tout bruit supplémentaire</li>\r\n  <li>Blindage : 95% cuivre</li>\r\n  <li>Couleur : Tweed noir</li>\r\n</ul>',7.5,'457663.jpg',399988,32,1,'2022-09-26 14:46:00.050589',1),
(80,'457617','Fender Prof. Microphone Cable 3m','Câble micro 3m...','<h2>Câble micro</h2>\r\n<ul>\r\n  <li>Longueur : 3 m</li>\r\n  <li>Manchon en PVC de 8 mm pour éviter tout bruit supplémentaire</li>\r\n  <li>Blindage : 95% cuivre</li>\r\n  <li>Connecteurs XLR mâle et XLR femelle</li>\r\n  <li>Couleur : Noir</li>\r\n</ul>',12.5,'457617.jpg',399990,33,1,'2022-09-26 14:52:34.424190',1),
(81,'274229','Monkey Banana Turbo 5 black','Enceinte de proximité active 2 voies 5\" + 1\"','<h2>Enceinte de proximité active 2 voies 5\" + 1\"</h2>\r\n<ul>\r\n  <li>Puissance: 50W + 30W</li>\r\n  <li>Réponse en fréquence: 55 Hz - 30 kHz</li>\r\n  <li>EQ 2 bandes basse et aigüe: +/-6 dB</li>\r\n  <li>Fréquence de coupure: 3 kHz</li>\r\n  <li>THD + N HF / LF: 0,05% / 0,02%</li>\r\n  <li>Entrées: XLR / TRS combo jack - entrées RCA -\r\n  <li>Entrée pour signaux numériques S/PDIF</li>\r\n  <li>Sorties: S / PDIF pour la transmission de signaux numériques</li>\r\n  <li>Sélection d\'entrée: analogique ou numérique</li>\r\n  <li>Sélection des canaux: gauche ou droite (signal numérique uniquement)</li>\r\n  <li>Impédance d\'entrée: 20 kOhm symétrique, 10 kOhm asymétrique</li>\r\n  <li>Sensibilité d\'entrée: +4 dBu (symétrique), -10 dBV (asymétrique)</li>\r\n  <li>Poids: 5,9 kg</li>\r\n  <li>Dimensions: L320 x H389 x P287 mm</li>\r\n  <li>Couleur: noire</li>\r\n</ul>',229.1666,'274229.jpg',39998,22,29,'2022-09-28 08:14:15.204832',1),
(82,'274241','Monkey Banana Turbo 8 black','Enceinte de proximité active 2 voies 8\" + 1\", 80W + 30W...','<h2>Enceinte de proximité active 2 voies 8\" + 1\"</h2>\r\n<ul>\r\n  <li>Puissance: 80W + 30W</li>\r\n  <li>Réponse en fréquence: 45 Hz - 30 kHz</li>\r\n  <li>EQ 2 bandes basse et aigüe: +/- 6 dB</li>\r\n  <li>Fréquence de coupure: 3 kHz</li>\r\n  <li>Blindage magnétique</li>\r\n  <li>THD + N HF / LF: 0,04% / 0,02%</li>\r\n  <li>Entrées: combo XLR / jack TRS et entrées RCA</li>\r\n  <li>Entrée pour signaux numériques S/PDIF</li>\r\n  <li>Sorties: S/PDIF pour la transmission de signaux numériques</li>\r\n  <li>Sélection d\'entrée: analogique ou numérique</li>\r\n  <li>Sélection des canaux: Gauche ou Droite (signal numérique uniquement)</li>\r\n  <li>Impédance d\'entrée: 20 kOhm symétrique, 10 kOhm asymétrique</li>\r\n  <li>Sensibilité d\'entrée: +4 dBu (symétrique), -10 dBV (asymétrique)</li>\r\n  <li>Poids: 12,2 kg</li>\r\n  <li>Dimensions:L425 x P385 x H522 mm</li>\r\n  <li>Couleur: noir</li>\r\n</ul>',332.5,'274241.jpg',39996,22,29,'2022-09-28 08:49:03.804474',1),
(83,'274243','Monkey Banana Turbo 10s black 4','Caisson de basses actif 10\" 300W...','<h2>Caisson de basses actif 10\"</h2>\r\n<ul>\r\n  <li>Puissance: 300W</li>\r\n  <li>Réponse en fréquence: 20 Hz - 40 / 120 Hz</li>\r\n  <li>Fréquence de coupure: 40 - 120 Hz</li>\r\n  <li>Blindage magnétique</li>\r\n  <li>Ratio signal sur bruit (pondéré): >90 dB</li>\r\n  <li>THD + N LF: 0,08 %</li>\r\n  <li>Entrées: combo XLR / jack TRS et entrées RCA</li>\r\n  <li>Entrée pour signaux numériques S/PDIF</li>\r\n  <li>Sorties: S/PDIF pour la transmission de signaux numériques\r\n  <li>Sélection d\'entrée: analogique ou numérique</li>\r\n  <li>Sélection des canaux: Gauche ou Droite (signal numérique uniquement)</li>\r\n  <li>Impédance d\'entrée: 20 kOhm symétrique, 10 kOhm asymétrique</li>\r\n  <li>Sensibilité d\'entrée: +4 dBu (symétrique), -10 dBV (asymétrique)</li>\r\n  <li>Poids: 18,7 kg</li>\r\n  <li>Dimensions: 374 x 368 x 383 mm</li>\r\n  <li>Couleur: noir</li>\r\n</ul>',574.166,'274243.jpg',19997,23,29,'2022-09-28 08:52:31.175983',1),
(84,'504613','Gibson SG ´61 Standard Maestro BK Spk','Guitare électrique 22 frettes Custom Shop...','<h2>Guitare électrique</h2>\r\n<ul>\r\n  <li>Custom Shop</li>\r\n  <li>Corps 1 pièce en acajou</li>\r\n  <li>Manche en acajou</li>\r\n  <li>Profil du manche des années 60</li>\r\n  <li>Touche 1 pièce en palissandre</li>\r\n  <li>Collage à chaud</li>\r\n  <li>Historic Truss Rod Assembly</li>\r\n  <li>22 frettes</li>\r\n  <li>2 micros Custombucker</li>\r\n  <li>Vibrato Maestro</li>\r\n  <li>Accastillage doré</li>\r\n  <li>Couleur: Black Sparkle</li>\r\n  <li>Livrée en étui Custom Shop</li>\r\n  <li>Fabriquée aux USA</li>\r\n</ul>',4444.166,'504613.jpg',9998,4,3,'2022-10-14 10:01:01.161570',1),
(85,'544439','Teenage Engineering OP-1 field','Synthétiseur de bureau...','<h2>Synthétiseur de bureau</h2>\r\n<ul>\r\n  <li>4 modes: Synth, Drum, Tape, Mixer</li>\r\n  <li>Moteur d\'échantillonnage stéréo</li>\r\n  <li>7 moteurs de synthétiseur stéréo</li>\r\n  <li>Antenne FM interne</li>\r\n  <li>8 bandes avec 6 minutes d\'enregistrement chacune et 4 pistes stéréo</li>\r\n  <li>4 formats d\'enregistrement sur bande: Studio 4 pistes, Vintage 4 pistes, Porta et Disc Mini</li>\r\n  <li>Audio 32 bits sur toute la chaîne du signal</li>\r\n  <li>Connexion directe USB audio/MIDI vers OP-Z, TX-6 et OP-1</li>\r\n  <li>USB-MIDI Host</li>\r\n  <li>256 Mo de mémoire interne</li>\r\n  <li>Jusqu\'à 500 patchs utilisateur</li>\r\n  <li>Plus de 160 minutes de mémoire d\'échantillonnage</li>\r\n</ul>',1665.8333333333,'544439.jpg',9999,24,30,'2022-11-07 11:12:51.235162',1),
(86,'542726','Teenage Engineering TX-6','Mixeur professionnel portable...','<h2>Mixeur professionnel portable</h2>\r\n<ul>\r\n  <li>6 entrées stéréo</li>\r\n  <li>3 sorties stéréo (main / cue / aux)</li>\r\n  <li>Interface audio USB 32 bits 12 canaux</li>\r\n  <li>Égaliseur 3 bandes et compresseur par canal</li>\r\n  <li>Filtres passe-haut et passe-bas</li>\r\n  <li>2 processeurs multi-effets stéréo</li>\r\n  <li>Mode crossfader</li>\r\n  <li>Midi via USB-C et Bluetooth LE</li>\r\n  <li>Accordeur intégré</li>\r\n  <li>Synthétiseur embarqué avec séquenceur</li>\r\n  <li>Écran OLED avec 64 x 48 pixels</li>\r\n  <li>Batterie d\'une capacité allant jusqu\'à 7 heures</li>\r\n  <li>Entrées audio : Gain analogique 0 - 42 dB, SNR : ~ 102 dBA</li>\r\n  <li>Sortie audio (principale, aux) : niveau Max 8 dBu, 2 Vrms, convertisseur NA : Cirrus Logic Masterhifi CS43131, SNR : > 120 dBA</li>\r\n  <li>Sortie audio (cue) : Max Level 2 dBu, 1 Vrms, convertisseur NA : Cirrus Logic CS47L35, SNR : > 110 dBA</li>\r\n  <li>Connexions audio : mini-jack stéréo 3,5 mm</li>\r\n  <li>Dimensions (L x P x H) : 62 x 90 x 23 mm</li>\r\n  <li>Poids : 145 g</li>\r\n</ul>',949.1666666666,'542726.jpg',9999,29,30,'2022-11-07 11:18:55.645785',1),
(87,'543063','Gibson Lzzy Hale Explorerbird CR','Guitare électrique...','<h2>Guitare électrique</h2>\r\n<ul>\r\n  <li>Modèle signature Lzzy Hale (Halestorm)</li>\r\n  <li>Corps en acajou</li>\r\n  <li>Manche en acajou</li>\r\n  <li>Touche en palissandre</li>\r\n  <li>Repères \"points\" en acrylique doré</li>\r\n  <li>Profil du manche: Slim Taper</li>\r\n  <li>Diapason: 628 mm</li>\r\n  <li>Sillet Graph Tech</li>\r\n  <li>22 frettes dorées</li>\r\n  <li>2 micros double bobinage 70s Tribute avec plots dorés</li>\r\n  <li>Pickguard noir</li>\r\n  <li>Chevalet Tune-o-matic</li>\r\n  <li>Cordier</li>\r\n  <li>Mécaniques miniatures Grover</li>\r\n  <li>Accastillage doré</li>\r\n  <li>Couleur: Cardinal Red</li>\r\n  <li>Livrée en étui Modern</li>\r\n  <li>Fabriquée aux USA</li>\r\n</ul>',2325,'543063.jpg',98,4,3,'2023-01-10 11:42:58.544647',1),
(88,'230053','Monkey Banana Turbo 6 Red','Moniteur de studio actif','<h2>Moniteur de studio actif</h2>\r\n<ul>\r\n  <li>Woofer:    6 1/2-inch magnetically shielded polypropylene / ceramic membrane</li>\r\n  <li>Tweeter:   1-inch silk dome tweeter</li>\r\n  <li>Frequency response:  50Hz - 30kHz</li>\r\n  <li>HF - Level:   -6dB ~ +6 dB variable at 10kHz</li>\r\n  <li>LF - Level:   -6dB ~ +6 dB variable at 100Hz</li>\r\n  <li>Crossover frequency:  3kHz</li>\r\n  <li>LF - Amplifier Power:  60W</li>\r\n  <li>HF - Amplifier Power  30W</li>\r\n  <li>Signal HF / LF:   92dB / 98dB</li>\r\n  <li>THD + N @ Rated Power HF / LF: 0.05% / 0.02%</li>\r\n  <li>Inputs:    XLR/TRS - Neutrik® Combo-jack, RCA input, S/PDIF - RCA input for digital signal</li>\r\n  <li>Outputs:   S / PDIF - RCA jack for digital signal thru</li>\r\n  <li>Input Select:   Analog or Digital</li>\r\n  <li>Channel selection:  Left or Right (Digital input mode only)</li>\r\n  <li>Input Impedance:  20 kOhm balanced, 10 kOhm unbalanced</li>\r\n  <li>Input Sensitivity:  +4 dBu (Balanced), -10dBV (unbalanced)</li>\r\n  <li>Gross Weight:   9.1 kg / 20lb</li>\r\n  <li>Net weight:   7.6 kg / 16.7lb</li>\r\n  <li>Gross Dimensions:  L365 x W322 x H449 mm</li>\r\n  <li>L14.37x W12.67 x H17.67 in</li>\r\n  <li>Net Dimensions:   L260 x W229 x H328 mm</li>\r\n  <li>L10.24 x W9.02 x H12.91 in</li>\r\n</ul>',315.833333333,'230053.webp',498,22,29,'2023-02-01 13:17:40.562453',1),
(89,'230091','Monkey Banana Turbo 10s red','Caisson de basses actif','<h2>Caisson de basses actif</h2>\r\n<ul>\r\n  <li>Woofer: 10-inch Paper Cone</li>\r\n  <li>Frequency response:   20Hz – 40Hz ~ 120Hz</li>\r\n  <li>Crossover frequency:   40-120Hz adjustable</li>\r\n  <li>Lf - Amplifier Power:   300W</li>\r\n  <li>Signal LF:    >90dB</li>\r\n  <li>THD + N @ Rated Power LF:  0.08%</li>\r\n  <li>Inputs:     2x XLR, 2x TRS, 2x RCA Connectors, S/PDIF Connector for digital signal</li>\r\n  <li>Outputs: 2x XLR,  2x TRS,   2x RCA Connectors,   S/PDIF - RCA jack for digital signal thru</li>\r\n  <li>Input Impedance: 20 kOhm balanced, 10 kOhm unbalanced</li>\r\n  <li>Input Sensitivity: +4 dBu (Balanced), -10dBV (unbalanced)</li>\r\n  <li>Phase reverse: 0° /180° switch</li>\r\n  <li>Available colors:  Red, Black</li>\r\n  <li>Gross Weight: 22.4kg / 49.2lb</li>\r\n  <li>Net weight: 18.7kg / 41.1lb</li>\r\n  <li>Gross Dimensions: L500 x W523 x H523 mm</li>\r\n  <li>Net Dimensions: L374 x W368 x H383 mm</li>\r\n</ul>',582.5,'230091.webp',249,23,29,'2023-02-01 13:23:37.686232',1),
(90,'545625','Phil Jones X4 Nanobass Red','Combo miniature 35W','<h2>Combo miniature</h2>\r\n<ul>\r\n  <li>Pour basse, guitare, ukulélé et autres</li>\r\n  <li>Design à transistor/semi-conducteurs</li>\r\n  <li>Circuit d\'amplification numérique</li>\r\n  <li>Puissance: 35 Watt (RMS)</li>\r\n  <li>1 haut-parleur 4\" PJB N52 Neo-Power</li>\r\n  <li>Réponse en fréquence: 72 Hz - 15 kHz</li>\r\n  <li>Crossover actif basé sur DSP et contrôle de la plage dynamique</li>\r\n  <li>EQ 3 bandes avec Boost/Cut +/- 15 dB par bande</li>\r\n  <li>Entrée Aux (mini Jack stéréo 3,5 mm ou Bluetooth) avec niveau réglable</li>\r\n  <li>Connexion et lecture faciles d\'appareils externes via Bluetooth</li>\r\n  <li>Sortie casque</li>\r\n  <li>Contrôles: Input Level, Aux / Bluetooth Level, Bass, Mid, Treble, Master Volume</li>\r\n  <li>Commutateur Power sur le dessus</li>\r\n  <li>Tension d\'entrée: 100 - 240V AC</li>\r\n  <li>Bluetooth 5.0</li>\r\n  <li>Dimensions (L x P x H): 160 x 200 x 198 mm</li>\r\n  <li>Poids: 2,4 kg</li>\r\n  <li>Revêtement en tolex rouge</li>\r\n</ul>',307.5,'545625.jpg',99,10,31,'2023-02-01 13:39:17.183489',1),
(91,'552256','Boss DS-1w Distortion','Pédale d\'effet','<h2>Pédale d\'effet</h2>\r\n<ul>\r\n  <li>Pour guitare électrique</li>\r\n  <li>Distorsion</li>\r\n  <li>Version WAZA de haute qualité de la distorsion légendaire et classique fabriquée depuis 1978</li>\r\n  <li>Reste clair même en cas de distorsion extrême, préservant les caractéristiques sonores uniques des différentes guitares, micros et styles</li>\r\n  <li>2 modes offrant plus de polyvalence: \r\n    <ul>\r\n      <li>Mode Standard offrant le son légendaire de la DS-1 originale</li>\r\n      <li>Mode Custom offrant des tonalités de distorsion plus grasses avec des médiums serrés et une réponse plus élevée</li>\r\n    </ul>\r\n  <li>Contrôles: Level, Distortion, Tone</li>\r\n  <li>Commutateur: Mode (Standard/Custom)</li>\r\n  <li>LED de statut: Effect On</li>\r\n  <li>Commutateur au pied: Effect Bypass</li>\r\n  <li>Entrée/sortie sur Jack 6,3 mm</li>\r\n  <li>Connexion pour alimentation secteur sur prise cylindrique 2,1 x 5,5 mm, polarité négative à l\'intérieur</li>\r\n  <li>Fonctionne avec une pile 9V</li>\r\n  <li>Consommation de courant: 4 mA</li>\r\n  <li>Dimensions (L x P x H): 73 x 129 x 59 mm</li>\r\n  <li>Poids: 400 g</li>\r\n  <li>Fabriquée au Japon</li>\r\n</ul>',132.5,'552256.jpg',99,34,32,'2023-02-01 13:58:17.382260',1),
(92,'152062','Boss BF-3','Pédale flanger','<h2>Pédale flanger</h2>\r\n<ul>\r\n  <li>Nouveaux modes Ultra pour un flanger bien gras</li>\r\n  <li>Gate/Pan qui fera tourner votre son autour du public</li>\r\n  <li>Mode Momentary qui active l\'effet immédiatement</li>\r\n  <li>Tap tempo</li>\r\n  <li>Entrées guitare/basse séparées</li>\r\n  <li>Sortie stéréo</li>\r\n</ul>',124.166666,'152062.jpg',99,34,32,'2023-02-01 14:04:40.474990',1),
(93,'393030','Boss CE-2w','Pédale d\'effet','<h2>Pédale d\'effets</h2>\r\n<ul>\r\n  <li>Série Waza Craft</li>\r\n  <li>Chorus et vibrato de qualité studio des légendaires CE-1 et CE-2</li>\r\n  <li>Contrôles: Rate et Depth</li>\r\n  <li>3 modes: Standard, chorus CE-1, vibrato CE-1</li>\r\n  <li>Composants analogiques avec Bucket Brigade Device (BBD)</li>\r\n  <li>Fonctionne avec une pile 9V</li>\r\n  <li>Dimensions: 73 x 59 x 129 mm</li>\r\n  <li>Poids avec pile: 450 g</li>\r\n  <li>Fabriquée au Japon</li>\r\n</ul>',206.66666,'393030.jpg',99,34,32,'2023-02-01 14:10:58.370601',1);
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_supplier`
--

DROP TABLE IF EXISTS `store_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `shortname` varchar(25) NOT NULL,
  `address` varchar(50) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `store_supplier_country_id_ac643632_fk_store_country_id` (`country_id`),
  CONSTRAINT `store_supplier_country_id_ac643632_fk_store_country_id` FOREIGN KEY (`country_id`) REFERENCES `store_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_supplier`
--

LOCK TABLES `store_supplier` WRITE;
/*!40000 ALTER TABLE `store_supplier` DISABLE KEYS */;
INSERT INTO `store_supplier` VALUES
(1,'722126597','Fender Musical Instruments Corp.','Fender','Dummy','00000','Dummy','Mr Mooney','000000000','contact@fender.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/fender.gif',229),
(2,'576757992','Marshall Amplifiers Inc.','Marshall','Dummy','00000','Dummy','None','000000000','contact@marshall.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/marshall.gif',228),
(3,'868732367','Gibson Brands Corp.','Gibson','Dummy','00000','Dummy','Mr Gibson','000000000','contact@gibson.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/gibson.gif',229),
(4,'646453220','Epiphone','Epiphone','Dummy','00000','Dummy','Mr Stathopoulos','000000000','contact@epiphone.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/epiphone.gif',229),
(5,'259626692','Squier Electric Guitars','Squier','Dummy','000000','Dummy','Mr Squier','000000000','contactsquier@fender.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/squier.gif',229),
(6,'187225896','Ibanez Guitars','Ibanez','Dummy','00000','Dummy','Mr Gakki','000000000','contact@ibanez.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/ibanez.gif',105),
(7,'896876677','Guitarras Ramirez','Ramirez','Dummy','00000','Dummy','Mr Ramirez','000000000','contact@guitarrasramirez.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/ramirez.gif',202),
(9,'739976682','Focusrite','Focusrite','Dummy','00000','Dummy','Mr Rite','000000000','contact@focusrite.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/focusrite.gif',228),
(10,'139721436','Roland Corporation','Roland','Dummy','00000','Dummy','Mr Rolando','000000000','contact@roland.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/roland.gif',105),
(11,'232486394','Sony Group Corporation','Sony','1-7-1 Konan Minato-ku','1080075','Tokyo','Mr Kenichiro Yoshida','81-3-6748-2111','contact@sony.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/sony.gif',105),
(12,'629172243','Neumann Company','Neumann','Dummy','00000','Dummy','Mr Neumann','000000000','contact@neumann.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/neumann.gif',78),
(13,'822292900','Genelec','Genelec','Tureholmsvägen 12','12535','Älvsjö','Mr Solja Nieminen','46 8 449 52 20','sweden@genelec.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/genelec.gif',208),
(14,'336412910','Korg Inc.','Korg','4015-2, Yanokuchi, Inagi-shi','2060812','Tokyo','Mr Seiki Kato','+81 42 379 5771','contact@korg.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/korg.gif',105),
(15,'871757436','Yamaha Corp.','Yamaha','Dummy','00000','Dummy','Mr Yamaha','000000000','contact@yamaha.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/yamaha.gif',105),
(16,'259621291','Shure Inc.','Shure','Dummy','00000','Dummy','Mr Sydney N. Shure','000000000','contact@shure.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/shure.gif',229),
(17,'131256963','RØDE Microphones','RØDE','Dummy','00000','Dummy','Mr Rode','+61 2 9648 5855','contact@rode.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/rode.gif',13),
(18,'194268621','Rupert Neve Designs','Neve','Dummy','00000','Dummy','Mr Rupert Neve','000000000','contact@rupertneve.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/rupert_neve_designs.gif',229),
(19,'239218263','Sound Performance Labs Electronics','SPL','Dummy','00000','Dummy','Mr Hermann Gier','000000000','contact@spl.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/spl.gif',78),
(20,'692886325','Elektron Music Machines Inc.','Elektron','Banehagsliden 5, 5 tr.','41451','Göteborg','Mr Elektron','000000000','contact@elektron.se','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/elektron.gif',208),
(21,'121976963','Alesis','Alesis','Dummy','00000','Dummy','Mr Alesis','000000000','contact@alesis.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/alesis.gif',229),
(22,'576873352','Mark  Of The Unicorn','MOTU','Dummy','00000','Dummy','Mr Unicorn','000000000','contact@motu.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/motu.gif',229),
(23,'426126779','Universal Audio, Inc.','Universal Audio','Dummy','00000','Dummy','Mr Audio','0000000000','contact@uaudio.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/universal_audio.gif',228),
(24,'592916300','M-Audio','M-Audio','Dummy','00000','Dummy','Mr. Audio','000000000','contact@m-audio.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/m_audio.gif',229),
(25,'291639329','Audio-Technica Ltd.','Audio-Technica','Dummy','00000','Dummy','Mr Hideo Matsushita','000000000','contact@audio-technica.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/audio_technica.gif',105),
(26,'239612878','Solid State Logic','SSL','Dummy','00000','Oxford','Mr Colin Sanders','000000000','contact@solidstatelogic.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/ssl.gif',228),
(27,'583129184','Dbx Inc. By Harman','Dbx','Dummy','00000','Dummy','Mr David E. Blackmer','000000000','contact@dbxpro.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/dbx.gif',229),
(28,'862879500','Gretsch','Gretsch','Dummy','00000','Dummy','Mr Friedrich Gretsch','000000000','contact@gretsch.com','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/gretsch.gif',229),
(29,'532824372','Monkey Banana','Monkey Banana','Dummy','00000','Dummy','Mr Kong','000000000','contact@mokey-banana.de','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/monkey_banana.gif',78),
(30,'322274262','Teenage Engineering','Teenage Engineering','There','000000','Dunno','Mr Teenage','000000000','contact@teenage.engineering','/home/stephane/projets/CDA22075/A_fil_rouge/A_app/sunsetmusic/store/static/store/img/teenage_engineering.gif',72),
(31,'856923227','Phil Jones Bass','Phil Jones','8509 Mid County Industrial Dr.','63114','St Louis','Mr Phil Jones','+00000000','info@philjonespuresound.com','/home/stephane/projets/sunsetmusicstore/store/static/store/img/phil_jones.gif',229),
(32,'337700000','Boss','Boss','-','00000','-','Mr Roland Boss','+0000000000','info@boss.info','/home/stephane/projets/sunsetmusicstore/store/static/store/img/boss.gif',105);
/*!40000 ALTER TABLE `store_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_user`
--

DROP TABLE IF EXISTS `store_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `user_id` char(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(127) NOT NULL,
  `last_name` varchar(127) NOT NULL,
  `phone_number` varchar(128) NOT NULL,
  `business_customer` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_user`
--

LOCK TABLES `store_user` WRITE;
/*!40000 ALTER TABLE `store_user` DISABLE KEYS */;
INSERT INTO `store_user` VALUES
('pbkdf2_sha256$390000$u5rcOHcda5X8AH9JhKsM7c$Iv/cb7aceNMu0gOx262KI4Q+O0K4qIUCNvuYT/JMRys=','2023-02-01 13:02:37.709550',1,'944e5ce45e554be49b7c19e4a600d3b7','stm3y3r@icloud.com','Stéphane','MEYER','+33660783256',0,1,1),
('pbkdf2_sha256$390000$mX89pFrDUmGRKzMWqCJsYr$7D+HnsePn/DlRT7VsNBgg62ekJsrB/ESIUM64neMpCs=','2022-11-03 15:50:01.003126',0,'c8fef892e63a4a42b40e1171a665c38e','tigerlost@me.com','Hermes','Æpteny','+33607080910',0,1,0),
('pbkdf2_sha256$390000$2hf1zXwz2ELLiDiZLCeeef$xJNLIo0oS9KDDSroV4XUQiydu1PxYtYoTHBllNSBAdc=','2022-11-03 15:51:45.763403',0,'e4c2b5c70936468c88b833b3f39e6cea','info@medeux.fr','Albert','Ebasque','+33123456789',1,1,0),
('pbkdf2_sha256$390000$UWSlucZ0mCc9M34prOxh2S$XeJydaS0Uos3yU1yU/65I+aneDLbbmagAxsqaOpDPPs=','2022-11-10 14:48:46.581671',0,'e961928818bf48359b101d6ef34a1310','zaza@zaza.com','Zaza','Zaza','+33123456789',0,1,0);
/*!40000 ALTER TABLE `store_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_user_groups`
--

DROP TABLE IF EXISTS `store_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_user_groups_user_id_group_id_d5c2dca2_uniq` (`user_id`,`group_id`),
  KEY `store_user_groups_group_id_def3ecb1_fk_auth_group_id` (`group_id`),
  CONSTRAINT `store_user_groups_group_id_def3ecb1_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `store_user_groups_user_id_f76ad019_fk_store_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_user_groups`
--

LOCK TABLES `store_user_groups` WRITE;
/*!40000 ALTER TABLE `store_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_user_user_permissions`
--

DROP TABLE IF EXISTS `store_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_user_user_permissions_user_id_permission_id_bfd44b7c_uniq` (`user_id`,`permission_id`),
  KEY `store_user_user_perm_permission_id_d9830978_fk_auth_perm` (`permission_id`),
  CONSTRAINT `store_user_user_perm_permission_id_d9830978_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `store_user_user_perm_user_id_31a90150_fk_store_use` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_user_user_permissions`
--

LOCK TABLES `store_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `store_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_vat`
--

DROP TABLE IF EXISTS `store_vat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_vat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rate` double NOT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_vat`
--

LOCK TABLES `store_vat` WRITE;
/*!40000 ALTER TABLE `store_vat` DISABLE KEYS */;
INSERT INTO `store_vat` VALUES
(1,0.2,'2022-09-22');
/*!40000 ALTER TABLE `store_vat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-01 15:16:07
