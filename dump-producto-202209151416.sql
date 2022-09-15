-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: producto
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria_de_producto`
--

DROP TABLE IF EXISTS `categoria_de_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_de_producto` (
  `id_Categoria` int NOT NULL,
  `nom_Categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_de_producto`
--

LOCK TABLES `categoria_de_producto` WRITE;
/*!40000 ALTER TABLE `categoria_de_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_de_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_Cliente` int NOT NULL,
  `nom_Cliente` varchar(100) NOT NULL,
  `dire_Cliente` varchar(100) NOT NULL,
  `telefono_Cliente` int NOT NULL,
  `email_Cliente` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'orlando','av algo',301,'ayala.orland@gmail.com'),(2,'pedro','avenidachile',3123,'ulala@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_Factura` int NOT NULL,
  `valor_Factura` int NOT NULL,
  `forma_Pago` varchar(100) NOT NULL,
  `id_OrCompra` int NOT NULL,
  PRIMARY KEY (`id_Factura`),
  KEY `factura_FK` (`id_OrCompra`),
  CONSTRAINT `factura_FK` FOREIGN KEY (`id_OrCompra`) REFERENCES `orden_de_compra` (`id_OrCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_Inventario` int NOT NULL,
  `entrada_Inve` int NOT NULL,
  `salidas_Inve` int NOT NULL,
  `existencias_Inve` int NOT NULL,
  `id_Producto` int NOT NULL,
  `id_Proveedor` int NOT NULL,
  PRIMARY KEY (`id_Inventario`),
  KEY `inventario_FK` (`id_Producto`),
  KEY `inventario_FK_1` (`id_Proveedor`),
  CONSTRAINT `inventario_FK` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`),
  CONSTRAINT `inventario_FK_1` FOREIGN KEY (`id_Proveedor`) REFERENCES `proveedor` (`id_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_de_compra`
--

DROP TABLE IF EXISTS `orden_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_de_compra` (
  `id_OrCompra` int NOT NULL,
  `id_Cliente` int NOT NULL,
  `id_Producto` int NOT NULL,
  `id_Factura` int NOT NULL,
  PRIMARY KEY (`id_OrCompra`),
  KEY `orden_de_compra_FK` (`id_Cliente`),
  KEY `orden_de_compra_FK_1` (`id_Producto`),
  KEY `orden_de_compra_FK_2` (`id_Factura`),
  CONSTRAINT `orden_de_compra_FK` FOREIGN KEY (`id_Cliente`) REFERENCES `clientes` (`id_Cliente`),
  CONSTRAINT `orden_de_compra_FK_1` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`),
  CONSTRAINT `orden_de_compra_FK_2` FOREIGN KEY (`id_Factura`) REFERENCES `factura` (`id_Factura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_de_compra`
--

LOCK TABLES `orden_de_compra` WRITE;
/*!40000 ALTER TABLE `orden_de_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_de_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_Producto` int NOT NULL AUTO_INCREMENT,
  `nom_Producto` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` int NOT NULL,
  `id_Proveedor` int NOT NULL,
  `id_Categoria` int NOT NULL,
  `id_Inventario` int NOT NULL,
  PRIMARY KEY (`id_Producto`),
  KEY `producto_FK` (`id_Inventario`),
  KEY `producto_FK_1` (`id_Proveedor`),
  KEY `producto_FK_2` (`id_Categoria`),
  CONSTRAINT `producto_FK` FOREIGN KEY (`id_Inventario`) REFERENCES `inventario` (`id_Inventario`),
  CONSTRAINT `producto_FK_1` FOREIGN KEY (`id_Proveedor`) REFERENCES `proveedor` (`id_Proveedor`),
  CONSTRAINT `producto_FK_2` FOREIGN KEY (`id_Categoria`) REFERENCES `categoria_de_producto` (`id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_Proveedor` int NOT NULL,
  `nom_Proveedor` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'producto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-15 14:16:15
