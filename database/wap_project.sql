-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 26, 2017 at 06:23 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wap_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `Ride`
--

CREATE TABLE `Ride` (
  `id` int(11) NOT NULL,
  `pickupPoint` varchar(255) NOT NULL,
  `dropoffPoint` varchar(255) NOT NULL,
  `startDateTime` datetime NOT NULL,
  `returnDateTime` datetime DEFAULT NULL,
  `isRoundTrip` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,0) NOT NULL,
  `numOfSeat` tinyint(4) NOT NULL,
  `startRideDetail` text NOT NULL,
  `returnRideDetail` text NOT NULL,
  `maxLuggage` enum('Small','Medium','Large') NOT NULL,
  `pickupFlexibility` enum('Rightontime','Ina15minutewindow','Ina30minutewindow','Ina1hourwindow','Ina2hourwindow') NOT NULL,
  `emailUser` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Ride`
--

INSERT INTO `Ride` (`id`, `pickupPoint`, `dropoffPoint`, `startDateTime`, `returnDateTime`, `isRoundTrip`, `price`, `numOfSeat`, `startRideDetail`, `returnRideDetail`, `maxLuggage`, `pickupFlexibility`, `emailUser`) VALUES
(1, 'fa', 'fa', '2017-09-09 01:00:00', '2017-09-28 02:00:00', 1, '200', 4, '12121', '12121', 'Small', 'Rightontime', 'quytran288@gmail.com'),
(2, 'fa', 'fff', '2017-09-16 01:00:00', '2017-09-21 01:00:00', 0, '200', 3, 'go', 'back', 'Large', 'Ina30minutewindow', 'quytran288@gmail.com'),
(3, 'f', 'f', '2017-09-30 01:00:00', '2017-09-12 02:00:00', 1, '200', 3, 'ga', 'f', 'Large', 'Rightontime', 'quytran288@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstName` varchar(100) NOT NULL DEFAULT '',
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `yearOfBirth` int(11) NOT NULL,
  `password` varchar(1000) NOT NULL DEFAULT '',
  `gender` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `firstName`, `lastName`, `email`, `yearOfBirth`, `password`, `gender`) VALUES
(10, 'quy', 'tran', 'quytran288@gmail.com', 1991, '547db7b0e48b4eba28a9159a8f3eb0eeea8162f9', 0),
(11, 'kim', 'long', 'kimlong123@gmail.com', 1990, '547db7b0e48b4eba28a9159a8f3eb0eeea8162f9', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Ride`
--
ALTER TABLE `Ride`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Ride`
--
ALTER TABLE `Ride`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
