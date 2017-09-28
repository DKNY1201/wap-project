# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.19-MariaDB)
# Database: wap_project
# Generation Time: 2017-09-28 04:05:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Booking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Booking`;

CREATE TABLE `Booking` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idRide` int(11) NOT NULL,
  `numOfSeat` int(11) NOT NULL,
  `bookingDateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;

INSERT INTO `Booking` (`id`, `idUser`, `idRide`, `numOfSeat`, `bookingDateTime`)
VALUES
	(11,10,3,1,'2017-09-27 09:33:54'),
	(12,10,3,1,'2017-09-27 09:35:04'),
	(13,10,5,1,'2017-09-27 09:35:23'),
	(14,10,5,1,'2017-09-27 09:47:29'),
	(15,10,9,1,'2017-09-27 22:36:53');

/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Ride
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Ride`;

CREATE TABLE `Ride` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `emailUser` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Ride` WRITE;
/*!40000 ALTER TABLE `Ride` DISABLE KEYS */;

INSERT INTO `Ride` (`id`, `pickupPoint`, `dropoffPoint`, `startDateTime`, `returnDateTime`, `isRoundTrip`, `price`, `numOfSeat`, `startRideDetail`, `returnRideDetail`, `maxLuggage`, `pickupFlexibility`, `emailUser`)
VALUES
	(1,'fa','fa','2017-09-09 01:00:00','2017-09-28 02:00:00',1,200,4,'12121','12121','Small','Rightontime','quytran288@gmail.com'),
	(2,'fa','fff','2017-09-16 01:00:00','2017-09-21 01:00:00',0,200,3,'go','back','Large','Ina30minutewindow','quytran288@gmail.com'),
	(3,'f','f','2017-09-30 01:00:00','2017-09-12 02:00:00',1,200,3,'ga','f','Large','Rightontime','quytran288@gmail.com'),
	(5,'f','f','2017-09-30 01:00:00','2017-09-12 02:00:00',1,200,3,'ga','f','Large','Rightontime','kimlong123@gmail.com'),
	(6,'aaa','bbb','2017-09-27 23:00:00',NULL,0,200,3,'dBlaBlaCar is the world\'s leading carpooling community which enables low-cost city-to-city travel by connecting people with drivers going the same way. Next time you travel, share a car journey and get there toget','null','Small','Rightontime','quytran288@gmail.com'),
	(7,'aaaaa','bbbb','2017-09-27 23:00:00',NULL,0,200,4,'startDatetimestartDatetimestartDatetime','null','Medium','Ina30minutewindow','quytran288@gmail.com'),
	(8,'fafa','baba','2017-09-29 22:13:00',NULL,0,200,4,'dsdsdsdsdasads','null','Small','Rightontime','quytran288@gmail.com'),
	(9,'fafa','fafaf','2017-09-29 22:16:00',NULL,0,200,4,'request.getContextPath() + request.getContextPath() + ','null','Small','Rightontime','quytran288@gmail.com'),
	(10,'fa','fa','2017-09-29 22:18:00',NULL,0,200,3,'dasdasdsa','null','Small','Rightontime','quytran288@gmail.com');

/*!40000 ALTER TABLE `Ride` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL DEFAULT '',
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `yearOfBirth` int(11) NOT NULL,
  `password` varchar(200) NOT NULL DEFAULT '',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;

INSERT INTO `Users` (`id`, `firstName`, `lastName`, `email`, `yearOfBirth`, `password`, `gender`, `image`)
VALUES
	(10,'quy','tran','quytran288@gmail.com',1991,'547db7b0e48b4eba28a9159a8f3eb0eeea8162f9',0,NULL),
	(11,'kim','long','kimlong123@gmail.com',1990,'547db7b0e48b4eba28a9159a8f3eb0eeea8162f9',1,NULL);

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
