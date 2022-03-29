/*
SQLyog Community v13.1.2 (64 bit)
MySQL - 10.4.22-MariaDB : Database - banco_datos_fet
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

/*Table structure for table `empleados_fet` */

DROP TABLE IF EXISTS `empleados_fet`;

CREATE TABLE `empleados_fet` (
  `id_empleado_fet` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `id_programa` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_empleado_fet`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `empleados_fet` */

insert  into `empleados_fet`(`id_empleado_fet`,`nombre`,`apellido`,`direccion`,`edad`,`id_programa`,`id_usuario`) values 
(1,'Alexandra ','Roa','km 10 via al sur',25,6,0);

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

/*Table structure for table `programa` */

DROP TABLE IF EXISTS `programa`;

CREATE TABLE `programa` (
  `id_programa` int(11) NOT NULL AUTO_INCREMENT,
  `programa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_programa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `programa` */

insert  into `programa`(`id_programa`,`programa`) values 
(1,'Seguridad ocupacional'),
(2,'Ingenieria de alimentos'),
(3,'Ingenieria de alimentos'),
(4,'Ingenieria de software'),
(5,'Ingeieria Electrica'),
(6,'Ingenieria Ambiental');

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
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sessions` */

insert  into `sessions`(`session_id`,`expires`,`data`) values 
('_l1lS4IBBFyCvnZWc06WsdNopnK5YLpW',1648527541,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"correcto\":[\"bienvenido  Alexandra\"]},\"passport\":{\"user\":{}}}'),
('lGPidjkLqiGTdMrwNrSECXyVWrNrt_Or',1648608210,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"correcto\":[\"bienvenido  Alexandra\"]},\"passport\":{\"user\":{\"id\":38,\"username\":\"Alexandra\"}}}');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(25) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuario`,`usuario`,`password`,`id_rol`) values 
(38,'Alexandra','$2a$10$lKw9k6lfV6XIfpi10TVf/uZ3U0v1Tw9IpqwAPCose8BgD4IfqyuMy',2),
(39,'Liza','$2a$10$qXyOITUY5GuetRp4mIIWh.B3Xub6IA7op7ZZ29gtrh6BiDIYBP12u',2),
(41,'Soraya','$2a$10$LRm0kKlxyl7hzZK6UCi8ouCP1g0qL7DT7M5FEfuTvkSE5bM5rPFoa',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
