-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2024 at 07:18 AM
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
-- Database: `laravel_online_shop`
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

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('swagat@gmauil.com|127.0.0.1', 'i:1;', 1719300715),
('swagat@gmauil.com|127.0.0.1:timer', 'i:1719300715;', 1719300715);

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
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(23, 1, 7, '2024-06-27 05:34:36', '2024-06-27 05:34:36'),
(25, 1, 12, '2024-06-27 06:11:59', '2024-06-27 06:11:59'),
(26, 1, 3, '2024-06-27 07:37:22', '2024-06-27 07:37:22');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(2, 'book', '2024-06-22 06:19:02', '2024-06-22 07:34:32'),
(3, 'women', '2024-06-22 06:19:25', '2024-06-22 06:19:25'),
(6, 'Men', '2024-06-24 01:49:42', '2024-06-24 01:49:42'),
(7, 'mobile', '2024-06-24 01:49:50', '2024-06-24 01:49:59'),
(8, 'shoe', '2024-06-26 00:02:06', '2024-06-26 00:02:06'),
(9, 'laptop', '2024-06-26 00:03:00', '2024-06-26 00:03:00'),
(10, 'tablet', '2024-06-26 00:03:09', '2024-06-26 00:03:09'),
(11, 'sunglasses', '2024-06-26 00:03:19', '2024-06-26 00:03:19'),
(12, 'watch', '2024-06-26 00:03:41', '2024-06-26 00:03:41'),
(13, 'bag', '2024-06-26 00:11:35', '2024-06-26 00:11:35'),
(14, 'charger', '2024-06-26 00:11:56', '2024-06-26 00:11:56');

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
(4, '0001_01_01_000000_create_users_table', 1),
(5, '0001_01_01_000001_create_cache_table', 1),
(6, '0001_01_01_000002_create_jobs_table', 1),
(7, '2024_06_22_113107_create_categories_table', 2),
(8, '2024_06_24_051116_create_products_table', 3),
(9, '2024_06_24_060645_add_new_column_to_products_table', 4),
(10, '2024_06_25_061014_create_carts_table', 5),
(11, '2024_06_25_104528_create_orders_table', 6),
(12, '2024_06_27_063226_add_payment_status_to_orders_table', 7),
(13, '2024_06_27_124401_add_slug_column_to_products_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rec_address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'in progress',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'cash on delivery',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `rec_address`, `phone`, `status`, `user_id`, `product_id`, `payment_status`, `created_at`, `updated_at`) VALUES
(6, 'sohan', 'bbsr', '1234567890', 'Delivered', 1, 3, 'cash on delivery', '2024-06-25 06:24:29', '2024-06-26 01:34:42'),
(7, 'sohan', 'bbsr', '1234567890', 'Delivered', 1, 8, 'cash on delivery', '2024-06-25 06:24:29', '2024-06-27 04:46:26'),
(8, 'swagat', 'bbsr', '1234567890', 'Delivered', 3, 3, 'cash on delivery', '2024-06-25 23:44:58', '2024-06-27 04:46:05'),
(9, 'sohan', 'bbsr', '1234567890', 'Delivered', 1, 3, 'cash on delivery', '2024-06-26 05:25:30', '2024-06-27 04:46:06'),
(10, 'sohan', NULL, '1234567890', 'Delivered', 1, 12, 'paid', '2024-06-27 04:11:02', '2024-06-27 04:46:07'),
(11, 'sohan', NULL, '1234567890', 'Delivered', 1, 11, 'paid', '2024-06-27 04:14:34', '2024-06-27 04:46:08'),
(12, 'sohan', NULL, '1234567890', 'Delivered', 1, 13, 'paid', '2024-06-27 04:16:30', '2024-06-27 04:46:14'),
(13, NULL, NULL, NULL, 'Delivered', 1, 14, 'paid', '2024-06-27 04:35:03', '2024-06-27 04:46:15'),
(14, 'sohan', 'dharamgarh', '1234567890', 'Delivered', 1, 15, 'paid', '2024-06-27 04:44:11', '2024-06-27 04:46:15'),
(15, 'sohan', 'bbsr', '1234567890', 'Delivered', 1, 8, 'cash on delivery', '2024-06-27 04:44:59', '2024-06-27 04:46:23'),
(16, 'milan', 'kalahandi', '832894766', 'Delivered', 1, 17, 'cash on delivery', '2024-06-27 04:45:30', '2024-06-27 04:46:19'),
(17, 'sohan', 'bbsr', '1234567890', 'Delivered', 1, 16, 'paid', '2024-06-27 04:57:57', '2024-06-27 05:29:14');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `image`, `category`, `quantity`, `slug`, `created_at`, `updated_at`) VALUES
(3, 'iphone 15', 'ios', '70000', '1719213721.webp', 'mobile', '100', 'iphone15', '2024-06-24 01:52:01', '2024-06-24 01:52:01'),
(7, 'shirt', 'cutton shirt', '1000', '1719215796.jfif', 'Men', '15', 'shirt1', '2024-06-24 02:26:36', '2024-06-24 02:26:36'),
(8, 'Wings of fire', 'a book for youth', '1000', '1719226877.jpg', 'book', '10', 'wingsoffire1', '2024-06-24 05:31:17', '2024-06-24 05:31:17'),
(9, 'samsung', 'android', '25000', '1719317382.webp', 'mobile', '10', 'samsung1', '2024-06-25 06:39:42', '2024-06-25 06:39:42'),
(10, 'ipad', 'ios', '100000', '1719380055.webp', 'tablet', '10', 'ipad1', '2024-06-26 00:04:15', '2024-06-26 00:04:15'),
(11, 'casio watch', 'analog watch', '12000', '1719380088.jpg', 'watch', '10', 'casio1', '2024-06-26 00:04:48', '2024-06-26 00:04:48'),
(12, 'Nike Jordan', 'snikkers', '27000', '1719380132.jfif', 'shoe', '10', 'nike1', '2024-06-26 00:05:32', '2024-06-26 00:05:32'),
(13, 'Hp laptop', 'windows 11', '90000', '1719380233.jpg', 'laptop', '10', 'hp1', '2024-06-26 00:07:13', '2024-06-26 00:07:13'),
(14, 'sunglass', 'Day glasses', '8000', '1719380293.jpg', 'sunglasses', '10', 'sunglass1', '2024-06-26 00:08:13', '2024-06-26 00:08:13'),
(15, 'iphone charger', '20w charger', '1900', '1719380545.jpg', 'charger', '100', 'charger1', '2024-06-26 00:12:25', '2024-06-26 00:12:25'),
(16, 'Mac book', 'ios', '150000', '1719380571.jfif', 'laptop', '10', 'mac1', '2024-06-26 00:12:51', '2024-06-26 00:12:51'),
(17, 'Laptop bag', 'Bag uses for carry laptop', '2000', '1719380610.webp', 'bag', '10', 'bag1', '2024-06-26 00:13:30', '2024-06-26 00:13:30'),
(18, 'Ignited minds', 'A book by APJ Abdul Kalam', '500', '1719493026.jfif', 'book', '10', 'ignited-minds', '2024-06-27 07:27:06', '2024-06-27 07:27:06');

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
('ILt6rbS5otvMkFZNk55BmZqTc7YNTjvBNEQbDrH4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQjhrZEpvczd4ZllHSDJEdEU2ZHlUS0N1TWVBRFQyT3FvVnF0UUJvbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9fQ==', 1719551791),
('vC30grVl5vHWtXwk4fPOdEvDZfHaMoeEEtokEpBf', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoib3ZiY3ZVS3FsRlV1OHB3NG1HN1E1ZjdINTY3UHB1N1FrbkZBMm9yMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1719496240);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usertype` varchar(255) NOT NULL DEFAULT 'user',
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `usertype`, `phone`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sohan', 'sohanpatra3@gmail.com', 'user', '1234567890', 'bbsr', NULL, '$2y$12$c/AF4LGRyWV9R5ofZSMH7eLO/jUzia2OLiPnOgCywhIiv9td3Ez3m', NULL, '2024-06-22 00:08:31', '2024-06-22 00:08:31'),
(2, 'admin', 'admin@gmail.com', 'admin', '1234567890', 'bbsr', NULL, '$2y$12$3Xbu1wsyx2mVUsK7QT6D2e8ZD1rahURsEWoS2FyaokMHCUro1qy9y', NULL, '2024-06-22 00:11:38', '2024-06-22 00:11:38'),
(3, 'swagat', 'swagat@gmail.com', 'user', '1234567890', 'bbsr', NULL, '$2y$12$fwkwxRhI0djUJ662tjKTweiH1CCbk8SfcnyUBWMs/VZTFQhd7gn3e', NULL, '2024-06-22 01:26:44', '2024-06-22 01:26:44');

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
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
