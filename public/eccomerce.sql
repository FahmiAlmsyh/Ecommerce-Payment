-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 31, 2024 at 07:23 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eccomerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `qty`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(12, 2, 2, 2, '2024-10-30 23:17:40', '2024-10-30 23:17:40');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_10_30_060241_create_products_table', 1),
(6, '2024_10_30_092529_create_carts_table', 1),
(7, '2024_10_30_123013_create_transactions_table', 1),
(8, '2024_10_30_124733_create_transaction_items_table', 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `foto` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `show` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `foto`, `nama`, `deskripsi`, `harga`, `qty`, `show`, `created_at`, `updated_at`) VALUES
(1, 'uploads/foto_product/1suwcD2Dhl2ADtsUabnHvTMK5H5A58OnO49hicxq.jpg', 'JAKET BIKER KULIT IMITASI', 'dnjdnq', 900000, 0, 0, '2024-10-30 05:57:57', '2024-10-30 23:20:10'),
(2, 'uploads/foto_product/3tATnRDfUlSysLHCUetfVyocAv8sqR1YZFItKydT.jpg', 'Diagonal Fleece Zip Hoodie', 'cdkdckddc', 3000000, 3, 1, '2024-10-30 05:58:13', '2024-10-30 23:20:06');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telp` int(11) NOT NULL,
  `courier` varchar(255) DEFAULT NULL,
  `payment` varchar(255) NOT NULL DEFAULT 'MIDTRANS',
  `payment_url` varchar(255) DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `name`, `email`, `address`, `telp`, `courier`, `payment`, `payment_url`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'fahm', 'a@gmail.com', 'fahjm', 3456, NULL, 'MIDTRANS', NULL, 9000000, 'PENDING', '2024-10-30 05:58:36', '2024-10-30 05:58:36'),
(2, 2, 'fahm', 'a@gmail.com', 'bhsbh', 567, NULL, 'MIDTRANS', 'https://app.sandbox.midtrans.com/snap/v4/redirection/22956180-745d-44e3-91c7-cadd5d0ce8aa', 6000000, 'PENDING', '2024-10-30 06:03:10', '2024-10-30 06:03:11'),
(3, 2, 'snj', 'a@gmail.com', 'bsnj', 63637, NULL, 'MIDTRANS', 'https://app.sandbox.midtrans.com/snap/v4/redirection/aa873545-8658-4de6-821c-eebb3e2d7f0b', 3000000, 'PENDING', '2024-10-30 06:04:57', '2024-10-30 06:04:57'),
(4, 2, 'fahm', 'a@g.com', 'bkn', 789, NULL, 'MIDTRANS', 'https://app.sandbox.midtrans.com/snap/v4/redirection/b0bba051-8768-4df1-88f2-b5627d919253', 3000000, 'PENDING', '2024-10-30 06:07:50', '2024-10-30 06:07:50'),
(5, 1, 'afah', 'a@gmao.com', 'bsdbj', 283, NULL, 'MIDTRANS', 'https://app.sandbox.midtrans.com/snap/v4/redirection/5d7068a2-371d-497b-9a0e-79f91a3cb89d', 3000000, 'PENDING', '2024-10-30 06:14:47', '2024-10-30 06:14:47'),
(6, 2, 'snj', 'a@g.com', 'njsxn', 567, NULL, 'MIDTRANS', 'https://app.sandbox.midtrans.com/snap/v4/redirection/3c839b60-7e20-4fed-ba21-a97efbd89e22', 9000000, 'PENDING', '2024-10-30 06:23:23', '2024-10-30 06:23:23'),
(7, 2, 'Fahmi', 'a@gmail.com', 'dfgh', 456, NULL, 'MIDTRANS', 'https://app.sandbox.midtrans.com/snap/v4/redirection/aabc3d70-78f6-426b-ac33-054db585b2c9', 900000, 'PENDING', '2024-10-30 08:18:13', '2024-10-30 08:18:13'),
(8, 2, 'Abdul', 'abdul@gmail.com', 'Yogyakarta', 98927368, NULL, 'MIDTRANS', 'https://app.sandbox.midtrans.com/snap/v4/redirection/6b68cee1-0324-4a15-85ad-5e709da203f4', 3000000, 'PENDING', '2024-10-30 23:09:00', '2024-10-30 23:09:00'),
(9, 2, 'Ali', 'ali@gmail.com', 'Jakarta', 123456, NULL, 'MIDTRANS', 'https://app.sandbox.midtrans.com/snap/v4/redirection/f971c325-0453-4d9f-99e2-7d47d28d072d', 3000000, 'PENDING', '2024-10-30 23:12:23', '2024-10-30 23:12:23'),
(10, 2, 'Abdul', 'abdul@gmail.com', 'Bandung', 123456, NULL, 'MIDTRANS', 'https://app.sandbox.midtrans.com/snap/v4/redirection/c8446131-5094-4e17-ab70-ac3428b5616c', 6000000, 'PENDING', '2024-10-30 23:15:17', '2024-10-30 23:15:18'),
(11, 1, 'abc@g.com', 'a@g.com', 'Bali', 123456, NULL, 'MIDTRANS', 'https://app.sandbox.midtrans.com/snap/v4/redirection/10e13649-b1da-4c4e-a23d-319014e2001f', 3000000, 'PENDING', '2024-10-30 23:16:58', '2024-10-30 23:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_items`
--

INSERT INTO `transaction_items` (`id`, `user_id`, `product_id`, `transaction_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 1, 3, '2024-10-30 05:58:36', '2024-10-30 05:58:36'),
(2, 2, 2, 2, 2, '2024-10-30 06:03:10', '2024-10-30 06:03:10'),
(3, 2, 2, 3, 1, '2024-10-30 06:04:57', '2024-10-30 06:04:57'),
(4, 2, 2, 4, 1, '2024-10-30 06:07:50', '2024-10-30 06:07:50'),
(5, 1, 2, 5, 1, '2024-10-30 06:14:47', '2024-10-30 06:14:47'),
(6, 2, 1, 6, 10, '2024-10-30 06:23:23', '2024-10-30 06:23:23'),
(7, 2, 1, 7, 1, '2024-10-30 08:18:13', '2024-10-30 08:18:13'),
(8, 2, 2, 8, 1, '2024-10-30 23:09:00', '2024-10-30 23:09:00'),
(9, 2, 2, 9, 1, '2024-10-30 23:12:23', '2024-10-30 23:12:23'),
(10, 2, 2, 10, 2, '2024-10-30 23:15:17', '2024-10-30 23:15:17'),
(11, 1, 2, 11, 1, '2024-10-30 23:16:58', '2024-10-30 23:16:58');

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
  `roles` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Fahmi', 'a@gmail.com', NULL, '$2y$12$ICO0Ik1ZeWUCuMDCrWyq8Onlb7NKHl.rWkXs6E0Z6qPKMYwweUkDa', 'USER', NULL, '2024-10-30 05:56:49', '2024-10-30 05:56:49'),
(2, 'Fahm', 'a@g.com', NULL, '$2y$12$24moQ4//i1rQDxu3HlWKaujWRNPmYDbusbJZVVgMnna8kFTpDsKcS', 'ADMIN', NULL, '2024-10-30 05:57:06', '2024-10-30 05:57:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_items_user_id_foreign` (`user_id`),
  ADD KEY `transaction_items_product_id_foreign` (`product_id`),
  ADD KEY `transaction_items_transaction_id_foreign` (`transaction_id`);

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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `transaction_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `transaction_items_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `transaction_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
