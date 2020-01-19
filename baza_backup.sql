-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: warhammer
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `Alliance`
--

DROP TABLE IF EXISTS `Alliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alliance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Info` varchar(200) DEFAULT NULL,
  `Image` blob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alliance`
--

LOCK TABLES `Alliance` WRITE;
/*!40000 ALTER TABLE `Alliance` DISABLE KEYS */;
INSERT INTO `Alliance` VALUES (1,'Order',NULL,NULL),(3,'Chaos',NULL,NULL),(4,'Death',NULL,NULL),(5,'Destruction',NULL,NULL);
/*!40000 ALTER TABLE `Alliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Army`
--

DROP TABLE IF EXISTS `Army`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Army` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Info` varchar(200) DEFAULT NULL,
  `SpecialRule` varchar(100) DEFAULT NULL,
  `AllianceID` int(11) NOT NULL,
  `Localization` varchar(100) DEFAULT NULL,
  `Image` blob,
  PRIMARY KEY (`ID`),
  KEY `AllianceID` (`AllianceID`),
  CONSTRAINT `Army_ibfk_1` FOREIGN KEY (`AllianceID`) REFERENCES `Alliance` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Army`
--

LOCK TABLES `Army` WRITE;
/*!40000 ALTER TABLE `Army` DISABLE KEYS */;
INSERT INTO `Army` VALUES (1,'Lizardmen','dangerous lizards','Poisoned Blowpipe',1,NULL,NULL),(2,'Wood Elves','Forest elves','Forest longbows',1,NULL,NULL),(3,'Wood Elves','Forest elves','Forest longbows',1,NULL,NULL),(4,'Dwarf','Small people with beards','Iron axes',1,NULL,NULL),(5,'Daemons of Chaos','Horrible creatures from another dimension','Scream of demons',3,NULL,NULL),(6,'Warriors of Chaos','Deadly warriors with no souls','Seal of the god of Chaos',3,NULL,NULL),(7,'Tomb Kings','Nekehar undeads','\"My will be done\"',4,NULL,NULL),(8,'Vampire Counts','Undead rising from graves','Scream of death',4,NULL,NULL),(9,'Flesh-eater Courts','Death Ghouls from darkness','Hunger',4,NULL,NULL),(10,'Goblins','Tiny greenskins','Gorks stomp',5,NULL,NULL),(11,'Ogres','Bully warriors','Bull charge',5,NULL,NULL),(12,'Orcs','Greenskin warriors with axes','Fury',5,NULL,NULL),(16,'Testowa Armia moja','informacje tane','super specjalna zasada',4,NULL,NULL),(17,'Testowa Armia moja','informacje tane','super specjalna zasada',4,NULL,NULL),(23,'dsa','da','dcc',1,NULL,NULL);
/*!40000 ALTER TABLE `Army` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hero`
--

DROP TABLE IF EXISTS `Hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hero` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `Info` varchar(200) DEFAULT NULL,
  `Movement` int(11) DEFAULT NULL,
  `WeaponSkill` smallint(6) DEFAULT NULL,
  `BalisticSkill` smallint(6) DEFAULT NULL,
  `Strength` smallint(6) DEFAULT NULL,
  `Toughness` smallint(6) DEFAULT NULL,
  `Wounds` smallint(6) DEFAULT NULL,
  `Initiative` smallint(6) DEFAULT NULL,
  `Attacks` smallint(6) DEFAULT NULL,
  `Leadership` smallint(6) DEFAULT NULL,
  `SpecialRuleName` varchar(100) NOT NULL,
  `ArmyID` int(11) NOT NULL,
  `PointCost` int(11) DEFAULT NULL,
  `Image` blob,
  PRIMARY KEY (`ID`),
  KEY `ArmyID` (`ArmyID`),
  KEY `TypeID` (`TypeID`),
  KEY `SpecialRuleName` (`SpecialRuleName`),
  CONSTRAINT `Hero_ibfk_1` FOREIGN KEY (`ArmyID`) REFERENCES `Army` (`ID`),
  CONSTRAINT `Hero_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `UnitType` (`ID`),
  CONSTRAINT `Hero_ibfk_3` FOREIGN KEY (`SpecialRuleName`) REFERENCES `SpecialRule` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hero`
--

LOCK TABLES `Hero` WRITE;
/*!40000 ALTER TABLE `Hero` DISABLE KEYS */;
INSERT INTO `Hero` VALUES (1,'Saurus Scar Veteran',3,'Lizardmen Hero',5,5,1,4,5,4,3,4,9,'Killing Blow',1,NULL,NULL);
/*!40000 ALTER TABLE `Hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecialRule`
--

DROP TABLE IF EXISTS `SpecialRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecialRule` (
  `Name` varchar(100) NOT NULL,
  `Description` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecialRule`
--

LOCK TABLES `SpecialRule` WRITE;
/*!40000 ALTER TABLE `SpecialRule` DISABLE KEYS */;
INSERT INTO `SpecialRule` VALUES ('Great Weapon','Add +2 to Strength when not charging'),('Killing Blow','On Hit rolls of 6, do not make wound test'),('none','none');
/*!40000 ALTER TABLE `SpecialRule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Unit`
--

DROP TABLE IF EXISTS `Unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Unit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `Info` varchar(200) DEFAULT NULL,
  `Movement` int(11) DEFAULT NULL,
  `WeaponSkill` smallint(6) DEFAULT NULL,
  `BalisticSkill` smallint(6) DEFAULT NULL,
  `Strength` smallint(6) DEFAULT NULL,
  `Toughness` smallint(6) DEFAULT NULL,
  `Wounds` smallint(6) DEFAULT NULL,
  `Initiative` smallint(6) DEFAULT NULL,
  `Attacks` smallint(6) DEFAULT NULL,
  `Leadership` smallint(6) DEFAULT NULL,
  `SpecialRuleName` varchar(100) NOT NULL,
  `ArmyID` int(11) NOT NULL,
  `PointCost` int(11) DEFAULT NULL,
  `Image` blob,
  PRIMARY KEY (`ID`),
  KEY `ArmyID` (`ArmyID`),
  KEY `TypeID` (`TypeID`),
  KEY `SpecialRuleName` (`SpecialRuleName`),
  CONSTRAINT `Unit_ibfk_1` FOREIGN KEY (`ArmyID`) REFERENCES `Army` (`ID`),
  CONSTRAINT `Unit_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `UnitType` (`ID`),
  CONSTRAINT `Unit_ibfk_3` FOREIGN KEY (`SpecialRuleName`) REFERENCES `SpecialRule` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Unit`
--

LOCK TABLES `Unit` WRITE;
/*!40000 ALTER TABLE `Unit` DISABLE KEYS */;
INSERT INTO `Unit` VALUES (1,'Saurus Warrios',3,'Lizard warrior',5,3,0,4,4,1,5,2,9,'none',1,NULL,NULL),(2,'Skink',4,'Tiny lizad with blowpipe',5,2,3,3,2,1,5,2,9,'none',1,NULL,NULL),(3,'Temple Guard',3,'Armoured Saurus warrior',6,4,0,4,4,1,5,3,9,'none',1,NULL,NULL),(4,'Glade Rider',2,'Elves calavry with bows',10,3,4,3,4,1,9,1,9,'none',2,NULL,NULL),(5,'Iron Gut',5,'Big bulls with great weapons',5,3,1,4,4,3,2,3,6,'Great Weapon',11,NULL,NULL);
/*!40000 ALTER TABLE `Unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UnitType`
--

DROP TABLE IF EXISTS `UnitType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UnitType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `BaseSize` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnitType`
--

LOCK TABLES `UnitType` WRITE;
/*!40000 ALTER TABLE `UnitType` DISABLE KEYS */;
INSERT INTO `UnitType` VALUES (2,'Cavalry','50x25'),(3,'Infantry','25x25'),(4,'Light infantry','20x20'),(5,'Heavy infantry','30x30');
/*!40000 ALTER TABLE `UnitType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2020-01-19 20:17:37
