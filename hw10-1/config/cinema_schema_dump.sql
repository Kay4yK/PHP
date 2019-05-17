CREATE DATABASE  IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `cinema`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cinema
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.36-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hall` (
  `hall_id` int(10) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) unsigned NOT NULL,
  PRIMARY KEY (`hall_id`),
  UNIQUE KEY `cinema_hall_id_UNIQUE` (`hall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (1,'Малый зал',48),(2,'Средний зал',96),(3,'Большой зал',200),(4,'VIP зал',20);
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `movie_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`movie_id`),
  UNIQUE KEY `movie_id_UNIQUE` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Мстители'),(2,'Веном');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) unsigned NOT NULL,
  `begin_time` datetime NOT NULL,
  `hall_id` int(11) unsigned NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  UNIQUE KEY `movie_schedule_id_UNIQUE` (`schedule_id`),
  KEY `fk_movie_idx` (`movie_id`),
  KEY `fk_hall_idx` (`hall_id`),
  CONSTRAINT `fk_schedule_hall` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`hall_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,'2019-05-05 21:00:00',1,300),(2,1,'2019-05-05 15:00:00',2,200),(3,1,'2019-05-05 12:00:00',3,180),(4,1,'2019-05-05 23:00:00',4,400),(5,2,'2019-05-06 20:00:00',3,300),(6,2,'2019-05-06 18:00:00',4,250);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seat` (
  `seat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hall_id` int(11) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `row` int(11) unsigned NOT NULL,
  PRIMARY KEY (`seat_id`),
  UNIQUE KEY `seat_id_UNIQUE` (`seat_id`),
  KEY `fk_seat_hall_idx` (`hall_id`),
  CONSTRAINT `fk_seat_hall` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`hall_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,5,1),(6,1,6,1),(7,1,1,2),(8,1,2,2),(9,1,3,2),(10,1,4,2),(11,1,5,2),(12,1,6,2),(13,1,1,3),(14,1,2,3),(15,1,3,3),(16,1,4,3),(17,1,5,3),(18,1,6,3),(19,1,1,4),(20,1,2,4),(21,1,3,4),(22,1,4,4),(23,1,5,4),(24,1,6,4),(25,1,1,5),(26,1,2,5),(27,1,3,5),(28,1,4,5),(29,1,5,5),(30,1,6,5),(31,1,1,6),(32,1,2,6),(33,1,3,6),(34,1,4,6),(35,1,5,6),(36,1,6,6),(37,1,1,7),(38,1,2,7),(39,1,3,7),(40,1,4,7),(41,1,5,7),(42,1,6,7),(43,1,1,8),(44,1,2,8),(45,1,3,8),(46,1,4,8),(47,1,5,8),(48,1,6,8),(49,2,1,1),(50,2,2,1),(51,2,3,1),(52,2,4,1),(53,2,5,1),(54,2,6,1),(55,2,7,1),(56,2,8,1),(57,2,1,2),(58,2,2,2),(59,2,3,2),(60,2,4,2),(61,2,5,2),(62,2,6,2),(63,2,7,2),(64,2,8,2),(65,2,1,3),(66,2,2,3),(67,2,3,3),(68,2,4,3),(69,2,5,3),(70,2,6,3),(71,2,7,3),(72,2,8,3),(73,2,1,4),(74,2,2,4),(75,2,3,4),(76,2,4,4),(77,2,5,4),(78,2,6,4),(79,2,7,4),(80,2,8,4),(81,2,1,5),(82,2,2,5),(83,2,3,5),(84,2,4,5),(85,2,5,5),(86,2,6,5),(87,2,7,5),(88,2,8,5),(89,2,1,6),(90,2,2,6),(91,2,3,6),(92,2,4,6),(93,2,5,6),(94,2,6,6),(95,2,7,6),(96,2,8,6),(97,2,1,7),(98,2,2,7),(99,2,3,7),(100,2,4,7),(101,2,5,7),(102,2,6,7),(103,2,7,7),(104,2,8,7),(105,2,1,8),(106,2,2,8),(107,2,3,8),(108,2,4,8),(109,2,5,8),(110,2,6,8),(111,2,7,8),(112,2,8,8),(113,2,1,9),(114,2,2,9),(115,2,3,9),(116,2,4,9),(117,2,5,9),(118,2,6,9),(119,2,7,9),(120,2,8,9),(121,2,1,10),(122,2,2,10),(123,2,3,10),(124,2,4,10),(125,2,5,10),(126,2,6,10),(127,2,7,10),(128,2,8,10),(129,2,1,11),(130,2,2,11),(131,2,3,11),(132,2,4,11),(133,2,5,11),(134,2,6,11),(135,2,7,11),(136,2,8,11),(137,2,1,12),(138,2,2,12),(139,2,3,12),(140,2,4,12),(141,2,5,12),(142,2,6,12),(143,2,7,12),(144,2,8,12),(145,3,1,1),(146,3,2,1),(147,3,3,1),(148,3,4,1),(149,3,5,1),(150,3,6,1),(151,3,7,1),(152,3,8,1),(153,3,9,1),(154,3,10,1),(155,3,1,2),(156,3,2,2),(157,3,3,2),(158,3,4,2),(159,3,5,2),(160,3,6,2),(161,3,7,2),(162,3,8,2),(163,3,9,2),(164,3,10,2),(165,3,1,3),(166,3,2,3),(167,3,3,3),(168,3,4,3),(169,3,5,3),(170,3,6,3),(171,3,7,3),(172,3,8,3),(173,3,9,3),(174,3,10,3),(175,3,1,4),(176,3,2,4),(177,3,3,4),(178,3,4,4),(179,3,5,4),(180,3,6,4),(181,3,7,4),(182,3,8,4),(183,3,9,4),(184,3,10,4),(185,3,1,5),(186,3,2,5),(187,3,3,5),(188,3,4,5),(189,3,5,5),(190,3,6,5),(191,3,7,5),(192,3,8,5),(193,3,9,5),(194,3,10,5),(195,3,1,6),(196,3,2,6),(197,3,3,6),(198,3,4,6),(199,3,5,6),(200,3,6,6),(201,3,7,6),(202,3,8,6),(203,3,9,6),(204,3,10,6),(205,3,1,7),(206,3,2,7),(207,3,3,7),(208,3,4,7),(209,3,5,7),(210,3,6,7),(211,3,7,7),(212,3,8,7),(213,3,9,7),(214,3,10,7),(215,3,1,8),(216,3,2,8),(217,3,3,8),(218,3,4,8),(219,3,5,8),(220,3,6,8),(221,3,7,8),(222,3,8,8),(223,3,9,8),(224,3,10,8),(225,3,1,9),(226,3,2,9),(227,3,3,9),(228,3,4,9),(229,3,5,9),(230,3,6,9),(231,3,7,9),(232,3,8,9),(233,3,9,9),(234,3,10,9),(235,3,1,10),(236,3,2,10),(237,3,3,10),(238,3,4,10),(239,3,5,10),(240,3,6,10),(241,3,7,10),(242,3,8,10),(243,3,9,10),(244,3,10,10),(245,3,1,11),(246,3,2,11),(247,3,3,11),(248,3,4,11),(249,3,5,11),(250,3,6,11),(251,3,7,11),(252,3,8,11),(253,3,9,11),(254,3,10,11),(255,3,1,12),(256,3,2,12),(257,3,3,12),(258,3,4,12),(259,3,5,12),(260,3,6,12),(261,3,7,12),(262,3,8,12),(263,3,9,12),(264,3,10,12),(265,3,1,13),(266,3,2,13),(267,3,3,13),(268,3,4,13),(269,3,5,13),(270,3,6,13),(271,3,7,13),(272,3,8,13),(273,3,9,13),(274,3,10,13),(275,3,1,14),(276,3,2,14),(277,3,3,14),(278,3,4,14),(279,3,5,14),(280,3,6,14),(281,3,7,14),(282,3,8,14),(283,3,9,14),(284,3,10,14),(285,3,1,15),(286,3,2,15),(287,3,3,15),(288,3,4,15),(289,3,5,15),(290,3,6,15),(291,3,7,15),(292,3,8,15),(293,3,9,15),(294,3,10,15),(295,3,1,16),(296,3,2,16),(297,3,3,16),(298,3,4,16),(299,3,5,16),(300,3,6,16),(301,3,7,16),(302,3,8,16),(303,3,9,16),(304,3,10,16),(305,3,1,17),(306,3,2,17),(307,3,3,17),(308,3,4,17),(309,3,5,17),(310,3,6,17),(311,3,7,17),(312,3,8,17),(313,3,9,17),(314,3,10,17),(315,3,1,18),(316,3,2,18),(317,3,3,18),(318,3,4,18),(319,3,5,18),(320,3,6,18),(321,3,7,18),(322,3,8,18),(323,3,9,18),(324,3,10,18),(325,3,1,19),(326,3,2,19),(327,3,3,19),(328,3,4,19),(329,3,5,19),(330,3,6,19),(331,3,7,19),(332,3,8,19),(333,3,9,19),(334,3,10,19),(335,3,1,20),(336,3,2,20),(337,3,3,20),(338,3,4,20),(339,3,5,20),(340,3,6,20),(341,3,7,20),(342,3,8,20),(343,3,9,20),(344,3,10,20),(345,4,1,1),(346,4,1,2),(347,4,1,3),(348,4,1,4),(349,4,2,1),(350,4,2,2),(351,4,2,3),(352,4,2,4),(353,4,3,1),(354,4,3,2),(355,4,3,3),(356,4,3,4),(357,4,4,1),(358,4,4,2),(359,4,4,3),(360,4,4,4),(361,4,5,1),(362,4,5,2),(363,4,5,3),(364,4,5,4);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `ticket_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_status_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `schedule_id` int(11) unsigned NOT NULL,
  `seat_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `ticket_id_UNIQUE` (`ticket_id`),
  KEY `fk_seat_idx` (`seat_id`),
  KEY `fk_ticket_schedule_idx` (`schedule_id`),
  KEY `fk_ticket_ticket_status_idx` (`ticket_status_id`),
  CONSTRAINT `fk_ticket_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_seat` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_ticket_status` FOREIGN KEY (`ticket_status_id`) REFERENCES `ticket_status` (`ticket_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=787 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,1),(2,0,1,2),(3,0,1,3),(4,0,1,4),(5,0,1,5),(6,0,1,6),(7,0,1,7),(8,0,1,8),(9,0,1,9),(10,0,1,10),(11,0,1,11),(12,0,1,12),(13,0,1,13),(14,0,1,14),(15,0,1,15),(16,0,1,16),(17,0,1,17),(18,0,1,18),(19,0,1,19),(20,0,1,20),(21,0,1,21),(22,0,1,22),(23,0,1,23),(24,0,1,24),(25,0,1,25),(26,0,1,26),(27,0,1,27),(28,0,1,28),(29,0,1,29),(30,0,1,30),(31,0,1,31),(32,0,1,32),(33,0,1,33),(34,0,1,34),(35,0,1,35),(36,0,1,36),(37,0,1,37),(38,0,1,38),(39,0,1,39),(40,0,1,40),(41,0,1,41),(42,0,1,42),(43,0,1,43),(44,0,1,44),(45,0,1,45),(46,0,1,46),(47,0,1,47),(48,0,1,48),(49,0,2,49),(50,0,2,50),(51,0,2,51),(52,0,2,52),(53,0,2,53),(54,0,2,54),(55,0,2,55),(56,0,2,56),(57,0,2,57),(58,0,2,58),(59,0,2,59),(60,0,2,60),(61,0,2,61),(62,0,2,62),(63,0,2,63),(64,0,2,64),(65,0,2,65),(66,0,2,66),(67,0,2,67),(68,0,2,68),(69,0,2,69),(70,0,2,70),(71,0,2,71),(72,0,2,72),(73,0,2,73),(74,0,2,74),(75,0,2,75),(76,0,2,76),(77,0,2,77),(78,0,2,78),(79,0,2,79),(80,0,2,80),(81,0,2,81),(82,0,2,82),(83,0,2,83),(84,0,2,84),(85,0,2,85),(86,0,2,86),(87,0,2,87),(88,0,2,88),(89,0,2,89),(90,0,2,90),(91,0,2,91),(92,0,2,92),(93,0,2,93),(94,0,2,94),(95,0,2,95),(96,0,2,96),(97,0,2,97),(98,0,2,98),(99,0,2,99),(100,0,2,100),(101,0,2,101),(102,0,2,102),(103,0,2,103),(104,0,2,104),(105,0,2,105),(106,0,2,106),(107,0,2,107),(108,0,2,108),(109,0,2,109),(110,0,2,110),(111,0,2,111),(112,0,2,112),(113,0,2,113),(114,0,2,114),(115,0,2,115),(116,0,2,116),(117,0,2,117),(118,0,2,118),(119,0,2,119),(120,0,2,120),(121,0,2,121),(122,0,2,122),(123,0,2,123),(124,0,2,124),(125,0,2,125),(126,0,2,126),(127,0,2,127),(128,0,2,128),(129,0,2,129),(130,0,2,130),(131,0,2,131),(132,0,2,132),(133,0,2,133),(134,0,2,134),(135,0,2,135),(136,0,2,136),(137,0,2,137),(138,0,2,138),(139,0,2,139),(140,0,2,140),(141,0,2,141),(142,0,2,142),(143,0,2,143),(144,0,2,144),(145,0,3,145),(146,0,3,146),(147,0,3,147),(148,0,3,148),(149,0,3,149),(150,0,3,150),(151,0,3,151),(152,0,3,152),(153,0,3,153),(154,0,3,154),(155,0,3,155),(156,0,3,156),(157,0,3,157),(158,0,3,158),(159,0,3,159),(160,0,3,160),(161,0,3,161),(162,0,3,162),(163,0,3,163),(164,0,3,164),(165,0,3,165),(166,0,3,166),(167,0,3,167),(168,0,3,168),(169,0,3,169),(170,0,3,170),(171,0,3,171),(172,0,3,172),(173,0,3,173),(174,0,3,174),(175,0,3,175),(176,0,3,176),(177,0,3,177),(178,0,3,178),(179,0,3,179),(180,0,3,180),(181,0,3,181),(182,0,3,182),(183,0,3,183),(184,0,3,184),(185,0,3,185),(186,0,3,186),(187,0,3,187),(188,0,3,188),(189,0,3,189),(190,0,3,190),(191,0,3,191),(192,0,3,192),(193,0,3,193),(194,0,3,194),(195,0,3,195),(196,0,3,196),(197,0,3,197),(198,0,3,198),(199,0,3,199),(200,0,3,200),(201,0,3,201),(202,0,3,202),(203,0,3,203),(204,0,3,204),(205,0,3,205),(206,0,3,206),(207,0,3,207),(208,0,3,208),(209,0,3,209),(210,0,3,210),(211,0,3,211),(212,0,3,212),(213,0,3,213),(214,0,3,214),(215,0,3,215),(216,0,3,216),(217,0,3,217),(218,0,3,218),(219,0,3,219),(220,0,3,220),(221,0,3,221),(222,0,3,222),(223,0,3,223),(224,0,3,224),(225,0,3,225),(226,0,3,226),(227,0,3,227),(228,0,3,228),(229,0,3,229),(230,0,3,230),(231,0,3,231),(232,0,3,232),(233,0,3,233),(234,0,3,234),(235,0,3,235),(236,0,3,236),(237,0,3,237),(238,0,3,238),(239,0,3,239),(240,0,3,240),(241,0,3,241),(242,0,3,242),(243,0,3,243),(244,0,3,244),(245,0,3,245),(246,0,3,246),(247,0,3,247),(248,0,3,248),(249,0,3,249),(250,0,3,250),(251,0,3,251),(252,0,3,252),(253,0,3,253),(254,0,3,254),(255,0,3,255),(256,0,3,256),(257,0,3,257),(258,0,3,258),(259,0,3,259),(260,0,3,260),(261,0,3,261),(262,0,3,262),(263,0,3,263),(264,0,3,264),(265,0,3,265),(266,0,3,266),(267,0,3,267),(268,0,3,268),(269,0,3,269),(270,0,3,270),(271,0,3,271),(272,0,3,272),(273,0,3,273),(274,0,3,274),(275,0,3,275),(276,0,3,276),(277,0,3,277),(278,0,3,278),(279,0,3,279),(280,0,3,280),(281,0,3,281),(282,0,3,282),(283,0,3,283),(284,0,3,284),(285,0,3,285),(286,0,3,286),(287,0,3,287),(288,0,3,288),(289,0,3,289),(290,0,3,290),(291,0,3,291),(292,0,3,292),(293,0,3,293),(294,0,3,294),(295,0,3,295),(296,0,3,296),(297,0,3,297),(298,0,3,298),(299,0,3,299),(300,0,3,300),(301,0,3,301),(302,0,3,302),(303,0,3,303),(304,0,3,304),(305,0,3,305),(306,0,3,306),(307,0,3,307),(308,0,3,308),(309,0,3,309),(310,0,3,310),(311,0,3,311),(312,0,3,312),(313,0,3,313),(314,0,3,314),(315,0,3,315),(316,0,3,316),(317,0,3,317),(318,0,3,318),(319,0,3,319),(320,0,3,320),(321,0,3,321),(322,0,3,322),(323,0,3,323),(324,0,3,324),(325,0,3,325),(326,0,3,326),(327,0,3,327),(328,0,3,328),(329,0,3,329),(330,0,3,330),(331,0,3,331),(332,0,3,332),(333,0,3,333),(334,0,3,334),(335,0,3,335),(336,0,3,336),(337,0,3,337),(338,0,3,338),(339,0,3,339),(340,0,3,340),(341,0,3,341),(342,0,3,342),(343,0,3,343),(344,0,3,344),(345,0,4,345),(346,0,4,346),(347,0,4,347),(348,0,4,348),(349,0,4,349),(350,0,4,350),(351,0,4,351),(352,0,4,352),(353,0,4,353),(354,0,4,354),(355,0,4,355),(356,0,4,356),(357,0,4,357),(358,0,4,358),(359,0,4,359),(360,0,4,360),(361,0,4,361),(362,0,4,362),(363,0,4,363),(364,0,4,364),(512,0,5,145),(513,0,5,146),(514,0,5,147),(515,0,5,148),(516,0,5,149),(517,0,5,150),(518,0,5,151),(519,0,5,152),(520,0,5,153),(521,0,5,154),(522,0,5,155),(523,0,5,156),(524,0,5,157),(525,0,5,158),(526,0,5,159),(527,0,5,160),(528,0,5,161),(529,0,5,162),(530,0,5,163),(531,0,5,164),(532,0,5,165),(533,0,5,166),(534,0,5,167),(535,0,5,168),(536,0,5,169),(537,0,5,170),(538,0,5,171),(539,0,5,172),(540,0,5,173),(541,0,5,174),(542,0,5,175),(543,0,5,176),(544,0,5,177),(545,0,5,178),(546,0,5,179),(547,0,5,180),(548,0,5,181),(549,0,5,182),(550,0,5,183),(551,0,5,184),(552,0,5,185),(553,0,5,186),(554,0,5,187),(555,0,5,188),(556,0,5,189),(557,0,5,190),(558,0,5,191),(559,0,5,192),(560,0,5,193),(561,0,5,194),(562,0,5,195),(563,0,5,196),(564,0,5,197),(565,0,5,198),(566,0,5,199),(567,0,5,200),(568,0,5,201),(569,0,5,202),(570,0,5,203),(571,0,5,204),(572,0,5,205),(573,0,5,206),(574,0,5,207),(575,0,5,208),(576,0,5,209),(577,0,5,210),(578,0,5,211),(579,0,5,212),(580,0,5,213),(581,0,5,214),(582,0,5,215),(583,0,5,216),(584,0,5,217),(585,0,5,218),(586,0,5,219),(587,0,5,220),(588,0,5,221),(589,0,5,222),(590,0,5,223),(591,0,5,224),(592,0,5,225),(593,0,5,226),(594,0,5,227),(595,0,5,228),(596,0,5,229),(597,0,5,230),(598,0,5,231),(599,0,5,232),(600,0,5,233),(601,0,5,234),(602,0,5,235),(603,0,5,236),(604,0,5,237),(605,0,5,238),(606,0,5,239),(607,0,5,240),(608,0,5,241),(609,0,5,242),(610,0,5,243),(611,0,5,244),(612,0,5,245),(613,0,5,246),(614,0,5,247),(615,0,5,248),(616,0,5,249),(617,0,5,250),(618,0,5,251),(619,0,5,252),(620,0,5,253),(621,0,5,254),(622,0,5,255),(623,0,5,256),(624,0,5,257),(625,0,5,258),(626,0,5,259),(627,0,5,260),(628,0,5,261),(629,0,5,262),(630,0,5,263),(631,0,5,264),(632,0,5,265),(633,0,5,266),(634,0,5,267),(635,0,5,268),(636,0,5,269),(637,0,5,270),(638,0,5,271),(639,0,5,272),(640,0,5,273),(641,0,5,274),(642,0,5,275),(643,0,5,276),(644,0,5,277),(645,0,5,278),(646,0,5,279),(647,0,5,280),(648,0,5,281),(649,0,5,282),(650,0,5,283),(651,0,5,284),(652,0,5,285),(653,0,5,286),(654,0,5,287),(655,0,5,288),(656,0,5,289),(657,0,5,290),(658,0,5,291),(659,0,5,292),(660,0,5,293),(661,0,5,294),(662,0,5,295),(663,0,5,296),(664,0,5,297),(665,0,5,298),(666,0,5,299),(667,0,5,300),(668,0,5,301),(669,0,5,302),(670,0,5,303),(671,0,5,304),(672,0,5,305),(673,0,5,306),(674,0,5,307),(675,0,5,308),(676,0,5,309),(677,0,5,310),(678,0,5,311),(679,0,5,312),(680,0,5,313),(681,0,5,314),(682,0,5,315),(683,0,5,316),(684,0,5,317),(685,0,5,318),(686,0,5,319),(687,0,5,320),(688,0,5,321),(689,0,5,322),(690,0,5,323),(691,0,5,324),(692,0,5,325),(693,0,5,326),(694,0,5,327),(695,0,5,328),(696,0,5,329),(697,0,5,330),(698,0,5,331),(699,0,5,332),(700,0,5,333),(701,0,5,334),(702,0,5,335),(703,0,5,336),(704,0,5,337),(705,0,5,338),(706,0,5,339),(707,0,5,340),(708,0,5,341),(709,0,5,342),(710,0,5,343),(711,0,5,344),(767,0,6,345),(768,0,6,346),(769,0,6,347),(770,0,6,348),(771,0,6,349),(772,0,6,350),(773,0,6,351),(774,0,6,352),(775,0,6,353),(776,0,6,354),(777,0,6,355),(778,0,6,356),(779,0,6,357),(780,0,6,358),(781,0,6,359),(782,0,6,360),(783,0,6,361),(784,0,6,362),(785,0,6,363),(786,1,6,364);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_status`
--

DROP TABLE IF EXISTS `ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_status` (
  `ticket_status_id` tinyint(3) unsigned NOT NULL,
  `ticket_status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ticket_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_status`
--

LOCK TABLES `ticket_status` WRITE;
/*!40000 ALTER TABLE `ticket_status` DISABLE KEYS */;
INSERT INTO `ticket_status` VALUES (0,'available'),(1,'sold');
/*!40000 ALTER TABLE `ticket_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cinema'
--

--
-- Dumping routines for database 'cinema'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-17 18:47:48
