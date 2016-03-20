-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema datadb
--

CREATE DATABASE IF NOT EXISTS datadb;
USE datadb;

--
-- Definition of table `agentrequest`
--

DROP TABLE IF EXISTS `agentrequest`;
CREATE TABLE `agentrequest` (
  `idAgentRequest` int(10) unsigned NOT NULL auto_increment,
  `description` varchar(45) NOT NULL,
  `ditributorid` int(10) unsigned NOT NULL,
  `udate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `sentFromIp` varchar(45) NOT NULL,
  `agentId` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL default '-1',
  PRIMARY KEY  (`idAgentRequest`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agentrequest`
--

/*!40000 ALTER TABLE `agentrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `agentrequest` ENABLE KEYS */;


--
-- Definition of table `backupinfo`
--

DROP TABLE IF EXISTS `backupinfo`;
CREATE TABLE `backupinfo` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Sender` int(10) unsigned NOT NULL,
  `FolderPath` varchar(255) default NULL,
  `TotalSize` varchar(10) default NULL,
  `Receiver` int(10) unsigned default NULL,
  `SaveTimestamp` datetime default NULL,
  `encryptionKey` varchar(100) NOT NULL,
  `originalPath` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  USING BTREE (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `backupinfo`
--

/*!40000 ALTER TABLE `backupinfo` DISABLE KEYS */;
INSERT INTO `backupinfo` (`ID`,`Sender`,`FolderPath`,`TotalSize`,`Receiver`,`SaveTimestamp`,`encryptionKey`,`originalPath`,`description`) VALUES 
 (101,143,'/1334398763098/Q1.dmp','6320',147,'2012-04-14 15:49:23','DDDAB61613B70AF79BE0B459FA9F388C','Q1.txt','quarter 1 data pune');
/*!40000 ALTER TABLE `backupinfo` ENABLE KEYS */;


--
-- Definition of table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `rollId` int(10) unsigned NOT NULL auto_increment,
  `rollDesc` varchar(255) NOT NULL,
  PRIMARY KEY  (`rollId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`rollId`,`rollDesc`) VALUES 
 (1,'Distributor'),
 (2,'Agent'),
 (3,'Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Definition of table `senderreceiver`
--

DROP TABLE IF EXISTS `senderreceiver`;
CREATE TABLE `senderreceiver` (
  `Sender` int(10) unsigned NOT NULL,
  `Receiver` int(10) unsigned NOT NULL,
  `ARFlag` tinyint(3) unsigned default NULL,
  `RequestTimestamp` datetime NOT NULL,
  `ARTimestamp` datetime default NULL,
  `LogID` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`LogID`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `senderreceiver`
--

/*!40000 ALTER TABLE `senderreceiver` DISABLE KEYS */;
/*!40000 ALTER TABLE `senderreceiver` ENABLE KEYS */;


--
-- Definition of table `trackdownloads`
--

DROP TABLE IF EXISTS `trackdownloads`;
CREATE TABLE `trackdownloads` (
  `idtrackdownloads` int(10) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL,
  `fileid` int(10) unsigned NOT NULL,
  `ipaddress` varchar(45) NOT NULL,
  `downloadtimestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`idtrackdownloads`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trackdownloads`
--

/*!40000 ALTER TABLE `trackdownloads` DISABLE KEYS */;
INSERT INTO `trackdownloads` (`idtrackdownloads`,`userid`,`fileid`,`ipaddress`,`downloadtimestamp`) VALUES 
 (5,147,101,'00-21-6B-06-16-80','2012-04-14 15:54:45');
/*!40000 ALTER TABLE `trackdownloads` ENABLE KEYS */;


--
-- Definition of table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `LoginId` varchar(35) NOT NULL,
  `UserPassword` varchar(255) NOT NULL,
  `UserId` int(10) unsigned NOT NULL auto_increment,
  `FName` varchar(35) NOT NULL,
  `LName` varchar(35) NOT NULL,
  `IPAddress` varchar(30) NOT NULL,
  `CellNumber` varchar(15) NOT NULL,
  `EmailAddress` varchar(45) NOT NULL,
  `ActiveFlag` tinyint(1) NOT NULL default '2',
  `LogStatus` varchar(45) NOT NULL default '0',
  `LogOnTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LogOffTime` timestamp NOT NULL default '0000-00-00 00:00:00',
  `rollId` int(10) unsigned default '1',
  `city` varchar(45) default NULL,
  `pincode` varchar(45) default NULL,
  `changepassword` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `userinfo`
--

/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` (`LoginId`,`UserPassword`,`UserId`,`FName`,`LName`,`IPAddress`,`CellNumber`,`EmailAddress`,`ActiveFlag`,`LogStatus`,`LogOnTime`,`LogOffTime`,`rollId`,`city`,`pincode`,`changepassword`) VALUES 
 ('rajesh','9FECE5B695F97680C68F1FA6CA3502CD',143,'rajesh','agrawal','00-21-6B-06-16-80','9860923474','mail.rajesh.agrawal@gmail.com',1,'Online','2012-04-14 15:56:37','2012-02-13 09:59:47',3,'Akola',NULL,'2012-04-14 03:24:59'),
 ('kaustubh','4B81685BA11CF4E5023A0DE569A86966',144,'Kaustubh','bojewar','192.168.0.109','9096356472','kaustubh.bojewar@gmail.com',2,'Online','2012-04-14 17:25:22','2012-02-13 17:14:15',2,'Aurangabad',NULL,'0000-00-00 00:00:00'),
 ('raj','9FECE5B695F97680C68F1FA6CA3502CD',145,'Raj1','Agrawal1','192.168.0.109','9860923474','mail.rajesh.agrawal@gmail.com',1,'Online','2012-04-14 15:26:38','2012-02-13 17:14:15',1,'Pune','431103','2012-04-14 15:26:38'),
 ('agent','E5BEEAB8B8A4451E319335F30EC23146',146,'agent','agent','90-E6-BA-BA-38-9B','9860923474','prajeshshah1990@gmail.com',2,'Online','2012-04-14 16:40:04','2012-04-14 00:51:59',2,'pune','431021','2012-04-14 03:31:55'),
 ('agent2','B34FD244C89C0AD59E6E42A455E57254',147,'agent2','agent2','00-21-6B-06-16-80','9860923474','pranitasalla@gmail.com',2,'Online','2012-04-14 16:44:07','2012-04-14 00:52:31',2,'pune','431032','2012-04-14 15:22:30');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
