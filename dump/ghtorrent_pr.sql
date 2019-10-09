-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: 200.134.18.85    Database: ghtorrent
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

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
-- Table structure for table `pr`
--

DROP TABLE IF EXISTS `pr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `type_user` varchar(40) DEFAULT NULL,
  `site_admin` varchar(20) DEFAULT NULL,
  `nome_projeto` varchar(80) DEFAULT NULL,
  `owner` varchar(70) DEFAULT NULL,
  `id_git` int(15) DEFAULT NULL,
  `number_pr` varchar(15) DEFAULT NULL,
  `title` varchar(350) DEFAULT NULL,
  `merge` char(9) DEFAULT NULL,
  `dt_criado` datetime DEFAULT NULL,
  `dt_fechado` datetime DEFAULT NULL,
  `linguagem` varchar(60) DEFAULT NULL,
  `comments_qtde` int(11) DEFAULT NULL,
  `review_comments` int(11) DEFAULT NULL,
  `commits` int(11) DEFAULT NULL,
  `additions` int(11) DEFAULT NULL,
  `deletions` int(11) DEFAULT NULL,
  `changed_files` int(11) DEFAULT NULL,
  `author_association` varchar(50) DEFAULT NULL,
  `qtde_merge` int(11) DEFAULT NULL,
  `qtde_comentario` int(3) DEFAULT NULL,
  `qtde_commit` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `nome_projeto` (`nome_projeto`),
  KEY `i_linguagem` (`linguagem`),
  KEY `idx_pr_number_pr` (`number_pr`),
  KEY `idx_pr_user` (`user`),
  KEY `idx_pr_nome_projeto` (`nome_projeto`),
  FULLTEXT KEY `idx_pr_owner` (`owner`)
) ENGINE=MyISAM AUTO_INCREMENT=1111561948 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-08 10:41:55
