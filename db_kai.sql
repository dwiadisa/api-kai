-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2019 at 08:35 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kai`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas_kereta`
--

CREATE TABLE `kelas_kereta` (
  `id_kelas` varchar(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_kereta`
--

INSERT INTO `kelas_kereta` (`id_kelas`, `harga`) VALUES
('Bisnis', 75000),
('Ekonomi', 15000),
('Eksekutif ', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `kereta_api`
--

CREATE TABLE `kereta_api` (
  `id_kereta` varchar(4) NOT NULL,
  `nama_kereta_api` varchar(25) NOT NULL,
  `kelas_kereta` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kereta_api`
--

INSERT INTO `kereta_api` (`id_kereta`, `nama_kereta_api`, `kelas_kereta`) VALUES
('101', 'Ranggajati', 'Bisnis'),
('101e', 'Ranggajati', 'Eksekutif '),
('102', 'Ranggajati', 'Bisnis'),
('187', 'Logawa', 'Ekonomi'),
('188', 'Logawa', 'Ekonomi'),
('189', 'Logawa', 'Ekonomi'),
('190', 'Logawa', 'Ekonomi'),
('193', 'Sri tanjung', 'Ekonomi'),
('194', 'Sri tanjung', 'Ekonomi'),
('195', 'Sri tanjung', 'Ekonomi'),
('196', 'Sri tanjung', 'Ekonomi'),
('205', 'Tawang alun', 'Ekonomi'),
('206', 'Tawang alun', 'Ekonomi'),
('207', 'Tawang alun', 'Ekonomi'),
('208', 'Tawang alun', 'Ekonomi'),
('213', 'Probowangi', 'Ekonomi'),
('214', 'Probowangi', 'Ekonomi'),
('451', 'Pandanwangi', 'Ekonomi'),
('452', 'Pandanwangi', 'Ekonomi'),
('453', 'Pandanwangi', 'Ekonomi'),
('454', 'Pandanwangi', 'Ekonomi'),
('87', 'Mutiara Timur', 'Bisnis'),
('88', 'Mutiara Timur', 'Ekonomi'),
('89', 'Mutiara Timur', 'Ekonomi'),
('90', 'Mutiara Timur', 'Bisnis');

-- --------------------------------------------------------

--
-- Table structure for table `penumpang_ka`
--

CREATE TABLE `penumpang_ka` (
  `id_penumpang` varchar(16) NOT NULL,
  `nama_penumpang` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penumpang_ka`
--

INSERT INTO `penumpang_ka` (`id_penumpang`, `nama_penumpang`) VALUES
('1234', 'test penumpang');

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id_reservasi` varchar(11) NOT NULL,
  `id_penumpang` varchar(16) NOT NULL,
  `stasiun_berangkat` varchar(25) NOT NULL,
  `stasiun_tujuan` varchar(25) NOT NULL,
  `tanggal_berangkat` date DEFAULT NULL,
  `jam_berangkat` varchar(20) NOT NULL,
  `jam_tiba` varchar(20) NOT NULL,
  `waktu_pemesanan` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_kereta` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stasiun`
--

CREATE TABLE `stasiun` (
  `id_stasiun` varchar(5) NOT NULL,
  `nama_stasiun` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stasiun`
--

INSERT INTO `stasiun` (`id_stasiun`, `nama_stasiun`) VALUES
('BG', 'Bangil'),
('BSS', 'Bangsalsari'),
('BYM', 'Bayeman'),
('GI', 'Grati'),
('JR', 'Jember'),
('JTR', 'Jatiroto'),
('KK', 'Klakah'),
('LEC', 'Leces'),
('MI', 'Mangli'),
('ML', 'Malang'),
('MLK', 'Malang Kota Lama'),
('MLS', 'Malasan'),
('PB', 'Probolinggo'),
('PR', 'Porong'),
('PS', 'Pasuruan'),
('RBP', 'Rambipuji'),
('RDA', 'Randuagung'),
('RN', 'Ranoyoso'),
('RO', 'Rejoso'),
('SBI ', 'Surabaya Pasarturi'),
('SDA', 'Sidoarjo'),
('SGU ', 'Surabaya Gubeng'),
('TGA', 'Tanggulangin'),
('TGL', 'Tanggul'),
('WO', 'Wonokromo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas_kereta`
--
ALTER TABLE `kelas_kereta`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `kereta_api`
--
ALTER TABLE `kereta_api`
  ADD PRIMARY KEY (`id_kereta`),
  ADD KEY `fk_kelas_kai` (`kelas_kereta`);

--
-- Indexes for table `penumpang_ka`
--
ALTER TABLE `penumpang_ka`
  ADD PRIMARY KEY (`id_penumpang`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `fk_penumpang_pemesan` (`id_penumpang`),
  ADD KEY `fk_stasiun_berangkat` (`stasiun_berangkat`),
  ADD KEY `fk_stasiun_tujuan` (`stasiun_tujuan`),
  ADD KEY `reservasi_kereta` (`id_kereta`);

--
-- Indexes for table `stasiun`
--
ALTER TABLE `stasiun`
  ADD PRIMARY KEY (`id_stasiun`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kereta_api`
--
ALTER TABLE `kereta_api`
  ADD CONSTRAINT `fk_kelas_kai` FOREIGN KEY (`kelas_kereta`) REFERENCES `kelas_kereta` (`id_kelas`);

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `fk_penumpang_pemesan` FOREIGN KEY (`id_penumpang`) REFERENCES `penumpang_ka` (`id_penumpang`),
  ADD CONSTRAINT `fk_stasiun_berangkat` FOREIGN KEY (`stasiun_berangkat`) REFERENCES `stasiun` (`id_stasiun`),
  ADD CONSTRAINT `fk_stasiun_tujuan` FOREIGN KEY (`stasiun_tujuan`) REFERENCES `stasiun` (`id_stasiun`),
  ADD CONSTRAINT `reservasi_kereta` FOREIGN KEY (`id_kereta`) REFERENCES `kereta_api` (`id_kereta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
