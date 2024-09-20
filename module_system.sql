-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2024 at 10:05 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `module_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentname` varchar(30) NOT NULL,
  `lecturerID` char(9) DEFAULT NULL,
  `modulecode` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentname`, `lecturerID`, `modulecode`) VALUES
('Chemistry', 'LEC010', 'CH505'),
('Computer Science', 'LEC001', 'CS101'),
('Information Technology', 'LEC002', 'IT202'),
('Physics', 'LEC004', 'PH405'),
('Statistics', 'LEC008', 'ST304');

-- --------------------------------------------------------

--
-- Table structure for table `diploma`
--

CREATE TABLE `diploma` (
  `diplomaname` varchar(30) NOT NULL,
  `diplomaID` char(9) NOT NULL,
  `modulecode` char(9) DEFAULT NULL,
  `lecturerID` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diploma`
--

INSERT INTO `diploma` (`diplomaname`, `diplomaID`, `modulecode`, `lecturerID`) VALUES
('Diploma in Computer Science', 'DIP001', 'CS101', 'LEC001'),
('Diploma in Information Technol', 'DIP002', 'IT202', 'LEC002'),
('Diploma in Statistics', 'DIP003', 'ST303', 'LEC003'),
('Diploma in Physics', 'DIP004', 'PH404', 'LEC004'),
('Diploma in Chemistry', 'DIP005', 'CH505', 'LEC005');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `lecturerID` char(9) NOT NULL,
  `lecturername` varchar(30) DEFAULT NULL,
  `modulecode` char(9) DEFAULT NULL,
  `departmentname` char(9) DEFAULT NULL,
  `schedule` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`lecturerID`, `lecturername`, `modulecode`, `departmentname`, `schedule`) VALUES
('LEC001', 'Dr.A.M.Perera', 'CS101', 'Chemistry', 'Monday 10:00-12:00'),
('LEC002', 'Prof. K.Basnayaka', 'CH505', 'Chemistry', 'Wednesday 14:00-16:00'),
('LEC003', 'Dr. J.Aravinda', 'PH404', 'Physics', 'Friday 09:00-11:00'),
('LEC004', 'Dr. S.nishani', NULL, NULL, 'Tuesday 13:00-15:00'),
('LEC005', 'Prof. K.kamadeshan', 'PH405', 'Physics', 'Thursday 11:00-13:00');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `title` varchar(30) NOT NULL,
  `modulecode` char(9) NOT NULL,
  `creditvalue` int(11) DEFAULT NULL,
  `departmentname` varchar(20) NOT NULL,
  `lecturername` varchar(30) DEFAULT NULL,
  `diplomaID` char(9) DEFAULT NULL,
  `lecturerID` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`title`, `modulecode`, `creditvalue`, `departmentname`, `lecturername`, `diplomaID`, `lecturerID`) VALUES
('Organic Chemistry', 'CH505', 3, 'Chemistry', 'Ms. Sharmila Fernando', 'DIP005', 'LEC010'),
('Inorganic ', 'CH506', 4, 'Chemistry', 'Ms. Sharmila Fernando', 'DIP005', 'LEC010'),
('Introduction to data science', 'CS101', 3, 'Computer Science', 'Dr.A.M.Perera', 'DIP001', 'LEC001'),
('Data Structures', 'CS102', 3, 'Computer Science', 'Mr. Nimal Perera', 'DIP001', 'LEC006'),
('Web Development', 'IT202', 4, 'Information Technolo', 'Prof. K.Basnayaka', 'DIP002', 'LEC002'),
('Database Management', 'IT203', 4, 'Information Technolo', 'Ms. Kamani Silva', 'DIP002', 'LEC007'),
('Advanced Physics', 'PH404', 4, 'Physics', 'Prof. Anura Weerasinghe', 'DIP004', 'LEC009'),
('Quantum Physics', 'PH405', 3, 'Physics', 'Prof. Anura Weerasinghe', 'DIP004', 'LEC009'),
('Statistics', 'ST303', 3, 'Statistics', 'Dr. Suresh Jayasinghe', 'DIP003', 'LEC008'),
('Applied Statistics', 'ST304', 4, 'Statistics', 'Dr. Suresh Jayasinghe', 'DIP003', 'LEC008');

-- --------------------------------------------------------

--
-- Table structure for table `modulecordinator`
--

