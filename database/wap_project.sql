# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.19-MariaDB)
# Database: wap_project
# Generation Time: 2017-09-28 14:44:07 +0000
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
	(18,14,16,1,'2017-09-28 09:33:31');

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
	(13,'Fairfield','Davenport','2017-09-29 14:00:00',NULL,0,50,3,'I travel regularly from chorley to London. Collection and drop off in Manchester is usually Stretford metro or where ever suitable, I switch phone off 10pm sunday night but u can book and i will collect at stretford metro 6am monday, drop off and collection in London is bow rd or cockfosters or redbridge tube station','null','Small','Rightontime','quytran@gmail.com'),
	(14,'Ottumwa','Chicago','2017-09-30 15:00:00',NULL,0,150,7,'Hi - I will be leaving for Manchester after work on Thursday and returning on Sunday night.\r\n\r\nWill be able to pick and drop within reasonable distance please - please check prior to booking.','null','Medium','Ina15minutewindow','quytran@gmail.com'),
	(15,'Des Moine','New York','2017-10-26 14:00:00',NULL,0,500,4,'CRB checked London fire fighter travelling regularly between London and the northwest. \r\n\r\n***Free WiFi onboard*** \r\n\r\nPlease ask any questions before you book\r\n\r\nNormal travel times to/from London are: \r\nManchester/Liverpool <4 hours \r\nBirmingham <2 hours \r\n','null','Large','Ina30minutewindow','quytran@gmail.com'),
	(16,'Fairfield','Des Moine','2017-09-29 13:00:00',NULL,0,30,3,'Free for MUM students','null','Large','Ina15minutewindow','quytran@gmail.com');

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
	(14,'Quy','Tran','quytran@gmail.com',1990,'547db7b0e48b4eba28a9159a8f3eb0eeea8162f9',1,NULL);

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
