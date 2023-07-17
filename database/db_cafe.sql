-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2022 pada 17.00
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cafe`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_adm` int(11) NOT NULL,
  `nama_adm` varchar(50) NOT NULL,
  `telp_adm` varchar(15) NOT NULL,
  `user_adm` varchar(50) NOT NULL,
  `pass_adm` varchar(100) NOT NULL,
  `foto_adm` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_adm`, `nama_adm`, `telp_adm`, `user_adm`, `pass_adm`, `foto_adm`) VALUES
(1, 'Administrator', '08962878534', 'admin', 'admin', 'user.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangjasa`
--

CREATE TABLE `barangjasa` (
  `id_brg` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `stok` varchar(10) NOT NULL,
  `harga` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  `id_adm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barangjasa`
--

INSERT INTO `barangjasa` (`id_brg`, `nama`, `jenis`, `stok`, `harga`, `keterangan`, `id_adm`) VALUES
(6, 'Kopi Espresso', 'barang', '12', '14000', 'Kopi seduh', 1),
(7, 'Kopi Americano', 'barang', '10', '15000', 'Kopi seduh Americano', 1),
(8, 'Ayam Bakar pedas', 'barang', '18', '50000', 'ayam bakar', 1),
(9, 'Nasi Bakar', 'barang', '8', '15000', 'Nasi', 1),
(10, 'Juice Mangga', 'barang', '10', '8000', 'Aneka juice', 1),
(11, 'Paket 1', 'jasa', '1', '120000', 'paket makan keluarga', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` int(11) NOT NULL,
  `nama_kasir` varchar(50) NOT NULL,
  `telp_kasir` varchar(20) NOT NULL,
  `user_kasir` varchar(50) NOT NULL,
  `pass_kasir` varchar(100) NOT NULL,
  `foto_kasir` text NOT NULL,
  `id_adm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama_kasir`, `telp_kasir`, `user_kasir`, `pass_kasir`, `foto_kasir`, `id_adm`) VALUES
(1, 'Melisa', '0210181928', 'kasir', '123', '06062019071454r.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `konsumen`
--

CREATE TABLE `konsumen` (
  `id_kon` int(11) NOT NULL,
  `nama_kon` varchar(50) NOT NULL,
  `telp_kon` varchar(20) NOT NULL,
  `alamat_kon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `konsumen`
--

INSERT INTO `konsumen` (`id_kon`, `nama_kon`, `telp_kon`, `alamat_kon`) VALUES
(0, 'Umum', '0', '-'),
(4, 'Jaenal', '0244', 'bgr');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_spl` int(11) NOT NULL,
  `nama_spl` varchar(50) NOT NULL,
  `telp_spl` varchar(20) NOT NULL,
  `alamat_spl` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_spl`, `nama_spl`, `telp_spl`, `alamat_spl`) VALUES
(4, 'Indofood', '08544855444', 'Bogor Indonesia'),
(5, 'Unilever', '05745555', 'Jakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_trx`
--

CREATE TABLE `tmp_trx` (
  `id_tmp` int(11) NOT NULL,
  `id_trx` varchar(20) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `jml` int(11) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tmp_trx`
--

INSERT INTO `tmp_trx` (`id_tmp`, `id_trx`, `id_brg`, `jml`, `id_kasir`, `status`) VALUES
(17, '12032022224751', 8, 2, 1, 'Done'),
(18, '12032022224751', 9, 2, 1, 'Done'),
(19, '12032022224751', 10, 2, 1, 'Done');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx`
--

CREATE TABLE `trx` (
  `id_trx` varchar(20) NOT NULL,
  `id_kon` int(11) NOT NULL,
  `tgl_trx` date NOT NULL,
  `total` varchar(20) NOT NULL,
  `id_kasir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `trx`
--

INSERT INTO `trx` (`id_trx`, `id_kon`, `tgl_trx`, `total`, `id_kasir`) VALUES
('12032022224751', 4, '2022-03-12', '146000', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trxbarang`
--

CREATE TABLE `trxbarang` (
  `id_trxbrg` varchar(20) NOT NULL,
  `tgl_trxbrg` date NOT NULL,
  `id_brg` int(11) NOT NULL,
  `id_spl` int(11) NOT NULL,
  `jml_brg` int(11) NOT NULL,
  `ket_trxbrg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `trxbarang`
--

INSERT INTO `trxbarang` (`id_trxbrg`, `tgl_trxbrg`, `id_brg`, `id_spl`, `jml_brg`, `ket_trxbrg`) VALUES
('00365602062019', '2019-06-02', 1, 3, 10, 'Oli'),
('04184902062019', '2019-06-02', 5, 2, 5, 'suspensi'),
('04190502062019', '2019-06-02', 1, 3, 5, 'masuk lagi'),
('22374512032022', '2022-03-12', 8, 4, 20, 'barang masuk'),
('22380812032022', '2022-03-12', 10, 5, 12, 'ok'),
('22382512032022', '2022-03-12', 7, 5, 10, 'ok'),
('22384512032022', '2022-03-12', 6, 5, 12, 'ok'),
('22390012032022', '2022-03-12', 9, 4, 10, 'ok');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_adm`);

--
-- Indeks untuk tabel `barangjasa`
--
ALTER TABLE `barangjasa`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indeks untuk tabel `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`id_kon`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_spl`);

--
-- Indeks untuk tabel `tmp_trx`
--
ALTER TABLE `tmp_trx`
  ADD PRIMARY KEY (`id_tmp`);

--
-- Indeks untuk tabel `trx`
--
ALTER TABLE `trx`
  ADD PRIMARY KEY (`id_trx`);

--
-- Indeks untuk tabel `trxbarang`
--
ALTER TABLE `trxbarang`
  ADD PRIMARY KEY (`id_trxbrg`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_adm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `barangjasa`
--
ALTER TABLE `barangjasa`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id_kasir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `konsumen`
--
ALTER TABLE `konsumen`
  MODIFY `id_kon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_spl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tmp_trx`
--
ALTER TABLE `tmp_trx`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
