-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2025 at 07:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `info_wisata`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorit`
--

CREATE TABLE `favorit` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `id_wisata` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorit`
--

INSERT INTO `favorit` (`user_id`, `id_wisata`, `created_at`, `updated_at`) VALUES
(2, 1, NULL, NULL),
(2, 2, NULL, NULL),
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(2, 5, NULL, NULL),
(2, 8, NULL, NULL),
(2, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Pantai', '2025-06-17 03:59:35', '2025-06-17 03:59:35'),
(2, 'Gunung & Alam', '2025-06-17 03:59:35', '2025-06-17 03:59:35'),
(3, 'Sejarah & Budaya', '2025-06-17 03:59:35', '2025-06-17 03:59:35'),
(4, 'Kuliner', '2025-06-17 03:59:35', '2025-06-17 03:59:35'),
(5, 'Rekreasi Keluarga', '2025-06-17 03:59:35', '2025-06-17 03:59:35'),
(6, 'Pusat Perbelanjaan', '2025-06-17 03:59:35', '2025-06-17 03:59:35');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id_kota` bigint(20) UNSIGNED NOT NULL,
  `nama_kota` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`, `created_at`, `updated_at`) VALUES
(1, 'Jakarta', '2025-06-17 03:58:25', '2025-06-17 03:58:25'),
(2, 'Bandung', '2025-06-17 03:58:25', '2025-06-17 03:58:25'),
(3, 'Yogyakarta', '2025-06-17 03:58:25', '2025-06-17 03:58:25'),
(4, 'Surabaya', '2025-06-17 03:58:25', '2025-06-17 03:58:25'),
(5, 'Denpasar (Bali)', '2025-06-17 03:58:25', '2025-06-17 03:58:25'),
(6, 'Lombok (Mataram)', '2025-06-17 03:58:25', '2025-06-17 03:58:25'),
(7, 'Medan', '2025-06-17 03:58:25', '2025-06-17 03:58:25'),
(8, 'Makassar', '2025-06-17 03:58:25', '2025-06-17 03:58:25'),
(9, 'Bogor', '2025-06-17 03:58:25', '2025-06-17 03:58:25'),
(10, 'Depok', '2025-06-16 22:00:19', '2025-06-16 22:00:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_17_021903_create_kotas_table', 2),
(5, '2025_06_17_021913_create_kategoris_table', 2),
(6, '2025_06_17_021921_create_tempat_wisatas_table', 3),
(7, '2025_06_17_021948_create_favorit_table', 3),
(8, '2025_06_17_022814_create_personal_access_tokens_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth_token', 'b46b2ea4071bc75a0b0a6a5a50eb908f69fcd9aa1c34665ef4f8bccf760897c2', '[\"*\"]', NULL, NULL, '2025-06-16 20:21:56', '2025-06-16 20:21:56'),
(2, 'App\\Models\\User', 4, 'auth_token', '18b154bdb6df179b81993f09812079416ce5d4e8b4b42e329442075141b73bcc', '[\"*\"]', NULL, NULL, '2025-06-16 20:22:48', '2025-06-16 20:22:48'),
(3, 'App\\Models\\User', 4, 'auth_token', '37534c636dddae176f1875eac8a7b2b0c263365679185c7efdcfee4101885a37', '[\"*\"]', NULL, NULL, '2025-06-16 20:33:22', '2025-06-16 20:33:22'),
(4, 'App\\Models\\User', 2, 'auth_token', 'ea5c963f9ddbba62d3ac544409c6a9a12ef4304fd18d93243e2fa5f059775957', '[\"*\"]', NULL, NULL, '2025-06-16 20:33:58', '2025-06-16 20:33:58'),
(5, 'App\\Models\\User', 2, 'auth_token', 'e5b6842ab927417ce33015f5c4de70fd8f97444c04e84e6eb813356b75e71e51', '[\"*\"]', NULL, NULL, '2025-06-16 20:34:09', '2025-06-16 20:34:09'),
(6, 'App\\Models\\User', 2, 'auth_token', '7a4c0cdb2c806a9f649c32082ccab40e031eda745600c3a4bb0c5733928ee7e6', '[\"*\"]', NULL, NULL, '2025-06-16 20:34:15', '2025-06-16 20:34:15'),
(7, 'App\\Models\\User', 2, 'auth_token', '4f46b9133527f2d06f75ca148e22bcfdec83dc488ffdb43466abfa6a820dba27', '[\"*\"]', NULL, NULL, '2025-06-16 20:45:04', '2025-06-16 20:45:04'),
(8, 'App\\Models\\User', 2, 'auth_token', '474b36ac5f57b4f33d4c72735dffc2762dfec392034b88d78813583a2f9c72ed', '[\"*\"]', NULL, NULL, '2025-06-16 20:46:39', '2025-06-16 20:46:39'),
(9, 'App\\Models\\User', 2, 'auth_token', '4f6522ce14d2ed9a85a16bbec2317523e192a0a1ca82193470b6435a8649b69b', '[\"*\"]', NULL, NULL, '2025-06-16 20:47:43', '2025-06-16 20:47:43'),
(10, 'App\\Models\\User', 2, 'auth_token', '9b9e0966766ccfb86d6c2d970a98ad87538d4920b48ccc4c486bcc5edffde2cf', '[\"*\"]', '2025-06-16 22:20:09', NULL, '2025-06-16 20:56:11', '2025-06-16 22:20:09'),
(11, 'App\\Models\\User', 2, 'auth_token', '93aebd85bbf43292d0689bf8162798f8567377cb556ad2fb4d4799c4adaa9493', '[\"*\"]', '2025-06-16 22:00:03', NULL, '2025-06-16 21:12:07', '2025-06-16 22:00:03'),
(12, 'App\\Models\\User', 2, 'auth_token', '6e3f9162996581deb1ab8ff1b663d74df8e138493d233c450bde2541bfbbbe9f', '[\"*\"]', '2025-06-16 22:21:02', NULL, '2025-06-16 22:20:53', '2025-06-16 22:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('iRgvcHMxEvnQCkiGROybPT2JJqdZIiehnsoyK60l', NULL, '127.0.0.1', 'PostmanRuntime/7.37.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUxXNDNhWFhiWFltcldOQjMwWllodVFuMkFmZUpoMUc3N2Q4NmUzTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750130380);

