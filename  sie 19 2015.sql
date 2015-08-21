-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: serwis_v8
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `czesci`
--

DROP TABLE IF EXISTS `czesci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `czesci` (
  `idCzesci` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nazwa_Czesci` varchar(200) NOT NULL,
  `nr_Czesci` varchar(200) DEFAULT NULL,
  `dataProdukcji_Czesci` date DEFAULT NULL,
  `dataGwarancji_Czesci` date DEFAULT NULL,
  `DTRLink_Czesci` varchar(200) DEFAULT NULL,
  `Kooperant_Czesci` varchar(1000) NOT NULL,
  PRIMARY KEY (`idCzesci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `czesci`
--

LOCK TABLES `czesci` WRITE;
/*!40000 ALTER TABLE `czesci` DISABLE KEYS */;
/*!40000 ALTER TABLE `czesci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `czesci_maszyny_widok`
--

DROP TABLE IF EXISTS `czesci_maszyny_widok`;
/*!50001 DROP VIEW IF EXISTS `czesci_maszyny_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `czesci_maszyny_widok` AS SELECT 
 1 AS `Część`,
 1 AS `Nr części`,
 1 AS `Data produkcji`,
 1 AS `Data gwarancji`,
 1 AS `DTR Link`,
 1 AS `Miejsce kooperanta`,
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `czesci_widok`
--

DROP TABLE IF EXISTS `czesci_widok`;
/*!50001 DROP VIEW IF EXISTS `czesci_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `czesci_widok` AS SELECT 
 1 AS `Część`,
 1 AS `Nr części`,
 1 AS `Data produkcji`,
 1 AS `Data gwarancji`,
 1 AS `DTR Link`,
 1 AS `Miejsce kooperanta`,
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `daneosobowe`
--

DROP TABLE IF EXISTS `daneosobowe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daneosobowe` (
  `idDaneosobowe` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imie_Daneosobowe` varchar(45) NOT NULL,
  `nazwisko_Daneosobowe` varchar(45) NOT NULL,
  `telefon_Daneosobowe` varchar(45) DEFAULT NULL,
  `email_Daneosobowe` varchar(100) DEFAULT NULL,
  `opis_Daneosobowe` varchar(500) DEFAULT NULL,
  `miejsce_Daneosobowe` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`idDaneosobowe`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daneosobowe`
--

LOCK TABLES `daneosobowe` WRITE;
/*!40000 ALTER TABLE `daneosobowe` DISABLE KEYS */;
INSERT INTO `daneosobowe` VALUES (16,'Robert','Sawa',NULL,NULL,'MD-3','Bogdanka'),(17,'Dariusz ','Wyrębek',NULL,NULL,'MD-2','Bogdanka');
/*!40000 ALTER TABLE `daneosobowe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `daneosobowe_maszyny_widok`
--

DROP TABLE IF EXISTS `daneosobowe_maszyny_widok`;
/*!50001 DROP VIEW IF EXISTS `daneosobowe_maszyny_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `daneosobowe_maszyny_widok` AS SELECT 
 1 AS `Imię`,
 1 AS `Nazwisko`,
 1 AS `Telefon`,
 1 AS `E-mail`,
 1 AS `Opis`,
 1 AS `Miejsce kooperanta`,
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `daneosobowe_miejsca_widok`
--

DROP TABLE IF EXISTS `daneosobowe_miejsca_widok`;
/*!50001 DROP VIEW IF EXISTS `daneosobowe_miejsca_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `daneosobowe_miejsca_widok` AS SELECT 
 1 AS `Imię`,
 1 AS `Nazwisko`,
 1 AS `Telefon`,
 1 AS `E-mail`,
 1 AS `Opis`,
 1 AS `Miejsce kooperanta`,
 1 AS `Miejsce maszyny`,
 1 AS `Dział`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `daneosobowe_widok`
--

DROP TABLE IF EXISTS `daneosobowe_widok`;
/*!50001 DROP VIEW IF EXISTS `daneosobowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `daneosobowe_widok` AS SELECT 
 1 AS `Imię`,
 1 AS `Nazwisko`,
 1 AS `Telefon`,
 1 AS `E-mail`,
 1 AS `Opis`,
 1 AS `Miejsce kooperanta`,
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `konkurencja`
--

DROP TABLE IF EXISTS `konkurencja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konkurencja` (
  `idKonkurencja` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nazwa_Konkurencja` varchar(200) DEFAULT NULL,
  `opis_Konkurencja` varchar(500) DEFAULT NULL,
  `historia_Konkurencja` varchar(200) DEFAULT NULL,
  `idMaszyny_Konkurencja` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idKonkurencja`),
  KEY `fk_Konkurencja_Maszyny1_idx` (`idMaszyny_Konkurencja`),
  CONSTRAINT `fk_Konkurencja_Maszyny1` FOREIGN KEY (`idMaszyny_Konkurencja`) REFERENCES `maszyny` (`idMaszyny`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konkurencja`
--

LOCK TABLES `konkurencja` WRITE;
/*!40000 ALTER TABLE `konkurencja` DISABLE KEYS */;
/*!40000 ALTER TABLE `konkurencja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `konkurencja_widok`
--

DROP TABLE IF EXISTS `konkurencja_widok`;
/*!50001 DROP VIEW IF EXISTS `konkurencja_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `konkurencja_widok` AS SELECT 
 1 AS `Konkurencja`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `maszyny`
--

DROP TABLE IF EXISTS `maszyny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maszyny` (
  `idMaszyny` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nazwa_Maszyny` varchar(200) NOT NULL,
  `nrFabryczny_Maszyny` varchar(250) NOT NULL,
  `idMiejsca_Maszyny` int(10) unsigned DEFAULT '0',
  `opis_Maszyny` varchar(200) DEFAULT NULL,
  `historia_Maszyny` varchar(200) DEFAULT NULL,
  `idZlecenia_Maszyny` int(10) unsigned DEFAULT '0',
  `czyAktywna_Maszyny` enum('A','N') NOT NULL,
  `koniecGwarancji_Maszyny` date DEFAULT NULL,
  `dokumentacjaLink_Maszyny` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idMaszyny`),
  KEY `fk_Maszyny_Zlecenia1_idx` (`idZlecenia_Maszyny`),
  KEY `fk_Maszyny_Miejsca1_idx` (`idMiejsca_Maszyny`),
  CONSTRAINT `fk_Maszyny_Miejsca1` FOREIGN KEY (`idMiejsca_Maszyny`) REFERENCES `miejsca` (`idMiejsca`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Maszyny_Zlecenia1` FOREIGN KEY (`idZlecenia_Maszyny`) REFERENCES `zlecenia` (`idZlecenia`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1073 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maszyny`
--

LOCK TABLES `maszyny` WRITE;
/*!40000 ALTER TABLE `maszyny` DISABLE KEYS */;
INSERT INTO `maszyny` VALUES (0,'BRAK','BRAK',0,'BRAK',NULL,0,'N','2000-01-01','BRAK'),(1,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(2,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(3,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(4,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(5,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(6,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(7,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(8,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(9,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(10,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(11,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(12,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(13,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(14,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(15,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(16,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(17,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(18,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(19,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(20,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(21,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(22,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(23,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(24,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(25,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(26,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(27,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(28,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(29,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(30,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(31,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(32,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(33,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(34,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(35,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(36,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(37,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(38,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(39,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(40,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(41,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(42,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(43,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(44,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(45,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(46,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(47,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(48,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(49,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(50,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(51,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(52,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(53,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(54,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(55,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(56,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(57,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(58,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(59,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(60,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(61,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(62,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(63,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(64,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(65,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(66,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(67,'Anakonda','A1/2015',23,'opis',NULL,0,'A',NULL,'link A1/2015 dokumentacja'),(68,'Anakonda','A2/2015',23,'opist',NULL,0,'A',NULL,'link A2/2015 dokumentacja'),(69,'PDK','PDK1/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(70,'PDK','PDK2/2015',23,'opis',NULL,0,'A',NULL,'link PDK1/2015 dokumentacja'),(71,'Elektrownia','E1/2015',23,'opis',NULL,0,'A',NULL,'link E1/2015 dokumentacja'),(72,'Elektrownia','E2/2015',23,'opis',NULL,0,'A',NULL,'link E2/2015 dokumentacja'),(73,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(74,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(75,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(76,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(77,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(78,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(79,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(80,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(81,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(82,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(83,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(84,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(85,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(86,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(87,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(88,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(89,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(90,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(91,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(92,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(93,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(94,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(95,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(96,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(97,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(98,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(99,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(100,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(101,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(102,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(103,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(104,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(105,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(106,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(107,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(108,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(109,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(110,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(111,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(112,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(113,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(114,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(115,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(116,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(117,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(118,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(119,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(120,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(121,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(122,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(123,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(124,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(125,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(126,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(127,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(128,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(129,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(130,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(131,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(132,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(133,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(134,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(135,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(136,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(137,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(138,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(139,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(140,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(141,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(142,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(143,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(144,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(145,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(146,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(147,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(148,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(149,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(150,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(151,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(152,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(153,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(154,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(155,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(156,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(157,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(158,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(159,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(160,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(161,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(162,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(163,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(164,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(165,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(166,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(167,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(168,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(169,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(170,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(171,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(172,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(173,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(174,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(175,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(176,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(177,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(178,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(179,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(180,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(181,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(182,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(183,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(184,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(185,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(186,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(187,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(188,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(189,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(190,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(191,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(192,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(193,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(194,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(195,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(196,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(197,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(198,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(199,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(200,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(201,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(202,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(203,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(204,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(205,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(206,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(207,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(208,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(209,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(210,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(211,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(212,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(213,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(214,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(215,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(216,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(217,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(218,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(219,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(220,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(221,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(222,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(223,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(224,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(225,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(226,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(227,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(228,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(229,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(230,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(231,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(232,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(233,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(234,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(235,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(236,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(237,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(238,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(239,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(240,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(241,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(242,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(243,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(244,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(245,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(246,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(247,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(248,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(249,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(250,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(251,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(252,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(253,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(254,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(255,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(256,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(257,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(258,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(259,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(260,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(261,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(262,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(263,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(264,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(265,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(266,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(267,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(268,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(269,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(270,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(271,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(272,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(273,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(274,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(275,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(276,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(277,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(278,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(279,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(280,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(281,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(282,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(283,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(284,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(285,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(286,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(287,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(288,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(289,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(290,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(291,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(292,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(293,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(294,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(295,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(296,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(297,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(298,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(299,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(300,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(301,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(302,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(303,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(304,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(305,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(306,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(307,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(308,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(309,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(310,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(311,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(312,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(313,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(314,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(315,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(316,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(317,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(318,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(319,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(320,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(321,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(322,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(323,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(324,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(325,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(326,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(327,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(328,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(329,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(330,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(331,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(332,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(333,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(334,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(335,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(336,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(337,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(338,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(339,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(340,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(341,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(342,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(343,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(344,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(345,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(346,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(347,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(348,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(349,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(350,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(351,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(352,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(353,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(354,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(355,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(356,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(357,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(358,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(359,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(360,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(361,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(362,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(363,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(364,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(365,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(366,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(367,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(368,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(369,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(370,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(371,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(372,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(373,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(374,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(375,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(376,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(377,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(378,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(379,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(380,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(381,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(382,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(383,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(384,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(385,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(386,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(387,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(388,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(389,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(390,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(391,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(392,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(393,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(394,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(395,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(396,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(397,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(398,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(399,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(400,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(401,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(402,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(403,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(404,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(405,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(406,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(407,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(408,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(409,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(410,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(411,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(412,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(413,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(414,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(415,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(416,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(417,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(418,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(419,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(420,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(421,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(422,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(423,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(424,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(425,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(426,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(427,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(428,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(429,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(430,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(431,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(432,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(433,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(434,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(435,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(436,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(437,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(438,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(439,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(440,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(441,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(442,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(443,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(444,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(445,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(446,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(447,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(448,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(449,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(450,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(451,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(452,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(453,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(454,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(455,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(456,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(457,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(458,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(459,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(460,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(461,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(462,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(463,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(464,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(465,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(466,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(467,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(468,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(469,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(470,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(471,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(472,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(473,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(474,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(475,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(476,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(477,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(478,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(479,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(480,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(481,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(482,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(483,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(484,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(485,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(486,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(487,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(488,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(489,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(490,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(491,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(492,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(493,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(494,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(495,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(496,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(497,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(498,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(499,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(500,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(501,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(502,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(503,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(504,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(505,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(506,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(507,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(508,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(509,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(510,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(511,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(512,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(513,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(514,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(515,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(516,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(517,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(518,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(519,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(520,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(521,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(522,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(523,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(524,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(525,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(526,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(527,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(528,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(529,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(530,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(531,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(532,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(533,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(534,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(535,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(536,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(537,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(538,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(539,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(540,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(541,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(542,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(543,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(544,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(545,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(546,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(547,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(548,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(549,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(550,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(551,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(552,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(553,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(554,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(555,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(556,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(557,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(558,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(559,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(560,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(561,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(562,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(563,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(564,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(565,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(566,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(567,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(568,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(569,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(570,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(571,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(572,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(573,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(574,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(575,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(576,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(577,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(578,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(579,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(580,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(581,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(582,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(583,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(584,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(585,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(586,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(587,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(588,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(589,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(590,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(591,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(592,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(593,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(594,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(595,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(596,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(597,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(598,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(599,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(600,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(601,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(602,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(603,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(604,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(605,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(606,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(607,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(608,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(609,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(610,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(611,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(612,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(613,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(614,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(615,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(616,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(617,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(618,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(619,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(620,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(621,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(622,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(623,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(624,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(625,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(626,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(627,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(628,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(629,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(630,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(631,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(632,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(633,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(634,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(635,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(636,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(637,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(638,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(639,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(640,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(641,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(642,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(643,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(644,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(645,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(646,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(647,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(648,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(649,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(650,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(651,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(652,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(653,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(654,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(655,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(656,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(657,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(658,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(659,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(660,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(661,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(662,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(663,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(664,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(665,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(666,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(667,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(668,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(669,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(670,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(671,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(672,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(673,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(674,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(675,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(676,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(677,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(678,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(679,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(680,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(681,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(682,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(683,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(684,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(685,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(686,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(687,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(688,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(689,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(690,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(691,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(692,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(693,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(694,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(695,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(696,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(697,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(698,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(699,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(700,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(701,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(702,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(703,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(704,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(705,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(706,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(707,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(708,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(709,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(710,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(711,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(712,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(713,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(714,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(715,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(716,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(717,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(718,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(719,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(720,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(721,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(722,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(723,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(724,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(725,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(726,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(727,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(728,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(729,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(730,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(731,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(732,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(733,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(734,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(735,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(736,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(737,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(738,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(739,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(740,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(741,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(742,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(743,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(744,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(745,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(746,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(747,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(748,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(749,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(750,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(751,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(752,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(753,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(754,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(755,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(756,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(757,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(758,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(759,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(760,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(761,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(762,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(763,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(764,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(765,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(766,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(767,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(768,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(769,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(770,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(771,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(772,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(773,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(774,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(775,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(776,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(777,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(778,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(779,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(780,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(781,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(782,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(783,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(784,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(785,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(786,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(787,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(788,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(789,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(790,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(791,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(792,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(793,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(794,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(795,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(796,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(797,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(798,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(799,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(800,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(801,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(802,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(803,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(804,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(805,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(806,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(807,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(808,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(809,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(810,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(811,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(812,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(813,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(814,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(815,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(816,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(817,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(818,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(819,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(820,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(821,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(822,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(823,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(824,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(825,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(826,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(827,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(828,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(829,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(830,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(831,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(832,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(833,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(834,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(835,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(836,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(837,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(838,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(839,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(840,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(841,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(842,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(843,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(844,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(845,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(846,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(847,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(848,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(849,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(850,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(851,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(852,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(853,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(854,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(855,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(856,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(857,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(858,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(859,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(860,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(861,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(862,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(863,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(864,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(865,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(866,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(867,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(868,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(869,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(870,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(871,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(872,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(873,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(874,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(875,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(876,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(877,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(878,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(879,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(880,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(881,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(882,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(883,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(884,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(885,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(886,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(887,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(888,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(889,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(890,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(891,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(892,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(893,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(894,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(895,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(896,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(897,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(898,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(899,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(900,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(901,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(902,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(903,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(904,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(905,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(906,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(907,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(908,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(909,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(910,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(911,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(912,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(913,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(914,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(915,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(916,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(917,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(918,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(919,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(920,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(921,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(922,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(923,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(924,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(925,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(926,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(927,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(928,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(929,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(930,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(931,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(932,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(933,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(934,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(935,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(936,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(937,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(938,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(939,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(940,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(941,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(942,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(943,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(944,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(945,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(946,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(947,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(948,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(949,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(950,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(951,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(952,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(953,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(954,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(955,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(956,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(957,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(958,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(959,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(960,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(961,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(962,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(963,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(964,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(965,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(966,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(967,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(968,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(969,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(970,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(971,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(972,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(973,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(974,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(975,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(976,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(977,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(978,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(979,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(980,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(981,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(982,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(983,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(984,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(985,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(986,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(987,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(988,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(989,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(990,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(991,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(992,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(993,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(994,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(995,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(996,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(997,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(998,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(999,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1000,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1001,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1002,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1003,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1004,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1005,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1006,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1007,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1008,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1009,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1010,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1011,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1012,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1013,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1014,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1015,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1016,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1017,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1018,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1019,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1020,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1021,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1022,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1023,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1024,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1025,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1026,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1027,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1028,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1029,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1030,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1031,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1032,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1033,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1034,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1035,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1036,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1037,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1038,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1039,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1040,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1041,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1042,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1043,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1044,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1045,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1046,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1047,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1048,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1049,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1050,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1051,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1052,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1053,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1054,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1055,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1056,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1057,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1058,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1059,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1060,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1061,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1062,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1063,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1064,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1065,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1066,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1067,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1068,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1069,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1070,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1071,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST'),(1072,'TEST','TEST',0,'TEST','TEST',0,'A','2000-01-01','TEST');
/*!40000 ALTER TABLE `maszyny` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 trigger insert_stop before insert on Maszyny
     for each row
     begin
     if new.idMiejsca_Maszyny = (SELECT idMiejsca FROM Miejsca WHERE Miejsca.idMiejsca = new.idMiejsca_Maszyny AND typ_Miejsca = 'K') then
     signal sqlstate '45000' SET MESSAGE_TEXT = 'Nie mozna przyporzadkowac maszyny do kooperantu.', MYSQL_ERRNO = 1001;
     end if;
     end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 trigger update_stop before update on Maszyny
     for each row
     begin
     if new.idMiejsca_Maszyny = (SELECT idMiejsca FROM Miejsca WHERE Miejsca.idMiejsca = new.idMiejsca_Maszyny AND typ_Miejsca = 'K') then
     signal sqlstate '45000'SET MESSAGE_TEXT = 'Nie mozna przyporzadkowac maszyny do kooperantu.', MYSQL_ERRNO = 1001;
     end if;
     end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `maszyny_czesci_widok`
--

DROP TABLE IF EXISTS `maszyny_czesci_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_czesci_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `maszyny_czesci_widok` AS SELECT 
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Aktywność`,
 1 AS `Koniec gwarancji`,
 1 AS `Dokumentacja Link`,
 1 AS `Część`,
 1 AS `Nr części`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maszyny_daneosobowe_widok`
--

DROP TABLE IF EXISTS `maszyny_daneosobowe_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_daneosobowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `maszyny_daneosobowe_widok` AS SELECT 
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Aktywność`,
 1 AS `Koniec gwarancji`,
 1 AS `Dokumentacja Link`,
 1 AS `Imię`,
 1 AS `Nazwisko`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `maszyny_has_czesci`
--

DROP TABLE IF EXISTS `maszyny_has_czesci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maszyny_has_czesci` (
  `idMaszyny_MaszynyCzesci` int(10) unsigned NOT NULL,
  `idCzesci_MaszynyCzesci` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idMaszyny_MaszynyCzesci`,`idCzesci_MaszynyCzesci`),
  KEY `fk_Maszyny_has_Czesci_Czesci1_idx` (`idCzesci_MaszynyCzesci`),
  KEY `fk_Maszyny_has_Czesci_Maszyny1_idx` (`idMaszyny_MaszynyCzesci`),
  CONSTRAINT `fk_Maszyny_has_Czesci_Czesci1` FOREIGN KEY (`idCzesci_MaszynyCzesci`) REFERENCES `czesci` (`idCzesci`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_Maszyny_has_Czesci_Maszyny1` FOREIGN KEY (`idMaszyny_MaszynyCzesci`) REFERENCES `maszyny` (`idMaszyny`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maszyny_has_czesci`
--

LOCK TABLES `maszyny_has_czesci` WRITE;
/*!40000 ALTER TABLE `maszyny_has_czesci` DISABLE KEYS */;
/*!40000 ALTER TABLE `maszyny_has_czesci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maszyny_has_daneosobowe`
--

DROP TABLE IF EXISTS `maszyny_has_daneosobowe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maszyny_has_daneosobowe` (
  `idMaszyny_MaszynyDaneosobowe` int(10) unsigned NOT NULL,
  `idDaneosobowe_MaszynyDaneosobowe` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idMaszyny_MaszynyDaneosobowe`,`idDaneosobowe_MaszynyDaneosobowe`),
  KEY `fk_Maszyny_has_DaneOsobowe_DaneOsobowe1_idx` (`idDaneosobowe_MaszynyDaneosobowe`),
  KEY `fk_Maszyny_has_DaneOsobowe_Maszyny1_idx` (`idMaszyny_MaszynyDaneosobowe`),
  CONSTRAINT `fk_Maszyny_has_DaneOsobowe_DaneOsobowe1` FOREIGN KEY (`idDaneosobowe_MaszynyDaneosobowe`) REFERENCES `daneosobowe` (`idDaneosobowe`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_Maszyny_has_DaneOsobowe_Maszyny1` FOREIGN KEY (`idMaszyny_MaszynyDaneosobowe`) REFERENCES `maszyny` (`idMaszyny`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maszyny_has_daneosobowe`
--

LOCK TABLES `maszyny_has_daneosobowe` WRITE;
/*!40000 ALTER TABLE `maszyny_has_daneosobowe` DISABLE KEYS */;
/*!40000 ALTER TABLE `maszyny_has_daneosobowe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `maszyny_konkurencja_widok`
--

DROP TABLE IF EXISTS `maszyny_konkurencja_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_konkurencja_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `maszyny_konkurencja_widok` AS SELECT 
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Aktywność`,
 1 AS `Koniec gwarancji`,
 1 AS `Dokumentacja Link`,
 1 AS `Konkurencja`,
 1 AS `Opis konkurencji`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maszyny_miejsca_widok`
--

DROP TABLE IF EXISTS `maszyny_miejsca_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_miejsca_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `maszyny_miejsca_widok` AS SELECT 
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`,
 1 AS `Miejsce`,
 1 AS `Dział`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Aktywność`,
 1 AS `Koniec gwarancji`,
 1 AS `Dokumentacja Link`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maszyny_raportyserwisowe_widok`
--

DROP TABLE IF EXISTS `maszyny_raportyserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_raportyserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `maszyny_raportyserwisowe_widok` AS SELECT 
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Aktywność`,
 1 AS `Koniec gwarancji`,
 1 AS `Dokumentacja Link`,
 1 AS `Data raportu`,
 1 AS `Opis raportu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maszyny_widok`
--

DROP TABLE IF EXISTS `maszyny_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `maszyny_widok` AS SELECT 
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`,
 1 AS `Miejsce`,
 1 AS `Dział`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Nr zlecenia`,
 1 AS `Temat zlecenia`,
 1 AS `Aktywność`,
 1 AS `Koniec gwarancji`,
 1 AS `Dokumentacja Link`,
 1 AS `Sektor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maszyny_zgloszeniaserwisowe_widok`
--

DROP TABLE IF EXISTS `maszyny_zgloszeniaserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_zgloszeniaserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `maszyny_zgloszeniaserwisowe_widok` AS SELECT 
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Aktywność`,
 1 AS `Koniec gwarancji`,
 1 AS `Dokumentacja Link`,
 1 AS `Nr zgłoszenia`,
 1 AS `Opis zgłoszenia`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `miejsca`
--

DROP TABLE IF EXISTS `miejsca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miejsca` (
  `idMiejsca` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nazwa_Miejsca` varchar(200) NOT NULL,
  `nazwaDzialu_Miejsca` varchar(200) NOT NULL,
  `adres_Miejsca` varchar(200) DEFAULT NULL,
  `opis_Miejsca` varchar(200) DEFAULT NULL,
  `historia_Miejsca` varchar(200) DEFAULT NULL,
  `typ_Miejsca` enum('M','K') NOT NULL DEFAULT 'M',
  `idSektory_Miejsca` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMiejsca`),
  KEY `fk_Miejsca_Sektory1_idx` (`idSektory_Miejsca`),
  CONSTRAINT `fk_Miejsca_Sektory1` FOREIGN KEY (`idSektory_Miejsca`) REFERENCES `sektory` (`idSektory`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miejsca`
--

LOCK TABLES `miejsca` WRITE;
/*!40000 ALTER TABLE `miejsca` DISABLE KEYS */;
INSERT INTO `miejsca` VALUES (0,'BRAK','BRAK','BRAK','BRAK',NULL,'M',0),(23,'Bogdanka','Pole Stefanów','Puchaczów','','file://k1/Serwis/PZS Barakuda.xlsx','M',1),(24,'Bogdanka','Pole Nadrybie','Puchaczów','LW',NULL,'M',1),(25,'Bogdanka','Pole Bogdanka','Puchaczów','LW',NULL,'M',3),(26,'Bogdanka','A',NULL,NULL,NULL,'M',3),(27,'Bogdanka','Z',NULL,'','C:/Users/rstrawinski/Desktop/Strawinski_CV.docx','M',1);
/*!40000 ALTER TABLE `miejsca` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 trigger insert_miejsca before insert on Miejsca
     for each row
     begin
     if (new.idSektory_Miejsca = 4 AND new.typ_Miejsca = 'M') OR (new.idSektory_Miejsca != 4 AND new.typ_Miejsca = 'K') then
     signal sqlstate '45000'SET MESSAGE_TEXT = 'Sektor "Inne" mozna przyporzadkowac tylko do koopereantu ("K").', MYSQL_ERRNO = 1001;
     end if;
     end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 trigger update_miejsca before update on Miejsca
     for each row
     begin
     if (new.idSektory_Miejsca = 4 AND new.typ_Miejsca = 'M') OR (new.idSektory_Miejsca != 4 AND new.typ_Miejsca = 'K') THEN
     signal sqlstate '45000'SET MESSAGE_TEXT = 'Sektor "Inne" mozna przyporzadkowac tylko do Kooperantu ("K").', MYSQL_ERRNO = 1001;
     end if;
     end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 trigger delete_miejsce before delete on Miejsca
     for each row
     begin
     DECLARE naz_miej varchar(100);
     SET naz_miej = old.nazwa_Miejsca;
     if (SELECT miejsce_Daneosobowe from Daneosobowe WHERE miejsce_Daneosobowe LIKE CONCAT('%',naz_miej,'%') LIMIT 1) != "" OR (SELECT Kooperant_Czesci FROM Czesci WHERE Kooperant_Czesci LIKE CONCAT('%',naz_miej,'%') LIMIT 1) != "" THEN
     signal sqlstate '45000'SET MESSAGE_TEXT = 'Nie mozna usunac miejsca przyporzadkowanego do czesci lub osoby.', MYSQL_ERRNO = 1001;
     end if;
     end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `miejsca_czesci_widok`
--

DROP TABLE IF EXISTS `miejsca_czesci_widok`;
/*!50001 DROP VIEW IF EXISTS `miejsca_czesci_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `miejsca_czesci_widok` AS SELECT 
 1 AS `Miejsce`,
 1 AS `Dział`,
 1 AS `Adres`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Typ`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `miejsca_daneosobowe_widok`
--

DROP TABLE IF EXISTS `miejsca_daneosobowe_widok`;
/*!50001 DROP VIEW IF EXISTS `miejsca_daneosobowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `miejsca_daneosobowe_widok` AS SELECT 
 1 AS `Miejsce`,
 1 AS `Dział`,
 1 AS `Adres`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Typ`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `miejsca_widok`
--

DROP TABLE IF EXISTS `miejsca_widok`;
/*!50001 DROP VIEW IF EXISTS `miejsca_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `miejsca_widok` AS SELECT 
 1 AS `Miejsce`,
 1 AS `Dział`,
 1 AS `Adres`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Typ`,
 1 AS `Sektor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `miejsca_zgloszeniaserwisowe_widok`
--

DROP TABLE IF EXISTS `miejsca_zgloszeniaserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `miejsca_zgloszeniaserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `miejsca_zgloszeniaserwisowe_widok` AS SELECT 
 1 AS `Miejsce`,
 1 AS `Dział`,
 1 AS `Adres`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Typ`,
 1 AS `Nr zgłoszenia`,
 1 AS `Opis zgłoszenia`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `raportyserwisowe`
--

DROP TABLE IF EXISTS `raportyserwisowe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raportyserwisowe` (
  `idRaportyserwisowe` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_Raportyserwisowe` date DEFAULT NULL,
  `idMaszyny_Raportyserwisowe` int(10) unsigned NOT NULL,
  `opis_Raportyserwisowe` varchar(200) DEFAULT NULL,
  `historia_Raportyserwisowe` varchar(200) DEFAULT NULL,
  `idZgloszeniaserwisowe_Raportyserwisowe` int(10) unsigned DEFAULT '10',
  `serwisanci_Raportyserwisowe` varchar(300) DEFAULT NULL,
  `zalacznikLink_Raportyserwisowe` varchar(200) DEFAULT NULL,
  `godziny_Raportyserwisowe` int(11) DEFAULT NULL,
  `typ_Raportyserwisowe` enum('GW','PG','INNE') NOT NULL,
  PRIMARY KEY (`idRaportyserwisowe`),
  KEY `fk_Raportyserwisowe_Zgloszeniaserwisowe1_idx` (`idZgloszeniaserwisowe_Raportyserwisowe`),
  KEY `fk_Raportyserwisowe_Maszyny1_idx` (`idMaszyny_Raportyserwisowe`),
  CONSTRAINT `fk_Raportyserwisowe_Maszyny1` FOREIGN KEY (`idMaszyny_Raportyserwisowe`) REFERENCES `maszyny` (`idMaszyny`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Raportyserwisowe_Zgloszeniaserwisowe1` FOREIGN KEY (`idZgloszeniaserwisowe_Raportyserwisowe`) REFERENCES `zgloszeniaserwisowe` (`idZgloszeniaserwisowe`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raportyserwisowe`
--

LOCK TABLES `raportyserwisowe` WRITE;
/*!40000 ALTER TABLE `raportyserwisowe` DISABLE KEYS */;
/*!40000 ALTER TABLE `raportyserwisowe` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 trigger insert_raport before insert on Raportyserwisowe
     for each row
     begin
     if new.idZgloszeniaserwisowe_Raportyserwisowe = ANY (SELECT idZgloszeniaserwisowe from zgloszeniaserwisowe WHERE idZgloszeniaserwisowe=new.idZgloszeniaserwisowe_Raportyserwisowe AND idMaszyny_Zgloszeniaserwisowe = 0 AND numer_Zgloszeniaserwisowe != "BRAK") THEN
     signal sqlstate '45000'SET MESSAGE_TEXT = 'Zgloszenie z maszyna "BRAK" nie moze byc przyporzadkowane do raportu.', MYSQL_ERRNO = 1001;
     end if;
     end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 trigger update_raport before update on Raportyserwisowe
     for each row
     begin
     if new.idZgloszeniaserwisowe_Raportyserwisowe = ANY (SELECT idZgloszeniaserwisowe from zgloszeniaserwisowe WHERE idZgloszeniaserwisowe=new.idZgloszeniaserwisowe_Raportyserwisowe AND idMaszyny_Zgloszeniaserwisowe = 0 AND numer_Zgloszeniaserwisowe!="BRAK") THEN
     signal sqlstate '45000'SET MESSAGE_TEXT = 'Zgloszenie z maszyna "BRAK" nie moze byc przyporzadkowane do raportu.', MYSQL_ERRNO = 1001;
     end if;
     end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `raportyserwisowe_widok`
--

DROP TABLE IF EXISTS `raportyserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `raportyserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `raportyserwisowe_widok` AS SELECT 
 1 AS `Data`,
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`,
 1 AS `Miejsce`,
 1 AS `Dział`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Nr zgłoszenia`,
 1 AS `Opis zgłoszenia`,
 1 AS `Serwisanci`,
 1 AS `Załącznik Link`,
 1 AS `Godziny`,
 1 AS `Typ`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `raportyserwisowe_zgloszeniaserwisowe_widok`
--

DROP TABLE IF EXISTS `raportyserwisowe_zgloszeniaserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `raportyserwisowe_zgloszeniaserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `raportyserwisowe_zgloszeniaserwisowe_widok` AS SELECT 
 1 AS `Data`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Nr zgłoszenia`,
 1 AS `Opis zgłoszenia`,
 1 AS `Serwisanci`,
 1 AS `Załącznik Link`,
 1 AS `Godziny`,
 1 AS `Typ`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sektory`
--

DROP TABLE IF EXISTS `sektory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sektory` (
  `idSektory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nazwa_Sektory` varchar(45) NOT NULL,
  PRIMARY KEY (`idSektory`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sektory`
--

LOCK TABLES `sektory` WRITE;
/*!40000 ALTER TABLE `sektory` DISABLE KEYS */;
INSERT INTO `sektory` VALUES (0,'BRAK'),(1,'Górnictwo'),(2,'Ochrona środowiska'),(3,'Energetyka'),(4,'Inne');
/*!40000 ALTER TABLE `sektory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zgloszeniaserwisowe`
--

DROP TABLE IF EXISTS `zgloszeniaserwisowe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zgloszeniaserwisowe` (
  `idZgloszeniaserwisowe` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numer_Zgloszeniaserwisowe` varchar(200) NOT NULL,
  `idMaszyny_Zgloszeniaserwisowe` int(10) unsigned NOT NULL,
  `opis_Zgloszeniaserwisowe` varchar(200) DEFAULT NULL,
  `historia_Zgloszeniaserwisowe` varchar(200) DEFAULT NULL,
  `dataZgloszenia_Zgloszeniaserwisowe` date DEFAULT NULL,
  `czyAktywne_Zgloszeniaserwisowe` enum('A','N') NOT NULL,
  `typ_Zgloszeniaserwisowe` enum('GW','PG','INNE') DEFAULT NULL,
  `link_Zgloszeniaserwisowe` varchar(200) DEFAULT NULL,
  `dataZakonczenia_Zgloszeniaserwisowe` date DEFAULT NULL,
  `wynik_Zgloszeniaserwisowe` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idZgloszeniaserwisowe`),
  KEY `fk_Zgloszeniaserwisowe_Maszyny1_idx` (`idMaszyny_Zgloszeniaserwisowe`),
  CONSTRAINT `fk_Zgloszeniaserwisowe_Maszyny1` FOREIGN KEY (`idMaszyny_Zgloszeniaserwisowe`) REFERENCES `maszyny` (`idMaszyny`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zgloszeniaserwisowe`
--

LOCK TABLES `zgloszeniaserwisowe` WRITE;
/*!40000 ALTER TABLE `zgloszeniaserwisowe` DISABLE KEYS */;
INSERT INTO `zgloszeniaserwisowe` VALUES (0,'BRAK',0,'BRAK',NULL,'2000-01-01','N','INNE','BRAK','2000-01-01','BRAK');
/*!40000 ALTER TABLE `zgloszeniaserwisowe` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 trigger update_zgloszenie before update on Zgloszeniaserwisowe
     for each row
     begin
     if new.idMaszyny_Zgloszeniaserwisowe = 0 AND new.idZgloszeniaserwisowe=ANY (SELECT idZgloszeniaserwisowe_Raportyserwisowe from raportyserwisowe WHERE idZgloszeniaserwisowe_Raportyserwisowe=new.idZgloszeniaserwisowe) then
     signal sqlstate '45000'SET MESSAGE_TEXT = 'Zgloszenie z maszyna "BRAK" nie moze byc przyporzadkowane do raportu.', MYSQL_ERRNO = 1001;
     end if;
     end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `zgloszeniaserwisowe_miejsca_widok`
--

DROP TABLE IF EXISTS `zgloszeniaserwisowe_miejsca_widok`;
/*!50001 DROP VIEW IF EXISTS `zgloszeniaserwisowe_miejsca_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `zgloszeniaserwisowe_miejsca_widok` AS SELECT 
 1 AS `Nr zgłoszenia`,
 1 AS `Data zgłoszenia`,
 1 AS `Data zakończenia`,
 1 AS `Aktywność`,
 1 AS `Wynik`,
 1 AS `Opis`,
 1 AS `Typ zgłoszenia`,
 1 AS `Link`,
 1 AS `Miejsce maszyny`,
 1 AS `Nazwa działu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `zgloszeniaserwisowe_raportyserwisowe_widok`
--

DROP TABLE IF EXISTS `zgloszeniaserwisowe_raportyserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `zgloszeniaserwisowe_raportyserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `zgloszeniaserwisowe_raportyserwisowe_widok` AS SELECT 
 1 AS `Numer`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Data rozpoczęcia`,
 1 AS `Aktywność`,
 1 AS `Typ`,
 1 AS `Link`,
 1 AS `Data zakończenia`,
 1 AS `Wynik`,
 1 AS `Data raportu`,
 1 AS `Opis raportu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `zgloszeniaserwisowe_widok`
--

DROP TABLE IF EXISTS `zgloszeniaserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `zgloszeniaserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `zgloszeniaserwisowe_widok` AS SELECT 
 1 AS `Nr zgłoszenia`,
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`,
 1 AS `Miejsce`,
 1 AS `Dział`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Data rozpoczęcia`,
 1 AS `Aktywność`,
 1 AS `Typ`,
 1 AS `Link`,
 1 AS `Data zakończenia`,
 1 AS `Wynik`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `zlecenia`
--

DROP TABLE IF EXISTS `zlecenia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zlecenia` (
  `idZlecenia` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nr_Zlecenia` varchar(200) NOT NULL,
  `temat_Zlecenia` varchar(200) NOT NULL,
  `harmonogramLink_Zlecenia` varchar(200) DEFAULT NULL,
  `spisWysylkowyLink_Zlecenia` varchar(200) DEFAULT NULL,
  `opis_Zlecenia` varchar(500) DEFAULT NULL,
  `historia_Zlecenia` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idZlecenia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zlecenia`
--

LOCK TABLES `zlecenia` WRITE;
/*!40000 ALTER TABLE `zlecenia` DISABLE KEYS */;
INSERT INTO `zlecenia` VALUES (0,'BRAK','BRAK','BRAK','BRAK','BRAK',NULL);
/*!40000 ALTER TABLE `zlecenia` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER ZleceniaDelete BEFORE DELETE ON Zlecenia
FOR EACH ROW
BEGIN
                
     UPDATE Maszyny, Zlecenia
     SET Maszyny.idZlecenia_Maszyny = 0
     WHERE Maszyny.idZlecenia_Maszyny = old.idZlecenia;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `zlecenia_maszyny_widok`
--

DROP TABLE IF EXISTS `zlecenia_maszyny_widok`;
/*!50001 DROP VIEW IF EXISTS `zlecenia_maszyny_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `zlecenia_maszyny_widok` AS SELECT 
 1 AS `Nr zlecenia`,
 1 AS `Temat zlecenia`,
 1 AS `Harmonogram Link`,
 1 AS `Spis wysyłkowy Link`,
 1 AS `Opis`,
 1 AS `Historia Link`,
 1 AS `Maszyna`,
 1 AS `Nr fabryczny`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `czesci_maszyny_widok`
--

/*!50001 DROP VIEW IF EXISTS `czesci_maszyny_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `czesci_maszyny_widok` AS select `czesci`.`nazwa_Czesci` AS `Część`,`czesci`.`nr_Czesci` AS `Nr części`,`czesci`.`dataProdukcji_Czesci` AS `Data produkcji`,`czesci`.`dataGwarancji_Czesci` AS `Data gwarancji`,`czesci`.`DTRLink_Czesci` AS `DTR Link`,`czesci`.`Kooperant_Czesci` AS `Miejsce kooperanta`,`maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny` from ((`czesci` left join `maszyny_has_czesci` on((`maszyny_has_czesci`.`idCzesci_MaszynyCzesci` = `czesci`.`idCzesci`))) left join `maszyny` on((`maszyny`.`idMaszyny` = `maszyny_has_czesci`.`idMaszyny_MaszynyCzesci`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `czesci_widok`
--

/*!50001 DROP VIEW IF EXISTS `czesci_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `czesci_widok` AS select `czesci`.`nazwa_Czesci` AS `Część`,`czesci`.`nr_Czesci` AS `Nr części`,`czesci`.`dataProdukcji_Czesci` AS `Data produkcji`,`czesci`.`dataGwarancji_Czesci` AS `Data gwarancji`,`czesci`.`DTRLink_Czesci` AS `DTR Link`,`czesci`.`Kooperant_Czesci` AS `Miejsce kooperanta`,`maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny` from ((`czesci` left join `maszyny_has_czesci` on((`maszyny_has_czesci`.`idCzesci_MaszynyCzesci` = `czesci`.`idCzesci`))) left join `maszyny` on((`maszyny`.`idMaszyny` = `maszyny_has_czesci`.`idMaszyny_MaszynyCzesci`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `daneosobowe_maszyny_widok`
--

/*!50001 DROP VIEW IF EXISTS `daneosobowe_maszyny_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `daneosobowe_maszyny_widok` AS select `daneosobowe`.`imie_Daneosobowe` AS `Imię`,`daneosobowe`.`nazwisko_Daneosobowe` AS `Nazwisko`,`daneosobowe`.`telefon_Daneosobowe` AS `Telefon`,`daneosobowe`.`email_Daneosobowe` AS `E-mail`,`daneosobowe`.`opis_Daneosobowe` AS `Opis`,`daneosobowe`.`miejsce_Daneosobowe` AS `Miejsce kooperanta`,`maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny` from ((`daneosobowe` left join `maszyny_has_daneosobowe` on((`maszyny_has_daneosobowe`.`idDaneosobowe_MaszynyDaneosobowe` = `daneosobowe`.`idDaneosobowe`))) left join `maszyny` on((`maszyny`.`idMaszyny` = `maszyny_has_daneosobowe`.`idMaszyny_MaszynyDaneosobowe`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `daneosobowe_miejsca_widok`
--

/*!50001 DROP VIEW IF EXISTS `daneosobowe_miejsca_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `daneosobowe_miejsca_widok` AS select `daneosobowe`.`imie_Daneosobowe` AS `Imię`,`daneosobowe`.`nazwisko_Daneosobowe` AS `Nazwisko`,`daneosobowe`.`telefon_Daneosobowe` AS `Telefon`,`daneosobowe`.`email_Daneosobowe` AS `E-mail`,`daneosobowe`.`opis_Daneosobowe` AS `Opis`,`daneosobowe`.`miejsce_Daneosobowe` AS `Miejsce kooperanta`,`miejsca`.`nazwa_Miejsca` AS `Miejsce maszyny`,`miejsca`.`nazwaDzialu_Miejsca` AS `Dział` from (((`daneosobowe` left join `maszyny_has_daneosobowe` on((`maszyny_has_daneosobowe`.`idDaneosobowe_MaszynyDaneosobowe` = `daneosobowe`.`idDaneosobowe`))) left join `maszyny` on((`maszyny`.`idMaszyny` = `maszyny_has_daneosobowe`.`idMaszyny_MaszynyDaneosobowe`))) left join `miejsca` on((`miejsca`.`idMiejsca` = `maszyny`.`idMiejsca_Maszyny`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `daneosobowe_widok`
--

/*!50001 DROP VIEW IF EXISTS `daneosobowe_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `daneosobowe_widok` AS select `daneosobowe`.`imie_Daneosobowe` AS `Imię`,`daneosobowe`.`nazwisko_Daneosobowe` AS `Nazwisko`,`daneosobowe`.`telefon_Daneosobowe` AS `Telefon`,`daneosobowe`.`email_Daneosobowe` AS `E-mail`,`daneosobowe`.`opis_Daneosobowe` AS `Opis`,`daneosobowe`.`miejsce_Daneosobowe` AS `Miejsce kooperanta`,`maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny` from ((`daneosobowe` left join `maszyny_has_daneosobowe` on((`maszyny_has_daneosobowe`.`idDaneosobowe_MaszynyDaneosobowe` = `daneosobowe`.`idDaneosobowe`))) left join `maszyny` on((`maszyny`.`idMaszyny` = `maszyny_has_daneosobowe`.`idMaszyny_MaszynyDaneosobowe`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `konkurencja_widok`
--

/*!50001 DROP VIEW IF EXISTS `konkurencja_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `konkurencja_widok` AS select `konkurencja`.`nazwa_Konkurencja` AS `Konkurencja`,`konkurencja`.`opis_Konkurencja` AS `Opis`,`konkurencja`.`historia_Konkurencja` AS `Historia Link`,`maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny` from (`konkurencja` left join `maszyny` on((`maszyny`.`idMaszyny` = `konkurencja`.`idMaszyny_Konkurencja`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maszyny_czesci_widok`
--

/*!50001 DROP VIEW IF EXISTS `maszyny_czesci_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `maszyny_czesci_widok` AS select `maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny`,`maszyny`.`opis_Maszyny` AS `Opis`,`maszyny`.`historia_Maszyny` AS `Historia Link`,`maszyny`.`czyAktywna_Maszyny` AS `Aktywność`,`maszyny`.`koniecGwarancji_Maszyny` AS `Koniec gwarancji`,`maszyny`.`dokumentacjaLink_Maszyny` AS `Dokumentacja Link`,`czesci`.`nazwa_Czesci` AS `Część`,`czesci`.`nr_Czesci` AS `Nr części` from (`czesci` left join (`maszyny` left join `maszyny_has_czesci` on((`maszyny_has_czesci`.`idMaszyny_MaszynyCzesci` = `maszyny`.`idMaszyny`))) on((`czesci`.`idCzesci` = `maszyny_has_czesci`.`idCzesci_MaszynyCzesci`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maszyny_daneosobowe_widok`
--

/*!50001 DROP VIEW IF EXISTS `maszyny_daneosobowe_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `maszyny_daneosobowe_widok` AS select `maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny`,`maszyny`.`opis_Maszyny` AS `Opis`,`maszyny`.`historia_Maszyny` AS `Historia Link`,`maszyny`.`czyAktywna_Maszyny` AS `Aktywność`,`maszyny`.`koniecGwarancji_Maszyny` AS `Koniec gwarancji`,`maszyny`.`dokumentacjaLink_Maszyny` AS `Dokumentacja Link`,`daneosobowe`.`imie_Daneosobowe` AS `Imię`,`daneosobowe`.`nazwisko_Daneosobowe` AS `Nazwisko` from ((`maszyny` left join `maszyny_has_daneosobowe` on((`maszyny_has_daneosobowe`.`idMaszyny_MaszynyDaneosobowe` = `maszyny`.`idMaszyny`))) left join `daneosobowe` on((`daneosobowe`.`idDaneosobowe` = `maszyny_has_daneosobowe`.`idDaneosobowe_MaszynyDaneosobowe`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maszyny_konkurencja_widok`
--

/*!50001 DROP VIEW IF EXISTS `maszyny_konkurencja_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `maszyny_konkurencja_widok` AS select `maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny`,`maszyny`.`opis_Maszyny` AS `Opis`,`maszyny`.`historia_Maszyny` AS `Historia Link`,`maszyny`.`czyAktywna_Maszyny` AS `Aktywność`,`maszyny`.`koniecGwarancji_Maszyny` AS `Koniec gwarancji`,`maszyny`.`dokumentacjaLink_Maszyny` AS `Dokumentacja Link`,`konkurencja`.`nazwa_Konkurencja` AS `Konkurencja`,`konkurencja`.`opis_Konkurencja` AS `Opis konkurencji` from (`maszyny` left join `konkurencja` on((`maszyny`.`idMaszyny` = `konkurencja`.`idMaszyny_Konkurencja`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maszyny_miejsca_widok`
--

/*!50001 DROP VIEW IF EXISTS `maszyny_miejsca_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `maszyny_miejsca_widok` AS select `maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny`,`miejsca`.`nazwa_Miejsca` AS `Miejsce`,`miejsca`.`nazwaDzialu_Miejsca` AS `Dział`,`maszyny`.`opis_Maszyny` AS `Opis`,`maszyny`.`historia_Maszyny` AS `Historia Link`,`maszyny`.`czyAktywna_Maszyny` AS `Aktywność`,`maszyny`.`koniecGwarancji_Maszyny` AS `Koniec gwarancji`,`maszyny`.`dokumentacjaLink_Maszyny` AS `Dokumentacja Link` from (`miejsca` left join `maszyny` on((`miejsca`.`idMiejsca` = `maszyny`.`idMiejsca_Maszyny`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maszyny_raportyserwisowe_widok`
--

/*!50001 DROP VIEW IF EXISTS `maszyny_raportyserwisowe_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `maszyny_raportyserwisowe_widok` AS select `maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny`,`maszyny`.`opis_Maszyny` AS `Opis`,`maszyny`.`historia_Maszyny` AS `Historia Link`,`maszyny`.`czyAktywna_Maszyny` AS `Aktywność`,`maszyny`.`koniecGwarancji_Maszyny` AS `Koniec gwarancji`,`maszyny`.`dokumentacjaLink_Maszyny` AS `Dokumentacja Link`,`raportyserwisowe`.`data_Raportyserwisowe` AS `Data raportu`,`raportyserwisowe`.`opis_Raportyserwisowe` AS `Opis raportu` from (`maszyny` left join `raportyserwisowe` on((`raportyserwisowe`.`idMaszyny_Raportyserwisowe` = `maszyny`.`idMaszyny`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maszyny_widok`
--

/*!50001 DROP VIEW IF EXISTS `maszyny_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `maszyny_widok` AS select `maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny`,`miejsca`.`nazwa_Miejsca` AS `Miejsce`,`miejsca`.`nazwaDzialu_Miejsca` AS `Dział`,`maszyny`.`opis_Maszyny` AS `Opis`,`maszyny`.`historia_Maszyny` AS `Historia Link`,`zlecenia`.`nr_Zlecenia` AS `Nr zlecenia`,`zlecenia`.`temat_Zlecenia` AS `Temat zlecenia`,`maszyny`.`czyAktywna_Maszyny` AS `Aktywność`,`maszyny`.`koniecGwarancji_Maszyny` AS `Koniec gwarancji`,`maszyny`.`dokumentacjaLink_Maszyny` AS `Dokumentacja Link`,`sektory`.`nazwa_Sektory` AS `Sektor` from (((`maszyny` left join `miejsca` on((`miejsca`.`idMiejsca` = `maszyny`.`idMiejsca_Maszyny`))) left join `sektory` on((`sektory`.`idSektory` = `miejsca`.`idSektory_Miejsca`))) left join `zlecenia` on((`zlecenia`.`idZlecenia` = `maszyny`.`idZlecenia_Maszyny`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maszyny_zgloszeniaserwisowe_widok`
--

/*!50001 DROP VIEW IF EXISTS `maszyny_zgloszeniaserwisowe_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `maszyny_zgloszeniaserwisowe_widok` AS select `maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny`,`maszyny`.`opis_Maszyny` AS `Opis`,`maszyny`.`historia_Maszyny` AS `Historia Link`,`maszyny`.`czyAktywna_Maszyny` AS `Aktywność`,`maszyny`.`koniecGwarancji_Maszyny` AS `Koniec gwarancji`,`maszyny`.`dokumentacjaLink_Maszyny` AS `Dokumentacja Link`,`zgloszeniaserwisowe`.`numer_Zgloszeniaserwisowe` AS `Nr zgłoszenia`,`zgloszeniaserwisowe`.`opis_Zgloszeniaserwisowe` AS `Opis zgłoszenia` from (`maszyny` left join `zgloszeniaserwisowe` on((`zgloszeniaserwisowe`.`idMaszyny_Zgloszeniaserwisowe` = `maszyny`.`idMaszyny`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `miejsca_czesci_widok`
--

/*!50001 DROP VIEW IF EXISTS `miejsca_czesci_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `miejsca_czesci_widok` AS select `miejsca`.`nazwa_Miejsca` AS `Miejsce`,`miejsca`.`nazwaDzialu_Miejsca` AS `Dział`,`miejsca`.`adres_Miejsca` AS `Adres`,`miejsca`.`opis_Miejsca` AS `Opis`,`miejsca`.`historia_Miejsca` AS `Historia Link`,`miejsca`.`typ_Miejsca` AS `Typ` from `miejsca` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `miejsca_daneosobowe_widok`
--

/*!50001 DROP VIEW IF EXISTS `miejsca_daneosobowe_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `miejsca_daneosobowe_widok` AS select `miejsca`.`nazwa_Miejsca` AS `Miejsce`,`miejsca`.`nazwaDzialu_Miejsca` AS `Dział`,`miejsca`.`adres_Miejsca` AS `Adres`,`miejsca`.`opis_Miejsca` AS `Opis`,`miejsca`.`historia_Miejsca` AS `Historia Link`,`miejsca`.`typ_Miejsca` AS `Typ` from `miejsca` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `miejsca_widok`
--

/*!50001 DROP VIEW IF EXISTS `miejsca_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `miejsca_widok` AS select `miejsca`.`nazwa_Miejsca` AS `Miejsce`,`miejsca`.`nazwaDzialu_Miejsca` AS `Dział`,`miejsca`.`adres_Miejsca` AS `Adres`,`miejsca`.`opis_Miejsca` AS `Opis`,`miejsca`.`historia_Miejsca` AS `Historia Link`,`miejsca`.`typ_Miejsca` AS `Typ`,`sektory`.`nazwa_Sektory` AS `Sektor` from (`miejsca` left join `sektory` on((`sektory`.`idSektory` = `miejsca`.`idSektory_Miejsca`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `miejsca_zgloszeniaserwisowe_widok`
--

/*!50001 DROP VIEW IF EXISTS `miejsca_zgloszeniaserwisowe_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `miejsca_zgloszeniaserwisowe_widok` AS select `miejsca`.`nazwa_Miejsca` AS `Miejsce`,`miejsca`.`nazwaDzialu_Miejsca` AS `Dział`,`miejsca`.`adres_Miejsca` AS `Adres`,`miejsca`.`opis_Miejsca` AS `Opis`,`miejsca`.`historia_Miejsca` AS `Historia Link`,`miejsca`.`typ_Miejsca` AS `Typ`,`zgloszeniaserwisowe`.`numer_Zgloszeniaserwisowe` AS `Nr zgłoszenia`,`zgloszeniaserwisowe`.`opis_Zgloszeniaserwisowe` AS `Opis zgłoszenia` from ((`miejsca` left join `maszyny` on((`maszyny`.`idMiejsca_Maszyny` = `miejsca`.`idMiejsca`))) left join `zgloszeniaserwisowe` on((`zgloszeniaserwisowe`.`idMaszyny_Zgloszeniaserwisowe` = `maszyny`.`idMaszyny`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `raportyserwisowe_widok`
--

/*!50001 DROP VIEW IF EXISTS `raportyserwisowe_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `raportyserwisowe_widok` AS select `raportyserwisowe`.`data_Raportyserwisowe` AS `Data`,`maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny`,`miejsca`.`nazwa_Miejsca` AS `Miejsce`,`miejsca`.`nazwaDzialu_Miejsca` AS `Dział`,`raportyserwisowe`.`opis_Raportyserwisowe` AS `Opis`,`raportyserwisowe`.`historia_Raportyserwisowe` AS `Historia Link`,`zgloszeniaserwisowe`.`numer_Zgloszeniaserwisowe` AS `Nr zgłoszenia`,`zgloszeniaserwisowe`.`opis_Zgloszeniaserwisowe` AS `Opis zgłoszenia`,`raportyserwisowe`.`serwisanci_Raportyserwisowe` AS `Serwisanci`,`raportyserwisowe`.`zalacznikLink_Raportyserwisowe` AS `Załącznik Link`,`raportyserwisowe`.`godziny_Raportyserwisowe` AS `Godziny`,`raportyserwisowe`.`typ_Raportyserwisowe` AS `Typ` from (((`raportyserwisowe` left join `maszyny` on((`maszyny`.`idMaszyny` = `raportyserwisowe`.`idMaszyny_Raportyserwisowe`))) left join `miejsca` on((`miejsca`.`idMiejsca` = `maszyny`.`idMiejsca_Maszyny`))) left join `zgloszeniaserwisowe` on((`zgloszeniaserwisowe`.`idZgloszeniaserwisowe` = `raportyserwisowe`.`idZgloszeniaserwisowe_Raportyserwisowe`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `raportyserwisowe_zgloszeniaserwisowe_widok`
--

/*!50001 DROP VIEW IF EXISTS `raportyserwisowe_zgloszeniaserwisowe_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `raportyserwisowe_zgloszeniaserwisowe_widok` AS select `raportyserwisowe`.`data_Raportyserwisowe` AS `Data`,`raportyserwisowe`.`opis_Raportyserwisowe` AS `Opis`,`raportyserwisowe`.`historia_Raportyserwisowe` AS `Historia Link`,`zgloszeniaserwisowe`.`numer_Zgloszeniaserwisowe` AS `Nr zgłoszenia`,`zgloszeniaserwisowe`.`opis_Zgloszeniaserwisowe` AS `Opis zgłoszenia`,`raportyserwisowe`.`serwisanci_Raportyserwisowe` AS `Serwisanci`,`raportyserwisowe`.`zalacznikLink_Raportyserwisowe` AS `Załącznik Link`,`raportyserwisowe`.`godziny_Raportyserwisowe` AS `Godziny`,`raportyserwisowe`.`typ_Raportyserwisowe` AS `Typ` from (`raportyserwisowe` left join `zgloszeniaserwisowe` on((`zgloszeniaserwisowe`.`idZgloszeniaserwisowe` = `raportyserwisowe`.`idZgloszeniaserwisowe_Raportyserwisowe`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `zgloszeniaserwisowe_miejsca_widok`
--

/*!50001 DROP VIEW IF EXISTS `zgloszeniaserwisowe_miejsca_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `zgloszeniaserwisowe_miejsca_widok` AS select `zgloszeniaserwisowe`.`numer_Zgloszeniaserwisowe` AS `Nr zgłoszenia`,`zgloszeniaserwisowe`.`dataZgloszenia_Zgloszeniaserwisowe` AS `Data zgłoszenia`,`zgloszeniaserwisowe`.`dataZakonczenia_Zgloszeniaserwisowe` AS `Data zakończenia`,`zgloszeniaserwisowe`.`czyAktywne_Zgloszeniaserwisowe` AS `Aktywność`,`zgloszeniaserwisowe`.`wynik_Zgloszeniaserwisowe` AS `Wynik`,`zgloszeniaserwisowe`.`opis_Zgloszeniaserwisowe` AS `Opis`,`zgloszeniaserwisowe`.`typ_Zgloszeniaserwisowe` AS `Typ zgłoszenia`,`zgloszeniaserwisowe`.`link_Zgloszeniaserwisowe` AS `Link`,`miejsca`.`nazwa_Miejsca` AS `Miejsce maszyny`,`miejsca`.`nazwaDzialu_Miejsca` AS `Nazwa działu` from (`zgloszeniaserwisowe` left join (`miejsca` left join `maszyny` on((`maszyny`.`idMiejsca_Maszyny` = `miejsca`.`idMiejsca`))) on((`zgloszeniaserwisowe`.`idMaszyny_Zgloszeniaserwisowe` = `maszyny`.`idMaszyny`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `zgloszeniaserwisowe_raportyserwisowe_widok`
--

/*!50001 DROP VIEW IF EXISTS `zgloszeniaserwisowe_raportyserwisowe_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `zgloszeniaserwisowe_raportyserwisowe_widok` AS select `zgloszeniaserwisowe`.`numer_Zgloszeniaserwisowe` AS `Numer`,`zgloszeniaserwisowe`.`opis_Zgloszeniaserwisowe` AS `Opis`,`zgloszeniaserwisowe`.`historia_Zgloszeniaserwisowe` AS `Historia Link`,`zgloszeniaserwisowe`.`dataZgloszenia_Zgloszeniaserwisowe` AS `Data rozpoczęcia`,`zgloszeniaserwisowe`.`czyAktywne_Zgloszeniaserwisowe` AS `Aktywność`,`zgloszeniaserwisowe`.`typ_Zgloszeniaserwisowe` AS `Typ`,`zgloszeniaserwisowe`.`link_Zgloszeniaserwisowe` AS `Link`,`zgloszeniaserwisowe`.`dataZakonczenia_Zgloszeniaserwisowe` AS `Data zakończenia`,`zgloszeniaserwisowe`.`wynik_Zgloszeniaserwisowe` AS `Wynik`,`raportyserwisowe`.`data_Raportyserwisowe` AS `Data raportu`,`raportyserwisowe`.`opis_Raportyserwisowe` AS `Opis raportu` from (`zgloszeniaserwisowe` left join `raportyserwisowe` on((`raportyserwisowe`.`idZgloszeniaserwisowe_Raportyserwisowe` = `zgloszeniaserwisowe`.`idZgloszeniaserwisowe`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `zgloszeniaserwisowe_widok`
--

/*!50001 DROP VIEW IF EXISTS `zgloszeniaserwisowe_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `zgloszeniaserwisowe_widok` AS select `zgloszeniaserwisowe`.`numer_Zgloszeniaserwisowe` AS `Nr zgłoszenia`,`maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny`,`miejsca`.`nazwa_Miejsca` AS `Miejsce`,`miejsca`.`nazwaDzialu_Miejsca` AS `Dział`,`zgloszeniaserwisowe`.`opis_Zgloszeniaserwisowe` AS `Opis`,`zgloszeniaserwisowe`.`historia_Zgloszeniaserwisowe` AS `Historia Link`,`zgloszeniaserwisowe`.`dataZgloszenia_Zgloszeniaserwisowe` AS `Data rozpoczęcia`,`zgloszeniaserwisowe`.`czyAktywne_Zgloszeniaserwisowe` AS `Aktywność`,`zgloszeniaserwisowe`.`typ_Zgloszeniaserwisowe` AS `Typ`,`zgloszeniaserwisowe`.`link_Zgloszeniaserwisowe` AS `Link`,`zgloszeniaserwisowe`.`dataZakonczenia_Zgloszeniaserwisowe` AS `Data zakończenia`,`zgloszeniaserwisowe`.`wynik_Zgloszeniaserwisowe` AS `Wynik` from (`zgloszeniaserwisowe` left join (`miejsca` left join `maszyny` on((`maszyny`.`idMiejsca_Maszyny` = `miejsca`.`idMiejsca`))) on((`zgloszeniaserwisowe`.`idMaszyny_Zgloszeniaserwisowe` = `maszyny`.`idMaszyny`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `zlecenia_maszyny_widok`
--

/*!50001 DROP VIEW IF EXISTS `zlecenia_maszyny_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `zlecenia_maszyny_widok` AS select `zlecenia`.`nr_Zlecenia` AS `Nr zlecenia`,`zlecenia`.`temat_Zlecenia` AS `Temat zlecenia`,`zlecenia`.`harmonogramLink_Zlecenia` AS `Harmonogram Link`,`zlecenia`.`spisWysylkowyLink_Zlecenia` AS `Spis wysyłkowy Link`,`zlecenia`.`opis_Zlecenia` AS `Opis`,`zlecenia`.`historia_Zlecenia` AS `Historia Link`,`maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny` from (`maszyny` left join `zlecenia` on((`maszyny`.`idZlecenia_Maszyny` = `zlecenia`.`idZlecenia`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-19  8:15:16
