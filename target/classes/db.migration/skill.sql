-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 16 fév. 2022 à 13:45
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `learn`
--

-- --------------------------------------------------------

--
-- Structure de la table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `id` bigint NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `skill`
--

INSERT INTO `skill` (`id`, `code`, `libelle`) VALUES
(1, NULL, 'Reading'),
(2, NULL, 'Dancing'),
(3, NULL, 'Playing video games'),
(4, NULL, 'Listening music'),
(6, NULL, 'Sewing'),
(7, NULL, 'Cook'),
(11, NULL, 'Playing tennis'),
(12, NULL, 'Horse riding'),
(22, '', 'Doing sport'),
(23, NULL, 'Playing football'),
(25, NULL, 'Biking'),
(35, NULL, 'Travel'),
(45, NULL, 'Hunting'),
(66, NULL, 'Fishing'),
(28, NULL, 'Hiking '),
(78, NULL, 'Sailing'),
(90, NULL, 'Swimming'),
(88, NULL, 'Gardening'),
(197, NULL, 'Running'),
(109, NULL, 'Scuba diving'),
(255, NULL, 'Other');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
