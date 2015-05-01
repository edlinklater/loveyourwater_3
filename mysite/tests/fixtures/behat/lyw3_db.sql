# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.6.23)
# Database: lyw3_db
# Generation Time: 2015-04-30 23:56:46 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ActionLink
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ActionLink`;

CREATE TABLE `ActionLink` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ActionLink') DEFAULT 'ActionLink',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Icon` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `SortField` int(11) NOT NULL DEFAULT '0',
  `PageID` int(11) NOT NULL DEFAULT '0',
  `LinkID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PageID` (`PageID`),
  KEY `LinkID` (`LinkID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ActionLink` WRITE;
/*!40000 ALTER TABLE `ActionLink` DISABLE KEYS */;

INSERT INTO `ActionLink` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Icon`, `Content`, `SortField`, `PageID`, `LinkID`)
VALUES
	(1,'ActionLink','2015-05-01 11:43:00','2015-05-01 11:43:00','Call to Action1',NULL,'This is Call to Action1',1,1,2),
	(2,'ActionLink','2015-05-01 11:43:15','2015-05-01 11:43:15','Call to Action2',NULL,'This is Call to Action2',2,1,0),
	(3,'ActionLink','2015-05-01 11:43:34','2015-05-01 11:43:34','Call to Action3',NULL,'This is Call to Action3',3,1,3),
	(4,'ActionLink','2015-05-01 11:43:49','2015-05-01 11:43:49','Call to Action4',NULL,'This is Call to Action4',4,1,0),
	(5,'ActionLink','2015-05-01 11:44:08','2015-05-01 11:44:08','Call to Action5',NULL,'This is Call to Action5',5,1,2);

/*!40000 ALTER TABLE `ActionLink` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Banner`;

CREATE TABLE `Banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Banner') DEFAULT 'Banner',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` mediumtext,
  `Content` mediumtext,
  `ButtonText` mediumtext,
  `SortField` int(11) NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `PageID` int(11) NOT NULL DEFAULT '0',
  `LinkID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `PageID` (`PageID`),
  KEY `LinkID` (`LinkID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Banner` WRITE;
/*!40000 ALTER TABLE `Banner` DISABLE KEYS */;

INSERT INTO `Banner` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Content`, `ButtonText`, `SortField`, `ImageID`, `PageID`, `LinkID`)
VALUES
	(1,'Banner','2015-03-06 15:07:55','2015-03-06 15:07:55','Banner1','<p>This is banner1</p>','Button1',1,2,9,3),
	(2,'Banner','2015-03-06 15:14:55','2015-03-06 15:14:55','Banner1','<p>This is banner1</p>','button1',2,2,1,2),
	(3,'Banner','2015-03-06 15:15:43','2015-03-06 15:15:43','Banner2','<p>This is banner2</p>','button2',3,4,1,3),
	(4,'Banner','2015-03-06 15:17:07','2015-03-06 15:17:07','Banner3','<p>this is banner3</p>',NULL,4,5,1,0),
	(5,'Banner','2015-03-06 15:17:39','2015-03-06 15:17:39','Banner4','<p>This is banner4</p>','Button4',5,6,1,2),
	(6,'Banner','2015-03-06 15:18:58','2015-03-06 15:18:58','Banner5','<p>This is banner5</p>',NULL,6,0,1,0);

/*!40000 ALTER TABLE `Banner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Calendar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Calendar`;

CREATE TABLE `Calendar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Calendar','PublicCalendar') DEFAULT 'Calendar',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table DMSDocument
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DMSDocument`;

CREATE TABLE `DMSDocument` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DMSDocument') DEFAULT 'DMSDocument',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Filename` varchar(255) DEFAULT NULL,
  `Folder` varchar(255) DEFAULT NULL,
  `Title` varchar(1024) DEFAULT NULL,
  `Description` mediumtext,
  `ViewCount` int(11) NOT NULL DEFAULT '0',
  `LastChanged` datetime DEFAULT NULL,
  `EmbargoedIndefinitely` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmbargoedUntilPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmbargoedUntilDate` datetime DEFAULT NULL,
  `ExpireAtDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table DMSDocument_Pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DMSDocument_Pages`;

CREATE TABLE `DMSDocument_Pages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DMSDocumentID` int(11) NOT NULL DEFAULT '0',
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `DocumentSort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `DMSDocumentID` (`DMSDocumentID`),
  KEY `SiteTreeID` (`SiteTreeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table DMSDocument_Tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DMSDocument_Tags`;

CREATE TABLE `DMSDocument_Tags` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DMSDocumentID` int(11) NOT NULL DEFAULT '0',
  `DMSTagID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `DMSDocumentID` (`DMSDocumentID`),
  KEY `DMSTagID` (`DMSTagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table DMSDocument_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DMSDocument_versions`;

CREATE TABLE `DMSDocument_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DMSDocument_versions') DEFAULT 'DMSDocument_versions',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Filename` varchar(255) DEFAULT NULL,
  `Folder` varchar(255) DEFAULT NULL,
  `Title` varchar(1024) DEFAULT NULL,
  `Description` mediumtext,
  `ViewCount` int(11) NOT NULL DEFAULT '0',
  `LastChanged` datetime DEFAULT NULL,
  `EmbargoedIndefinitely` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmbargoedUntilPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmbargoedUntilDate` datetime DEFAULT NULL,
  `ExpireAtDate` datetime DEFAULT NULL,
  `VersionCounter` int(11) NOT NULL DEFAULT '0',
  `VersionViewCount` int(11) NOT NULL DEFAULT '0',
  `DocumentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `DocumentID` (`DocumentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table DMSTag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DMSTag`;

CREATE TABLE `DMSTag` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DMSTag') DEFAULT 'DMSTag',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Category` varchar(1024) DEFAULT NULL,
  `Value` varchar(1024) DEFAULT NULL,
  `MultiValue` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ErrorPage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ErrorPage`;

CREATE TABLE `ErrorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ErrorPage` WRITE;
/*!40000 ALTER TABLE `ErrorPage` DISABLE KEYS */;

