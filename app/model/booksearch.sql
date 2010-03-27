-- MySQL dump 10.13  Distrib 5.1.37, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: booksearch
-- ------------------------------------------------------
-- Server version	5.1.37-1ubuntu5.1

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `about` text NOT NULL,
  `speciality` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` int(11) NOT NULL,
  `title` text NOT NULL,
  `price` varchar(8) NOT NULL,
  `author` int(11) NOT NULL,
  `author2` int(11) NOT NULL,
  `author3` int(11) NOT NULL,
  `about` text NOT NULL,
  `isbn13` varchar(16) NOT NULL,
  `binding` varchar(16) NOT NULL,
  `publish` int(11) NOT NULL,
  `publisher` varchar(64) NOT NULL,
  `pages` int(11) NOT NULL,
  `language` varchar(32) NOT NULL,
  `image` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` text NOT NULL,
  `timestamp` int(11) NOT NULL,
  `site` varchar(256) NOT NULL,
  `page` varchar(512) NOT NULL,
  `rank` int(11) NOT NULL,
  `book` int(11) NOT NULL,
  `availability` varchar(32) NOT NULL,
  `deliverytime` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` text NOT NULL,
  `timestamp` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `ip` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traffic`
--

DROP TABLE IF EXISTS `traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traffic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(128) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `referer` varchar(512) NOT NULL,
  `useragent` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traffic`
--

LOCK TABLES `traffic` WRITE;
/*!40000 ALTER TABLE `traffic` DISABLE KEYS */;
INSERT INTO `traffic` VALUES (1,'/BookSearch/home',1269680794,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1030 Safari/532.5'),(2,'/BookSearch/home?bookname=test&bookisbn=',1269680809,'10.0.2.2','http://localhost:8080/BookSearch/home','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1030 Safari/532.5'),(3,'/BookSearch/home?bookname=test&bookisbn=',1269680866,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1030 Safari/532.5'),(4,'/BookSearch/home',1269680874,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1030 Safari/532.5'),(5,'/BookSearch/home?bookname=asdfasd&bookisbn=',1269680971,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1030 Safari/532.5'),(6,'/BookSearch/home?bookname=asdfasd&bookisbn=',1269681946,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1030 Safari/532.5'),(7,'/BookSearch/home?bookname=&bookisbn=',1269681949,'10.0.2.2','http://localhost:8080/BookSearch/home?bookname=asdfasd&bookisbn=','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1030 Safari/532.5'),(8,'/BookSearch/home?bookname=&bookisbn=',1269681954,'10.0.2.2','http://localhost:8080/BookSearch/home?bookname=&bookisbn=','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1030 Safari/532.5'),(9,'/BookSearch/home?bookname=asf&bookisbn=',1269681992,'10.0.2.2','http://localhost:8080/BookSearch/home?bookname=&bookisbn=','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1030 Safari/532.5'),(10,'/BookSearch/home',1269682015,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(11,'/BookSearch/home',1269682087,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(12,'/BookSearch/home',1269682127,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(13,'/BookSearch/home',1269682132,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(14,'/BookSearch/home',1269682169,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(15,'/BookSearch/home',1269682190,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(16,'/BookSearch/home',1269682295,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(17,'/BookSearch/home',1269682370,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(18,'/BookSearch/home',1269682405,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(19,'/BookSearch/home',1269682451,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(20,'/BookSearch/home',1269682454,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(21,'/BookSearch/home',1269682478,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(22,'/BookSearch/home?bookname=asdfasd&submit=Search',1269682488,'10.0.2.2','http://localhost:8080/BookSearch/home','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(23,'/BookSearch/home?bookname=&submit=Search',1269682489,'10.0.2.2','http://localhost:8080/BookSearch/home?bookname=asdfasd&submit=Search','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(24,'/BookSearch/home?bookname=&submit=Search',1269682490,'10.0.2.2','http://localhost:8080/BookSearch/home?bookname=asdfasd&submit=Search','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(25,'/BookSearch/home?bookname=&submit=Search',1269682492,'10.0.2.2','http://localhost:8080/BookSearch/home?bookname=&submit=Search','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(26,'/BookSearch/home?bookname=&submit=Search',1269682514,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(27,'/BookSearch/home?bookname=&submit=Find+It',1269682517,'10.0.2.2','http://localhost:8080/BookSearch/home?bookname=&submit=Search','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(28,'/BookSearch/home?bookname=&submit=Find+It',1269682536,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(29,'/BookSearch/home?bookname=&submit=Find+It',1269682555,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(30,'/BookSearch/home?bookname=&submit=Find+It',1269682568,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(31,'/BookSearch/home?bookname=&submit=Find+It',1269682587,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(32,'/BookSearch/home',1269682593,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(33,'/BookSearch/home',1269682615,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(34,'/BookSearch/home',1269682625,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(35,'/BookSearch/home',1269682630,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(36,'/BookSearch/home',1269682751,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(37,'/BookSearch/home?bookname=asdfas&submit=Search',1269682838,'10.0.2.2','http://localhost:8080/BookSearch/home','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(38,'/BookSearch/home',1269682880,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(39,'/BookSearch/home?book=asdfa&action=Search',1269682882,'10.0.2.2','http://localhost:8080/BookSearch/home','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(40,'/BookSearch/search',1269683361,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(41,'/BookSearch/search',1269683367,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(42,'/BookSearch/search',1269683381,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(43,'/BookSearch/search?book=asdf&action=Search',1269683383,'10.0.2.2','http://localhost:8080/BookSearch/search','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(44,'/BookSearch/search',1269683465,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(45,'/BookSearch/search',1269683805,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(46,'/BookSearch/search?book=asdf&action=Search',1269683810,'10.0.2.2','http://localhost:8080/BookSearch/search','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(47,'/BookSearch/search',1269683824,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(48,'/BookSearch/search',1269683825,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(49,'/BookSearch/search?book=asdd&action=Search',1269683829,'10.0.2.2','http://localhost:8080/BookSearch/search','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(50,'/BookSearch/search?book=asdfdf&action=Search',1269683899,'10.0.2.2','http://localhost:8080/BookSearch/search?book=asdd&action=Search','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(51,'/BookSearch/search?book=asdfdf&action=Search',1269683973,'10.0.2.2','http://localhost:8080/BookSearch/search?book=asdd&action=Search','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(52,'/BookSearch/search',1269684086,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(53,'/BookSearch/search?book=asdfasdf',1269684093,'10.0.2.2','http://localhost:8080/BookSearch/search?book=asdfdf&action=Search','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(54,'/BookSearch/search',1269684101,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(55,'/BookSearch/search',1269684113,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(56,'/BookSearch/search',1269684120,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(57,'/BookSearch/search',1269684203,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6'),(58,'/BookSearch/search/',1269684569,'10.0.2.2','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6');
/*!40000 ALTER TABLE `traffic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-03-27 19:21:30