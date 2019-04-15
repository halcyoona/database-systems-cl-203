-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 25, 2018 at 06:49 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university`
--

DROP DATABASE IF EXISTS university;

CREATE DATABASE IF NOT EXISTS university;

USE university;
-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `roll_no` varchar(10) NOT NULL PRIMARY KEY,
  `st_name` varchar(30) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `contact` varchar(16) NOT NULL,
  `address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

CREATE TABLE courses (
	course_id varchar(10) NOT NULL PRIMARY KEY,
	course_name varchar(30) NOT NULL,
	credits INT(4) NOT NULL
);

CREATE TABLE enrollment (
	course_id varchar(10) NOT NULL,
	roll_no varchar(10) NOT NULL,
	CONSTRAINT PK_enrollment PRIMARY KEY(course_id, roll_no),
	CONSTRAINT FK_enrollment_courses FOREIGN KEY (course_id) REFERENCES courses(course_id),
	CONSTRAINT FK_enrollment_student FOREIGN KEY (roll_no) REFERENCES student(roll_no)
);


INSERT INTO `student` (`roll_no`, `st_name`, `f_name`, `gender`, `contact`, `address`) VALUES
('P19-6015', 'Ali Zafar', 'Zafar Khan', 'Male', '03339104258', 'Peshawar'),
('P20-6005', 'Shakeel', 'Kamran', 'Male', '03459871234', 'Karachi'),
('P20-6075', 'Mehmood', 'Munir', 'Male', '03450002131', 'Peshawar');





INSERT INTO courses (course_id, course_name, credits)
	VALUES
	('CS203', 'Database System', 3),
	('CL203', 'Database System Lab', 1),
	('CL205', 'Operating System Lab', 1),
	('CS205', 'Operating System', 3),
	('CS302', 'Analysis Algorithm', 3),
	('MG206', 'Entrepreneurship', 3),
	('MG208', 'Accounting', 3);
--

INSERT INTO enrollment(course_id, roll_no)
	VALUES
	('CS203','P20-6075'),
	('CL203','P20-6075'),
	('CL205','P20-6075'),
	('CS205','P20-6075');
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
