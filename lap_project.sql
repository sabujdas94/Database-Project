--
-- Database: `construction_management`
--
CREATE DATABASE IF NOT EXISTS `sd_construction` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sd_construction`;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `companyId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`companyId`, `name`, `address`) VALUES
(1, 'Skytouch Builders', '2957 Crestview Terrace Boerne, TX 78006');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `employeId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(40) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `phoneNumber` varchar(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `companies_companyId` int(11) NOT NULL,
  PRIMARY KEY (`employeId`,`companies_companyId`),
  KEY `fk_employees_companies1` (`companies_companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employeId`, `firstName`, `lastName`, `dateOfBirth`, `gender`, `phoneNumber`, `address`, `companies_companyId`) VALUES
(1, 'Jonathan', 'R. Jones', '1987-01-23', 'M', '7406544042', '1842 Jessie Street Lancaster, OH 43130', 1),
(2, 'Joshua', 'Gloria', '1987-07-09', 'M', '6307065190', '246 Steele Street Oak Brook, IL 60523', 1),
(3, 'Pedro', 'M. Torres', '1985-06-22', 'M', '6307065190', '246 Steele Street Oak Brook, IL 60523', 1),
(4, 'Karen ', 'Moua', '1977-03-27', 'F', '3195723330', '2239 Pyramid Valley Road Burlington, IA 52601', 1),
(5, 'Linda', 'A. Berry', '1989-06-19', 'F', '5306928804', '247 Eagles Nest Drive Oregon House, CA 95962', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees_has_tasks`
--

