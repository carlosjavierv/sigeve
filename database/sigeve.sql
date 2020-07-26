/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : sigeve

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-07-26 11:18:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('1', 'Administrador');
INSERT INTO `rol` VALUES ('2', 'Conductor');
INSERT INTO `rol` VALUES ('3', 'Autoridad');

-- ----------------------------
-- Table structure for unidad
-- ----------------------------
DROP TABLE IF EXISTS `unidad`;
CREATE TABLE `unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of unidad
-- ----------------------------
INSERT INTO `unidad` VALUES ('1', 'Facultad de medicina');
INSERT INTO `unidad` VALUES ('2', 'Facultad de Ciencias Exactas');
INSERT INTO `unidad` VALUES ('3', 'Facultad de Economía');
INSERT INTO `unidad` VALUES ('4', 'Facultad de ciencias de la computación');
INSERT INTO `unidad` VALUES ('5', 'Facultad de Enfermería');
INSERT INTO `unidad` VALUES ('6', 'Facultad de Auditoría');
INSERT INTO `unidad` VALUES ('7', 'Facultad de Administración');
INSERT INTO `unidad` VALUES ('8', 'Escuela de Agricultura3');
INSERT INTO `unidad` VALUES ('9', 'Escuela de educación física1');
INSERT INTO `unidad` VALUES ('10', 'Facultad de artes');
INSERT INTO `unidad` VALUES ('11', 'Centro de educación continua');
INSERT INTO `unidad` VALUES ('12', 'Facultad de Diseño Gráfico');
INSERT INTO `unidad` VALUES ('13', 'Escuela de música');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', '1', 'Carlos Viteri', 'carlos@gmail.com', '$2y$10$fEh.Zgf9JpzZBd7xedu5ceViCoqwTY9FEzONHbeQT5hBf7zegET1G');
INSERT INTO `usuario` VALUES ('2', '3', 'Luis Portillo', 'luis@gmail.com', '$2y$10$8uGpRlf2DuSbA2TL7iG9ee.fHCX8HqFUvbPrpphXnlS5.ASa0bwq.');
INSERT INTO `usuario` VALUES ('3', '3', 'Camila Perez', 'camila@gmail.com', '$2y$10$fEh.Zgf9JpzZBd7xedu5ceViCoqwTY9FEzONHbeQT5hBf7zegET1G');
INSERT INTO `usuario` VALUES ('4', '2', 'Andrés Suarez', 'andres@gmail.com', '$2y$10$EDMumPQ6ungMXf0aNHj0ReutlNIGm2StAQtzS/aT1S5jmfe7i9p..');
INSERT INTO `usuario` VALUES ('5', '2', 'Karla Cespedes', 'karla@gmail.com', '$2y$10$T4P3lbUIb.yrcjvu8NgwTO/frD4IyR6/kYkU6.W1emEV6lfJDVkQu');
INSERT INTO `usuario` VALUES ('6', '2', 'Paulina Sanchez', 'paulina@gmail.com', '$2y$10$jH2yALCN3dLUgd0umvpVvuJ9gHWwJ5Tq48B.vxcX6sgHXcOMScZJq');
INSERT INTO `usuario` VALUES ('7', '3', 'Delia Jaramillo', 'delia@gmail.com', '$2y$10$m7XHagMo6/f3SDxSC0yU.OSGVQQvw7/gcDpH.MWzyuurLrKkvunbe');

-- ----------------------------
-- Table structure for vehiculo
-- ----------------------------
DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unidad_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `anio` varchar(4) DEFAULT NULL,
  `placa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehiculo
-- ----------------------------
INSERT INTO `vehiculo` VALUES ('1', '1', '1', 'Chevrolet', null, null, 'PZU-2054');
INSERT INTO `vehiculo` VALUES ('2', '1', '1', 'Kia', null, null, 'PBA-0854');
INSERT INTO `vehiculo` VALUES ('3', '1', '1', 'Fiat', 'Fiorino', '2005', 'PBA-5487');
INSERT INTO `vehiculo` VALUES ('4', '8', '6', 'JAC', 'S2', '2020', 'PBA-7634');
