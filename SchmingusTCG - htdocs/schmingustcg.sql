-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2025 at 12:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schmingustcg`
--

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `rarity` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `imgVer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `name`, `rarity`, `price`, `imgVer`) VALUES
(1, 'Schmingus', 'common', 1, 1),
(2, 'Evil Schmingus', 'uncommon', 5, 1),
(3, 'Rainbow Schmingus', 'mythical', 5000, 1),
(4, 'Golden Schmingus', 'epic', 500, 1),
(5, 'Invisible Schmingus', 'rare', 50, 1),
(6, 'Big Schmingus', 'legendary', 1000, 1),
(7, 'Beeboo', 'common', 1, 1),
(8, 'Cargee', 'common', 1, 1),
(9, 'Geepy', 'common', 1, 1),
(10, 'Schmeepy', 'common', 1, 1),
(11, 'Skybo', 'uncommon', 5, 1),
(12, 'Spleep', 'common', 1, 1),
(13, 'Yepmo', 'common', 1, 1),
(14, 'Wizard Beeboo', 'uncommon', 5, 1),
(15, 'Wizard Cargee', 'uncommon', 5, 1),
(16, 'Wizard Geepy', 'uncommon', 5, 1),
(17, 'Wizard Schmeepy', 'uncommon', 5, 1),
(18, 'Wizard Schmingus', 'uncommon', 5, 1),
(19, 'Wizard Skybo', 'rare', 50, 1),
(20, 'Wizard Spleep', 'uncommon', 5, 1),
(21, 'Wizard Yepmo', 'uncommon', 5, 1),
(22, 'Rat Beeboo', 'rare', 50, 1),
(23, 'Rat Cargee', 'rare', 50, 1),
(24, 'Rat Geepy', 'rare', 50, 1),
(25, 'Rat Schmeepy', 'rare', 50, 1),
(26, 'Rat Schmingus', 'rare', 50, 1),
(27, 'Rat Skybo', 'epic', 500, 1),
(28, 'Rat Spleep', 'rare', 50, 1),
(29, 'Rat Yepmo', 'rare', 50, 1),
(30, 'S-Blob', 'epic', 500, 1),
(31, 'Batgus', 'rare', 50, 1),
(32, 'Nightgus', 'rare', 50, 1),
(33, 'Oragus', 'epic', 500, 1),
(34, 'Rehoogus', 'rare', 50, 1),
(35, 'Rerobgus', 'rare', 50, 1),
(36, 'Spoigus', 'epic', 500, 1),
(37, 'Orphgus', 'epic', 500, 1),
(38, 'Robgus', 'rare', 50, 1),
(39, 'Sigus', 'epic', 500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `money`) VALUES
(1, 'test', 'test', 369),
(2, 'poo', 'poo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `userscards`
--

CREATE TABLE `userscards` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `cardid` int(11) NOT NULL,
  `edition` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userscards`
--

INSERT INTO `userscards` (`id`, `userid`, `cardid`, `edition`) VALUES
(1, 1, 22, 'holo'),
(2, 1, 16, 'none'),
(3, 1, 7, 'none'),
(4, 1, 15, 'none'),
(5, 1, 13, 'none'),
(6, 1, 9, 'none'),
(7, 1, 14, 'none'),
(8, 1, 6, 'foil'),
(9, 1, 7, 'holo'),
(10, 1, 18, 'none'),
(11, 1, 14, 'none'),
(12, 1, 4, 'none'),
(13, 1, 7, 'none'),
(14, 1, 9, 'none'),
(15, 1, 17, 'holo'),
(16, 1, 18, 'foil'),
(17, 1, 20, 'none'),
(18, 1, 29, 'none'),
(19, 1, 12, 'none'),
(20, 1, 16, 'none'),
(21, 1, 9, 'none'),
(22, 1, 7, 'none'),
(23, 1, 24, 'none'),
(24, 1, 14, 'holo'),
(25, 1, 37, 'foil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userscards`
--
ALTER TABLE `userscards`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userscards`
--
ALTER TABLE `userscards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
