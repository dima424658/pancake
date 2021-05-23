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
-- Table structure for table `rentalpoint`
--

DROP TABLE IF EXISTS `rentalpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentalpoint` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `PointOwnerId` int NOT NULL,
  `OpenTime` time NOT NULL,
  `CloseTime` time NOT NULL,
  `Latitude` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Longitude` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PointName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `PointOwnerId` (`PointOwnerId`),
  CONSTRAINT `rentalpoint_ibfk_1` FOREIGN KEY (`PointOwnerId`) REFERENCES `pointowner` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentalpoint`
--

LOCK TABLES `rentalpoint` WRITE;
/*!40000 ALTER TABLE `rentalpoint` DISABLE KEYS */;
INSERT INTO `rentalpoint` VALUES (1,1,'09:00:00','21:00:00','66.087748','76.671608','Самокат','Новый Уренгой, Железнодорожная улица, 6Б'),(2,2,'10:00:00','21:00:00','66.528765','66.622545','Velorent','Салехард, улица Матросова, 7к1'),(3,3,'10:00:00','21:00:00','66.542063','66.590658','Ямал Мото','Салехард, улица Богдана Кнунянца, 25'),(4,4,'09:00:00','18:00:00','66.109791','76.684531','Тюбинг Центр','Новый Уренгой, улица Захаренкова, 5/6'),(5,6,'09:00:00','17:00:00','66.087749','76.676580','Виадук','Новый Уренгой, улица 26-го съезда КПСС, 4');
/*!40000 ALTER TABLE `rentalpoint` ENABLE KEYS */;
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
