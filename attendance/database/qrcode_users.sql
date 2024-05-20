-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: qrcode
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phno` bigint NOT NULL,
  `address` varchar(255) NOT NULL,
  `uid` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dept` varchar(50) DEFAULT NULL,
  `attendance_status` varchar(10) DEFAULT 'Wait',
  `attendance` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image_data` mediumblob,
  `image_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dd','t','subasri32@gmail.com',643764376,'naduveerapattu','4','111','cs','Present',0,'2024-01-13 01:26:04','2024-01-25 10:49:02',NULL,NULL),(2,'vijaiyashanthi','R','viji@gmail.com',9360315418,'31,north st,kumbakonam road , cuddalore','1001','1001','BCA','Present',0,'2024-01-13 01:26:04','2024-01-22 06:31:04',NULL,'arthi.png'),(7,'subasri','R','arthi',67897804,'256,thirunavukarasar st, thiruvamoor','1004','678','B.Ed','Present',0,'2024-01-13 01:26:04','2024-01-13 01:26:04',NULL,NULL),(8,'subasri67','R','arthi',67897804,'256,thirunavukarasar st, thiruvamoor','100','56','B.Ed','Present',0,'2024-01-13 01:26:04','2024-01-22 06:31:49',NULL,'arthi.png'),(9,'aneha','arthi','arthi@gmail.com',9360315418,'31,north st,kumbakonam road , cuddalore','7','7','BCA','Present',0,'2024-01-13 01:38:00','2024-01-22 06:30:07',NULL,'arthi.png'),(10,'Kayalvizhi','k','kayal1289@gmail.com',9645835275,'45,west st,madurai','1000','1','MCA','Present',0,'2024-01-25 04:42:13','2024-01-25 04:42:57',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 10:05:20
