

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 27, 2025 at 03:11 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `group7`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `USERNAME` varchar(60) DEFAULT NULL,
  `PHONENUMBER` varchar(30) DEFAULT NULL,
  `AdminID` int NOT NULL,
  `EMAIL` varchar(120) DEFAULT NULL,
  `LOGININFO` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `AccountName` varchar(50) DEFAULT NULL,
  `AccountNo` int NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `ContactPhone` varchar(20) DEFAULT NULL,
  `ContactFName` varchar(50) DEFAULT NULL,
  `ContactLName` varchar(50) DEFAULT NULL,
  `ClientType` varchar(20) DEFAULT NULL,
  `AdminID` int DEFAULT NULL,
  PRIMARY KEY (`AccountNo`),
  KEY `AdminID` (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `SSN` int NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `MName` varchar(50) DEFAULT NULL,
  `LName` varchar(50) DEFAULT NULL,
  `EmploymentDate` date DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `employee_skill`
--

DROP TABLE IF EXISTS `employee_skill`;
CREATE TABLE IF NOT EXISTS `employee_skill` (
  `SSN` int NOT NULL,
  `SkillCode` int NOT NULL,
  PRIMARY KEY (`SSN`,`SkillCode`),
  KEY `SkillCode` (`SkillCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE IF NOT EXISTS `equipment` (
  `Name` varchar(50) DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `UsageCost` decimal(10,2) DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `PurchaseCost` decimal(10,2) DEFAULT NULL,
  `SerialNo` int NOT NULL,
  PRIMARY KEY (`SerialNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `MaterialID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `DefaultUnitPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `material_task`
--

DROP TABLE IF EXISTS `material_task`;
CREATE TABLE IF NOT EXISTS `material_task` (
  `TaskNo` int NOT NULL,
  `MaterialID` int NOT NULL,
  `QtyUsed` decimal(10,2) DEFAULT NULL,
  `UnitPriceSnapshot` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`TaskNo`,`MaterialID`),
  KEY `MaterialID` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
CREATE TABLE IF NOT EXISTS `priority` (
  `PriorityID` int NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `PriorityName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`PriorityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `servicerequest`
--

DROP TABLE IF EXISTS `servicerequest`;
CREATE TABLE IF NOT EXISTS `servicerequest` (
  `RequestNo` int NOT NULL,
  `RequestDate` date DEFAULT NULL,
  `RequestType` varchar(30) DEFAULT NULL,
  `Description` varchar(80) DEFAULT NULL,
  `EstimateTotal` decimal(10,2) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `ActualTotal` decimal(10,2) DEFAULT NULL,
  `BillDate` date DEFAULT NULL,
  `AccountNo` int DEFAULT NULL,
  `PriorityID` int DEFAULT NULL,
  PRIMARY KEY (`RequestNo`),
  KEY `AccountNo` (`AccountNo`),
  KEY `PriorityID` (`PriorityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `SkillCode` int NOT NULL,
  `SkillName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SkillCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `TaskNo` int NOT NULL,
  `RequestNo` int DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Category` varchar(30) DEFAULT NULL,
  `EstimateAmount` decimal(10,2) DEFAULT NULL,
  `ActualAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`TaskNo`),
  KEY `RequestNo` (`RequestNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `task_employee`
--

DROP TABLE IF EXISTS `task_employee`;
CREATE TABLE IF NOT EXISTS `task_employee` (
  `SSN` int NOT NULL,
  `TaskNo` int NOT NULL,
  `WorkDate` date DEFAULT NULL,
  `RateSnapshot` decimal(10,2) DEFAULT NULL,
  `HoursWorked` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SSN`,`TaskNo`),
  KEY `TaskNo` (`TaskNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `task_equipment`
--

DROP TABLE IF EXISTS `task_equipment`;
CREATE TABLE IF NOT EXISTS `task_equipment` (
  `SerialNo` int NOT NULL,
  `TaskNo` int NOT NULL,
  `AssignDate` varchar(30) DEFAULT NULL,
  `ReleaseDate` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SerialNo`,`TaskNo`),
  KEY `TaskNo` (`TaskNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
