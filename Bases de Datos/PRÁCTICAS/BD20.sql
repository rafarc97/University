-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: uca-gii-bbdd.ctbqzbnwn8rw.eu-west-3.rds.amazonaws.com    Database: BD20
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `ART_NUM` int(11) NOT NULL,
  `ART_NOM` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ART_PESO` int(11) DEFAULT NULL,
  `ART_COL` varchar(7) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ART_PC` float NOT NULL,
  `ART_PV` float NOT NULL,
  `ART_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`ART_NUM`),
  KEY `ART_PRV` (`ART_PRV`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`ART_PRV`) REFERENCES `proveedores` (`PRV_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'impresora',150,'rojo',400,580,4),(2,'calculadora',150,'negro',10,20,1),(3,'calendario',100,'blanco',1,4,4),(4,'lampara',550,'rojo',20,33,5),(5,'lampara',550,'blanco',20,34,5),(6,'lampara',550,'azul',25,36,5),(7,'lampara',550,'verde',25,37,5),(8,'pesacartas 1-500',NULL,NULL,1,4,3),(9,'pesacartas 1-1000',NULL,NULL,2,9,3),(10,'boligrafo',20,'rojo',0.5,1,2),(11,'boligrafo',20,'azul',0.5,1,2),(12,'boligrafo lujo',20,'rojo',0.6,3,2),(13,'boligrafo lujo',20,'verde',1.99,3.99,2),(14,'boligrafo vulgar',20,'azul',1.99,4.99,2),(15,'boligrafo lujo',20,'negro',1.99,4.99,2),(16,'papel',5000,'rosa',3,6,2),(17,'grapadora',1000,'verde',12,15.6,3),(18,'impresora',200,'morado',390,540,3),(19,'calendario',110,'negro',0.6,2.5,4),(20,'manta',NULL,'malva',15,25,10),(21,'balón',NULL,'blanco',10,25,10),(69,'papel',NULL,'rosa',3.15,5.25,NULL),(99,'papel',800,'morado',3.18,5.98,1),(101,'Ordenador',5,'azul',500,650,3),(102,'Ordenador',5,'malva',500,650,3);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `CLT_NUM` int(11) NOT NULL,
  `CLT_APELL` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `CLT_NOM` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CLT_PAIS` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CLT_POB` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CLT_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Borras','Margarita','e','Madrid'),(2,'Perez','Miguel','e','Madrid'),(3,'Dupont','Jean','f','París'),(4,'Dupreit','Michel','f','Lyon'),(5,'Llopis','Antoni','e','Barcelona'),(6,'Souris','Marcel','f','París'),(7,'Goméz','Pablo','e','Pamplona'),(8,'Courbon','Gerad','f','Marsella'),(9,'Roman','Consuelo','e','Jaen'),(10,'Roca','Pau','e','Gerona'),(11,'Mancha','Jorge','e','Valencia'),(12,'Curro','Pablo','e','Barcelona'),(13,'Cortes','Diego','e','Madrid'),(14,'Fernandez','Joaquin','c','Madrid'),(15,'Duran','Jacinto','e','Pamplona'),(16,'Minguin','Pedro','e','Pamplona'),(17,'Ubrique','Jesus','e','Pamplona'),(18,'Mazapato','Sophie','e','Madrid'),(19,'Bigote','Jose Mari','p','Oporto'),(20,'Dalima','Romualdo','b','San José'),(21,'Clavel rojo','Paco','e','Oviedo'),(22,'Alonso','Fernando','e','Gijón'),(23,'Rodriguez','Pedrito','e','Arico'),(24,'Florero','Mar','e','Madrid'),(25,'Florero','Mar','e','Barcelona'),(26,'Peralta','Leo','a','Rosario'),(27,'Santos','Pablo','f','Marsella');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_apellidos` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `emp_nombre` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `emp_direccion1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `emp_direccion2` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emp_poblacion` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `emp_provincia` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emp_pais` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `emp_cp` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emp_genero` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emp_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Polly','Parrot','42 The Lane',NULL,'Some Town','Noshire','gb','AB1 2XY','mujer','1970-12-31'),(2,'Mabel','Canary','24 The Street','Some Village','Some Town','Noshire','gb','AB1 2YZ','mujer','1968-01-23'),(3,'Zöe','Zebra','856 The Avenue',NULL,'Some City','CA','us','123456','mujer','1989-07-16'),(4,'José','Arara','Nenhuma Rua',NULL,'São Paulo',NULL,'br','123457','hombre','1991-05-30'),(5,'Dickie','Duck','1 The Street','Another Village','Some City','Imagineshire','gb','YZ1 2AB','hombre','1952-11-25'),(6,'Fred','Canary','24 The Street','Some Village','Some Town','Noshire','gb','AB1 2YZ','hombre','1967-08-04');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `pai_id` int(11) NOT NULL AUTO_INCREMENT,
  `pai_iso` char(2) DEFAULT NULL,
  `pai_nombre` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`pai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'AF','Afganistán'),(2,'AX','Islas Gland'),(3,'AL','Albania'),(4,'DE','Alemania'),(5,'AD','Andorra'),(6,'AO','Angola'),(7,'AI','Anguilla'),(8,'AQ','Antártida'),(9,'AG','Antigua y Barbuda'),(10,'AN','Antillas Holandesas'),(11,'SA','Arabia Saudí'),(12,'DZ','Argelia'),(13,'AR','Argentina'),(14,'AM','Armenia'),(15,'AW','Aruba'),(16,'AU','Australia'),(17,'AT','Austria'),(18,'AZ','Azerbaiyán'),(19,'BS','Bahamas'),(20,'BH','Bahréin'),(21,'BD','Bangladesh'),(22,'BB','Barbados'),(23,'BY','Bielorrusia'),(24,'BE','Bélgica'),(25,'BZ','Belice'),(26,'BJ','Benin'),(27,'BM','Bermudas'),(28,'BT','Bhután'),(29,'BO','Bolivia'),(30,'BA','Bosnia y Herzegovina'),(31,'BW','Botsuana'),(32,'BV','Isla Bouvet'),(33,'BR','Brasil'),(34,'BN','Brunéi'),(35,'BG','Bulgaria'),(36,'BF','Burkina Faso'),(37,'BI','Burundi'),(38,'CV','Cabo Verde'),(39,'KY','Islas Caimán'),(40,'KH','Camboya'),(41,'CM','Camerún'),(42,'CA','Canadá'),(43,'CF','República Centroafricana'),(44,'TD','Chad'),(45,'CZ','República Checa'),(46,'CL','Chile'),(47,'CN','China'),(48,'CY','Chipre'),(49,'CX','Isla de Navidad'),(50,'VA','Ciudad del Vaticano'),(51,'CC','Islas Cocos'),(52,'CO','Colombia'),(53,'KM','Comoras'),(54,'CD','República Democrática del Congo'),(55,'CG','Congo'),(56,'CK','Islas Cook'),(57,'KP','Corea del Norte'),(58,'KR','Corea del Sur'),(59,'CI','Costa de Marfil'),(60,'CR','Costa Rica'),(61,'HR','Croacia'),(62,'CU','Cuba'),(63,'DK','Dinamarca'),(64,'DM','Dominica'),(65,'DO','República Dominicana'),(66,'EC','Ecuador'),(67,'EG','Egipto'),(68,'SV','El Salvador'),(69,'AE','Emiratos Árabes Unidos'),(70,'ER','Eritrea'),(71,'SK','Eslovaquia'),(72,'SI','Eslovenia'),(73,'ES','España'),(74,'UM','Islas ultramarinas de Estados Unidos'),(75,'US','Estados Unidos'),(76,'EE','Estonia'),(77,'ET','Etiopía'),(78,'FO','Islas Feroe'),(79,'PH','Filipinas'),(80,'FI','Finlandia'),(81,'FJ','Fiyi'),(82,'FR','Francia'),(83,'GA','Gabón'),(84,'GM','Gambia'),(85,'GE','Georgia'),(86,'GS','Islas Georgias del Sur y Sandwich del Sur'),(87,'GH','Ghana'),(88,'GI','Gibraltar'),(89,'GD','Granada'),(90,'GR','Grecia'),(91,'GL','Groenlandia'),(92,'GP','Guadalupe'),(93,'GU','Guam'),(94,'GT','Guatemala'),(95,'GF','Guayana Francesa'),(96,'GN','Guinea'),(97,'GQ','Guinea Ecuatorial'),(98,'GW','Guinea-Bissau'),(99,'GY','Guyana'),(100,'HT','Haití'),(101,'HM','Islas Heard y McDonald'),(102,'HN','Honduras'),(103,'HK','Hong Kong'),(104,'HU','Hungría'),(105,'IN','India'),(106,'ID','Indonesia'),(107,'IR','Irán'),(108,'IQ','Iraq'),(109,'IE','Irlanda'),(110,'IS','Islandia'),(111,'IL','Israel'),(112,'IT','Italia'),(113,'JM','Jamaica'),(114,'JP','Japón'),(115,'JO','Jordania'),(116,'KZ','Kazajstán'),(117,'KE','Kenia'),(118,'KG','Kirguistán'),(119,'KI','Kiribati'),(120,'KW','Kuwait'),(121,'LA','Laos'),(122,'LS','Lesotho'),(123,'LV','Letonia'),(124,'LB','Líbano'),(125,'LR','Liberia'),(126,'LY','Libia'),(127,'LI','Liechtenstein'),(128,'LT','Lituania'),(129,'LU','Luxemburgo'),(130,'MO','Macao'),(131,'MK','ARY Macedonia'),(132,'MG','Madagascar'),(133,'MY','Malasia'),(134,'MW','Malawi'),(135,'MV','Maldivas'),(136,'ML','Malí'),(137,'MT','Malta'),(138,'FK','Islas Malvinas'),(139,'MP','Islas Marianas del Norte'),(140,'MA','Marruecos'),(141,'MH','Islas Marshall'),(142,'MQ','Martinica'),(143,'MU','Mauricio'),(144,'MR','Mauritania'),(145,'YT','Mayotte'),(146,'MX','México'),(147,'FM','Micronesia'),(148,'MD','Moldavia'),(149,'MC','Mónaco'),(150,'MN','Mongolia'),(151,'MS','Montserrat'),(152,'MZ','Mozambique'),(153,'MM','Myanmar'),(154,'NA','Namibia'),(155,'NR','Nauru'),(156,'NP','Nepal'),(157,'NI','Nicaragua'),(158,'NE','Níger'),(159,'NG','Nigeria'),(160,'NU','Niue'),(161,'NF','Isla Norfolk'),(162,'NO','Noruega'),(163,'NC','Nueva Caledonia'),(164,'NZ','Nueva Zelanda'),(165,'OM','Omán'),(166,'NL','Países Bajos'),(167,'PK','Pakistán'),(168,'PW','Palau'),(169,'PS','Palestina'),(170,'PA','Panamá'),(171,'PG','Papúa Nueva Guinea'),(172,'PY','Paraguay'),(173,'PE','Perú'),(174,'PN','Islas Pitcairn'),(175,'PF','Polinesia Francesa'),(176,'PL','Polonia'),(177,'PT','Portugal'),(178,'PR','Puerto Rico'),(179,'QA','Qatar'),(180,'GB','Reino Unido'),(181,'RE','Reunión'),(182,'RW','Ruanda'),(183,'RO','Rumania'),(184,'RU','Rusia'),(185,'EH','Sahara Occidental'),(186,'SB','Islas Salomón'),(187,'WS','Samoa'),(188,'AS','Samoa Americana'),(189,'KN','San Cristóbal y Nevis'),(190,'SM','San Marino'),(191,'PM','San Pedro y Miquelón'),(192,'VC','San Vicente y las Granadinas'),(193,'SH','Santa Helena'),(194,'LC','Santa Lucía'),(195,'ST','Santo Tomé y Príncipe'),(196,'SN','Senegal'),(197,'CS','Serbia y Montenegro'),(198,'SC','Seychelles'),(199,'SL','Sierra Leona'),(200,'SG','Singapur'),(201,'SY','Siria'),(202,'SO','Somalia'),(203,'LK','Sri Lanka'),(204,'SZ','Suazilandia'),(205,'ZA','Sudáfrica'),(206,'SD','Sudán'),(207,'SE','Suecia'),(208,'CH','Suiza'),(209,'SR','Surinam'),(210,'SJ','Svalbard y Jan Mayen'),(211,'TH','Tailandia'),(212,'TW','Taiwán'),(213,'TZ','Tanzania'),(214,'TJ','Tayikistán'),(215,'IO','Territorio Británico del Océano Índico'),(216,'TF','Territorios Australes Franceses'),(217,'TL','Timor Oriental'),(218,'TG','Togo'),(219,'TK','Tokelau'),(220,'TO','Tonga'),(221,'TT','Trinidad y Tobago'),(222,'TN','Túnez'),(223,'TC','Islas Turcas y Caicos'),(224,'TM','Turkmenistán'),(225,'TR','Turquía'),(226,'TV','Tuvalu'),(227,'UA','Ucrania'),(228,'UG','Uganda'),(229,'UY','Uruguay'),(230,'UZ','Uzbekistán'),(231,'VU','Vanuatu'),(232,'VE','Venezuela'),(233,'VN','Vietnam'),(234,'VG','Islas Vírgenes Británicas'),(235,'VI','Islas Vírgenes de los Estados Unidos'),(236,'WF','Wallis y Futuna'),(237,'YE','Yemen'),(238,'DJ','Yibuti'),(239,'ZM','Zambia'),(240,'ZW','Zimbabue');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesos`
