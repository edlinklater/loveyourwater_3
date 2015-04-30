-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: internal-db.s203872.gridserver.com
-- Generation Time: Apr 30, 2015 at 02:13 PM
-- Server version: 5.1.72-rel14.10
-- PHP Version: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db203872_ss_lyw3_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ActionLink`
--

CREATE TABLE IF NOT EXISTS `ActionLink` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ActionLink') CHARACTER SET utf8 DEFAULT 'ActionLink',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Icon` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `SortField` int(11) NOT NULL DEFAULT '0',
  `PageID` int(11) NOT NULL DEFAULT '0',
  `LinkID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PageID` (`PageID`),
  KEY `LinkID` (`LinkID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Banner`
--

CREATE TABLE IF NOT EXISTS `Banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Banner') CHARACTER SET utf8 DEFAULT 'Banner',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` mediumtext CHARACTER SET utf8,
  `Content` mediumtext CHARACTER SET utf8,
  `ButtonText` mediumtext CHARACTER SET utf8,
  `SortField` int(11) NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `PageID` int(11) NOT NULL DEFAULT '0',
  `LinkID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `PageID` (`PageID`),
  KEY `LinkID` (`LinkID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Banner`
--

INSERT INTO `Banner` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Content`, `ButtonText`, `SortField`, `ImageID`, `PageID`, `LinkID`) VALUES
(1, 'Banner', '2015-02-22 22:13:05', '2015-03-17 03:19:57', 'Learn More', '<p><span>We need clean water to swim, drink, grow food and run our businesses. Love your Water is your free tool to learn about looking after our streams, rivers and lakes. Let''s start caring for clean water today.</span></p>', NULL, 1, 4, 1, 0),
(2, 'Banner', '2015-03-17 03:27:51', '2015-03-17 03:27:51', 'Find Events', '<p><span>Trees and water work well together. Planting trees beside waterways helps stop sediment, reduce harmful nutrients and restore native habitats. Check out and join planting events near you.</span></p>', NULL, 2, 5, 1, 0),
(3, 'Banner', '2015-03-17 03:29:26', '2015-03-17 03:30:36', 'Sign-up Now', '<p><span>Join the campaign to clean up our waterways. Register in under a minute to join events near you, create your own events and show off your results. Attended our workshops? Promote yourself as a trained presenter. </span></p>', NULL, 3, 6, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Calendar`
--

CREATE TABLE IF NOT EXISTS `Calendar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Calendar','PublicCalendar') CHARACTER SET utf8 DEFAULT 'Calendar',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Color` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage`
--

CREATE TABLE IF NOT EXISTS `ErrorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage`
--

INSERT INTO `ErrorPage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Live`
--

CREATE TABLE IF NOT EXISTS `ErrorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_versions`
--

CREATE TABLE IF NOT EXISTS `ErrorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ErrorPage_versions`
--

INSERT INTO `ErrorPage_versions` (`ID`, `RecordID`, `Version`, `ErrorCode`) VALUES
(1, 4, 1, 404),
(2, 5, 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE IF NOT EXISTS `Event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Event','PublicEvent') CHARACTER SET utf8 DEFAULT 'Event',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `AllDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NoEnd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `StartDateTime` datetime DEFAULT NULL,
  `TimeFrameType` enum('Duration','DateTime') CHARACTER SET utf8 DEFAULT 'Duration',
  `Duration` time DEFAULT NULL,
  `EndDateTime` datetime DEFAULT NULL,
  `Details` mediumtext CHARACTER SET utf8,
  `Region` enum('Northland','Auckland','Waikato','Bay of Plenty','Gisborne','Hawkes Bay','Taranaki','\n		 Manawatu-Whanganui','Wellington','Tasman','Nelson','Marlborough','West Coast','Canterbury','Otago','Southland') CHARACTER SET utf8 DEFAULT 'Northland',
  `EventPageID` int(11) NOT NULL DEFAULT '0',
  `CalendarID` int(11) NOT NULL DEFAULT '0',
  `CreatorID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventPageID` (`EventPageID`),
  KEY `CalendarID` (`CalendarID`),
  KEY `CreatorID` (`CreatorID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Event`
--

INSERT INTO `Event` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `AllDay`, `NoEnd`, `StartDateTime`, `TimeFrameType`, `Duration`, `EndDateTime`, `Details`, `Region`, `EventPageID`, `CalendarID`, `CreatorID`) VALUES
(2, 'PublicEvent', '2015-03-17 03:34:35', '2015-03-17 03:34:35', 'Love Your Water Christchurch Tree Planting', 0, 0, '2015-07-20 09:00:00', 'Duration', NULL, '2015-07-31 17:00:00', 'We work hard to inspire, educate and enable people to look after the places we love. We are excited to announce that this winter we will travel to as many of Aotearoa’s regions as possible, training people from businesses, community groups, councils and high schools to use the educational and engagement methods that we have proven effective.\n\nThrough generous support from HSBC, Benefitz and Singapore Airlines we are pleased to announce an initial schedule for the Love Your Water 2015 tour. We have confirmed funding to run training workshops, educational presentations and tree planting activities in Auckland, Wellington, Nelson and Canterbury this winter.\n\nWe look forward to working with you again in as many regions of the country as possible. Please read on for more details on what our ‘Love Your Water’ activities in each region could look like:\n\nTraining workshops\n\nWe offer free Event Management and Presentation Delivery workshops, open to all members of the public, including youth leaders and senior high school students.\n\nEvent Management workshops provide an insight into our experience motivating nearly 40,000 volunteers during clean-ups, tree-planting events and fundraisers, and pass on tips and techniques for attendees to deliver their own events.\n\nPresentation Delivery workshops draw on our experience delivering educational presentations to over 110,000 attendees and provide introductory training on the delivery of our Love your Water freshwater restoration presentation, as well as tips and techniques that can be applied by the audience to their own presentation.\n\nOngoing engagement of trained ambassadors with the delivery of both events and presentations is a core objective of our time in each region.\n\nEducational presentations\n\nOur experienced presenters will deliver our Love your Water presentation in schools in each region, to introduce issues affecting freshwater quality and simple solutions to address these. Developed through consultation and compilation of content during last year’s nationwide tour, the Love your Water presentation aims to educate and inspire attendees to get involved in hands-on local solutions that make a difference to freshwater quality.\n\nDelivery of educational presentations will be scheduled in schools to follow our Presentation Delivery workshop, in order to allow anyone who has received introductory training to either attend and observe or actively participate and present so that they gain real-life presentation experience.\n\nTree planting events\n\nWorking alongside local tree planting experts we will identify and plan for a suitable area and coordinate a riparian planting activity on this site. This hands-on activity is a perfect opportunity for school students and community members alike to learn about freshwater restoration while actively improving a local waterway. These events offer the opportunity to learn about practical techniques such as tree planting, weed removal and community engagement, as well as discuss the issue in an informal and fun setting.\n\nIf you know of an appropriate site, but significant preparation work is required, we can also facilitate assistance from Department of Corrections’ workers to get the job done.\n\nDelivery of planting activities will be scheduled to follow our Event Management workshop, in order to allow anyone who has received introductory training to attend, observe and participate so that they gain real-life events experience.', 'Canterbury', 0, 0, 4),
(3, 'PublicEvent', '2015-03-17 03:38:03', '2015-03-17 03:38:03', 'Love Your Water Nelson Tree Planting', 0, 0, '2015-08-10 09:00:00', 'Duration', NULL, '2015-08-26 17:00:00', 'We work hard to inspire, educate and enable people to look after the places we love. We are excited to announce that this winter we will travel to as many of Aotearoa’s regions as possible, training people from businesses, community groups, councils and high schools to use the educational and engagement methods that we have proven effective. Through generous support from HSBC, Benefitz and Singapore Airlines we are pleased to announce an initial schedule for the Love Your Water 2015 tour. We have confirmed funding to run training workshops, educational presentations and tree planting activities in Auckland, Wellington, Nelson and Canterbury this winter. We look forward to working with you again in as many regions of the country as possible. Please read on for more details on what our ‘Love Your Water’ activities in each region could look like: Training workshops We offer free Event Management and Presentation Delivery workshops, open to all members of the public, including youth leaders and senior high school students. Event Management workshops provide an insight into our experience motivating nearly 40,000 volunteers during clean-ups, tree-planting events and fundraisers, and pass on tips and techniques for attendees to deliver their own events. Presentation Delivery workshops draw on our experience delivering educational presentations to over 110,000 attendees and provide introductory training on the delivery of our Love your Water freshwater restoration presentation, as well as tips and techniques that can be applied by the audience to their own presentation. Ongoing engagement of trained ambassadors with the delivery of both events and presentations is a core objective of our time in each region. Educational presentations Our experienced presenters will deliver our Love your Water presentation in schools in each region, to introduce issues affecting freshwater quality and simple solutions to address these. Developed through consultation and compilation of content during last year’s nationwide tour, the Love your Water presentation aims to educate and inspire attendees to get involved in hands-on local solutions that make a difference to freshwater quality. Delivery of educational presentations will be scheduled in schools to follow our Presentation Delivery workshop, in order to allow anyone who has received introductory training to either attend and observe or actively participate and present so that they gain real-life presentation experience. Tree planting events Working alongside local tree planting experts we will identify and plan for a suitable area and coordinate a riparian planting activity on this site. This hands-on activity is a perfect opportunity for school students and community members alike to learn about freshwater restoration while actively improving a local waterway. These events offer the opportunity to learn about practical techniques such as tree planting, weed removal and community engagement, as well as discuss the issue in an informal and fun setting. If you know of an appropriate site, but significant preparation work is required, we can also facilitate assistance from Department of Corrections’ workers to get the job done. Delivery of planting activities will be scheduled to follow our Event Management workshop, in order to allow anyone who has received introductory training to attend, observe and participate so that they gain real-life events experience.', 'Nelson', 0, 0, 4),
(4, 'PublicEvent', '2015-03-17 03:39:48', '2015-03-17 03:39:48', 'Love Your Water Wellington Tree Planting', 0, 0, '2015-06-15 09:00:00', 'Duration', NULL, '2015-06-26 17:00:00', 'We work hard to inspire, educate and enable people to look after the places we love. We are excited to announce that this winter we will travel to as many of Aotearoa’s regions as possible, training people from businesses, community groups, councils and high schools to use the educational and engagement methods that we have proven effective. Through generous support from HSBC, Benefitz and Singapore Airlines we are pleased to announce an initial schedule for the Love Your Water 2015 tour. We have confirmed funding to run training workshops, educational presentations and tree planting activities in Auckland, Wellington, Nelson and Canterbury this winter. We look forward to working with you again in as many regions of the country as possible. Please read on for more details on what our ‘Love Your Water’ activities in each region could look like: Training workshops We offer free Event Management and Presentation Delivery workshops, open to all members of the public, including youth leaders and senior high school students. Event Management workshops provide an insight into our experience motivating nearly 40,000 volunteers during clean-ups, tree-planting events and fundraisers, and pass on tips and techniques for attendees to deliver their own events. Presentation Delivery workshops draw on our experience delivering educational presentations to over 110,000 attendees and provide introductory training on the delivery of our Love your Water freshwater restoration presentation, as well as tips and techniques that can be applied by the audience to their own presentation. Ongoing engagement of trained ambassadors with the delivery of both events and presentations is a core objective of our time in each region. Educational presentations Our experienced presenters will deliver our Love your Water presentation in schools in each region, to introduce issues affecting freshwater quality and simple solutions to address these. Developed through consultation and compilation of content during last year’s nationwide tour, the Love your Water presentation aims to educate and inspire attendees to get involved in hands-on local solutions that make a difference to freshwater quality. Delivery of educational presentations will be scheduled in schools to follow our Presentation Delivery workshop, in order to allow anyone who has received introductory training to either attend and observe or actively participate and present so that they gain real-life presentation experience. Tree planting events Working alongside local tree planting experts we will identify and plan for a suitable area and coordinate a riparian planting activity on this site. This hands-on activity is a perfect opportunity for school students and community members alike to learn about freshwater restoration while actively improving a local waterway. These events offer the opportunity to learn about practical techniques such as tree planting, weed removal and community engagement, as well as discuss the issue in an informal and fun setting. If you know of an appropriate site, but significant preparation work is required, we can also facilitate assistance from Department of Corrections’ workers to get the job done. Delivery of planting activities will be scheduled to follow our Event Management workshop, in order to allow anyone who has received introductory training to attend, observe and participate so that they gain real-life events experience.', 'Wellington', 0, 0, 4),
(5, 'PublicEvent', '2015-03-17 03:41:46', '2015-03-17 03:41:46', 'Love Your Water Auckland Tree Planting', 0, 0, '2015-05-25 09:00:00', 'Duration', NULL, '2015-06-05 17:00:00', 'We work hard to inspire, educate and enable people to look after the places we love. We are excited to announce that this winter we will travel to as many of Aotearoa’s regions as possible, training people from businesses, community groups, councils and high schools to use the educational and engagement methods that we have proven effective. Through generous support from HSBC, Benefitz and Singapore Airlines we are pleased to announce an initial schedule for the Love Your Water 2015 tour. We have confirmed funding to run training workshops, educational presentations and tree planting activities in Auckland, Wellington, Nelson and Canterbury this winter. We look forward to working with you again in as many regions of the country as possible. Please read on for more details on what our ‘Love Your Water’ activities in each region could look like: Training workshops We offer free Event Management and Presentation Delivery workshops, open to all members of the public, including youth leaders and senior high school students. Event Management workshops provide an insight into our experience motivating nearly 40,000 volunteers during clean-ups, tree-planting events and fundraisers, and pass on tips and techniques for attendees to deliver their own events. Presentation Delivery workshops draw on our experience delivering educational presentations to over 110,000 attendees and provide introductory training on the delivery of our Love your Water freshwater restoration presentation, as well as tips and techniques that can be applied by the audience to their own presentation. Ongoing engagement of trained ambassadors with the delivery of both events and presentations is a core objective of our time in each region. Educational presentations Our experienced presenters will deliver our Love your Water presentation in schools in each region, to introduce issues affecting freshwater quality and simple solutions to address these. Developed through consultation and compilation of content during last year’s nationwide tour, the Love your Water presentation aims to educate and inspire attendees to get involved in hands-on local solutions that make a difference to freshwater quality. Delivery of educational presentations will be scheduled in schools to follow our Presentation Delivery workshop, in order to allow anyone who has received introductory training to either attend and observe or actively participate and present so that they gain real-life presentation experience. Tree planting events Working alongside local tree planting experts we will identify and plan for a suitable area and coordinate a riparian planting activity on this site. This hands-on activity is a perfect opportunity for school students and community members alike to learn about freshwater restoration while actively improving a local waterway. These events offer the opportunity to learn about practical techniques such as tree planting, weed removal and community engagement, as well as discuss the issue in an informal and fun setting. If you know of an appropriate site, but significant preparation work is required, we can also facilitate assistance from Department of Corrections’ workers to get the job done. Delivery of planting activities will be scheduled to follow our Event Management workshop, in order to allow anyone who has received introductory training to attend, observe and participate so that they gain real-life events experience.', 'Auckland', 0, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `EventCategory`
--

CREATE TABLE IF NOT EXISTS `EventCategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EventCategory','PublicEventCategory') CHARACTER SET utf8 DEFAULT 'EventCategory',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `EventCategory_Events`
--

CREATE TABLE IF NOT EXISTS `EventCategory_Events` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EventCategoryID` int(11) NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventCategoryID` (`EventCategoryID`),
  KEY `EventID` (`EventID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `EventRegistration`
--

CREATE TABLE IF NOT EXISTS `EventRegistration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EventRegistration') CHARACTER SET utf8 DEFAULT 'EventRegistration',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PayersName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Status` enum('Unpaid','Paid','Cancelled') CHARACTER SET utf8 DEFAULT 'Unpaid',
  `NumberOfTickets` int(11) NOT NULL DEFAULT '0',
  `Notes` mediumtext CHARACTER SET utf8,
  `AmountPaidCurrency` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `AmountPaidAmount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `EventID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventID` (`EventID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `File`
--

CREATE TABLE IF NOT EXISTS `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('File','Folder','Image','Image_Cached') CHARACTER SET utf8 DEFAULT 'File',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Filename` mediumtext CHARACTER SET utf8,
  `Content` mediumtext CHARACTER SET utf8,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `File`
--

INSERT INTO `File` (`ID`, `ClassName`, `Created`, `LastEdited`, `Name`, `Title`, `Filename`, `Content`, `ShowInSearch`, `ParentID`, `OwnerID`) VALUES
(1, 'Image', '2015-02-22 22:11:59', '2015-02-22 22:11:59', 'hero-beach-02.jpg', 'hero beach 02', 'assets/hero-beach-02.jpg', NULL, 1, 0, 3),
(2, 'Folder', '2015-02-22 22:12:48', '2015-02-22 22:12:48', 'Uploads', 'Uploads', 'assets/Uploads/', NULL, 1, 0, 3),
(3, 'Image', '2015-02-22 22:13:02', '2015-02-22 22:13:02', 'hero-beach-02.jpg', 'hero beach 02', 'assets/Uploads/hero-beach-02.jpg', NULL, 1, 2, 3),
(4, 'Image', '2015-03-17 03:18:53', '2015-03-17 03:18:53', 'LYW-header-2015.jpg', 'LYW header 2015', 'assets/Uploads/LYW-header-2015.jpg', NULL, 1, 2, 4),
(5, 'Image', '2015-03-17 03:26:15', '2015-03-17 03:26:15', 'LYW-header-2015-v3.jpg', 'LYW header 2015 v3', 'assets/Uploads/LYW-header-2015-v3.jpg', NULL, 1, 2, 4),
(6, 'Image', '2015-03-17 03:29:09', '2015-03-17 03:29:09', 'LYW-header-2015-v2.jpg', 'LYW header 2015 v2', 'assets/Uploads/LYW-header-2015-v2.jpg', NULL, 1, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Group`
--

CREATE TABLE IF NOT EXISTS `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') CHARACTER SET utf8 DEFAULT 'Group',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8,
  `Code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext CHARACTER SET utf8,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Group`
--

INSERT INTO `Group` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'Group', '2015-02-22 21:56:12', '2015-02-22 21:56:12', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'Group', '2015-02-22 21:56:12', '2015-02-22 21:56:12', 'Administrators', NULL, 'administrators', 0, 0, NULL, 0),
(3, 'Group', '2015-02-26 23:16:09', '2015-02-26 23:16:09', 'users', NULL, 'users', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Members`
--

CREATE TABLE IF NOT EXISTS `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Group_Members`
--

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Roles`
--

CREATE TABLE IF NOT EXISTS `Group_Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `LearnDocument`
--

CREATE TABLE IF NOT EXISTS `LearnDocument` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LearnDocument') CHARACTER SET utf8 DEFAULT 'LearnDocument',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8,
  `Type` enum('','PDF','Document','Presentation','Video') CHARACTER SET utf8 DEFAULT '',
  `SortField` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `LinkID` int(11) NOT NULL DEFAULT '0',
  `PreviewID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FileID` (`FileID`),
  KEY `LinkID` (`LinkID`),
  KEY `PreviewID` (`PreviewID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `LoginAttempt`
--

CREATE TABLE IF NOT EXISTS `LoginAttempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LoginAttempt') CHARACTER SET utf8 DEFAULT 'LoginAttempt',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Status` enum('Success','Failure') CHARACTER SET utf8 DEFAULT 'Success',
  `IP` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE IF NOT EXISTS `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Member') CHARACTER SET utf8 DEFAULT 'Member',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Surname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `TempIDHash` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `RememberLoginToken` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `AutoLoginHash` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `TimeFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `Phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `IsVerified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `PendingFormData` mediumtext CHARACTER SET utf8,
  `VerificationCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `VerificationExpiry` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Email` (`Email`(255)),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `Created`, `LastEdited`, `FirstName`, `Surname`, `Email`, `TempIDHash`, `TempIDExpired`, `Password`, `RememberLoginToken`, `NumVisit`, `LastVisited`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `DateFormat`, `TimeFormat`, `Phone`, `IsVerified`, `PendingFormData`, `VerificationCode`, `VerificationExpiry`) VALUES
(2, 'Member', '2015-02-22 22:08:28', '2015-03-30 23:55:38', 'Paul', 'Meyrick', 'meyrick@silverstripe.com', '06433bacc555ae2f37203bfd5acabfc28dafa3de', '2015-04-02 23:52:40', '$2y$10$d71b6300f7bcabdb3db05O20fLcxHeCIa8qZ3CXJWGO3ibxe6JOFW', NULL, 4, '2015-03-30 23:54:48', NULL, NULL, 'blowfish', '10$d71b6300f7bcabdb3db05d', NULL, NULL, 'en_US', 0, 'MMM d, y', 'h:mm:ss a', NULL, 1, NULL, NULL, NULL),
(3, 'Member', '2015-02-22 22:10:01', '2015-02-22 22:13:23', 'Ben', 'Manu', 'ben@silverstripe.com', '825ac50fee60f1dcf9003e5a2aef0f03c6ae9604', '2015-02-25 22:11:27', '$2y$10$d7ea4b14f252ba5467c94Oyz2T0yRd4dIviTom5Mnq4pOVajziLyG', NULL, 1, '2015-02-22 22:12:41', NULL, NULL, 'blowfish', '10$d7ea4b14f252ba5467c94b', NULL, NULL, 'en_US', 0, 'MMM d, y', 'h:mm:ss a', NULL, 1, NULL, NULL, NULL),
(4, 'Member', '2015-02-26 19:15:02', '2015-04-14 16:52:44', 'Camden ', 'Howitt', 'camden@sustainablecoastlines.org', 'd361f13e080cc6fb4098ee1a270c14a7ff86f1be', '2015-04-17 16:52:44', '$2y$10$817d0f8c0047f5f571d59uCAcZphdSMvXm1qPKsJW7uO4NQDxvneO', NULL, 6, '2015-04-14 16:52:23', NULL, NULL, 'blowfish', '10$817d0f8c0047f5f571d591', NULL, NULL, 'en_US', 0, 'MMM d, y', 'h:mm:ss a', NULL, 0, NULL, NULL, NULL),
(5, 'Member', '2015-03-05 13:07:59', '2015-03-05 14:29:40', 'Brett', 'Tasker', 'brett@silverstripe.com', '1fb44e84d99bfe066f4b64af9ec663219affb4ed', '2015-03-08 14:08:47', '$2y$10$94ec82c0c9463817a8f37untnYLjQ69HeGCG0Z2AANv4VwmjPaXVO', NULL, 1, '2015-03-05 14:28:56', NULL, NULL, 'blowfish', '10$94ec82c0c9463817a8f371', NULL, NULL, 'en_US', 0, 'MMM d, y', 'h:mm:ss a', NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MemberPassword`
--

CREATE TABLE IF NOT EXISTS `MemberPassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberPassword') CHARACTER SET utf8 DEFAULT 'MemberPassword',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `MemberPassword`
--

INSERT INTO `MemberPassword` (`ID`, `ClassName`, `Created`, `LastEdited`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'MemberPassword', '2015-02-22 22:08:28', '2015-02-22 22:08:28', '$2y$10$d71b6300f7bcabdb3db05O20fLcxHeCIa8qZ3CXJWGO3ibxe6JOFW', '10$d71b6300f7bcabdb3db05d', 'blowfish', 2),
(2, 'MemberPassword', '2015-02-22 22:10:01', '2015-02-22 22:10:01', '$2y$10$d7ea4b14f252ba5467c94Oyz2T0yRd4dIviTom5Mnq4pOVajziLyG', '10$d7ea4b14f252ba5467c94b', 'blowfish', 3),
(3, 'MemberPassword', '2015-02-26 19:15:02', '2015-02-26 19:15:02', '$2y$10$817d0f8c0047f5f571d59uCAcZphdSMvXm1qPKsJW7uO4NQDxvneO', '10$817d0f8c0047f5f571d591', 'blowfish', 4),
(4, 'MemberPassword', '2015-03-05 13:07:59', '2015-03-05 13:07:59', '$2y$10$94ec82c0c9463817a8f37untnYLjQ69HeGCG0Z2AANv4VwmjPaXVO', '10$94ec82c0c9463817a8f371', 'blowfish', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Page`
--

CREATE TABLE IF NOT EXISTS `Page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Subtitle` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `IsTerms` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Summary` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Page`
--

INSERT INTO `Page` (`ID`, `Subtitle`, `IsTerms`, `Summary`) VALUES
(1, NULL, 0, NULL),
(2, 'Love Your Water is a project to help people around', 0, 'Love Your Water is a project to help people around the world look after the waterways we all love. By working together on fun, hands-on projects like tree planting events, we can all be a part of the local solution to a global problem. Here you can learn more about the issue, find events, create your own event and show off your results.'),
(3, NULL, 0, 'After some answers? Our FAQ''s are a great place to start. And our videos and documents are pretty handy too. Still need a hand? Please flick us an email at info@sustainablecoastlines.org and we will get back to you as soon as we can.'),
(4, NULL, 0, NULL),
(5, NULL, 0, NULL),
(6, NULL, 0, NULL),
(7, NULL, 0, NULL),
(8, NULL, 1, 'Terms & Conditions');

-- --------------------------------------------------------

--
-- Table structure for table `Page_Live`
--

CREATE TABLE IF NOT EXISTS `Page_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Subtitle` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `IsTerms` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Summary` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Page_Live`
--

INSERT INTO `Page_Live` (`ID`, `Subtitle`, `IsTerms`, `Summary`) VALUES
(1, NULL, 0, NULL),
(2, 'Love Your Water is a project to help people around', 0, 'Love Your Water is a project to help people around the world look after the waterways we all love. By working together on fun, hands-on projects like tree planting events, we can all be a part of the local solution to a global problem. Here you can learn more about the issue, find events, create your own event and show off your results.'),
(3, NULL, 0, 'After some answers? Our FAQ''s are a great place to start. And our videos and documents are pretty handy too. Still need a hand? Please flick us an email at info@sustainablecoastlines.org and we will get back to you as soon as we can.'),
(4, NULL, 0, NULL),
(5, NULL, 0, NULL),
(6, NULL, 0, NULL),
(7, NULL, 0, NULL),
(8, NULL, 1, 'Terms & Conditions');

-- --------------------------------------------------------

--
-- Table structure for table `Page_versions`
--

CREATE TABLE IF NOT EXISTS `Page_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Subtitle` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `IsTerms` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Summary` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `Page_versions`
--

INSERT INTO `Page_versions` (`ID`, `RecordID`, `Version`, `Subtitle`, `IsTerms`, `Summary`) VALUES
(1, 1, 1, NULL, 0, NULL),
(2, 2, 1, NULL, 0, NULL),
(3, 3, 1, NULL, 0, NULL),
(4, 4, 1, NULL, 0, NULL),
(5, 5, 1, NULL, 0, NULL),
(6, 1, 2, NULL, 0, NULL),
(7, 6, 1, NULL, 0, NULL),
(8, 6, 2, NULL, 0, NULL),
(9, 7, 1, NULL, 0, NULL),
(10, 7, 2, NULL, 0, NULL),
(11, 2, 2, NULL, 0, NULL),
(12, 2, 3, NULL, 0, NULL),
(13, 3, 2, NULL, 0, NULL),
(14, 2, 4, NULL, 0, NULL),
(15, 3, 3, NULL, 0, NULL),
(16, 2, 5, NULL, 0, NULL),
(17, 7, 3, NULL, 0, NULL),
(18, 6, 3, NULL, 0, NULL),
(19, 7, 4, NULL, 0, 'Tree planting events, presentations and workshops are great ways to learn about the issue and be part of the solution. Use this page to find events and arrange talks from trained Love your Water presenters. Nothing on? Create your own event here'),
(20, 7, 5, NULL, 0, NULL),
(21, 6, 4, NULL, 0, NULL),
(22, 7, 6, NULL, 0, NULL),
(23, 2, 6, NULL, 0, NULL),
(24, 2, 7, NULL, 0, 'Love Your Water is a project to help people around the world look after the waterways we all love. By working together on fun, hands-on projects like tree planting events, we can all be a part of the local solution to a global problem. Here you can learn more about the issue, find events, create your own event and show off your results.'),
(25, 2, 8, 'Love Your Water is a project to help people around', 0, 'Love Your Water is a project to help people around the world look after the waterways we all love. By working together on fun, hands-on projects like tree planting events, we can all be a part of the local solution to a global problem. Here you can learn more about the issue, find events, create your own event and show off your results.'),
(26, 2, 9, 'Love Your Water is a project to help people around', 0, 'Love Your Water is a project to help people around the world look after the waterways we all love. By working together on fun, hands-on projects like tree planting events, we can all be a part of the local solution to a global problem. Here you can learn more about the issue, find events, create your own event and show off your results.'),
(27, 2, 10, 'Love Your Water is a project to help people around', 0, 'Love Your Water is a project to help people around the world look after the waterways we all love. By working together on fun, hands-on projects like tree planting events, we can all be a part of the local solution to a global problem. Here you can learn more about the issue, find events, create your own event and show off your results.'),
(28, 3, 4, NULL, 0, 'After some answers? Our FAQ''s are a great place to start. And our videos and documents are pretty handy too. Still need a hand? Please flick us an email at info@sustainablecoastlines.org and we will get back to you as soon as we can.'),
(29, 8, 1, NULL, 0, NULL),
(30, 8, 2, NULL, 0, 'Terms & Conditions'),
(31, 8, 3, NULL, 1, 'Terms & Conditions'),
(32, 8, 4, NULL, 1, 'Terms & Conditions'),
(33, 8, 5, NULL, 1, 'Terms & Conditions');

-- --------------------------------------------------------

--
-- Table structure for table `Permission`
--

CREATE TABLE IF NOT EXISTS `Permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Permission') CHARACTER SET utf8 DEFAULT 'Permission',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Permission`
--

INSERT INTO `Permission` (`ID`, `ClassName`, `Created`, `LastEdited`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'Permission', '2015-02-22 21:56:12', '2015-02-22 21:56:12', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'Permission', '2015-02-22 21:56:12', '2015-02-22 21:56:12', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'Permission', '2015-02-22 21:56:12', '2015-02-22 21:56:12', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(4, 'Permission', '2015-02-22 21:56:12', '2015-02-22 21:56:12', 'SITETREE_REORGANISE', 0, 1, 1),
(5, 'Permission', '2015-02-22 21:56:12', '2015-02-22 21:56:12', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRole`
--

CREATE TABLE IF NOT EXISTS `PermissionRole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRole') CHARACTER SET utf8 DEFAULT 'PermissionRole',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRoleCode`
--

CREATE TABLE IF NOT EXISTS `PermissionRoleCode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRoleCode') CHARACTER SET utf8 DEFAULT 'PermissionRoleCode',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Live`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_versions`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RegistrationPage`
--

CREATE TABLE IF NOT EXISTS `RegistrationPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SuccessMessage` mediumtext CHARACTER SET utf8,
  `ConfirmedMessage` mediumtext CHARACTER SET utf8,
  `VerifiedMessage` mediumtext CHARACTER SET utf8,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `TermsAndConditionsID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `TermsAndConditionsID` (`TermsAndConditionsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RegistrationPage_Live`
--

CREATE TABLE IF NOT EXISTS `RegistrationPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SuccessMessage` mediumtext CHARACTER SET utf8,
  `ConfirmedMessage` mediumtext CHARACTER SET utf8,
  `VerifiedMessage` mediumtext CHARACTER SET utf8,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `TermsAndConditionsID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `TermsAndConditionsID` (`TermsAndConditionsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RegistrationPage_versions`
--

CREATE TABLE IF NOT EXISTS `RegistrationPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `SuccessMessage` mediumtext CHARACTER SET utf8,
  `ConfirmedMessage` mediumtext CHARACTER SET utf8,
  `VerifiedMessage` mediumtext CHARACTER SET utf8,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `TermsAndConditionsID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `GroupID` (`GroupID`),
  KEY `TermsAndConditionsID` (`TermsAndConditionsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig`
--

CREATE TABLE IF NOT EXISTS `SiteConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteConfig') CHARACTER SET utf8 DEFAULT 'SiteConfig',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Tagline` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Theme` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  `GACode` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SiteConfig`
--

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Tagline`, `Theme`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`, `GACode`) VALUES
(1, 'SiteConfig', '2015-02-22 21:56:12', '2015-02-26 23:18:51', 'Love Your Water', 'Love Your Water', NULL, 'Anyone', 'LoggedInUsers', 'LoggedInUsers', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_EditorGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree`
--

CREATE TABLE IF NOT EXISTS `SiteTree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','CalendarPage','EventPage','ErrorPage','RedirectorPage','VirtualPage','EventCreatePage','HomePage','LearnPage','RegistrationPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `SiteTree`
--

INSERT INTO `SiteTree` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'HomePage', '2015-02-22 21:56:12', '2015-02-22 22:12:18', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 2, 0),
(2, 'Page', '2015-02-22 21:56:12', '2015-03-30 15:32:47', 'about', 'About this project', 'About', NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 10, 0),
(3, 'Page', '2015-02-22 21:56:12', '2015-03-30 15:41:07', 'contact', 'Contact', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 4, 0),
(4, 'ErrorPage', '2015-02-22 21:56:13', '2015-02-22 21:56:13', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(5, 'ErrorPage', '2015-02-22 21:56:13', '2015-02-22 21:56:13', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(6, 'EventCreatePage', '2015-02-26 23:16:09', '2015-03-30 15:20:13', 'create', 'Create your own event', 'Create', '<p><span id="docs-internal-guid-17da4210-6cc5-0114-03ce-e44790818e00"><span>Events are a great way to involve your friends, family and community in solutions. Use this page to enter your event details. You’ll get your own page on this website to help promote your event.</span></span></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'OnlyTheseUsers', 'Inherit', 4, 0),
(7, 'CalendarPage', '2015-02-26 23:18:04', '2015-03-30 15:20:44', 'find', 'Find events and people', 'Find', '<p>Tree planting events, presentations and workshops are great ways to learn about the issue and be part of the solution. Use this page to find events and arrange talks from trained Love your Water presenters. Nothing on? <a href="[sitetree_link,id=6]">Create your own event here.</a></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6, 0),
(8, 'Page', '2015-03-30 23:53:10', '2015-03-30 23:54:44', 'terms-and-conditions', 'Terms & Conditions', NULL, '<p>Hey Cam. Put some terms and conditions here</p>', NULL, NULL, 0, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_EditorGroups`
--

CREATE TABLE IF NOT EXISTS `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ImageTracking`
--

CREATE TABLE IF NOT EXISTS `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_LinkTracking`
--

CREATE TABLE IF NOT EXISTS `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `SiteTree_LinkTracking`
--

INSERT INTO `SiteTree_LinkTracking` (`ID`, `SiteTreeID`, `ChildID`, `FieldName`) VALUES
(8, 7, 6, 'Content');

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Live`
--

CREATE TABLE IF NOT EXISTS `SiteTree_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','CalendarPage','EventPage','ErrorPage','RedirectorPage','VirtualPage','EventCreatePage','HomePage','LearnPage','RegistrationPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'HomePage', '2015-02-22 21:56:12', '2015-02-22 22:12:18', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 2, 0),
(2, 'Page', '2015-02-22 21:56:12', '2015-03-30 15:32:48', 'about', 'About this project', 'About', NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 10, 0),
(3, 'Page', '2015-02-22 21:56:12', '2015-03-30 15:41:07', 'contact', 'Contact', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 4, 0),
(4, 'ErrorPage', '2015-02-22 21:56:13', '2015-02-22 21:56:13', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(5, 'ErrorPage', '2015-02-22 21:56:13', '2015-02-22 21:56:13', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(6, 'EventCreatePage', '2015-02-26 23:16:09', '2015-03-30 15:20:13', 'create', 'Create your own event', 'Create', '<p><span id="docs-internal-guid-17da4210-6cc5-0114-03ce-e44790818e00"><span>Events are a great way to involve your friends, family and community in solutions. Use this page to enter your event details. You’ll get your own page on this website to help promote your event.</span></span></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'OnlyTheseUsers', 'Inherit', 4, 0),
(7, 'CalendarPage', '2015-02-26 23:18:04', '2015-03-30 15:20:44', 'find', 'Find events and people', 'Find', '<p>Tree planting events, presentations and workshops are great ways to learn about the issue and be part of the solution. Use this page to find events and arrange talks from trained Love your Water presenters. Nothing on? <a href="[sitetree_link,id=6]">Create your own event here.</a></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6, 0),
(8, 'Page', '2015-03-30 23:53:10', '2015-03-30 23:54:44', 'terms-and-conditions', 'Terms & Conditions', NULL, '<p>Hey Cam. Put some terms and conditions here</p>', NULL, NULL, 0, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_versions`
--

CREATE TABLE IF NOT EXISTS `SiteTree_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','CalendarPage','EventPage','ErrorPage','RedirectorPage','VirtualPage','EventCreatePage','HomePage','LearnPage','RegistrationPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `SiteTree_versions`
--

INSERT INTO `SiteTree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `ParentID`) VALUES
(1, 1, 1, 1, 0, 0, 'Page', '2015-02-22 21:56:12', '2015-02-22 21:56:12', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(2, 2, 1, 1, 0, 0, 'Page', '2015-02-22 21:56:12', '2015-02-22 21:56:12', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(3, 3, 1, 1, 0, 0, 'Page', '2015-02-22 21:56:12', '2015-02-22 21:56:12', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(4, 4, 1, 1, 0, 0, 'ErrorPage', '2015-02-22 21:56:13', '2015-02-22 21:56:13', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(5, 5, 1, 1, 0, 0, 'ErrorPage', '2015-02-22 21:56:13', '2015-02-22 21:56:13', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(6, 1, 2, 1, 3, 3, 'HomePage', '2015-02-22 21:56:12', '2015-02-22 22:12:18', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(7, 6, 1, 0, 4, 0, 'EventCreatePage', '2015-02-26 23:16:09', '2015-02-26 23:16:09', 'new-event-create-page', 'New Event Create Page', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(8, 6, 2, 1, 4, 4, 'EventCreatePage', '2015-02-26 23:16:09', '2015-02-26 23:16:32', 'create', 'Create', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'OnlyTheseUsers', 'Inherit', 0),
(9, 7, 1, 0, 4, 0, 'CalendarPage', '2015-02-26 23:18:04', '2015-02-26 23:18:04', 'new-calendar-page', 'New Calendar Page', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(10, 7, 2, 1, 4, 4, 'CalendarPage', '2015-02-26 23:18:04', '2015-02-26 23:18:12', 'find', 'Find', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(11, 2, 2, 1, 4, 4, 'Page', '2015-02-22 21:56:12', '2015-03-17 11:45:55', 'about-us', 'About', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(12, 2, 3, 1, 4, 4, 'Page', '2015-02-22 21:56:12', '2015-03-17 11:46:10', 'about', 'About', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(13, 3, 2, 1, 4, 4, 'Page', '2015-02-22 21:56:12', '2015-03-17 11:46:25', 'contact', 'Contact', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(14, 2, 4, 0, 4, 0, 'Page', '2015-02-22 21:56:12', '2015-03-17 11:47:04', 'about', 'About', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(15, 3, 3, 0, 4, 0, 'Page', '2015-02-22 21:56:12', '2015-03-17 11:47:12', 'contact', 'Contact', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(16, 2, 5, 0, 4, 0, 'Page', '2015-02-22 21:56:12', '2015-03-17 11:47:14', 'about', 'About', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(17, 7, 3, 0, 4, 0, 'CalendarPage', '2015-02-26 23:18:04', '2015-03-17 11:47:19', 'find', 'Find', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(18, 6, 3, 0, 4, 0, 'EventCreatePage', '2015-02-26 23:16:09', '2015-03-17 11:47:22', 'create', 'Create', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'OnlyTheseUsers', 'Inherit', 0),
(19, 7, 4, 1, 4, 4, 'CalendarPage', '2015-02-26 23:18:04', '2015-03-30 15:14:48', 'find', 'Find events', 'Find', NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(20, 7, 5, 1, 4, 4, 'CalendarPage', '2015-02-26 23:18:04', '2015-03-30 15:15:22', 'find', 'Find events', 'Find', '<p>Tree planting events, presentations and workshops are great ways to learn about the issue and be part of the solution. Use this page to find events and arrange talks from trained Love your Water presenters. Nothing on? <a href="[sitetree_link,id=6]">Create your own event here.</a></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(21, 6, 4, 1, 4, 4, 'EventCreatePage', '2015-02-26 23:16:09', '2015-03-30 15:20:13', 'create', 'Create your own event', 'Create', '<p><span id="docs-internal-guid-17da4210-6cc5-0114-03ce-e44790818e00"><span>Events are a great way to involve your friends, family and community in solutions. Use this page to enter your event details. You’ll get your own page on this website to help promote your event.</span></span></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'OnlyTheseUsers', 'Inherit', 0),
(22, 7, 6, 1, 4, 4, 'CalendarPage', '2015-02-26 23:18:04', '2015-03-30 15:20:44', 'find', 'Find events and people', 'Find', '<p>Tree planting events, presentations and workshops are great ways to learn about the issue and be part of the solution. Use this page to find events and arrange talks from trained Love your Water presenters. Nothing on? <a href="[sitetree_link,id=6]">Create your own event here.</a></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(23, 2, 6, 1, 4, 4, 'Page', '2015-02-22 21:56:12', '2015-03-30 15:25:17', 'about', 'About Love Your Water', 'About', '<p><span id="docs-internal-guid-17da4210-6cc9-8a64-9604-6fc43ec77d0b"><span>Love Your Water is a project to help people around the world look after the waterways we all love. By working together on fun, hands-on projects like tree planting events, we can all be a part of the local solution to a global problem. Here you can </span><span>learn</span><span> more about the issue, </span><span>find</span><span> events, </span><span>create</span><span> your own event and show off your results.</span></span></p>', NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(24, 2, 7, 1, 4, 4, 'Page', '2015-02-22 21:56:12', '2015-03-30 15:25:58', 'about', 'About Love Your Water', 'About', '<p><span id="docs-internal-guid-17da4210-6cc9-8a64-9604-6fc43ec77d0b"><span>Love Your Water is a project to help people around the world look after the waterways we all love. By working together on fun, hands-on projects like tree planting events, we can all be a part of the local solution to a global problem. Here you can </span><span>learn</span><span> more about the issue, </span><span>find</span><span> events, </span><span>create</span><span> your own event and show off your results.</span></span></p>', NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(25, 2, 8, 1, 4, 4, 'Page', '2015-02-22 21:56:12', '2015-03-30 15:26:08', 'about', 'About Love Your Water', 'About', '<p><span id="docs-internal-guid-17da4210-6cc9-8a64-9604-6fc43ec77d0b"><span>Love Your Water is a project to help people around the world look after the waterways we all love. By working together on fun, hands-on projects like tree planting events, we can all be a part of the local solution to a global problem. Here you can </span><span>learn</span><span> more about the issue, </span><span>find</span><span> events, </span><span>create</span><span> your own event and show off your results.</span></span></p>', NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(26, 2, 9, 1, 4, 4, 'Page', '2015-02-22 21:56:12', '2015-03-30 15:26:29', 'about', 'About Love Your Water', 'About', NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(27, 2, 10, 1, 4, 4, 'Page', '2015-02-22 21:56:12', '2015-03-30 15:32:47', 'about', 'About this project', 'About', NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(28, 3, 4, 1, 4, 4, 'Page', '2015-02-22 21:56:12', '2015-03-30 15:40:54', 'contact', 'Contact', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(29, 8, 1, 0, 2, 0, 'Page', '2015-03-30 23:53:10', '2015-03-30 23:53:10', 'new-page', 'New Page', NULL, NULL, NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(30, 8, 2, 1, 2, 2, 'Page', '2015-03-30 23:53:10', '2015-03-30 23:53:55', 'terms-and-conditions', 'Terms & Conditions', NULL, '<p>Put some terms and conditions here</p>', NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(31, 8, 3, 1, 2, 2, 'Page', '2015-03-30 23:53:10', '2015-03-30 23:54:02', 'terms-and-conditions', 'Terms & Conditions', NULL, '<p>Put some terms and conditions here</p>', NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(32, 8, 4, 1, 2, 2, 'Page', '2015-03-30 23:53:10', '2015-03-30 23:54:12', 'terms-and-conditions', 'Terms & Conditions', NULL, '<p>Put some terms and conditions here</p>', NULL, NULL, 0, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(33, 8, 5, 1, 2, 2, 'Page', '2015-03-30 23:53:10', '2015-03-30 23:54:41', 'terms-and-conditions', 'Terms & Conditions', NULL, '<p>Hey Cam. Put some terms and conditions here</p>', NULL, NULL, 0, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ViewerGroups`
--

CREATE TABLE IF NOT EXISTS `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SiteTree_ViewerGroups`
--

INSERT INTO `SiteTree_ViewerGroups` (`ID`, `SiteTreeID`, `GroupID`) VALUES
(1, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage`
--

CREATE TABLE IF NOT EXISTS `VirtualPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Live`
--

CREATE TABLE IF NOT EXISTS `VirtualPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_versions`
--

CREATE TABLE IF NOT EXISTS `VirtualPage_versions` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
