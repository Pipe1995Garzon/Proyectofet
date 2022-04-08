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

/*Table structure for table `docente` */

DROP TABLE IF EXISTS `docente`;

CREATE TABLE `docente` (
  `id_docentes` int(11) NOT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `identificacion` int(11) DEFAULT NULL,
  `correo_electronico` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `id_labor` int(11) DEFAULT NULL,
  `id_Inicio_Contrato` int(11) DEFAULT NULL,
  `id_Nivel_Aca` int(11) DEFAULT NULL,
  `id_programa` int(11) DEFAULT NULL,
  `id_tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_docentes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `docente` */

/*Table structure for table `docentes` */

DROP TABLE IF EXISTS `docentes`;

CREATE TABLE `docentes` (
  `id_Docentes` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Cedula` int(11) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
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

/*Table structure for table `labor` */

DROP TABLE IF EXISTS `labor`;

CREATE TABLE `labor` (
  `id_labor` int(11) NOT NULL AUTO_INCREMENT,
  `labor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_labor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `labor` */

insert  into `labor`(`id_labor`,`labor`) values 
(1,'Docente'),
(2,'Investigador'),
(3,'Externo'),
(4,'Administrativo');

/*Table structure for table `nivel_academico` */

DROP TABLE IF EXISTS `nivel_academico`;

CREATE TABLE `nivel_academico` (
  `id_Nivel_Aca` int(11) NOT NULL AUTO_INCREMENT,
  `Academico` varchar(30) NOT NULL,
  PRIMARY KEY (`id_Nivel_Aca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `nivel_academico` */

insert  into `nivel_academico`(`id_Nivel_Aca`,`Academico`) values 
(1,'Pregrado'),
(2,'Especializacion'),
(3,'Magister'),
(4,'Doctorado');

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
('_kvL99OdBbznKa0wkuhj1BD1cPLRciKS',1649472471,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}');

/*Table structure for table `tiempo` */

DROP TABLE IF EXISTS `tiempo`;

CREATE TABLE `tiempo` (
  `id_tiempo` int(11) NOT NULL AUTO_INCREMENT,
  `tiempo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_tiempo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tiempo` */

insert  into `tiempo`(`id_tiempo`,`tiempo`) values 
(1,'TC'),
(2,'MT'),
(3,'CAT 5'),
(4,'CAT 8'),
(5,'CAT 7'),
(6,'CAT 8'),
(7,'CAT 9'),
(8,'CAT 10');

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
  `usuario` varchar(50) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuario`,`usuario`,`password`,`id_rol`) values 
(43,'gustavo_norename@fet.edu.co','$2a$10$Iy8vY34ID3bUMWb4nQ9oVeElM1bUaiaI9dvXCC2AnH/ClIcN3/jBe',2),
(44,'andres_garzonle@fet.edu.co','$2a$10$pjj.P5V3Elzn10YpGgHhtO70rEK0oDyXF0jkFpcFihIYQ.Ez9A9f2',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