--

DROP TABLE IF EXISTS `pesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesos` (
  `PESO_NOM` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `PESO_MIN` int(11) NOT NULL,
  `PESO_MAX` int(11) NOT NULL,
  PRIMARY KEY (`PESO_NOM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesos`
--

LOCK TABLES `pesos` WRITE;
/*!40000 ALTER TABLE `pesos` DISABLE KEYS */;
INSERT INTO `pesos` VALUES ('leve',1,100),('ligero',101,500),('medio',501,2500),('pesado',2501,5000),('sin peso',0,0);
/*!40000 ALTER TABLE `pesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `PRV_NUM` int(11) NOT NULL,
  `PRV_NOM` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`PRV_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'catio electronic'),(2,'estilografica reunidas'),(3,'mecanica de precision'),(4,'sanjita'),(5,'electrolamp'),(6,'copisteria'),(7,'el corte suizo'),(8,'Mercadiz'),(9,'El ahorramas'),(10,'Sara hogar'),(11,'Colchones Pereza S.A.');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba`
--

DROP TABLE IF EXISTS `prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prueba` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba`
--

LOCK TABLES `prueba` WRITE;
/*!40000 ALTER TABLE `prueba` DISABLE KEYS */;
INSERT INTO `prueba` VALUES (1,'Sample data');
/*!40000 ALTER TABLE `prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiendas`
--

DROP TABLE IF EXISTS `tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiendas` (
  `TDA_NUM` int(11) NOT NULL,
  `TDA_POB` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `TDA_GER` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`TDA_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiendas`
--

LOCK TABLES `tiendas` WRITE;
/*!40000 ALTER TABLE `tiendas` DISABLE KEYS */;
INSERT INTO `tiendas` VALUES (1,'Madrid-batan','Contesfosques, Jordi'),(2,'Madrid-centro','Martinez, Juan'),(3,'Pamplona','Dominguez, Julian'),(4,'Barcelona','Parraquet, Juan Carlos'),(5,'Trujillo','Mendez, Pedro'),(6,'Jaen','Marin, Raquel'),(7,'Valencia','Petit, Joan'),(8,'Requena','Marcos, Pilar'),(9,'Palencia','Castroviejo, Lozano'),(10,'Gerona','Gomez, Gabriel'),(11,'Lyon','Madoux, Jean'),(12,'París','Fouet, Paul'),(13,'Jerez','Peralta, Leo'),(14,'Palencia','Lopez, Maria'),(15,'Barcelona','Lopez, Maria'),(16,'París','Missaquette, Juan Carlos');
/*!40000 ALTER TABLE `tiendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `VNT_CLT` int(11) NOT NULL,
  `VNT_TDA` int(11) NOT NULL,
  `VNT_ART` int(11) NOT NULL,
  `VNT_CANT` int(11) DEFAULT NULL,
  `VNT_FCH` date NOT NULL,
  KEY `ventas_ibfk_1` (`VNT_CLT`),
  KEY `ventas_ibfk_2` (`VNT_TDA`),
  KEY `ventas_ibfk_3` (`VNT_ART`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`VNT_CLT`) REFERENCES `clientes` (`CLT_NUM`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`VNT_TDA`) REFERENCES `tiendas` (`TDA_NUM`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`VNT_ART`) REFERENCES `articulos` (`ART_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (22,10,17,1,'2019-10-06'),(5,4,4,1,'2019-10-15'),(7,3,10,1,'2019-10-15'),(7,3,11,2,'2019-10-15'),(7,3,14,3,'2019-10-16'),(8,11,2,1,'2019-10-25'),(6,12,3,2,'2019-10-30'),(6,12,15,2,'2019-11-02'),(13,1,4,1,'2019-11-02'),(13,1,3,1,'2019-11-05'),(1,2,2,1,'2019-11-09'),(1,2,12,1,'2019-12-02'),(1,2,13,10,'2019-12-12'),(4,11,1,8,'2019-12-22'),(4,11,10,7,'2019-12-22'),(3,7,6,1,'2020-01-11'),(3,7,9,2,'2020-01-11'),(1,2,3,3,'2020-01-20'),(7,8,3,1,'2020-02-03'),(4,5,3,6,'2020-02-04'),(10,11,3,1,'2020-02-06'),(6,7,3,1,'2020-02-11'),(3,4,3,2,'2020-02-16'),(9,10,3,1,'2020-02-21'),(2,3,3,4,'2020-02-22'),(8,9,3,1,'2020-02-29'),(5,6,3,3,'2020-02-29'),(26,4,17,2,'2020-03-02'),(19,7,3,1,'2020-03-03'),(17,4,3,10,'2020-03-03'),(18,1,3,1,'2020-03-03'),(10,4,2,NULL,'2020-03-03'),(3,13,3,NULL,'2020-03-03'),(5,3,2,2,'2020-04-29'),(5,4,2,2,'2020-04-29'),(5,3,2,2,'2020-04-29'),(5,4,2,2,'2020-04-29'),(5,3,2,2,'2020-04-29');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-12 13:30:41
