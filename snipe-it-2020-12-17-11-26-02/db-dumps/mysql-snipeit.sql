
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
DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `requestable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `accessories_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessories_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `accessories_users` WRITE;
/*!40000 ALTER TABLE `accessories_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessories_users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `filename` text COLLATE utf8mb4_unicode_ci,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `expected_checkin` date DEFAULT NULL,
  `accepted_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `accept_signature` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_meta` text COLLATE utf8mb4_unicode_ci,
  `action_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `action_logs_thread_id_index` (`thread_id`),
  KEY `action_logs_target_id_target_type_index` (`target_id`,`target_type`),
  KEY `action_logs_created_at_index` (`created_at`),
  KEY `action_logs_item_type_item_id_action_type_index` (`item_type`,`item_id`,`action_type`),
  KEY `action_logs_target_type_target_id_action_type_index` (`target_type`,`target_id`,`action_type`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `action_logs` WRITE;
/*!40000 ALTER TABLE `action_logs` DISABLE KEYS */;
INSERT INTO `action_logs` VALUES (1,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',1,NULL,NULL,'2020-11-25 09:13:04','2020-11-25 09:13:04',NULL,NULL,1,NULL,NULL,NULL),(2,1,'checkout',1,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',1,NULL,NULL,'2020-11-25 09:13:04','2020-11-25 09:13:04',NULL,NULL,NULL,NULL,NULL,'2020-11-25 09:13:04'),(3,1,'add seats',NULL,NULL,NULL,'added 1 seats',NULL,'App\\Models\\License',1,NULL,NULL,'2020-11-25 09:30:23','2020-11-25 09:30:23',NULL,NULL,1,NULL,NULL,NULL),(4,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',1,NULL,NULL,'2020-11-25 09:30:23','2020-11-25 09:30:23',NULL,NULL,1,NULL,NULL,NULL),(5,1,'checkout',1,'App\\Models\\User',1,NULL,NULL,'App\\Models\\License',1,NULL,NULL,'2020-11-25 09:30:46','2020-11-25 09:30:46',NULL,NULL,NULL,NULL,NULL,'2020-11-25 09:30:46'),(6,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',1,NULL,NULL,'2020-11-25 09:45:50','2020-11-25 09:45:50',NULL,NULL,1,NULL,'{\"purchase_date\":{\"old\":\"2019-01-07\",\"new\":\"2019-01-02\"},\"supplier_id\":{\"old\":null,\"new\":\"4\"},\"rtd_location_id\":{\"old\":null,\"new\":\"1\"}}',NULL),(7,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',1,NULL,NULL,'2020-11-25 10:45:40','2020-11-25 10:45:40',NULL,NULL,1,NULL,NULL,NULL),(8,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',1,NULL,NULL,'2020-11-25 10:46:52','2020-11-25 10:46:52',NULL,NULL,1,NULL,'{\"asset_tag\":{\"old\":\"00001\",\"new\":\"DLB-1234234234234234\"}}',NULL),(9,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',1,NULL,NULL,'2020-11-25 10:47:21','2020-11-25 10:47:21',NULL,NULL,1,NULL,'[]',NULL),(10,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',1,NULL,NULL,'2020-11-25 10:52:01','2020-11-25 10:52:01',NULL,NULL,1,NULL,'[]',NULL),(11,1,'checkin from',1,'App\\Models\\User',NULL,'test',NULL,'App\\Models\\License',1,NULL,NULL,'2020-11-25 10:53:21','2020-11-25 10:53:21',NULL,NULL,NULL,NULL,NULL,NULL),(12,1,'checkout',1,'App\\Models\\User',1,NULL,NULL,'App\\Models\\License',1,NULL,NULL,'2020-11-25 10:54:02','2020-11-25 10:54:02',NULL,NULL,NULL,NULL,NULL,'2020-11-25 10:54:02'),(13,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',2,NULL,NULL,'2020-12-01 21:14:49','2020-12-01 21:14:49',NULL,NULL,3,NULL,NULL,NULL),(14,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',3,NULL,NULL,'2020-12-01 21:16:31','2020-12-01 21:16:31',NULL,NULL,3,NULL,NULL,NULL),(15,2,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',3,NULL,NULL,'2020-12-01 21:17:03','2020-12-01 21:17:03',NULL,NULL,3,NULL,'{\"name\":{\"old\":null,\"new\":\"Laptop\"}}',NULL),(16,2,'checkout',4,'App\\Models\\User',2,'Früher war es der Laptop von Nikola Simic',NULL,'App\\Models\\Asset',3,NULL,NULL,'2020-12-01 21:19:58','2020-12-01 21:19:58',NULL,NULL,3,NULL,NULL,'2020-11-02 00:00:00'),(17,2,'checkout',10,'App\\Models\\User',2,'',NULL,'App\\Models\\Asset',2,NULL,NULL,'2020-12-01 21:20:30','2020-12-01 21:20:30',NULL,NULL,3,NULL,NULL,'2018-04-23 00:00:00'),(18,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',4,NULL,NULL,'2020-12-02 08:54:55','2020-12-02 08:54:55',NULL,NULL,3,NULL,NULL,NULL),(19,2,'checkout',12,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',4,NULL,NULL,'2020-12-02 08:54:55','2020-12-02 08:54:55',NULL,NULL,3,NULL,NULL,'2020-12-02 08:54:55'),(20,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',5,NULL,NULL,'2020-12-02 08:56:24','2020-12-02 08:56:24',NULL,NULL,3,NULL,NULL,NULL),(21,2,'checkout',12,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',5,NULL,NULL,'2020-12-02 08:56:24','2020-12-02 08:56:24',NULL,NULL,3,NULL,NULL,'2020-12-02 08:56:24'),(22,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',6,NULL,NULL,'2020-12-02 08:57:33','2020-12-02 08:57:33',NULL,NULL,3,NULL,NULL,NULL),(23,2,'checkout',9,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',6,NULL,NULL,'2020-12-02 08:57:33','2020-12-02 08:57:33',NULL,NULL,3,NULL,NULL,'2020-12-02 08:57:33'),(24,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',7,NULL,NULL,'2020-12-02 08:58:49','2020-12-02 08:58:49',NULL,NULL,3,NULL,NULL,NULL),(25,2,'checkout',8,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',7,NULL,NULL,'2020-12-02 08:58:49','2020-12-02 08:58:49',NULL,NULL,3,NULL,NULL,'2020-12-02 08:58:49'),(26,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',8,NULL,NULL,'2020-12-02 09:00:47','2020-12-02 09:00:47',NULL,NULL,3,NULL,NULL,NULL),(27,2,'checkout',19,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',8,NULL,NULL,'2020-12-02 09:00:47','2020-12-02 09:00:47',NULL,NULL,3,NULL,NULL,'2020-12-02 09:00:47'),(28,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',9,NULL,NULL,'2020-12-02 09:02:02','2020-12-02 09:02:02',NULL,NULL,3,NULL,NULL,NULL),(29,2,'checkout',13,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',9,NULL,NULL,'2020-12-02 09:02:02','2020-12-02 09:02:02',NULL,NULL,3,NULL,NULL,'2020-12-02 09:02:02'),(30,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',10,NULL,NULL,'2020-12-02 09:03:15','2020-12-02 09:03:15',NULL,NULL,3,NULL,NULL,NULL),(31,2,'checkout',14,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',10,NULL,NULL,'2020-12-02 09:03:15','2020-12-02 09:03:15',NULL,NULL,3,NULL,NULL,'2020-12-02 09:03:15'),(32,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',11,NULL,NULL,'2020-12-02 09:04:16','2020-12-02 09:04:16',NULL,NULL,3,NULL,NULL,NULL),(33,2,'checkout',15,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',11,NULL,NULL,'2020-12-02 09:04:16','2020-12-02 09:04:16',NULL,NULL,3,NULL,NULL,'2020-12-02 09:04:16'),(34,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',12,NULL,NULL,'2020-12-02 09:05:21','2020-12-02 09:05:21',NULL,NULL,3,NULL,NULL,NULL),(35,2,'checkout',2,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',12,NULL,NULL,'2020-12-02 09:05:21','2020-12-02 09:05:21',NULL,NULL,3,NULL,NULL,'2020-12-02 09:05:21'),(36,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',13,NULL,NULL,'2020-12-02 09:06:10','2020-12-02 09:06:10',NULL,NULL,3,NULL,NULL,NULL),(37,2,'checkout',4,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',13,NULL,NULL,'2020-12-02 09:06:10','2020-12-02 09:06:10',NULL,NULL,3,NULL,NULL,'2020-12-02 09:06:10'),(38,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',14,NULL,NULL,'2020-12-02 09:07:17','2020-12-02 09:07:17',NULL,NULL,3,NULL,NULL,NULL),(39,2,'checkout',16,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',14,NULL,NULL,'2020-12-02 09:07:17','2020-12-02 09:07:17',NULL,NULL,3,NULL,NULL,'2020-12-02 09:07:17'),(40,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',15,NULL,NULL,'2020-12-02 09:08:11','2020-12-02 09:08:11',NULL,NULL,3,NULL,NULL,NULL),(41,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',16,NULL,NULL,'2020-12-02 09:09:14','2020-12-02 09:09:14',NULL,NULL,3,NULL,NULL,NULL),(42,2,'checkout',20,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',16,NULL,NULL,'2020-12-02 09:09:14','2020-12-02 09:09:14',NULL,NULL,3,NULL,NULL,'2020-12-02 09:09:14'),(43,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',17,NULL,NULL,'2020-12-02 09:10:07','2020-12-02 09:10:07',NULL,NULL,3,NULL,NULL,NULL),(44,2,'checkout',17,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',17,NULL,NULL,'2020-12-02 09:10:07','2020-12-02 09:10:07',NULL,NULL,3,NULL,NULL,'2020-12-02 09:10:07'),(45,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',18,NULL,NULL,'2020-12-02 09:11:25','2020-12-02 09:11:25',NULL,NULL,3,NULL,NULL,NULL),(46,2,'checkout',21,'App\\Models\\User',2,'',NULL,'App\\Models\\Asset',18,NULL,NULL,'2020-12-02 09:13:52','2020-12-02 09:13:52',NULL,NULL,3,NULL,NULL,'2020-12-02 09:13:52'),(47,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',19,NULL,NULL,'2020-12-02 09:15:41','2020-12-02 09:15:41',NULL,NULL,3,NULL,NULL,NULL),(48,2,'checkout',3,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',19,NULL,NULL,'2020-12-02 09:15:41','2020-12-02 09:15:41',NULL,NULL,3,NULL,NULL,'2020-12-02 09:15:41'),(49,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',20,NULL,NULL,'2020-12-02 09:17:00','2020-12-02 09:17:00',NULL,NULL,3,NULL,NULL,NULL),(50,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',21,NULL,NULL,'2020-12-02 09:18:11','2020-12-02 09:18:11',NULL,NULL,3,NULL,NULL,NULL),(51,2,'checkout',7,'App\\Models\\User',2,'Checked out on asset creation',NULL,'App\\Models\\Asset',21,NULL,NULL,'2020-12-02 09:18:11','2020-12-02 09:18:11',NULL,NULL,3,NULL,NULL,'2020-12-02 09:18:11'),(52,1,'checkin from',4,'App\\Models\\User',NULL,'hatte Nikola gehört',NULL,'App\\Models\\Asset',3,NULL,NULL,'2020-12-09 12:24:20','2020-12-09 12:24:20',NULL,NULL,3,NULL,NULL,NULL),(53,1,'checkout',22,'App\\Models\\User',NULL,'für Ranorex',NULL,'App\\Models\\Asset',3,NULL,NULL,'2020-12-09 12:24:48','2020-12-09 12:24:48',NULL,NULL,NULL,NULL,NULL,'2020-12-09 12:24:48'),(54,1,'checkin from',22,'App\\Models\\User',NULL,'ist nicht mehr im Unternehmen',NULL,'App\\Models\\Asset',3,NULL,NULL,'2020-12-09 12:25:10','2020-12-09 12:25:10',NULL,NULL,NULL,NULL,NULL,NULL),(55,1,'checkout',4,'App\\Models\\User',2,'Um einen besseren Laptop zu haben',NULL,'App\\Models\\Asset',3,NULL,NULL,'2020-12-09 12:26:36','2020-12-09 12:26:36',NULL,NULL,3,NULL,NULL,'2020-11-01 00:00:00'),(56,2,'add seats',NULL,NULL,NULL,'added 1 seats',NULL,'App\\Models\\License',2,NULL,NULL,'2020-12-11 14:27:53','2020-12-11 14:27:53',NULL,NULL,3,NULL,NULL,NULL),(57,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',2,NULL,NULL,'2020-12-11 14:27:53','2020-12-11 14:27:53',NULL,NULL,3,NULL,NULL,NULL),(58,2,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',2,NULL,NULL,'2020-12-11 14:28:19','2020-12-11 14:28:19',NULL,NULL,3,NULL,NULL,NULL),(59,2,'checkout',19,'App\\Models\\User',2,NULL,NULL,'App\\Models\\License',2,NULL,NULL,'2020-12-11 14:28:39','2020-12-11 14:28:39',NULL,NULL,3,NULL,NULL,'2020-12-11 14:28:39'),(60,2,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',2,NULL,NULL,'2020-12-11 14:31:57','2020-12-11 14:31:57',NULL,NULL,3,NULL,NULL,NULL),(61,2,'checkin from',19,'App\\Models\\User',NULL,NULL,NULL,'App\\Models\\License',2,NULL,NULL,'2020-12-11 14:32:07','2020-12-11 14:32:07',NULL,NULL,3,NULL,NULL,NULL),(62,2,'checkout',8,'App\\Models\\Asset',2,NULL,NULL,'App\\Models\\License',2,NULL,NULL,'2020-12-11 14:32:35','2020-12-11 14:32:35',NULL,NULL,3,NULL,NULL,'2020-12-11 14:32:35'),(63,2,'add seats',NULL,NULL,NULL,'added 1 seats',NULL,'App\\Models\\License',3,NULL,NULL,'2020-12-11 14:35:31','2020-12-11 14:35:31',NULL,NULL,3,NULL,NULL,NULL),(64,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',3,NULL,NULL,'2020-12-11 14:35:31','2020-12-11 14:35:31',NULL,NULL,3,NULL,NULL,NULL),(65,2,'checkout',17,'App\\Models\\Asset',2,NULL,NULL,'App\\Models\\License',3,NULL,NULL,'2020-12-11 14:36:00','2020-12-11 14:36:00',NULL,NULL,3,NULL,NULL,'2020-12-11 14:36:00'),(66,2,'add seats',NULL,NULL,NULL,'added 1 seats',NULL,'App\\Models\\License',4,NULL,NULL,'2020-12-11 14:39:36','2020-12-11 14:39:36',NULL,NULL,3,NULL,NULL,NULL),(67,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',4,NULL,NULL,'2020-12-11 14:39:36','2020-12-11 14:39:36',NULL,NULL,3,NULL,NULL,NULL),(68,2,'checkout',4,'App\\Models\\Asset',2,NULL,NULL,'App\\Models\\License',4,NULL,NULL,'2020-12-11 14:39:58','2020-12-11 14:39:58',NULL,NULL,3,NULL,NULL,'2020-12-11 14:39:58'),(69,2,'add seats',NULL,NULL,NULL,'added 1 seats',NULL,'App\\Models\\License',5,NULL,NULL,'2020-12-11 14:41:33','2020-12-11 14:41:33',NULL,NULL,3,NULL,NULL,NULL),(70,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',5,NULL,NULL,'2020-12-11 14:41:33','2020-12-11 14:41:33',NULL,NULL,3,NULL,NULL,NULL),(71,2,'checkout',14,'App\\Models\\User',2,NULL,NULL,'App\\Models\\License',5,NULL,NULL,'2020-12-11 14:41:52','2020-12-11 14:41:52',NULL,NULL,3,NULL,NULL,'2020-12-11 14:41:52'),(72,2,'add seats',NULL,NULL,NULL,'added 1 seats',NULL,'App\\Models\\License',6,NULL,NULL,'2020-12-11 14:42:53','2020-12-11 14:42:53',NULL,NULL,3,NULL,NULL,NULL),(73,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',6,NULL,NULL,'2020-12-11 14:42:53','2020-12-11 14:42:53',NULL,NULL,3,NULL,NULL,NULL),(74,2,'checkout',15,'App\\Models\\User',2,NULL,NULL,'App\\Models\\License',6,NULL,NULL,'2020-12-11 14:43:15','2020-12-11 14:43:15',NULL,NULL,3,NULL,NULL,'2020-12-11 14:43:15'),(75,2,'add seats',NULL,NULL,NULL,'added 1 seats',NULL,'App\\Models\\License',7,NULL,NULL,'2020-12-11 14:44:16','2020-12-11 14:44:16',NULL,NULL,3,NULL,NULL,NULL),(76,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',7,NULL,NULL,'2020-12-11 14:44:16','2020-12-11 14:44:16',NULL,NULL,3,NULL,NULL,NULL),(77,2,'checkout',6,'App\\Models\\Asset',2,NULL,NULL,'App\\Models\\License',7,NULL,NULL,'2020-12-11 14:44:34','2020-12-11 14:44:34',NULL,NULL,3,NULL,NULL,'2020-12-11 14:44:34'),(78,2,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',1,NULL,NULL,'2020-12-11 17:39:45','2020-12-11 17:39:45',NULL,NULL,1,NULL,NULL,NULL),(79,2,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',1,NULL,NULL,'2020-12-11 17:40:54','2020-12-11 17:40:54',NULL,NULL,1,NULL,NULL,NULL),(80,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',7,NULL,NULL,'2020-12-14 12:52:53','2020-12-14 12:52:53',NULL,NULL,3,NULL,NULL,NULL),(81,1,'add seats',NULL,NULL,NULL,'added 1 seats',NULL,'App\\Models\\License',8,NULL,NULL,'2020-12-14 12:55:16','2020-12-14 12:55:16',NULL,NULL,NULL,NULL,NULL,NULL),(82,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',8,NULL,NULL,'2020-12-14 12:55:16','2020-12-14 12:55:16',NULL,NULL,NULL,NULL,NULL,NULL),(83,1,'checkout',1,'App\\Models\\User',1,'nur zum testen von Snipe-IT',NULL,'App\\Models\\License',8,NULL,NULL,'2020-12-14 12:56:27','2020-12-14 12:56:27',NULL,NULL,NULL,NULL,NULL,'2020-12-14 12:56:27'),(84,1,'add seats',NULL,NULL,NULL,'added 1 seats',NULL,'App\\Models\\License',9,NULL,NULL,'2020-12-14 12:57:57','2020-12-14 12:57:57',NULL,NULL,NULL,NULL,NULL,NULL),(85,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\License',9,NULL,NULL,'2020-12-14 12:57:57','2020-12-14 12:57:57',NULL,NULL,NULL,NULL,NULL,NULL),(86,1,'checkout',1,'App\\Models\\User',1,NULL,NULL,'App\\Models\\License',9,NULL,NULL,'2020-12-14 12:58:07','2020-12-14 12:58:07',NULL,NULL,NULL,NULL,NULL,'2020-12-14 12:58:07'),(87,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',1,NULL,NULL,'2020-12-14 13:09:02','2020-12-14 13:09:02',NULL,NULL,1,NULL,'{\"name\":{\"old\":\"AAL\",\"new\":\"Laptop\"}}',NULL),(88,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',22,NULL,NULL,'2020-12-15 13:20:49','2020-12-15 13:20:49',NULL,NULL,3,NULL,NULL,NULL),(89,2,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',22,NULL,NULL,'2020-12-15 13:21:31','2020-12-15 13:21:31',NULL,NULL,3,NULL,'{\"purchase_cost\":{\"old\":\"37950.00\",\"new\":379.5}}',NULL),(90,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',23,NULL,NULL,'2020-12-15 13:22:55','2020-12-15 13:22:55',NULL,NULL,3,NULL,NULL,NULL),(91,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',24,NULL,NULL,'2020-12-15 13:24:57','2020-12-15 13:24:57',NULL,NULL,3,NULL,NULL,NULL),(92,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',25,NULL,NULL,'2020-12-15 15:14:41','2020-12-15 15:14:41',NULL,NULL,3,NULL,NULL,NULL),(93,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',26,NULL,NULL,'2020-12-15 15:16:04','2020-12-15 15:16:04',NULL,NULL,3,NULL,NULL,NULL),(94,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',27,NULL,NULL,'2020-12-15 15:16:50','2020-12-15 15:16:50',NULL,NULL,3,NULL,NULL,NULL),(95,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',28,NULL,NULL,'2020-12-15 15:17:09','2020-12-15 15:17:09',NULL,NULL,3,NULL,NULL,NULL),(96,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',29,NULL,NULL,'2020-12-15 15:18:09','2020-12-15 15:18:09',NULL,NULL,3,NULL,NULL,NULL),(97,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',30,NULL,NULL,'2020-12-15 15:18:35','2020-12-15 15:18:35',NULL,NULL,3,NULL,NULL,NULL),(98,2,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',29,NULL,NULL,'2020-12-15 15:19:12','2020-12-15 15:19:12',NULL,NULL,3,NULL,'{\"purchase_cost\":{\"old\":\"5867.00\",\"new\":58.67}}',NULL),(99,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',31,NULL,NULL,'2020-12-15 15:19:46','2020-12-15 15:19:46',NULL,NULL,3,NULL,NULL,NULL),(100,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',32,NULL,NULL,'2020-12-15 15:20:02','2020-12-15 15:20:02',NULL,NULL,3,NULL,NULL,NULL),(101,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',33,NULL,NULL,'2020-12-15 15:20:16','2020-12-15 15:20:16',NULL,NULL,3,NULL,NULL,NULL),(102,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',34,NULL,NULL,'2020-12-15 15:20:27','2020-12-15 15:20:27',NULL,NULL,3,NULL,NULL,NULL),(103,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',35,NULL,NULL,'2020-12-15 15:20:39','2020-12-15 15:20:39',NULL,NULL,3,NULL,NULL,NULL),(104,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',36,NULL,NULL,'2020-12-15 15:20:53','2020-12-15 15:20:53',NULL,NULL,3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `action_logs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `asset_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` int(11) NOT NULL,
  `checkedout_to` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `filename` text COLLATE utf8mb4_unicode_ci,
  `requested_at` datetime DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `accepted_id` int(11) DEFAULT NULL,
  `consumable_id` int(11) DEFAULT NULL,
  `expected_checkin` date DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `asset_logs` WRITE;
/*!40000 ALTER TABLE `asset_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_logs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `asset_maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_maintenances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `asset_maintenance_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_warranty` tinyint(1) NOT NULL,
  `start_date` date NOT NULL,
  `completion_date` date DEFAULT NULL,
  `asset_maintenance_time` int(11) DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `cost` decimal(20,2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `asset_maintenances` WRITE;
/*!40000 ALTER TABLE `asset_maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_maintenances` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `asset_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` int(11) NOT NULL,
  `filenotes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `asset_uploads` WRITE;
/*!40000 ALTER TABLE `asset_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_uploads` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `serial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `physical` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `warranty_months` int(11) DEFAULT NULL,
  `depreciate` tinyint(1) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `requestable` tinyint(4) NOT NULL DEFAULT '0',
  `rtd_location_id` int(11) DEFAULT NULL,
  `_snipeit_mac_address_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_checkout` datetime DEFAULT NULL,
  `expected_checkin` date DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `assigned_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_audit_date` datetime DEFAULT NULL,
  `next_audit_date` date DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `checkin_counter` int(11) NOT NULL DEFAULT '0',
  `checkout_counter` int(11) NOT NULL DEFAULT '0',
  `requests_counter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_rtd_location_id_index` (`rtd_location_id`),
  KEY `assets_assigned_type_assigned_to_index` (`assigned_type`,`assigned_to`),
  KEY `assets_created_at_index` (`created_at`),
  KEY `assets_deleted_at_status_id_index` (`deleted_at`,`status_id`),
  KEY `assets_deleted_at_model_id_index` (`deleted_at`,`model_id`),
  KEY `assets_deleted_at_assigned_type_assigned_to_index` (`deleted_at`,`assigned_type`,`assigned_to`),
  KEY `assets_deleted_at_supplier_id_index` (`deleted_at`,`supplier_id`),
  KEY `assets_deleted_at_location_id_index` (`deleted_at`,`location_id`),
  KEY `assets_deleted_at_rtd_location_id_index` (`deleted_at`,`rtd_location_id`),
  KEY `assets_deleted_at_asset_tag_index` (`deleted_at`,`asset_tag`),
  KEY `assets_deleted_at_name_index` (`deleted_at`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,'Laptop','DLB-1234234234234234',1,NULL,'2019-01-02',NULL,NULL,1,NULL,NULL,1,'2020-11-25 09:13:04','2020-12-17 10:47:59',1,NULL,2,0,NULL,0,4,0,1,NULL,NULL,'2020-11-25 09:13:04',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0),(2,'Laptop','DB-17',2,'1JGQ042','2018-04-23',NULL,NULL,10,NULL,NULL,2,'2020-12-01 21:14:49','2020-12-01 21:20:30',1,NULL,2,0,NULL,0,5,0,2,NULL,NULL,'2018-04-23 00:00:00',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(3,'Laptop','DB-18',3,'296T042','2018-04-23',NULL,NULL,4,NULL,NULL,2,'2020-12-01 21:16:31','2020-12-09 12:26:36',1,NULL,2,0,NULL,0,5,0,2,NULL,NULL,'2020-11-01 00:00:00',NULL,3,'App\\Models\\User',NULL,NULL,2,2,3,0),(4,'Laptop','DB-25',4,'C02WK52RG8WN','2018-05-31',NULL,NULL,12,NULL,NULL,2,'2020-12-02 08:54:55','2020-12-02 08:54:55',1,NULL,2,0,NULL,0,6,0,2,NULL,NULL,'2020-12-02 08:54:55',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(5,'Laptop','DB-28',5,'YOV77EA#ABD','2018-07-25',NULL,NULL,12,NULL,NULL,2,'2020-12-02 08:56:24','2020-12-02 08:56:24',1,NULL,2,0,NULL,0,6,0,2,NULL,NULL,'2020-12-02 08:56:24',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(6,'Laptop','DB-29',6,'5CD736170N','2018-07-25',NULL,NULL,9,NULL,NULL,2,'2020-12-02 08:57:33','2020-12-02 08:57:33',1,NULL,2,0,NULL,0,6,0,2,NULL,NULL,'2020-12-02 08:57:33',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(7,'Laptop','DB-30',7,'R90MHXXW','2018-07-25',NULL,NULL,8,NULL,NULL,2,'2020-12-02 08:58:49','2020-12-02 08:58:49',1,NULL,2,0,NULL,0,6,0,2,NULL,NULL,'2020-12-02 08:58:49',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(8,'Laptop','DB-31',8,'J1NOCV01H84101F','2018-07-25',NULL,NULL,19,'Früher hat den Laptop Zarko Lalovic und Miroslav Trninic benutzt',NULL,2,'2020-12-02 09:00:47','2020-12-02 09:00:47',1,NULL,2,0,NULL,0,6,0,2,NULL,NULL,'2020-12-02 09:00:47',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(9,'Laptop','DB-33',9,'SC02WQ0DWG8WN','2018-06-29',NULL,NULL,13,NULL,NULL,2,'2020-12-02 09:02:02','2020-12-02 09:02:02',1,NULL,2,0,NULL,0,7,0,2,NULL,NULL,'2020-12-02 09:02:02',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(10,'Laptop','DB-39',10,'8PP54Q2','2018-08-24',NULL,NULL,14,NULL,NULL,2,'2020-12-02 09:03:15','2020-12-02 09:03:15',1,NULL,2,0,NULL,0,6,0,2,NULL,NULL,'2020-12-02 09:03:15',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(11,'Laptop','DB-40',10,'5G164Q2','2018-08-24',NULL,NULL,15,NULL,NULL,2,'2020-12-02 09:04:16','2020-12-02 09:04:16',1,NULL,2,0,NULL,0,6,0,2,NULL,NULL,'2020-12-02 09:04:16',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(12,'Laptop','DB-51',11,'CND8091P3N','2018-09-17',NULL,NULL,2,NULL,NULL,2,'2020-12-02 09:05:21','2020-12-17 10:47:30',1,NULL,2,0,NULL,0,6,0,2,NULL,NULL,'2020-12-02 09:05:21',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(13,'Laptop','DB-52',11,'CND8091NXX','2018-09-17',NULL,NULL,4,NULL,NULL,2,'2020-12-02 09:06:10','2020-12-02 09:06:10',1,NULL,2,0,NULL,0,6,0,2,NULL,NULL,'2020-12-02 09:06:10',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(14,'Laptop','DB-57',12,'20LW0010GE','2018-10-19',NULL,NULL,16,NULL,NULL,2,'2020-12-02 09:07:17','2020-12-02 09:07:17',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,'2020-12-02 09:07:17',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(15,'Laptop','DB-61',13,'3KZ01ES#ABD','2018-11-05',NULL,NULL,NULL,NULL,NULL,2,'2020-12-02 09:08:11','2020-12-02 09:08:11',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(16,'Laptop','DB-159',14,'SC02X99Y3JG5H','2019-01-17',NULL,NULL,20,NULL,NULL,2,'2020-12-02 09:09:14','2020-12-02 09:09:14',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,'2020-12-02 09:09:14',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(17,'Laptop','DB-164',15,'JAN0CV02V060413','2019-02-27',NULL,NULL,17,NULL,NULL,2,'2020-12-02 09:10:07','2020-12-02 09:10:07',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,'2020-12-02 09:10:07',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(18,'Laptop','DB-165',16,'5CD8379MF3','2019-02-28',NULL,NULL,21,NULL,NULL,2,'2020-12-02 09:11:25','2020-12-02 09:13:52',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,'2020-12-02 09:13:52',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(19,'Laptop','DB-186',17,'5CD8379M91','2019-03-13',NULL,NULL,3,'Früher hat ihn Nikola Cupic benutzt',NULL,2,'2020-12-02 09:15:41','2020-12-02 09:15:41',1,NULL,2,0,NULL,0,8,0,NULL,NULL,NULL,'2020-12-02 09:15:41',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(20,'Laptop','DB-187',17,'5CD8379MKL','2019-03-13',NULL,NULL,NULL,'Früher hat ihn Goran Cojanovic benutzt',NULL,2,'2020-12-02 09:17:00','2020-12-02 09:17:00',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(21,'Laptop','DB-245',18,NULL,'2020-03-17',NULL,NULL,7,NULL,NULL,2,'2020-12-02 09:18:11','2020-12-02 09:18:11',1,NULL,2,0,NULL,0,9,0,2,NULL,NULL,'2020-12-02 09:18:11',NULL,3,'App\\Models\\User',NULL,NULL,2,0,1,0),(22,'Stuhl','DB-45',20,NULL,'2018-08-27',379.50,NULL,NULL,NULL,NULL,2,'2020-12-15 13:20:49','2020-12-15 13:21:31',1,NULL,2,0,NULL,0,14,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(23,'Stuhl','DB-46',20,NULL,'2018-08-27',379.50,NULL,NULL,NULL,NULL,2,'2020-12-15 13:22:55','2020-12-15 13:22:55',1,NULL,2,0,NULL,0,14,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(24,'Stuhl','DB-47',20,NULL,'2018-08-27',379.50,NULL,NULL,NULL,NULL,2,'2020-12-15 13:24:57','2020-12-15 13:24:57',1,NULL,2,0,NULL,0,14,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(25,'Tisch','DB-68',21,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:14:41','2020-12-15 15:14:41',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(26,'Tisch','DB-69',21,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:16:04','2020-12-15 15:16:04',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(27,'Tisch','DB-70',21,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:16:50','2020-12-15 15:16:50',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(28,'Tisch','DB-71',21,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:17:09','2020-12-15 15:17:09',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(29,'Stuhl','DB-82',22,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:18:09','2020-12-15 15:19:12',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(30,'Stuhl','DB-83',22,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:18:35','2020-12-15 15:18:35',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(31,'Stuhl','DB-84',22,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:19:46','2020-12-15 15:19:46',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(32,'Stuhl','DB-85',22,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:20:02','2020-12-15 15:20:02',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(33,'Stuhl','DB-86',22,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:20:16','2020-12-15 15:20:16',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(34,'Stuhl','DB-87',22,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:20:27','2020-12-15 15:20:27',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(35,'Stuhl','DB-88',22,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:20:39','2020-12-15 15:20:39',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0),(36,'Stuhl','DB-89',22,NULL,'2018-11-05',58.67,NULL,NULL,NULL,NULL,2,'2020-12-15 15:20:53','2020-12-15 15:20:53',1,NULL,2,0,NULL,0,8,0,2,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,0,0,0);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `eula_text` longtext COLLATE utf8mb4_unicode_ci,
  `use_default_eula` tinyint(1) NOT NULL DEFAULT '0',
  `require_acceptance` tinyint(1) NOT NULL DEFAULT '0',
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'asset',
  `checkin_email` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Misc Software','2020-11-24 17:34:21','2020-11-24 17:34:21',NULL,NULL,NULL,0,0,'license',0,NULL),(2,'Laptop','2020-11-25 09:08:57','2020-11-25 09:08:57',NULL,NULL,NULL,0,0,'asset',0,NULL),(3,'IT Software Tools','2020-11-25 09:28:35','2020-11-25 09:28:35',NULL,NULL,NULL,0,0,'license',0,NULL),(4,'Monitor','2020-11-25 10:48:16','2020-11-25 10:48:16',1,NULL,NULL,0,0,'asset',0,NULL),(5,'Tisch','2020-11-25 10:48:27','2020-11-25 10:48:27',1,NULL,NULL,0,0,'asset',0,NULL),(6,'Stuhl','2020-11-25 10:48:36','2020-11-25 10:48:36',1,NULL,NULL,0,0,'asset',0,NULL),(7,'Drucker','2020-11-25 10:48:44','2020-11-25 10:48:44',1,NULL,NULL,0,0,'asset',0,NULL),(8,'Lazy bag','2020-12-15 15:08:18','2020-12-15 15:08:18',NULL,NULL,NULL,0,0,'asset',0,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_acceptances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_acceptances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `checkoutable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkoutable_id` bigint(20) unsigned NOT NULL,
  `assigned_to_id` int(10) unsigned NOT NULL,
  `signature_filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `declined_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_acceptances_checkoutable_type_checkoutable_id_index` (`checkoutable_type`,`checkoutable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `checkout_acceptances` WRITE;
/*!40000 ALTER TABLE `checkout_acceptances` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_acceptances` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `requestable_id` int(11) NOT NULL,
  `requestable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_requests_user_id_requestable_id_requestable_type` (`user_id`,`requestable_id`,`requestable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `checkout_requests` WRITE;
/*!40000 ALTER TABLE `checkout_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_requests` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'DevLabs Technologies GmbH','2020-11-24 17:41:29','2020-11-24 17:41:29',NULL),(2,'DevLabs Technologies d.o.o.','2020-11-24 17:41:45','2020-11-24 17:41:45',NULL),(3,'DevLabs d.o.o.','2020-11-24 17:41:57','2020-11-24 17:41:57',NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `serial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `components_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `assigned_qty` int(11) DEFAULT '1',
  `component_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `components_assets` WRITE;
/*!40000 ALTER TABLE `components_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_assets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `requestable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `item_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `consumables` WRITE;
/*!40000 ALTER TABLE `consumables` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumables` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `consumables_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumables_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `consumable_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `consumables_users` WRITE;
/*!40000 ALTER TABLE `consumables_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumables_users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `custom_field_custom_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_custom_fieldset` (
  `custom_field_id` int(11) NOT NULL,
  `custom_fieldset_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `custom_field_custom_fieldset` WRITE;
/*!40000 ALTER TABLE `custom_field_custom_fieldset` DISABLE KEYS */;
INSERT INTO `custom_field_custom_fieldset` VALUES (1,1,1,0);
/*!40000 ALTER TABLE `custom_field_custom_fieldset` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `field_values` text COLLATE utf8mb4_unicode_ci,
  `field_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `db_column` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help_text` text COLLATE utf8mb4_unicode_ci,
  `show_in_email` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (1,'MAC Address','regex:/^[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}$/','text',NULL,'2020-11-24 17:34:20',NULL,NULL,0,'_snipeit_mac_address_1',NULL,0);
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `custom_fieldsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fieldsets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `custom_fieldsets` WRITE;
/*!40000 ALTER TABLE `custom_fieldsets` DISABLE KEYS */;
INSERT INTO `custom_fieldsets` VALUES (1,'Asset with MAC Address',NULL,NULL,NULL);
/*!40000 ALTER TABLE `custom_fieldsets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Service Desk',1,3,NULL,4,NULL,'2020-11-25 10:40:44','2020-11-25 10:40:44',NULL,NULL),(2,'Project Team',1,3,2,3,NULL,'2020-11-25 10:43:04','2020-11-25 10:43:04',NULL,NULL),(3,'Management',1,3,2,1,NULL,'2020-11-25 10:43:26','2020-11-25 10:43:26',NULL,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `depreciations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depreciations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `months` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `depreciations` WRITE;
/*!40000 ALTER TABLE `depreciations` DISABLE KEYS */;
INSERT INTO `depreciations` VALUES (1,'IT Systems (three years)',36,'2020-11-25 09:10:48','2020-11-25 09:10:48',1);
/*!40000 ALTER TABLE `depreciations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filesize` int(11) NOT NULL,
  `import_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `header_row` text COLLATE utf8mb4_unicode_ci,
  `first_row` text COLLATE utf8mb4_unicode_ci,
  `field_map` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kits` WRITE;
/*!40000 ALTER TABLE `kits` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `kits_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits_accessories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kits_accessories` WRITE;
/*!40000 ALTER TABLE `kits_accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_accessories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `kits_consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits_consumables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int(11) DEFAULT NULL,
  `consumable_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kits_consumables` WRITE;
/*!40000 ALTER TABLE `kits_consumables` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_consumables` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `kits_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits_licenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int(11) DEFAULT NULL,
  `license_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kits_licenses` WRITE;
/*!40000 ALTER TABLE `kits_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_licenses` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `kits_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kits_models` WRITE;
/*!40000 ALTER TABLE `kits_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_models` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `license_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_seats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `license_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `license_seats` WRITE;
/*!40000 ALTER TABLE `license_seats` DISABLE KEYS */;
INSERT INTO `license_seats` VALUES (1,1,1,NULL,1,'2020-11-25 09:30:23','2020-11-25 10:54:02',NULL,NULL),(2,2,19,NULL,2,'2020-12-11 14:27:53','2020-12-11 14:32:35',NULL,8),(3,3,17,NULL,2,'2020-12-11 14:35:31','2020-12-11 14:36:00',NULL,17),(4,4,12,NULL,2,'2020-12-11 14:39:36','2020-12-11 14:39:58',NULL,4),(5,5,14,NULL,2,'2020-12-11 14:41:33','2020-12-11 14:41:52',NULL,NULL),(6,6,15,NULL,2,'2020-12-11 14:42:53','2020-12-11 14:43:15',NULL,NULL),(7,7,9,NULL,2,'2020-12-11 14:44:16','2020-12-11 14:44:34',NULL,6),(8,8,1,NULL,1,'2020-12-14 12:55:16','2020-12-14 12:56:27',NULL,NULL),(9,9,1,NULL,1,'2020-12-14 12:57:57','2020-12-14 12:58:07',NULL,NULL);
/*!40000 ALTER TABLE `license_seats` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` text COLLATE utf8mb4_unicode_ci,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seats` int(11) NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `depreciation_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `license_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depreciate` tinyint(1) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `purchase_order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `maintained` tinyint(1) DEFAULT NULL,
  `reassignable` tinyint(1) NOT NULL DEFAULT '1',
  `company_id` int(10) unsigned DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (1,'MobaXterm - TEST',NULL,NULL,50.00,NULL,1,NULL,1,NULL,'2020-11-25 09:30:23','2020-12-11 17:40:54',NULL,NULL,NULL,NULL,3,NULL,NULL,'2020-12-12',0,1,1,2,3),(2,'Windows 10 Pro',NULL,'2020-01-24',12607.00,'Bestellnummer 8569668175',1,NULL,2,NULL,'2020-12-11 14:27:53','2020-12-11 14:31:57',NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,0,1,3,NULL,1),(3,'Microsoft 10 Pro',NULL,'2020-04-01',12703.00,'Bestellnummer 2266124222',1,NULL,2,NULL,'2020-12-11 14:35:31','2020-12-11 14:35:31',NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,1,1,3,NULL,1),(4,'Parallels Desktop for Mac Pro Edition',NULL,'2020-06-21',9999.00,'Rechnungsnummer AKD-73679746582',1,NULL,2,NULL,'2020-12-11 14:39:36','2020-12-11 14:39:36',NULL,NULL,NULL,NULL,12,'2021-06-21',NULL,NULL,0,1,3,NULL,1),(5,'PhpStorm',NULL,'2020-09-21',53.00,'R4328154',1,NULL,2,NULL,'2020-12-11 14:41:33','2020-12-11 14:41:33',NULL,NULL,NULL,NULL,10,'2021-09-21',NULL,NULL,0,1,3,NULL,3),(6,'PhpStorm',NULL,'2020-09-30',53.00,'R4363912',1,NULL,2,NULL,'2020-12-11 14:42:53','2020-12-11 14:42:53',NULL,NULL,NULL,NULL,10,'2021-09-30',NULL,NULL,0,1,3,NULL,3),(7,'IntelliJ IDEA Ultimate',NULL,'2020-12-11',119.00,'R4668666',1,'https://account.jetbrains.com/login\r\nuser: abosancic\r\npassword: B7B5E!y!sgZyF9!',2,NULL,'2020-12-11 14:44:16','2020-12-14 12:52:53',NULL,NULL,NULL,NULL,10,'2021-12-11',NULL,NULL,0,1,3,NULL,3),(8,'Testlizenz DEMO',NULL,'2020-12-01',NULL,NULL,1,NULL,1,NULL,'2020-12-14 12:55:16','2020-12-14 12:55:16',NULL,NULL,NULL,NULL,NULL,'2020-12-15',NULL,NULL,0,1,NULL,2,3),(9,'Testlizenz DEMO2',NULL,'2020-12-01',NULL,NULL,1,NULL,1,NULL,'2020-12-14 12:57:57','2020-12-14 12:57:57',NULL,NULL,NULL,NULL,NULL,'2020-12-14',NULL,NULL,0,1,NULL,2,1);
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_ou` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'DevLabs Austria Standort 7iD','Graz',NULL,'AT','2020-11-25 08:57:02','2020-12-09 12:16:45',1,'Straßganger Str. 291',NULL,'8053',NULL,3,NULL,NULL,1,NULL),(2,'DevLabs Bosnia','Banja Luka',NULL,'BA','2020-11-25 08:57:52','2020-12-09 12:15:09',1,NULL,NULL,'78000',NULL,NULL,'BAM',NULL,3,NULL),(3,'DevLabs Austria HQ','Graz',NULL,'AT','2020-12-09 12:16:09','2020-12-09 12:16:54',1,'Am Eisernen Tor 3',NULL,'8010',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `successful` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (1,'herwart','213.240.79.52','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36',1,'2020-11-24 17:36:20',NULL),(2,'jelena','31.223.130.205','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36',1,'2020-11-24 17:42:19',NULL),(3,'herwart','213.240.79.52','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36',1,'2020-11-24 17:48:41',NULL),(4,'herwart','213.240.79.52','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36',1,'2020-11-24 17:50:35',NULL),(5,'herwart','213.240.79.52','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36',1,'2020-11-24 17:51:54',NULL),(6,'jelena','31.223.130.205','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36',1,'2020-11-24 18:06:32',NULL),(7,'herwart','213.240.76.3','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36',1,'2020-12-04 13:31:59',NULL),(8,'jelena','185.65.122.122','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-09 12:06:37',NULL),(9,'herwart','213.240.73.73','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36',1,'2020-12-09 12:09:01',NULL),(10,'herwart','193.83.49.41','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-10 18:03:39',NULL),(11,'herwart','193.83.49.41','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-10 18:07:52',NULL),(12,'herwart','172.22.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-11 07:49:48',NULL),(13,'herwart','193.83.49.41','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-11 07:52:02',NULL),(14,'herwart','193.83.49.41','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-11 08:47:05',NULL),(15,'herwart','193.83.49.41','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-11 08:57:15',NULL),(16,'herwart','193.83.49.41','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-11 09:02:08',NULL),(17,'jelena','31.223.130.72','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-11 10:43:49',NULL),(18,'herwart','193.83.49.41','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-14 11:49:56',NULL),(19,'jelena','31.223.130.78','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-14 12:48:14',NULL),(20,'herwart','193.83.49.41','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-14 12:57:03',NULL),(21,'herwart','172.24.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-16 12:10:03',NULL),(22,'herwart','172.24.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-16 12:12:12',NULL),(23,'herwart','172.25.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-16 12:29:29',NULL),(24,'herwart','172.26.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-16 12:34:00',NULL),(25,'jelena','172.26.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',0,'2020-12-17 09:59:43',NULL),(26,'jelena','172.26.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',1,'2020-12-17 10:01:08',NULL);
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Lenovo','2020-11-25 08:56:06','2020-11-25 08:56:06',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Mobatek','2020-11-25 09:29:37','2020-11-25 09:29:37',1,NULL,'https://mobaxterm.mobatek.net/',NULL,NULL,NULL,NULL),(3,'DELL','2020-12-01 20:54:16','2020-12-01 20:54:16',2,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Apple','2020-12-01 20:54:45','2020-12-01 20:54:45',2,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Hewlett Packard','2020-12-01 20:55:16','2020-12-01 20:55:16',2,NULL,NULL,NULL,NULL,NULL,NULL),(6,'ASUS','2020-12-01 20:55:35','2020-12-01 20:55:35',2,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Ikea','2020-12-15 13:14:34','2020-12-15 13:14:34',2,NULL,'https://www.ikea.com/hr/hr/',NULL,NULL,NULL,NULL),(8,'Ikea & Elgrad Banja Luka','2020-12-15 13:15:19','2020-12-15 13:15:19',2,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Kabinet Plus','2020-12-15 13:18:36','2020-12-15 13:18:36',2,NULL,NULL,NULL,NULL,NULL,NULL),(10,'unbekannt','2020-12-15 14:59:44','2020-12-15 14:59:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2012_12_06_225921_migration_cartalyst_sentry_install_users',1),(2,'2012_12_06_225929_migration_cartalyst_sentry_install_groups',1),(3,'2012_12_06_225945_migration_cartalyst_sentry_install_users_groups_pivot',1),(4,'2012_12_06_225988_migration_cartalyst_sentry_install_throttle',1),(5,'2013_03_23_193214_update_users_table',1),(6,'2013_11_13_075318_create_models_table',1),(7,'2013_11_13_075335_create_categories_table',1),(8,'2013_11_13_075347_create_manufacturers_table',1),(9,'2013_11_15_015858_add_user_id_to_categories',1),(10,'2013_11_15_112701_add_user_id_to_manufacturers',1),(11,'2013_11_15_190327_create_assets_table',1),(12,'2013_11_15_190357_create_licenses_table',1),(13,'2013_11_15_201848_add_license_name_to_licenses',1),(14,'2013_11_16_040323_create_depreciations_table',1),(15,'2013_11_16_042851_add_depreciation_id_to_models',1),(16,'2013_11_16_084923_add_user_id_to_models',1),(17,'2013_11_16_103258_create_locations_table',1),(18,'2013_11_16_103336_add_location_id_to_assets',1),(19,'2013_11_16_103407_add_checkedout_to_to_assets',1),(20,'2013_11_16_103425_create_history_table',1),(21,'2013_11_17_054359_drop_licenses_table',1),(22,'2013_11_17_054526_add_physical_to_assets',1),(23,'2013_11_17_055126_create_settings_table',1),(24,'2013_11_17_062634_add_license_to_assets',1),(25,'2013_11_18_134332_add_contacts_to_users',1),(26,'2013_11_18_142847_add_info_to_locations',1),(27,'2013_11_18_152942_remove_location_id_from_asset',1),(28,'2013_11_18_164423_set_nullvalues_for_user',1),(29,'2013_11_19_013337_create_asset_logs_table',1),(30,'2013_11_19_061409_edit_added_on_asset_logs_table',1),(31,'2013_11_19_062250_edit_location_id_asset_logs_table',1),(32,'2013_11_20_055822_add_soft_delete_on_assets',1),(33,'2013_11_20_121404_add_soft_delete_on_locations',1),(34,'2013_11_20_123137_add_soft_delete_on_manufacturers',1),(35,'2013_11_20_123725_add_soft_delete_on_categories',1),(36,'2013_11_20_130248_create_status_labels',1),(37,'2013_11_20_130830_add_status_id_on_assets_table',1),(38,'2013_11_20_131544_add_status_type_on_status_labels',1),(39,'2013_11_20_134103_add_archived_to_assets',1),(40,'2013_11_21_002321_add_uploads_table',1),(41,'2013_11_21_024531_remove_deployable_boolean_from_status_labels',1),(42,'2013_11_22_075308_add_option_label_to_settings_table',1),(43,'2013_11_22_213400_edits_to_settings_table',1),(44,'2013_11_25_013244_create_licenses_table',1),(45,'2013_11_25_031458_create_license_seats_table',1),(46,'2013_11_25_032022_add_type_to_actionlog_table',1),(47,'2013_11_25_033008_delete_bad_licenses_table',1),(48,'2013_11_25_033131_create_new_licenses_table',1),(49,'2013_11_25_033534_add_licensed_to_licenses_table',1),(50,'2013_11_25_101308_add_warrantee_to_assets_table',1),(51,'2013_11_25_104343_alter_warranty_column_on_assets',1),(52,'2013_11_25_150450_drop_parent_from_categories',1),(53,'2013_11_25_151920_add_depreciate_to_assets',1),(54,'2013_11_25_152903_add_depreciate_to_licenses_table',1),(55,'2013_11_26_211820_drop_license_from_assets_table',1),(56,'2013_11_27_062510_add_note_to_asset_logs_table',1),(57,'2013_12_01_113426_add_filename_to_asset_log',1),(58,'2013_12_06_094618_add_nullable_to_licenses_table',1),(59,'2013_12_10_084038_add_eol_on_models_table',1),(60,'2013_12_12_055218_add_manager_to_users_table',1),(61,'2014_01_28_031200_add_qr_code_to_settings_table',1),(62,'2014_02_13_183016_add_qr_text_to_settings_table',1),(63,'2014_05_24_093839_alter_default_license_depreciation_id',1),(64,'2014_05_27_231658_alter_default_values_licenses',1),(65,'2014_06_19_191508_add_asset_name_to_settings',1),(66,'2014_06_20_004847_make_asset_log_checkedout_to_nullable',1),(67,'2014_06_20_005050_make_asset_log_purchasedate_to_nullable',1),(68,'2014_06_24_003011_add_suppliers',1),(69,'2014_06_24_010742_add_supplier_id_to_asset',1),(70,'2014_06_24_012839_add_zip_to_supplier',1),(71,'2014_06_24_033908_add_url_to_supplier',1),(72,'2014_07_08_054116_add_employee_id_to_users',1),(73,'2014_07_09_134316_add_requestable_to_assets',1),(74,'2014_07_17_085822_add_asset_to_software',1),(75,'2014_07_17_161625_make_asset_id_in_logs_nullable',1),(76,'2014_08_12_053504_alpha_0_4_2_release',1),(77,'2014_08_17_083523_make_location_id_nullable',1),(78,'2014_10_16_200626_add_rtd_location_to_assets',1),(79,'2014_10_24_000417_alter_supplier_state_to_32',1),(80,'2014_10_24_015641_add_display_checkout_date',1),(81,'2014_10_28_222654_add_avatar_field_to_users_table',1),(82,'2014_10_29_045924_add_image_field_to_models_table',1),(83,'2014_11_01_214955_add_eol_display_to_settings',1),(84,'2014_11_04_231416_update_group_field_for_reporting',1),(85,'2014_11_05_212408_add_fields_to_licenses',1),(86,'2014_11_07_021042_add_image_to_supplier',1),(87,'2014_11_20_203007_add_username_to_user',1),(88,'2014_11_20_223947_add_auto_to_settings',1),(89,'2014_11_20_224421_add_prefix_to_settings',1),(90,'2014_11_21_104401_change_licence_type',1),(91,'2014_12_09_082500_add_fields_maintained_term_to_licenses',1),(92,'2015_02_04_155757_increase_user_field_lengths',1),(93,'2015_02_07_013537_add_soft_deleted_to_log',1),(94,'2015_02_10_040958_fix_bad_assigned_to_ids',1),(95,'2015_02_10_053310_migrate_data_to_new_statuses',1),(96,'2015_02_11_044104_migrate_make_license_assigned_null',1),(97,'2015_02_11_104406_migrate_create_requests_table',1),(98,'2015_02_12_001312_add_mac_address_to_asset',1),(99,'2015_02_12_024100_change_license_notes_type',1),(100,'2015_02_17_231020_add_localonly_to_settings',1),(101,'2015_02_19_222322_add_logo_and_colors_to_settings',1),(102,'2015_02_24_072043_add_alerts_to_settings',1),(103,'2015_02_25_022931_add_eula_fields',1),(104,'2015_02_25_204513_add_accessories_table',1),(105,'2015_02_26_091228_add_accessories_user_table',1),(106,'2015_02_26_115128_add_deleted_at_models',1),(107,'2015_02_26_233005_add_category_type',1),(108,'2015_03_01_231912_update_accepted_at_to_acceptance_id',1),(109,'2015_03_05_011929_add_qr_type_to_settings',1),(110,'2015_03_18_055327_add_note_to_user',1),(111,'2015_04_29_234704_add_slack_to_settings',1),(112,'2015_05_04_085151_add_parent_id_to_locations_table',1),(113,'2015_05_22_124421_add_reassignable_to_licenses',1),(114,'2015_06_10_003314_fix_default_for_user_notes',1),(115,'2015_06_10_003554_create_consumables',1),(116,'2015_06_15_183253_move_email_to_username',1),(117,'2015_06_23_070346_make_email_nullable',1),(118,'2015_06_26_213716_create_asset_maintenances_table',1),(119,'2015_07_04_212443_create_custom_fields_table',1),(120,'2015_07_09_014359_add_currency_to_settings_and_locations',1),(121,'2015_07_21_122022_add_expected_checkin_date_to_asset_logs',1),(122,'2015_07_24_093845_add_checkin_email_to_category_table',1),(123,'2015_07_25_055415_remove_email_unique_constraint',1),(124,'2015_07_29_230054_add_thread_id_to_asset_logs_table',1),(125,'2015_07_31_015430_add_accepted_to_assets',1),(126,'2015_09_09_195301_add_custom_css_to_settings',1),(127,'2015_09_21_235926_create_custom_field_custom_fieldset',1),(128,'2015_09_22_000104_create_custom_fieldsets',1),(129,'2015_09_22_003321_add_fieldset_id_to_assets',1),(130,'2015_09_22_003413_migrate_mac_address',1),(131,'2015_09_28_003314_fix_default_purchase_order',1),(132,'2015_10_01_024551_add_accessory_consumable_price_info',1),(133,'2015_10_12_192706_add_brand_to_settings',1),(134,'2015_10_22_003314_fix_defaults_accessories',1),(135,'2015_10_23_182625_add_checkout_time_and_expected_checkout_date_to_assets',1),(136,'2015_11_05_061015_create_companies_table',1),(137,'2015_11_05_061115_add_company_id_to_consumables_table',1),(138,'2015_11_05_183749_image',1),(139,'2015_11_06_092038_add_company_id_to_accessories_table',1),(140,'2015_11_06_100045_add_company_id_to_users_table',1),(141,'2015_11_06_134742_add_company_id_to_licenses_table',1),(142,'2015_11_08_035832_add_company_id_to_assets_table',1),(143,'2015_11_08_222305_add_ldap_fields_to_settings',1),(144,'2015_11_15_151803_add_full_multiple_companies_support_to_settings_table',1),(145,'2015_11_26_195528_import_ldap_settings',1),(146,'2015_11_30_191504_remove_fk_company_id',1),(147,'2015_12_21_193006_add_ldap_server_cert_ignore_to_settings_table',1),(148,'2015_12_30_233509_add_timestamp_and_userId_to_custom_fields',1),(149,'2015_12_30_233658_add_timestamp_and_userId_to_custom_fieldsets',1),(150,'2016_01_28_041048_add_notes_to_models',1),(151,'2016_02_19_070119_add_remember_token_to_users_table',1),(152,'2016_02_19_073625_create_password_resets_table',1),(153,'2016_03_02_193043_add_ldap_flag_to_users',1),(154,'2016_03_02_220517_update_ldap_filter_to_longer_field',1),(155,'2016_03_08_225351_create_components_table',1),(156,'2016_03_09_024038_add_min_stock_to_tables',1),(157,'2016_03_10_133849_add_locale_to_users',1),(158,'2016_03_10_135519_add_locale_to_settings',1),(159,'2016_03_11_185621_add_label_settings_to_settings',1),(160,'2016_03_22_125911_fix_custom_fields_regexes',1),(161,'2016_04_28_141554_add_show_to_users',1),(162,'2016_05_16_164733_add_model_mfg_to_consumable',1),(163,'2016_05_19_180351_add_alt_barcode_settings',1),(164,'2016_05_19_191146_add_alter_interval',1),(165,'2016_05_19_192226_add_inventory_threshold',1),(166,'2016_05_20_024859_remove_option_keys_from_settings_table',1),(167,'2016_05_20_143758_remove_option_value_from_settings_table',1),(168,'2016_06_01_000001_create_oauth_auth_codes_table',1),(169,'2016_06_01_000002_create_oauth_access_tokens_table',1),(170,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(171,'2016_06_01_000004_create_oauth_clients_table',1),(172,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(173,'2016_06_01_140218_add_email_domain_and_format_to_settings',1),(174,'2016_06_22_160725_add_user_id_to_maintenances',1),(175,'2016_07_13_150015_add_is_ad_to_settings',1),(176,'2016_07_14_153609_add_ad_domain_to_settings',1),(177,'2016_07_22_003348_fix_custom_fields_regex_stuff',1),(178,'2016_07_22_054850_one_more_mac_addr_fix',1),(179,'2016_07_22_143045_add_port_to_ldap_settings',1),(180,'2016_07_22_153432_add_tls_to_ldap_settings',1),(181,'2016_07_27_211034_add_zerofill_to_settings',1),(182,'2016_08_02_124944_add_color_to_statuslabel',1),(183,'2016_08_04_134500_add_disallow_ldap_pw_sync_to_settings',1),(184,'2016_08_09_002225_add_manufacturer_to_licenses',1),(185,'2016_08_12_121613_add_manufacturer_to_accessories_table',1),(186,'2016_08_23_143353_add_new_fields_to_custom_fields',1),(187,'2016_08_23_145619_add_show_in_nav_to_status_labels',1),(188,'2016_08_30_084634_make_purchase_cost_nullable',1),(189,'2016_09_01_141051_add_requestable_to_asset_model',1),(190,'2016_09_02_001448_create_checkout_requests_table',1),(191,'2016_09_04_180400_create_actionlog_table',1),(192,'2016_09_04_182149_migrate_asset_log_to_action_log',1),(193,'2016_09_19_235935_fix_fieldtype_for_target_type',1),(194,'2016_09_23_140722_fix_modelno_in_consumables_to_string',1),(195,'2016_09_28_231359_add_company_to_logs',1),(196,'2016_10_14_130709_fix_order_number_to_varchar',1),(197,'2016_10_16_015024_rename_modelno_to_model_number',1),(198,'2016_10_16_015211_rename_consumable_modelno_to_model_number',1),(199,'2016_10_16_143235_rename_model_note_to_notes',1),(200,'2016_10_16_165052_rename_component_total_qty_to_qty',1),(201,'2016_10_19_145520_fix_order_number_in_components_to_string',1),(202,'2016_10_27_151715_add_serial_to_components',1),(203,'2016_10_27_213251_increase_serial_field_capacity',1),(204,'2016_10_29_002724_enable_2fa_fields',1),(205,'2016_10_29_082408_add_signature_to_acceptance',1),(206,'2016_11_01_030818_fix_forgotten_filename_in_action_logs',1),(207,'2016_11_13_020954_rename_component_serial_number_to_serial',1),(208,'2016_11_16_172119_increase_purchase_cost_size',1),(209,'2016_11_17_161317_longer_state_field_in_location',1),(210,'2016_11_17_193706_add_model_number_to_accessories',1),(211,'2016_11_24_160405_add_missing_target_type_to_logs_table',1),(212,'2016_12_07_173720_increase_size_of_state_in_suppliers',1),(213,'2016_12_19_004212_adjust_locale_length_to_10',1),(214,'2016_12_19_133936_extend_phone_lengths_in_supplier_and_elsewhere',1),(215,'2016_12_27_212631_make_asset_assigned_to_polymorphic',1),(216,'2017_01_09_040429_create_locations_ldap_query_field',1),(217,'2017_01_14_002418_create_imports_table',1),(218,'2017_01_25_063357_fix_utf8_custom_field_column_names',1),(219,'2017_03_03_154632_add_time_date_display_to_settings',1),(220,'2017_03_10_210807_add_fields_to_manufacturer',1),(221,'2017_05_08_195520_increase_size_of_field_values_in_custom_fields',1),(222,'2017_05_22_204422_create_departments',1),(223,'2017_05_22_233509_add_manager_to_locations_table',1),(224,'2017_06_14_122059_add_next_autoincrement_to_settings',1),(225,'2017_06_18_151753_add_header_and_first_row_to_importer_table',1),(226,'2017_07_07_191533_add_login_text',1),(227,'2017_07_25_130710_add_thumbsize_to_settings',1),(228,'2017_08_03_160105_set_asset_archived_to_zero_default',1),(229,'2017_08_22_180636_add_secure_password_options',1),(230,'2017_08_25_074822_add_auditing_tables',1),(231,'2017_08_25_101435_add_auditing_to_settings',1),(232,'2017_09_18_225619_fix_assigned_type_not_being_nulled',1),(233,'2017_10_03_015503_drop_foreign_keys',1),(234,'2017_10_10_123504_allow_nullable_depreciation_id_in_models',1),(235,'2017_10_17_133709_add_display_url_to_settings',1),(236,'2017_10_19_120002_add_custom_forgot_password_url',1),(237,'2017_10_19_130406_add_image_and_supplier_to_accessories',1),(238,'2017_10_20_234129_add_location_indices_to_assets',1),(239,'2017_10_25_202930_add_images_uploads_to_locations_manufacturers_etc',1),(240,'2017_10_27_180947_denorm_asset_locations',1),(241,'2017_10_27_192423_migrate_denormed_asset_locations',1),(242,'2017_10_30_182938_add_address_to_user',1),(243,'2017_11_08_025918_add_alert_menu_setting',1),(244,'2017_11_08_123942_labels_display_company_name',1),(245,'2017_12_12_010457_normalize_asset_last_audit_date',1),(246,'2017_12_12_033618_add_actionlog_meta',1),(247,'2017_12_26_170856_re_normalize_last_audit',1),(248,'2018_01_17_184354_add_archived_in_list_setting',1),(249,'2018_01_19_203121_add_dashboard_message_to_settings',1),(250,'2018_01_24_062633_add_footer_settings_to_settings',1),(251,'2018_01_24_093426_add_modellist_preferenc',1),(252,'2018_02_22_160436_add_remote_user_settings',1),(253,'2018_03_03_011032_add_theme_to_settings',1),(254,'2018_03_06_054937_add_default_flag_on_statuslabels',1),(255,'2018_03_23_212048_add_display_in_email_to_custom_fields',1),(256,'2018_03_24_030738_add_show_images_in_email_setting',1),(257,'2018_03_24_050108_add_cc_alerts',1),(258,'2018_03_29_053618_add_canceled_at_and_fulfilled_at_in_requests',1),(259,'2018_03_29_070121_add_drop_unique_requests',1),(260,'2018_03_29_070511_add_new_index_requestable',1),(261,'2018_04_02_150700_labels_display_model_name',1),(262,'2018_04_16_133902_create_custom_field_default_values_table',1),(263,'2018_05_04_073223_add_category_to_licenses',1),(264,'2018_05_04_075235_add_update_license_category',1),(265,'2018_05_08_031515_add_gdpr_privacy_footer',1),(266,'2018_05_14_215229_add_indexes',1),(267,'2018_05_14_223646_add_indexes_to_assets',1),(268,'2018_05_14_233638_denorm_counters_on_assets',1),(269,'2018_05_16_153409_add_first_counter_totals_to_assets',1),(270,'2018_06_21_134622_add_version_footer',1),(271,'2018_07_05_215440_add_unique_serial_option_to_settings',1),(272,'2018_07_17_005911_create_login_attempts_table',1),(273,'2018_07_24_154348_add_logo_to_print_assets',1),(274,'2018_07_28_023826_create_checkout_acceptances_table',1),(275,'2018_08_20_204842_add_depreciation_option_to_settings',1),(276,'2018_09_10_082212_create_checkout_acceptances_for_unaccepted_assets',1),(277,'2018_10_18_191228_add_kits_licenses_table',1),(278,'2018_10_19_153910_add_kits_table',1),(279,'2018_10_19_154013_add_kits_models_table',1),(280,'2018_12_05_211936_add_favicon_to_settings',1),(281,'2018_12_05_212119_add_email_logo_to_settings',1),(282,'2019_02_07_185953_add_kits_consumables_table',1),(283,'2019_02_07_190030_add_kits_accessories_table',1),(284,'2019_02_12_182750_add_actiondate_to_actionlog',1),(285,'2019_02_14_154310_change_auto_increment_prefix_to_nullable',1),(286,'2019_02_16_143518_auto_increment_back_to_string',1),(287,'2019_02_17_205048_add_label_logo_to_settings',1),(288,'2019_02_20_234421_make_serial_nullable',1),(289,'2019_02_21_224703_make_fields_nullable_for_integrity',1),(290,'2019_06_12_184327_rename_groups_table',1),(291,'2019_07_23_140906_add_show_assigned_assets_to_settings',1),(292,'2019_08_20_084049_add_custom_remote_user_header',1),(293,'2019_12_04_223111_passport_upgrade',1),(294,'2020_02_04_172100_add_ad_append_domain_settings',1),(295,'2020_04_29_222305_add_saml_fields_to_settings',1),(296,'2020_10_22_233743_move_accessory_checkout_note_to_join_table',1),(297,'2020_10_23_161736_fix_zero_values_for_locations',1),(298,'2020_11_18_214827_widen_license_serial_field',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `depreciation_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `eol` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_mac_address` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fieldset_id` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `requestable` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'YOGA C930-13IKB',NULL,1,2,'2020-11-25 09:10:07','2020-11-25 10:50:03',1,1,0,NULL,0,NULL,NULL,'Laptop für Herwart',0),(2,'Inspiron 15 Firestar 7577',NULL,3,2,'2020-12-01 20:58:58','2020-12-01 20:58:58',1,2,0,NULL,0,NULL,NULL,NULL,0),(3,'Inspiron 15 Firestar 5570',NULL,3,2,'2020-12-01 20:59:49','2020-12-01 20:59:49',1,2,0,NULL,0,NULL,NULL,NULL,0),(4,'MBP 15 retina core i7',NULL,4,2,'2020-12-01 21:00:16','2020-12-01 21:00:16',1,2,0,NULL,0,NULL,NULL,NULL,0),(5,'Gaming-Notebook',NULL,5,2,'2020-12-01 21:01:40','2020-12-01 21:01:40',1,2,0,NULL,0,NULL,NULL,NULL,0),(6,'Probook 470-G5',NULL,5,2,'2020-12-01 21:02:11','2020-12-01 21:02:11',1,2,0,NULL,0,NULL,NULL,NULL,0),(7,'700-17ISK Gaming-Notebook',NULL,1,2,'2020-12-01 21:02:34','2020-12-01 21:02:34',1,2,0,NULL,0,NULL,NULL,NULL,0),(8,'N580VD-DM139T I7-7700H',NULL,6,2,'2020-12-01 21:03:04','2020-12-01 21:03:04',1,2,0,NULL,0,NULL,NULL,NULL,0),(9,'MacBook Pro mit Retina Display 2.2 GHz i7 - 16GB/256GB/15',NULL,4,2,'2020-12-01 21:03:27','2020-12-01 21:03:27',1,2,0,NULL,0,NULL,NULL,NULL,0),(10,'Lattitude 5590 (PJCD0)',NULL,3,2,'2020-12-01 21:03:45','2020-12-01 21:03:45',1,2,0,NULL,0,NULL,NULL,NULL,0),(11,'HP 250 G6 SP 2UB96ES Notebook i5-7200U15',NULL,5,2,'2020-12-01 21:04:11','2020-12-01 21:04:11',1,2,0,NULL,0,NULL,NULL,NULL,0),(12,'SBO TP L580 I7-8550U 16GB',NULL,1,2,'2020-12-01 21:04:36','2020-12-01 21:04:36',1,2,0,NULL,0,NULL,NULL,NULL,0),(13,'HP ProBook 450 G5 - Core i7 8550U / 1.8',NULL,5,2,'2020-12-01 21:05:16','2020-12-01 21:05:16',1,2,0,NULL,0,NULL,NULL,NULL,0),(14,'MacBook Pro Touch Bar 2,2GHz 6-Core i7',NULL,4,2,'2020-12-01 21:05:34','2020-12-01 21:05:34',1,2,0,NULL,0,NULL,NULL,NULL,0),(15,'N580GD-E4382T I7-8750 H 1',NULL,6,2,'2020-12-01 21:06:20','2020-12-01 21:06:20',1,2,0,NULL,0,NULL,NULL,NULL,0),(16,'HP ProBook 450 G5 4QW89EA 15,6 FHD IPS i7 8550U Quad-Core ',NULL,5,2,'2020-12-01 21:07:29','2020-12-01 21:07:29',1,2,0,NULL,0,NULL,NULL,NULL,0),(17,'HP Probook 450 G5 39,6 cm Intel core i7',NULL,5,2,'2020-12-01 21:07:53','2020-12-01 21:07:53',1,2,0,NULL,0,NULL,NULL,NULL,0),(18,'Elitebook 850 G1 i7 4600u',NULL,5,2,'2020-12-01 21:08:14','2020-12-01 21:08:14',1,2,0,NULL,0,NULL,NULL,NULL,0),(19,'Markus','702.611.50',7,6,'2020-12-15 13:16:42','2020-12-17 11:11:37',NULL,NULL,0,'assetmodel-image-lsLovM6Kb1.webp',0,NULL,NULL,NULL,0),(20,'Daphne',NULL,9,6,'2020-12-15 13:19:14','2020-12-15 13:19:14',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(21,'Table square',NULL,10,5,'2020-12-15 14:59:54','2020-12-15 14:59:54',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(22,'chair black',NULL,10,6,'2020-12-15 15:00:17','2020-12-15 15:00:17',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(23,'Ikea office table three-part, brown',NULL,7,5,'2020-12-15 15:00:52','2020-12-15 15:00:52',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(24,'Ikea office table small, brown',NULL,7,5,'2020-12-15 15:01:24','2020-12-15 15:01:24',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(25,'Ikea office table, brown',NULL,7,5,'2020-12-15 15:01:52','2020-12-15 15:01:52',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(26,'office table Hali big, gray',NULL,10,5,'2020-12-15 15:03:19','2020-12-15 15:03:19',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(27,'side table Hali, small, gray',NULL,10,5,'2020-12-15 15:03:45','2020-12-15 15:03:45',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(28,'office table brown',NULL,10,5,'2020-12-15 15:04:45','2020-12-15 15:04:45',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(29,'conference table round',NULL,10,5,'2020-12-15 15:06:53','2020-12-15 15:06:53',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(30,'conference table square',NULL,10,5,'2020-12-15 15:07:11','2020-12-15 15:07:11',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(31,'office table white',NULL,10,5,'2020-12-15 15:07:34','2020-12-15 15:07:34',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(32,'office table',NULL,10,5,'2020-12-15 15:07:59','2020-12-15 15:07:59',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(33,'Lazy bag gray',NULL,10,8,'2020-12-15 15:08:47','2020-12-15 15:08:47',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(34,'Lazy bag newspaper',NULL,10,8,'2020-12-15 15:09:05','2020-12-15 15:09:05',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(35,'Ikea Skarsta white',NULL,7,5,'2020-12-15 15:09:34','2020-12-15 15:09:34',NULL,2,0,NULL,0,NULL,NULL,NULL,0),(36,'Ikea Skarsta underframe+ Elgrad BL table board',NULL,8,5,'2020-12-15 15:12:22','2020-12-15 15:12:22',NULL,2,0,NULL,0,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `models_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `models_custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_model_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `default_value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `models_custom_fields` WRITE;
/*!40000 ALTER TABLE `models_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `models_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Snipe-IT Personal Access Client','CdjNqca1pRZQFNxQVGTv4yM9uBP3k3zjM4r9GeR2','http://localhost',1,0,0,'2020-11-24 17:34:23','2020-11-24 17:34:23'),(2,NULL,'Snipe-IT Password Grant Client','Eh4zZMYXdZGC2jgbH8EvjZ15Z3ZH4E7CSJkyki9G','http://localhost',0,1,0,'2020-11-24 17:34:23','2020-11-24 17:34:23'),(3,NULL,'Snipe-IT Personal Access Client','doIB9x2SyRbiuAxhRLMOR3QsaSw53wI1fDfMzivk','http://localhost',1,0,0,'2020-11-24 17:48:43','2020-11-24 17:48:43'),(4,NULL,'Snipe-IT Password Grant Client','pNeCJiwOYLI2Qzwn31F1C69zpudPYeaHvgDsl4u3','http://localhost',0,1,0,'2020-11-24 17:48:43','2020-11-24 17:48:43'),(5,NULL,'Snipe-IT Personal Access Client','Edg0wQYacovpHPPArpty5pqqxCHQHpFBA9M1CJzo','http://localhost',1,0,0,'2020-11-24 17:50:36','2020-11-24 17:50:36'),(6,NULL,'Snipe-IT Password Grant Client','xe38wmAumUc9dZ7ra2IXdKnpLHw9DQzkINJ8Z6jH','http://localhost',0,1,0,'2020-11-24 17:50:36','2020-11-24 17:50:36'),(7,NULL,'Snipe-IT Personal Access Client','acWZfT0S4IMnZi9BKP4dHf7x0i4brOXQux1gZbFh','http://localhost',1,0,0,'2020-11-24 17:51:56','2020-11-24 17:51:56'),(8,NULL,'Snipe-IT Password Grant Client','uBqgJEzZrhU1wWY0JEmzwNko3P5d5xsUuYVenNch','http://localhost',0,1,0,'2020-11-24 17:51:56','2020-11-24 17:51:56'),(9,NULL,'Snipe-IT Personal Access Client','BNJDcfAfYNCDCFN5dKmgSeTUTJcu2geeL522ynuy','http://localhost',1,0,0,'2020-12-09 12:06:38','2020-12-09 12:06:38'),(10,NULL,'Snipe-IT Password Grant Client','P7RJu3zYwRx7yn51LNPbulEXkCneJZYA7uzqwfts','http://localhost',0,1,0,'2020-12-09 12:06:38','2020-12-09 12:06:38'),(11,NULL,'Snipe-IT Personal Access Client','SByLD5aox6vtinm7wo3nPBmbNRzVW0WlPF9KTdKJ','http://localhost',1,0,0,'2020-12-10 18:03:40','2020-12-10 18:03:40'),(12,NULL,'Snipe-IT Password Grant Client','OfmNIxCOgeDbs9ChcOkAKNF5M36Z7kCamrzBrpr9','http://localhost',0,1,0,'2020-12-10 18:03:40','2020-12-10 18:03:40'),(13,NULL,'Snipe-IT Personal Access Client','xf4riFMBuTynBt0XdWpm2sREayy0DpjzBvk8ZlVk','http://localhost',1,0,0,'2020-12-10 18:07:53','2020-12-10 18:07:53'),(14,NULL,'Snipe-IT Password Grant Client','7VeYzhTjJ6Ztrl6vmbRy0YFfkiPyMTMApYJSwf3Z','http://localhost',0,1,0,'2020-12-10 18:07:53','2020-12-10 18:07:53'),(15,NULL,'Snipe-IT Personal Access Client','DdW0DZ52YMagRqJdjM7IkPYtMBfQc6ejkBy1iWkH','http://localhost',1,0,0,'2020-12-11 07:49:50','2020-12-11 07:49:50'),(16,NULL,'Snipe-IT Password Grant Client','gJqNg8KabFn4cO1b3kqF87H49rO1VWkLLFuAoNiM','http://localhost',0,1,0,'2020-12-11 07:49:50','2020-12-11 07:49:50'),(17,NULL,'Snipe-IT Personal Access Client','l41OyV6a4kGE3f7HgX7Bg3cUENZN5dHCtEg8aU1a','http://localhost',1,0,0,'2020-12-11 07:52:07','2020-12-11 07:52:07'),(18,NULL,'Snipe-IT Password Grant Client','jnSsjsXnvRTzpOiCnjbSqMT2i75urwcowk4mVY1L','http://localhost',0,1,0,'2020-12-11 07:52:07','2020-12-11 07:52:07'),(19,NULL,'Snipe-IT Personal Access Client','p4QxvQT9bMP3AMTavSGk3hcpDZ1O1dP75NlvbVTj','http://localhost',1,0,0,'2020-12-11 08:47:06','2020-12-11 08:47:06'),(20,NULL,'Snipe-IT Password Grant Client','T8k5DxK3c0bfU8UIBu1KTF4jmb6T3dcEPewMfkql','http://localhost',0,1,0,'2020-12-11 08:47:06','2020-12-11 08:47:06');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2020-11-24 17:34:23','2020-11-24 17:34:23'),(2,3,'2020-11-24 17:48:43','2020-11-24 17:48:43'),(3,5,'2020-11-24 17:50:36','2020-11-24 17:50:36'),(4,7,'2020-11-24 17:51:56','2020-11-24 17:51:56'),(5,9,'2020-12-09 12:06:38','2020-12-09 12:06:38'),(6,11,'2020-12-10 18:03:40','2020-12-10 18:03:40'),(7,13,'2020-12-10 18:07:53','2020-12-10 18:07:53'),(8,15,'2020-12-11 07:49:50','2020-12-11 07:49:50'),(9,17,'2020-12-11 07:52:07','2020-12-11 07:52:07'),(10,19,'2020-12-11 08:47:06','2020-12-11 08:47:06');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permission_groups` WRITE;
/*!40000 ALTER TABLE `permission_groups` DISABLE KEYS */;
INSERT INTO `permission_groups` VALUES (1,'Admins','{\"superuser\":\"0\",\"admin\":\"1\",\"import\":\"1\",\"reports.view\":\"1\",\"assets.view\":\"1\",\"assets.create\":\"1\",\"assets.edit\":\"1\",\"assets.delete\":\"1\",\"assets.checkin\":\"1\",\"assets.checkout\":\"1\",\"assets.audit\":\"1\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"1\",\"accessories.create\":\"1\",\"accessories.edit\":\"1\",\"accessories.delete\":\"1\",\"accessories.checkout\":\"1\",\"accessories.checkin\":\"1\",\"consumables.view\":\"1\",\"consumables.create\":\"1\",\"consumables.edit\":\"1\",\"consumables.delete\":\"1\",\"consumables.checkout\":\"1\",\"licenses.view\":\"1\",\"licenses.create\":\"1\",\"licenses.edit\":\"1\",\"licenses.delete\":\"1\",\"licenses.checkout\":\"1\",\"licenses.keys\":\"1\",\"components.view\":\"1\",\"components.create\":\"1\",\"components.edit\":\"1\",\"components.delete\":\"1\",\"components.checkout\":\"1\",\"components.checkin\":\"1\",\"kits.view\":\"1\",\"kits.create\":\"1\",\"kits.edit\":\"1\",\"kits.delete\":\"1\",\"kits.checkout\":\"1\",\"users.view\":\"1\",\"users.create\":\"1\",\"users.edit\":\"1\",\"users.delete\":\"1\",\"models.view\":\"1\",\"models.create\":\"1\",\"models.edit\":\"1\",\"models.delete\":\"1\",\"categories.view\":\"1\",\"categories.create\":\"1\",\"categories.edit\":\"1\",\"categories.delete\":\"1\",\"departments.view\":\"1\",\"departments.create\":\"1\",\"departments.edit\":\"1\",\"departments.delete\":\"1\",\"statuslabels.view\":\"1\",\"statuslabels.create\":\"1\",\"statuslabels.edit\":\"1\",\"statuslabels.delete\":\"1\",\"customfields.view\":\"1\",\"customfields.create\":\"1\",\"customfields.edit\":\"1\",\"customfields.delete\":\"1\",\"suppliers.view\":\"1\",\"suppliers.create\":\"1\",\"suppliers.edit\":\"1\",\"suppliers.delete\":\"1\",\"manufacturers.view\":\"1\",\"manufacturers.create\":\"1\",\"manufacturers.edit\":\"1\",\"manufacturers.delete\":\"1\",\"depreciations.view\":\"1\",\"depreciations.create\":\"1\",\"depreciations.edit\":\"1\",\"depreciations.delete\":\"1\",\"locations.view\":\"1\",\"locations.create\":\"1\",\"locations.edit\":\"1\",\"locations.delete\":\"1\",\"companies.view\":\"1\",\"companies.create\":\"1\",\"companies.edit\":\"1\",\"companies.delete\":\"1\",\"self.two_factor\":\"1\",\"self.api\":\"1\",\"self.edit_location\":\"1\",\"self.checkout_assets\":\"1\"}','2020-11-25 09:15:36','2020-11-25 09:15:36'),(2,'Super User','{\"superuser\":\"1\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}','2020-11-25 09:15:48','2020-11-25 09:15:48');
/*!40000 ALTER TABLE `permission_groups` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `requested_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requested_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `denied_at` datetime DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `requested_assets` WRITE;
/*!40000 ALTER TABLE `requested_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `requested_assets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `request_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `per_page` int(11) NOT NULL DEFAULT '20',
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Snipe IT Asset Management',
  `qr_code` int(11) DEFAULT NULL,
  `qr_text` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_asset_name` int(11) DEFAULT NULL,
  `display_checkout_date` int(11) DEFAULT NULL,
  `display_eol` int(11) DEFAULT NULL,
  `auto_increment_assets` int(11) NOT NULL DEFAULT '0',
  `auto_increment_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `load_remote` tinyint(1) NOT NULL DEFAULT '1',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alerts_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `default_eula_text` longtext COLLATE utf8mb4_unicode_ci,
  `barcode_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'QRCODE',
  `slack_endpoint` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_botname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_css` text COLLATE utf8mb4_unicode_ci,
  `brand` tinyint(4) NOT NULL DEFAULT '1',
  `ldap_enabled` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_server` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_uname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_pword` longtext COLLATE utf8mb4_unicode_ci,
  `ldap_basedn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_filter` text COLLATE utf8mb4_unicode_ci,
  `ldap_username_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'samaccountname',
  `ldap_lname_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'sn',
  `ldap_fname_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'givenname',
  `ldap_auth_filter_query` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'uid=samaccountname',
  `ldap_version` int(11) DEFAULT '3',
  `ldap_active_flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_emp_num` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_multiple_companies_support` tinyint(1) NOT NULL DEFAULT '0',
  `ldap_server_cert_ignore` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `labels_per_page` tinyint(4) NOT NULL DEFAULT '30',
  `labels_width` decimal(6,5) NOT NULL DEFAULT '2.62500',
  `labels_height` decimal(6,5) NOT NULL DEFAULT '1.00000',
  `labels_pmargin_left` decimal(6,5) NOT NULL DEFAULT '0.21975',
  `labels_pmargin_right` decimal(6,5) NOT NULL DEFAULT '0.21975',
  `labels_pmargin_top` decimal(6,5) NOT NULL DEFAULT '0.50000',
  `labels_pmargin_bottom` decimal(6,5) NOT NULL DEFAULT '0.50000',
  `labels_display_bgutter` decimal(6,5) NOT NULL DEFAULT '0.07000',
  `labels_display_sgutter` decimal(6,5) NOT NULL DEFAULT '0.05000',
  `labels_fontsize` tinyint(4) NOT NULL DEFAULT '9',
  `labels_pagewidth` decimal(7,5) NOT NULL DEFAULT '8.50000',
  `labels_pageheight` decimal(7,5) NOT NULL DEFAULT '11.00000',
  `labels_display_name` tinyint(4) NOT NULL DEFAULT '0',
  `labels_display_serial` tinyint(4) NOT NULL DEFAULT '1',
  `labels_display_tag` tinyint(4) NOT NULL DEFAULT '1',
  `alt_barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `alt_barcode_enabled` tinyint(1) DEFAULT '1',
  `alert_interval` int(11) DEFAULT '30',
  `alert_threshold` int(11) DEFAULT '5',
  `email_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'filastname',
  `username_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'filastname',
  `is_ad` tinyint(1) NOT NULL DEFAULT '0',
  `ad_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_port` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '389',
  `ldap_tls` tinyint(1) NOT NULL DEFAULT '0',
  `zerofill_count` int(11) NOT NULL DEFAULT '5',
  `ldap_pw_sync` tinyint(1) NOT NULL DEFAULT '1',
  `two_factor_enabled` tinyint(4) DEFAULT NULL,
  `require_accept_signature` tinyint(1) NOT NULL DEFAULT '0',
  `date_display_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y-m-d',
  `time_display_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'h:i A',
  `next_auto_tag_base` bigint(20) NOT NULL DEFAULT '1',
  `login_note` text COLLATE utf8mb4_unicode_ci,
  `thumbnail_max_h` int(11) DEFAULT '50',
  `pwd_secure_uncommon` tinyint(1) NOT NULL DEFAULT '0',
  `pwd_secure_complexity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwd_secure_min` int(11) NOT NULL DEFAULT '8',
  `audit_interval` int(11) DEFAULT NULL,
  `audit_warning_days` int(11) DEFAULT NULL,
  `show_url_in_emails` tinyint(1) NOT NULL DEFAULT '0',
  `custom_forgot_pass_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_alerts_in_menu` tinyint(1) NOT NULL DEFAULT '1',
  `labels_display_company_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_archived_in_list` tinyint(1) NOT NULL DEFAULT '0',
  `dashboard_message` text COLLATE utf8mb4_unicode_ci,
  `support_footer` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `modellist_displays` char(191) COLLATE utf8mb4_unicode_ci DEFAULT 'image,category,manufacturer,model_number',
  `login_remote_user_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `login_common_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `login_remote_user_custom_logout_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `skin` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_images_in_email` tinyint(1) NOT NULL DEFAULT '1',
  `admin_cc_email` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labels_display_model` tinyint(1) NOT NULL DEFAULT '0',
  `privacy_policy_link` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_footer` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `unique_serial` tinyint(1) NOT NULL DEFAULT '0',
  `logo_print_assets` tinyint(1) NOT NULL DEFAULT '0',
  `depreciation_method` char(10) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `favicon` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_logo` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_logo` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_assigned_assets` tinyint(1) NOT NULL DEFAULT '0',
  `login_remote_user_header_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ad_append_domain` tinyint(1) NOT NULL DEFAULT '0',
  `saml_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `saml_idp_metadata` text COLLATE utf8mb4_unicode_ci,
  `saml_attr_mapping_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saml_forcelogin` tinyint(1) NOT NULL DEFAULT '0',
  `saml_slo` tinyint(1) NOT NULL DEFAULT '0',
  `saml_sp_x509cert` text COLLATE utf8mb4_unicode_ci,
  `saml_sp_privatekey` text COLLATE utf8mb4_unicode_ci,
  `saml_custom_settings` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'2020-11-24 17:36:20','2020-12-16 12:11:59',1,20,'DevLabs Asset Management',NULL,NULL,NULL,NULL,NULL,1,NULL,1,'setting-logo-r1SewDlavM.jpg',NULL,'herwart.wermescher@devlabs.at',1,NULL,'QRCODE',NULL,NULL,NULL,'EUR',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'samaccountname','sn','givenname','uid=samaccountname',3,NULL,NULL,NULL,1,0,'de',30,2.62500,1.00000,0.21975,0.21975,0.50000,0.50000,0.07000,0.05000,9,8.50000,11.00000,0,1,1,'C128',1,30,5,'devlabs.at','filastname','filastname',0,NULL,'389',0,5,1,NULL,0,'d.m.Y','H:i',37,NULL,50,0,NULL,10,NULL,NULL,0,NULL,1,0,0,NULL,'on',NULL,'image,category,manufacturer,model_number',0,0,'','blue',1,'jelena.bobar@devlabs.at',0,NULL,'on',0,0,'default','favicon-uploaded.ico',NULL,NULL,0,'',0,0,NULL,NULL,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `status_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_labels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deployable` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `default_label` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `status_labels` WRITE;
/*!40000 ALTER TABLE `status_labels` DISABLE KEYS */;
INSERT INTO `status_labels` VALUES (1,'Pending',1,NULL,NULL,NULL,0,1,0,'These assets are not yet ready to be deployed, usually because of configuration or waiting on parts.',NULL,0,0),(2,'Ready to Deploy',1,NULL,NULL,NULL,1,0,0,'These assets are ready to deploy.',NULL,0,0),(3,'Archived',1,NULL,NULL,NULL,0,0,1,'These assets are no longer in circulation or viable.',NULL,0,0);
/*!40000 ALTER TABLE `status_labels` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'MediaMarkt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-11-25 08:56:20','2020-11-25 08:56:20',1,NULL,NULL,'http://',NULL),(2,'electronic4you',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-11-25 08:56:31','2020-11-25 08:56:31',1,NULL,NULL,'http://',NULL),(3,'Mobatek',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-11-25 09:30:05','2020-11-25 09:30:05',NULL,NULL,NULL,NULL,NULL),(4,'Amazon (DevLabs Technologies GmbH)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-11-25 09:45:46','2020-11-25 09:45:46',NULL,NULL,NULL,NULL,NULL),(5,'7iD Technologies GmbH',NULL,NULL,NULL,NULL,'AT',NULL,NULL,NULL,NULL,NULL,'2020-12-01 21:09:46','2020-12-01 21:09:46',2,NULL,NULL,'http://',NULL),(6,'EOSS Industries Holding GmbH',NULL,NULL,NULL,NULL,'AT',NULL,NULL,NULL,NULL,NULL,'2020-12-01 21:10:26','2020-12-01 21:10:26',2,NULL,NULL,'http://',NULL),(7,'digitalis',NULL,NULL,NULL,NULL,'AT',NULL,NULL,NULL,NULL,NULL,'2020-12-01 21:10:58','2020-12-01 21:10:58',2,NULL,NULL,'http://',NULL),(8,'DevLabs Technologies GmbH',NULL,NULL,NULL,NULL,'AT',NULL,NULL,NULL,NULL,NULL,'2020-12-01 21:11:20','2020-12-01 21:11:20',2,NULL,NULL,'http://',NULL),(9,'MCOMPUTERS S.P.',NULL,NULL,NULL,NULL,'BA',NULL,NULL,NULL,NULL,NULL,'2020-12-01 21:11:40','2020-12-01 21:11:40',2,NULL,NULL,'http://',NULL),(10,'JetBrains s.r.o.','Kavci Hory Office Park','Na hrebenech II 1718/10','Prag ',NULL,'CZ','+420241722501','+420241722540',NULL,NULL,NULL,'2020-12-11 14:12:40','2020-12-11 14:12:40',2,NULL,'14000','https://www.jetbrains.com/',NULL),(11,'Microsoft',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-11 14:15:24','2020-12-11 14:15:24',2,NULL,NULL,'http://',NULL),(12,'Cleverbridge ','Gereonstr. 43-65',NULL,'Cologne','Nordrhein-Westfalen','DE',NULL,NULL,NULL,NULL,NULL,'2020-12-11 14:20:28','2020-12-11 14:20:28',2,NULL,'50670','https://www.cleverbridge.com/corporate/',NULL),(13,'DevLabs Technologies Austria','Am Eisernen Tor 3',NULL,'Graz','Steiermark','AT',NULL,NULL,NULL,NULL,NULL,'2020-12-15 13:01:17','2020-12-15 15:15:29',2,'2020-12-15 15:15:29','8010','http://',NULL),(14,'Kabinet Plus','Srpska 103',NULL,'Banja Luka',NULL,'BA','+38751214747',NULL,NULL,NULL,NULL,'2020-12-15 13:03:48','2020-12-15 13:03:48',2,NULL,'78000','https://www.kabinetplus.com/',NULL),(15,'Export Import Iva d.o.o.','Divjak bb',NULL,'Vitez',NULL,'BA','+38730713556',NULL,'export.import.iva@tel.net.ba',NULL,NULL,'2020-12-15 13:06:36','2020-12-15 13:06:36',2,NULL,'72250','http://',NULL),(16,'Medjugorje Royal Travel','Pape Ivana Pavla II. 18','Bijakovici, Medjugorje','Citluk',NULL,'BA','+38736650573',NULL,NULL,NULL,NULL,'2020-12-15 13:10:06','2020-12-15 13:10:06',2,NULL,'88260','http://',NULL),(17,'DevLabs Technologies Croatia','Josipa Marohnica 1',NULL,'Zagreb',NULL,'HR',NULL,NULL,NULL,NULL,NULL,'2020-12-15 13:12:38','2020-12-15 13:12:38',2,NULL,'10000','http://',NULL),(18,'IKEA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-15 13:13:53','2020-12-15 13:14:08',2,'2020-12-15 13:14:08',NULL,'https://www.ikea.com/hr/hr/',NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `throttle` WRITE;
/*!40000 ALTER TABLE `throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `throttle` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gravatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `employee_num` text COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `company_id` int(10) unsigned DEFAULT NULL,
  `remember_token` text COLLATE utf8mb4_unicode_ci,
  `ldap_import` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `show_in_list` tinyint(1) NOT NULL DEFAULT '1',
  `two_factor_secret` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_enrolled` tinyint(1) NOT NULL DEFAULT '0',
  `two_factor_optin` tinyint(1) NOT NULL DEFAULT '0',
  `department_id` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'herwart.wermescher@devlabs.at','$2y$10$kEhjNLPKxR2T.d0HqAMpWugqGcPjMomihom.Q1tsWXHPmlZkNJC9O','{\"superuser\":\"1\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,NULL,NULL,'2020-12-16 12:34:00',NULL,NULL,'Herwart','Wermescher','2020-11-24 17:36:20','2020-12-17 10:47:59',NULL,NULL,NULL,NULL,1,'+436644211466',NULL,NULL,'DLA-1234567','avatar-R8MOBY8T180mGY1KL4.png','herwart',NULL,NULL,'1oDX4DwhomaGVP40vx1LQQj0EaFouztKBZR6aprRNGR9OlZCVIz2mjiS0nUX',0,'de',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL),(2,'jelena.bobar@devlabs.at','$2y$10$rEPiiiTKu1gaDtTdKxHY.eoJZ5W65FMQXMRP7lcPI7LdCYey3PbM6','{\"superuser\":\"1\",\"admin\":\"1\",\"import\":\"1\",\"reports.view\":\"1\",\"assets.view\":\"1\",\"assets.create\":\"1\",\"assets.edit\":\"1\",\"assets.delete\":\"1\",\"assets.checkin\":\"1\",\"assets.checkout\":\"1\",\"assets.audit\":\"1\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"1\",\"accessories.create\":\"1\",\"accessories.edit\":\"1\",\"accessories.delete\":\"1\",\"accessories.checkout\":\"1\",\"accessories.checkin\":\"1\",\"consumables.view\":\"1\",\"consumables.create\":\"1\",\"consumables.edit\":\"1\",\"consumables.delete\":\"1\",\"consumables.checkout\":\"1\",\"licenses.view\":\"1\",\"licenses.create\":\"1\",\"licenses.edit\":\"1\",\"licenses.delete\":\"1\",\"licenses.checkout\":\"1\",\"licenses.keys\":\"1\",\"components.view\":\"1\",\"components.create\":\"1\",\"components.edit\":\"1\",\"components.delete\":\"1\",\"components.checkout\":\"1\",\"components.checkin\":\"1\",\"kits.view\":\"1\",\"kits.create\":\"1\",\"kits.edit\":\"1\",\"kits.delete\":\"1\",\"kits.checkout\":\"1\",\"users.view\":\"1\",\"users.create\":\"1\",\"users.edit\":\"1\",\"users.delete\":\"1\",\"models.view\":\"1\",\"models.create\":\"1\",\"models.edit\":\"1\",\"models.delete\":\"1\",\"categories.view\":\"1\",\"categories.create\":\"1\",\"categories.edit\":\"1\",\"categories.delete\":\"1\",\"departments.view\":\"1\",\"departments.create\":\"1\",\"departments.edit\":\"1\",\"departments.delete\":\"1\",\"statuslabels.view\":\"1\",\"statuslabels.create\":\"1\",\"statuslabels.edit\":\"1\",\"statuslabels.delete\":\"1\",\"customfields.view\":\"1\",\"customfields.create\":\"1\",\"customfields.edit\":\"1\",\"customfields.delete\":\"1\",\"suppliers.view\":\"1\",\"suppliers.create\":\"1\",\"suppliers.edit\":\"1\",\"suppliers.delete\":\"1\",\"manufacturers.view\":\"1\",\"manufacturers.create\":\"1\",\"manufacturers.edit\":\"1\",\"manufacturers.delete\":\"1\",\"depreciations.view\":\"1\",\"depreciations.create\":\"1\",\"depreciations.edit\":\"1\",\"depreciations.delete\":\"1\",\"locations.view\":\"1\",\"locations.create\":\"1\",\"locations.edit\":\"1\",\"locations.delete\":\"1\",\"companies.view\":\"1\",\"companies.create\":\"1\",\"companies.edit\":\"1\",\"companies.delete\":\"1\",\"self.two_factor\":\"1\",\"self.api\":\"1\",\"self.edit_location\":\"1\",\"self.checkout_assets\":\"1\"}',1,NULL,NULL,'2020-12-17 10:01:08',NULL,NULL,'Jelena','Bobar','2020-11-24 17:38:32','2020-12-17 10:47:30',NULL,NULL,'BA',NULL,2,'+38765825241','Office Manager',3,'DLB-20',NULL,'jelena',NULL,3,NULL,0,'de',1,NULL,0,0,3,'Kosovska 16','Banja Luka',NULL,'78000'),(3,'ognjen.mandic@devlabs.at','$2y$10$Yi3UMm64NrGSbzocgQ0EieEufZaR2GUhqUxI6v7b9Fk8dDZK9pE2.','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,NULL,NULL,NULL,NULL,NULL,'Ognjen','Mandic','2020-11-25 08:58:51','2020-11-30 11:11:12',NULL,NULL,'BA',NULL,2,'+38765160042','Direktor',NULL,'35',NULL,'ognjen.mandic',NULL,3,NULL,0,'de',1,NULL,0,0,3,'Milana Radmana 14/13','Banja Luka',NULL,'78000'),(4,'srdjan.blazevic@devlabs.ba','$2y$10$RhwLBNqnWJDVfJ4eBnVciu6iufyFgEZvpGVo/Y8XwsXofGA0uZP5S','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Srdjan','Blazevic','2020-11-25 10:40:41','2020-11-29 22:11:46',NULL,NULL,'BA',NULL,2,'+38766545966','Head of IT Support',3,'4',NULL,'srdjan.blazevic',NULL,3,NULL,0,'en',1,NULL,0,0,1,'Podrugla bb','Mrkonjic Grad',NULL,'70260'),(5,'dragan.tubak@devlabs.ba','$2y$10$ogchqpyAHUfqfdokg1VmF.NlRNgdK.aOPZJIf5juxSc4VYKKFtzSS','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Dragan','Tubak','2020-11-25 10:42:04','2020-11-30 11:03:36',NULL,NULL,'BA',NULL,2,'+38765619232',NULL,4,'26',NULL,'dragan.tubak',NULL,3,NULL,0,'de',1,NULL,0,0,1,'Carice Milice 10','Banja Luka',NULL,'78000'),(6,'sinisa.stojic@devlabs.ba','$2y$10$ktqUj95X5.b2I2uNy7.s6OTzRZXD3M8jGNtZ3FZr5kd5CGRQctMhK','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Sinisa','Stojic','2020-11-25 11:05:45','2020-11-30 10:56:28',NULL,NULL,'BA',NULL,2,'+38766008440',NULL,4,'21',NULL,'sinisa.stojic',NULL,3,NULL,0,'de',1,NULL,0,0,1,'Cara Dusana 51','Mrkonjic Grad',NULL,'70260'),(7,'djordje.vujic@devlabs.ba','$2y$10$98kQMhB9XZoQLzwwnhGTguk1KoXD2ocRI6ovH98DxlmzrTc9ZW0yW','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Djordje','Vujic','2020-11-25 11:06:22','2020-11-29 22:13:56',NULL,NULL,'BA',NULL,2,'+387644085573',NULL,4,'5',NULL,'djordje.vujic',NULL,3,NULL,0,'de',1,NULL,0,0,1,'Bukovacka 132, Podgraci','Gradiska',NULL,'78405'),(8,'goran.maslic@devlabs.ba','$2y$10$FfR4GItKLJ1mi3HLoVW0iOvhonZOf14t/J78/NVmzWG9lMrDFgN8u','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Goran ','Maslic','2020-11-29 22:00:31','2020-11-29 22:00:31',NULL,NULL,'BA',NULL,2,'+38766959136','Software Developer',3,'1',NULL,'goran.maslic',NULL,3,NULL,0,'de',1,NULL,0,0,2,'Ive Andrica S20/3','Brod',NULL,'74450'),(9,'aleksandar.bosancic@devlabs.ba','$2y$10$Ffj4f9YL90slX/YpFMwIG.v.REZB.kjERcWL.INlEqZObA0Wv5JVC','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Aleksandar','Bosancic','2020-11-29 22:05:23','2020-11-29 22:05:23',NULL,NULL,'BA',NULL,2,'+38765974230','Software Developer',3,'3',NULL,'aleksandar.bosancic',NULL,3,NULL,0,'de',1,NULL,0,0,2,'Vase Carapica 7','Laktasi',NULL,'78250'),(10,'nemanja.pokrajac@devlabs.ba','$2y$10$9nRrG3vxNgmW6t4o/jUUkeiLFaS6XiWLjpqfg8prDRQY9oJUEmF3e','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Nemanja ','Pokrajac','2020-11-29 22:18:40','2020-11-29 22:18:40',NULL,NULL,'BA',NULL,2,'+38765469577','Software Developer',3,'11',NULL,'nemanja.pokrajac',NULL,3,NULL,0,NULL,1,NULL,0,0,2,'Starog Vujadina 62','Banja Luka',NULL,'78000'),(11,'aleksandar.milosevic@devlabs.ba','$2y$10$8S3F/1TrVEiQhSjmD4/Ine5d.2Sl23NcFZVDNl8V92bPFHypLbFlW','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Aleksandar ','Milosevic','2020-11-29 22:22:45','2020-11-29 22:22:45',NULL,NULL,'BA',NULL,2,'+38765422859',NULL,4,'13',NULL,'aleksandar.milosevic',NULL,3,NULL,0,NULL,1,NULL,0,0,1,'Frana Supila 63','Banja Luka',NULL,'78000'),(12,'sasa.matijas@devlabs.ba','$2y$10$2EgrDg2BhCzI/QL5Cmvbb.QZnsAbCw/aEeY2V3v2E9E/rrhagxYiy','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Sasa ','Matijas','2020-11-29 22:25:03','2020-11-29 22:25:03',NULL,NULL,'BA',NULL,2,'+38765391544',NULL,3,'14',NULL,'sasa.matijas',NULL,3,NULL,0,NULL,1,NULL,0,0,2,'Pecani X/2','Prijedor',NULL,'79101'),(13,'jovan.todorovic@devlabs.ba','$2y$10$yyuLYB9Uioo.FJdj25M0eO7RxjzFJqu709QTDQswk9VyXh2a7.LyO','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Jovan ','Todorovic','2020-11-30 10:31:04','2020-11-30 10:31:04',NULL,NULL,'BA',NULL,2,'+38765860223','Software Developer',3,'15',NULL,'jovan.todorovic',NULL,3,NULL,0,NULL,1,NULL,0,0,2,'Bulevar Zivojina Misica 45','Banja Luka',NULL,'78000'),(14,'dejan.vujanovic@devlabs.ba','$2y$10$UIIAOqYT487rRMoYqqpm8.g8TKWlY8NXZ4D//Ui/mh2aaG8YkEyx2','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Dejan ','Vujanovic','2020-11-30 10:49:04','2020-11-30 10:49:04',NULL,NULL,'BA',NULL,2,'+38765293236','Software Developer',3,'18',NULL,'dejan.vujanovic',NULL,3,NULL,0,NULL,1,NULL,0,0,2,'Blok 1 br. 18','Bijeljina',NULL,'76300'),(15,'dejan.stojkovic@devlabs.ba','$2y$10$LNjjzdDNn9mjDJcOG/E5dOVB3vRZgXNVRvsyUowUAtYxj9GfaE.Be','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Dejan','Stojkovic','2020-11-30 10:50:46','2020-11-30 10:50:46',NULL,NULL,'BA',NULL,2,'+38765606267','Software Developer',3,'19',NULL,'dejan.stojkovic',NULL,3,NULL,0,NULL,1,NULL,0,0,2,'Mladena Stojanovica 119','Banja Luka',NULL,'78000'),(16,'marko.majstorovic@devlabs.ba','$2y$10$28nSpN9WcQWjKBVlSUeHBOWbE.WI8hNor7L/I.1j9llWZMd8l2jGC','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Marko ','Majstorovic','2020-11-30 10:58:20','2020-11-30 10:58:20',NULL,NULL,'BA',NULL,2,'+38765311002','Software Developer',3,'22',NULL,'marko.majstorovic',NULL,3,NULL,0,NULL,1,NULL,0,0,2,'Vojvode Momcila 16','Banja Luka',NULL,'78000'),(17,'milorad.malinovic@devlabs.ba','$2y$10$Myd.mu6nlRDYUEk8q1HfE.YjScTRcvLhO2JCcJYcUrbY.aM.qOdny','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Milorad ','Malinovic','2020-11-30 11:00:04','2020-11-30 11:00:04',NULL,NULL,'BA',NULL,2,'+38766294923','Quality Engineer',3,'25',NULL,'milorad.malinovic',NULL,3,NULL,0,NULL,1,NULL,0,0,2,'Gornja Slatina 123','Samac',NULL,'76230'),(18,'milovan.bekic@devlabs.ba','$2y$10$uTeN2ZCLY4TU7bWGM/Ca8.Qygv1g00gR1zpWJjvIfh.OZ7EGD4kqK','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Milovan','Bekic','2020-11-30 11:05:51','2020-11-30 11:05:51',NULL,NULL,'BA',NULL,2,'+38765398492','DevOps Engineer',3,'32',NULL,'milova.bekic',NULL,3,NULL,0,NULL,1,NULL,0,0,2,'Dujka Komljenovica bb','Knezevo',NULL,'78230'),(19,'milijana.jakovljevic@devlabs.ba','$2y$10$ocv1v/3/Nla9rQVQzn2vfudRIIn1P00mYBM4/wEUtDjn40dpnkl9.','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Milijana','Jakovljevic','2020-11-30 11:08:20','2020-11-30 11:08:20',NULL,NULL,'BA',NULL,2,'+38766441206','Quality Automation Engineer',3,'34',NULL,'milijana.jakovljevic',NULL,3,NULL,0,NULL,1,NULL,0,0,2,'Nikole Pasica bb','Prijedor',NULL,'79101'),(20,'zeljko.dzafic@devlabs.ba','$2y$10$yZwnwOFe97F8620WULeIl.Qs83wCLkAH0rcVC6wnWvG5dh2lElHXK','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Zeljko ','Dzafic','2020-11-30 11:10:04','2020-11-30 11:10:04',NULL,NULL,'BA',NULL,2,'+38765696155','Senior Software Developer',3,'36',NULL,'zeljko.dzafic',NULL,3,NULL,0,NULL,1,NULL,0,0,2,'Starine Novaka 12','Banja Luka',NULL,'78000'),(21,'renato.kudra@devlabs.ba','$2y$10$.deZ5AKAhBfl.5Zu.lqp8eINKCNT4likZWiRFnQjnlnujECVn4Cxe','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Renato','Kudra','2020-12-02 09:13:35','2020-12-02 09:13:35',NULL,NULL,'BA',NULL,2,'+38766646573',NULL,4,'9',NULL,'renato.kudra',NULL,3,NULL,0,'de',1,NULL,0,0,1,'Baje Pivljanina 1','Banja Luka',NULL,'78000'),(22,'','$2y$10$ViQ42nZV3aq4egwvyAcyPOe1CVUfNjnM7UsFp.I1PAXIkAvEVXxV2','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',0,NULL,NULL,NULL,NULL,NULL,'Nikola','Simic','2020-12-09 12:21:47','2020-12-09 12:28:02','2020-12-09 12:28:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nikola.simic',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (2,1),(3,1);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

