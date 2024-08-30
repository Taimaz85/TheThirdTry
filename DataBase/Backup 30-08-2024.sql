-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bitnjoy
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `tbl_additionalamount`
--

DROP TABLE IF EXISTS `tbl_additionalamount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_additionalamount` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `AmountCalculationTypeID` int NOT NULL,
  `Amount` double NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AmountCalculationTypeID` (`AmountCalculationTypeID`),
  CONSTRAINT `tbl_additionalamount_ibfk_1` FOREIGN KEY (`AmountCalculationTypeID`) REFERENCES `tbl_amountcalculationtype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_additionalamount`
--

LOCK TABLES `tbl_additionalamount` WRITE;
/*!40000 ALTER TABLE `tbl_additionalamount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_additionalamount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_amountcalculationtype`
--

DROP TABLE IF EXISTS `tbl_amountcalculationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_amountcalculationtype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `CurrencyTypeID` int DEFAULT NULL,
  `Value` double NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CurrencyTypeID` (`CurrencyTypeID`),
  CONSTRAINT `tbl_amountcalculationtype_ibfk_1` FOREIGN KEY (`CurrencyTypeID`) REFERENCES `tbl_currencytype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_amountcalculationtype`
--

LOCK TABLES `tbl_amountcalculationtype` WRITE;
/*!40000 ALTER TABLE `tbl_amountcalculationtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_amountcalculationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_brandname`
--

DROP TABLE IF EXISTS `tbl_brandname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_brandname` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_brandname`
--