INSERT INTO `ErrorPage` (`ID`, `ErrorCode`)
VALUES
	(4,404),
	(5,500),
	(10,404);

/*!40000 ALTER TABLE `ErrorPage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ErrorPage_Live
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ErrorPage_Live`;

CREATE TABLE `ErrorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ErrorPage_Live` WRITE;
/*!40000 ALTER TABLE `ErrorPage_Live` DISABLE KEYS */;

INSERT INTO `ErrorPage_Live` (`ID`, `ErrorCode`)
VALUES
	(4,404),
	(5,500),
	(10,404);

/*!40000 ALTER TABLE `ErrorPage_Live` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ErrorPage_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ErrorPage_versions`;

CREATE TABLE `ErrorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Event`;

CREATE TABLE `Event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Event','PublicEvent') DEFAULT 'Event',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `AllDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NoEnd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `StartDateTime` datetime DEFAULT NULL,
  `TimeFrameType` enum('Duration','DateTime') DEFAULT 'Duration',
  `Duration` time DEFAULT NULL,
  `EndDateTime` datetime DEFAULT NULL,
  `Details` mediumtext,
  `EventPageID` int(11) NOT NULL DEFAULT '0',
  `CalendarID` int(11) NOT NULL DEFAULT '0',
  `Region` enum('Northland','Auckland','Waikato','Bay of Plenty','Gisborne','Hawkes Bay','Taranaki','\n		 Manawatu-Whanganui','Wellington','Tasman','Nelson','Marlborough','West Coast','Canterbury','Otago','Southland') DEFAULT 'Northland',
  `CreatorID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventPageID` (`EventPageID`),
  KEY `CalendarID` (`CalendarID`),
  KEY `ClassName` (`ClassName`),
  KEY `CreatorID` (`CreatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;

INSERT INTO `Event` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `AllDay`, `NoEnd`, `StartDateTime`, `TimeFrameType`, `Duration`, `EndDateTime`, `Details`, `EventPageID`, `CalendarID`, `Region`, `CreatorID`)
VALUES
	(1,'PublicEvent','2014-11-30 14:33:32','2014-11-30 14:33:32','My event ',0,0,'2014-11-29 08:30:00','Duration',NULL,'2014-11-29 09:30:00',NULL,0,0,'Auckland',0),
	(2,'PublicEvent','2015-03-06 15:26:16','2015-03-06 15:26:16','Event title1',1,0,'2015-03-01 07:30:00','DateTime',NULL,NULL,NULL,0,0,'Wellington',4),
	(3,'PublicEvent','2015-05-01 11:46:57','2015-05-01 11:47:54','Waiake Beach Clean-up',1,0,'2015-05-01 00:00:00','DateTime',NULL,'2015-05-01 00:00:00','<ul><li>\n<p>Start Date:18/04/2015</p>\n</li>\n<li>\n<p>To:18/04/2015</p>\n</li>\n<li>\n<p>Time:12pm to 2pm</p>\n</li>\n<li>\n<p>Location:Waiake Beach, Auckland</p>\n</li>\n<li>\n<p>Description:</p>\n<div>The aim is to retrieve all types of rubbish from the beach, not just plastic or glass- the whole shabang!</div>\n<div>I will provide rubbish bags and disposable gloves but I do recommend wearing gardening gloves if you have them as they offer more protection and don\'t produce more rubbish.</div>\n<div>The more the merrier so please bring the whole family, your friends and your coworkers :-)</div>\n<div>Look out for the giraffe hat posted in the event picture or our Starting the Change lawn sign. </div>\n<div>A Facebook event will be created soon so check out https://www.facebook.com/startingthechange or email changetheworldwithagiraffe@gmail.com for more info.</div>\n<div>Please do not hesitate to contact me if you have any questions.</div>\n</li>\n</ul>',0,0,'Northland',1),
	(4,'PublicEvent','2015-05-01 11:49:29','2015-05-01 11:49:29','3R Group\'s Beach Clean Up at Richmond Road, Clive',0,0,'2015-04-16 09:00:00','Duration','03:30:00','2015-04-16 12:30:00',NULL,0,0,'Auckland',1),
	(5,'PublicEvent','2015-05-01 11:50:16','2015-05-01 11:50:16','3R Group\'s Beach Clean Up at Richmond Road, Clive',0,0,'2015-04-16 09:00:00','Duration','02:30:00','2015-04-16 11:30:00',NULL,0,0,'Auckland',1),
	(6,'PublicEvent','2015-05-01 11:51:12','2015-05-01 11:51:12','3R Group\'s Beach Clean Up at Richmond Road, Clive',1,0,'2015-04-16 00:00:00','DateTime',NULL,'2015-04-16 00:00:00',NULL,0,0,'Auckland',1),
	(7,'PublicEvent','2015-05-01 11:51:54','2015-05-01 11:52:19','3R Group\'s Beach Clean Up at Richmond Road, Clive',0,0,'2015-05-02 09:00:00','Duration','02:30:00','2015-05-02 11:30:00','<ul><li>\n<p>Start Date:16/04/2015</p>\n</li>\n<li>\n<p>To:16/04/2015</p>\n</li>\n<li>\n<p>Time:13:30 to 16:30</p>\n</li>\n<li>\n<p>Location:Richmond Road, Clive, Hawkes Bay</p>\n</li>\n<li>\n<p>Description:</p>\n<div>3R Group (www.3R.co.nz) are doing a Love your Coast  Beach Clean up  as a community club/team building/good friday activity that also allows us to “get our hands dirty” with some practical environmental action. </div>\n<div>Most of our staff have connections to the beach and the marine environment.  We swim, surf, fish, boat, sail, play, water-ski, and eat fish and seafood.     Because of this we think Love your Coast and Sustainable Coastlines is a worthy cause for us to support.</div>\n<div>This event is a starting point for 3R staff, so we can get experience and gauge results and hopefully it will be something we can be involved with on an ongoing basis.   </div>\n<div>When:                   Thurs April 16th departing office 1:00pm   Three hours from 1:30-4:30pm.   It is high tide at 3pm.   </div>\n<div>Where:                 Beach from East Clive waste treatment plant Richmond Road towards Clive River mouth.   </div>\n<div>All of the storm water discharges from Hastings, Havelock.</div>\n<div> North, Flaxmere and Clive – go into the Clive River and its tributaries and then discharge to sea.      </div>\n<div>3R Group will provide bags and gloves for staff who need them.  If you have gardening gloves bring these as they provide more protection and don\'t create more waste.    Bring sturdy shoes - its a stoney, shingle beach</div>\n<div>Others are welcome to join us.  Contact Michelle@3r.co.nz</div>\n</li>\n</ul>',0,0,'Auckland',1),
	(8,'PublicEvent','2015-05-01 11:53:37','2015-05-01 11:53:37','Love Your Coast Waiheke Island',1,0,'2015-04-16 00:00:00','DateTime',NULL,'2015-04-16 00:00:00','<ul><li>\n<p>Start Date:23/02/2015</p>\n</li>\n<li>\n<p>To:06/03/2015</p>\n</li>\n<li>\n<p>Time:9.00am to 3.00pm</p>\n</li>\n<li>\n<p>Location:</p>\n<span>Waiheke Island, New Zealand</span></li>\n<li>\n<p>Description:</p>\n<div>For Seaweek 2015, Sustainable Coastlines is celebrating the unique beauty of Auckland\'s Hauraki Gulf with a series of clean-up activities on the stunning shores of Waiheke Island. For the second year running Love your Coast Waiheke Island employs the simple, fun experience of beach clean-ups to raise awareness about how litter dropped on Auckland City\'s streets flows through drains, out to sea, and plasters the islands of the Gulf with rubbish. Last year\'s event series netted over 1.5 tonnes of litter.</div>\n<div>We are looking for volunteers to join the clean-up fun. There are plenty of opportunities for anyone and everyone who wants to get involved in looking after Waiheke Island\'s beautiful beaches, so here\'s how you can take part:</div>\n<div>Clean-up solo or lead your own group</div>\n<div>Reusable rubbish sacks and registration info is available from Little Wai Kitchen, 1/149 Ocean View Road, Oneroa from 9am to 3pm, Saturday 28 February to Friday 6 March. Just turn up, grab a rubbish sack, and record where you want to clean-up. Oh, and if you BYO coffee cup, you\'ll get $1 off your coffee! All rubbish collected in marked bags can taken directly to the Waiheke Transfer Station (108 Ostend Road). <a href=\"http://sustainablecoastlines.org/event/love-your-coast-waiheke-2015/#register\">Enter your details at the link here</a> to give us an idea of numbers.</div>\n<div>Tailored team building clean-up for your group</div>\n<div>For a modest fee of $500 + transport costs we will organise a tailored experience for you and your team. This includes the planning and logistics for your event, all event equipment, delivery of our proven Love your Coast presentation, an experienced Sustainable Coastlines team leader on the day, and excellent marketing and CSR materials including logo placement on event collateral, photos and comprehensive data on the rubbish collected. Catering can also be provided (additional costs apply). Tailored clean-ups are available Monday 23 February to Friday 6 March inclusive.<a href=\"http://sustainablecoastlines.org/event/love-your-coast-waiheke-2015/#register\">Register at the link here</a> and we will be in touch to make arrangements.</div>\n<div>Help at an existing clean-up with a school group</div>\n<div>We will be running clean-ups with school groups at beaches on Waiheke Island from Monday 2 March to Friday 6 March, and would love your help to provide additional supervision support at these events -- a very rewarding experience. <a href=\"http://sustainablecoastlines.org/event/love-your-coast-waiheke-2015/#register\">Register at the link here</a> and we will be in touch to make arrangements.</div>\n<div>Thank you</div>\n<div>A huge thank you to our principal event sponsors Singapore Airlines, Pureology and Sealink, whose generous support has allowed us to provide free transportation to, from and around Waiheke Island for all participating school students. Without your assistance this project simply would not be possible.</div>\n</li>\n</ul>',0,0,'Waikato',1),
	(9,'PublicEvent','2015-05-01 11:54:23','2015-05-01 11:54:23','Love Your Coast Waiheke Island',1,0,'2015-05-03 00:00:00','DateTime',NULL,'2015-05-03 00:00:00','<ul><li>\n<p>Start Date:</p>\n<span>23/02/2015</span></li>\n<li>\n<p>To:</p>\n<span>06/03/2015</span></li>\n<li>\n<p>Time:</p>\n<span>9.00am to 3.00pm</span></li>\n<li>\n<p>Location:</p>\n<span>Waiheke Island, New Zealand</span></li>\n<li>\n<p>Description:</p>\n<div>For Seaweek 2015, Sustainable Coastlines is celebrating the unique beauty of Auckland\'s Hauraki Gulf with a series of clean-up activities on the stunning shores of Waiheke Island. For the second year running Love your Coast Waiheke Island employs the simple, fun experience of beach clean-ups to raise awareness about how litter dropped on Auckland City\'s streets flows through drains, out to sea, and plasters the islands of the Gulf with rubbish. Last year\'s event series netted over 1.5 tonnes of litter.</div>\n<div>We are looking for volunteers to join the clean-up fun. There are plenty of opportunities for anyone and everyone who wants to get involved in looking after Waiheke Island\'s beautiful beaches, so here\'s how you can take part:</div>\n<div>Clean-up solo or lead your own group</div>\n<div>Reusable rubbish sacks and registration info is available from Little Wai Kitchen, 1/149 Ocean View Road, Oneroa from 9am to 3pm, Saturday 28 February to Friday 6 March. Just turn up, grab a rubbish sack, and record where you want to clean-up. Oh, and if you BYO coffee cup, you\'ll get $1 off your coffee! All rubbish collected in marked bags can taken directly to the Waiheke Transfer Station (108 Ostend Road). <a href=\"http://sustainablecoastlines.org/event/love-your-coast-waiheke-2015/#register\">Enter your details at the link here</a> to give us an idea of numbers.</div>\n<div>Tailored team building clean-up for your group</div>\n<div>For a modest fee of $500 + transport costs we will organise a tailored experience for you and your team. This includes the planning and logistics for your event, all event equipment, delivery of our proven Love your Coast presentation, an experienced Sustainable Coastlines team leader on the day, and excellent marketing and CSR materials including logo placement on event collateral, photos and comprehensive data on the rubbish collected. Catering can also be provided (additional costs apply). Tailored clean-ups are available Monday 23 February to Friday 6 March inclusive.<a href=\"http://sustainablecoastlines.org/event/love-your-coast-waiheke-2015/#register\">Register at the link here</a> and we will be in touch to make arrangements.</div>\n<div>Help at an existing clean-up with a school group</div>\n<div>We will be running clean-ups with school groups at beaches on Waiheke Island from Monday 2 March to Friday 6 March, and would love your help to provide additional supervision support at these events -- a very rewarding experience. <a href=\"http://sustainablecoastlines.org/event/love-your-coast-waiheke-2015/#register\">Register at the link here</a> and we will be in touch to make arrangements.</div>\n<div>Thank you</div>\n<div>A huge thank you to our principal event sponsors Singapore Airlines, Pureology and Sealink, whose generous support has allowed us to provide free transportation to, from and around Waiheke Island for all participating school students. Without your assistance this project simply would not be possible.</div>\n</li>\n</ul>',0,0,'Waikato',1),
	(10,'PublicEvent','2015-05-01 11:55:47','2015-05-01 11:55:47','Love our Manukau Awhitu Community Event',0,0,'2015-05-04 08:30:00','Duration','04:00:00','2015-05-04 12:30:00','<ul><li>\n<p>Start Date:14/03/2015</p>\n</li>\n<li>\n<p>To:14/03/2015</p>\n</li>\n<li>\n<p>Time:1100 to 1600</p>\n</li>\n<li>\n<p>Location:</p>\n<span>Awhitu Regional Park, South Auckland</span></li>\n<li>\n<p>Description:</p>\n<span><span>Come join </span><a href=\"https://www.facebook.com/emr.mtsct\" data-hovercard=\"/ajax/hovercard/page.php?id=127360900610865\">Experiencing Marine Reserves - Mountains to Sea Conservation Trust</a><span> and The Manukau Restoration Society on the Awhitu Peninsula! Learn how to do Marine Metre Squared soft sediment sampling, WaiCare Stream Sampling and help clean up our beautiful regional park. Register at the main tent and bring $2 along for the sausage sizzle! Hope to see you there!</span></span></li>\n</ul>',0,0,'Auckland',1);

/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table EventCategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EventCategory`;

CREATE TABLE `EventCategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EventCategory','PublicEventCategory') DEFAULT 'EventCategory',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table EventCategory_Events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EventCategory_Events`;

CREATE TABLE `EventCategory_Events` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EventCategoryID` int(11) NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventCategoryID` (`EventCategoryID`),
  KEY `EventID` (`EventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table EventRegistration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EventRegistration`;

CREATE TABLE `EventRegistration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EventRegistration') DEFAULT 'EventRegistration',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `PayersName` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Status` enum('Unpaid','Paid','Cancelled') DEFAULT 'Unpaid',
  `NumberOfTickets` int(11) NOT NULL DEFAULT '0',
  `Notes` mediumtext,
  `AmountPaidCurrency` varchar(3) DEFAULT NULL,
  `AmountPaidAmount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `EventID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventID` (`EventID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table File
# ------------------------------------------------------------

DROP TABLE IF EXISTS `File`;

CREATE TABLE `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('File','Folder','Image','Image_Cached') DEFAULT 'File',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Filename` mediumtext,
  `Content` mediumtext,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `File` WRITE;
/*!40000 ALTER TABLE `File` DISABLE KEYS */;

