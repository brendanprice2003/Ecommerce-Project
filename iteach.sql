-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2023 at 03:04 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iteach`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courses_id` int(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(25) NOT NULL,
  `cost` int(6) NOT NULL,
  `teacher` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `enrolment`
--

CREATE TABLE `enrolment` (
  `user_id` int(6) NOT NULL,
  `courses_id` int(6) NOT NULL,
  `price` int(6) NOT NULL,
  `status` varchar(1) NOT NULL,
  `teacher` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `lesson_id` int(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `pdf` varchar(18) NOT NULL,
  `ppt` varchar(18) NOT NULL,
  `videos` varchar(18) NOT NULL,
  `courses_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(13) NOT NULL,
  `type` varchar(1) NOT NULL,
  `password` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `name`, `surname`, `dob`, `phone`, `type`, `password`) VALUES
(354001, 'olivia.smith@gmail.com', 'Olivia', 'Smith', '1992-05-12', '07912345678', 'S', '#Olivia92!'),
(354002, 'ethan.johnson@hotmail.com', 'Ethan', 'Johnson', '1987-09-18', '07823456789', 'T', '#Ethan87@'),
(354003, 'chloe.brown@yahoo.co.uk', 'Chloe', 'Brown', '1996-03-05', '07734567890', 'S', '#Chloe96%'),
(354004, 'samuel.davis@outlook.com', 'Samuel', 'Davis', '1985-11-21', '07545678901', 'T', '#Samuel85^'),
(354005, 'amelia.wilson@gmail.com', 'Amelia', 'Wilson', '1999-07-07', '07456789012', 'S', '#Amelia99*'),
(354006, 'william.taylor@yahoo.co.uk', 'William', 'Taylor', '1990-02-14', '07367890123', 'S', '#William90$'),
(354007, 'emily.anderson@hotmail.com', 'Emily', 'Anderson', '1993-12-03', '07278901234', 'S', '#Emily93&'),
(354008, 'daniel.jackson@gmail.com', 'Daniel', 'Jackson', '1989-06-28', '07189012345', 'S', '#Daniel89+'),
(354009, 'sophia.clark@yahoo.co.uk', 'Sophia', 'Clark', '1991-10-09', '07090123456', 'S', '#Sophia91%'),
(354010, 'benjamin.roberts@outlook.com', 'Benjamin', 'Roberts', '1988-04-17', '07901234567', 'T', '#Benjamin88^');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courses_id`);

--
-- Indexes for table `enrolment`
--
ALTER TABLE `enrolment`
  ADD PRIMARY KEY (`user_id`,`courses_id`),
  ADD KEY `rel2` (`courses_id`),
  ADD KEY `re3` (`teacher`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `courses_id` (`courses_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courses_id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `lesson_id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=354011;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrolment`
--
ALTER TABLE `enrolment`
  ADD CONSTRAINT `re3` FOREIGN KEY (`teacher`) REFERENCES `courses` (`courses_id`),
  ADD CONSTRAINT `rel1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `rel2` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`courses_id`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `courses_id` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`courses_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
