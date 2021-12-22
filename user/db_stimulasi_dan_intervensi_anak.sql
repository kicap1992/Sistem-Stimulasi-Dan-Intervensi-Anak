-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2021 at 09:50 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_stimulasi_dan_intervensi_anak`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` varchar(16) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `username`, `password`, `nama`) VALUES
('1234567890123456', 'admin_admin', 'e739279cb28cdafd7373618313803524', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_data`
--

CREATE TABLE `tb_data` (
  `id_data` int(2) NOT NULL,
  `kemampuan_gerak_kasar` mediumtext DEFAULT NULL,
  `kemampuan_gerak_halus` mediumtext DEFAULT NULL,
  `kemampuan_bicara_dan_bahasa` mediumtext DEFAULT NULL,
  `kemampuan_bersosialisasi_dan_kemandirian` mediumtext DEFAULT NULL,
  `kesimpulan` mediumtext DEFAULT NULL,
  `intervensi` mediumtext DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_data`
--

INSERT INTO `tb_data` (`id_data`, `kemampuan_gerak_kasar`, `kemampuan_gerak_halus`, `kemampuan_bicara_dan_bahasa`, `kemampuan_bersosialisasi_dan_kemandirian`, `kesimpulan`, `intervensi`, `created`, `updated`) VALUES
(1, '[{\"id\":\"ReT3JUoRn5\",\"stimulasi\":\"Simulasi 1\",\"nilai_stimulasi\":\"40\"},{\"id\":\"3sWVQ3hudw\",\"stimulasi\":\"Simulasi 2\",\"nilai_stimulasi\":\"30\"},{\"id\":\"1lPCveFt8N\",\"stimulasi\":\"Stimulasi 3\",\"nilai_stimulasi\":\"15\"},{\"id\":\"oJrkGthgDI\",\"stimulasi\":\"Stimulasi 4\",\"nilai_stimulasi\":\"15\"}]', '[{\"id\":\"FUAPuYKhGh\",\"stimulasi\":\"Stimulasi 2\",\"nilai_stimulasi\":\"20\"},{\"id\":\"o4Kylm67dZ\",\"stimulasi\":\"Stimulasi 3\",\"nilai_stimulasi\":\"20\"},{\"id\":\"dEUQuNaR88\",\"stimulasi\":\"Stimulasi 4\",\"nilai_stimulasi\":\"20\"},{\"id\":\"xS6UQU5XAw\",\"stimulasi\":\"Stimulasi 5\",\"nilai_stimulasi\":\"20\"},{\"id\":\"JmIfTR5Y14\",\"stimulasi\":\"Stimulasi 1\",\"nilai_stimulasi\":\"20\"}]', '[{\"id\":\"jo87ugG7zg\",\"stimulasi\":\"Stimulasi 1\",\"nilai_stimulasi\":\"20\"},{\"id\":\"9hUbXMI9JP\",\"stimulasi\":\"Stimulasi 2\",\"nilai_stimulasi\":\"20\"},{\"id\":\"Ch3JByLCLo\",\"stimulasi\":\"Stimulasi 3\",\"nilai_stimulasi\":\"20\"},{\"id\":\"Q2T5OYAYwE\",\"stimulasi\":\"Stimulasi 4\",\"nilai_stimulasi\":\"20\"},{\"id\":\"2KkeZKLbYK\",\"stimulasi\":\"Stimulasi 5\",\"nilai_stimulasi\":\"20\"}]', '[{\"id\":\"hhvNYeBmu3\",\"stimulasi\":\"Stimulasi 1\",\"nilai_stimulasi\":\"25\"},{\"id\":\"jvI8srRatz\",\"stimulasi\":\"Stimulasi 2\",\"nilai_stimulasi\":\"25\"},{\"id\":\"1ggAX96cpj\",\"stimulasi\":\"Stimulasi 3\",\"nilai_stimulasi\":\"25\"},{\"id\":\"AQCxcgz7Vs\",\"stimulasi\":\"Stimulasi 4\",\"nilai_stimulasi\":\"25\"}]', '[{\"id\":\"20-0\",\"isi\":\"Kesimpulan 20\"},{\"id\":\"40-21\",\"isi\":\"Kesimpulan 40\"},{\"id\":\"60-41\",\"isi\":\"Kesimpulan 60\"},{\"id\":\"80-61\",\"isi\":\"Kesimpulan 80\"},{\"id\":\"100-81\",\"isi\":\"Kesimpulan 100\"}]', NULL, '2021-12-10 14:14:36', '2021-12-10 14:18:43'),
(2, '[{\"id\":\"SZY2nOVjPh\",\"stimulasi\":\"Stimulasi Kemampuan Gerak Kasar 1\",\"nilai_stimulasi\":\"20\"},{\"id\":\"WmsTpthc1T\",\"stimulasi\":\"Stimulasi Kemampuan Gerak Kasar 2\",\"nilai_stimulasi\":\"20\"},{\"id\":\"KtcHKT5gfR\",\"stimulasi\":\"Stimulasi Kemampuan Gerak Kasar 3\",\"nilai_stimulasi\":\"20\"},{\"id\":\"NTEvly1oGx\",\"stimulasi\":\"Stimulasi Kemampuan Gerak Kasar 4\",\"nilai_stimulasi\":\"20\"},{\"id\":\"jrAqjpawBK\",\"stimulasi\":\"Stimulasi Kemampuan Gerak Kasar 5\",\"nilai_stimulasi\":\"20\"}]', '[{\"id\":\"OYBgGAKy7j\",\"stimulasi\":\"Stimulasi Kemampuan Gerak Halus 1\",\"nilai_stimulasi\":\"20\"},{\"id\":\"zEecR1zXQT\",\"stimulasi\":\"Stimulasi Kemampuan Gerak Halus 2\",\"nilai_stimulasi\":\"20\"},{\"id\":\"THsoxFk8Jh\",\"stimulasi\":\"Stimulasi Kemampuan Gerak Halus 3\",\"nilai_stimulasi\":\"20\"},{\"id\":\"De0Bd6SOso\",\"stimulasi\":\"Stimulasi Kemampuan Gerak Halus 4\",\"nilai_stimulasi\":\"20\"},{\"id\":\"t295jKYMpq\",\"stimulasi\":\"Stimulasi Kemampuan Gerak Halus 5\",\"nilai_stimulasi\":\"20\"}]', '[{\"id\":\"U8MfPaT86j\",\"stimulasi\":\"Stimulasi Kemampuan Bicara Dan Bahasa 1\",\"nilai_stimulasi\":\"20\"},{\"id\":\"RAaAktWqq2\",\"stimulasi\":\"Stimulasi Kemampuan Bicara Dan Bahasa 2\",\"nilai_stimulasi\":\"20\"},{\"id\":\"Vcy8TTwEo4\",\"stimulasi\":\"Stimulasi Kemampuan Bicara Dan Bahasa 3\",\"nilai_stimulasi\":\"20\"},{\"id\":\"9NESNUUauo\",\"stimulasi\":\"Stimulasi Kemampuan Bicara Dan Bahasa 4\",\"nilai_stimulasi\":\"20\"},{\"id\":\"o8q6yceltS\",\"stimulasi\":\"Stimulasi Kemampuan Bicara Dan Bahasa 5\",\"nilai_stimulasi\":\"20\"}]', '[{\"id\":\"lSaL6xTDmd\",\"stimulasi\":\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 1\",\"nilai_stimulasi\":\"20\"},{\"id\":\"31rlXJn5b2\",\"stimulasi\":\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 2\",\"nilai_stimulasi\":\"20\"},{\"id\":\"VX3ZFPcp6q\",\"stimulasi\":\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 3\",\"nilai_stimulasi\":\"20\"},{\"id\":\"LqODSB9rGi\",\"stimulasi\":\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 4\",\"nilai_stimulasi\":\"20\"},{\"id\":\"xjkmhcXcxM\",\"stimulasi\":\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 5\",\"nilai_stimulasi\":\"20\"}]', '[{\"id\":\"20-0\",\"isi\":\"Kesimpulan ( 20%-0% )\"},{\"id\":\"40-21\",\"isi\":\"Kesimpulan ( 40%-21% )\"},{\"id\":\"60-41\",\"isi\":\"Kesimpulan ( 60%-41% )\"},{\"id\":\"80-61\",\"isi\":\"Kesimpulan ( 80%-61% )\"},{\"id\":\"100-81\",\"isi\":\"Kesimpulan ( 100%-81% )\"}]', '[{\"id\":\"20-0\",\"isi\":\"Intervensi ( 20%-0% )\"},{\"id\":\"40-21\",\"isi\":\"Intervensi ( 40%-21% )\"},{\"id\":\"60-41\",\"isi\":\"Intervensi ( 60%-41% )\"},{\"id\":\"80-61\",\"isi\":\"Intervensi ( 80%-61% )\"},{\"id\":\"100-81\",\"isi\":\"Intervensi ( 100%-81% )\"}]', '2021-12-02 23:46:34', '2021-12-03 00:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `tb_login`
--

CREATE TABLE `tb_login` (
  `id_user` int(3) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`id_user`, `username`, `password`) VALUES
(1, 'Kicap92', '5c188ab394811451656f8c7f33680127'),
(2, 'Aran92', '5c188ab394811451656f8c7f33680127');

-- --------------------------------------------------------

--
-- Table structure for table `tb_register`
--

CREATE TABLE `tb_register` (
  `no` int(3) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `umur` varchar(3) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `alamat` text NOT NULL,
  `registered_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_stimulasi_intervensi`
--

CREATE TABLE `tb_stimulasi_intervensi` (
  `id_stimulasi_intervensi` int(4) NOT NULL,
  `id_user` int(3) NOT NULL,
  `nama_anak` varchar(50) NOT NULL,
  `kelompok_umur` int(1) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `kemampuan_gerak_kasar` mediumtext NOT NULL,
  `kemampuan_gerak_halus` mediumtext NOT NULL,
  `kemampuan_bicara_dan_bahasa` mediumtext NOT NULL,
  `kemampuan_bersosialisasi_dan_kemandirian` mediumtext NOT NULL,
  `intervensi` text NOT NULL,
  `kesimpulan` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_stimulasi_intervensi`
--

INSERT INTO `tb_stimulasi_intervensi` (`id_stimulasi_intervensi`, `id_user`, `nama_anak`, `kelompok_umur`, `jk`, `kemampuan_gerak_kasar`, `kemampuan_gerak_halus`, `kemampuan_bicara_dan_bahasa`, `kemampuan_bersosialisasi_dan_kemandirian`, `intervensi`, `kesimpulan`, `created_at`) VALUES
(3, 1, 'asdasd', 2, 'Laki-laki', '[\"Stimulasi Kemampuan Gerak Kasar 1\",\"Stimulasi Kemampuan Gerak Kasar 2\"]', '[\"Stimulasi Kemampuan Gerak Halus 3\",\"Stimulasi Kemampuan Gerak Halus 4\"]', '[]', '[\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 3\",\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 4\"]', 'Intervensi ( 40%-21% )', 'Kesimpulan ( 40%-21% )', '2021-12-09 02:45:19'),
(4, 1, 'Anak 1', 2, 'Laki-laki', '[\"Stimulasi Kemampuan Gerak Kasar 3\",\"Stimulasi Kemampuan Gerak Kasar 4\"]', '[\"Stimulasi Kemampuan Gerak Halus 3\",\"Stimulasi Kemampuan Gerak Halus 4\"]', '[]', '[\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 2\",\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 3\"]', 'Intervensi ( 40%-21% )', 'Kesimpulan ( 40%-21% )', '2021-12-10 14:20:36'),
(5, 1, 'asdsadsdf', 2, 'Perempuan', '[\"Stimulasi Kemampuan Gerak Kasar 2\",\"Stimulasi Kemampuan Gerak Kasar 3\",\"Stimulasi Kemampuan Gerak Kasar 4\"]', '[\"Stimulasi Kemampuan Gerak Halus 2\",\"Stimulasi Kemampuan Gerak Halus 3\",\"Stimulasi Kemampuan Gerak Halus 4\"]', '[\"Stimulasi Kemampuan Bicara Dan Bahasa 3\",\"Stimulasi Kemampuan Bicara Dan Bahasa 4\",\"Stimulasi Kemampuan Bicara Dan Bahasa 5\"]', '[\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 3\",\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 4\",\"Stimulasi Kemampuan Bersosialisasi Dan Kemandirian 5\"]', 'Intervensi ( 60%-41% )', 'Kesimpulan ( 60%-41% )', '2021-12-10 14:27:51');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `umur` varchar(3) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `alamat` text NOT NULL,
  `registered_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama`, `email`, `umur`, `jk`, `alamat`, `registered_at`) VALUES
(1, 'Kicap Karan', 'kicap.karan92@gmail.com', '29', 'Laki-laki', 'Parepare', '2021-12-07 17:19:14'),
(2, 'Adrianus Aransina Tukan', 'karauksii@gmail.com', '29', 'Laki-laki', 'Taman Good View, Batu 3 1/2, Tawau, Sabah', '2021-12-09 01:01:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_data`
--
ALTER TABLE `tb_data`
  ADD PRIMARY KEY (`id_data`);

--
-- Indexes for table `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_register`
--
ALTER TABLE `tb_register`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `tb_stimulasi_intervensi`
--
ALTER TABLE `tb_stimulasi_intervensi`
  ADD PRIMARY KEY (`id_stimulasi_intervensi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_register`
--
ALTER TABLE `tb_register`
  MODIFY `no` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_stimulasi_intervensi`
--
ALTER TABLE `tb_stimulasi_intervensi`
  MODIFY `id_stimulasi_intervensi` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_login`
--
ALTER TABLE `tb_login`
  ADD CONSTRAINT `tb_login_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_stimulasi_intervensi`
--
ALTER TABLE `tb_stimulasi_intervensi`
  ADD CONSTRAINT `tb_stimulasi_intervensi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