DROP TABLE IF EXISTS `employees_has_tasks`;
CREATE TABLE IF NOT EXISTS `employees_has_tasks` (
  `employees_employeId` int(11) NOT NULL,
  `tasks_taskId` int(11) NOT NULL,
  PRIMARY KEY (`employees_employeId`,`tasks_taskId`),
  KEY `fk_employees_has_tasks_tasks1` (`tasks_taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees_has_tasks`
--

INSERT INTO `employees_has_tasks` (`employees_employeId`, `tasks_taskId`) VALUES
(1, 52),
(2, 52),
(3, 52),
(4, 52),
(5, 52);

-- --------------------------------------------------------

--
-- Table structure for table `parts_materials`
--

DROP TABLE IF EXISTS `parts_materials`;
CREATE TABLE IF NOT EXISTS `parts_materials` (
  `parts_materialsId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `projects_projectId` int(11) NOT NULL,
  `suppliers_suppliersId` int(11) NOT NULL,
  PRIMARY KEY (`parts_materialsId`,`projects_projectId`,`suppliers_suppliersId`),
  KEY `fk_parts_materials_projects1` (`projects_projectId`),
  KEY `fk_parts_materials_suppliers1` (`suppliers_suppliersId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parts_materials`
--

INSERT INTO `parts_materials` (`parts_materialsId`, `name`, `unit`, `projects_projectId`, `suppliers_suppliersId`) VALUES
(1, 'Bricks', '30K', 7, 1),
(2, 'Sand', '1300 CFT', 7, 1),
(3, 'Stone Aggregates (10 mm)', '200 CFT', 7, 2),
(4, 'Stone Aggregates (20 mm)', '350 CFT', 7, 2),
(5, 'Reinforcement Steel', '800k', 7, 3),
(6, 'Bricks', '45K', 8, 1),
(7, 'Sand', '2300 CFT', 8, 1),
(8, 'Stone Aggregates (10 mm)', '400 CFT', 8, 2),
(9, 'Stone Aggregates (20 mm)', '750 CFT', 8, 2),
(10, 'Reinforcement Steel', '1500k', 8, 3),
(11, 'Bricks', '25K', 9, 1),
(12, 'Sand', '1100 CFT', 9, 1),
(13, 'Stone Aggregates (10 mm)', '180 CFT', 9, 2),
(14, 'Stone Aggregates (20 mm)', '300 CFT', 9, 2),
(15, 'Reinforcement Steel', '800k', 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(100) DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `otherDetails` varchar(200) DEFAULT NULL,
  `companies_companyId` int(11) NOT NULL,
  PRIMARY KEY (`projectId`,`companies_companyId`),
  KEY `fk_projects_companies1_idx` (`companies_companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`projectId`, `projectName`, `startDate`, `endDate`, `otherDetails`, `companies_companyId`) VALUES
(7, 'The Crooked House', '2017-05-21', '2017-10-05', '640 Millwood Street, Toronto', 1),
(8, 'Thomas Home', '2017-07-02', '2017-12-10', '2260 Oakwood Circle Santa Ana, CA 92705', 1),
(9, 'Paul & Obrien', '2018-02-15', NULL, '4207 Big Indian New Orleans, LA 70112', 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `suppliersId` int(11) NOT NULL AUTO_INCREMENT,
  `suppliersName` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`suppliersId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`suppliersId`, `suppliersName`, `address`) VALUES
(1, 'Exact Solutions', '3547 Broadway Avenue Butler, TN 37640'),
(2, 'Record Town', '366 Delaware Avenue San Rafael, CA 94909'),
(3, 'VitaGrey', '4908 Simpson Street Peoria, IL 61602');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers_to_projects`
--

DROP TABLE IF EXISTS `suppliers_to_projects`;
CREATE TABLE IF NOT EXISTS `suppliers_to_projects` (
  `suppliers_suppliersId` int(11) NOT NULL,
  `projects_projectId` int(11) NOT NULL,
  PRIMARY KEY (`suppliers_suppliersId`,`projects_projectId`),
  KEY `fk_suppliers_has_projects_projects1` (`projects_projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers_to_projects`
--

INSERT INTO `suppliers_to_projects` (`suppliers_suppliersId`, `projects_projectId`) VALUES
(1, 7),
(2, 7),
(3, 7),
(1, 8),
(2, 8),
(3, 8),
(1, 9),
(2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `taskId` int(11) NOT NULL AUTO_INCREMENT,
  `taskName` varchar(100) DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `projects_projectId` int(11) NOT NULL,
  PRIMARY KEY (`taskId`,`projects_projectId`),
  KEY `fk_tasks_projects1` (`projects_projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`taskId`, `taskName`, `startDate`, `endDate`, `projects_projectId`) VALUES
(23, 'Prepare construction site and pour foundation', '2017-05-27', '2017-05-30', 7),
(24, 'Construct rough framing', '2017-06-15', '2017-06-25', 7),
(25, 'Complete rough pluming, electrical and HVAC', '2017-07-06', '2017-07-18', 7),
(26, 'Install insulation', '2017-08-25', '2017-08-29', 7),
(27, 'Complete drywall and interior textures; start exterior finishes', '2017-09-01', '2017-09-10', 7),
(28, 'Finish interior trim; install exterior driveways and walkways', '2017-09-12', '2017-09-18', 7),
(29, 'Install hard-surface flooring and countertops, and complete exterior grading', '2017-09-20', '2017-09-25', 7),
(30, 'Finish mechanical trims; install bathroom fixtures', '2017-09-27', '2017-09-30', 7),
(31, 'Install mirrors, shower doors and finish flooring, and finish exterior landscaping', '2017-10-01', '2017-10-03', 7),
(32, 'Final walkthrough', '2017-10-03', '2017-10-05', 7),
(33, 'Prepare construction site and pour foundation', '2017-08-07', '2017-08-13', 8),
(34, 'Construct rough framing', '2017-08-20', '2017-08-30', 8),
(35, 'Complete rough pluming, electrical and HVAC', '2017-09-06', '2017-09-11', 8),
(36, 'Install insulation', '2017-09-15', '2017-09-20', 8),
(37, 'Complete drywall and interior textures; start exterior finishes', '2017-09-28', '2017-10-07', 8),
(38, 'Finish interior trim; install exterior driveways and walkways', '2017-10-12', '2017-10-18', 8),
(39, 'Install hard-surface flooring and countertops, and complete exterior grading', '2017-10-20', '2017-10-25', 8),
(40, 'Finish mechanical trims; install bathroom fixtures', '2017-11-05', '2017-11-10', 8),
(41, 'Install mirrors, shower doors and finish flooring, and finish exterior landscaping', '2017-11-16', '2017-11-27', 8),
(42, 'Final walkthrough', '2017-12-09', '2017-12-10', 8),
(48, 'Prepare construction site and pour foundation', '2018-02-17', '2018-02-23', 9),
(49, 'Construct rough framing', '2018-02-28', '2018-03-09', 9),
(50, 'Complete rough pluming, electrical and HVAC', '2018-03-16', '2018-03-21', 9),
(51, 'Install insulation', '2018-03-25', '2018-03-30', 9),
(52, 'Complete drywall and interior textures; start exterior finishes', '2017-04-01', '2018-10-05', 9);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_companies1` FOREIGN KEY (`companies_companyId`) REFERENCES `companies` (`companyId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employees_has_tasks`
--
ALTER TABLE `employees_has_tasks`
  ADD CONSTRAINT `fk_employees_has_tasks_employees1` FOREIGN KEY (`employees_employeId`) REFERENCES `employees` (`employeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employees_has_tasks_tasks1` FOREIGN KEY (`tasks_taskId`) REFERENCES `tasks` (`taskId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `parts_materials`
--
ALTER TABLE `parts_materials`
  ADD CONSTRAINT `fk_parts_materials_projects1` FOREIGN KEY (`projects_projectId`) REFERENCES `projects` (`projectId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_parts_materials_suppliers1` FOREIGN KEY (`suppliers_suppliersId`) REFERENCES `suppliers` (`suppliersId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `fk_projects_companies1` FOREIGN KEY (`companies_companyId`) REFERENCES `companies` (`companyId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `suppliers_to_projects`
--
ALTER TABLE `suppliers_to_projects`
  ADD CONSTRAINT `fk_suppliers_has_projects_projects1` FOREIGN KEY (`projects_projectId`) REFERENCES `projects` (`projectId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_suppliers_has_projects_suppliers1` FOREIGN KEY (`suppliers_suppliersId`) REFERENCES `suppliers` (`suppliersId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `fk_tasks_projects1` FOREIGN KEY (`projects_projectId`) REFERENCES `projects` (`projectId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
