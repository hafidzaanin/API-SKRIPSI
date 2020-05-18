-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Bulan Mei 2020 pada 09.11
-- Versi server: 10.1.33-MariaDB
-- Versi PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi2`
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
-- Struktur dari tabel `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `id_kendaraan` varchar(100) NOT NULL,
  `tglawal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tglakhir` date NOT NULL,
  `id_jalur` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`id_jadwal`, `id_petugas`, `id_kendaraan`, `tglawal`, `tglakhir`, `id_jalur`) VALUES
(1, 2, '1', '2020-03-13 00:00:00', '0000-00-00', '1'),
(2, 3, '1', '2020-03-03 00:00:00', '0000-00-00', '1'),
(3, 10, '1', '2020-04-03 00:00:00', '0000-00-00', '1'),
(4, 9, '2', '2020-03-03 00:00:00', '0000-00-00', '1'),
(5, 4, '1                                            ', '2020-04-06 00:00:00', '0000-00-00', '3                                            '),
(6, 13, '1                                            ', '2020-04-17 00:00:00', '0000-00-00', '1                                            ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jalur`
--

CREATE TABLE `tb_jalur` (
  `id_jalur` int(11) NOT NULL,
  `jalur` text NOT NULL,
  `keterangan` text NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jalur`
--

INSERT INTO `tb_jalur` (`id_jalur`, `jalur`, `keterangan`, `status`) VALUES
(1, 'Jalur 1', 'Kebon Cengkeh - Prasanti', 'Aktif'),
(2, 'Jalur 2', 'Rs Muhammadiyah - Rs Mardiwaluyo', 'Aktif'),
(3, 'Jalur 3', 'Rs Islam - SMA N 1 Metro', 'Aktif'),
(4, 'Pasar Tejo Agung', 'Pasar Tejo Agung', 'Aktif'),
(5, 'Pasar 24', 'Pasar 24', 'Aktif'),
(6, 'Jalur 6', 'Jl Prawira Negara, Jl Budi Utomo, Jl Dewi Sartika, Jl Patimura, Jl Mayjen S Parman, Jl Bona Wati, Perum Margodadi', 'Aktif'),
(7, 'Jalur 7', 'Jl Prawira Negara, Budi Utomo, Jl Mawar Putih, Jl Anggrek, Jl Cemara Gang Sion Gang Flamboyan, Gang Kemuning, Gang Pubian, Jl wana Bakti 1-4	\r\n', 'Aktif'),
(8, 'Jalur 8', 'Ar Prawira Negara, Jl Sutan Syahrir, Jl al hikmah, Jl Gandaria 1-2, Jl Sultan Dumas, Jl Adi Pati 1-10, Jl Adi Pati Raya	\r\n', 'Aktif'),
(9, 'Jalur 9', 'Ar Prawira Negara, Indo Metro, Pengadilan negri	\r\n', 'Aktif'),
(10, 'Jalur 10', 'Jl Seminung, Jl Semeru, Jl Seputaran Taman, Seputaran Taqwa, Ade Irma Nasution, Tawes Mujahir Tongkol	\r\n', 'Aktif'),
(11, 'Jalur 11', 'Koi, Arwana, Seminung, Taman, Taqwa, Diponegoro, Semangka, Ah nasution', 'Aktif'),
(12, 'Jalur 12', 'Seminung, A yani, Ah Nasution, Za Pagar Alam, Semeru, Seminung	', 'Aktif'),
(13, 'Jalur 13', 'Jl Ah Nasution, Jl Seminung, Taman, Taqwa, Jl. Ade Irma suryani, Jl Za Pagar Alam, Jl Tawes, Jl Tongkol, Jl. Lumba-Lumba Seluang Jl. Mujahir	\r\n', 'Aktif'),
(14, 'Jalur 14', 'Seminung, Jl. AH Nasution, Za Pagar Alam, Taqwa, Diponegoro, Raden Inten	\r\n', 'Aktif'),
(15, 'Jalur 14', 'Jl Semeru Jl Seminung, Jl Ah Nasution, Taman, Taqwa	', 'Aktif'),
(16, 'Jalur 14', 'Jl Mawar, Jl Melati, Jl Cut Nyadin, Jl Teku Umar, Jl Lukman, Jl Maulana', 'Aktif'),
(17, 'Jalur 15', 'Jl Sumbawa, Jl Nias, Jl Nuban , Jl Bali, Jl Sulawesi, Jl Katamso, Jl Mentawai, Jl Lombok', 'Aktif'),
(18, 'Jalur 15', 'Jl Khairbras, Jl Katamso, Jl Flores, Jl Sulawesi, SMA Kristen	', 'Aktif'),
(19, 'Jalur 16', 'Jl Kh Arsyad, Jl Ade Irma nasution Jl Za Pagar Alam, Jl Jendral A Yani, Jl Yosudarso, Jl Wijaya Kusuma	', 'Aktif'),
(20, 'Pasar Terminal', 'Pasar Terminal - Pasar Mega Mol', 'Aktif'),
(21, 'Jalur 17', 'Jl Brokoli, Jl Kh Dewantara, Jl Paria, Jl Rajabasa, Jl Dr Sutomo, Jl. Almuhsin Putri, SDN 5 Metro Utara, Dam raman 	\r\n', 'Aktif'),
(22, 'Jalur 18', 'Terminal 16c, Margorejo, Rs A yani', 'Aktif'),
(23, 'Jalur 19', 'Lp Palapa I, Palapa III, Satelit, Merica II, Samping Koramil', 'Aktif'),
(24, 'Jalur 20', 'A Yani, Ah Nasution	', 'Aktif'),
(25, 'Jalur 21', 'Imam Bonjol, Jl Patimura, Jl Raden Intan, Jl.Kh Ahmad Dahlan, Jl Satrio Sukarso, Jl Arsyad, Jl Diponegoro	', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenispelanggan`
--

CREATE TABLE `tb_jenispelanggan` (
  `id_jenispelanggan` int(11) NOT NULL,
  `jenis_pelanggan` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jenispelanggan`
--

INSERT INTO `tb_jenispelanggan` (`id_jenispelanggan`, `jenis_pelanggan`, `tarif`) VALUES
(1, 'Rumah Tangga', 10000),
(2, 'Rumah Sakit', 15000),
(3, 'Pabrik', 29000),
(4, 'Perbankan', 150000),
(5, 'Jasa', 15000),
(7, 'Olahraga & Hiburan', 100000),
(8, 'Kontrakan', 10000),
(9, 'Pergudangan', 50000),
(10, 'Gedung Pertemuan', 50000),
(11, 'Sosial', 25000),
(12, 'Bengkel', 15000),
(13, 'Pelayanan Kesehatan', 50000),
(14, 'Toko', 100000),
(15, 'Rumah Makan', 50000),
(16, 'Pusat Perbelanjaan', 1000000),
(17, 'Ruko', 120000),
(18, 'Kios', 15000),
(19, 'Pendidikan', 200000),
(20, 'Wisma', 250000),
(21, 'Kantor', 150000),
(22, 'Harian', 200000);

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
(1, 'Dump Truck', 'BE 8130 FZ'),
(2, 'Dump Truck', 'BE 9013 FZ'),
(3, 'Dump Truck', 'BE 9014 FZ'),
(4, 'Dump Truck', 'BE 9359 FZ'),
(5, 'Dump Truck', 'BE 8021 FZ'),
(6, 'Dump Truck', 'BE 8112 FZ'),
(7, 'Dump Truck', 'BE 8121 FZ'),
(8, 'Dump Truck', 'BE 9015 FZ'),
(9, 'Dump Truck', 'BE 8131 FZ'),
(10, 'Dump Truck', 'BE 9017 FZ'),
(11, 'Dump Truck', 'BE 8020 FZ'),
(12, 'Dump Truck', 'BE 8019 FZ'),
(13, 'Dump Truck', 'BE 9048 FZ'),
(14, 'Dump Truck', 'BE 9044 FZ'),
(15, 'BENTOR', 'BE 6087 FZ'),
(16, 'BENTOR', 'BE 6089 FZ'),
(17, 'BENTOR', 'BE 6092 FZ'),
(18, 'BENTOR', 'BE 6088 FZ'),
(19, 'BENTOR', 'BE 6090 FZ'),
(20, 'BENTOR', 'BE 6049 FZ'),
(21, 'BENTOR', 'BE 6052 FZ'),
(22, 'BENTOR', 'BE 6054 FZ'),
(23, 'BENTOR', 'BE 6085 FZ'),
(24, 'BENTOR', 'BE 6086 FZ'),
(25, 'BENTOR', 'BE 6052 FZ'),
(26, 'BENTOR', 'BE 6091 FZ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengaduan`
--

CREATE TABLE `tb_pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tgl_pengaduan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_pelanggan` int(11) NOT NULL,
  `id_petugas` varchar(100) NOT NULL,
  `id_jenispelanggan` int(11) NOT NULL,
  `lati` varchar(40) NOT NULL,
  `longi` varchar(40) NOT NULL,
  `id_jalur` int(11) NOT NULL,
  `ket_pengaduan` text NOT NULL,
  `foto` varchar(100) NOT NULL,
  `status` enum('Menunggu Antrian','Di Proses','Selesai') NOT NULL DEFAULT 'Menunggu Antrian'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengaduan`
--

INSERT INTO `tb_pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `id_pelanggan`, `id_petugas`, `id_jenispelanggan`, `lati`, `longi`, `id_jalur`, `ket_pengaduan`, `foto`, `status`) VALUES
(1, '2020-02-10 04:28:19', 1, '1', 1, '-5.131211', '105.298886', 1, 'Masalahnya sampah tidak bersih', '', 'Menunggu Antrian'),
(2, '2020-04-05 02:46:32', 4, '1', 1, '-5.126025', '105.300350', 2, 'Petugas tidak ramah', '', 'Menunggu Antrian'),
(3, '2020-03-05 02:50:14', 4, '1', 1, '-5.1294717', '105.2988696', 3, 'Gak Bersih', '', 'Menunggu Antrian'),
(4, '2020-01-05 02:50:14', 5, '2', 1, '-5.1109463', '105.3154944', 4, 'Gatau mau isi apa', '', 'Menunggu Antrian'),
(5, '2020-05-05 02:51:05', 6, '3', 1, '-5.1094239', '105.3141741', 5, 'apa yaa', '', 'Menunggu Antrian'),
(6, '2020-06-05 02:51:05', 7, '4', 1, '-5.1154701', '105.3180274', 6, 'basing kao', '', 'Menunggu Antrian'),
(7, '2020-03-05 02:51:34', 7, '4', 1, '-5.1127906', '105.3194198', 7, 'iyaiya', '', 'Menunggu Antrian'),
(8, '2020-01-05 02:51:34', 8, '5', 1, '-5.1139611', '105.3203366', 8, 'coba coba', '', 'Menunggu Antrian'),
(9, '2020-01-05 02:51:48', 9, '1', 1, '0', '0', 9, 'iiiiii', '', 'Menunggu Antrian');

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
  `password` varchar(100) NOT NULL,
  `awal_kerja` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `akhir_kerja` date NOT NULL,
  `status` enum('Aktif','Non Aktif') NOT NULL DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `username`, `nama`, `alamat`, `no_telepon`, `password`, `awal_kerja`, `akhir_kerja`, `status`) VALUES
(1, 'komarudin', 'Komarudin', 'Jl. Seminung', '08217389910', 'cobalagi', '2020-02-29 14:15:30', '0000-00-00', 'Aktif'),
(2, 'marimin', 'Marimin', 'Jl. AH Nasution', '081173008989', '0', '2020-04-18 05:54:53', '0000-00-00', 'Aktif'),
(3, 'ibrahim', 'Ibrahim', 'Jl. Dahlia', '089879890211', '0', '2020-04-18 05:55:03', '0000-00-00', 'Aktif'),
(4, 'ekaardiansyah', 'Eka Ardiansyah', 'Jl. Yos Sudarso', '085611442902', '0', '2020-04-18 05:55:15', '0000-00-00', 'Aktif'),
(5, 'agussetiyono', 'Agus Setiyono', 'Jl. Jendral A Yani', '0899233636', '0', '2020-04-18 06:34:33', '0000-00-00', 'Aktif'),
(6, 'suhendri', 'Suhendri', 'Jl.Mawar', '089712224493', '0', '2020-04-18 06:34:44', '0000-00-00', 'Aktif'),
(7, 'Sutarman', 'Sutarman', 'Jl. Krakatau', '087722887878', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(8, 'Mariwibowo', 'M Ari Wibowo', 'Jl. Way Umpu', '082299797900', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(9, 'Hendriaguss', 'Hendri Agus S', 'Jl. Tanggamus', '082199822210', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(10, 'Hotmasiagian', 'Hotma Siagian', 'Jl.Krakatau', '0822884444090', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(11, 'Tugirin', 'Tugirin', 'Jl. Melati', '081288811109', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(12, 'Sumardiyono', 'Sumardiyono', 'Jl. Way Bungur', '08193337464', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(13, 'Mpermana', 'M. Permana', 'Jl. Kamboja', '081272399001', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(14, 'Indrabangsawan', 'Indra Bangsawan', 'Jl. Dahlia', '08237777902', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(15, 'Misnanto', 'Misnanto', 'Jl. Kerinci', '08992883849', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(16, 'Nurakhmadi', 'Nurakhmadi', 'Jl. Way Gayau', '089928377748', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(17, 'Usman', 'Usman', 'Jl. Kernci', '08777304800', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(18, 'Heriyanto', 'Heriyanto', 'Jl. Way Lalan', '089911188827', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(19, 'Sugiyono', 'Sugiyono', 'Jl. Way Rarem', '089933183726', '0', '2020-04-29 02:38:04', '0000-00-00', 'Aktif'),
(20, 'tes', 'ito', 'tes', '0217777777', '123', '2020-05-13 06:52:54', '0000-00-00', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `nik` varchar(18) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `id_kelurahan` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `tgl_awal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_akhir` date NOT NULL,
  `status` enum('Aktif','Non Aktif') NOT NULL DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_pelanggan`, `nama_pelanggan`, `nik`, `email`, `alamat`, `id_kelurahan`, `id_kecamatan`, `no_telp`, `password`, `gambar`, `tgl_awal`, `tgl_akhir`, `status`) VALUES
(1, 'Hi. Dahlan Sikumbang', '7201829303852', 'Dahlansikumbang@gmail.com', 'Jl. Brokoli  No. 02  RT. 18  RW. 15  Kel. Iringmulyo  Kec. Metro Timur', 6, 2, '08217728399', 'coba', 'user1.jpg', '2020-04-19 10:06:10', '0000-00-00', 'Aktif'),
(2, 'TEGO SASMETO', '7208394666746', 'tego@gmail.com', 'Jl. Brokoli  No. 1B  RT. 18  RW. 15  Kel. Iringmulyo  Kec. Metro Timur\r\n', 6, 2, '08128839082', '', '', '2020-04-29 19:07:04', '0000-00-00', 'Aktif'),
(3, 'SURYADI JAYA', '7208910283746', 'suryadijaya@gmail.com', 'Jl. Tiram  No. 61  RT. 0  RW. 0  Kel. Iring Mulyo  Kec. Metro Timur\r\n', 6, 2, '089992736812', '', '', '2020-04-29 19:07:04', '0000-00-00', 'Aktif'),
(4, 'METRIANA', '7208293891098', 'metriana@gmail.com', 'Jl. Jend. Sudirman  No. 0  RT. 20  RW. 07  Kel. Ganjar Agung  Kec. Metro Barat\r\n', 19, 5, '345678', '', '', '2020-04-19 10:06:10', '0000-00-00', 'Aktif'),
(5, 'HASAN', '7208990182767', 'hasan@gmail.com', 'Jl. Soekarno-Hatta  Perumahan Ganjar Agung  No. 0  RT. 39  RW. 11  Kel. Ganjar Agung  Kec. Metro Barat\r\n', 19, 5, '08973496960', '', '', '2020-04-19 10:06:10', '0000-00-00', 'Aktif'),
(6, 'DENY SURYAWAN', '7642345678211', 'denysuryawan#gmail.com', 'Jl. R. Suprapto  No. 0  RT. 08  RW. 02  Kel. Margo Rejo  Kec. Metro Selatan\r\n', 12, 3, '08973496999', '', '', '2020-04-19 10:06:10', '0000-00-00', 'Aktif'),
(7, 'ROMLI AS', '7201835546374', 'romli@gmail.com', 'Jl. Kunang  No. 44  RT. 33  RW. 06  Kel. Metro  Kec. Metro Pusat\r\n', 4, 1, '082198542907', '', '', '2020-04-19 10:06:10', '0000-00-00', 'Aktif'),
(8, 'SUKOSO', '1872909349901', 'sukoso@gmail.com', 'Jl. Nangka  No. 0  RT. 12  RW. 03  Kel. Banjar Sari  Kec. Metro Utara\r\n', 15, 4, '123749208374', '', '', '2020-04-19 10:06:10', '0000-00-00', 'Aktif'),
(9, 'FAJAR', '1872909349901', 'fajar@gmail.com', 'Jl. Imam Bonjol  No. 0  RT. 0  RW. 0  Kel. Hadimulyo Barat  Kec. Metro Pusat\r\n', 1, 1, '08238947584', '', '', '2020-04-19 10:06:10', '0000-00-00', 'Aktif'),
(10, 'IKHWANTO', '1872909349901', 'ikhwanto@gmail.com', 'Jl. RA. Kartini  No. 0  RT. 02  RW. 08  Kel. Purwo Asri  Kec. Metro Utara\r\n', 17, 4, '087734526718', '', '', '2020-04-19 10:06:10', '0000-00-00', 'Aktif'),
(11, 'ARLINA', '7208399908127', 'arlina@gmail.com', 'Jl. Semangka  No. 05  RT. 06  RW. 02  Kel. Yosomulyo  Kec. Metro Pusat\r\n', 5, 1, '081263784902', '', '', '2020-04-19 10:06:10', '0000-00-00', 'Aktif'),
(12, 'GONO', '7208394756287', 'gono@gmail.com', 'Jl. Pendowo  No. 0  RT. 07  RW. 02  Kel. Sumbersari  Kec. Metro Selatan', 14, 3, '085211007991', '', 'HPqL23doZ820041807J25q22.jpg', '2020-04-19 10:06:10', '0000-00-00', 'Aktif'),
(13, 'DARTA', '1872909349901', 'darta@gmail.com', 'Jl. Sumbawa  No. 04  RT. 44  RW. 10  Kel. Ganjar Asri  Kec. Metro Barat\r\n', 20, 5, '085218273987', '', 'NZbqVZGTQn20042506J43q09.jpg', '2020-04-25 11:43:09', '0000-00-00', 'Aktif'),
(14, 'TRISNO AP.', '7208394758293', 'trisno@gmail.com', 'Jl. Perum Golden Vilage Block F  No. 10  RT. 45  RW. 10  Kel. Ganjar Asri  Kec. Metro Barat\r\n', 20, 5, '087726374819', '', '', '2020-04-29 20:23:00', '0000-00-00', 'Aktif'),
(15, 'AHMAD ZAINAL', '7207348263787', 'azainal@gmail.com', 'Jl. Veteran  No. 0  RT. 0  RW. 0  Kel. Hadimulyo Barat  Kec. Metro Pusat\r\n', 1, 1, '089936478293', '', '', '2020-04-29 20:41:10', '0000-00-00', 'Aktif'),
(16, 'SALEH', '7203884758928', 'saleh@gmail.com', 'Jl. Wana Bhakti I  No. 0  RT. 0  RW. 0  Kel. Margo Rejo  Kec. Metro Selatan\r\n', 12, 3, '08127384990', '', '', '2020-04-29 20:43:07', '0000-00-00', 'Aktif'),
(17, 'INDAH', '7208374682987', 'indah@gmail.com', 'Jl. Perum Jasmin  No. 0  RT. 0  RW. 0  Kel. Iring Mulyo  Kec. Metro Timur\r\n', 6, 2, '087736475882', '', '', '2020-04-29 20:43:07', '0000-00-00', 'Aktif'),
(18, 'AKIM', '7206377455182', 'akim@gmail.com', 'Jl. Yos Sudarso  No. 0  RT. 15  RW. 04  Kel. Mulyojati  Kec. Metro Barat\r\n', 21, 5, '08196200987', '', '', '2020-04-29 20:45:06', '0000-00-00', 'Aktif'),
(19, 'NURMANDAYANI', '7208900039830', 'nurmandayani@gmail.com', 'Jl. Perum Khalifah   No. 0  RT. 0  RW. 0  Kel. Hadimulyo Timur  Kec. Metro Pusat\r\n', 2, 1, '081263784902', '', '', '2020-04-29 20:45:06', '0000-00-00', 'Aktif'),
(20, 'TEJO', '7208394756019', 'tejo@gmail.com', 'Jl. Dewi Sartika  No. 0  RT. 0  RW. 0  Kel. Banjarsari  Kec. Metro Utara\r\n', 15, 4, '08117384920', '', '', '2020-04-29 20:47:45', '0000-00-00', 'Aktif'),
(21, 'Hafidza', '1234567', 'hafidzaanin@gmail.com', 'Jln.Beruang', 18, 4, '08227777777', '777', '', '2020-05-13 13:50:49', '0000-00-00', 'Aktif');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

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
  ADD PRIMARY KEY (`id_jenispelanggan`);

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
-- AUTO_INCREMENT untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_jalur`
--
ALTER TABLE `tb_jalur`
  MODIFY `id_jalur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `tb_jenispelanggan`
--
ALTER TABLE `tb_jenispelanggan`
  MODIFY `id_jenispelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tb_kendaraan`
--
ALTER TABLE `tb_kendaraan`
  MODIFY `id_kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