CREATE TABLE `modulecordinator` (
  `lecturerID` char(9) NOT NULL,
  `lecturername` varchar(15) NOT NULL,
  `modulecode` char(9) DEFAULT NULL,
  `departmentname` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modulecordinator`
--

INSERT INTO `modulecordinator` (`lecturerID`, `lecturername`, `modulecode`, `departmentname`) VALUES
('LEC001', 'Dr. A.M.Perera', 'CS101', NULL),
('LEC003', 'Dr. J.Aravinda', 'PH404', 'Physics'),
('LEC005', 'Ms. Roshel', 'CH505', 'Chemistry'),
('LEC006', 'Mr. Nimal Perer', NULL, NULL),
('LEC010', 'Ms. Sharmila Fe', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pastperformance`
--

CREATE TABLE `pastperformance` (
  `modulecode` varchar(15) DEFAULT NULL,
  `examresults` varchar(5) NOT NULL,
  `stuID` char(9) NOT NULL,
  `moduletitle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pastperformance`
--

INSERT INTO `pastperformance` (`modulecode`, `examresults`, `stuID`, `moduletitle`) VALUES
('CS101', 'A', 'STU001', 'Introduction to Computer Scien'),
('IT202', 'C', 'STU002', 'Web Development Fundamentals'),
('PH404', 'B-', 'STU006', 'Advanced Physics'),
('CS101', 'D+', 'STU009', 'Data Structures and Algorithms'),
('ST303', 'A', 'STU013', 'Statistical Methods'),
('IT203', 'W', 'STU017', 'Database Management Systems'),
('CH505', 'B-', 'STU055', 'Organic Chemistry'),
('ST304', 'C+', 'STU098', 'Applied Statistics'),
('PH405', 'B+', 'STU109', 'Quantum Physics'),
('CH506', 'S', 'STU300', 'Inorganic Chemistry');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stuname` varchar(10) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `diplomaID` char(9) DEFAULT NULL,
  `modulecode` char(9) DEFAULT NULL,
  `stuID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stuname`, `Bdate`, `email`, `diplomaID`, `modulecode`, `stuID`) VALUES
('sda', '0000-00-00', 'sad', 'DIP005', 'sadD', 31),
('sad', '0000-00-00', 'dasd', 'DIP005', 'asd', 32),
('asd', '0000-00-00', '', 'DIP001', 'sd', 33),
('err', '0000-00-00', 'ear', 'DIP003', 'aera', 35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentname`),
  ADD KEY `modulecode` (`modulecode`);

--
-- Indexes for table `diploma`
--
ALTER TABLE `diploma`
  ADD PRIMARY KEY (`diplomaID`),
  ADD KEY `modulecode` (`modulecode`);

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`lecturerID`),
  ADD KEY `modulecode` (`modulecode`),
  ADD KEY `departmentname` (`departmentname`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`modulecode`),
  ADD KEY `diplomaID` (`diplomaID`);

--
-- Indexes for table `modulecordinator`
--
ALTER TABLE `modulecordinator`
  ADD PRIMARY KEY (`lecturerID`,`lecturername`),
  ADD KEY `modulecode` (`modulecode`),
  ADD KEY `departmentname` (`departmentname`);

--
-- Indexes for table `pastperformance`
--
ALTER TABLE `pastperformance`
  ADD PRIMARY KEY (`stuID`),
  ADD KEY `modulecode` (`modulecode`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stuID`),
  ADD KEY `diplomaID` (`diplomaID`),
  ADD KEY `modulecode` (`modulecode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`modulecode`) REFERENCES `module` (`modulecode`);

--
-- Constraints for table `diploma`
--
ALTER TABLE `diploma`
  ADD CONSTRAINT `diploma_ibfk_1` FOREIGN KEY (`modulecode`) REFERENCES `module` (`modulecode`);

--
-- Constraints for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD CONSTRAINT `lecturer_ibfk_1` FOREIGN KEY (`modulecode`) REFERENCES `module` (`modulecode`),
  ADD CONSTRAINT `lecturer_ibfk_2` FOREIGN KEY (`departmentname`) REFERENCES `department` (`departmentname`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`diplomaID`) REFERENCES `diploma` (`diplomaID`);

--
-- Constraints for table `modulecordinator`
--
ALTER TABLE `modulecordinator`
  ADD CONSTRAINT `modulecordinator_ibfk_1` FOREIGN KEY (`modulecode`) REFERENCES `module` (`modulecode`),
  ADD CONSTRAINT `modulecordinator_ibfk_2` FOREIGN KEY (`departmentname`) REFERENCES `department` (`departmentname`);

--
-- Constraints for table `pastperformance`
--
ALTER TABLE `pastperformance`
  ADD CONSTRAINT `pastperformance_ibfk_1` FOREIGN KEY (`modulecode`) REFERENCES `module` (`modulecode`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`diplomaID`) REFERENCES `diploma` (`diplomaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
