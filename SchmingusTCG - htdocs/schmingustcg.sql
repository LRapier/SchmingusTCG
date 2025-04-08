-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2025 at 08:47 PM
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
(1, 'test', 'test', 999999),
(2, 'poo', 'poo', 50),
(3, 'buh', 'buh', 1);

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
(1, 1, 1, 'none'),
(2, 1, 2, 'none'),
(3, 1, 3, 'none'),
(4, 1, 4, 'none'),
(5, 1, 1, 'foil'),
(6, 1, 2, 'foil'),
(7, 1, 3, 'foil'),
(8, 1, 4, 'foil'),
(9, 1, 5, 'foil'),
(10, 1, 6, 'foil'),
(11, 1, 7, 'foil'),
(12, 1, 8, 'foil'),
(13, 1, 9, 'foil'),
(14, 1, 10, 'foil'),
(15, 1, 11, 'foil'),
(16, 1, 12, 'foil'),
(17, 1, 13, 'foil'),
(18, 1, 14, 'foil'),
(19, 1, 15, 'foil'),
(20, 1, 16, 'foil'),
(21, 1, 17, 'foil'),
(22, 1, 18, 'foil'),
(23, 1, 19, 'foil'),
(24, 1, 20, 'foil'),
(25, 1, 21, 'foil'),
(26, 1, 22, 'foil'),
(27, 1, 23, 'foil'),
(28, 1, 24, 'foil'),
(29, 1, 25, 'foil'),
(30, 1, 26, 'foil'),
(31, 1, 27, 'foil'),
(32, 1, 28, 'foil'),
(33, 1, 29, 'foil'),
(34, 1, 30, 'foil'),
(35, 1, 31, 'foil'),
(36, 1, 32, 'foil'),
(37, 1, 33, 'foil'),
(38, 1, 34, 'foil'),
(39, 1, 35, 'foil'),
(40, 1, 36, 'foil'),
(41, 1, 37, 'foil'),
(42, 1, 38, 'foil'),
(43, 1, 39, 'foil'),
(44, 1, 1, 'holo'),
(45, 1, 2, 'holo'),
(46, 1, 3, 'holo'),
(47, 1, 4, 'holo'),
(48, 1, 5, 'holo'),
(49, 1, 6, 'holo'),
(50, 1, 7, 'holo'),
(51, 1, 8, 'holo'),
(52, 1, 9, 'holo'),
(53, 1, 10, 'holo'),
(54, 1, 11, 'holo'),
(55, 1, 12, 'holo'),
(56, 1, 13, 'holo'),
(57, 1, 14, 'holo'),
(58, 1, 15, 'holo'),
(59, 1, 16, 'holo'),
(60, 1, 17, 'holo'),
(61, 1, 18, 'holo'),
(62, 1, 19, 'holo'),
(63, 1, 20, 'holo'),
(64, 1, 21, 'holo'),
(65, 1, 22, 'holo'),
(66, 1, 23, 'holo'),
(67, 1, 24, 'holo'),
(68, 1, 25, 'holo'),
(69, 1, 26, 'holo'),
(70, 1, 27, 'holo'),
(71, 1, 28, 'holo'),
(72, 1, 29, 'holo'),
(73, 1, 30, 'holo'),
(74, 1, 31, 'holo'),
(75, 1, 32, 'holo'),
(76, 1, 33, 'holo'),
(77, 1, 34, 'holo'),
(78, 1, 35, 'holo'),
(79, 1, 36, 'holo'),
(80, 1, 37, 'holo'),
(81, 1, 38, 'holo'),
(82, 1, 39, 'holo'),
(83, 1, 5, 'none'),
(84, 1, 6, 'none'),
(85, 1, 7, 'none'),
(86, 1, 8, 'none'),
(87, 1, 9, 'none'),
(88, 1, 10, 'none'),
(89, 1, 11, 'none'),
(90, 1, 12, 'none'),
(91, 1, 13, 'none'),
(92, 1, 14, 'none'),
(93, 1, 15, 'none'),
(94, 1, 16, 'none'),
(95, 1, 17, 'none'),
(96, 1, 18, 'none'),
(97, 1, 19, 'none'),
(98, 1, 20, 'none'),
(99, 1, 21, 'none'),
(100, 1, 22, 'none'),
(101, 1, 23, 'none'),
(102, 1, 24, 'none'),
(103, 1, 25, 'none'),
(104, 1, 26, 'none'),
(105, 1, 27, 'none'),
(106, 1, 28, 'none'),
(107, 1, 29, 'none'),
(108, 1, 30, 'none'),
(109, 1, 31, 'none'),
(110, 1, 32, 'none'),
(111, 1, 33, 'none'),
(112, 1, 34, 'none'),
(113, 1, 35, 'none'),
(114, 1, 36, 'none'),
(115, 1, 37, 'none'),
(116, 1, 38, 'none'),
(117, 1, 39, 'none'),
(118, 3, 1, 'none'),
(119, 3, 17, 'none'),
(120, 3, 26, 'none'),
(121, 3, 12, 'none'),
(122, 3, 7, 'none'),
(123, 3, 21, 'none'),
(124, 3, 10, 'foil'),
(125, 3, 15, 'foil'),
(126, 3, 1, 'foil'),
(128, 3, 20, 'foil'),
(129, 3, 17, 'none'),
(130, 3, 23, 'none'),
(131, 3, 9, 'none'),
(133, 3, 7, 'none'),
(134, 3, 18, 'none'),
(135, 3, 1, 'none'),
(136, 3, 11, 'none'),
(137, 3, 21, 'none'),
(138, 3, 4, 'foil');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userscards`
--
ALTER TABLE `userscards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
