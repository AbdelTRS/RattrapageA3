-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 23 juil. 2022 à 10:21
-- Version du serveur : 5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rattrapages`
--

-- --------------------------------------------------------

--
-- Structure de la table `athletes`
--

CREATE TABLE `athletes` (
  `id` int(11) NOT NULL,
  `athlete_name` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `athletes`
--

INSERT INTO `athletes` (`id`, `athlete_name`, `country`) VALUES
(1, 'Michael Phelps', 'Etats-unis'),
(2, 'Jenny Thompson', 'Etats-unis'),
(3, 'Ryan Lotche', 'Etats-unis'),
(7, 'Nikolai Andrianov', 'Union soviétique'),
(8, 'Boris Shakhlin', 'Union soviétique'),
(9, 'Takashi Ono', 'Japon');

-- --------------------------------------------------------

--
-- Structure de la table `sports`
--

CREATE TABLE `sports` (
  `id` int(11) NOT NULL,
  `sport_name` varchar(30) NOT NULL,
  `athlete_1` int(11) NOT NULL,
  `athlete_2` int(11) NOT NULL,
  `athlete_3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sports`
--

INSERT INTO `sports` (`id`, `sport_name`, `athlete_1`, `athlete_2`, `athlete_3`) VALUES
(1, 'Natation', 1, 2, 3),
(2, 'Gymnastique', 7, 8, 9);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `athletes`
--
ALTER TABLE `athletes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `athlete_1` (`athlete_1`),
  ADD KEY `athlete_2` (`athlete_2`),
  ADD KEY `athlete_3` (`athlete_3`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `athletes`
--
ALTER TABLE `athletes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `sports`
--
ALTER TABLE `sports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `sports`
--
ALTER TABLE `sports`
  ADD CONSTRAINT `sports_ibfk_1` FOREIGN KEY (`athlete_1`) REFERENCES `athletes` (`id`),
  ADD CONSTRAINT `sports_ibfk_2` FOREIGN KEY (`athlete_2`) REFERENCES `athletes` (`id`),
  ADD CONSTRAINT `sports_ibfk_3` FOREIGN KEY (`athlete_3`) REFERENCES `athletes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
