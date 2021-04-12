-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jul 2020 pada 12.30
-- Versi server: 10.1.34-MariaDB
-- Versi PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ti_exhibition`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `keypas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `nama`, `username`, `keypas`) VALUES
(1, 'Fitria', 'firman', 'firman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `katalog`
--

CREATE TABLE `katalog` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `katalog`
--

INSERT INTO `katalog` (`id`, `nama`) VALUES
(1, '2D Consep Art	'),
(2, '2D Animation'),
(3, '3D Modeling'),
(4, '3D Animation'),
(5, 'Game Design'),
(6, 'Game Development');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `pesan` text NOT NULL,
  `nim_pengunjung` varchar(10) NOT NULL,
  `id_studio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengunjung`
--

CREATE TABLE `pengunjung` (
  `nim` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengunjung`
--

INSERT INTO `pengunjung` (`nim`, `nama`) VALUES
('11.11.11', 'spyder_monkey'),
('15.11.8692', 'firmantria');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peserta`
--

CREATE TABLE `peserta` (
  `id` int(11) NOT NULL,
  `nim` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `id_studio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peserta`
--

INSERT INTO `peserta` (`id`, `nim`, `nama`, `kelas`, `id_studio`) VALUES
(1, '15.11.8699', 'asd', 'IF 99++', 36);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `deskripsi` text,
  `jenis_file` varchar(10) NOT NULL,
  `id_studio` int(11) NOT NULL,
  `link_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `deskripsi`, `jenis_file`, `id_studio`, `link_path`) VALUES
(2, 'gambar', 'gambar', 'image', 36, 'btn-close.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `nim_pengunjung` varchar(10) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `kriteria_1` int(11) NOT NULL,
  `kriteria_2` int(11) NOT NULL,
  `kriteria_3` int(11) NOT NULL,
  `kriteria_4` int(11) NOT NULL,
  `kriteria_5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `studio`
--

CREATE TABLE `studio` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `dosen` varchar(50) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `token` varchar(100) NOT NULL,
  `id_katalog` int(11) NOT NULL,
  `id_tahun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `studio`
--

INSERT INTO `studio` (`id`, `nama`, `dosen`, `deskripsi`, `token`, `id_katalog`, `id_tahun`) VALUES
(36, 'zzz', 'aa', 'NULL', 'quAOdIDvU9ajE10wWwmRFsqDPOhCOd9XVlT9nYdKvA', 1, 1),
(57, 'coba', 'coba', '-', 'UoWprPgtka52OP66dqtaoZcwceNVaxi4BJoFmMPo', 5, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun`
--

CREATE TABLE `tahun` (
  `id` int(11) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `tgl_pengesahan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tahun`
--

INSERT INTO `tahun` (`id`, `tahun`, `tgl_pengesahan`) VALUES
(1, '2019', '2019-09-19'),
(5, '2020', '0000-00-00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `voting`
--

CREATE TABLE `voting` (
  `id` int(11) NOT NULL,
  `nim_pengunjung` varchar(10) NOT NULL,
  `id_studio` int(11) NOT NULL,
  `id_tahun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `voting`
--

INSERT INTO `voting` (`id`, `nim_pengunjung`, `id_studio`, `id_tahun`) VALUES
(3, '15.11.8692', 57, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `katalog`
--
ALTER TABLE `katalog`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim_pengunjung` (`nim_pengunjung`),
  ADD KEY `komentar_ibfk_2` (`id_studio`);

--
-- Indeks untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peserta_ibfk_1` (`id_studio`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_ibfk_2` (`id_studio`);

--
-- Indeks untuk tabel `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim_pengunjung` (`nim_pengunjung`),
  ADD KEY `rating_ibfk_2` (`id_produk`);

--
-- Indeks untuk tabel `studio`
--
ALTER TABLE `studio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studio_ibfk_1` (`id_katalog`),
  ADD KEY `studio_ibfk_2` (`id_tahun`);

--
-- Indeks untuk tabel `tahun`
--
ALTER TABLE `tahun`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `voting`
--
ALTER TABLE `voting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim_pengunjung` (`nim_pengunjung`),
  ADD KEY `voting_ibfk_3` (`id_tahun`),
  ADD KEY `voting_ibfk_2` (`id_studio`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `katalog`
--
ALTER TABLE `katalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `studio`
--
ALTER TABLE `studio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `tahun`
--
ALTER TABLE `tahun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `voting`
--
ALTER TABLE `voting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`nim_pengunjung`) REFERENCES `pengunjung` (`nim`),
  ADD CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`id_studio`) REFERENCES `studio` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peserta`
--
ALTER TABLE `peserta`
  ADD CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`id_studio`) REFERENCES `studio` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`id_studio`) REFERENCES `studio` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`nim_pengunjung`) REFERENCES `pengunjung` (`nim`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `studio`
--
ALTER TABLE `studio`
  ADD CONSTRAINT `studio_ibfk_1` FOREIGN KEY (`id_katalog`) REFERENCES `katalog` (`id`),
  ADD CONSTRAINT `studio_ibfk_2` FOREIGN KEY (`id_tahun`) REFERENCES `tahun` (`id`);

--
-- Ketidakleluasaan untuk tabel `voting`
--
ALTER TABLE `voting`
  ADD CONSTRAINT `voting_ibfk_1` FOREIGN KEY (`nim_pengunjung`) REFERENCES `pengunjung` (`nim`),
  ADD CONSTRAINT `voting_ibfk_2` FOREIGN KEY (`id_studio`) REFERENCES `studio` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `voting_ibfk_3` FOREIGN KEY (`id_tahun`) REFERENCES `tahun` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
