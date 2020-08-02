/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : sigeve

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-08-02 12:30:43
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
-- Table structure for ubicacion
-- ----------------------------
DROP TABLE IF EXISTS `ubicacion`;
CREATE TABLE `ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int(11) DEFAULT NULL,
  `latitud` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ubicacion_vehiculo` (`vehiculo_id`),
  CONSTRAINT `ubicacion_vehiculo` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ubicacion
-- ----------------------------

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
INSERT INTO `unidad` VALUES ('1', 'Facultad de medicina 1');
INSERT INTO `unidad` VALUES ('2', 'Facultad de Ciencias Exactas');
INSERT INTO `unidad` VALUES ('3', 'Facultad de Economía');
INSERT INTO `unidad` VALUES ('4', 'Facultad de ciencias de la computación');
INSERT INTO `unidad` VALUES ('6', 'Facultad de Auditoría');
INSERT INTO `unidad` VALUES ('7', 'Facultad de Administración');
INSERT INTO `unidad` VALUES ('8', 'Escuela de Agricultura3');
INSERT INTO `unidad` VALUES ('9', 'Escuela de educación física1');
INSERT INTO `unidad` VALUES ('10', 'Facultad de artes');
INSERT INTO `unidad` VALUES ('11', 'Centro de educación continua');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `unidad_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `usuario_rol` (`rol_id`),
  KEY `usuario_unidad` (`unidad_id`),
  CONSTRAINT `usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `usuario_unidad` FOREIGN KEY (`unidad_id`) REFERENCES `unidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', '1', null, 'Carlos Viteri', 'carlos@gmail.com', '$2y$10$fEh.Zgf9JpzZBd7xedu5ceViCoqwTY9FEzONHbeQT5hBf7zegET1G');
INSERT INTO `usuario` VALUES ('3', '3', '7', 'Camila Perez', 'camila@gmail.com', '$2y$10$RdozngAkQdAYNreBEqt2jueHi8MOf8HhJ6FcMZEdHzu1PRTLvMrNa');
INSERT INTO `usuario` VALUES ('5', '2', null, 'Karla Cespedes', 'karla@gmail.com', '$2y$10$T4P3lbUIb.yrcjvu8NgwTO/frD4IyR6/kYkU6.W1emEV6lfJDVkQu');
INSERT INTO `usuario` VALUES ('6', '2', null, 'Paulina Sanchez 1', 'paulina@gmail.com', '$2y$10$qVLhnlzca89hjEuGdFJxoen6AHE3ZvkXo9GWJsSjSYkU5IRAGHcbm');
INSERT INTO `usuario` VALUES ('7', '3', '1', 'Delia Jaramillo', 'delia@gmail.com', '$2y$10$m7XHagMo6/f3SDxSC0yU.OSGVQQvw7/gcDpH.MWzyuurLrKkvunbe');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_usuario` (`usuario_id`),
  KEY `vehiculo_unidad` (`unidad_id`),
  CONSTRAINT `vehiculo_unidad` FOREIGN KEY (`unidad_id`) REFERENCES `unidad` (`id`),
  CONSTRAINT `vehiculo_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehiculo
-- ----------------------------
INSERT INTO `vehiculo` VALUES ('4', '8', '6', 'JAC', 'S2', '2020', 'PBA-7634');
