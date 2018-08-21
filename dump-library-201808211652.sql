-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(20) NOT NULL,
  `bauthor` varchar(20) NOT NULL,
  `bpublisher` varchar(25) NOT NULL,
  `bprices` int(11) NOT NULL,
  `bpicture` varchar(15) DEFAULT NULL,
  `bnice` varchar(5) DEFAULT NULL,
  `bcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (3,'白鹿原','陈忠实','作家出版社',22,'book3.jpg','no',25),(4,'没有凶手的暗夜','东野圭吾','人民文学出版社',28,'book4.jpg','yes',44),(5,'无人生还','阿加莎.克里斯蒂','新星出版社',25,'book5.jpg','yes',22),(6,'白夜行','东野圭吾','南海出版公司',28,'book6.jpg','yes',85),(18,'孤独是种大自在','林某','北京大学出版社',30,'book1.jpg','yes',20),(19,'我们的经典','梁启超','化学工业出版社',50,'book2.jpg','no',10),(20,'四书五经','孔子','春秋出版社',80,'book3.jpg','yes',23),(22,'人生古迹','某某某','嘻嘻出版社',10,'book7.jpg','no',3),(23,'測試啊','我自己','沒有出版社',10,'book6.jpg','yes',30);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(45) DEFAULT NULL,
  `cprice` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `cpicture` varchar(20) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `uid_idx` (`uid`),
  KEY `car_books_fk` (`bid`),
  CONSTRAINT `car_books_fk` FOREIGN KEY (`bid`) REFERENCES `books` (`bid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `ordernum` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `bname` varchar(50) DEFAULT NULL,
  `bnum` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `lend` varchar(20) DEFAULT NULL,
  `returns` varchar(20) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ordernum`),
  KEY `order_users_fk` (`uid`),
  KEY `order_books_fk` (`bid`),
  CONSTRAINT `order_books_fk` FOREIGN KEY (`bid`) REFERENCES `books` (`bid`),
  CONSTRAINT `order_users_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,36,'zs','无人生还',1,'已还书','2018-08-07 ','2018-11-05 ',5),(2,36,'zs','无人生还',1,'已还书','2018-08-07 ','2018-11-05 ',5),(3,36,'zs','无人生还',1,'已还书','2018-08-08 ','2018-11-06 ',5),(4,36,'zs','无人生还',1,'已还书','2018-08-08 ','2018-11-06 ',5),(5,36,'zs','无人生还',4,'已还书','2018-08-09 ','2018-11-07 ',5),(6,36,'zs','白夜行',1,'已借','2018-08-09 ','2018-11-07 ',6),(7,37,'admin','无人生还',1,'已借','2018-08-09 ','2018-11-07 ',5),(8,36,'zs','四书五经',1,'已借','2018-08-10 ','2018-11-08 ',20);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `userPwd` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `tel` char(11) CHARACTER SET utf8 NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 NOT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `idcard` char(18) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (36,'zs',NULL,'05625551112','aa大时代','男','140222199805030314'),(37,'admin','123','15625551112','广科','男','440222199805030314'),(39,'asd',NULL,'15625551112','111广东科技学院','男','440222199805030314'),(41,'wws',NULL,'11111111111','aaa单','女','440222199805030314'),(42,'qwe','','15625551112','是啊eec','男','440222199805030314'),(43,'as1','s','11112222111','dddddddddddd','女','440222199805030314');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'library'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-21 16:52:13
