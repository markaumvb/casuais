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
-- Table structure for table `arquivos_commits`
--

DROP TABLE IF EXISTS `arquivos_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arquivos_commits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projeto_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `number_pr` varchar(15) DEFAULT NULL,
  `sha_principal` varchar(45) DEFAULT NULL,
  `sha_arquivo` varchar(45) DEFAULT NULL,
  `arquivo` varchar(300) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `additions` int(11) DEFAULT NULL,
  `deletions` int(11) DEFAULT NULL,
  `changes` int(11) DEFAULT NULL,
  `id_pr` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_arquivos_commits_projeto_id` (`projeto_id`),
  KEY `idx_arquivos_commits_usuario_id` (`usuario_id`),
  KEY `idx_arquivos_commits_number_pr` (`number_pr`),
  KEY `idx_arquivos_commits_sha_principal` (`sha_principal`),
  KEY `idx_arquivos_commits_id_pr` (`id_pr`),
  KEY `idx_arquivos_commits_arquivo` (`arquivo`)
) ENGINE=MyISAM AUTO_INCREMENT=468057 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-08 10:41:45
