-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2023 at 09:50 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lap_autos`
--

-- --------------------------------------------------------

--
-- Table structure for table `arten`
--

CREATE TABLE `arten` (
  `idArten` int(11) NOT NULL,
  `ArtenBez` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arten`
--

INSERT INTO `arten` (`idArten`, `ArtenBez`) VALUES
(1, 'Electric'),
(2, 'Diesel'),
(3, 'Benzin'),
(4, 'Hybrid');

-- --------------------------------------------------------

--
-- Table structure for table `marken`
--

CREATE TABLE `marken` (
  `idMarken` int(11) NOT NULL,
  `MarkenBez` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marken`
--

INSERT INTO `marken` (`idMarken`, `MarkenBez`) VALUES
(1, 'VW'),
(2, 'Audi'),
(3, 'BMW'),
(4, 'Mercedes');

-- --------------------------------------------------------

--
-- Table structure for table `modelle`
--

CREATE TABLE `modelle` (
  `idModelle` int(11) NOT NULL,
  `ModelleBez` varchar(50) NOT NULL,
  `ModelleLeistung` int(11) NOT NULL,
  `ModelleTueren` int(11) NOT NULL,
  `Arten_idArten` int(11) NOT NULL,
  `Marken_idMarken` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modelle`
--

INSERT INTO `modelle` (`idModelle`, `ModelleBez`, `ModelleLeistung`, `ModelleTueren`, `Arten_idArten`, `Marken_idMarken`) VALUES
(1, 'A6', 100, 3, 3, 2),
(2, 'id4', 75, 5, 1, 1),
(3, 'M3', 75, 3, 2, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arten`
--
ALTER TABLE `arten`
  ADD PRIMARY KEY (`idArten`);

--
-- Indexes for table `marken`
--
ALTER TABLE `marken`
  ADD PRIMARY KEY (`idMarken`);

--
-- Indexes for table `modelle`
--
ALTER TABLE `modelle`
  ADD PRIMARY KEY (`idModelle`),
  ADD KEY `fk_Modelle_Arten_idx` (`Arten_idArten`),
  ADD KEY `fk_Modelle_Marken1_idx` (`Marken_idMarken`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arten`
--
ALTER TABLE `arten`
  MODIFY `idArten` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `marken`
--
ALTER TABLE `marken`
  MODIFY `idMarken` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `modelle`
--
ALTER TABLE `modelle`
  MODIFY `idModelle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `modelle`
--
ALTER TABLE `modelle`
  ADD CONSTRAINT `fk_Modelle_Arten` FOREIGN KEY (`Arten_idArten`) REFERENCES `arten` (`idArten`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Modelle_Marken1` FOREIGN KEY (`Marken_idMarken`) REFERENCES `marken` (`idMarken`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
