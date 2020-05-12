-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2020 pada 13.29
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nm_lengkap` varchar(128) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `level` enum('admin','pegawai','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `email`, `password`, `nm_lengkap`, `foto`, `level`) VALUES
(1, 'admin@gmail.com', '0707', 'Admin', '', 'admin'),
(2, 'pegawai@gmail.com', '0404', 'Pegawai', '', 'pegawai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bayar`
--

CREATE TABLE `tb_bayar` (
  `id_bayar` int(11) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_jenisPelanggan` varchar(100) NOT NULL,
  `status` enum('Lunas','Belum Bayar') NOT NULL,
  `total` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_bayar`
--

INSERT INTO `tb_bayar` (`id_bayar`, `tgl`, `id_jenisPelanggan`, `status`, `total`) VALUES
(1, '2020-02-12 13:20:53', '1', 'Lunas', '10000'),
(2, '2020-02-12 13:20:53', '1', 'Belum Bayar', '15000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `id_kendaraan` varchar(100) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_jalur` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`id_jadwal`, `id_petugas`, `id_kendaraan`, `waktu`, `id_jalur`) VALUES
(1, 1, '1', '2020-03-12 17:00:00', '1'),
(2, 1, 'H 7865 IY', '2020-03-02 17:00:00', '1'),
(3, 0, '1', '2020-03-09 17:00:00', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jalur`
--

CREATE TABLE `tb_jalur` (
  `id_jalur` int(11) NOT NULL,
  `jalur` text NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jalur`
--

INSERT INTO `tb_jalur` (`id_jalur`, `jalur`, `keterangan`) VALUES
(1, 'Jl. Yos Sudarso', 'Jl. Yos Sudarso - Jl. Pagar Alam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenispelanggan`
--

CREATE TABLE `tb_jenispelanggan` (
  `id_jenisPelanggan` int(11) NOT NULL,
  `jenis_pelanggan` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jenispelanggan`
--

INSERT INTO `tb_jenispelanggan` (`id_jenisPelanggan`, `jenis_pelanggan`, `tarif`) VALUES
(1, 'Rumah Tangga', 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kendaraan`
--

CREATE TABLE `tb_kendaraan` (
  `id_kendaraan` int(11) NOT NULL,
  `kendaraan` varchar(100) NOT NULL,
  `platkendaraan` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kendaraan`
--

INSERT INTO `tb_kendaraan` (`id_kendaraan`, `kendaraan`, `platkendaraan`) VALUES
(1, 'Dump Truck', 'BE 4567 HS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengaduan`
--

CREATE TABLE `tb_pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tgl_pengaduan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_pelanggan` int(11) NOT NULL,
  `id_petugas` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(128) NOT NULL,
  `ket_pengaduan` text NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengaduan`
--

INSERT INTO `tb_pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `id_pelanggan`, `id_petugas`, `latitude`, `longitude`, `ket_pengaduan`, `gambar`) VALUES
(1, '2020-02-10 04:28:19', 1, '1', '5,9876543', '6,876543', 'Masalahnya sampah tidak bersih', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengajuan`
--

CREATE TABLE `tb_pengajuan` (
  `id_pengajuan` int(100) NOT NULL,
  `tgl_pengajuan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `id_pelanggan` int(100) NOT NULL,
  `id_jenisPelanggan` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `id_petugas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengajuan`
--

INSERT INTO `tb_pengajuan` (`id_pengajuan`, `tgl_pengajuan`, `latitude`, `longitude`, `id_pelanggan`, `id_jenisPelanggan`, `alamat`, `id_petugas`) VALUES
(1, '2020-02-06 08:20:00', '-5.131211', '105.298886', 1, '1', 'Jl. apa ya', '2'),
(2, '2020-02-10 00:15:01', '-5.126025', '105.300350', 1, '1', 'jl.GG aja', '3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telepon` varchar(14) NOT NULL,
  `awal_kerja` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `akhir_kerja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `username`, `nama`, `alamat`, `no_telepon`, `awal_kerja`, `akhir_kerja`) VALUES
(1, 'hanhan@gmail.com', 'abc', 'jl. IIII', '098345678', '2020-02-23 17:52:06', '0000-00-00'),
(2, 'jajan5', 'jajan5', 'Jl. Jajan 5', '0821334859', '2020-02-29 14:15:30', '0000-00-00'),
(3, 'jajan1', 'jajan1', 'Jl. Jajan1', '081267849', '2020-02-29 14:15:56', '0000-00-00'),
(5, 'tes', 'cobsaa', 'JL. Yoss', '1234566', '2020-03-08 11:11:53', '0000-00-00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `id_jenisPelanggan` varchar(15) NOT NULL,
  `nik` varchar(18) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `id_jalur` varchar(50) NOT NULL,
  `id_bayar` varchar(100) NOT NULL,
  `tgl_awal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_berhenti` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_pelanggan`, `nama_pelanggan`, `id_jenisPelanggan`, `nik`, `alamat`, `no_telp`, `password`, `email`, `gambar`, `id_jalur`, `id_bayar`, `tgl_awal`, `tgl_berhenti`) VALUES
(1, 'hanis', '1', '74239047', 'jl. anime', '0888888', 'coba', 'cobasi@gmail.com', '', '1', '1', '2020-02-09 23:04:21', NULL),
(4, 'amalia', '1', '23456', 'dfghj', '345678', '', 'tyhjk', '', '1', '', '2020-02-17 05:19:58', NULL),
(5, 'Ratu', '1', '76423456784', 'Jl. Yos Sudarso No.1 Ganjar Agung', '08973496960', '', 'hanisamalia20@gmail.com', '', '1', '', '2020-02-29 13:39:35', NULL),
(6, 'Syafana', '1', '7642345678', 'Jl. Marga Satwa', '08973496999', '', 'syafana2@gmail.com', '', '1', '', '2020-02-29 13:59:15', NULL),
(7, 'Aku Hanis', '1', '1234555', 'Jl. mngga', '08219854', '', 'akuhaniscobaya@gmail.com', '', '1', '', '2020-03-02 10:25:47', NULL),
(11, 'tes', '1', '12443', 'jl. tes yah', '0899764', '', 'hanistes@gmail.com', '', '1', '', '2020-03-03 14:30:15', NULL),
(13, 'hhhh', 'Rumah Tangga', '76423456789', 'rrA', '0899764', '', 'h', '', 'Jl. Yos Sudarso', '', '2020-03-04 09:49:01', NULL),
(17, 'akucobayah', 'Rumah Tangga', '76423456789', 'kk', '08997647', '', 'jj', '', 'Jl. Yos Sudarso', '', '2020-03-04 09:54:49', NULL),
(18, 'hhjawaban', 'Rumah Tangga', '12443', 'jl.coba', '1234', '', 'hanis', '', 'Jl. Yos Sudarso', '', '2020-03-05 04:15:40', NULL),
(20, 'akucobalagij', 'Rumah Tangga', '1234567', 'Jl. cobaya', '123456', '', 'Jl.GG MM', '', 'Jl. Yos Sudarso', '', '2020-03-07 04:31:15', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_bayar`
--
ALTER TABLE `tb_bayar`
  ADD PRIMARY KEY (`id_bayar`);

--
-- Indeks untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indeks untuk tabel `tb_jalur`
--
ALTER TABLE `tb_jalur`
  ADD PRIMARY KEY (`id_jalur`);

--
-- Indeks untuk tabel `tb_jenispelanggan`
--
ALTER TABLE `tb_jenispelanggan`
  ADD PRIMARY KEY (`id_jenisPelanggan`);

--
-- Indeks untuk tabel `tb_kendaraan`
--
ALTER TABLE `tb_kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`);

--
-- Indeks untuk tabel `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indeks untuk tabel `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`);

--
-- Indeks untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_bayar`
--
ALTER TABLE `tb_bayar`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_jalur`
--
ALTER TABLE `tb_jalur`
  MODIFY `id_jalur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_jenispelanggan`
--
ALTER TABLE `tb_jenispelanggan`
  MODIFY `id_jenisPelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_kendaraan`
--
ALTER TABLE `tb_kendaraan`
  MODIFY `id_kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  MODIFY `id_pengajuan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