INSERT INTO `File` (`ID`, `ClassName`, `Created`, `LastEdited`, `Name`, `Title`, `Filename`, `Content`, `ShowInSearch`, `ParentID`, `OwnerID`)
VALUES
	(1,'Folder','2015-03-06 15:07:50','2015-03-06 15:07:50','Uploads','Uploads','assets/Uploads/',NULL,1,0,3),
	(2,'Image','2015-03-06 15:07:50','2015-03-06 15:07:50','why.jpeg','why','assets/Uploads/why.jpeg',NULL,1,1,3),
	(3,'File','2015-03-06 15:08:49','2015-03-06 15:08:49','Meridian-Release-Notes-PM-11-Nov.pdf','Meridian Release Notes PM 11 Nov','assets/Uploads/Meridian-Release-Notes-PM-11-Nov.pdf',NULL,1,1,3),
	(4,'Image','2015-03-06 15:15:42','2015-03-06 15:15:42','dont-panic.jpeg','dont panic','assets/Uploads/dont-panic.jpeg',NULL,1,1,3),
	(5,'Image','2015-03-06 15:17:05','2015-03-06 15:17:05','meridian1.jpeg','meridian1','assets/Uploads/meridian1.jpeg',NULL,1,1,3),
	(6,'Image','2015-03-06 15:17:37','2015-03-06 15:17:37','meridian2.jpeg','meridian2','assets/Uploads/meridian2.jpeg',NULL,1,1,3),
	(7,'Image','2015-03-06 15:18:57','2015-03-06 15:18:57','meridian4.jpeg','meridian4','assets/Uploads/meridian4.jpeg',NULL,1,1,3);

