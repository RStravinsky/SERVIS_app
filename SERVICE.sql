-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 192.168.1.7    Database: serwis_v8
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `czesci`
--

LOCK TABLES `czesci` WRITE;
/*!40000 ALTER TABLE `czesci` DISABLE KEYS */;
INSERT INTO `czesci` VALUES (1,'kołek perforatora','Kołek gwintowany X-EM8H-11-12 480 szt.',NULL,NULL,NULL,'Oświęcim');
/*!40000 ALTER TABLE `czesci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `czesci_maszyny_widok`
--

DROP TABLE IF EXISTS `czesci_maszyny_widok`;
/*!50001 DROP VIEW IF EXISTS `czesci_maszyny_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `czesci_maszyny_widok` (
  `Część` tinyint NOT NULL,
  `Nr części` tinyint NOT NULL,
  `Data produkcji` tinyint NOT NULL,
  `Data gwarancji` tinyint NOT NULL,
  `DTR Link` tinyint NOT NULL,
  `Miejsce kooperanta` tinyint NOT NULL,
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `czesci_widok`
--

DROP TABLE IF EXISTS `czesci_widok`;
/*!50001 DROP VIEW IF EXISTS `czesci_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `czesci_widok` (
  `Część` tinyint NOT NULL,
  `Nr części` tinyint NOT NULL,
  `Data produkcji` tinyint NOT NULL,
  `Data gwarancji` tinyint NOT NULL,
  `DTR Link` tinyint NOT NULL,
  `Miejsce kooperanta` tinyint NOT NULL,
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL
) ENGINE=MyISAM */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daneosobowe`
--

LOCK TABLES `daneosobowe` WRITE;
/*!40000 ALTER TABLE `daneosobowe` DISABLE KEYS */;
INSERT INTO `daneosobowe` VALUES (18,'Dariusz','Wyrębek','','dwyrebek@lw.com.pl','MD2 - kierownik','Bogdanka'),(19,'xxx','Pluta',NULL,NULL,NULL,'Sobieski');
/*!40000 ALTER TABLE `daneosobowe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `daneosobowe_maszyny_widok`
--

DROP TABLE IF EXISTS `daneosobowe_maszyny_widok`;
/*!50001 DROP VIEW IF EXISTS `daneosobowe_maszyny_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `daneosobowe_maszyny_widok` (
  `Imię` tinyint NOT NULL,
  `Nazwisko` tinyint NOT NULL,
  `Telefon` tinyint NOT NULL,
  `E-mail` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Miejsce kooperanta` tinyint NOT NULL,
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `daneosobowe_miejsca_widok`
--

DROP TABLE IF EXISTS `daneosobowe_miejsca_widok`;
/*!50001 DROP VIEW IF EXISTS `daneosobowe_miejsca_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `daneosobowe_miejsca_widok` (
  `Imię` tinyint NOT NULL,
  `Nazwisko` tinyint NOT NULL,
  `Telefon` tinyint NOT NULL,
  `E-mail` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Miejsce kooperanta` tinyint NOT NULL,
  `Miejsce maszyny` tinyint NOT NULL,
  `Dział` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `daneosobowe_widok`
--

DROP TABLE IF EXISTS `daneosobowe_widok`;
/*!50001 DROP VIEW IF EXISTS `daneosobowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `daneosobowe_widok` (
  `Imię` tinyint NOT NULL,
  `Nazwisko` tinyint NOT NULL,
  `Telefon` tinyint NOT NULL,
  `E-mail` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Miejsce kooperanta` tinyint NOT NULL,
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL
) ENGINE=MyISAM */;
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
-- Temporary table structure for view `konkurencja_widok`
--

