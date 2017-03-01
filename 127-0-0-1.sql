-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `adamini` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `adamini`;

DROP TABLE IF EXISTS `interventi`;
CREATE TABLE `interventi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pc_id` int(11) NOT NULL,
  `dataintervento` date NOT NULL,
  `descrizione` varchar(40) NOT NULL,
  `spesa` float NOT NULL,
  `ore` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pc_id` (`pc_id`),
  CONSTRAINT `interventi_ibfk_2` FOREIGN KEY (`pc_id`) REFERENCES `pc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `interventi` (`id`, `pc_id`, `dataintervento`, `descrizione`, `spesa`, `ore`) VALUES
(2,	2,	'0000-00-00',	'Mail intasata da troppe letterine',	50,	'00:00:00'),
(3,	3,	'0000-00-00',	'riparare il buco da arcibugio',	1000,	'00:00:21'),
(5,	4,	'0000-00-00',	'asfdfgsd',	4554,	'00:00:06');

DROP VIEW IF EXISTS `listainterventi`;
CREATE TABLE `listainterventi` (`id` int(11), `dataintervento` date, `descrizione` varchar(40), `spesa` float, `ore` time, `marca` varchar(40), `hostname` varchar(40), `modello` varchar(40), `sn` varchar(40));


DROP TABLE IF EXISTS `marche`;
CREATE TABLE `marche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `marche` (`id`, `marca`) VALUES
(1,	'Samsung'),
(2,	'Intel'),
(3,	'Toshiba'),
(4,	'Dell'),
(5,	'Apple');

DROP TABLE IF EXISTS `pc`;
CREATE TABLE `pc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(40) NOT NULL,
  `marche_id` int(11) NOT NULL,
  `modello` varchar(40) NOT NULL,
  `sn` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marche_id` (`marche_id`),
  CONSTRAINT `pc_ibfk_2` FOREIGN KEY (`marche_id`) REFERENCES `marche` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pc` (`id`, `hostname`, `marche_id`, `modello`, `sn`) VALUES
(2,	'pippo',	5,	'compl8',	'cmpl54arse55'),
(3,	'paperino',	3,	'tjkotw',	'46fro5508w3gdfg'),
(4,	'rachel',	2,	'ovetto',	'vibiinc1234'),
(5,	'admin',	4,	'scazz',	'21101994');

DROP TABLE IF EXISTS `listainterventi`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `listainterventi` AS select `interventi`.`id` AS `id`,`interventi`.`dataintervento` AS `dataintervento`,`interventi`.`descrizione` AS `descrizione`,`interventi`.`spesa` AS `spesa`,`interventi`.`ore` AS `ore`,`marche`.`marca` AS `marca`,`pc`.`hostname` AS `hostname`,`pc`.`modello` AS `modello`,`pc`.`sn` AS `sn` from ((`interventi` join `pc` on((`pc`.`id` = `interventi`.`pc_id`))) join `marche` on((`marche`.`id` = `pc`.`marche_id`)));

-- 2017-03-01 11:32:42
