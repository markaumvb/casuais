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
-- Table structure for table `comentarios_pr`
--

DROP TABLE IF EXISTS `comentarios_pr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios_pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(70) DEFAULT NULL,
  `projeto` varchar(70) DEFAULT NULL,
  `owner` varchar(70) DEFAULT NULL,
  `body` varchar(4000) DEFAULT NULL,
  `dt_comentario` datetime DEFAULT NULL,
  `number_pr` varchar(15) DEFAULT NULL,
  `author_association` varchar(50) DEFAULT NULL,
  `id_pr` int(11) DEFAULT NULL,
  KEY `idx_comentarios_pr_number_pr` (`number_pr`),
  KEY `idx_comentarios_pr_owner` (`owner`),
  KEY `idx_comentarios_pr_projeto` (`projeto`),
  KEY `idx_comentarios_pr_usuario` (`usuario`),
  KEY `idx_comentarios_pr_id` (`id`),
  KEY `idx_comentarios_pr_body` (`body`(255)),
  KEY `idx_comentarios_pr_id_pr` (`id_pr`)
) ENGINE=MyISAM AUTO_INCREMENT=671300 DEFAULT CHARSET=utf8 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-08 10:42:41
