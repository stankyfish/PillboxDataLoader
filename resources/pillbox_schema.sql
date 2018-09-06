-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: pillbox
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `dea_schedule`
--

DROP TABLE IF EXISTS `dea_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dea_schedule` (
  `code` varchar(6) NOT NULL,
  `name` varchar(45) NOT NULL,
  `term` varchar(6) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dea_schedule`
--

LOCK TABLES `dea_schedule` WRITE;
/*!40000 ALTER TABLE `dea_schedule` DISABLE KEYS */;
INSERT INTO `dea_schedule` VALUES ('C48672','Schedule I','CI'),('C48675','Schedule II','CII'),('C48676','Schedule III','CIII'),('C48677','Schedule IV','CIV'),('C48679','Schedule V','CV');
/*!40000 ALTER TABLE `dea_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pills`
--

DROP TABLE IF EXISTS `pills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pills` (
  `id` int(11) NOT NULL,
  `spl_id` varchar(32) DEFAULT NULL,
  `SETID` varchar(64) DEFAULT NULL,
  `spp` varchar(64) DEFAULT NULL,
  `NDC9` int(11) DEFAULT NULL,
  `PRODUCT_CODE` varchar(16) DEFAULT NULL,
  `EQUAL_PRODUCT_CODE` varchar(16) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `SPLIMPRINT` varchar(64) DEFAULT NULL,
  `SPLCOLOR` varchar(32) DEFAULT NULL,
  `SPLSHAPE` varchar(32) DEFAULT NULL,
  `SPLSIZE` decimal(10,0) DEFAULT NULL,
  `SPLSCORE` int(11) DEFAULT NULL,
  `DEA_SCHEDULE_CODE` varchar(16) DEFAULT NULL,
  `INGREDIENTS` varchar(1024) DEFAULT NULL,
  `SPL_INACTIVE_ING` varchar(1024) DEFAULT NULL,
  `RXCUI` varchar(64) DEFAULT NULL,
  `RXTTY` varchar(255) DEFAULT NULL,
  `RXSTRING` varchar(1024) DEFAULT NULL,
  `image_id` varchar(64) DEFAULT NULL,
  `IMAGE_SOURCE` varchar(32) DEFAULT NULL,
  `HAS_IMAGE` tinyint(4) DEFAULT NULL,
  `FROM_SIS` varchar(45) DEFAULT NULL,
  `NO_RXCUI` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pills_dea_schedule_idx` (`DEA_SCHEDULE_CODE`),
  CONSTRAINT `pills_dea_schedule` FOREIGN KEY (`DEA_SCHEDULE_CODE`) REFERENCES `dea_schedule` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pills`
--

LOCK TABLES `pills` WRITE;
/*!40000 ALTER TABLE `pills` DISABLE KEYS */;
/*!40000 ALTER TABLE `pills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `splcolor`
--

DROP TABLE IF EXISTS `splcolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `splcolor` (
  `code` varchar(6) NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  `definition` varchar(18) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `splcolor`
--

LOCK TABLES `splcolor` WRITE;
/*!40000 ALTER TABLE `splcolor` DISABLE KEYS */;
INSERT INTO `splcolor` VALUES ('C48323','BLACK','rgb(0, 0, 0)'),('C48324','GRAY','rgb(128, 128, 128)'),('C48325','WHITE','rgb(255, 255, 255)'),('C48326','RED','rgb(255, 0, 0)'),('C48327','PURPLE','rgb(128, 0, 128)'),('C48328','PINK','rgb(255, 192, 203)'),('C48329','GREEN','rgb(0, 128, 0)'),('C48330','YELLOW','rgb(255, 255, 0)'),('C48331','ORANGE','rgb(255, 165, 0)'),('C48332','BROWN','rgb(165, 42, 42)'),('C48333','BLUE','rgb(0, 0, 255)'),('C48334','TURQUOISE','rgb(64, 224, 208)');
/*!40000 ALTER TABLE `splcolor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `splshape`
--

DROP TABLE IF EXISTS `splshape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `splshape` (
  `code` varchar(6) NOT NULL,
  `shape` varchar(45) DEFAULT NULL,
  `silhouette` binary(1) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `splshape`
--

LOCK TABLES `splshape` WRITE;
/*!40000 ALTER TABLE `splshape` DISABLE KEYS */;
INSERT INTO `splshape` VALUES ('C48335','BULLET',NULL),('C48336','CAPSULE',NULL),('C48337','CLOVER',NULL),('C48338','DIAMOND',NULL),('C48339','DOUBLE CIRCLE',NULL),('C48340','FREEFORM',NULL),('C48341','GEAR',NULL),('C48342','HEPTAGON (7 sided)',NULL),('C48345','OVAL',NULL),('C48346','PENTAGON (5 sided)',NULL),('C48347','RECTANGLE',NULL),('C48348','ROUND',NULL),('C48349','SEMI-CIRCLE',NULL),('C48350','SQUARE',NULL),('C48351','TEAR',NULL),('C48352','TRAPEZOID',NULL),('C48353','TRIANGLE',NULL);
/*!40000 ALTER TABLE `splshape` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-22 17:50:36
