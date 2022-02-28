-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2022 at 08:52 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `help_laundry`
--
CREATE DATABASE IF NOT EXISTS `help_laundry` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `help_laundry`;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama`) VALUES
(1, '1 A'),
(2, '1 B'),
(3, '1 C'),
(4, '1 A'),
(5, '1 B'),
(6, '1 C'),
(7, '1 A'),
(8, '1 B'),
(9, '1 C'),
(10, '1 A'),
(11, '1 B'),
(12, '1 C'),
(13, '1 A'),
(14, '1 B'),
(15, '1 C'),
(16, '1 A'),
(17, '1 B'),
(18, '1 C'),
(19, '1 A'),
(20, '1 B'),
(21, '1 C'),
(22, '1 A'),
(23, '1 B'),
(24, '1 C'),
(25, '1 A'),
(26, '1 B'),
(27, '1 C'),
(28, '1 A'),
(29, '1 B'),
(30, '1 C'),
(31, '1 A'),
(32, '1 B'),
(33, '1 C'),
(34, '1 A'),
(35, '1 B'),
(36, '1 C'),
(37, '1 A'),
(38, '1 B'),
(39, '1 C');

-- --------------------------------------------------------

--
-- Table structure for table `laundry`
--

CREATE TABLE `laundry` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_siswa` bigint(20) UNSIGNED NOT NULL,
  `berat_kg` smallint(5) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laundry`
--

INSERT INTO `laundry` (`id`, `id_siswa`, `berat_kg`, `tanggal`) VALUES
(1, 1, 9, '2022-02-01'),
(2, 3, 6, '2022-02-01'),
(3, 2, 1, '2022-02-02'),
(4, 2, 11, '2022-02-02'),
(5, 3, 14, '2022-02-03'),
(6, 2, 19, '2022-02-03'),
(7, 1, 14, '2022-02-04'),
(8, 2, 19, '2022-02-04'),
(9, 2, 4, '2022-02-05'),
(10, 3, 19, '2022-02-05'),
(11, 3, 12, '2022-02-06'),
(12, 3, 9, '2022-02-06'),
(13, 1, 6, '2022-02-07'),
(14, 1, 12, '2022-02-07'),
(15, 2, 12, '2022-02-08'),
(16, 2, 2, '2022-02-08'),
(17, 3, 1, '2022-02-09'),
(18, 1, 20, '2022-02-09'),
(19, 1, 3, '2022-02-10'),
(20, 3, 19, '2022-02-10'),
(21, 2, 10, '2022-02-11'),
(22, 1, 20, '2022-02-11'),
(23, 3, 20, '2022-02-12'),
(24, 3, 11, '2022-02-12'),
(25, 1, 5, '2022-02-13'),
(26, 3, 18, '2022-02-13'),
(27, 2, 9, '2022-02-14'),
(28, 1, 11, '2022-02-14'),
(29, 3, 6, '2022-02-15'),
(30, 3, 15, '2022-02-15'),
(31, 1, 17, '2022-02-16'),
(32, 2, 3, '2022-02-16'),
(33, 2, 19, '2022-02-17'),
(34, 2, 10, '2022-02-17'),
(35, 3, 14, '2022-02-18'),
(36, 3, 19, '2022-02-18'),
(37, 1, 7, '2022-02-19'),
(38, 3, 19, '2022-02-19'),
(39, 2, 8, '2022-02-20'),
(40, 1, 17, '2022-02-20'),
(41, 3, 1, '2022-02-21'),
(42, 1, 19, '2022-02-21'),
(43, 1, 7, '2022-02-22'),
(44, 1, 2, '2022-02-22'),
(45, 2, 4, '2022-02-23'),
(46, 2, 6, '2022-02-23'),
(47, 3, 2, '2022-02-24'),
(48, 2, 1, '2022-02-24'),
(49, 1, 6, '2022-02-25'),
(50, 2, 18, '2022-02-25'),
(51, 2, 11, '2022-02-26'),
(52, 2, 17, '2022-02-26'),
(53, 3, 9, '2022-02-27'),
(54, 2, 2, '2022-02-27'),
(55, 1, 9, '2022-02-28'),
(56, 3, 5, '2022-02-28');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kelas` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `id_kelas`, `nama`) VALUES
(1, 1, 'Andi'),
(2, 2, 'Budi'),
(3, 3, 'Siti'),
(4, 1, 'Andi'),
(5, 2, 'Budi'),
(6, 3, 'Siti'),
(7, 1, 'Andi'),
(8, 2, 'Budi'),
(9, 3, 'Siti'),
(10, 1, 'Andi'),
(11, 2, 'Budi'),
(12, 3, 'Siti'),
(13, 1, 'Andi'),
(14, 2, 'Budi'),
(15, 3, 'Siti'),
(16, 1, 'Andi'),
(17, 2, 'Budi'),
(18, 3, 'Siti'),
(19, 1, 'Andi'),
(20, 2, 'Budi'),
(21, 3, 'Siti'),
(22, 1, 'Andi'),
(23, 2, 'Budi'),
(24, 3, 'Siti'),
(25, 1, 'Andi'),
(26, 2, 'Budi'),
(27, 3, 'Siti'),
(28, 1, 'Andi'),
(29, 2, 'Budi'),
(30, 3, 'Siti'),
(31, 1, 'Andi'),
(32, 2, 'Budi'),
(33, 3, 'Siti'),
(34, 1, 'Andi'),
(35, 2, 'Budi'),
(36, 3, 'Siti'),
(37, 1, 'Andi'),
(38, 2, 'Budi'),
(39, 3, 'Siti');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laundry`
--
ALTER TABLE `laundry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `laundry`
--
ALTER TABLE `laundry`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laundry`
--
ALTER TABLE `laundry`
  ADD CONSTRAINT `laundry_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