LOCK TABLES `tbl_brandname` WRITE;
/*!40000 ALTER TABLE `tbl_brandname` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_brandname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comment`
--

DROP TABLE IF EXISTS `tbl_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_comment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `Comment` text,
  `Vote` int DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `tbl_comment_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `tbl_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comment`
--

LOCK TABLES `tbl_comment` WRITE;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_currencyparityrate`
--

DROP TABLE IF EXISTS `tbl_currencyparityrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_currencyparityrate` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirstCurrencyID` int NOT NULL,
  `SecondCurrencyID` int NOT NULL,
  `Rate` decimal(10,0) NOT NULL,
  `UpdateDateTime` datetime NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FirstCurrencyID` (`FirstCurrencyID`),
  KEY `SecondCurrencyID` (`SecondCurrencyID`),
  CONSTRAINT `tbl_currencyparityrate_ibfk_1` FOREIGN KEY (`FirstCurrencyID`) REFERENCES `tbl_currencytype` (`ID`),
  CONSTRAINT `tbl_currencyparityrate_ibfk_2` FOREIGN KEY (`SecondCurrencyID`) REFERENCES `tbl_currencytype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_currencyparityrate`
--

LOCK TABLES `tbl_currencyparityrate` WRITE;
/*!40000 ALTER TABLE `tbl_currencyparityrate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_currencyparityrate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_currencytype`
--

DROP TABLE IF EXISTS `tbl_currencytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_currencytype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `CurrencyCode` varchar(10) DEFAULT NULL,
  `Value` double DEFAULT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_currencytype`
--

LOCK TABLES `tbl_currencytype` WRITE;
/*!40000 ALTER TABLE `tbl_currencytype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_currencytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_discountamount`
--

DROP TABLE IF EXISTS `tbl_discountamount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_discountamount` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `AmountCalculationTypeID` int NOT NULL,
  `Amount` double NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AmountCalculationTypeID` (`AmountCalculationTypeID`),
  CONSTRAINT `tbl_discountamount_ibfk_1` FOREIGN KEY (`AmountCalculationTypeID`) REFERENCES `tbl_amountcalculationtype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_discountamount`
--

LOCK TABLES `tbl_discountamount` WRITE;
/*!40000 ALTER TABLE `tbl_discountamount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_discountamount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_foodstuff`
--

DROP TABLE IF EXISTS `tbl_foodstuff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_foodstuff` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `PictureURL` text,
  `MineralID` int DEFAULT NULL,
  `MineralQuantity` double DEFAULT NULL,
  `MineralWeightTypeID` int DEFAULT NULL,
  `VitaminID` int DEFAULT NULL,
  `VitaminQuantity` double DEFAULT NULL,
  `VitaminWeightTypeID` int DEFAULT NULL,
  `Calorie` int DEFAULT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  KEY `MineralID` (`MineralID`),
  KEY `MineralWeightTypeID` (`MineralWeightTypeID`),
  KEY `VitaminID` (`VitaminID`),
  KEY `VitaminWeightTypeID` (`VitaminWeightTypeID`),
  CONSTRAINT `tbl_foodstuff_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `tbl_user` (`ID`),
  CONSTRAINT `tbl_foodstuff_ibfk_2` FOREIGN KEY (`MineralID`) REFERENCES `tbl_mineral` (`ID`),
  CONSTRAINT `tbl_foodstuff_ibfk_3` FOREIGN KEY (`MineralWeightTypeID`) REFERENCES `tbl_weighttype` (`ID`),
  CONSTRAINT `tbl_foodstuff_ibfk_4` FOREIGN KEY (`VitaminID`) REFERENCES `tbl_vitamin` (`ID`),
  CONSTRAINT `tbl_foodstuff_ibfk_5` FOREIGN KEY (`VitaminWeightTypeID`) REFERENCES `tbl_weighttype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_foodstuff`
--

LOCK TABLES `tbl_foodstuff` WRITE;
/*!40000 ALTER TABLE `tbl_foodstuff` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_foodstuff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_language`
--

DROP TABLE IF EXISTS `tbl_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_language` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `FlagURL` text,
  `Unicode` varchar(30) NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_language`
--

LOCK TABLES `tbl_language` WRITE;
/*!40000 ALTER TABLE `tbl_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_manufacturingcompany`
--

DROP TABLE IF EXISTS `tbl_manufacturingcompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_manufacturingcompany` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Tell` varchar(14) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_manufacturingcompany`
--

LOCK TABLES `tbl_manufacturingcompany` WRITE;
/*!40000 ALTER TABLE `tbl_manufacturingcompany` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_manufacturingcompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mineral`
--

DROP TABLE IF EXISTS `tbl_mineral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mineral` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mineral`
--

LOCK TABLES `tbl_mineral` WRITE;
/*!40000 ALTER TABLE `tbl_mineral` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_mineral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_order` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `ProductID` int NOT NULL,
  `WeightTypeID` int NOT NULL,
  `ProductWeightAmount` int NOT NULL,
  `ProductPrice` double NOT NULL,
  `CurrencyTypeID` int NOT NULL,
  `DiscountAmountID` int NOT NULL,
  `AdditionalAmountID` int NOT NULL,
  `TotalAmount` double NOT NULL,
  `PaymentTypeID` int NOT NULL,
  `PaymentVerificationTypeID` int NOT NULL,
  `TransactionTrackingCode` varchar(30) DEFAULT NULL,
  `OrderDateTime` datetime NOT NULL,
  `ReceivingDateTime` datetime NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`),
  KEY `WeightTypeID` (`WeightTypeID`),
  KEY `CurrencyTypeID` (`CurrencyTypeID`),
  KEY `DiscountAmountID` (`DiscountAmountID`),
  KEY `AdditionalAmountID` (`AdditionalAmountID`),
  KEY `PaymentTypeID` (`PaymentTypeID`),
  KEY `PaymentVerificationTypeID` (`PaymentVerificationTypeID`),
  CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `tbl_user` (`ID`),
  CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `tbl_productinfo` (`ID`),
  CONSTRAINT `tbl_order_ibfk_3` FOREIGN KEY (`WeightTypeID`) REFERENCES `tbl_weighttype` (`ID`),
  CONSTRAINT `tbl_order_ibfk_4` FOREIGN KEY (`CurrencyTypeID`) REFERENCES `tbl_currencytype` (`ID`),
  CONSTRAINT `tbl_order_ibfk_5` FOREIGN KEY (`DiscountAmountID`) REFERENCES `tbl_discountamount` (`ID`),
  CONSTRAINT `tbl_order_ibfk_6` FOREIGN KEY (`AdditionalAmountID`) REFERENCES `tbl_additionalamount` (`ID`),
  CONSTRAINT `tbl_order_ibfk_7` FOREIGN KEY (`PaymentTypeID`) REFERENCES `tbl_paymenttype` (`ID`),
  CONSTRAINT `tbl_order_ibfk_8` FOREIGN KEY (`PaymentVerificationTypeID`) REFERENCES `tbl_verificationtype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order`
--

LOCK TABLES `tbl_order` WRITE;
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_paymenttype`
--

DROP TABLE IF EXISTS `tbl_paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_paymenttype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Value` varchar(30) DEFAULT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_paymenttype`
--

LOCK TABLES `tbl_paymenttype` WRITE;
/*!40000 ALTER TABLE `tbl_paymenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_paymenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_productinfo`
--

DROP TABLE IF EXISTS `tbl_productinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_productinfo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ProductParentID` int NOT NULL,
  `Name` varchar(70) NOT NULL,
  `BrandNameID` int NOT NULL,
  `ManufacturingCompanyID` int NOT NULL,
  `MeatPercentage` int DEFAULT NULL,
  `Weight` int NOT NULL,
  `WeightTypeID` int NOT NULL,
  `Price` double NOT NULL,
  `CurrencyTypeID` int NOT NULL,
  `HealthRate` int DEFAULT NULL,
  `ProduceDate` datetime DEFAULT NULL,
  `ExpireDate` date DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `ImageURL` text,
  `CommentID` int DEFAULT NULL,
  `Rate` int DEFAULT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ProductParentID` (`ProductParentID`),
  KEY `BrandNameID` (`BrandNameID`),
  KEY `ManufacturingCompanyID` (`ManufacturingCompanyID`),
  KEY `WeightTypeID` (`WeightTypeID`),
  KEY `CurrencyTypeID` (`CurrencyTypeID`),
  KEY `CommentID` (`CommentID`),
  CONSTRAINT `tbl_productinfo_ibfk_1` FOREIGN KEY (`ProductParentID`) REFERENCES `tbl_productparent` (`ID`),
  CONSTRAINT `tbl_productinfo_ibfk_2` FOREIGN KEY (`BrandNameID`) REFERENCES `tbl_brandname` (`ID`),
  CONSTRAINT `tbl_productinfo_ibfk_3` FOREIGN KEY (`ManufacturingCompanyID`) REFERENCES `tbl_manufacturingcompany` (`ID`),
  CONSTRAINT `tbl_productinfo_ibfk_4` FOREIGN KEY (`WeightTypeID`) REFERENCES `tbl_weighttype` (`ID`),
  CONSTRAINT `tbl_productinfo_ibfk_5` FOREIGN KEY (`CurrencyTypeID`) REFERENCES `tbl_currencytype` (`ID`),
  CONSTRAINT `tbl_productinfo_ibfk_6` FOREIGN KEY (`CommentID`) REFERENCES `tbl_comment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productinfo`
--

LOCK TABLES `tbl_productinfo` WRITE;
/*!40000 ALTER TABLE `tbl_productinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_productinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_productparent`
--

DROP TABLE IF EXISTS `tbl_productparent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_productparent` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Value` int NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productparent`
--

LOCK TABLES `tbl_productparent` WRITE;
/*!40000 ALTER TABLE `tbl_productparent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_productparent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_recipe`
--

DROP TABLE IF EXISTS `tbl_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_recipe` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `FoodName` varchar(50) NOT NULL,
  `ProductID` int NOT NULL,
  `ProductWeightTypeID` int NOT NULL,
  `ProductQuantity` int NOT NULL,
  `FoodStuffID` int NOT NULL,
  `FoodStuffWeightTypeID` int NOT NULL,
  `FoodStuffQuantity` int NOT NULL,
  `PreprationMethod` text NOT NULL,
  `PreprationTime` time NOT NULL,
  `DishSide` varchar(100) DEFAULT NULL,
  `VitaminID` int DEFAULT NULL,
  `MineralID` int DEFAULT NULL,
  `Calorie` int DEFAULT NULL,
  `CommentID` int DEFAULT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`),
  KEY `ProductWeightTypeID` (`ProductWeightTypeID`),
  KEY `FoodStuffID` (`FoodStuffID`),
  KEY `FoodStuffWeightTypeID` (`FoodStuffWeightTypeID`),
  KEY `VitaminID` (`VitaminID`),
  KEY `MineralID` (`MineralID`),
  CONSTRAINT `tbl_recipe_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `tbl_user` (`ID`),
  CONSTRAINT `tbl_recipe_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `tbl_productinfo` (`ID`),
  CONSTRAINT `tbl_recipe_ibfk_3` FOREIGN KEY (`ProductWeightTypeID`) REFERENCES `tbl_weighttype` (`ID`),
  CONSTRAINT `tbl_recipe_ibfk_4` FOREIGN KEY (`FoodStuffID`) REFERENCES `tbl_foodstuff` (`ID`),
  CONSTRAINT `tbl_recipe_ibfk_5` FOREIGN KEY (`FoodStuffWeightTypeID`) REFERENCES `tbl_weighttype` (`ID`),
  CONSTRAINT `tbl_recipe_ibfk_6` FOREIGN KEY (`VitaminID`) REFERENCES `tbl_vitamin` (`ID`),
  CONSTRAINT `tbl_recipe_ibfk_7` FOREIGN KEY (`MineralID`) REFERENCES `tbl_mineral` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_recipe`
--

LOCK TABLES `tbl_recipe` WRITE;
/*!40000 ALTER TABLE `tbl_recipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UserRegisterID` int NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `BirthDate` datetime NOT NULL,
  `Email` varchar(70) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `PictureURL` text,
  `Verify` tinyint(1) NOT NULL,
  `UserStatusID` int NOT NULL,
  `UserTypeID` int NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserRegisterID` (`UserRegisterID`),
  KEY `UserStatusID` (`UserStatusID`),
  KEY `UserTypeID` (`UserTypeID`),
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`UserRegisterID`) REFERENCES `tbl_userregister` (`ID`),
  CONSTRAINT `tbl_user_ibfk_2` FOREIGN KEY (`UserStatusID`) REFERENCES `tbl_userstatus` (`ID`),
  CONSTRAINT `tbl_user_ibfk_3` FOREIGN KEY (`UserTypeID`) REFERENCES `tbl_usertype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_userregister`
--

DROP TABLE IF EXISTS `tbl_userregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_userregister` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `GUID` varchar(100) NOT NULL,
  `CellNumber` varchar(14) DEFAULT NULL,
  `VerificationTypeID` int NOT NULL,
  `IP` varchar(15) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `VerificationTypeID` (`VerificationTypeID`),
  CONSTRAINT `tbl_userregister_ibfk_1` FOREIGN KEY (`VerificationTypeID`) REFERENCES `tbl_verificationtype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_userregister`
--

LOCK TABLES `tbl_userregister` WRITE;
/*!40000 ALTER TABLE `tbl_userregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_userregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_userstatus`
--

DROP TABLE IF EXISTS `tbl_userstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_userstatus` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Value` varchar(30) NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_userstatus`
--

LOCK TABLES `tbl_userstatus` WRITE;
/*!40000 ALTER TABLE `tbl_userstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_userstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usertype`
--

DROP TABLE IF EXISTS `tbl_usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usertype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Value` varchar(30) NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usertype`
--

LOCK TABLES `tbl_usertype` WRITE;
/*!40000 ALTER TABLE `tbl_usertype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_verificationtype`
--

DROP TABLE IF EXISTS `tbl_verificationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_verificationtype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Value` varchar(30) NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_verificationtype`
--

LOCK TABLES `tbl_verificationtype` WRITE;
/*!40000 ALTER TABLE `tbl_verificationtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_verificationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vitamin`
--

DROP TABLE IF EXISTS `tbl_vitamin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vitamin` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vitamin`
--

LOCK TABLES `tbl_vitamin` WRITE;
/*!40000 ALTER TABLE `tbl_vitamin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_vitamin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_weighttype`
--

DROP TABLE IF EXISTS `tbl_weighttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_weighttype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Value` varchar(50) DEFAULT NULL,
  `Description` text,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_weighttype`
--

LOCK TABLES `tbl_weighttype` WRITE;
/*!40000 ALTER TABLE `tbl_weighttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_weighttype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 19:30:09