/*!40000 ALTER TABLE `File` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Group`;

CREATE TABLE `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') DEFAULT 'Group',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `Code` varchar(255) DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;

INSERT INTO `Group` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`)
VALUES
	(1,'Group','2014-11-29 14:01:03','2014-11-29 14:01:03','Content Authors',NULL,'content-authors',0,1,NULL,0),
	(2,'Group','2014-11-29 14:01:03','2014-11-29 14:01:03','Administrators',NULL,'administrators',0,0,NULL,0),
	(3,'Group','2015-03-06 14:21:42','2015-03-06 14:21:42','users',NULL,'users',0,0,NULL,0);

/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Group_Members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Group_Members`;

CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Group_Members` WRITE;
/*!40000 ALTER TABLE `Group_Members` DISABLE KEYS */;

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`)
VALUES
	(1,2,1),
	(2,2,2),
	(3,2,3),
	(4,1,4),
	(6,3,6);

/*!40000 ALTER TABLE `Group_Members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Group_Roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Group_Roles`;

CREATE TABLE `Group_Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table LearnDocument
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LearnDocument`;

CREATE TABLE `LearnDocument` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LearnDocument') DEFAULT 'LearnDocument',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `Type` enum('','PDF','Document','Presentation','Video') DEFAULT '',
  `SortField` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `LinkID` int(11) NOT NULL DEFAULT '0',
  `PreviewID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FileID` (`FileID`),
  KEY `LinkID` (`LinkID`),
  KEY `PreviewID` (`PreviewID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `LearnDocument` WRITE;
