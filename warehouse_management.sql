-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Okt 2025 pada 06.01
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehouse_management`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `stok` int(11) DEFAULT 0,
  `harga` decimal(15,2) DEFAULT 0.00,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `nama_produk`, `sku`, `stok`, `harga`, `created_by`, `created_at`, `updated_at`) VALUES
(3, 'Kardus Besar 60x40x40cm', 'SKU-001', 120, '8000.00', 11, '2025-10-31 04:52:31', '2025-10-31 04:52:31'),
(4, 'SKU-002', 'SKU-002', 500, '2500.00', 11, '2025-10-31 04:53:06', '2025-10-31 04:53:06'),
(5, 'Kardus Sedang 40x30x30cm', 'SKU-003', 150, '6000.00', 11, '2025-10-31 04:56:41', '2025-10-31 04:56:41'),
(6, 'Kardus Kecil 20x20x20cm', 'SKU-004', 200, '4000.00', 11, '2025-10-31 04:56:41', '2025-10-31 04:56:41'),
(7, 'Bubble Wrap 1 Meter', 'SKU-005', 100, '5000.00', 11, '2025-10-31 04:56:41', '2025-10-31 04:56:41'),
(8, 'Lakban Coklat 48mm', 'SKU-006', 250, '8000.00', 11, '2025-10-31 04:56:41', '2025-10-31 04:56:41'),
(9, 'Stretch Film 1kg', 'SKU-007', 80, '25000.00', 11, '2025-10-31 04:56:41', '2025-10-31 04:56:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin Gudang') DEFAULT 'Admin Gudang',
  `status` enum('PENDING','ACTIVE','INACTIVE') DEFAULT 'PENDING',
  `activation_token` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `role`, `status`, `activation_token`, `reset_token`, `created_at`, `updated_at`) VALUES
(11, 'Lulu Mudhiah', 'lulumudhiah1905@gmail.com', '$2y$10$miPn..mrdhjVa/H1exGuxOnw84ZvGgWnbaIibMuI7OBC6F5TlR5e2', 'Admin Gudang', 'ACTIVE', NULL, NULL, '2025-10-31 04:08:39', '2025-10-31 04:28:49'),
(12, 'Refi Sulistiawati', 'chimonnah@gmail.com', '$2y$10$.MnqoDvmKCHh0jw/NFCCquraQ6SsFWzMQNgTnk2OtV5Deq54dcy5m', 'Admin Gudang', 'ACTIVE', NULL, NULL, '2025-10-31 04:54:52', '2025-10-31 04:55:23');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `created_by` (`created_by`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
