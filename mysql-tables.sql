-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2023 at 01:03 AM
-- Server version: 8.1.0
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pulse`
--

-- --------------------------------------------------------

--
-- Table structure for table `aggregated_data`
--

CREATE TABLE `aggregated_data` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` bigint NOT NULL,
  `amount` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aggregated_data`
--

INSERT INTO `aggregated_data` (`id`, `name`, `type`, `count`, `amount`) VALUES
(1, 'Merchant payments', 'TOTAL', 7205999708, '3745994748195.00'),
(2, 'Peer-to-peer payments', 'TOTAL', 4792478560, '15924876501456.00'),
(3, 'Recharge & bill payments', 'TOTAL', 1076952638, '829952832616.00'),
(4, 'Financial Services', 'TOTAL', 4884759, '5673343900.00'),
(5, 'Others', 'TOTAL', 10259195, '7571900579.00');

-- --------------------------------------------------------

--
-- Table structure for table `state_metrics`
--

CREATE TABLE `state_metrics` (
  `id` int NOT NULL,
  `entityName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `state_metrics`
--

INSERT INTO `state_metrics` (`id`, `entityName`, `count`, `amount`) VALUES
(1, 'maharashtra', 1848268499, '2362285906059.00'),
(2, 'karnataka', 1844697189, '2470227226317.00'),
(3, 'telangana', 1440331458, '2372581734284.00'),
(4, 'andhra pradesh', 1145532464, '2249051316530.00'),
(5, 'uttar pradesh', 1002557722, '1636936265372.00'),
(6, 'rajasthan', 921096686, '1554913375850.00'),
(7, 'madhya pradesh', 734566970, '1062026599901.00'),
(8, 'bihar', 547831195, '1039276959944.00'),
(9, 'odisha', 482896088, '753968977663.00'),
(10, 'tamil nadu', 461212387, '715583673518.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aggregated_data`
--
ALTER TABLE `aggregated_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state_metrics`
--
ALTER TABLE `state_metrics`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aggregated_data`
--
ALTER TABLE `aggregated_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `state_metrics`
--
ALTER TABLE `state_metrics`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
