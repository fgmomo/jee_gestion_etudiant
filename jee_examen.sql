-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 06 juin 2024 à 18:29
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `jee_examen`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
CREATE TABLE IF NOT EXISTS `etudiants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`id`, `prenom`, `nom`, `email`, `adresse`, `telephone`) VALUES
(1, 'Mohamed', 'Kone', 'KONEMOHAMEDFLO@GMAIL.COM', 'Attbougou 1008 lgmtS', '91240633'),
(2, 'Kadiatou', 'Cisse', 'DIKA@GMAIL.COM', 'Yirimadio', '43234333'),
(12, 'Mohamed', 'Kone', 'KONEMHAMEDFLO@GMAIL.COM', 'Attbougou 1008 lgmtS', '91243063'),
(11, 'KONE', 'Moh', 'LO@GMAIL.COM', 'Attbougou 1008', '912406344');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `prenom`, `nom`, `email`, `password`) VALUES
(1, 'Mohamed', 'Kone', 'KONEMOHAMEDFLO@GMAIL.COM', '$2a$10$HDRpOEqYj3o2FQbe47s5.e7zeKzNxUUS0xvGREznszZ4S4Y1Kq4z6'),
(2, 'Mohamed', 'Kone', 'KONEMOHAMEDFO@GMAIL.COM', '$2a$10$2f910F0saIuU4wrunFdlE.xgyosq4uhJ.0a4Pd5UNuF5NdRJh8dYu'),
(3, 'Hamed', 'Boundy', 'hamed@gmail.com', '$2a$10$ST3u6AVwiBEAFq/8LmNaLuVIQDaLdYTBfudXL2OU5gBgf9PqVfnqu');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
