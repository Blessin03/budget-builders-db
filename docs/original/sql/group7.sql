-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 27, 2025 at 03:11 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`AccountName`, `AccountNo`, `Address`, `ContactPhone`, `ContactFName`, `ContactLName`, `ClientType`, `AdminID`) VALUES
('Harbor Foods Inc.', 1001, '6 Wharf Rd, Bridgetown', '+1-246-555-1101', 'Renee', 'Best', 'Business', NULL),
('GreenTech Co.', 1002, '12 Cane Vale, Christ Church', '+1-246-555-1102', 'Marcus', 'Jordan', 'Business', NULL),
('Coral Villas', 1003, '9 St. Peter\'s Bay', '+1-246-555-1103', 'Tanya', 'Knight', 'Residential', NULL),
('Island Bakery', 1004, '21 Hastings, Ch. Ch.', '+1-246-555-1104', 'Andre', 'Small', 'Business', NULL),
('Sunset Lodge', 1005, '3 Mullins, St. Peter', '+1-246-555-1105', 'Lisa', 'Grant', 'Residential', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `SSN` int NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `MName` varchar(50) DEFAULT NULL,
  `LName` varchar(50) DEFAULT NULL,
  `EmploymentDate` date DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SSN`, `Address`, `FName`, `MName`, `LName`, `EmploymentDate`) VALUES
(6001, 'Rockley, Ch. Ch.', 'David', 'A.', 'Hinds', '2023-05-01'),
(6002, 'Oistins, Ch. Ch.', 'Shanna', 'L.', 'Browne', '2024-02-12'),
(6003, 'Speightstown', 'Kieran', 'M.', 'Mapp', '2022-11-20'),
(6004, 'Holetown', 'Aaliyah', 'R.', 'Ward', '2025-03-03'),
(6005, 'Bridgetown', 'Joel', 'T.', 'Harewood', '2021-08-17'),
(6006, 'St. Philip', 'Nia', 'S.', 'Clarke', '2024-09-05');

-- --------------------------------------------------------

--
-- Table structure for table `employee_skill`
--

DROP TABLE IF EXISTS `employee_skill`;
CREATE TABLE IF NOT EXISTS `employee_skill` (
  `SSN` int NOT NULL,
  `SkillCode` int NOT NULL,
  PRIMARY KEY (`SSN`,`SkillCode`),
  KEY `SkillCode` (`SkillCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee_skill`
--

INSERT INTO `employee_skill` (`SSN`, `SkillCode`) VALUES
(6001, 7001),
(6002, 7001),
(6002, 7002),
(6003, 7003),
(6004, 7002),
(6004, 7005),
(6005, 7002),
(6006, 7004),
(6006, 7006);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE IF NOT EXISTS `equipment` (
  `Name` varchar(50) DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `UsageCost` decimal(10,2) DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `PurchaseCost` decimal(10,2) DEFAULT NULL,
  `SerialNo` int NOT NULL,
  PRIMARY KEY (`SerialNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`Name`, `Brand`, `UsageCost`, `PurchaseDate`, `PurchaseCost`, `SerialNo`) VALUES
