-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2025 at 07:44 AM
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
  `imgVer` int(11) NOT NULL,
  `cardpack` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `name`, `rarity`, `price`, `imgVer`, `cardpack`) VALUES
(1, 'Schmingus', 'common', 5, 3, 'Schmingus'),
(2, 'Beeboo', 'common', 5, 3, 'Beeboo'),
(3, 'Cargee', 'common', 5, 3, 'Cargee'),
(4, 'Geepy', 'common', 5, 3, 'Geepy'),
(5, 'Schmeepy', 'common', 5, 3, 'Schmeepy'),
(6, 'Skybo', 'common', 5, 3, 'Skybo'),
(7, 'Spleep', 'common', 5, 3, 'Spleep'),
(8, 'Yepmo', 'common', 5, 3, 'Yepmo'),
(9, 'Evil Schmingus', 'uncommon', 10, 3, 'Schmingus'),
(10, 'Invisible Schmingus', 'rare', 50, 3, 'Schmingus'),
(11, 'Rainbow Schmingus', 'mythical', 5000, 3, 'Schmingus'),
(12, 'S-Blob', 'epic', 500, 3, 'Schmingus'),
(13, 'Nightbo', 'mythical', 5000, 3, 'Skybo'),
(14, 'Wizard Beeboo', 'uncommon', 10, 3, 'Beeboo'),
(15, 'Wizard Cargee', 'uncommon', 10, 3, 'Cargee'),
(16, 'Wizard Geepy', 'uncommon', 10, 3, 'Geepy'),
(17, 'Wizard Schmeepy', 'uncommon', 10, 3, 'Schmeepy'),
(18, 'Wizard Schmingus', 'uncommon', 10, 3, 'Schmingus'),
(19, 'Wizard Skybo', 'uncommon', 10, 3, 'Skybo'),
(20, 'Wizard Spleep', 'uncommon', 10, 3, 'Spleep'),
(21, 'Wizard Yepmo', 'uncommon', 10, 3, 'Yepmo'),
(22, 'Rat Beeboo', 'uncommon', 10, 3, 'Beeboo'),
(23, 'Rat Cargee', 'uncommon', 10, 3, 'Cargee'),
(24, 'Rat Geepy', 'uncommon', 10, 3, 'Geepy'),
(25, 'Rat Schmeepy', 'uncommon', 10, 3, 'Schmeepy'),
(26, 'Rat Schmingus', 'uncommon', 10, 3, 'Schmingus'),
(27, 'Rat Skybo', 'uncommon', 10, 3, 'Skybo'),
(28, 'Rat Spleep', 'uncommon', 10, 3, 'Spleep'),
(29, 'Rat Yepmo', 'uncommon', 10, 3, 'Yepmo'),
(30, 'Batgus', 'rare', 50, 3, 'Schmingus'),
(31, 'Nightgus', 'rare', 50, 3, 'Schmingus'),
(32, 'Oragus', 'epic', 500, 3, 'Schmingus'),
(33, 'Rehoogus', 'rare', 50, 3, 'Schmingus'),
(34, 'Rerobgus', 'rare', 50, 3, 'Schmingus'),
(35, 'Spoigus', 'epic', 500, 3, 'Schmingus'),
(36, 'Orphgus', 'epic', 500, 3, 'Schmingus'),
(37, 'Robgus', 'rare', 50, 3, 'Schmingus'),
(38, 'Sigus', 'epic', 500, 3, 'Schmingus'),
(39, 'Wuboo', 'legendary', 1000, 3, 'Beeboo'),
(40, 'Ariboo', 'epic', 500, 3, 'Beeboo'),
(41, 'Colboo', 'rare', 50, 3, 'Beeboo'),
(42, 'Jayboo', 'rare', 50, 3, 'Beeboo'),
(43, 'Kaiboo', 'rare', 50, 3, 'Beeboo'),
(44, 'Lloyboo', 'rare', 50, 3, 'Beeboo'),
(45, 'Nyboo', 'rare', 50, 3, 'Beeboo'),
(46, 'Pixboo', 'epic', 500, 3, 'Beeboo'),
(47, 'Sorboo', 'epic', 500, 3, 'Beeboo'),
(48, 'Wyldboo', 'epic', 500, 3, 'Beeboo'),
(49, 'Zanboo', 'rare', 50, 3, 'Beeboo'),
(50, 'Gold Schmingus', 'epic', 500, 3, 'Schmingus'),
(51, 'Rose Gold Beeboo', 'epic', 500, 3, 'Beeboo'),
(52, 'Ruby Cargee', 'epic', 500, 3, 'Cargee'),
(53, 'Copper Geepy', 'epic', 500, 3, 'Geepy'),
(54, 'Silver Schmeepy', 'epic', 500, 3, 'Schmeepy'),
(55, 'Obsidian Skybo', 'epic', 500, 3, 'Skybo'),
(56, 'Platinum Spleep', 'epic', 500, 3, 'Spleep'),
(57, 'Diamond Yepmo', 'epic', 500, 3, 'Yepmo'),
(58, 'Fancy Schmingus', 'uncommon', 10, 3, 'Schmingus'),
(59, 'Fancy Beeboo', 'uncommon', 10, 3, 'Beeboo'),
(60, 'Fancy Cargee', 'uncommon', 10, 3, 'Cargee'),
(61, 'Fancy Geepy', 'uncommon', 10, 3, 'Geepy'),
(62, 'Fancy Schmeepy', 'uncommon', 10, 3, 'Schmeepy'),
(63, 'Fancy Skybo', 'uncommon', 10, 3, 'Skybo'),
(64, 'Fancy Spleep', 'uncommon', 10, 3, 'Spleep'),
(65, 'Fancy Yepmo', 'uncommon', 10, 3, 'Yepmo'),
(66, 'sugnimhcS', 'rare', 50, 3, 'Schmingus'),
(67, 'oobeeB', 'rare', 50, 3, 'Beeboo'),
(68, 'eegraC', 'rare', 50, 3, 'Cargee'),
(69, 'ypeeG', 'rare', 50, 3, 'Geepy'),
(70, 'ypeemhcS', 'rare', 50, 3, 'Schmeepy'),
(71, 'obykS', 'rare', 50, 3, 'Skybo'),
(72, 'peelpS', 'rare', 50, 3, 'Spleep'),
(73, 'ompeY', 'rare', 50, 3, 'Yepmo'),
(74, 'Pixel Schmingus', 'uncommon', 10, 3, 'Schmingus'),
(75, 'Pixel Beeboo', 'uncommon', 10, 3, 'Beeboo'),
(76, 'Pixel Cargee', 'uncommon', 10, 3, 'Cargee'),
(77, 'Pixel Geepy', 'uncommon', 10, 3, 'Geepy'),
(78, 'Pixel Schmeepy', 'uncommon', 10, 3, 'Schmeepy'),
(79, 'Pixel Skybo', 'rare', 50, 3, 'Skybo'),
(80, 'Pixel Spleep', 'uncommon', 10, 3, 'Spleep'),
(81, 'Pixel Yepmo', 'uncommon', 10, 3, 'Yepmo'),
(82, 'Chickgee', 'rare', 50, 3, 'Cargee'),
(83, 'Cowgee', 'rare', 50, 3, 'Cargee'),
(84, 'Creegee', 'epic', 500, 3, 'Cargee'),
(85, 'Endergee', 'rare', 50, 3, 'Cargee'),
(86, 'Pigee', 'rare', 50, 3, 'Cargee'),
(87, 'Sheegee', 'rare', 50, 3, 'Cargee'),
(88, 'Skelegee', 'rare', 50, 3, 'Cargee'),
(89, 'Spidgee', 'rare', 50, 3, 'Cargee'),
(90, 'Stevgee', 'epic', 500, 3, 'Cargee'),
(91, 'Villagee', 'rare', 50, 3, 'Cargee'),
(92, 'Big Schmingus', 'legendary', 1000, 3, 'Schmingus'),
(93, 'Big Beeboo', 'legendary', 1000, 3, 'Beeboo'),
(94, 'Big Cargee', 'legendary', 1000, 3, 'Cargee'),
(95, 'Big Geepy', 'legendary', 1000, 3, 'geepy'),
(96, 'Big Schmeepy', 'legendary', 1000, 3, 'Schmeepy'),
(97, 'Big Skybo', 'legendary', 1000, 3, 'Skybo'),
(98, 'Big Spleep', 'legendary', 1000, 3, 'Spleep'),
(99, 'Big Yepmo', 'legendary', 1000, 3, 'Yepmo'),
(100, 'Big Evil Schmingus', 'mythic', 5000, 3, 'Schmingus');

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
(1, 'test', 'test', 998949),
(2, 'poo', 'poo', 10),
(3, 'buh', 'buh', 1),
(4, 'p', 'p', 50),
(5, 'pee', 'pee', 22),
(6, 'test2', 'test2', 10);

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
(5, 1, 5, 'none'),
(6, 1, 6, 'none'),
(7, 1, 7, 'none'),
(8, 1, 8, 'none'),
(9, 1, 9, 'none'),
(10, 1, 10, 'none'),
(11, 1, 11, 'none'),
(12, 1, 12, 'none'),
(13, 1, 13, 'none'),
(14, 1, 14, 'none'),
(15, 1, 15, 'none'),
(16, 1, 16, 'none'),
(17, 1, 17, 'none'),
(18, 1, 18, 'none'),
(19, 1, 19, 'none'),
(20, 1, 20, 'none'),
(21, 1, 21, 'none'),
(22, 1, 22, 'none'),
(23, 1, 23, 'none'),
(24, 1, 24, 'none'),
(25, 1, 25, 'none'),
(26, 1, 26, 'none'),
(27, 1, 27, 'none'),
(28, 1, 28, 'none'),
(29, 1, 29, 'none'),
(30, 1, 30, 'none'),
(31, 1, 31, 'none'),
(32, 1, 32, 'none'),
(33, 1, 33, 'none'),
(34, 1, 34, 'none'),
(35, 1, 35, 'none'),
(36, 1, 36, 'none'),
(37, 1, 37, 'none'),
(38, 1, 38, 'none'),
(39, 1, 39, 'none'),
(40, 1, 40, 'none'),
(41, 1, 41, 'none'),
(42, 1, 42, 'none'),
(43, 1, 43, 'none'),
(44, 1, 44, 'none'),
(45, 1, 45, 'none'),
(46, 1, 46, 'none'),
(47, 1, 47, 'none'),
(48, 1, 48, 'none'),
(49, 1, 49, 'none'),
(50, 1, 50, 'none'),
(51, 1, 51, 'none'),
(52, 1, 52, 'none'),
(53, 1, 53, 'none'),
(54, 1, 54, 'none'),
(55, 1, 55, 'none'),
(56, 1, 56, 'none'),
(57, 1, 57, 'none'),
(58, 1, 58, 'none'),
(59, 1, 59, 'none'),
(60, 1, 60, 'none'),
(61, 1, 61, 'none'),
(62, 1, 62, 'none'),
(63, 1, 63, 'none'),
(64, 1, 64, 'none'),
(65, 1, 65, 'none'),
(66, 1, 66, 'none'),
(67, 1, 67, 'none'),
(68, 1, 68, 'none'),
(69, 1, 69, 'none'),
(70, 1, 70, 'none'),
(71, 1, 71, 'none'),
(72, 1, 72, 'none'),
(73, 1, 73, 'none'),
(74, 1, 74, 'none'),
(75, 1, 75, 'none'),
(76, 1, 76, 'none'),
(77, 1, 77, 'none'),
(78, 1, 78, 'none'),
(79, 1, 79, 'none'),
(80, 1, 80, 'none'),
(81, 1, 81, 'none'),
(82, 1, 82, 'none'),
(83, 1, 83, 'none'),
(84, 1, 84, 'none'),
(85, 1, 85, 'none'),
(86, 1, 86, 'none'),
(87, 1, 87, 'none'),
(88, 1, 88, 'none'),
(89, 1, 89, 'none'),
(90, 1, 90, 'none'),
(91, 1, 91, 'none'),
(92, 1, 92, 'none'),
(93, 1, 93, 'none'),
(94, 1, 94, 'none'),
(95, 1, 95, 'none'),
(96, 1, 96, 'none'),
(97, 1, 97, 'none'),
(98, 1, 98, 'none'),
(99, 1, 99, 'none'),
(100, 1, 100, 'none'),
(101, 1, 1, 'foil'),
(102, 1, 2, 'foil'),
(103, 1, 3, 'foil'),
(104, 1, 4, 'foil'),
(105, 1, 5, 'foil'),
(106, 1, 6, 'foil'),
(107, 1, 7, 'foil'),
(108, 1, 8, 'foil'),
(109, 1, 9, 'foil'),
(110, 1, 10, 'foil'),
(111, 1, 11, 'foil'),
(112, 1, 12, 'foil'),
(113, 1, 13, 'foil'),
(114, 1, 14, 'foil'),
(115, 1, 15, 'foil'),
(116, 1, 16, 'foil'),
(117, 1, 17, 'foil'),
(118, 1, 18, 'foil'),
(119, 1, 19, 'foil'),
(120, 1, 20, 'foil'),
(121, 1, 21, 'foil'),
(122, 1, 22, 'foil'),
(123, 1, 23, 'foil'),
(124, 1, 24, 'foil'),
(125, 1, 25, 'foil'),
(126, 1, 26, 'foil'),
(127, 1, 27, 'foil'),
(128, 1, 28, 'foil'),
(129, 1, 29, 'foil'),
(130, 1, 30, 'foil'),
(131, 1, 31, 'foil'),
(132, 1, 32, 'foil'),
(133, 1, 33, 'foil'),
(134, 1, 34, 'foil'),
(135, 1, 35, 'foil'),
(136, 1, 36, 'foil'),
(137, 1, 37, 'foil'),
(138, 1, 38, 'foil'),
(139, 1, 39, 'foil'),
(140, 1, 40, 'foil'),
(141, 1, 41, 'foil'),
(142, 1, 42, 'foil'),
(143, 1, 43, 'foil'),
(144, 1, 44, 'foil'),
(145, 1, 45, 'foil'),
(146, 1, 46, 'foil'),
(147, 1, 47, 'foil'),
(148, 1, 48, 'foil'),
(149, 1, 49, 'foil'),
(150, 1, 50, 'foil'),
(151, 1, 51, 'foil'),
(152, 1, 52, 'foil'),
(153, 1, 53, 'foil'),
(154, 1, 54, 'foil'),
(155, 1, 55, 'foil'),
(156, 1, 56, 'foil'),
(157, 1, 57, 'foil'),
(158, 1, 58, 'foil'),
(159, 1, 59, 'foil'),
(160, 1, 60, 'foil'),
(161, 1, 61, 'foil'),
(162, 1, 62, 'foil'),
(163, 1, 63, 'foil'),
(164, 1, 64, 'foil'),
(165, 1, 65, 'foil'),
(166, 1, 66, 'foil'),
(167, 1, 67, 'foil'),
(168, 1, 68, 'foil'),
(169, 1, 69, 'foil'),
(170, 1, 70, 'foil'),
(171, 1, 71, 'foil'),
(172, 1, 72, 'foil'),
(173, 1, 73, 'foil'),
(174, 1, 74, 'foil'),
(175, 1, 75, 'foil'),
(176, 1, 76, 'foil'),
(177, 1, 77, 'foil'),
(178, 1, 78, 'foil'),
(179, 1, 79, 'foil'),
(180, 1, 80, 'foil'),
(181, 1, 81, 'foil'),
(182, 1, 82, 'foil'),
(183, 1, 83, 'foil'),
(184, 1, 84, 'foil'),
(185, 1, 85, 'foil'),
(186, 1, 86, 'foil'),
(187, 1, 87, 'foil'),
(188, 1, 88, 'foil'),
(189, 1, 89, 'foil'),
(190, 1, 90, 'foil'),
(191, 1, 91, 'foil'),
(192, 1, 92, 'foil'),
(193, 1, 93, 'foil'),
(194, 1, 94, 'foil'),
(195, 1, 95, 'foil'),
(196, 1, 96, 'foil'),
(197, 1, 97, 'foil'),
(198, 1, 98, 'foil'),
(199, 1, 99, 'foil'),
(200, 1, 100, 'foil'),
(201, 1, 1, 'holo'),
(202, 1, 2, 'holo'),
(203, 1, 3, 'holo'),
(204, 1, 4, 'holo'),
(205, 1, 5, 'holo'),
(206, 1, 6, 'holo'),
(207, 1, 7, 'holo'),
(208, 1, 8, 'holo'),
(209, 1, 9, 'holo'),
(210, 1, 10, 'holo'),
(211, 1, 11, 'holo'),
(212, 1, 12, 'holo'),
(213, 1, 13, 'holo'),
(214, 1, 14, 'holo'),
(215, 1, 15, 'holo'),
(216, 1, 16, 'holo'),
(217, 1, 17, 'holo'),
(218, 1, 18, 'holo'),
(219, 1, 19, 'holo'),
(220, 1, 20, 'holo'),
(221, 1, 21, 'holo'),
(222, 1, 22, 'holo'),
(223, 1, 23, 'holo'),
(224, 1, 24, 'holo'),
(225, 1, 25, 'holo'),
(226, 1, 26, 'holo'),
(227, 1, 27, 'holo'),
(228, 1, 28, 'holo'),
(229, 1, 29, 'holo'),
(230, 1, 30, 'holo'),
(231, 1, 31, 'holo'),
(232, 1, 32, 'holo'),
(233, 1, 33, 'holo'),
(234, 1, 34, 'holo'),
(235, 1, 35, 'holo'),
(236, 1, 36, 'holo'),
(237, 1, 37, 'holo'),
(238, 1, 38, 'holo'),
(239, 1, 39, 'holo'),
(240, 1, 40, 'holo'),
(241, 1, 41, 'holo'),
(242, 1, 42, 'holo'),
(243, 1, 43, 'holo'),
(244, 1, 44, 'holo'),
(245, 1, 45, 'holo'),
(246, 1, 46, 'holo'),
(247, 1, 47, 'holo'),
(248, 1, 48, 'holo'),
(249, 1, 49, 'holo'),
(250, 1, 50, 'holo'),
(251, 1, 51, 'holo'),
(252, 1, 52, 'holo'),
(253, 1, 53, 'holo'),
(254, 1, 54, 'holo'),
(255, 1, 55, 'holo'),
(256, 1, 56, 'holo'),
(257, 1, 57, 'holo'),
(258, 1, 58, 'holo'),
(259, 1, 59, 'holo'),
(260, 1, 60, 'holo'),
(261, 1, 61, 'holo'),
(262, 1, 62, 'holo'),
(263, 1, 63, 'holo'),
(264, 1, 64, 'holo'),
(265, 1, 65, 'holo'),
(266, 1, 66, 'holo'),
(267, 1, 67, 'holo'),
(268, 1, 68, 'holo'),
(269, 1, 69, 'holo'),
(270, 1, 70, 'holo'),
(271, 1, 71, 'holo'),
(272, 1, 72, 'holo'),
(273, 1, 73, 'holo'),
(274, 1, 74, 'holo'),
(275, 1, 75, 'holo'),
(276, 1, 76, 'holo'),
(277, 1, 77, 'holo'),
(278, 1, 78, 'holo'),
(279, 1, 79, 'holo'),
(280, 1, 80, 'holo'),
(281, 1, 81, 'holo'),
(282, 1, 82, 'holo'),
(283, 1, 83, 'holo'),
(284, 1, 84, 'holo'),
(285, 1, 85, 'holo'),
(286, 1, 86, 'holo'),
(287, 1, 87, 'holo'),
(288, 1, 88, 'holo'),
(289, 1, 89, 'holo'),
(290, 1, 90, 'holo'),
(291, 1, 91, 'holo'),
(292, 1, 92, 'holo'),
(293, 1, 93, 'holo'),
(294, 1, 94, 'holo'),
(295, 1, 95, 'holo'),
(296, 1, 96, 'holo'),
(297, 1, 97, 'holo'),
(298, 1, 98, 'holo'),
(299, 1, 99, 'holo'),
(300, 1, 100, 'holo'),
(344, 2, 74, 'none'),
(345, 2, 10, 'none'),
(346, 2, 58, 'none'),
(347, 2, 1, 'foil'),
(348, 2, 1, 'none'),
(349, 2, 36, 'none'),
(350, 2, 33, 'none'),
(351, 2, 92, 'foil'),
(352, 2, 10, 'none'),
(354, 2, 1, 'none'),
(355, 2, 18, 'none'),
(356, 2, 36, 'none'),
(357, 2, 1, 'none'),
(358, 2, 74, 'holo'),
(359, 2, 59, 'none'),
(360, 2, 2, 'holo'),
(361, 2, 2, 'holo'),
(362, 2, 31, 'none'),
(363, 2, 1, 'foil'),
(365, 2, 2, 'none'),
(367, 2, 2, 'foil'),
(368, 2, 3, 'none'),
(369, 2, 63, 'none'),
(370, 2, 5, 'none'),
(371, 2, 7, 'foil'),
(372, 2, 20, 'none'),
(373, 2, 80, 'holo'),
(374, 2, 73, 'none'),
(375, 2, 8, 'none'),
(376, 2, 57, 'foil'),
(377, 2, 5, 'none'),
(378, 2, 1, 'none'),
(379, 2, 1, 'none'),
(380, 2, 75, 'none'),
(381, 2, 2, 'foil'),
(382, 2, 2, 'none'),
(383, 2, 29, 'none'),
(384, 2, 8, 'none'),
(385, 2, 73, 'none'),
(387, 2, 7, 'none'),
(388, 2, 20, 'none'),
(392, 2, 3, 'none'),
(393, 2, 57, 'none'),
(394, 2, 1, 'none'),
(395, 2, 43, 'none'),
(404, 6, 66, 'none'),
(405, 6, 81, 'none'),
(406, 6, 8, 'holo'),
(407, 6, 3, 'foil'),
(408, 6, 76, 'none'),
(409, 6, 60, 'none'),
(410, 6, 6, 'none'),
(411, 6, 4, 'none');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `userscards`
--
ALTER TABLE `userscards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
