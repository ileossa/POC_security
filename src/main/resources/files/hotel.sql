-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Dim 18 Juin 2017 à 22:08
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

CREATE TABLE `book` (
  `Id_book` int(11) NOT NULL,
  `Date_book` datetime NOT NULL,
  `Date_start` date NOT NULL,
  `Date_end` date NOT NULL,
  `People_number` int(11) DEFAULT NULL,
  `Price` float NOT NULL,
  `Payment_mode` varchar(25) DEFAULT NULL,
  `Hour_start` time DEFAULT NULL,
  `Id_client` int(11) NOT NULL,
  `Id_partyRoom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `book_room`
--

CREATE TABLE `book_room` (
  `Id_room` int(11) NOT NULL,
  `Id_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `book_table`
--

CREATE TABLE `book_table` (
  `Id_book` int(11) NOT NULL,
  `Id_table` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `Id_client` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Firstname` varchar(25) NOT NULL,
  `Birthday` date DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(25) DEFAULT NULL,
  `Country` varchar(25) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `Address` varchar(25) DEFAULT NULL,
  `Postal_code` varchar(50) DEFAULT NULL,
  `Password` varchar(30) NOT NULL,
  `Status` int(2) DEFAULT NULL,
  `Token` varchar(50) DEFAULT NULL,
  `Token_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`Id_client`, `Name`, `Firstname`, `Birthday`, `Email`, `Phone`, `Country`, `City`, `Address`, `Postal_code`, `Password`, `Status`, `Token`, `Token_date`) VALUES
(14, 'mollard', 'toto', '1993-09-16', 'tefzt@hotmail.fr', '0102030406', 'france', 'Paris', '70 rue toto', '75015', 'test_5', 0, '94f0a248-061d-4f63-afcd-1c67ad6372a8', '2017-06-18 02:51:43'),
(15, 'mollard', 'toto', '1993-09-16', 'tefzt@hotmail.fr', '0102030406', 'france', 'Paris', '70 rue toto', '75015', 'test_available', 0, NULL, NULL),
(16, 'mollard', 'toto', '1993-09-16', 'tefzt@hotmail.fr', '0102030406', 'france', 'Paris', '70 rue toto', '75015', 'test_available', 0, NULL, NULL),
(17, 'mollard', 'toto', '1993-09-16', 'tefzt@hotmail.fr', '0102030406', 'france', 'Paris', '70 rue toto', '75015', 'test_available', 0, NULL, NULL),
(18, 'test01', 'test01', '2017-06-02', 'test01@hotmail.fr', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test01', 0, NULL, NULL),
(19, 'test06', 'test06', '1993-09-15', 'test06@hg.com', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test060', 0, NULL, NULL),
(20, 'test06', 'test06', '1993-09-14', 'test06@hg.com', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test060', 0, NULL, NULL),
(21, 'test06', 'test06', '1993-09-15', 'test06@gr.test', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test060', 0, NULL, NULL),
(22, 'test06', 'test06', '1993-09-15', 'test06@gr.test', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test060', 0, NULL, NULL),
(23, 'test06', 'test06', '1993-09-15', 'test060@gr.test', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test060', 0, NULL, NULL),
(24, 'test06', 'test06', '1993-09-15', 'test0060@gr.test', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test060', 0, NULL, NULL),
(25, 'test06', 'test06', '1996-09-15', 'test00610@gr.test', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test060', 0, NULL, NULL),
(26, 'mollard', 'maxime', '1993-09-15', 'mollard.maxime@hotmail.fr', '0644280794', 'France', 'paris', '70 rue cambronne', '75015', 'azerty', 0, NULL, NULL),
(27, 'test06', 'test06', '1993-09-15', 'test046@gmail.com', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test0601', 0, NULL, NULL),
(28, 'test06', 'test06', '1993-09-15', 'test0046@gmail.com', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test0601', 0, NULL, NULL),
(29, 'test06', 'test06', '1993-09-15', 'test064545@gmail.com', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test060', 0, NULL, NULL),
(30, 'test08', 'test08', '1993-09-15', 'test08@hotmail.fr', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test080', 0, NULL, NULL),
(31, 'test09', 'test09', '1933-09-15', 'test09@gji.com', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test090', 0, NULL, NULL),
(32, 'test10', 'test10', '1993-09-15', 'test10@gd.cm', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test100', 0, NULL, NULL),
(33, 'test11', 'test11', '1993-09-15', 'test11@gmail.com', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test110', 0, NULL, NULL),
(34, 'test055', 'test055', '1993-09-15', 'test055@gmail.com', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'test0552', 0, '70c3dff6-7490-440f-8ffd-ff57e31db1cd', '2017-06-18 17:26:51'),
(35, 'maxime', 'mollard', '1993-09-15', 'momo@hotmail.fr', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'FEhFx3MczCc=', 0, NULL, NULL),
(36, 'test55', 'test55', '1993-09-15', 'test55@hotmail.fr', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'iYBKErJnwyo=', 0, NULL, NULL),
(37, 'test66', 'test66', '1993-09-11', 'test66@hotmail.fr', '644280794', 'France', 'paris', '70 rue cambronne', '75015', 'ifCbfYr5iRk=', 0, NULL, NULL),
(38, 'test_update', 'test_update', '1993-09-16', 'test_update@hotmail.fr', '0102030406', 'france', 'Paris', '70 rue toto', '75015', 'Zmm5n99S5AIbbWz/mHa1gg==', 0, NULL, NULL),
(39, 'test_update', 'test_update', '1993-09-16', 'test_update1@hotmail.fr', '00', 'TEST', 'TEST', '70 rue toto', '75015', 'Zmm5n99S5AIbbWz/mHa1gg==', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

CREATE TABLE `room` (
  `Id_room` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Building` varchar(25) NOT NULL,
  `Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `salledefetes`
--

CREATE TABLE `salledefetes` (
  `Id_partyRoom` int(11) NOT NULL,
  `Event` varchar(35) NOT NULL,
  `Number_chairs` int(11) DEFAULT NULL,
  `Number_tables` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `table_restaurant`
--

CREATE TABLE `table_restaurant` (
  `Id_table` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Place_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Id_book`),
  ADD KEY `FK_book_Id_client` (`Id_client`),
  ADD KEY `FK_book_Id_partyRoom` (`Id_partyRoom`);

--
-- Index pour la table `book_room`
--
ALTER TABLE `book_room`
  ADD PRIMARY KEY (`Id_room`,`Id_book`),
  ADD KEY `FK_book_room_Id_book` (`Id_book`);

--
-- Index pour la table `book_table`
--
ALTER TABLE `book_table`
  ADD PRIMARY KEY (`Id_book`,`Id_table`),
  ADD KEY `FK_book_table_Id_table` (`Id_table`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Id_client`);

--
-- Index pour la table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Id_room`);

--
-- Index pour la table `salledefetes`
--
ALTER TABLE `salledefetes`
  ADD PRIMARY KEY (`Id_partyRoom`);

--
-- Index pour la table `table_restaurant`
--
ALTER TABLE `table_restaurant`
  ADD PRIMARY KEY (`Id_table`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `book`
--
ALTER TABLE `book`
  MODIFY `Id_book` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `Id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT pour la table `room`
--
ALTER TABLE `room`
  MODIFY `Id_room` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `salledefetes`
--
ALTER TABLE `salledefetes`
  MODIFY `Id_partyRoom` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `table_restaurant`
--
ALTER TABLE `table_restaurant`
  MODIFY `Id_table` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_book_Id_client` FOREIGN KEY (`Id_client`) REFERENCES `client` (`Id_client`),
  ADD CONSTRAINT `FK_book_Id_partyRoom` FOREIGN KEY (`Id_partyRoom`) REFERENCES `salledefetes` (`Id_partyRoom`);

--
-- Contraintes pour la table `book_room`
--
ALTER TABLE `book_room`
  ADD CONSTRAINT `FK_book_room_Id_book` FOREIGN KEY (`Id_book`) REFERENCES `book` (`Id_book`),
  ADD CONSTRAINT `FK_book_room_Id_room` FOREIGN KEY (`Id_room`) REFERENCES `room` (`Id_room`);

--
-- Contraintes pour la table `book_table`
--
ALTER TABLE `book_table`
  ADD CONSTRAINT `FK_book_table_Id_book` FOREIGN KEY (`Id_book`) REFERENCES `book` (`Id_book`),
  ADD CONSTRAINT `FK_book_table_Id_table` FOREIGN KEY (`Id_table`) REFERENCES `table_restaurant` (`Id_table`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
