-- MySQL dump 10.13  Distrib 5.7.29, for Win64 (x86_64)
--
-- Host: localhost    Database: cardapio
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Italiano'),(2,'Rápido e Fácil'),(3,'Hamburgers'),(4,'Alemã'),(5,'Leve & Saudável'),(6,'Exótica'),(7,'Café da Manhã'),(8,'Asiática'),(9,'Francesa'),(10,'Verão');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_produto`
--

DROP TABLE IF EXISTS `categoria_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_produto` (
  `id_categoria` int(11) NOT NULL,
  `id_produtos` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria`,`id_produtos`),
  KEY `fk_categoria_has_produtos_produtos1` (`id_produtos`),
  CONSTRAINT `fk_categoria_has_produtos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria_has_produtos_produtos1` FOREIGN KEY (`id_produtos`) REFERENCES `produto` (`id_produtos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_produto`
--

LOCK TABLES `categoria_produto` WRITE;
/*!40000 ALTER TABLE `categoria_produto` DISABLE KEYS */;
INSERT INTO `categoria_produto` VALUES (1,1),(1,2),(2,2),(3,2),(3,3),(4,4),(2,5),(5,5),(10,5),(6,6),(10,6),(7,7),(8,8),(9,9),(2,10),(5,10),(10,10);
/*!40000 ALTER TABLE `categoria_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id_produtos` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `image_url` varchar(250) NOT NULL,
  `valor` decimal(8,2) DEFAULT NULL,
  `tempo_preparo` int(11) DEFAULT NULL,
  `free_gluten` smallint(6) DEFAULT '0',
  `vegano` smallint(6) DEFAULT '0',
  `vegetariano` smallint(6) DEFAULT '0',
  `free_lactose` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_produtos`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Spaghetti with Tomato Sauce','https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',50.00,20,0,0,1,1),(2,'Toast Hawaii','https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',25.00,10,0,0,0,0),(3,'Classic Hamburger','https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',35.00,45,0,0,0,1),(4,'Wiener Schnitzel','https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',60.00,25,0,0,0,0),(5,'Salad with Smoked Salmon','https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',5.00,15,1,0,1,1),(6,'Delicious Orange Mousse','https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',21.00,240,1,0,1,0),(7,'Pancakes','https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',15.00,20,1,0,1,0),(8,'Creamy Indian Chicken Curry','https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',10.00,35,1,0,0,1),(9,'Chocolate Souffle','https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',25.00,45,1,0,1,0),(10,'Asparagus Salad with Cherry Tomatoes','https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',35.00,30,1,1,1,1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-19  7:10:24