-- --------------------------------------------------------

--
-- Table structure for table `tempat_wisatas`
--

CREATE TABLE `tempat_wisatas` (
  `id_wisata` bigint(20) UNSIGNED NOT NULL,
  `id_kota` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `nama_wisata` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `url_foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tempat_wisatas`
--

INSERT INTO `tempat_wisatas` (`id_wisata`, `id_kota`, `id_kategori`, `nama_wisata`, `deskripsi`, `alamat`, `url_foto`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Monumen Nasional (Monas)', 'Ikon Jakarta dan Indonesia, tugu peringatan setinggi 132 meter dengan puncak api berlapis emas.', 'Gambir, Jakarta Pusat, DKI Jakarta', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Monas_View_From_The_Top.jpg/800px-Monas_View_From_The_Top.jpg', NULL, NULL),
(2, 1, 5, 'Taman Impian Jaya Ancol', 'Kawasan wisata terpadu terbesar di Jakarta yang menawarkan pantai, Dunia Fantasi, Sea World, dan banyak lagi.', 'Jl. Lodan Timur No.7, Ancol, Pademangan, Jakarta Utara', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Dufan_gate.JPG/1280px-Dufan_gate.JPG', NULL, NULL),
(3, 1, 3, 'Kota Tua Jakarta', 'Kawasan bersejarah dengan bangunan-bangunan peninggalan era kolonial Belanda, kini menjadi pusat museum dan kafe.', 'Taman Fatahillah, Pinangsia, Tamansari, Jakarta Barat', 'https://upload.wikimedia.org/wikipedia/commons/4/47/Fatahillah_Square_in_the_evening%2C_Jakarta_2014-05-30_02.jpg', NULL, NULL),
(4, 2, 2, 'Kawah Putih Ciwidey', 'Danau kawah vulkanik yang menakjubkan dengan air berwarna putih kehijauan yang dapat berubah warna.', 'Jl. Raya Soreang - Ciwidey, Sugihmukti, Pasirjambu, Bandung', 'https://upload.wikimedia.org/wikipedia/commons/f/f2/Kawah_Putih_Juli_2018.jpg', NULL, NULL),
(5, 2, 5, 'Farmhouse Lembang', 'Tempat wisata populer dengan konsep peternakan ala Eropa, lengkap dengan rumah hobbit dan penyewaan kostum.', 'Jl. Raya Lembang No. 108, Gudangkahuripan, Lembang, Bandung Barat', 'https://upload.wikimedia.org/wikipedia/commons/a/a2/Farm_House_Lembang_Bandung_Barat_Jawa_Barat.jpg', NULL, NULL),
(6, 2, 4, 'Jalan Braga', 'Jalan ikonik di Bandung yang terkenal dengan bangunan arsitektur art deco, kafe, dan galeri seni.', 'Jl. Braga, Braga, Sumur Bandung, Kota Bandung', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Gedung_Landmark_Bandung_%281%29.jpg/1024px-Gedung_Landmark_Bandung_%281%29.jpg', NULL, NULL),
(7, 3, 3, 'Candi Borobudur', 'Mahakarya arsitektur Buddha dan monumen terbesar di dunia, sebuah situs warisan dunia UNESCO.', 'Jl. Badrawati, Kw. Candi Borobudur, Borobudur, Magelang', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Borobudur-Nothwest-view.jpg/1200px-Borobudur-Nothwest-view.jpg', NULL, NULL),
(8, 3, 1, 'Pantai Parangtritis', 'Pantai paling terkenal di Yogyakarta yang kaya akan mitos dan legenda, serta pemandangan matahari terbenam yang indah.', 'Parangtritis, Kretek, Bantul, Daerah Istimewa Yogyakarta', 'https://upload.wikimedia.org/wikipedia/commons/8/87/Parangtritis_Beach%2C_Yogyakarta.jpg', NULL, NULL),
(9, 3, 4, 'Jalan Malioboro', 'Jantung kota Yogyakarta, pusat perbelanjaan oleh-oleh, kerajinan tangan, dan kuliner lesehan yang hidup 24 jam.', 'Jl. Malioboro, Sosromenduran, Gedong Tengen, Kota Yogyakarta', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/2016_Yogyakarta_Malioboro_Street_at_night.jpg/1280px-2016_Yogyakarta_Malioboro_Street_at_night.jpg', NULL, NULL),
(10, 5, 1, 'Pantai Kuta', 'Pantai paling ikonik di Bali yang terkenal dengan pasir putihnya, ombak untuk berselancar, dan kehidupan malamnya.', 'Kuta, Kabupaten Badung, Bali', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Kuta_Beach_Bali_Indonesia.jpg/1280px-Kuta_Beach_Bali_Indonesia.jpg', NULL, NULL),
(11, 5, 3, 'Pura Tanah Lot', 'Pura laut yang megah, terletak di atas batu karang besar di tengah laut dan menjadi spot matahari terbenam yang magis.', 'Beraban, Kediri, Kabupaten Tabanan, Bali', 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Tanah_Lot_Temple_in_Bali_01.jpg', NULL, NULL),
(12, 5, 5, 'Garuda Wisnu Kencana (GWK)', 'Taman budaya dengan patung raksasa Dewa Wisnu menunggangi Garuda yang menjadi salah satu patung tertinggi di dunia.', 'Jl. Raya Uluwatu, Ungasan, Kuta Selatan, Kabupaten Badung, Bali', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Garuda_Wisnu_Kencana_statue_in_Bali_2018.jpg/800px-Garuda_Wisnu_Kencana_statue_in_Bali_2018.jpg', NULL, NULL),
(13, 6, 1, 'Pantai Senggigi', 'Garis pantai yang indah di sebelah barat Lombok dengan pemandangan matahari terbenam yang menawan dan suasana yang lebih tenang dari Bali.', 'Jl. Raya Senggigi, Batu Layar, Kabupaten Lombok Barat', 'https://upload.wikimedia.org/wikipedia/commons/3/30/Senggigi_beach_in_the_afternoon.jpg', NULL, NULL),
(14, 6, 2, 'Gunung Rinjani', 'Gunung berapi tertinggi kedua di Indonesia yang menawarkan pendakian menantang dengan pemandangan danau kawah Segara Anak yang luar biasa.', 'Taman Nasional Gunung Rinjani, Lombok', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Mount_Rinjani_and_Segara_Anak.jpg/1280px-Mount_Rinjani_and_Segara_Anak.jpg', NULL, NULL),
(15, 9, 2, 'Kebun Raya Bogor', 'Salah satu kebun raya tertua di dunia, dengan ribuan koleksi flora dan menjadi paru-paru kota di tengah Istana Bogor.', 'Jl. Ir. H. Juanda No.13, Paledang, Kecamatan Bogor Tengah, Kota Bogor', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Taman_Meksiko_Kebun_Raya_Bogor.jpg/1024px-Taman_Meksiko_Kebun_Raya_Bogor.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-06-16 19:16:15', '$2y$12$cz05pXwkOdl4scFm3mFGgO81IDcIM8AR60P8y/.oePKcuuAw5gPaK', 'Lk1RkxEqHz', '2025-06-16 19:16:16', '2025-06-16 19:16:16'),
(2, 'alfan', 'alfan@gmail.com', NULL, '$2y$12$wfl7chbdVslfAuXt/H6fXeIXRaogxcuMwOxMibJecqty7wMrhe9eG', NULL, '2025-06-16 20:03:29', '2025-06-16 20:03:29'),
(3, 'tes1', 'akun3@gmail.com', NULL, '$2y$12$zVXs6YWVQ8/OazFsgC7Pq.nPHwCKtPfLwSXPBk4wq7bGnf6H.tKQe', NULL, '2025-06-16 20:07:36', '2025-06-16 20:07:36'),
(4, 'alfan1', 'alfan1@gmail.com', NULL, '$2y$12$blV.GaqNtmp70xH9K4Qx2et2jt4FFm5wV1KyWW74NZjkj5OtBjR1O', NULL, '2025-06-16 20:22:48', '2025-06-16 20:22:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorit`
--
ALTER TABLE `favorit`
  ADD PRIMARY KEY (`user_id`,`id_wisata`),
  ADD KEY `favorit_id_wisata_foreign` (`id_wisata`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `kategori_nama_kategori_unique` (`nama_kategori`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id_kota`),
  ADD UNIQUE KEY `kota_nama_kota_unique` (`nama_kota`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tempat_wisatas`
--
ALTER TABLE `tempat_wisatas`
  ADD PRIMARY KEY (`id_wisata`),
  ADD KEY `tempat_wisatas_id_kota_foreign` (`id_kota`),
  ADD KEY `tempat_wisatas_id_kategori_foreign` (`id_kategori`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id_kota` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tempat_wisatas`
--
ALTER TABLE `tempat_wisatas`
  MODIFY `id_wisata` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorit`
--
ALTER TABLE `favorit`
  ADD CONSTRAINT `favorit_id_wisata_foreign` FOREIGN KEY (`id_wisata`) REFERENCES `tempat_wisatas` (`id_wisata`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorit_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tempat_wisatas`
--
ALTER TABLE `tempat_wisatas`
  ADD CONSTRAINT `tempat_wisatas_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `tempat_wisatas_id_kota_foreign` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id_kota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
