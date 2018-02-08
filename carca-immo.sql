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
(4,	'isam',	'isam',	'isam@gmail.com',	'isam@gmail.com',	1,	NULL,	'$2y$13$8TuYBVT1nr0Od3UZzRLfsePEOQK4Rw6jA6jv07ClW2AccDOs7p/kS',	'2018-02-08 09:55:54',	NULL,	NULL,	'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',	'06',	'isa',	'm'),
(6,	'rombg',	'rombg',	'isam@symfo.com',	'isam@symfo.com',	1,	NULL,	'1234',	NULL,	NULL,	NULL,	'a:0:{}',	'0605',	'isa',	'm'),
(7,	'mac',	'mac',	'stev@apple.com',	'stev@apple.com',	1,	NULL,	'54321',	NULL,	NULL,	NULL,	'a:0:{}',	'07.06.05.',	'steve',	'jobs');

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
(1,	'Belle Maison dans la périphérie de Carcassonne',	'€ 1,200 000',	8,	'5a787ce73f7ce680843696.jpg',	'Grande cheminée Garage etc.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Non libero repellendus, laboriosam error quia ullam saepe rerum id rem corporis praesentium aspernatur consequatur necessitatibus cupiditate assumenda quam enim iusto. Ut?Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, ad rem perspiciatis libero quibusdam optio alias corporis? Numquam corrupti a ea animi maxime nihil perspiciatis exercitationem harum, fugiat non cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, temporibus tenetur aut maiores porro deserunt inventore totam rerum facilis vel quasi eligendi sequi, fugiat eveniet minima sunt, labore illum quisquam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Non libero repellendus, laboriosam error quia ullam saepe rerum id rem corporis praesentium aspernatur consequatur necessitatibus cupiditate assumenda quam enim iusto. Ut?Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, ad rem perspiciatis libero quibusdam optio alias corporis? Numquam corrupti a ea animi maxime nihil perspiciatis exercitationem harum, fugiat non cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, temporibus tenetur aut maiores porro deserunt inventore totam rerum facilis vel quasi eligendi sequi, fugiat eveniet minima sunt, labore illum quisquam.',	4,	2,	1,	'2018-02-05 16:48:55'),
(2,	'Immeuble Contemporain avec piscine et ascenseur',	'€ 13,225,000',	87,	'5a7b1bce52665345562376.jpg',	'Chaque appartement comprend une terrasse et un garage.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Non libero repellendus, laboriosam error quia ullam saepe rerum id rem corporis praesentium aspernatur consequatur necessitatibus cupiditate assumenda quam enim iusto. Ut?Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, ad rem perspiciatis libero quibusdam optio alias corporis? Numquam corrupti a ea animi maxime nihil perspiciatis exercitationem harum, fugiat non cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, temporibus tenetur aut maiores porro deserunt inventore totam rerum facilis vel quasi eligendi sequi, fugiat eveniet minima sunt, labore illum quisquam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Non libero repellendus, laboriosam error quia ullam saepe rerum id rem corporis praesentium aspernatur consequatur necessitatibus cupiditate assumenda quam enim iusto. Ut?Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, ad rem perspiciatis libero quibusdam optio alias corporis? Numquam corrupti a ea animi maxime nihil perspiciatis exercitationem harum, fugiat non cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, temporibus tenetur aut maiores porro deserunt inventore totam rerum facilis vel quasi eligendi sequi, fugiat eveniet minima sunt, labore illum quisquam.',	6,	3,	1,	'2018-02-07 16:31:26'),
(3,	'Appartement sur les quais de Seine',	'1 200 000 €',	6,	'5a7b1ca6c2e94650262850.jpg',	'Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo accusantium quidem hic quod velit, adipisci unde rem ducimus consequuntur. Libero harum repellendus corrupti non voluptatum ex natus cum minus voluptatibus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. Porro exercitationem illum repellendus. Nihil, repellat, illo natus aut, animi ex laboriosam nesciunt quam laborum quis ea distinctio rem. Quibusdam, dolorum nobis. Lorem ipsum dolor sit amet consectetur adipisicing elit. Adipisci molestias, necessitatibus ad esse laudantium quaerat odit suscipit rerum nulla delectus alias neque mollitia commodi ut saepe! Hic quidem maiores cupiditate.ntes',	4,	5,	1,	'2018-02-07 16:35:02'),
(4,	'Maison dans les champs avec piscine',	'800 000',	12,	'5a7b211cb28cf053742135.jpg',	'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente quos neque dolorum esse vel laudantium reprehenderit numquam. Cumque dolor omnis nihil inventore, officiis ipsum maiores quis maxime repellat cupiditate suscipit? Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ducimus quam obcaecati deleniti? Ipsam tenetur mollitia ullam necessitatibus dicta omnis nihil deserunt accusamus officiis, ipsum atque, inventore hic labore nemo assumenda? Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam culpa ad tempora quae esse possimus nostrum odit, quibusdam saepe dicta consectetur beatae veniam autem aliquam nisi excepturi in dolorem exercitationem. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reprehenderit vel, cupiditate, sed, quidem beatae sunt quis ipsa ullam incidunt nesciunt quod minima repellendus eveniet optio! Sit, quo modi. Voluptates, qui. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Natus itaque recusandae modi dolorem cumque possimus illum suscipit quaerat fuga nostrum, incidunt ex porro veritatis facere ipsum voluptatum quibusdam dolorum! Veritatis!',	4,	2,	1,	'2018-02-07 16:54:04');

DROP TABLE IF EXISTS `pro_proprio`;
CREATE TABLE `pro_proprio` (
  `pro_oid` int(11) NOT NULL AUTO_INCREMENT,
  `pro_prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pro_nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pro_tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pro_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `pro_proprio` (`pro_oid`, `pro_prenom`, `pro_nom`, `pro_tel`) VALUES
(1,	'Jean',	'Dujardin',	'06.07.09.08.05'),
(2,	'Emmanuel',	'Macron',	'07.06.05.04.03');

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
(4,	'Locations Garages'),
(5,	'Ventes Appartements');

-- 2018-02-08 10:25:14
