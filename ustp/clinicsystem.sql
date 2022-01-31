-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2022 at 01:23 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinicsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` int(10) NOT NULL,
  `adminname` varchar(25) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `usertype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `adminname`, `loginid`, `password`, `status`, `usertype`) VALUES
(1, 'admin1', 'admin1', 'adminadmin', 'Active', 'Admin'),
(2, 'admin2', 'admin1', '123456789', 'Active', 'Admin'),
(3, 'yancy', 'yancy1', 'yancy123', 'Active', '');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` time NOT NULL,
  `doctorid` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `patientid`, `appointmentdate`, `appointmenttime`, `doctorid`, `status`, `app_reason`) VALUES
(1, 1, '2022-01-29', '14:30:00', 1, 'Approved', 'sick'),
(2, 2, '2022-01-30', '15:00:00', 1, 'Approved', 'sick'),
(3, 1, '2022-02-02', '08:30:00', 1, 'Active', 'High Fever'),
(4, 2, '2022-01-30', '08:30:00', 2, 'Inactive', 'Fever');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorid` int(10) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `education` varchar(25) NOT NULL,
  `experience` float(11,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `doctorname`, `mobileno`, `loginid`, `password`, `status`, `education`, `experience`) VALUES
(1, 'Pikachu', '9876543210', 'doctor1', 'doctor121', 'Active', 'doctor', 3.0),
(2, 'Saitama', '9123456789', 'doctor2', 'doctor222', 'Active', 'doctor', 4.0),
(3, 'mat', '09263716845', 'matmat', 'matmat123', 'Active', 'Graduate', 4.0);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_timings`
--

CREATE TABLE `doctor_timings` (
  `doctor_timings_id` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `available_day` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_timings`
--

INSERT INTO `doctor_timings` (`doctor_timings_id`, `doctorid`, `start_time`, `end_time`, `available_day`, `status`) VALUES
(1, 1, '09:30:00', '13:00:00', 'Monday. Tuesday', 'Active'),
(2, 2, '13:30:00', '17:00:00', 'Wednesday, Thur', 'Active'),
(7, 1, '08:30:00', '17:30:00', '', 'Active'),
(8, 2, '09:00:00', '17:30:00', '', 'Inactive'),
(9, 1, '17:30:00', '20:30:00', '', 'Inactive'),
(10, 3, '10:00:00', '12:00:00', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicineid` int(10) NOT NULL,
  `medicinename` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicineid`, `medicinename`, `description`, `status`) VALUES
(1, 'Paracetamol', 'Fever', 'Active'),
(2, 'Antihistamine', 'Allergy', 'Active'),
(3, 'Alaxan', 'Paracetamol and for body pain', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `admissiondate` date NOT NULL,
  `admissiontime` time NOT NULL,
  `address` varchar(250) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `city` varchar(25) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `loginid` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `patientname`, `admissiondate`, `admissiontime`, `address`, `mobileno`, `city`, `pincode`, `loginid`, `password`, `bloodgroup`, `gender`, `dob`, `status`) VALUES
(1, 'asniya', '2022-01-23', '10:36:36', 'balulang', '09263716845', 'cagayan', '9000', '12345', 'asniya12345', 'A+', 'FEMALE', '2000-07-07', 'Active'),
(2, 'sponge', '2022-01-25', '08:19:47', 'balulang', '09263716845', 'cagayan', '9000', '123', 'asniya123', '', '', '0000-00-00', 'Active'),
(3, 'alexa', '2022-01-25', '10:36:35', 'bukidnon', '09263716845', 'bukidnon', '9000', 'alexa1', 'alexa123', 'A+', 'FEMALE', '2000-01-02', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescriptionid` int(10) NOT NULL,
  `treatment_records_id` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `prescriptiondate` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `appointmentid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescriptionid`, `treatment_records_id`, `doctorid`, `patientid`, `prescriptiondate`, `status`, `appointmentid`) VALUES
(1, 1, 1, 1, '2022-01-29', 'Active', 1),
(2, 2, 2, 2, '0202-01-30', 'Active', 2);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_records`
--

CREATE TABLE `prescription_records` (
  `prescription_record_id` int(10) NOT NULL,
  `prescription_id` int(10) NOT NULL,
  `medicine_name` varchar(25) NOT NULL,
  `unit` int(10) NOT NULL,
  `dosage` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription_records`
--

INSERT INTO `prescription_records` (`prescription_record_id`, `prescription_id`, `medicine_name`, `unit`, `dosage`, `status`) VALUES
(1, 1, 'Paracetamol', 10, '1-1-1', 'Active'),
(2, 2, 'Antihistamine', 10, '1-0-1', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentid` int(10) NOT NULL,
  `treatmenttype` varchar(25) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentid`, `treatmenttype`, `note`, `status`) VALUES
(1, 'Treatment for Fever', 'Drink every after 4 hours ', 'Active'),
(2, 'Treatment for Allergy', ' Drink twice a day', 'Active'),
(13, 'cough', 'coughcough', 'Active'),
(14, 'bodypain', 'bodypainpain', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_records`
--

CREATE TABLE `treatment_records` (
  `treatment_records_id` int(10) NOT NULL,
  `treatmentid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `treatment_description` text NOT NULL,
  `uploads` varchar(100) NOT NULL,
  `treatment_date` date NOT NULL,
  `treatment_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment_records`
--

INSERT INTO `treatment_records` (`treatment_records_id`, `treatmentid`, `appointmentid`, `patientid`, `doctorid`, `treatment_description`, `uploads`, `treatment_date`, `treatment_time`, `status`) VALUES
(1, 1, 1, 1, 1, 'High Fever', 'nill', '2022-01-29', '13:00:00', 'Active'),
(2, 2, 2, 2, 2, 'Allergies', 'null', '2022-01-30', '17:00:00', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `loginname` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `createddateandtime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `loginname`, `password`, `patientname`, `mobileno`, `email`, `createddateandtime`) VALUES
(1, 'admin', 'admin', 'admin', '', '', '2022-01-20 11:20:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`),
  ADD UNIQUE KEY `adminname` (`adminname`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`);

--
-- Indexes for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  ADD PRIMARY KEY (`doctor_timings_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicineid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescriptionid`);

--
-- Indexes for table `prescription_records`
--
ALTER TABLE `prescription_records`
  ADD PRIMARY KEY (`prescription_record_id`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentid`);

--
-- Indexes for table `treatment_records`
--
ALTER TABLE `treatment_records`
  ADD PRIMARY KEY (`treatment_records_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  MODIFY `doctor_timings_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicineid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescriptionid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prescription_records`
--
ALTER TABLE `prescription_records`
  MODIFY `prescription_record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `treatment_records`
--
ALTER TABLE `treatment_records`
  MODIFY `treatment_records_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
