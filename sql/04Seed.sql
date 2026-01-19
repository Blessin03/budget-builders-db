START TRANSACTION;
--
-- Dumping data for table `client`
--

INSERT INTO `client` (`AccountName`, `AccountNo`, `Address`, `ContactPhone`, `ContactFName`, `ContactLName`, `ClientType`, `AdminID`) VALUES
('Harbor Foods Inc.', 1001, '6 Wharf Rd, Bridgetown', '+1-246-555-1101', 'Renee', 'Best', 'Business', NULL),
('GreenTech Co.', 1002, '12 Cane Vale, Christ Church', '+1-246-555-1102', 'Marcus', 'Jordan', 'Business', NULL),
('Coral Villas', 1003, '9 St. Peter\'s Bay', '+1-246-555-1103', 'Tanya', 'Knight', 'Residential', NULL),
('Island Bakery', 1004, '21 Hastings, Ch. Ch.', '+1-246-555-1104', 'Andre', 'Small', 'Business', NULL),
('Sunset Lodge', 1005, '3 Mullins, St. Peter', '+1-246-555-1105', 'Lisa', 'Grant', 'Residential', NULL);


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


INSERT INTO `skill` (`SkillCode`, `SkillName`) VALUES
(7001, 'Plumbing'),
(7002, 'Electrical'),
(7003, 'HVAC'),
(7004, 'Security Systems'),
(7005, 'Safety Inspection'),
(7006, 'Networking');


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

-- End seed data