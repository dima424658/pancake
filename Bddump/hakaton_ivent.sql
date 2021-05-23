-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: hakaton
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `ivent`
--

DROP TABLE IF EXISTS `ivent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ivent` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IventName` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IventDescription` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MaxPlayer` int NOT NULL DEFAULT '20',
  `IventLatitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IventLongitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IventTime` datetime NOT NULL,
  `IventAddress` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivent`
--

LOCK TABLES `ivent` WRITE;
/*!40000 ALTER TABLE `ivent` DISABLE KEYS */;
INSERT INTO `ivent` VALUES (1,'Велозаезд','Велозаезд в честь 20-ой годовщины великого философа и мыслителя Кожиева Таймураза',32,'66.087802','76.676579','2021-05-25 12:00:00','Новый Уренгой, Железнодорожная улица, 6Б'),(2,'Парад Самокатов','',16,'66.529844','66.614399','2021-05-27 11:30:00','Салехард, улица Свердлова, 48'),(3,'Сон на ходу','Ход на сону',16,'66.529844','66.614399','2021-06-15 11:00:00','Салехард, улица Свердлова, 48');
/*!40000 ALTER TABLE `ivent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23  9:21:13
