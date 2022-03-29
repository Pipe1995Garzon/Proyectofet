/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.1.34-MariaDB : Database - banco_datos_fet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`banco_datos_fet` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `banco_datos_fet`;

/*Table structure for table `administrativos` */

DROP TABLE IF EXISTS `administrativos`;

CREATE TABLE `administrativos` (
  `id_Administrativos` int(11) NOT NULL AUTO_INCREMENT,
  `Nomina` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Cedula` int(11) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_Administrativos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `administrativos` */

/*Table structure for table `docentes` */

DROP TABLE IF EXISTS `docentes`;

CREATE TABLE `docentes` (
  `id_Docentes` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Cedula` int(11) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_Docentes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `docentes` */

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  `apellido` varchar(25) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `empleados` */

insert  into `empleados`(`id_empleado`,`nombre`,`apellido`,`edad`) values 
(1,'Soraya','Villalba V',29),
(2,'Luisa','Guzman',22),
(4,'Maria','Martinez',54),
(5,'Victoria','Villalba',25),
(6,'Yan','Villalba',26);

/*Table structure for table `fecha_contrato` */

DROP TABLE IF EXISTS `fecha_contrato`;

CREATE TABLE `fecha_contrato` (
  `id_Inicio_Contrato` int(11) NOT NULL AUTO_INCREMENT,
  `Inicio` datetime NOT NULL,
  `Finalizacion` datetime NOT NULL,
  `Nomina` varchar(20) NOT NULL,
  PRIMARY KEY (`id_Inicio_Contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `fecha_contrato` */

/*Table structure for table `lista_usuarios` */

DROP TABLE IF EXISTS `lista_usuarios`;

CREATE TABLE `lista_usuarios` (
  `id_lista_usuarios` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `apellido` varchar(25) DEFAULT NULL,
  `identificacion` int(11) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lista_usuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `lista_usuarios` */

/*Table structure for table `nivel_academico` */

DROP TABLE IF EXISTS `nivel_academico`;

CREATE TABLE `nivel_academico` (
  `id_Nivel_Aca` int(11) NOT NULL AUTO_INCREMENT,
  `Academico` varchar(30) NOT NULL,
  PRIMARY KEY (`id_Nivel_Aca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `nivel_academico` */

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `rol` */

insert  into `rol`(`id_rol`,`rol`) values 
(1,'Administrador'),
(2,'Empleado');

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sessions` */

insert  into `sessions`(`session_id`,`expires`,`data`) values 
('Yfjgkq1hLHG6dX1tGYe7GE96kXak1KrY',1648612442,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}'),
('lDZgG6WnyrNjNcU9fs0LHG_RwwLcbE-u',1648610222,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

/*Table structure for table `tipo_contrato` */

DROP TABLE IF EXISTS `tipo_contrato`;

CREATE TABLE `tipo_contrato` (
  `id_Contrato` int(11) NOT NULL AUTO_INCREMENT,
  `Numero_Contrato` int(11) NOT NULL,
  `Tipo_Contrato` varchar(30) NOT NULL,
  `salario` varchar(30) NOT NULL,
  PRIMARY KEY (`id_Contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipo_contrato` */

/*Table structure for table `tipo_empleado` */

DROP TABLE IF EXISTS `tipo_empleado`;

CREATE TABLE `tipo_empleado` (
  `id_Tipo_Emple` int(11) NOT NULL AUTO_INCREMENT,
  `Area` varchar(30) NOT NULL,
  `Cargo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_Tipo_Emple`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipo_empleado` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(25) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuario`,`usuario`,`password`,`id_rol`) values 
(38,'Alexandra','$2a$10$lKw9k6lfV6XIfpi10TVf/uZ3U0v1Tw9IpqwAPCose8BgD4IfqyuMy',2),
(39,'Liza','$2a$10$qXyOITUY5GuetRp4mIIWh.B3Xub6IA7op7ZZ29gtrh6BiDIYBP12u',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