/*!40000 ALTER TABLE `LearnDocument` DISABLE KEYS */;

INSERT INTO `LearnDocument` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Description`, `Type`, `SortField`, `FileID`, `LinkID`, `PreviewID`)
VALUES
	(1,'LearnDocument','2015-03-06 15:08:53','2015-03-06 15:08:53','Learn1','this is learn doc1','PDF',1,3,9,0);

/*!40000 ALTER TABLE `LearnDocument` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table LearnPage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LearnPage`;

CREATE TABLE `LearnPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SlideEmbedCode` mediumtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table LearnPage_Live
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LearnPage_Live`;

CREATE TABLE `LearnPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SlideEmbedCode` mediumtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table LearnPage_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LearnPage_versions`;

CREATE TABLE `LearnPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `SlideEmbedCode` mediumtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Location`;

CREATE TABLE `Location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Location') DEFAULT 'Location',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Latitude` decimal(9,2) NOT NULL DEFAULT '0.00',
  `Longitude` decimal(9,2) NOT NULL DEFAULT '0.00',
  `Zoom` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table LoginAttempt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LoginAttempt`;

CREATE TABLE `LoginAttempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LoginAttempt') DEFAULT 'LoginAttempt',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` enum('Success','Failure') DEFAULT 'Success',
  `IP` varchar(255) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Member`;

CREATE TABLE `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Member') DEFAULT 'Member',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Email` varchar(254) DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `RememberLoginToken` varchar(160) DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `AutoLoginHash` varchar(160) DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) DEFAULT NULL,
  `TimeFormat` varchar(30) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `IsVerified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `PendingFormData` mediumtext,
  `VerificationCode` varchar(255) DEFAULT NULL,
  `VerificationExpiry` datetime DEFAULT NULL,
  `TempIDHash` varchar(160) DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Email` (`Email`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Member` WRITE;
/*!40000 ALTER TABLE `Member` DISABLE KEYS */;

INSERT INTO `Member` (`ID`, `ClassName`, `Created`, `LastEdited`, `FirstName`, `Surname`, `Email`, `Password`, `RememberLoginToken`, `NumVisit`, `LastVisited`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `DateFormat`, `TimeFormat`, `Phone`, `IsVerified`, `PendingFormData`, `VerificationCode`, `VerificationExpiry`, `TempIDHash`, `TempIDExpired`)
VALUES
	(1,'Member','2014-11-29 14:01:03','2014-11-30 10:16:29','Default Admin',NULL,NULL,NULL,NULL,3,'2014-12-01 08:57:45',NULL,NULL,NULL,NULL,NULL,NULL,'en_US',0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),
	(2,'Member','2015-01-09 10:39:10','2015-01-09 10:39:10','Default Admin',NULL,'td',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en_US',0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),
	(3,'Member','2015-03-06 13:33:09','2015-03-06 13:54:56','Default Admin',NULL,'admin',NULL,NULL,3,'2015-05-01 11:56:41',NULL,NULL,NULL,NULL,NULL,NULL,'en_US',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'90b8cd53393cacda5ee397121ca05770371286d1','2015-03-09 13:54:56'),
	(4,'Member','2015-03-06 14:02:10','2015-03-06 14:32:14','John','Smith','test@test.com','$2y$10$1c7917144e10bfb659841e2f.8sm/KmlZU.K57dlYIJ3PPFfrqcNu',NULL,0,NULL,NULL,NULL,'blowfish','10$1c7917144e10bfb659841f',NULL,'2015-03-06 15:32:14','en_US',7,'MMM d, y','h:mm:ss a',NULL,0,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `Member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table MemberPassword
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MemberPassword`;

CREATE TABLE `MemberPassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberPassword') DEFAULT 'MemberPassword',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `MemberPassword` WRITE;
/*!40000 ALTER TABLE `MemberPassword` DISABLE KEYS */;

INSERT INTO `MemberPassword` (`ID`, `ClassName`, `Created`, `LastEdited`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`)
VALUES
	(1,'MemberPassword','2015-03-06 13:41:02','2015-03-06 13:41:02','$2y$10$c13870ca4bed792558b8euU0V0u5ex.l.kDDNL83Dej0SGj51mZci','10$c13870ca4bed792558b8e7','blowfish',4);

/*!40000 ALTER TABLE `MemberPassword` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Page`;

CREATE TABLE `Page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Subtitle` varchar(50) DEFAULT NULL,
  `IsTerms` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Summary` mediumtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Page` WRITE;
/*!40000 ALTER TABLE `Page` DISABLE KEYS */;

INSERT INTO `Page` (`ID`, `Subtitle`, `IsTerms`, `Summary`)
VALUES
	(1,'This is subtitle on homepage',0,'This is summary text on homepage'),
	(2,NULL,0,NULL),
	(3,NULL,0,NULL),
	(4,NULL,0,NULL),
	(5,NULL,0,NULL),
	(6,NULL,0,NULL),
	(7,NULL,0,NULL),
	(8,NULL,1,NULL),
	(9,NULL,0,NULL),
	(10,'subtitle of event',0,'event summary');

/*!40000 ALTER TABLE `Page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Page_Live
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Page_Live`;

CREATE TABLE `Page_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Subtitle` varchar(50) DEFAULT NULL,
  `IsTerms` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Summary` mediumtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Page_Live` WRITE;
/*!40000 ALTER TABLE `Page_Live` DISABLE KEYS */;

INSERT INTO `Page_Live` (`ID`, `Subtitle`, `IsTerms`, `Summary`)
VALUES
	(1,'This is subtitle on homepage',0,'This is summary text on homepage'),
	(2,NULL,0,NULL),
	(3,NULL,0,NULL),
	(4,NULL,0,NULL),
	(5,NULL,0,NULL),
	(6,NULL,0,NULL),
	(7,NULL,0,NULL),
	(8,NULL,1,NULL),
	(9,NULL,0,NULL),
	(10,'subtitle of event',0,'event summary');

/*!40000 ALTER TABLE `Page_Live` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Page_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Page_versions`;

CREATE TABLE `Page_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Subtitle` varchar(50) DEFAULT NULL,
  `IsTerms` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Summary` mediumtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Page_versions` WRITE;
/*!40000 ALTER TABLE `Page_versions` DISABLE KEYS */;

INSERT INTO `Page_versions` (`ID`, `RecordID`, `Version`, `Subtitle`, `IsTerms`, `Summary`)
VALUES
	(1,1,1,NULL,0,NULL),
	(29,1,2,'This is subtitle on homepage',0,'This is summary text on homepage'),
	(30,1,3,'This is subtitle on homepage',0,'This is summary text on homepage'),
	(31,7,1,NULL,0,NULL);

/*!40000 ALTER TABLE `Page_versions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PaulsPage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PaulsPage`;

CREATE TABLE `PaulsPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NameField` mediumtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `PaulsPage` WRITE;
/*!40000 ALTER TABLE `PaulsPage` DISABLE KEYS */;

INSERT INTO `PaulsPage` (`ID`, `NameField`)
VALUES
	(6,'<p>Save this stuff</p>');

/*!40000 ALTER TABLE `PaulsPage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PaulsPage_Live
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PaulsPage_Live`;

CREATE TABLE `PaulsPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NameField` mediumtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `PaulsPage_Live` WRITE;
/*!40000 ALTER TABLE `PaulsPage_Live` DISABLE KEYS */;

INSERT INTO `PaulsPage_Live` (`ID`, `NameField`)
VALUES
	(6,'<p>Save this stuff</p>');

/*!40000 ALTER TABLE `PaulsPage_Live` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PaulsPage_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PaulsPage_versions`;

CREATE TABLE `PaulsPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `NameField` mediumtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `PaulsPage_versions` WRITE;
/*!40000 ALTER TABLE `PaulsPage_versions` DISABLE KEYS */;

INSERT INTO `PaulsPage_versions` (`ID`, `RecordID`, `Version`, `NameField`)
VALUES
	(1,6,1,NULL),
	(2,6,2,'<p>Save this stuff</p>');

/*!40000 ALTER TABLE `PaulsPage_versions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Permission`;

CREATE TABLE `Permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Permission') DEFAULT 'Permission',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;

INSERT INTO `Permission` (`ID`, `ClassName`, `Created`, `LastEdited`, `Code`, `Arg`, `Type`, `GroupID`)
VALUES
	(1,'Permission','2014-11-29 14:01:03','2014-11-29 14:01:03','CMS_ACCESS_CMSMain',0,1,1),
	(2,'Permission','2014-11-29 14:01:03','2014-11-29 14:01:03','CMS_ACCESS_AssetAdmin',0,1,1),
	(3,'Permission','2014-11-29 14:01:03','2014-11-29 14:01:03','CMS_ACCESS_ReportAdmin',0,1,1),
	(4,'Permission','2014-11-29 14:01:03','2014-11-29 14:01:03','SITETREE_REORGANISE',0,1,1),
	(5,'Permission','2014-11-29 14:01:03','2014-11-29 14:01:03','ADMIN',0,1,2);

/*!40000 ALTER TABLE `Permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PermissionRole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PermissionRole`;

CREATE TABLE `PermissionRole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRole') DEFAULT 'PermissionRole',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PermissionRoleCode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PermissionRoleCode`;

CREATE TABLE `PermissionRoleCode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRoleCode') DEFAULT 'PermissionRoleCode',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table RedirectorPage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RedirectorPage`;

CREATE TABLE `RedirectorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table RedirectorPage_Live
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RedirectorPage_Live`;

CREATE TABLE `RedirectorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table RedirectorPage_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RedirectorPage_versions`;

CREATE TABLE `RedirectorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table RegistrationPage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RegistrationPage`;

CREATE TABLE `RegistrationPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SuccessMessage` mediumtext,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `TermsAndConditionsID` int(11) NOT NULL DEFAULT '0',
  `ConfirmedMessage` mediumtext,
  `VerifiedMessage` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `TermsAndConditionsID` (`TermsAndConditionsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `RegistrationPage` WRITE;
/*!40000 ALTER TABLE `RegistrationPage` DISABLE KEYS */;

INSERT INTO `RegistrationPage` (`ID`, `SuccessMessage`, `GroupID`, `TermsAndConditionsID`, `ConfirmedMessage`, `VerifiedMessage`)
VALUES
	(8,'<p><span>Success Message on Registration</span></p>',0,2,'<p><span>Confirmed </span>Message on Registration</p>','<p><span>Verified </span>Message on Registration</p>');

/*!40000 ALTER TABLE `RegistrationPage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table RegistrationPage_Live
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RegistrationPage_Live`;

CREATE TABLE `RegistrationPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SuccessMessage` mediumtext,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `TermsAndConditionsID` int(11) NOT NULL DEFAULT '0',
  `ConfirmedMessage` mediumtext,
  `VerifiedMessage` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `TermsAndConditionsID` (`TermsAndConditionsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `RegistrationPage_Live` WRITE;
/*!40000 ALTER TABLE `RegistrationPage_Live` DISABLE KEYS */;

INSERT INTO `RegistrationPage_Live` (`ID`, `SuccessMessage`, `GroupID`, `TermsAndConditionsID`, `ConfirmedMessage`, `VerifiedMessage`)
VALUES
	(8,'<p><span>Success Message on Registration</span></p>',0,2,'<p><span>Confirmed </span>Message on Registration</p>','<p><span>Verified </span>Message on Registration</p>');

/*!40000 ALTER TABLE `RegistrationPage_Live` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table RegistrationPage_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RegistrationPage_versions`;

CREATE TABLE `RegistrationPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `SuccessMessage` mediumtext,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `TermsAndConditionsID` int(11) NOT NULL DEFAULT '0',
  `ConfirmedMessage` mediumtext,
  `VerifiedMessage` mediumtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `GroupID` (`GroupID`),
  KEY `TermsAndConditionsID` (`TermsAndConditionsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table SiteConfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteConfig`;

CREATE TABLE `SiteConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteConfig') DEFAULT 'SiteConfig',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Tagline` varchar(255) DEFAULT NULL,
  `Theme` varchar(255) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `GACode` varchar(255) DEFAULT NULL,
  `RegistrationEmailAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `SiteConfig` WRITE;
/*!40000 ALTER TABLE `SiteConfig` DISABLE KEYS */;

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Tagline`, `Theme`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`, `GACode`, `RegistrationEmailAddress`)
VALUES
	(1,'SiteConfig','2014-11-29 14:01:03','2015-03-06 15:27:28','Love Your Water','your tagline here','loveyourwater','Anyone','LoggedInUsers','LoggedInUsers',NULL,NULL);

/*!40000 ALTER TABLE `SiteConfig` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table SiteConfig_CreateTopLevelGroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteConfig_CreateTopLevelGroups`;

CREATE TABLE `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table SiteConfig_EditorGroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteConfig_EditorGroups`;

CREATE TABLE `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table SiteConfig_ViewerGroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteConfig_ViewerGroups`;

CREATE TABLE `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table SiteTree
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteTree`;

CREATE TABLE `SiteTree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','CalendarPage','EventPage','ErrorPage','RedirectorPage','VirtualPage','EventCreatePage','HomePage','LearnPage','RegistrationPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `SiteTree` WRITE;
/*!40000 ALTER TABLE `SiteTree` DISABLE KEYS */;

INSERT INTO `SiteTree` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`)
VALUES
	(1,'HomePage','2014-11-29 14:01:03','2015-05-01 11:42:31','home','Home',NULL,'<p>Love your Coast is a project to help people around the world look after the coastlines we all love.</p>\n<p>By working together on fun, hands-on projects like beach clean-ups, we can all be a part of the local solution to a global problem.</p>\n<p>Here you can <a href=\"http://loveyourcoast.org/learn/\">learn</a> more about the issue, <a href=\"http://loveyourcoast.org/Events/\">find</a>clean-up events, <a href=\"http://loveyourcoast.org/create/\">create</a> your own event and<a href=\"http://loveyourcoast.org/my-events/share/\">share</a> your results.</p>',NULL,NULL,0,1,1,0,0,NULL,'Inherit','Inherit',3,0),
	(2,'Page','2014-11-29 14:01:03','2014-11-29 14:01:03','about-us','About Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>',NULL,NULL,1,1,2,0,0,NULL,'Inherit','Inherit',1,0),
	(3,'Page','2014-11-29 14:01:03','2014-11-29 14:01:03','contact-us','Contact Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>',NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',1,0),
	(4,'ErrorPage','2014-11-29 14:01:03','2014-11-29 14:01:03','page-not-found','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,0,0,4,0,0,NULL,'Inherit','Inherit',1,0),
	(5,'ErrorPage','2014-11-29 14:01:03','2014-11-29 14:01:03','server-error','Server error',NULL,'<p>Sorry, there was a problem with handling your request.</p>',NULL,NULL,0,0,5,0,0,NULL,'Inherit','Inherit',1,0),
	(7,'CalendarPage','2014-11-30 14:34:17','2015-05-01 11:45:14','calendar-page','Calendar page',NULL,NULL,NULL,NULL,1,1,7,0,0,NULL,'Inherit','Inherit',1,0),
	(8,'RegistrationPage','2015-03-06 13:59:51','2015-03-06 15:21:14','registration-page','Registration Page',NULL,NULL,NULL,NULL,0,1,8,0,0,NULL,'Inherit','Inherit',5,0),
	(9,'LearnPage','2015-03-06 15:06:36','2015-03-06 15:09:06','learn-page','Learn Page',NULL,NULL,NULL,NULL,1,1,10,0,0,NULL,'Inherit','Inherit',2,0),
	(10,'ErrorPage','2015-03-06 15:11:03','2015-03-06 15:25:13','event-page','Event Page',NULL,'<p>this is the content of an event.</p>',NULL,NULL,1,1,9,0,0,NULL,'Inherit','Inherit',11,0);

/*!40000 ALTER TABLE `SiteTree` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table SiteTree_EditorGroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteTree_EditorGroups`;

CREATE TABLE `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table SiteTree_ImageTracking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteTree_ImageTracking`;

CREATE TABLE `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table SiteTree_LinkTracking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteTree_LinkTracking`;

CREATE TABLE `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table SiteTree_Live
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteTree_Live`;

CREATE TABLE `SiteTree_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','CalendarPage','EventPage','ErrorPage','RedirectorPage','VirtualPage','EventCreatePage','HomePage','LearnPage','RegistrationPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `SiteTree_Live` WRITE;
/*!40000 ALTER TABLE `SiteTree_Live` DISABLE KEYS */;

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`)
VALUES
	(1,'HomePage','2014-11-29 14:01:03','2015-05-01 11:42:31','home','Home',NULL,'<p>Love your Coast is a project to help people around the world look after the coastlines we all love.</p>\n<p>By working together on fun, hands-on projects like beach clean-ups, we can all be a part of the local solution to a global problem.</p>\n<p>Here you can <a href=\"http://loveyourcoast.org/learn/\">learn</a> more about the issue, <a href=\"http://loveyourcoast.org/Events/\">find</a>clean-up events, <a href=\"http://loveyourcoast.org/create/\">create</a> your own event and<a href=\"http://loveyourcoast.org/my-events/share/\">share</a> your results.</p>',NULL,NULL,0,1,1,0,0,NULL,'Inherit','Inherit',3,0),
	(2,'Page','2014-11-29 14:01:03','2014-11-29 14:01:03','about-us','About Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>',NULL,NULL,1,1,2,0,0,NULL,'Inherit','Inherit',1,0),
	(3,'Page','2014-11-29 14:01:03','2014-11-29 14:01:03','contact-us','Contact Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>',NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',1,0),
	(4,'ErrorPage','2014-11-29 14:01:03','2014-11-29 14:01:03','page-not-found','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,0,0,4,0,0,NULL,'Inherit','Inherit',1,0),
	(5,'ErrorPage','2014-11-29 14:01:03','2014-11-29 14:01:03','server-error','Server error',NULL,'<p>Sorry, there was a problem with handling your request.</p>',NULL,NULL,0,0,5,0,0,NULL,'Inherit','Inherit',1,0),
	(7,'CalendarPage','2014-11-30 14:34:17','2015-05-01 11:45:14','calendar-page','Calendar page',NULL,NULL,NULL,NULL,1,1,7,0,0,NULL,'Inherit','Inherit',1,0),
	(8,'RegistrationPage','2015-03-06 13:59:51','2015-03-06 15:21:14','registration-page','Registration Page',NULL,NULL,NULL,NULL,0,1,8,0,0,NULL,'Inherit','Inherit',5,0),
	(9,'LearnPage','2015-03-06 15:06:36','2015-03-06 15:09:06','learn-page','Learn Page',NULL,NULL,NULL,NULL,1,1,10,0,0,NULL,'Inherit','Inherit',2,0),
	(10,'ErrorPage','2015-03-06 15:11:03','2015-03-06 15:25:13','event-page','Event Page',NULL,'<p>this is the content of an event.</p>',NULL,NULL,1,1,9,0,0,NULL,'Inherit','Inherit',11,0);

/*!40000 ALTER TABLE `SiteTree_Live` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table SiteTree_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteTree_versions`;

CREATE TABLE `SiteTree_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','CalendarPage','EventPage','ErrorPage','RedirectorPage','VirtualPage','EventCreatePage','HomePage','LearnPage','RegistrationPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `SiteTree_versions` WRITE;
/*!40000 ALTER TABLE `SiteTree_versions` DISABLE KEYS */;

INSERT INTO `SiteTree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `ParentID`)
VALUES
	(1,1,1,1,0,0,'Page','2014-11-29 14:01:03','2014-11-29 14:01:03','home','Home',NULL,'<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>',NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',0),
	(2,1,2,1,3,3,'HomePage','2014-11-29 14:01:03','2015-05-01 11:41:35','home','Home',NULL,'<p>Love your Coast is a project to help people around the world look after the coastlines we all love.</p>\n<p>By working together on fun, hands-on projects like beach clean-ups, we can all be a part of the local solution to a global problem.</p>\n<p>Here you can <a href=\"http://loveyourcoast.org/learn/\">learn</a> more about the issue, <a href=\"http://loveyourcoast.org/Events/\">find</a>clean-up events, <a href=\"http://loveyourcoast.org/create/\">create</a> your own event and<a href=\"http://loveyourcoast.org/my-events/share/\">share</a> your results.</p>',NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',0),
	(3,1,3,1,3,3,'HomePage','2014-11-29 14:01:03','2015-05-01 11:42:31','home','Home',NULL,'<p>Love your Coast is a project to help people around the world look after the coastlines we all love.</p>\n<p>By working together on fun, hands-on projects like beach clean-ups, we can all be a part of the local solution to a global problem.</p>\n<p>Here you can <a href=\"http://loveyourcoast.org/learn/\">learn</a> more about the issue, <a href=\"http://loveyourcoast.org/Events/\">find</a>clean-up events, <a href=\"http://loveyourcoast.org/create/\">create</a> your own event and<a href=\"http://loveyourcoast.org/my-events/share/\">share</a> your results.</p>',NULL,NULL,0,1,1,0,0,NULL,'Inherit','Inherit',0),
	(4,7,1,1,3,3,'CalendarPage','2014-11-30 14:34:17','2015-05-01 11:45:14','calendar-page','Calendar page',NULL,NULL,NULL,NULL,1,1,7,0,0,NULL,'Inherit','Inherit',0);

/*!40000 ALTER TABLE `SiteTree_versions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table SiteTree_ViewerGroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteTree_ViewerGroups`;

CREATE TABLE `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table VirtualPage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `VirtualPage`;

CREATE TABLE `VirtualPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table VirtualPage_Live
# ------------------------------------------------------------

DROP TABLE IF EXISTS `VirtualPage_Live`;

CREATE TABLE `VirtualPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table VirtualPage_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `VirtualPage_versions`;

CREATE TABLE `VirtualPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
