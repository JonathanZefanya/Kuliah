-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jan 2025 pada 19.59
-- Versi server: 8.2.0
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_menu`
--

CREATE TABLE `tb_menu` (
  `id` int NOT NULL,
  `nama_menu` varchar(200) NOT NULL,
  `harga` int NOT NULL,
  `deskripsi` text NOT NULL,
  `status` enum('1','0') NOT NULL COMMENT '1 = makanan, 0 = minuman'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id_pesanan` int NOT NULL,
  `id_menu` int NOT NULL,
  `status` enum('1','0') NOT NULL COMMENT '1 = lunas, 0 = belum lunas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama` text NOT NULL,
  `alamat` text NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id_pesanan` int NOT NULL AUTO_INCREMENT;
COMMIT;

-- Data Dummy untuk User dan Admin
INSERT INTO `tb_user` (`username`, `password`, `nama`, `alamat`, `nohp`, `status`) VALUES
('admin123', SHA1('adminpassword'), 'Admin Restoku', 'Jl. Admin No. 1, Jakarta', '081234567890', '1'), -- Admin
('user001', SHA1('userpassword'), 'Jonathan Zefanya', 'Jl. User No. 2, Bandung', '082345678901', '0'), -- User
('user002', SHA1('userpassword'), 'Sarah Wijaya', 'Jl. User No. 3, Surabaya', '083456789012', '0'), -- User
('user003', SHA1('userpassword'), 'Rian Pratama', 'Jl. User No. 4, Yogyakarta', '084567890123', '0'); -- User

INSERT INTO `tb_menu` (`id`, `nama_menu`, `harga`, `deskripsi`, `status`) VALUES
(1, 'Nasi Goreng Spesial', 25000, 'Nasi goreng dengan topping telur dan ayam suwir.', '1'),
(2, 'Mie Ayam', 20000, 'Mie ayam dengan kuah kaldu ayam dan bakso.', '1'),
(3, 'Es Teh Manis', 5000, 'Minuman es teh manis segar.', '0'),
(4, 'Jus Alpukat', 15000, 'Jus alpukat dengan tambahan susu coklat.', '0'),
(5, 'Ayam Geprek', 22000, 'Ayam geprek dengan sambal pedas.', '1');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
