-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: ngts_security_lab
-- ------------------------------------------------------
-- Server version	8.4.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `billing_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `customer_billing_address` varchar(255) DEFAULT NULL,
  `cardlast_four` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`billing_id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `billing_chk_1` CHECK ((char_length(`cardlast_four`) = 4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_email` (`customer_email`),
  UNIQUE KEY `customer_phone_number` (`customer_phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'North Georgia Carpentry','ngcarpentry@gmail.com','665-876-9009'),(2,'Alabama Electric Company','alabamaemc@aemc.com','653-788-9888'),(3,'John Evans Pest Control','Evans_Pest_Control@gmail.com','334-664-2233'),(4,'North Florida Tech College','northfloridatech@nftech.edu','406-800-1227'),(5,'Superstar Marketing','superstarmarketing@superm.com','909-903-2256');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_devices`
--

DROP TABLE IF EXISTS `customer_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_devices` (
  `device_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `device_type` varchar(100) DEFAULT NULL,
  `host_name` varchar(100) DEFAULT NULL,
  `mac_address` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`device_id`),
  UNIQUE KEY `mac_address` (`mac_address`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_devices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_devices`
--

LOCK TABLES `customer_devices` WRITE;
/*!40000 ALTER TABLE `customer_devices` DISABLE KEYS */;
INSERT INTO `customer_devices` VALUES (1,1,NULL,'Printer',NULL,NULL),(2,2,NULL,'Company Employee Computer',NULL,NULL),(3,3,NULL,'Company Employee Computer',NULL,NULL),(4,4,NULL,'Server',NULL,NULL),(5,5,NULL,'Company Phone',NULL,NULL);
/*!40000 ALTER TABLE `customer_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (2,'HR'),(4,'Management'),(3,'Marketing'),(1,'Technician');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `admin` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,NULL,NULL,'John','Smith',NULL,NULL),(2,NULL,NULL,'Lisa','Bernard',NULL,NULL),(3,NULL,NULL,'Cam','Heshar',NULL,NULL),(4,NULL,NULL,'Bo','Nicholas',NULL,NULL),(5,NULL,NULL,'Gunnar','Stapleton',NULL,NULL),(6,NULL,NULL,'Kirby','Lethront',NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_compensation`
--

DROP TABLE IF EXISTS `employee_compensation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_compensation` (
  `compensation_id` int NOT NULL,
  `tax_id` int DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`compensation_id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  KEY `fk_employee_compensation_tax` (`tax_id`),
  CONSTRAINT `employee_compensation_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_employee_compensation_tax` FOREIGN KEY (`tax_id`) REFERENCES `employee_tax_info` (`tax_id`),
  CONSTRAINT `employee_compensation_chk_1` CHECK (((`salary` is null) or (`salary` >= 0))),
  CONSTRAINT `employee_compensation_chk_2` CHECK (((`hourly_rate` is null) or (`hourly_rate` >= 0))),
  CONSTRAINT `employee_compensation_chk_3` CHECK (((`bonus` is null) or (`bonus` >= 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_compensation`
--

LOCK TABLES `employee_compensation` WRITE;
/*!40000 ALTER TABLE `employee_compensation` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_compensation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_tax_info`
--

DROP TABLE IF EXISTS `employee_tax_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_tax_info` (
  `tax_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `tax_info` text,
  PRIMARY KEY (`tax_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_tax_info_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tax_info`
--

LOCK TABLES `employee_tax_info` WRITE;
/*!40000 ALTER TABLE `employee_tax_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_tax_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technician_assignment`
--

DROP TABLE IF EXISTS `technician_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technician_assignment` (
  `assignment_id` int NOT NULL,
  `ticket_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `assigned_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `technician_assignment_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  CONSTRAINT `technician_assignment_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technician_assignment`
--

LOCK TABLES `technician_assignment` WRITE;
/*!40000 ALTER TABLE `technician_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `technician_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_junction_table`
--

DROP TABLE IF EXISTS `ticket_junction_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_junction_table` (
  `ticket_id` int NOT NULL,
  `device_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`,`device_id`),
  KEY `device_id` (`device_id`),
  CONSTRAINT `ticket_junction_table_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  CONSTRAINT `ticket_junction_table_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `customer_devices` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_junction_table`
--

LOCK TABLES `ticket_junction_table` WRITE;
/*!40000 ALTER TABLE `ticket_junction_table` DISABLE KEYS */;
INSERT INTO `ticket_junction_table` VALUES (3,1),(4,1),(5,2),(6,2),(7,2),(8,3),(9,3),(1,4),(2,5);
/*!40000 ALTER TABLE `ticket_junction_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticket_id` int NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `priority` varchar(50) DEFAULT NULL,
  `internal_notes` text,
  `description` text,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,NULL,NULL,NULL,'Wont respond to pings',4),(2,NULL,NULL,NULL,'Needs MDM installed',5),(3,NULL,NULL,NULL,'Printer won\'t connect to computers over wifi',1),(4,NULL,NULL,NULL,'Gets stuck and won\'t print if job is queued',1),(5,NULL,NULL,NULL,'Needs antivirus installed',2),(6,NULL,NULL,NULL,'Needs EDR installed',2),(7,NULL,NULL,NULL,'Needs new wifi configured',2),(8,NULL,NULL,NULL,'Needs data migration',3),(9,NULL,NULL,NULL,'Needs new OS install',3);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-16 16:14:48
