# ************************************************************
# Sequel Pro SQL dump
# Версия 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Адрес: 127.0.0.1 (MySQL 5.7.44)
# Схема: aomw
# Время создания: 2024-06-20 22:05:00 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Дамп таблицы platforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `platforms`;

CREATE TABLE `platforms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) DEFAULT NULL,
  `name_tag` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;

INSERT INTO `platforms` (`id`, `slide_id`, `name_tag`)
VALUES
	(1,1,'win'),
	(2,1,'mac'),
	(3,1,'linux'),
	(4,3,'win'),
	(5,2,'mac');

/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы screenshots
# ------------------------------------------------------------

DROP TABLE IF EXISTS `screenshots`;

CREATE TABLE `screenshots` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `img` text,
  `slide_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `screenshots` WRITE;
/*!40000 ALTER TABLE `screenshots` DISABLE KEYS */;

INSERT INTO `screenshots` (`id`, `img`, `slide_id`)
VALUES
	(2,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2933080/ss_23740135016488229e3966534cccd1b719d0e04c.600x338.jpg',1),
	(3,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2933080/ss_14c59a0e7ceab31dcbfc0e404f61691e79a29202.600x338.jpg',1),
	(4,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2933080/ss_246a3254ac1134f81ac07931bcfb7e5920728277.600x338.jpg',1),
	(5,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2933080/ss_93168a7bb451d0af806bfdc733d73a4114db304b.600x338.jpg',1),
	(6,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/553850/ss_0c79f56fc7be1bd0102f2ca1c92c8f0900daf4fb.600x338.jpg',2),
	(7,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/553850/ss_33e684e9cb2517af1599f0ca2b57d65ee82c2e51.600x338.jpg',2),
	(8,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/553850/ss_8949ed7dd24a02d5ea13b08fc5c04fab400dc4bd.600x338.jpg',2),
	(9,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1282100/ss_8091da48416dad9dee09ca57a912c62b20f4d171.600x338.jpg',3),
	(10,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1282100/ss_00d09f2e2cc5eee5e3af45c6f158120deb0fcef3.600x338.jpg',3),
	(11,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1282100/ss_99a1020923f500c3f8668b67a2b5e04fa6eb7558.600x338.jpg',3),
	(12,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1282100/ss_04516c2d149e9089a1950bf84a51a9f92f30559d.600x338.jpg',3);

/*!40000 ALTER TABLE `screenshots` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы slides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `slides`;

CREATE TABLE `slides` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_app` varchar(64) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `logo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;

INSERT INTO `slides` (`id`, `name_app`, `price`, `discount`, `logo`)
VALUES
	(1,'Crime Boss: Rockay City',419,20,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2933080/capsule_616x353_alt_assets_0_russian.jpg?t=1718811283'),
	(2,'Black Desert',149,NULL,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/553850/ss_50afbbc4d811c38fe9f64c1fc8d7eb9d9da6d24c.600x338.jpg'),
	(3,'REMNANT II',1299,NULL,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1282100/capsule_616x353.jpg?t=1717104501');

/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
