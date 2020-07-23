/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : sigeve

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-07-23 11:33:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for conductor
-- ----------------------------
DROP TABLE IF EXISTS `conductor`;
CREATE TABLE `conductor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of conductor
-- ----------------------------
INSERT INTO `conductor` VALUES ('1', 'Pedro Simbaña');
INSERT INTO `conductor` VALUES ('2', 'María Buenaño');

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
INSERT INTO `unidad` VALUES ('8', 'Escuela de Agricultura');
INSERT INTO `unidad` VALUES ('9', 'Escuela de educación física');
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
  `role_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', '1', 'Carlos Viteri', 'carlos@gmail.com', '$2y$10$fEh.Zgf9JpzZBd7xedu5ceViCoqwTY9FEzONHbeQT5hBf7zegET1G');

-- ----------------------------
-- Table structure for vehiculo
-- ----------------------------
DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conductor_id` int(11) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `placa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehiculo
-- ----------------------------
INSERT INTO `vehiculo` VALUES ('1', null, 'Chevrolet', 'PZU-2054');
INSERT INTO `vehiculo` VALUES ('2', null, 'Kia', 'PBA-0854');