DROP TABLE IF EXISTS `konkurencja_widok`;
/*!50001 DROP VIEW IF EXISTS `konkurencja_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `konkurencja_widok` (
  `Konkurencja` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL
) ENGINE=MyISAM */;
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
  `dokumentacjaLink_Maszyny` varchar(200) DEFAULT NULL,
  `opis_Maszyny` varchar(200) DEFAULT NULL,
  `historia_Maszyny` varchar(200) DEFAULT NULL,
  `idZlecenia_Maszyny` int(10) unsigned DEFAULT '0',
  `czyAktywna_Maszyny` enum('A','N') NOT NULL,
  `koniecGwarancji_Maszyny` date DEFAULT NULL,
  PRIMARY KEY (`idMaszyny`),
  KEY `fk_Maszyny_Zlecenia1_idx` (`idZlecenia_Maszyny`),
  KEY `fk_Maszyny_Miejsca1_idx` (`idMiejsca_Maszyny`),
  CONSTRAINT `fk_Maszyny_Miejsca1` FOREIGN KEY (`idMiejsca_Maszyny`) REFERENCES `miejsca` (`idMiejsca`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Maszyny_Zlecenia1` FOREIGN KEY (`idZlecenia_Maszyny`) REFERENCES `zlecenia` (`idZlecenia`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maszyny`
--

LOCK TABLES `maszyny` WRITE;
/*!40000 ALTER TABLE `maszyny` DISABLE KEYS */;
INSERT INTO `maszyny` VALUES (0,'BRAK','BRAK',0,'BRAK','BRAK',NULL,0,'N','2000-01-01'),(1073,'USP Pegaz','USP Pegaz 01/14',36,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/PEGAZ/RZ_168_04_14 (Pegaz do systemu strugowego BOGDANKA III)/Nr fabr. 01_14 (Wykonanie prawe)/Instrukcja PEGAZ-01_14-kpl..pdf','strugowy - G6',NULL,1,'A',NULL),(1074,'URW Panda','URW Panda 02/14',37,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/Panda/Rz_242_05_14/Nr fabr. 02_14/Instrukcja Panda 02_14 cz.1.pdf','Duża',NULL,0,'N',NULL),(1075,'URW Panda','URW Panda 01/15',37,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/Panda II/RZ_73b_01_15-LW Bogdanka/Instrukcja Panda 02_15.pdf','Mała',NULL,0,'N',NULL),(1076,'USP Pegaz','USP Pegaz 03/14',36,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/PEGAZ/RZ_168_04_14 (Pegaz do systemu strugowego BOGDANKA III)/Nr fabr. 03_14 (Wykonanie lewe)/Instrukcja PEGAZ-03_14-kpl..pdf','strugowy - G6',NULL,1,'A',NULL),(1077,'URW Panda','URW Panda 02/15',37,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/Panda II/RZ_73b_01_15-LW Bogdanka/Instrukcja Panda 02_15.pdf','Mala',NULL,0,'N',NULL),(1079,'Linia Gliwice','Linia Gliwice 15',40,NULL,'Linia RDF 2015r.','file://k1/dtpo/2015/Remondis Gliwice/Wymagania/11 099 06 21 a Gliwice Maschinenaufstellung Grundriss.pdf',2,'N',NULL),(1080,'Linia Sucha Beskidzka','Sucha Beskidzka 15r.',41,NULL,'Linia 2015r.',NULL,0,'A',NULL),(1081,'Podawarka tasmowa kombajnu','PTK  14/15',43,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/PDT-BOA/DHMS/RZ_317a_07_15 (Podajnik taśmowy 800 6m do kombajnu - DHMS_Egipt)/EN/EN_Podawarka taśmowa kombajnu PTK - 14_15-kpl..pdf','Meksyk',NULL,4,'N',NULL),(1082,'Podawarka tasmowa kombajnu','PTK 15/15',43,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/PDT-BOA/DHMS/RZ_317a_07_15 (Podajnik taśmowy 800 6m do kombajnu - DHMS_Egipt)/EN/PDF/00-EN_Podawarka taśmowa kombajnu PTK - 14_15-treść.pdf','Meksyk',NULL,5,'N',NULL),(1083,'Perforator','Perforator ',44,'file://k1/Konstrukcyjny/Projekty-2/Linie segregacyjne/Instrukcje/Perforator Oświęcim/Instrukcja DTR Perforator_Oświęcim-kpl..pdf',NULL,NULL,0,'A',NULL),(1084,'USP Pegaz','USP Pegaz 06/13',45,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/PEGAZ/Pniówek nr 06_13/Instrukcja PEGAZ-06_13-kpl..pdf','strugowy',NULL,0,'N',NULL),(1086,'Przesiewacz Dyskowy PS-F1','Przesiewacz PS-F1 02/01/12',46,'file://k1/Konstrukcyjny/Projekty-2/Linie segregacyjne/Instrukcje/PGE elektrownia Opole S.A/Kompletne/Instrukcja DTR Przesiewacz dyskowy 2012-06-15 kpl.pdf','separator nadziarna',NULL,0,'A',NULL),(1087,'Przenośnik łańcuchowy dwunitkowy PS-H1','Przenośnik łańcuchowy PS-H1 02/02/12',46,'file://k1/Konstrukcyjny/Projekty-2/Linie segregacyjne/Instrukcje/PGE elektrownia Opole S.A/Kompletne/Instrukcja DTR Przenośnik łańcuchowy dwunitkowy 2012-06-15 kpl.pdf',NULL,NULL,0,'A',NULL),(1088,'Przenośnik taśmowy PS-H2','Przenośnik taśmowy PS-H2 02/03/12',46,'file://k1/Konstrukcyjny/Projekty-2/Linie segregacyjne/Instrukcje/PGE elektrownia Opole S.A/Kompletne/Instrukcja DTR Przenośnik nadgbarytu 2012-06-15 kpl.pdf',NULL,NULL,0,'A',NULL),(1089,'SZN Waran','Waran 01/14',47,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/WARAN/Sobieski RZ_54_01_14/KPL do druku/DTR SZN Waran SIGMA - ZG Sobieski 2014.pdf',NULL,'file://k1/Serwis/Raporty serwisowe/DTG/KWK Sobieski/Waran 01_14/Historia.docx',0,'A',NULL),(1090,'Separator elektromagnetyczny','MAG 228-2014',48,'file://k1/Konstrukcyjny/Projekty-2/Linie segregacyjne/Instrukcje/Remondis Warszawa/2015-02-05-DTR-MAG228-2014_Sigma_SNK140-150.pdf',NULL,NULL,0,'A',NULL),(1091,'URW Panda','URW Panda 01/13',37,NULL,NULL,NULL,0,'N',NULL),(1092,'URW Panda','URW Panda 03/14',37,NULL,NULL,NULL,0,'N',NULL),(1093,'USP Pegaz','USP Pegaz 05/14',38,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/PEGAZ/nr fabr 04 i 05 _14 (RZ-368_09_14 Pegaz Bogdanka IV)/Nr fabr. 05_14 (wykonanie lewe)/Instrukcja PEGAZ-05_14-kpl..pdf','strugowy G5',NULL,0,'A',NULL),(1094,'USP Pegaz','USP Pegaz 04/14',38,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/PEGAZ/nr fabr 04 i 05 _14 (RZ-368_09_14 Pegaz Bogdanka IV)/Nr fabr. 04_14 (wykonanie prawe)/Instrukcja PEGAZ-04_14-kpl..pdf','Strugowy G5',NULL,0,'A',NULL),(1095,'Prasa Zentex','????',51,NULL,'3 szt.',NULL,0,'A',NULL),(1096,'Przenośnik do odpadów stalowych','Przenośnik odpadów stalowych 07/01/15',52,'file://k1/Konstrukcyjny/Projekty-2/Linie segregacyjne/Instrukcje/Przenośnik do transportu odpadów stalowych - SOME/Instrukcja  -PTO-359.00.00.00 (Nr 07-01-15)-kpl AKTUALNA.pdf','podajnik do scinków metalowych\n',NULL,0,'A',NULL),(1097,'Przesiewacz Dyskowy','Przesiewacz Dyskowy 04/01/14',53,'file://k1/Konstrukcyjny/Projekty-2/Linie segregacyjne/Instrukcje/Przesiewacz dyskowy Głogów/Instrukcja DTR Przesiewacz dyskowy Głogów-kpl..pdf',NULL,NULL,0,'A',NULL),(1098,'USP Pegaz II','USP Pegaz II 06/14',54,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/PEGAZ_II/06_14 - Marcel/Instrukcja PEGAZ-II-06_14-korekcja - Aktualna.pdf','Kombajnowy',NULL,0,'A',NULL),(1099,'USP Pegaz II','USP Pegaz II 01/16',55,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/PEGAZ_II/01_16 - Piast/Instrukcja PEGAZ-II-01_16.pdf','Kombajnowy',NULL,8,'N',NULL),(1100,'USP Pegaz II','USP Pegaz II 02/16',55,'file://k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E/PEGAZ_II/02_16 - Piast/Instrukcja PEGAZ-II-02_16.pdf','Kombajnowy',NULL,8,'N',NULL);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger insert_stop before insert on Maszyny
     for each row
     begin
     if new.idMiejsca_Maszyny = (SELECT idMiejsca FROM Miejsca WHERE Miejsca.idMiejsca = new.idMiejsca_Maszyny AND typ_Miejsca = 'K') then
		signal sqlstate '45000' SET MESSAGE_TEXT = 'Nie mozna przyporzadkowac maszyny do kooperantu.', MYSQL_ERRNO = 1001;
	 elseif new.nrFabryczny_Maszyny = ANY (SELECT nrFabryczny_Maszyny FROM Maszyny) then
		signal sqlstate '45000' SET MESSAGE_TEXT = 'Numer fabryczny maszyny nie moze się powtarzac.', MYSQL_ERRNO = 1001;
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
-- Temporary table structure for view `maszyny_czesci_widok`
--

DROP TABLE IF EXISTS `maszyny_czesci_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_czesci_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `maszyny_czesci_widok` (
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Aktywność` tinyint NOT NULL,
  `Koniec gwarancji` tinyint NOT NULL,
  `Dokumentacja Link` tinyint NOT NULL,
  `Część` tinyint NOT NULL,
  `Nr części` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `maszyny_daneosobowe_widok`
--

DROP TABLE IF EXISTS `maszyny_daneosobowe_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_daneosobowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `maszyny_daneosobowe_widok` (
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Aktywność` tinyint NOT NULL,
  `Koniec gwarancji` tinyint NOT NULL,
  `Dokumentacja Link` tinyint NOT NULL,
  `Imię` tinyint NOT NULL,
  `Nazwisko` tinyint NOT NULL
) ENGINE=MyISAM */;
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
INSERT INTO `maszyny_has_czesci` VALUES (1083,1);
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
INSERT INTO `maszyny_has_daneosobowe` VALUES (1073,18),(1076,18),(1089,19);
/*!40000 ALTER TABLE `maszyny_has_daneosobowe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `maszyny_konkurencja_widok`
--

DROP TABLE IF EXISTS `maszyny_konkurencja_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_konkurencja_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `maszyny_konkurencja_widok` (
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Aktywność` tinyint NOT NULL,
  `Koniec gwarancji` tinyint NOT NULL,
  `Dokumentacja Link` tinyint NOT NULL,
  `Konkurencja` tinyint NOT NULL,
  `Opis konkurencji` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `maszyny_miejsca_widok`
--

DROP TABLE IF EXISTS `maszyny_miejsca_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_miejsca_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `maszyny_miejsca_widok` (
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL,
  `Miejsce` tinyint NOT NULL,
  `Dział` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Aktywność` tinyint NOT NULL,
  `Koniec gwarancji` tinyint NOT NULL,
  `Dokumentacja Link` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `maszyny_raportyserwisowe_widok`
--

DROP TABLE IF EXISTS `maszyny_raportyserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_raportyserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `maszyny_raportyserwisowe_widok` (
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Aktywność` tinyint NOT NULL,
  `Koniec gwarancji` tinyint NOT NULL,
  `Dokumentacja Link` tinyint NOT NULL,
  `Data raportu` tinyint NOT NULL,
  `Opis raportu` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `maszyny_widok`
--

DROP TABLE IF EXISTS `maszyny_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `maszyny_widok` (
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL,
  `Miejsce` tinyint NOT NULL,
  `Dział` tinyint NOT NULL,
  `Dokumentacja Link` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Nr zlecenia` tinyint NOT NULL,
  `Temat zlecenia` tinyint NOT NULL,
  `Aktywność` tinyint NOT NULL,
  `Koniec gwarancji` tinyint NOT NULL,
  `Sektor` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `maszyny_zgloszeniaserwisowe_widok`
--

DROP TABLE IF EXISTS `maszyny_zgloszeniaserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `maszyny_zgloszeniaserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `maszyny_zgloszeniaserwisowe_widok` (
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Aktywność` tinyint NOT NULL,
  `Koniec gwarancji` tinyint NOT NULL,
  `Dokumentacja Link` tinyint NOT NULL,
  `Nr zgłoszenia` tinyint NOT NULL,
  `Opis zgłoszenia` tinyint NOT NULL
) ENGINE=MyISAM */;
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miejsca`
--

LOCK TABLES `miejsca` WRITE;
/*!40000 ALTER TABLE `miejsca` DISABLE KEYS */;
INSERT INTO `miejsca` VALUES (0,'BRAK','BRAK','BRAK','BRAK',NULL,'M',0),(36,'Bogdanka','Pole Nadrybie','Puchaczów',NULL,NULL,'M',1),(37,'Bogdanka','Pole Stefanów',NULL,NULL,NULL,'M',1),(38,'Bogdanka','Pole Bogdanka',NULL,NULL,NULL,'M',1),(39,'Toruń','Ezo Recycling Toruń','ul.Płaska 26','wjazd od ul.Curie Skłodowskiej',NULL,'M',2),(40,'Gliwice Remondis','Remondis Gliwice',NULL,NULL,NULL,'M',2),(41,'Sucha Beskidzka','Sucha B. 15r.',NULL,NULL,NULL,'M',2),(42,'SIGMA','SIGMA',NULL,NULL,NULL,'M',1),(43,'DHMS','Meksyk',NULL,NULL,NULL,'M',1),(44,'Oświęcim','Oświęcim',NULL,NULL,NULL,'M',2),(45,'Pniówek KWK','Pniówek','',NULL,NULL,'M',1),(46,'Elektrownia Opole','El. Opole',NULL,NULL,NULL,'M',3),(47,'SObieski KWK','Sobieski',NULL,NULL,NULL,'M',1),(48,'Warszawa Remondis','Remondis W-Wa',NULL,NULL,NULL,'M',2),(51,'Komeko Lublin','Komeko L.',NULL,NULL,NULL,'M',2),(52,'SOME KSW SP. z o.o.','SOME','97-410 Kleszczów ul.Milenijna 4',NULL,NULL,'M',2),(53,'RIPOK','RiPOK GŁogów','Głogów  67-200  ul. Komunalna 3,',NULL,NULL,'M',2),(54,'Marcek KWK','Marcel',NULL,NULL,NULL,'M',1),(55,'Piast KWK','Piast',NULL,NULL,NULL,'M',1);
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
-- Temporary table structure for view `miejsca_czesci_widok`
--

DROP TABLE IF EXISTS `miejsca_czesci_widok`;
/*!50001 DROP VIEW IF EXISTS `miejsca_czesci_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `miejsca_czesci_widok` (
  `Miejsce` tinyint NOT NULL,
  `Dział` tinyint NOT NULL,
  `Adres` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Typ` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `miejsca_daneosobowe_widok`
--

DROP TABLE IF EXISTS `miejsca_daneosobowe_widok`;
/*!50001 DROP VIEW IF EXISTS `miejsca_daneosobowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `miejsca_daneosobowe_widok` (
  `Miejsce` tinyint NOT NULL,
  `Dział` tinyint NOT NULL,
  `Adres` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Typ` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `miejsca_widok`
--

DROP TABLE IF EXISTS `miejsca_widok`;
/*!50001 DROP VIEW IF EXISTS `miejsca_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `miejsca_widok` (
  `Miejsce` tinyint NOT NULL,
  `Dział` tinyint NOT NULL,
  `Adres` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Typ` tinyint NOT NULL,
  `Sektor` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `miejsca_zgloszeniaserwisowe_widok`
--

DROP TABLE IF EXISTS `miejsca_zgloszeniaserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `miejsca_zgloszeniaserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `miejsca_zgloszeniaserwisowe_widok` (
  `Miejsce` tinyint NOT NULL,
  `Dział` tinyint NOT NULL,
  `Adres` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Typ` tinyint NOT NULL,
  `Nr zgłoszenia` tinyint NOT NULL,
  `Opis zgłoszenia` tinyint NOT NULL
) ENGINE=MyISAM */;
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
  `idZgloszeniaserwisowe_Raportyserwisowe` int(10) unsigned DEFAULT '0',
  `serwisanci_Raportyserwisowe` varchar(300) DEFAULT NULL,
  `zalacznikLink_Raportyserwisowe` varchar(200) DEFAULT NULL,
  `godziny_Raportyserwisowe` int(11) DEFAULT NULL,
  `typ_Raportyserwisowe` enum('GW','PG','INNE') NOT NULL,
  PRIMARY KEY (`idRaportyserwisowe`),
  KEY `fk_Raportyserwisowe_Zgloszeniaserwisowe1_idx` (`idZgloszeniaserwisowe_Raportyserwisowe`),
  KEY `fk_Raportyserwisowe_Maszyny1_idx` (`idMaszyny_Raportyserwisowe`),
  CONSTRAINT `fk_Raportyserwisowe_Maszyny1` FOREIGN KEY (`idMaszyny_Raportyserwisowe`) REFERENCES `maszyny` (`idMaszyny`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Raportyserwisowe_Zgloszeniaserwisowe1` FOREIGN KEY (`idZgloszeniaserwisowe_Raportyserwisowe`) REFERENCES `zgloszeniaserwisowe` (`idZgloszeniaserwisowe`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raportyserwisowe`
--

LOCK TABLES `raportyserwisowe` WRITE;
/*!40000 ALTER TABLE `raportyserwisowe` DISABLE KEYS */;
INSERT INTO `raportyserwisowe` VALUES (1,'2015-08-26',1084,'weryfikacja stanu po wydaniu na powierzchnię',NULL,0,'M.Kowalski; E.Czerny','file://k1/Serwis/Raporty serwisowe/DTG/KWK Pniówek/2015/Pegaz 06_13/SKM_C364e15082806240.pdf',8,'GW'),(2,'2015-08-24',1086,'przegląd okresowy',NULL,0,'S.Moryc','file://k1/Serwis/Raporty serwisowe/DTPO/PGE El. Opole/2015/SKM_C364e15082806230.pdf',8,'GW'),(5,'2015-08-31',1080,'przegląd',NULL,0,'M.Pajka',NULL,4,'GW'),(6,'2015-11-13',1077,'uszkodzenia ramion',NULL,15,NULL,'file://k1/Serwis/Historia/Panda 02_15/Raport z analizy zlec 456.doc',NULL,'GW'),(7,'2016-01-22',1096,'awaria szycia',NULL,22,'P.Baran; E.Czerny',NULL,8,'GW'),(8,'2016-01-26',1096,'Awaria szycia',NULL,22,'P.Baran; E.Czerny',NULL,8,'GW'),(9,'2016-02-12',1097,'drgania - poluzowanie nakrętek tulei wciąganych',NULL,23,'P.Baran; E.Czerny',NULL,NULL,'GW');
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
-- Temporary table structure for view `raportyserwisowe_widok`
--

DROP TABLE IF EXISTS `raportyserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `raportyserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `raportyserwisowe_widok` (
  `Data` tinyint NOT NULL,
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL,
  `Miejsce` tinyint NOT NULL,
  `Dział` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Nr zgłoszenia` tinyint NOT NULL,
  `Opis zgłoszenia` tinyint NOT NULL,
  `Serwisanci` tinyint NOT NULL,
  `Załącznik Link` tinyint NOT NULL,
  `Godziny` tinyint NOT NULL,
  `Typ` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `raportyserwisowe_zgloszeniaserwisowe_widok`
--

DROP TABLE IF EXISTS `raportyserwisowe_zgloszeniaserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `raportyserwisowe_zgloszeniaserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `raportyserwisowe_zgloszeniaserwisowe_widok` (
  `Data` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Nr zgłoszenia` tinyint NOT NULL,
  `Opis zgłoszenia` tinyint NOT NULL,
  `Serwisanci` tinyint NOT NULL,
  `Załącznik Link` tinyint NOT NULL,
  `Godziny` tinyint NOT NULL,
  `Typ` tinyint NOT NULL
) ENGINE=MyISAM */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zgloszeniaserwisowe`
--

LOCK TABLES `zgloszeniaserwisowe` WRITE;
/*!40000 ALTER TABLE `zgloszeniaserwisowe` DISABLE KEYS */;
INSERT INTO `zgloszeniaserwisowe` VALUES (0,'BRAK',0,'BRAK',NULL,'2000-01-01','N','INNE','BRAK','2000-01-01','BRAK'),(1,'17.07.15',1073,'Stojak cieknie 31-170/160/135/115x810 \npismo - DL/DLJ/ŁC/2430/5361/2015',NULL,'2015-07-24','N','GW',NULL,NULL,NULL),(2,'06.07.15',1074,'siłownik ramienia fi90/fi160/fi120/fi70x983 URW-336.03.06.00-11\npismo nr 5086',NULL,'2015-07-16','N','GW',NULL,'2015-09-30','anulowano przez LW'),(3,'06.07.15.1',1075,'sił. korekcyjny fi75/fi40x150 UDR-33.39.00.00-10.2\npismo nr 5084',NULL,'2015-07-06','N','GW',NULL,NULL,NULL),(4,'06.07.15.2',1074,'sił. przekładkowy fi160/fi100x900 UDR-33.42.00.00-16.5 - wygiety\npismo nr - 5085',NULL,'2015-07-16','N','GW',NULL,'2015-09-30','anulowane przez LW'),(6,'11.08.15',1073,'multiwąż cieknie 20F 3m\npismo nr 6074',NULL,'2015-08-25','N','GW',NULL,'2015-11-13','naprawiono gw'),(7,'11.08.15.1',1076,'multiwąż cieknie 20F 3m\npismo nr 6074',NULL,'2015-08-25','N','GW',NULL,'2015-11-13','naprawiono gw'),(8,'11.08.15.2',1077,'siłownik skrętu ramienia- uszkodzony\npismo nr 6075',NULL,'2015-08-25','N','GW',NULL,NULL,NULL),(9,'25.05.15',1077,'silownik fi90/fi63x100 UDR-33.65.06.00-16.5\npismo nr 3867',NULL,'2015-06-02','N','GW',NULL,'2015-09-30','anulowane przez LW'),(10,'02.06.15',1075,'siłownik ramienia lewego  fi90/fi63x100 UDR-33.65.06.00-16.5\nsiłownik fi120/fi100/fi80/fi50x618 URW-336.65.03.06-20\npismo nr 4246',NULL,'2015-06-15','N','GW',NULL,'2015-09-30','anulowano przez LW'),(11,'19.05.15',1077,'stojak fi210/fi200/fi160/fi140x1400 H-B.B.031.B/1 - wyciek\nsiłownik ramienia fi120/fi100/fi80/fi50x618 x2 szt\nwycieki\n\npismo nr 3869',NULL,'2015-06-02','N','GW',NULL,NULL,NULL),(12,'22.04.15',1089,'cieknie olej z bębna zwrotnego - posłany bęben zastepczy','file://k1/Serwis/Raporty serwisowe/DTG/KWK Sobieski/Waran 01_14/Historia.docx','2015-02-04','N','GW',NULL,NULL,'bęben zmodernizowany - dosłany na kopalnię'),(13,'31.08.15',1090,'pęknięty wał',NULL,'2015-08-30','A','GW',NULL,NULL,NULL),(14,'21.10.15',1093,'cieknie stojak G175/14-2 pismo DL/DLJ/ŁF/2430/7437/15',NULL,NULL,'N','GW',NULL,NULL,'anulowane przez LW'),(15,'20.11.15',1077,'ramiona- niszczą siłowniki (zbyt duży luz) pismo 8297','file://k1/Serwis/Historia/Panda 02_15/Raport z analizy zlec 456.doc','2015-11-20','N','GW',NULL,'2015-11-25','dostarczono do LW  25.11.15'),(16,'10.11.15',1077,'stojak lemniskaty- uszkodzony, pismo 8004',NULL,'2015-11-10','N','GW',NULL,NULL,NULL),(17,'19.10.15',1077,'lemniskat + stojak lemniskatu - uszkodzone, pismo 7356',NULL,'2015-10-19','N','GW',NULL,'2015-12-10','odzrzucono, zwrócono 10.12.15r.'),(18,'16.11.15',1077,'płyta ramion, urwane ucho - pismo 8147',NULL,'2000-01-01','N','GW',NULL,'2015-11-25','dostarczono do LW  25.11.15'),(19,'26.11.15',1094,'Cieknie stojak pismo 8474',NULL,'2015-11-26','N','GW',NULL,'2015-11-30','dostarczamy doszczelnienie'),(20,'09.12.15',1094,'brak wpustów w stropnicach - pismo 8798',NULL,'2015-12-10','N','GW',NULL,NULL,'modernizacja w Sigma - zrobione'),(21,'01.12.15',1095,'Cieknie siłownik, brudny olej',NULL,'2015-12-01','A','GW',NULL,NULL,NULL),(22,'22.01.16',1096,'awaria szycia taśmy',NULL,'2016-01-22','A','GW',NULL,NULL,NULL),(23,'11.02.16',1097,'wibracje maszyny',NULL,'2016-02-11','N','GW',NULL,'2016-12-02','usunięto awarię');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger insert_zgloszenie before insert on Zgloszeniaserwisowe
     for each row
     begin
     if new.numer_Zgloszeniaserwisowe = ANY (SELECT numer_Zgloszeniaserwisowe FROM Zgloszeniaserwisowe WHERE numer_Zgloszeniaserwisowe=new.numer_Zgloszeniaserwisowe) THEN
     signal sqlstate '45000'SET MESSAGE_TEXT = 'Wpisany numer zgloszenia juz istnieje.', MYSQL_ERRNO = 1001;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger update_zgloszenie before update on Zgloszeniaserwisowe
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
-- Temporary table structure for view `zgloszeniaserwisowe_miejsca_widok`
--

DROP TABLE IF EXISTS `zgloszeniaserwisowe_miejsca_widok`;
/*!50001 DROP VIEW IF EXISTS `zgloszeniaserwisowe_miejsca_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `zgloszeniaserwisowe_miejsca_widok` (
  `Nr zgłoszenia` tinyint NOT NULL,
  `Data zgłoszenia` tinyint NOT NULL,
  `Data zakończenia` tinyint NOT NULL,
  `Aktywność` tinyint NOT NULL,
  `Wynik` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Typ zgłoszenia` tinyint NOT NULL,
  `Link` tinyint NOT NULL,
  `Miejsce maszyny` tinyint NOT NULL,
  `Nazwa działu` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `zgloszeniaserwisowe_raportyserwisowe_widok`
--

DROP TABLE IF EXISTS `zgloszeniaserwisowe_raportyserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `zgloszeniaserwisowe_raportyserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `zgloszeniaserwisowe_raportyserwisowe_widok` (
  `Numer` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Data rozpoczęcia` tinyint NOT NULL,
  `Aktywność` tinyint NOT NULL,
  `Typ` tinyint NOT NULL,
  `Link` tinyint NOT NULL,
  `Data zakończenia` tinyint NOT NULL,
  `Wynik` tinyint NOT NULL,
  `Data raportu` tinyint NOT NULL,
  `Opis raportu` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `zgloszeniaserwisowe_widok`
--

DROP TABLE IF EXISTS `zgloszeniaserwisowe_widok`;
/*!50001 DROP VIEW IF EXISTS `zgloszeniaserwisowe_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `zgloszeniaserwisowe_widok` (
  `Nr zgłoszenia` tinyint NOT NULL,
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL,
  `Miejsce` tinyint NOT NULL,
  `Dział` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Data rozpoczęcia` tinyint NOT NULL,
  `Aktywność` tinyint NOT NULL,
  `Typ` tinyint NOT NULL,
  `Link` tinyint NOT NULL,
  `Data zakończenia` tinyint NOT NULL,
  `Wynik` tinyint NOT NULL
) ENGINE=MyISAM */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zlecenia`
--

LOCK TABLES `zlecenia` WRITE;
/*!40000 ALTER TABLE `zlecenia` DISABLE KEYS */;
INSERT INTO `zlecenia` VALUES (0,'BRAK','BRAK','BRAK','BRAK','BRAK',NULL),(1,'168/04/14\n','Pegazy strugowe Bogdanka - 2szt.',NULL,NULL,'TEST\n\n\n\n\n\nTEST',NULL),(2,'223/04/15\n','Gliwice Remondis Linia RDF','file://k1/Realizacje/DOŚ -- Dział Ochrony Środowiska/2015/223_04_15 (Remondis Gliwice linia RDF).xls',NULL,NULL,NULL),(4,'317a/07/15\n','(Podajnik taśmowy 800 6m do kombajnu - DHMS_Egipt)','file://k1/Realizacje/PDT BOA PRT -- Podajnik taśmowy/2015/317a_07_15 (Podajnik taśmowy 800 6m do kombajnu - DHMS_Egipt).xls',NULL,NULL,NULL),(5,'317b/07/15\n','(Podajnik taśmowy 800 6m do kombajnu - DHMS_Egipt)','file://k1/Realizacje/PDT BOA PRT -- Podajnik taśmowy/2015/317b_07_15 (Podajnik taśmowy 800 6m do kombajnu - DHMS_Egipt).xls',NULL,NULL,NULL),(7,'54/01/14','Waran Sobieski',NULL,NULL,NULL,NULL),(8,'18/01/16 (435/11/15)','Pegaz II - 2szt.',NULL,NULL,NULL,NULL);
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
-- Temporary table structure for view `zlecenia_maszyny_widok`
--

DROP TABLE IF EXISTS `zlecenia_maszyny_widok`;
/*!50001 DROP VIEW IF EXISTS `zlecenia_maszyny_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `zlecenia_maszyny_widok` (
  `Nr zlecenia` tinyint NOT NULL,
  `Temat zlecenia` tinyint NOT NULL,
  `Harmonogram Link` tinyint NOT NULL,
  `Spis wysyłkowy Link` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL,
  `Maszyna` tinyint NOT NULL,
  `Nr fabryczny` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `zlecenia_widok`
--

DROP TABLE IF EXISTS `zlecenia_widok`;
/*!50001 DROP VIEW IF EXISTS `zlecenia_widok`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `zlecenia_widok` (
  `Nr zlecenia` tinyint NOT NULL,
  `Temat` tinyint NOT NULL,
  `Harmonogram Link` tinyint NOT NULL,
  `Spis wysyłkowy Link` tinyint NOT NULL,
  `Opis` tinyint NOT NULL,
  `Historia Link` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'serwis_v8'
--

--
-- Dumping routines for database 'serwis_v8'
--
/*!50003 DROP PROCEDURE IF EXISTS `addItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `addItems`(number INT)
BEGIN
  label1: LOOP
    SET number = number - 1;
    INSERT INTO Maszyny (idMaszyny, nazwa_Maszyny, nrFabryczny_Maszyny, idMiejsca_Maszyny, opis_Maszyny, historia_Maszyny, idZlecenia_Maszyny, czyAktywna_Maszyny, koniecGwarancji_Maszyny, dokumentacjaLink_Maszyny) VALUES
    (DEFAULT, 'TEST', 'TEST', 0, 'TEST', 'TEST', 0, 'A', '2000-01-01', 'TEST');
    IF number <> 0 THEN ITERATE label1; END IF;
    LEAVE label1;
  END LOOP label1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `raporty_zgloszenia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `raporty_zgloszenia`()
BEGIN
                               UPDATE Raportyserwisowe, Zgloszeniaserwisowe
                               SET Raportyserwisowe.idMaszyny_Raportyserwisowe = Zgloszeniaserwisowe.idMaszyny_Zgloszeniaserwisowe
                               WHERE Raportyserwisowe.idZgloszeniaserwisowe_Raportyserwisowe = Zgloszeniaserwisowe.idZgloszeniaserwisowe AND Zgloszeniaserwisowe.idMaszyny_Zgloszeniaserwisowe != 0;
                               
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `czesci_maszyny_widok`
--

/*!50001 DROP TABLE IF EXISTS `czesci_maszyny_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `czesci_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `daneosobowe_maszyny_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `daneosobowe_miejsca_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `daneosobowe_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `konkurencja_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `maszyny_czesci_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `maszyny_daneosobowe_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `maszyny_konkurencja_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `maszyny_miejsca_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `maszyny_raportyserwisowe_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `maszyny_widok`*/;
/*!50001 DROP VIEW IF EXISTS `maszyny_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `maszyny_widok` AS select `maszyny`.`nazwa_Maszyny` AS `Maszyna`,`maszyny`.`nrFabryczny_Maszyny` AS `Nr fabryczny`,`miejsca`.`nazwa_Miejsca` AS `Miejsce`,`miejsca`.`nazwaDzialu_Miejsca` AS `Dział`,`maszyny`.`dokumentacjaLink_Maszyny` AS `Dokumentacja Link`,`maszyny`.`opis_Maszyny` AS `Opis`,`maszyny`.`historia_Maszyny` AS `Historia Link`,`zlecenia`.`nr_Zlecenia` AS `Nr zlecenia`,`zlecenia`.`temat_Zlecenia` AS `Temat zlecenia`,`maszyny`.`czyAktywna_Maszyny` AS `Aktywność`,`maszyny`.`koniecGwarancji_Maszyny` AS `Koniec gwarancji`,`sektory`.`nazwa_Sektory` AS `Sektor` from (((`maszyny` left join `miejsca` on((`miejsca`.`idMiejsca` = `maszyny`.`idMiejsca_Maszyny`))) left join `sektory` on((`sektory`.`idSektory` = `miejsca`.`idSektory_Miejsca`))) left join `zlecenia` on((`zlecenia`.`idZlecenia` = `maszyny`.`idZlecenia_Maszyny`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maszyny_zgloszeniaserwisowe_widok`
--

/*!50001 DROP TABLE IF EXISTS `maszyny_zgloszeniaserwisowe_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `miejsca_czesci_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `miejsca_daneosobowe_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `miejsca_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `miejsca_zgloszeniaserwisowe_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `raportyserwisowe_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `raportyserwisowe_zgloszeniaserwisowe_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `zgloszeniaserwisowe_miejsca_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `zgloszeniaserwisowe_raportyserwisowe_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `zgloszeniaserwisowe_widok`*/;
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

/*!50001 DROP TABLE IF EXISTS `zlecenia_maszyny_widok`*/;
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

--
-- Final view structure for view `zlecenia_widok`
--

/*!50001 DROP TABLE IF EXISTS `zlecenia_widok`*/;
/*!50001 DROP VIEW IF EXISTS `zlecenia_widok`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `zlecenia_widok` AS select `zlecenia`.`nr_Zlecenia` AS `Nr zlecenia`,`zlecenia`.`temat_Zlecenia` AS `Temat`,`zlecenia`.`harmonogramLink_Zlecenia` AS `Harmonogram Link`,`zlecenia`.`spisWysylkowyLink_Zlecenia` AS `Spis wysyłkowy Link`,`zlecenia`.`opis_Zlecenia` AS `Opis`,`zlecenia`.`historia_Zlecenia` AS `Historia Link` from `zlecenia` */;
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

-- Dump completed on 2016-02-29  8:32:32
