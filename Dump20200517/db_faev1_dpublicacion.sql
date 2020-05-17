-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_faev1
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `dpublicacion`
--

DROP TABLE IF EXISTS `dpublicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dpublicacion` (
  `dpb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pub_id` int(10) unsigned NOT NULL,
  `typ_id` int(10) unsigned NOT NULL,
  `pub_txt` text NOT NULL,
  `pub_dat` datetime NOT NULL,
  `pub_vot` smallint(6) NOT NULL,
  PRIMARY KEY (`dpb_id`),
  KEY `pub_id` (`pub_id`),
  KEY `typ_id` (`typ_id`),
  CONSTRAINT `dpublicacion_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `mpublicacion` (`pub_id`),
  CONSTRAINT `dpublicacion_ibfk_2` FOREIGN KEY (`typ_id`) REFERENCES `ctipopublicacion` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpublicacion`
--

LOCK TABLES `dpublicacion` WRITE;
/*!40000 ALTER TABLE `dpublicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpublicacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-17  1:24:59
