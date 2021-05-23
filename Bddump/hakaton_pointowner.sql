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
-- Table structure for table `pointowner`
--

DROP TABLE IF EXISTS `pointowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pointowner` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SurName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CompanyName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Phone` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Mail` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Mkey` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Phone` (`Phone`),
  UNIQUE KEY `Mail` (`Mail`),
  UNIQUE KEY `Mkey` (`Mkey`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pointowner`
--

LOCK TABLES `pointowner` WRITE;
/*!40000 ALTER TABLE `pointowner` DISABLE KEYS */;
INSERT INTO `pointowner` VALUES (1,'Радионов','Георгий','Самокат','+79224567281','samokat1234@gmail.com','gswogj8g232g94gjsoi98'),(2,'Александров','Егор','Velorent','+79254321122','velorent@gmail.com','sjg8yq873hfduig782gunwi73'),(3,'Еремин','Петр','Ямал Мото','+79253214552','motoyamal@gmail.com','sjg8yq873hfdghr82gunwi73'),(4,'Иванов','Сергей','Тюбинг Центр','+79222889779','tybingcentr@gmail.com','fj328hgf372hf222fg3gfsufgip'),(6,'Петров','Ярослав','Виадук','+79222889129','viadyk@gmail.com','fj328hgf372hfsh22g3iklsp');
/*!40000 ALTER TABLE `pointowner` ENABLE KEYS */;
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
