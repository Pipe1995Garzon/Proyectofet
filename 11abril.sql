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
  `id_docentes` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) DEFAULT NULL,
  `CC` int(11) DEFAULT NULL,
  `correo_electronico` varchar(50) DEFAULT NULL,
  `id_Nivel_Aca` int(11) DEFAULT NULL,
  `id_Contrato` int(11) DEFAULT NULL,
  `id_labor` int(11) DEFAULT NULL,
  `id_programa` int(11) DEFAULT NULL,
  `inicio_contrato` date DEFAULT NULL,
  `fin_contrato` date DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `id_tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_docentes`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `docente` */

insert  into `docente`(`id_docentes`,`nombres`,`CC`,`correo_electronico`,`id_Nivel_Aca`,`id_Contrato`,`id_labor`,`id_programa`,`inicio_contrato`,`fin_contrato`,`salario`,`id_usuario`,`id_rol`,`id_tiempo`) values 
(3,'DANIELA FERNANDA HUESO CALDERON',1075289057,'daniela_huesoga@fet.edu.co',2,1,1,1,'2022-02-07','2022-06-04',22440000,53,NULL,NULL),
(4,'MARIA PAULA MARTINEZ NIEVA',1026298024,'paulamari@nhotmail.com',3,1,1,3,'2022-02-11','2022-06-06',2448000,NULL,NULL,NULL),
(5,'JIMENA ANDRADE CANO',36309339,'jimena_andradeca@fet.edu.co',2,1,4,6,'2022-02-07','2022-06-04',2244000,NULL,NULL,NULL),
(6,'ISRAEL SOLORZANO SALAS',7687894,'isolorzano@misena.edu.co',2,2,1,4,'2022-02-16','2022-06-04',1547000,NULL,NULL,NULL),
(7,'GONZALO DUQUE OCHOA',1053790798,'gduqueo@unal.edu.co',1,2,1,5,'2022-02-07','2022-06-04',1224000,NULL,NULL,NULL),
(8,'WILLIAM ORLANDO GAVIRIA RAMIREZ',7733073,'william_gaviriara@fet.edu.co',3,1,1,1,'2022-02-07','2022-06-04',2448000,54,NULL,NULL);

/*Table structure for table `docentes` */

DROP TABLE IF EXISTS `docentes`;

CREATE TABLE `docentes` (
  `id_Docentes` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Cedula` int(11) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Docentes`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `docentes` */

insert  into `docentes`(`id_Docentes`,`Nombre`,`Cedula`,`Correo`,`id_usuario`) values 
(1,'Jaime',1525,'holis',1),
(2,'Luisa',1363,'holis',NULL);

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
('0XzMKc5UsQQ2PEbsJc89hN4i_qNdcv9P',1649781211,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"id\":53,\"username\":\"daniela_huesoga@fet.edu.co\",\"rol\":2,\"cc\":1075289057}}}'),
('2DIVAb07ETgsv-b8NXGmAlynmk3fUFXa',1649738585,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}'),
('JN5he-L0T3KfD4DAc-_dUMZrLDZPJToL',1649758825,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"id\":44,\"username\":\"andres_garzonle@fet.edu.co\",\"rol\":1}}}'),
('OIOs_Ej57600b5woG2yNO4iiYHV83xGv',1649798842,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}');

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
  `Tipo_Contrato` varchar(30) NOT NULL,
  PRIMARY KEY (`id_Contrato`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipo_contrato` */

insert  into `tipo_contrato`(`id_Contrato`,`Tipo_Contrato`) values 
(1,'Tiempo completo'),
(2,'Medio Tiempo');

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
  `CC` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuario`,`usuario`,`password`,`CC`,`id_rol`) values 
(44,'andres_garzonle@fet.edu.co','$2a$10$pjj.P5V3Elzn10YpGgHhtO70rEK0oDyXF0jkFpcFihIYQ.Ez9A9f2',NULL,1),
(53,'daniela_huesoga@fet.edu.co','$2a$10$X2avMRPNr05ETxg9n9TZnuO3FiJYLONN/1wTwP3QShxlPndGXR.2q',1075289057,2),
(54,'william_gaviriara@fet.edu.co','$2a$10$OEopomdzh6aW7LCs0NA8GekBKJNkvobOyexJJjiIuIbonNdLimcvy',7733073,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
