-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` smallint NOT NULL,
  `author_first` varchar(50) NOT NULL,
  `author_last` varchar(50) NOT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Kia','Abdullah'),(2,'Alice','Cavanagh'),(3,'Phillip','Pullman'),(5,'Lex','Croucher'),(6,'Bill','Bryson'),(7,'William','Manchester'),(8,'Paul','Reid'),(9,'Harbans','Lal'),(10,'Ashuma','Sachdeva');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `book_author_id` int NOT NULL,
  `isbn` char(13) DEFAULT NULL,
  `author_id` smallint DEFAULT NULL,
  PRIMARY KEY (`book_author_id`),
  KEY `isbn` (`isbn`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `item` (`isbn`),
  CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (1,'9781398510562',1),(2,'9780008433680',2),(3,'9781407130224',3),(4,'9780440866398',3),(7,'9780345548634',7),(8,'9780345548634',8),(9,'9789390709441',9),(10,'9789390709441',10);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copy`
--

DROP TABLE IF EXISTS `copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copy` (
  `item_barcode` char(8) NOT NULL,
  `isbn` char(13) DEFAULT NULL,
  `branch_id` tinyint DEFAULT NULL,
  PRIMARY KEY (`item_barcode`),
  UNIQUE KEY `item_barcode` (`item_barcode`),
  KEY `branch_id` (`branch_id`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `location_id` (`branch_id`),
  CONSTRAINT `copy_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `item` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copy`
--

LOCK TABLES `copy` WRITE;
/*!40000 ALTER TABLE `copy` DISABLE KEYS */;
INSERT INTO `copy` VALUES ('20000001','9781398510562',1),('20000002','9781398510562',2),('20000003','9780008433680',1),('20000004','9781407130224',1),('20000005','9781407130224',5),('20000006','9781407130224',2),('20000007','9781407130224',3),('20000008','9780345548634',1),('20000009','9789390709441',1),('20000010','9780440866398',2),('20000011','9780440866398',3),('20000012','9780008433680',4),('20000013','9781407130224',1),('20000014','9781407130224',1),('20000015','9780440866398',1),('20000016','9780440866398',3);
/*!40000 ALTER TABLE `copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `isbn` char(13) NOT NULL,
  `title` tinytext NOT NULL,
  `description` text,
  `category_id` smallint DEFAULT NULL,
  `is_available` bit(1) DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('9780008433680','Those people next door','You can choose your house. Not your neighbours.',NULL,NULL),('9780345548634','The Last Lion: Winston Spencer Churchill: Defender of the Realm 1940-1965','Winston Churchill from 1940 to 1965.',NULL,NULL),('9780440866398','I was a rat!...or The scarlet slippers','A re-working of a Cinderella story from the point of view of a rat.',NULL,NULL),('9781398510562','The house that made us','The House That Made Us is a love story and a life story told through a series of photographs and inspired by a true story.',NULL,NULL),('9781407130224','Northern lights','Lyra goes on an adventure with Pan.',NULL,NULL),('9789390709441','Textbook of Biochemistry','The thoroughly revised and updated edition of the book. Primarily aimed at the undergraduate MBBS students. Written in conformity with the latest curriculum laid down by Medical Council of India.',NULL,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_number` mediumint NOT NULL AUTO_INCREMENT,
  `loan_date` date DEFAULT NULL,
  `card_number` char(8) DEFAULT NULL,
  `item_barcode` char(8) DEFAULT NULL,
  `branch_id` tinyint DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `returned_date` date DEFAULT NULL,
  PRIMARY KEY (`loan_number`),
  KEY `card_number` (`card_number`),
  KEY `item_barcode` (`item_barcode`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`card_number`) REFERENCES `members` (`card_number`),
  CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`item_barcode`) REFERENCES `copy` (`item_barcode`),
  CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `location_id` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,'2023-01-07','10000001','20000001',1,'2023-01-28','2023-01-28'),(2,'2023-01-07','10000001','20000003',1,'2023-01-28','2023-01-28'),(3,'2023-01-07','10000002','20000013',1,'2023-01-28','2023-01-26'),(4,'2023-01-15','10000003','20000002',2,'2023-02-05','2023-02-03'),(5,'2023-02-24','10000004','20000001',1,'2023-03-17','2023-03-21'),(6,'2023-02-28','10000009','20000007',3,'2023-03-21','2023-03-21'),(7,'2023-02-28','10000009','20000016',3,'2023-03-21','2023-03-21'),(8,'2023-03-07','10000010','20000006',2,'2023-03-28','2023-03-21'),(9,'2023-03-07','10000010','20000010',2,'2023-03-28','2023-03-21'),(10,'2023-03-07','10000004','20000003',1,'2023-03-28','2023-03-25'),(11,'2023-03-07','10000004','20000013',1,'2023-03-28','2023-03-25'),(12,'2023-03-20','10000002','20000001',1,'2023-04-10',NULL),(13,'2023-03-25','10000009','20000005',5,'2023-04-15',NULL),(14,'2023-03-25','10000010','20000008',1,'2023-04-15',NULL),(15,'2023-03-25','10000010','20000009',1,'2023-04-15',NULL),(16,'2023-03-25','10000001','20000012',4,'2023-04-15',NULL);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_id`
--

DROP TABLE IF EXISTS `location_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_id` (
  `branch_id` tinyint NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `address_1` varchar(50) DEFAULT NULL,
  `address_2` varchar(50) DEFAULT NULL,
  `postcode` varchar(8) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`branch_id`),
  UNIQUE KEY `branch_id` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_id`
--

LOCK TABLES `location_id` WRITE;
/*!40000 ALTER TABLE `location_id` DISABLE KEYS */;
INSERT INTO `location_id` VALUES (1,'Central Library','Calverley Street','Leeds','LS1 3AB','0113 378 5005'),(2,'Garforth Library and One Stop Centre','Lidgett Lane','Garforth','LS25 1EH','0113 378 2002'),(3,'Boston Spa Library','High Street','Leeds','LS23 6BH','0113 378 3003'),(4,'Horsforth Community Hub and Library','Town Street','Horsforth','LS18 5BL','0113 378 4004'),(5,'Yeadon Library and One Stop Centre','Town Hall Square','Yeadon','LS19 7PP','0113 378 6006');
/*!40000 ALTER TABLE `location_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `card_number` char(8) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `is_over_18` bit(1) DEFAULT NULL,
  `address_1` varchar(50) DEFAULT NULL,
  `address_2` varchar(50) DEFAULT NULL,
  `postcode` varchar(8) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `renewal_date` date DEFAULT NULL,
  `account_status` enum('Active','Inactive') DEFAULT NULL,
  PRIMARY KEY (`card_number`),
  UNIQUE KEY `card_number` (`card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('10000001','Lyra','Silvertongue','1990-09-23',NULL,'Jordan Colledge','Oxford','OX1 4AU','07484 123456','lyra.silvertongue@gmail.com','2023-03-19','2026-03-19','Active'),('10000002','Alex','Davidson','1992-10-12',NULL,'54 Merchants Quay','Leeds','LS9 8BA','07484 189345','alex.d@gmail.com','2023-03-24','2026-03-24','Active'),('10000003','Jane','Doe','1965-02-24',NULL,'23 First Street','Wetherby','LS22 8DS','07112 345678','jd@gmail.com','2023-03-24','2026-03-24','Active'),('10000004','Bentley','Cat','2018-09-12',NULL,'54 Merchants Quay','Leeds','LS9 8BA','07133 145988','bentsthecat@gmail.com','2023-03-24','2026-03-24','Active'),('10000005','Dave','Schrock','1987-07-15',NULL,'12 Avenue Road','Chapel Allerton','LS7 7RT','07123 987643','daviddavid@yahoo.com','2018-01-03','2021-01-03','Inactive'),('10000006','Ian','Crowley','2015-04-16',NULL,'55 North Street','Horsforth','LS18 3EA','07112 145633',NULL,'2020-03-20','2023-03-21','Inactive'),('10000007','Isabel','Crowley','2008-08-08',NULL,'55 North Street','Horsforth','LS18 3EA','07112 145633',NULL,'2020-03-20','2023-03-21','Inactive'),('10000008','Eileen','Crowley','1980-03-12',NULL,'55 North Street','Horsforth','LS18 3EA','07112 145633','eileen.l.c@gmail.com','2020-03-20','2023-03-21','Inactive'),('10000009','Will','Perry','1990-07-03',NULL,'12 Bluebell Street','Oxford','OX6 9AB','07766 456822','williamperry@gmail.com','2022-10-10','2025-10-10','Active'),('10000010','John','Smith','1970-05-30',NULL,'123 5th Avenue','Leeds','LS1 9SL','07484 994334','js@gmail.com','2023-01-05','2026-01-05','Active');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-26 17:42:49