('Cordless Drill', 'Makita', 35.00, '2024-02-20', 220.00, 3001),
('Impact Driver', 'DeWalt', 30.00, '2024-03-11', 200.00, 3002),
('Ladder 20ft', 'Werner', 20.00, '2023-12-04', 150.00, 3003),
('Thermal Camera', 'Fluke', 55.00, '2025-01-15', 1800.00, 3004),
('Multimeter', 'Fluke', 25.00, '2025-04-09', 120.00, 3005),
('CCTV Tester', 'Hikvision', 40.00, '2025-06-22', 350.00, 3006);

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `MaterialID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `DefaultUnitPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`MaterialID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`MaterialID`, `Name`, `DefaultUnitPrice`) VALUES
(5001, 'PEX 1/2\" (ft)', 3.00),
(5002, 'PVC Cement (oz)', 5.00),
(5003, 'Breaker 20A', 25.00),
(5004, 'Conduit 1\" (ft)', 4.00),
(5005, 'Sealant Tube', 12.00),
(5006, 'RJ45 Plug', 1.00);

-- --------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `material_task`
--

INSERT INTO `material_task` (`TaskNo`, `MaterialID`, `QtyUsed`, `UnitPriceSnapshot`) VALUES
(4001, 5002, 1.00, 5.00),
(4002, 5001, 35.00, 3.00),
(4003, 5005, 2.00, 12.00),
(4004, 5003, 3.00, 25.00),
(4004, 5004, 15.00, 4.00),
(4007, 5006, 16.00, 1.00),
(4008, 5006, 24.00, 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
CREATE TABLE IF NOT EXISTS `priority` (
  `PriorityID` int NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `PriorityName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`PriorityID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `servicerequest`
--

INSERT INTO `servicerequest` (`RequestNo`, `RequestDate`, `RequestType`, `Description`, `EstimateTotal`, `StartDate`, `ActualTotal`, `BillDate`, `AccountNo`, `PriorityID`) VALUES
(2001, '2025-10-10', 'Install', 'Solar water heater install', 3500.00, '2025-10-15', 3600.00, '2025-10-20', 1001, NULL),
(2002, '2025-10-11', 'Repair', 'HVAC compressor swap', 1200.00, '2025-10-16', 1150.00, '2025-10-21', 1002, NULL),
(2003, '2025-10-12', 'Upgrade', 'Panel upgrade to 200A', 2200.00, '2025-10-18', 2250.00, '2025-10-23', 1003, NULL),
(2004, '2025-10-12', 'Inspect', 'Annual safety inspection', 400.00, '2025-10-17', 380.00, '2025-10-19', 1004, NULL),
(2005, '2025-10-13', 'Repair', 'Leaking booster pump', 800.00, '2025-10-18', 790.00, '2025-10-24', 1005, NULL),
(2006, '2025-10-14', 'Install', 'CCTV 8-cam system', 2800.00, '2025-10-19', 2795.00, '2025-10-25', 1002, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `SkillCode` int NOT NULL,
  `SkillName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SkillCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`SkillCode`, `SkillName`) VALUES
(7001, 'Plumbing'),
(7002, 'Electrical'),
(7003, 'HVAC'),
(7004, 'Security Systems'),
(7005, 'Safety Inspection'),
(7006, 'Networking');

-- --------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`TaskNo`, `RequestNo`, `Name`, `Category`, `EstimateAmount`, `ActualAmount`) VALUES
(4001, 2001, 'Mount collector', 'Plumbing', 900.00, 950.00),
(4002, 2001, 'Run PEX lines', 'Plumbing', 1100.00, 1120.00),
(4003, 2002, 'Replace compressor', 'HVAC', 950.00, 910.00),
(4004, 2003, 'Upgrade main panel', 'Electrical', 1500.00, 1550.00),
(4005, 2004, 'Test GFCIs', 'Electrical', 150.00, 140.00),
(4006, 2005, 'Seal pump fittings', 'Plumbing', 300.00, 290.00),
(4007, 2006, 'Mount cameras', 'Security', 1300.00, 1275.00),
(4008, 2006, 'Terminate cabling', 'Security', 800.00, 820.00);

-- --------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `task_employee`
--

INSERT INTO `task_employee` (`SSN`, `TaskNo`, `WorkDate`, `RateSnapshot`, `HoursWorked`) VALUES
(6001, 4001, '2025-10-15', 65.00, 6.00),
(6002, 4002, '2025-10-16', 55.00, 7.00),
(6003, 4003, '2025-10-16', 60.00, 5.00),
(6004, 4004, '2025-10-18', 70.00, 8.00),
(6005, 4005, '2025-10-17', 45.00, 3.00),
(6002, 4006, '2025-10-18', 55.00, 4.00),
(6006, 4007, '2025-10-19', 52.00, 7.00),
(6006, 4008, '2025-10-19', 52.00, 6.00);

-- --------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `task_equipment`
--

INSERT INTO `task_equipment` (`SerialNo`, `TaskNo`, `AssignDate`, `ReleaseDate`) VALUES
(3001, 4001, '2025-10-15', '2025-10-15'),
(3003, 4001, '2025-10-15', '2025-10-15'),
(3005, 4002, '2025-10-16', '2025-10-16'),
(3002, 4003, '2025-10-16', '2025-10-16'),
(3004, 4004, '2025-10-18', '2025-10-18'),
(3005, 4005, '2025-10-17', '2025-10-17'),
(3006, 4007, '2025-10-19', '2025-10-19'),
(3006, 4008, '2025-10-19', '2025-10-19');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
