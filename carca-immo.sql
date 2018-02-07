-- Adminer 4.5.1-dev MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `carca-immo`;
CREATE DATABASE `carca-immo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `carca-immo`;

DROP TABLE IF EXISTS `age_agent`;
CREATE TABLE `age_agent` (
  `age_oid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `age_tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age_prenom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age_nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`age_oid`),
  UNIQUE KEY `UNIQ_B3C09A0B92FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_B3C09A0BA0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_B3C09A0BC05FB297` (`confirmation_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `age_agent` (`age_oid`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `age_tel`, `age_prenom`, `age_nom`) VALUES
(4,	'isam',	'isam',	'isam@gmail.com',	'isam@gmail.com',	1,	NULL,	'$2y$13$8TuYBVT1nr0Od3UZzRLfsePEOQK4Rw6jA6jv07ClW2AccDOs7p/kS',	'2018-02-07 15:57:39',	NULL,	NULL,	'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',	'06',	'isa',	'm'),
(6,	'rombg',	'rombg',	'isam@symfo.com',	'isam@symfo.com',	1,	NULL,	'1234',	NULL,	NULL,	NULL,	'a:0:{}',	'0605',	'isa',	'm');

DROP TABLE IF EXISTS `ann_annonce`;
CREATE TABLE `ann_annonce` (
  `ann_oid` int(11) NOT NULL AUTO_INCREMENT,
  `ann_titre` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ann_prix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ann_nbre_piece` int(11) NOT NULL,
  `ann_photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ann_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `age_oid` int(11) DEFAULT NULL,
  `typ_oid` int(11) DEFAULT NULL,
  `pro_oid` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ann_oid`),
  KEY `IDX_466D3B10DA8BB9B6` (`age_oid`),
  KEY `IDX_466D3B107EB171C6` (`typ_oid`),
  KEY `IDX_466D3B10289A545` (`pro_oid`),
  CONSTRAINT `FK_466D3B10289A545` FOREIGN KEY (`pro_oid`) REFERENCES `pro_proprio` (`pro_oid`),
  CONSTRAINT `FK_466D3B107EB171C6` FOREIGN KEY (`typ_oid`) REFERENCES `typ_type_annonce` (`typ_oid`),
  CONSTRAINT `FK_466D3B10DA8BB9B6` FOREIGN KEY (`age_oid`) REFERENCES `age_agent` (`age_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ann_annonce` (`ann_oid`, `ann_titre`, `ann_prix`, `ann_nbre_piece`, `ann_photo`, `ann_description`, `age_oid`, `typ_oid`, `pro_oid`, `updated_at`) VALUES
(1,	'Belle Maison dans la peripherie de Carcassonne',	'€ 1,200 000',	8,	'5a787ce73f7ce680843696.jpg',	'Grande cheminée Garage etc.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Non libero repellendus, laboriosam error quia ullam saepe rerum id rem corporis praesentium aspernatur consequatur necessitatibus cupiditate assumenda quam enim iusto. Ut?Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, ad rem perspiciatis libero quibusdam optio alias corporis? Numquam corrupti a ea animi maxime nihil perspiciatis exercitationem harum, fugiat non cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, temporibus tenetur aut maiores porro deserunt inventore totam rerum facilis vel quasi eligendi sequi, fugiat eveniet minima sunt, labore illum quisquam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Non libero repellendus, laboriosam error quia ullam saepe rerum id rem corporis praesentium aspernatur consequatur necessitatibus cupiditate assumenda quam enim iusto. Ut?Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, ad rem perspiciatis libero quibusdam optio alias corporis? Numquam corrupti a ea animi maxime nihil perspiciatis exercitationem harum, fugiat non cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, temporibus tenetur aut maiores porro deserunt inventore totam rerum facilis vel quasi eligendi sequi, fugiat eveniet minima sunt, labore illum quisquam.',	4,	2,	1,	'2018-02-05 16:48:55'),
(2,	'Immeuble Contemporain avec Ascenseur .',	'€ 3,225,000',	28,	'5a787b1356882765719527.jpg',	'Chaque appartement comprend une terrasse et un garage.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Non libero repellendus, laboriosam error quia ullam saepe rerum id rem corporis praesentium aspernatur consequatur necessitatibus cupiditate assumenda quam enim iusto. Ut?Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, ad rem perspiciatis libero quibusdam optio alias corporis? Numquam corrupti a ea animi maxime nihil perspiciatis exercitationem harum, fugiat non cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, temporibus tenetur aut maiores porro deserunt inventore totam rerum facilis vel quasi eligendi sequi, fugiat eveniet minima sunt, labore illum quisquam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Non libero repellendus, laboriosam error quia ullam saepe rerum id rem corporis praesentium aspernatur consequatur necessitatibus cupiditate assumenda quam enim iusto. Ut?Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, ad rem perspiciatis libero quibusdam optio alias corporis? Numquam corrupti a ea animi maxime nihil perspiciatis exercitationem harum, fugiat non cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, temporibus tenetur aut maiores porro deserunt inventore totam rerum facilis vel quasi eligendi sequi, fugiat eveniet minima sunt, labore illum quisquam.',	6,	3,	1,	'2018-02-05 16:41:07');

DROP TABLE IF EXISTS `pro_proprio`;
CREATE TABLE `pro_proprio` (
  `pro_oid` int(11) NOT NULL AUTO_INCREMENT,
  `pro_prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pro_nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pro_tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pro_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `pro_proprio` (`pro_oid`, `pro_prenom`, `pro_nom`, `pro_tel`) VALUES
(1,	'Jean',	'Dujardin',	'06.07.confidentiel');

DROP TABLE IF EXISTS `typ_type_annonce`;
CREATE TABLE `typ_type_annonce` (
  `typ_oid` int(11) NOT NULL AUTO_INCREMENT,
  `typ_titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`typ_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `typ_type_annonce` (`typ_oid`, `typ_titre`) VALUES
(1,	'Locations Maisons'),
(2,	'Ventes Maisons'),
(3,	'Ventes Immeubles'),
(4,	'Locations Garages');

-- 2018-02-07 15:19:36
