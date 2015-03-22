-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2015 at 11:31 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `programmingassistant`
--

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `langID` int(11) NOT NULL AUTO_INCREMENT,
  `langName` varchar(30) NOT NULL,
  `langDesc` varchar(1000) NOT NULL,
  `langImage` varchar(30) NOT NULL,
  PRIMARY KEY (`langID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`langID`, `langName`, `langDesc`, `langImage`) VALUES
(1, 'Java Fundamentals', 'The language Java is a great first language to learn when programming journey.', 'javaIcon.png'),
(2, 'C++ Basics', 'C++ is also an object oriented programming language and is an extension of the C language. ', 'cIcon.png');

-- --------------------------------------------------------

--
-- Table structure for table `learner`
--

CREATE TABLE IF NOT EXISTS `learner` (
  `LearnerID` int(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  PRIMARY KEY (`LearnerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `learner`
--

INSERT INTO `learner` (`LearnerID`, `FirstName`, `LastName`, `Email`, `Password`) VALUES
(1, 'Peter', 'Parker', 'spiderman@gmail.com', 'spiderman234'),
(2, 'Munaib', 'Hussain', 'munaibh@yahoo.com', 'hussain123'),
(3, 'Bruce', 'Wayne', 'batman@gmail.com', 'batman123'),
(4, 'Tony', 'Stark', 'ironman@gmail.com', 'ironman123'),
(8, 'Slade', 'Wilson', 'deathstroke@outlook.com', 'hussain123'),
(10, 'test', 'test', 'test', 'test'),
(11, 'Donald', 'Duck', 'dd@gmail.com', 'donaldtheduck');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE IF NOT EXISTS `lessons` (
  `lessonID` int(4) NOT NULL AUTO_INCREMENT,
  `langID` int(4) NOT NULL,
  `lessonName` varchar(300) NOT NULL,
  `lessonDescrip` varchar(300) NOT NULL,
  `material` varchar(60) NOT NULL,
  PRIMARY KEY (`lessonID`),
  KEY `langID` (`langID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`lessonID`, `langID`, `lessonName`, `lessonDescrip`, `material`) VALUES
(1, 1, 'Hello World', 'Here you''ll learn how to write to the console by saying "Hello World"!', 'lesson1.html'),
(2, 1, 'Data Types', 'Here you''ll learn about the data type (int, char long, double and strings).', 'lesson2.html'),
(3, 2, 'C++ Variables.', 'Time to learn some variables.', '');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE IF NOT EXISTS `marks` (
  `LessonID` int(4) NOT NULL,
  `LeanerID` int(4) NOT NULL,
  `Mark` double NOT NULL,
  KEY `LessonID` (`LessonID`),
  KEY `LeanerID` (`LeanerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`LessonID`, `LeanerID`, `Mark`) VALUES
(1, 2, 100),
(1, 1, 66.666664),
(1, 1, 66.666664),
(1, 1, 66.666664),
(1, 1, 66.666664),
(1, 1, 66.666664),
(1, 1, 66.666664),
(1, 1, 66.666664),
(1, 1, 0),
(1, 1, 33.333332);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `optionsID` int(4) NOT NULL AUTO_INCREMENT,
  `optionsName` varchar(60) NOT NULL,
  `questionID` int(4) NOT NULL,
  PRIMARY KEY (`optionsID`),
  KEY `questionID` (`questionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`optionsID`, `optionsName`, `questionID`) VALUES
(2, 'System.out.println("Hello World");', 1),
(4, 'System.out.println(Hello World);', 1),
(5, 'Yes', 2),
(6, 'No', 2),
(7, 'system', 3),
(8, 'out', 3),
(9, 'println', 3);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `questionID` int(4) NOT NULL AUTO_INCREMENT,
  `lessonID` int(4) NOT NULL,
  `questionName` varchar(60) NOT NULL,
  `questionAnswer` varchar(60) NOT NULL,
  PRIMARY KEY (`questionID`),
  KEY `lessonID` (`lessonID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`questionID`, `lessonID`, `questionName`, `questionAnswer`) VALUES
(1, 1, 'What would you type to print out "Hello World"?', 'System.out.println("Hello World");'),
(2, 1, 'Should the class and file name be the same?', 'Yes'),
(3, 1, 'Which of these is a static variable?', 'out'),
(4, 3, 'Question Test', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `RegID` int(30) NOT NULL AUTO_INCREMENT,
  `Username` int(20) NOT NULL,
  `Password` int(20) NOT NULL,
  PRIMARY KEY (`RegID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`langID`) REFERENCES `languages` (`langID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`LeanerID`) REFERENCES `learner` (`LearnerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`LessonID`) REFERENCES `lessons` (`lessonID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `questions` (`questionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`lessonID`) REFERENCES `lessons` (`lessonID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
