-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2022 at 05:49 PM
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
-- Database: `absensi_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_absensi`
--

CREATE TABLE `db_absensi` (
  `id_absen` bigint(20) NOT NULL,
  `kode_absen` varchar(100) NOT NULL,
  `nama_pegawai` varchar(125) NOT NULL,
  `kode_pegawai` varchar(125) NOT NULL,
  `tgl_absen` varchar(125) NOT NULL,
  `jam_masuk` varchar(13) NOT NULL,
  `jam_pulang` varchar(13) NOT NULL,
  `status_pegawai` int(1) NOT NULL,
  `keterangan_absen` varchar(100) NOT NULL,
  `maps_absen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `db_cuti`
--

CREATE TABLE `db_cuti` (
  `id_cuti` int(11) NOT NULL,
  `username` varchar(125) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `keperluan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `db_cuti`
--

INSERT INTO `db_cuti` (`id_cuti`, `username`, `nama_lengkap`, `tgl_mulai`, `tgl_akhir`, `keperluan`) VALUES
(1, 'fatur', 'Achmad Faturohman', '2022-07-10', '2022-07-15', 'Pulang Kampung');

-- --------------------------------------------------------

--
-- Table structure for table `db_gaji`
--

CREATE TABLE `db_gaji` (
  `id_gaji` int(11) NOT NULL,
  `username` varchar(125) NOT NULL,
  `nama_lengkap` varchar(125) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `nm_jabatan` varchar(100) NOT NULL,
  `gaji` varchar(100) NOT NULL,
  `tunjangan` varchar(100) NOT NULL,
  `potongan` varchar(100) NOT NULL,
  `gaji_bersih` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `db_gaji`
--

INSERT INTO `db_gaji` (`id_gaji`, `username`, `nama_lengkap`, `id_jabatan`, `nm_jabatan`, `gaji`, `tunjangan`, `potongan`, `gaji_bersih`) VALUES
(1, 'fatur', 'Achmad Faturohhman', 1, 'Manager', '10.000.000', '4.550.500', '3.000.000', '11.550.500');

-- --------------------------------------------------------

--
-- Table structure for table `db_jabatan`
--

CREATE TABLE `db_jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nm_jabatan` varchar(100) NOT NULL,
  `gaji` varchar(100) NOT NULL,
  `tunjangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `db_jabatan`
--

INSERT INTO `db_jabatan` (`id_jabatan`, `nm_jabatan`, `gaji`, `tunjangan`) VALUES
(1, 'Manager', '10.000.000', '4.550.500'),
(2, 'Supervisor', '8.300.000', '3.500.000'),
(3, 'Staff', '6.000.000', '3.000.000');

-- --------------------------------------------------------

--
-- Table structure for table `db_rememberme`
--

CREATE TABLE `db_rememberme` (
  `id_session` int(11) NOT NULL,
  `kode_pegawai` varchar(125) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_agent` varchar(35) NOT NULL,
  `agent_string` varchar(255) NOT NULL,
  `platform` varchar(128) NOT NULL,
  `user_ip` varchar(35) NOT NULL,
  `cookie_hash` varchar(255) NOT NULL,
  `expired` int(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `db_setting`
--

CREATE TABLE `db_setting` (
  `status_setting` int(1) NOT NULL DEFAULT 0,
  `nama_instansi` varchar(255) NOT NULL,
  `jumbotron_lead_set` varchar(125) NOT NULL,
  `nama_app_absensi` varchar(20) NOT NULL DEFAULT 'Absensi Online',
  `logo_instansi` varchar(255) NOT NULL,
  `timezone` varchar(35) NOT NULL,
  `absen_mulai` varchar(13) NOT NULL,
  `absen_mulai_to` varchar(13) NOT NULL,
  `absen_pulang` varchar(13) NOT NULL,
  `maps_use` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_setting`
--

INSERT INTO `db_setting` (`status_setting`, `nama_instansi`, `jumbotron_lead_set`, `nama_app_absensi`, `logo_instansi`, `timezone`, `absen_mulai`, `absen_mulai_to`, `absen_pulang`, `maps_use`) VALUES
(1, 'PT Kinarya Alihdaya Mandiri', 'Silahkan Absen Tepat Waktu Dan Pulang Sesuai Jam Kerja', 'Absensi PT KAM', '6e7378683008828545c00dce1863b1f3.png', 'Asia/Jakarta', '23:30:00', '23:30:00', '17:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_pegawai` int(11) NOT NULL,
  `nama_lengkap` varchar(125) NOT NULL,
  `username` varchar(125) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(1) NOT NULL,
  `umur` int(11) NOT NULL,
  `image` varchar(125) NOT NULL,
  `qr_code_image` varchar(125) NOT NULL,
  `kode_pegawai` varchar(125) NOT NULL,
  `instansi` varchar(125) NOT NULL,
  `jabatan` varchar(125) NOT NULL,
  `npwp` varchar(255) NOT NULL,
  `tgl_lahir` varchar(25) NOT NULL,
  `tempat_lahir` varchar(25) NOT NULL,
  `jenis_kelamin` varchar(25) NOT NULL,
  `bagian_shift` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `qr_code_use` int(2) NOT NULL,
  `last_login` int(11) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_pegawai`, `nama_lengkap`, `username`, `password`, `role_id`, `umur`, `image`, `qr_code_image`, `kode_pegawai`, `instansi`, `jabatan`, `npwp`, `tgl_lahir`, `tempat_lahir`, `jenis_kelamin`, `bagian_shift`, `is_active`, `qr_code_use`, `last_login`, `date_created`) VALUES
(1, 'Admin PT KAM', 'admin', '$2y$10$9UfWWjQ/U8jZeU1tt/EUZ.LIF2N/3Ipq/e8wzJLfXxWUqewaCseK.', 1, 24, '2d58559d2d6ba4bd53dda06125778fb3.png', 'no-qrcode.png', '293571010111', 'PT Kinarya Alihdaya Mandiri', 'Admin', '123456789', '1997-07-09', 'Ciamis', 'Laki - Laki', 1, 1, 0, 1657036100, 1584698797),
(43, 'Achmad Faturohman', 'fatur', '$2y$10$HJ74n98t2/VHy8MtfnhKbuBEn8cFoZ7hLD5svxD8SDEDhq2U3xAKK', 3, 24, '3dc5279d30f24920999fa7714da3dda2.png', 'qr_code_471293350258616.png', '471293350258616', 'PT Kinarya Alihdaya Mandiri', 'Manager', '123456789', '2022-06-04', 'Ciamis', 'Laki - Laki', 1, 1, 1, 1657034743, 1656433239);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_absensi`
--
ALTER TABLE `db_absensi`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `db_cuti`
--
ALTER TABLE `db_cuti`
  ADD PRIMARY KEY (`id_cuti`);

--
-- Indexes for table `db_gaji`
--
ALTER TABLE `db_gaji`
  ADD PRIMARY KEY (`id_gaji`);

--
-- Indexes for table `db_jabatan`
--
ALTER TABLE `db_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `db_rememberme`
--
ALTER TABLE `db_rememberme`
  ADD PRIMARY KEY (`id_session`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_absensi`
--
ALTER TABLE `db_absensi`
  MODIFY `id_absen` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_cuti`
--
ALTER TABLE `db_cuti`
  MODIFY `id_cuti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_gaji`
--
ALTER TABLE `db_gaji`
  MODIFY `id_gaji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_jabatan`
--
ALTER TABLE `db_jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_rememberme`
--
ALTER TABLE `db_rememberme`
  MODIFY `id_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
