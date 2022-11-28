-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: controle_de_trafego
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aviao`
--

DROP TABLE IF EXISTS `aviao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aviao` (
  `codaviao` int NOT NULL AUTO_INCREMENT,
  `codemp` int NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `capacidade` int NOT NULL,
  PRIMARY KEY (`codaviao`),
  KEY `aviao_fk` (`codemp`),
  CONSTRAINT `aviao_fk` FOREIGN KEY (`codemp`) REFERENCES `empresa` (`codemp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviao`
--

LOCK TABLES `aviao` WRITE;
/*!40000 ALTER TABLE `aviao` DISABLE KEYS */;
/*!40000 ALTER TABLE `aviao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `codemp` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  PRIMARY KEY (`codemp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rota`
--

DROP TABLE IF EXISTS `rota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rota` (
  `codrota` int NOT NULL AUTO_INCREMENT,
  `origem` varchar(30) NOT NULL,
  `destino` varchar(30) NOT NULL,
  `codvoo` int NOT NULL,
  `h_saida` datetime NOT NULL,
  `h_chegada` datetime NOT NULL,
  PRIMARY KEY (`codrota`),
  KEY `rota_trecho_fk` (`origem`,`destino`),
  KEY `rota_fk` (`codvoo`),
  CONSTRAINT `rota_fk` FOREIGN KEY (`codvoo`) REFERENCES `voo` (`codvoo`),
  CONSTRAINT `rota_trecho_fk` FOREIGN KEY (`origem`, `destino`) REFERENCES `trecho` (`origem`, `destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rota`
--

LOCK TABLES `rota` WRITE;
/*!40000 ALTER TABLE `rota` DISABLE KEYS */;
/*!40000 ALTER TABLE `rota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trecho`
--

DROP TABLE IF EXISTS `trecho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trecho` (
  `origem` varchar(30) NOT NULL,
  `destino` varchar(30) NOT NULL,
  `distancia` int NOT NULL,
  PRIMARY KEY (`origem`,`destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trecho`
--

LOCK TABLES `trecho` WRITE;
/*!40000 ALTER TABLE `trecho` DISABLE KEYS */;
/*!40000 ALTER TABLE `trecho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem`
--

DROP TABLE IF EXISTS `viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viagem` (
  `codrota` int NOT NULL,
  `data_voo` date NOT NULL,
  `codaviao` int NOT NULL,
  `h_saida_real` datetime NOT NULL,
  `h_chegada_real` datetime NOT NULL,
  PRIMARY KEY (`codrota`,`data_voo`),
  KEY `viagem_aviao_fk` (`codaviao`),
  CONSTRAINT `viagem_aviao_fk` FOREIGN KEY (`codaviao`) REFERENCES `aviao` (`codaviao`),
  CONSTRAINT `viagem_rota_fk` FOREIGN KEY (`codrota`) REFERENCES `rota` (`codrota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem`
--

LOCK TABLES `viagem` WRITE;
/*!40000 ALTER TABLE `viagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voo`
--

DROP TABLE IF EXISTS `voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voo` (
  `codvoo` int NOT NULL AUTO_INCREMENT,
  `codemp` int NOT NULL,
  PRIMARY KEY (`codvoo`),
  KEY `voo_fk` (`codemp`),
  CONSTRAINT `voo_fk` FOREIGN KEY (`codemp`) REFERENCES `empresa` (`codemp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voo`
--

LOCK TABLES `voo` WRITE;
/*!40000 ALTER TABLE `voo` DISABLE KEYS */;
/*!40000 ALTER TABLE `voo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-10 23:28:07
