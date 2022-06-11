-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 11, 2022 at 04:13 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `file_sharing`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `owner` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `descriptions` text,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `owner`, `name`, `descriptions`, `date`) VALUES
(6, '', 'test even', 'testevent', '2022-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `tb_file`
--

CREATE TABLE `tb_file` (
  `uuid` varchar(100) NOT NULL,
  `file_name` text NOT NULL,
  `slug` text NOT NULL,
  `path_folder` text NOT NULL,
  `extension` varchar(100) NOT NULL,
  `size` bigint(20) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_file_share`
--

CREATE TABLE `tb_file_share` (
  `uuid_file_share` int(11) NOT NULL,
  `id_file` varchar(100) NOT NULL,
  `added_on` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_link_share`
--

CREATE TABLE `tb_link_share` (
  `uuid_share` varchar(100) NOT NULL,
  `file_share` varchar(100) NOT NULL,
  `permission` enum('private','public') NOT NULL DEFAULT 'private',
  `share_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `userid` varchar(100) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `terdaftar_pada` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipe_akun` varchar(100) NOT NULL,
  `fcm_token` text NOT NULL,
  `tutup_account` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`userid`, `nama_lengkap`, `email`, `password`, `foto`, `terdaftar_pada`, `tipe_akun`, `fcm_token`, `tutup_account`) VALUES
('sigitsuryono25', 'Sigit Suryono', 'sigitharsy25@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '2022-06-11 15:09:33', '1', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_akun`
--

CREATE TABLE `tipe_akun` (
  `uuid_tipe` varchar(100) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `kapasitas` bigint(20) NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_file`
--
ALTER TABLE `tb_file`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `tb_file_share`
--
ALTER TABLE `tb_file_share`
  ADD PRIMARY KEY (`uuid_file_share`);

--
-- Indexes for table `tb_link_share`
--
ALTER TABLE `tb_link_share`
  ADD PRIMARY KEY (`uuid_share`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `tipe_akun`
--
ALTER TABLE `tipe_akun`
  ADD PRIMARY KEY (`uuid_tipe`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_file_share`
--
ALTER TABLE `tb_file_share`
  MODIFY `uuid_file_share` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
