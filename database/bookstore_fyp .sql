-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 24, 2024 at 05:31 AM
-- Server version: 8.0.31
-- PHP Version: 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore_fyp`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banners_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Offer Offer', 'offer-offer', '/storage/photos/1/ban1.png', NULL, 'active', '2024-04-21 09:56:41', '2024-04-21 09:56:41'),
(2, 'Exclusive Discount', 'exclusive-discount', '/storage/photos/1/ssban.png', NULL, 'active', '2024-04-21 09:57:00', '2024-04-21 09:57:00'),
(4, 'Banner', 'banner', '/storage/photos/1/childcver (1).jpg', '<p>This is Banner</p>', 'active', '2024-04-22 09:00:46', '2024-04-22 09:00:46'),
(5, 'Banner', 'banner-2404224612-10', '/storage/photos/1/22710204.jpg', NULL, 'active', '2024-04-22 09:01:12', '2024-04-22 09:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(3, 'West Land', 'west-land', 'active', '2024-04-21 09:50:13', '2024-04-21 09:50:13'),
(2, 'Fine Print', 'fine-print', 'active', '2024-04-21 09:44:52', '2024-04-21 09:44:52'),
(4, 'HarperCollins Publishers', 'harpercollins-publishers', 'active', '2024-04-21 09:50:41', '2024-04-21 09:50:41'),
(5, 'Penguin Random House India', 'penguin-random-house-india', 'active', '2024-04-21 09:50:51', '2024-04-21 09:50:51'),
(6, 'Ratna Pustak Bhandar', 'ratna-pustak-bhandar', 'active', '2024-04-21 09:51:00', '2024-04-21 09:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_order_id_foreign` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(5, 1, NULL, 2, 1122.00, 'new', 1, 1122.00, '2024-04-19 09:58:15', '2024-04-19 09:58:15'),
(11, 3, NULL, 6, 950.00, 'new', 1, 1000.00, '2024-04-22 07:18:19', '2024-04-22 07:18:19'),
(9, 1, NULL, 3, 660.00, 'new', 2, 1320.00, '2024-04-21 10:21:15', '2024-04-21 21:00:40'),
(12, 5, NULL, 9, 711.00, 'new', 1, 711.00, '2024-04-22 09:17:56', '2024-04-22 09:47:04'),
(14, 3, NULL, 9, 950.00, 'new', 1, 950.00, '2024-04-22 09:46:20', '2024-04-22 09:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_added_by_foreign` (`added_by`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fiction', 'dfseads', '<p><br></p>', '/storage/photos/1/fictioncover (1).jpg', 1, NULL, NULL, 'active', '2024-04-19 04:04:14', '2024-04-21 09:43:10'),
(2, 'Non-Fiction', 'non-fiction', NULL, '/storage/photos/1/non (1).png', 1, NULL, NULL, 'active', '2024-04-21 09:43:29', '2024-04-21 09:43:29'),
(3, 'Children\'s Book', 'childrens-book', NULL, '/storage/photos/1/childcver (1).jpg', 1, NULL, NULL, 'active', '2024-04-21 09:49:03', '2024-04-21 09:49:03'),
(4, 'Biography', 'biography', NULL, '/storage/photos/1/bio.jpg', 1, NULL, NULL, 'active', '2024-04-21 09:49:18', '2024-04-21 09:49:18'),
(5, 'Religious', 'religious', NULL, '/storage/photos/1/rel (1).jpg', 1, NULL, NULL, 'active', '2024-04-21 09:49:31', '2024-04-21 09:49:31'),
(6, 'Self-Help', 'self-help', NULL, '/storage/photos/1/self (1).jpg', 1, NULL, NULL, 'active', '2024-04-21 09:49:46', '2024-04-21 09:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', '300.00', 'active', NULL, NULL),
(2, '111111', 'percent', '10.00', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'swechhya', 'need a book', 'sb@gmail.com', NULL, '9829277637', 'I want the book of Collen Hover', NULL, '2024-04-22 11:15:00', '2024-04-22 11:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_07_10_021010_create_brands_table', 1),
(6, '2020_07_10_025334_create_banners_table', 1),
(7, '2020_07_10_112147_create_categories_table', 1),
(8, '2020_07_11_063857_create_products_table', 1),
(9, '2020_07_12_073132_create_post_categories_table', 1),
(10, '2020_07_12_073701_create_post_tags_table', 1),
(11, '2020_07_12_083638_create_posts_table', 1),
(12, '2020_07_13_151329_create_messages_table', 1),
(13, '2020_07_14_023748_create_shippings_table', 1),
(14, '2020_07_15_054356_create_orders_table', 1),
(15, '2020_07_15_102626_create_carts_table', 1),
(16, '2020_07_16_041623_create_notifications_table', 1),
(17, '2020_07_16_053240_create_coupons_table', 1),
(18, '2020_07_23_143757_create_wishlists_table', 1),
(19, '2020_07_24_074930_create_product_reviews_table', 1),
(20, '2020_07_24_131727_create_post_comments_table', 1),
(21, '2020_08_01_143408_create_settings_table', 1),
(22, '2023_06_21_164432_create_jobs_table', 1),
(23, '2024_04_19_074246_create_payments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('3937e65b-8871-47a5-8fd1-63259210e21f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/binod-chaudhary\",\"fas\":\"fa-star\"}', NULL, '2024-04-21 10:27:13', '2024-04-21 10:27:13'),
('43784025-091d-4cca-b962-304f7c4a9e42', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/bookselling\",\"fas\":\"fas fa-comment\"}', NULL, '2024-04-22 11:12:05', '2024-04-22 11:12:05'),
('7c7af86e-a9ea-4d3a-af8c-d76feeb5c05e', 'App\\Notifications\\StatusNotification', 'App\\User', 4, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/bookselling\",\"fas\":\"fas fa-comment\"}', NULL, '2024-04-22 11:12:05', '2024-04-22 11:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `payment_method` enum('cod','esewa') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_shipping_id_foreign` (`shipping_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(1, 'ORD-AL07HK4VQX', 2, 4668.00, NULL, NULL, 4668.00, 4, 'esewa', 'unpaid', 'new', 'Jessica', 'Morales', 'tepasuw@mailinator.com', '52', 'NP', 'Praesentium quaerat', '917 South Green Milton Parkway', 'Quia deserunt esse', '2024-04-19 04:16:17', '2024-04-19 04:16:17'),
(2, 'ORD-BLVCPBQFSQ', 2, 2334.00, NULL, NULL, 2334.00, 2, 'esewa', 'unpaid', 'new', 'Bree', 'Osborne', 'tyfylit@mailinator.com', '55', 'NP', 'Ut esse duis anim co', '144 Nobel Freeway', 'Ab ullamco qui archi', '2024-04-19 09:55:41', '2024-04-19 09:55:41'),
(3, 'ORD-NEW6D4IYU7', 2, 1122.00, NULL, NULL, 1122.00, 1, 'esewa', 'unpaid', 'new', 'Clementine', 'Hull', 'gimazi@mailinator.com', '79', 'NP', 'Odio in voluptatem r', '859 Hague Street', 'Facilis eos quas et', '2024-04-19 09:58:27', '2024-04-19 09:58:27'),
(4, 'ORD-ZSGX03WSTK', 2, 1122.00, NULL, NULL, 1122.00, 1, 'esewa', 'unpaid', 'new', 'Barclay', 'Cantrell', 'qihyp@mailinator.com', '100899192', 'NP', 'Omnis quos consectet', '299 New Avenue', 'Excepturi corrupti', '2024-04-21 09:35:34', '2024-04-21 09:35:34'),
(5, 'ORD-HCQHTIJT8N', 2, 1122.00, NULL, NULL, 1122.00, 1, 'esewa', 'unpaid', 'new', 'Cally', 'Johnson', 'tykaxi@mailinator.com', '94343243', 'NP', 'Consequatur consequ', '813 Green Cowley Court', 'Do rem consequat Au', '2024-04-21 09:38:02', '2024-04-21 09:38:02'),
(6, 'ORD-Z65THBGNU2', 2, 1122.00, NULL, NULL, 1122.00, 1, 'esewa', 'unpaid', 'new', 'Cally', 'Johnson', 'tykaxi@mailinator.com', '94343243', 'NP', 'Consequatur consequ', '813 Green Cowley Court', 'Do rem consequat Au', '2024-04-21 09:39:15', '2024-04-21 09:39:15'),
(7, 'ORD-XMMJDS9BE9', 3, 1122.00, NULL, NULL, 1122.00, 1, 'esewa', 'unpaid', 'new', 'Seth', 'Fulton', 'cymy@mailinator.com', '665643232', 'NP', 'Provident omnis acc', '692 South Milton Boulevard', 'Cumque alias consect', '2024-04-21 09:41:03', '2024-04-21 09:41:03'),
(8, 'ORD-FTUODLZVWK', 3, 1122.00, NULL, NULL, 1122.00, 1, 'esewa', 'unpaid', 'new', 'Nathan', 'Fuller', 'fuku@mailinator.com', '3443523', 'NP', 'Enim aliquam necessi', '43 South Cowley Freeway', 'Dolor in quam eu rer', '2024-04-21 09:47:56', '2024-04-21 09:47:56'),
(9, 'ORD-Y72JOUW4LH', 3, 1610.00, NULL, NULL, 1610.00, 2, 'esewa', 'unpaid', 'new', 'Silas', 'Bray', 'posoboh@mailinator.com', '80', 'NP', 'Excepteur esse impe', '751 North Second Drive', 'Modi dolore et nulla', '2024-04-21 09:55:19', '2024-04-21 09:55:19'),
(10, 'ORD-XZ9GDKWNW6', 3, 950.00, NULL, NULL, 855.00, 1, 'esewa', 'unpaid', 'process', 'Ira', 'Dunlap', 'kimo@mailinator.com', '68543322', 'NP', 'Non quos dolore omni', '17 Green Clarendon Drive', 'Facilis itaque eveni', '2024-04-21 09:59:29', '2024-04-22 08:25:16'),
(11, 'ORD-LGT5RJNG1U', 3, 660.00, NULL, NULL, 565.00, 1, 'esewa', 'unpaid', 'delivered', 'Lee', 'Hanson', 'syrifaz@mailinator.com', '1345221', 'NP', 'A qui eiusmod hic hi', '68 Hague Boulevard', 'Irure ratione dicta', '2024-04-21 10:12:54', '2024-04-22 08:24:24'),
(12, 'ORD-UZLVJMMJKN', 3, 660.00, NULL, NULL, 565.00, 1, 'esewa', 'unpaid', 'delivered', 'Lee', 'Hanson', 'syrifaz@mailinator.com', '1345221', 'NP', 'A qui eiusmod hic hi', '68 Hague Boulevard', 'Irure ratione dicta', '2024-04-21 10:13:49', '2024-04-22 08:24:34'),
(13, 'ORD-R21ZHEDQXW', 3, 660.00, NULL, NULL, 565.00, 1, 'esewa', 'unpaid', 'process', 'Lee', 'Hanson', 'syrifaz@mailinator.com', '1345221', 'NP', 'A qui eiusmod hic hi', '68 Hague Boulevard', 'Irure ratione dicta', '2024-04-21 10:14:50', '2024-04-22 08:25:22'),
(14, 'ORD-PRUOHYUAII', 3, 660.00, NULL, NULL, 565.00, 1, 'esewa', 'unpaid', 'process', 'Hiroko', 'Stephens', 'hunus@mailinator.com', '9806615181', 'NP', 'Ratione vitae enim m', '880 North Old Road', 'In necessitatibus ea', '2024-04-21 10:16:14', '2024-04-22 08:25:27'),
(15, 'ORD-9IZYHVOBLX', 3, 660.00, NULL, NULL, 565.00, 1, 'esewa', 'unpaid', 'new', 'Hiroko', 'Stephens', 'hunus@mailinator.com', '9806615181', 'NP', 'Ratione vitae enim m', '880 North Old Road', 'In necessitatibus ea', '2024-04-21 10:17:05', '2024-04-21 10:17:05'),
(16, 'ORD-BZ3DBNSKM4', 3, 660.00, NULL, NULL, 565.00, 1, 'esewa', 'unpaid', 'new', 'Hiroko', 'Stephens', 'hunus@mailinator.com', '9806615181', 'NP', 'Ratione vitae enim m', '880 North Old Road', 'In necessitatibus ea', '2024-04-21 10:17:58', '2024-04-21 10:17:58'),
(17, 'ORD-HFTNRKOJGD', 3, 660.00, NULL, NULL, 565.00, 1, 'esewa', 'unpaid', 'new', 'Kylee', 'Bullock', 'tymugih@mailinator.com', '40', 'NP', 'Iusto esse non est p', '93 Old Extension', 'Placeat consectetur', '2024-04-21 10:19:00', '2024-04-21 10:19:00'),
(18, 'ORD-0GSJLRZMY6', 3, 1100.00, NULL, NULL, 1005.00, 1, 'esewa', 'unpaid', 'new', 'Gwendolyn', 'Huff', 'zehicasi@mailinator.com', '23343242', 'NP', 'Omnis vero expedita', '49 Cowley Lane', 'Accusantium quo expe', '2024-04-21 10:21:43', '2024-04-21 10:21:43'),
(19, 'ORD-AMJVWYK87U', 3, 660.00, NULL, NULL, 660.00, 1, 'esewa', 'unpaid', 'delivered', 'Martha', 'England', 'nitety@mailinator.com', '5592927332', 'NP', 'Suscipit qui fugiat', '27 South Green Milton Street', 'Modi eos non aut am', '2024-04-21 20:52:38', '2024-04-22 08:24:48'),
(21, 'ORD-BD0FWGKZSL', 9, 1661.00, NULL, NULL, 1494.90, 2, 'cod', 'unpaid', 'new', 'Yolanda', 'Crane', 'bywalelumu@mailinator.com', '22', 'NP', 'Quaerat harum nulla', '166 West White Nobel Court', 'Harum ut non ut est', '2024-04-22 10:01:37', '2024-04-22 10:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `transaction_code`, `amount`, `quantity`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '0007BFL', '4,668.0', '2', '2', 2, '2024-04-19 04:16:43', '2024-04-19 04:16:43'),
(2, '0007BFL', '4,668.0', '2', '2', 2, '2024-04-19 04:17:28', '2024-04-19 04:17:28'),
(3, '0007BFL', '4,668.0', '2', '1', 2, '2024-04-19 04:17:28', '2024-04-19 04:17:28'),
(4, '0007BIU', '2,334.0', '1', '1', 2, '2024-04-19 09:56:26', '2024-04-19 09:56:26'),
(5, '0007BIU', '2,334.0', '1', '2', 2, '2024-04-19 09:56:26', '2024-04-19 09:56:26'),
(6, '0007C3E', '855.0', '1', '3', 3, '2024-04-21 10:00:14', '2024-04-21 10:00:14'),
(7, '0007C3H', '565.0', '1', '1', 3, '2024-04-21 10:19:39', '2024-04-21 10:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  KEY `posts_added_by_foreign` (`added_by`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Bookselling', 'bookselling', '<p><span style=\"font-weight: bold; color: rgb(95, 99, 104); font-family: arial, sans-serif; font-size: 14px;\">Bookselling</span><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">&nbsp;is the commercial trading of books which is the retail and distribution end of the publishing process. Cărturești Carusel, a bookshop in a&nbsp;...</span><br></p>', '<p>This is test</p>', '<p><span style=\"font-weight: bold; color: rgb(95, 99, 104); font-family: arial, sans-serif; font-size: 14px;\">Bookselling</span><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">&nbsp;is the commercial trading&nbsp;</span><br></p>', '/storage/photos/1/about (2).png', 'read', 1, NULL, 1, 'active', '2024-04-22 11:08:55', '2024-04-22 11:08:55');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
CREATE TABLE IF NOT EXISTS `post_categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Book', 'book', 'active', '2024-04-22 11:06:50', '2024-04-22 11:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

DROP TABLE IF EXISTS `post_comments`;
CREATE TABLE IF NOT EXISTS `post_comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  KEY `post_comments_post_id_foreign` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 9, 2, 'Nice Blog', 'active', NULL, NULL, '2024-04-22 11:12:04', '2024-04-22 11:12:04');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE IF NOT EXISTS `post_tags` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tags_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'read', 'read', 'active', '2024-04-22 11:07:02', '2024-04-22 11:07:02');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL DEFAULT '1',
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_cat_id_foreign` (`cat_id`),
  KEY `products_child_cat_id_foreign` (`child_cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'All Your Perfects', 'wdasdwasd', '<p>Best book of all time</p>', '<p><br></p>', '/storage/photos/1/3.jpg', 121, '', 'new', 'active', 1100.00, 40.00, 1, 1, NULL, 2, '2024-04-19 04:05:00', '2024-04-21 10:19:39'),
(2, 'Izoriya', 'asdwasd', '<p>Lifestyle of a Village girl story</p>', '<p><br></p>', '/storage/photos/1/izoria.jpg', 12116, '', 'new', 'active', 125.00, 3.00, 1, 1, NULL, 2, '2024-04-19 04:05:35', '2024-04-21 09:45:54'),
(3, 'Binod Chaudhary', 'binod-chaudhary', '<p>Here is the desc</p>', NULL, '/storage/photos/1/8.jpg', 13, 'Buddhi Sagar', 'default', 'active', 1000.00, 5.00, 1, 4, NULL, 6, '2024-04-21 09:52:15', '2024-04-21 10:00:14'),
(4, 'It Ends With Us', 'it-ends-with-us', '<p>Best Selling book ever</p>', NULL, '/storage/photos/1/4.jpg', 10, 'Collen Hover', 'default', 'active', 1500.00, 10.00, 1, 1, NULL, 6, '2024-04-21 09:53:20', '2024-04-21 09:53:20'),
(5, 'The Last Dream', 'the-last-dream', '<p>This is for childrens</p>', NULL, '/storage/photos/1/7.jpg', 10, 'Raju Adhikari', 'hot', 'active', 790.00, 10.00, 0, 3, NULL, 2, '2024-04-21 09:54:24', '2024-04-21 09:54:24'),
(6, 'Books', 'books', '<p>This is test&nbsp;</p>', '<p>Testiing</p>', '/storage/photos/1/ato.jpg,/storage/photos/1/book1.jpg,/storage/photos/1/2.jpg', 10, 'Jhamak Ghimire', 'new', 'active', 1000.00, 10.00, 1, 2, NULL, 3, '2024-04-22 09:12:20', '2024-04-22 09:12:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `rate` tinyint NOT NULL DEFAULT '0',
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_user_id_foreign` (`user_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 4, 'Nice Book', 'active', '2024-04-21 10:27:13', '2024-04-21 10:27:13');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'I can not explain more!', 'This is just to show that I have done, is it?', '/storage/photos/1/bookmartlogo.png', '/storage/photos/1/about.png', 'Gairapatan,Pokhara', '9846362500', 'bookmartpokhara@gmail.com', NULL, '2024-04-21 21:11:58');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

DROP TABLE IF EXISTS `shippings`;
CREATE TABLE IF NOT EXISTS `shippings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$GC4vSMUT5GISfnTHa4aXhuHzMuKoRbZIYYrPfSPbSmsGE3jmUs.tK', NULL, 'admin', NULL, NULL, 'active', NULL, NULL, NULL),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$Nh0y2awcMfFwdLp0pZp2qO0WPlO1sm5M4guuLeM9EdMA9MsQlilfK', NULL, 'user', NULL, NULL, 'active', NULL, NULL, NULL),
(3, 'Swechhya', 'swechhyabaral@gmail.com', NULL, '$2y$10$S7tR0eClmaY3fqmbBj6sFOyQUVijrCAog5q696GY2BImoVyD8VY56', NULL, 'user', NULL, NULL, 'active', NULL, '2024-04-21 09:34:20', '2024-04-21 09:34:20'),
(4, 'Swechhya Baral', 'swech@gmail.com', NULL, '$2y$10$.ftYoTmWmHZEmOuR/8IfUOF6iCZPQJxjvTKEiqlREttXKmeLlYhWC', '/storage/photos/1/admin.jpg', 'admin', NULL, NULL, 'active', NULL, '2024-04-21 21:10:15', '2024-04-21 21:10:15'),
(5, 'Swechhya baral', 'sb@gmail.com', NULL, '$2y$10$wjaHrziN.t84ByMGrby4AefIaJLWSc9aY9gJnkGh.Np2uVCso.c9S', NULL, 'user', NULL, NULL, 'active', NULL, '2024-04-22 07:16:30', '2024-04-22 07:16:30'),
(6, 'Bishal', 'bis@gmail.com', NULL, '$2y$10$sAlZAMWWIaz6m9DjoozoAuH7tlkxbKm1iR1dLOWjTmVCuAUC0C9qW', NULL, 'user', NULL, NULL, 'active', NULL, '2024-04-22 07:17:54', '2024-04-22 08:04:32'),
(7, 'Meena Brl', 'mina@gmail.com', NULL, '$2y$10$qmgeP0XBDtL57gRP6gdt5u05O2HWl7MoDdBdwFNcxmilXFRATxObu', NULL, 'user', NULL, NULL, 'active', NULL, '2024-04-22 07:59:58', '2024-04-22 07:59:58'),
(8, 'Admin', 'abc@gmail.com', NULL, '$2y$10$E3rcjJ00vwiIabrmC/UbjO5tCReGFe.lO4S3Rv6vHOXwZWv2k79ri', NULL, 'user', NULL, NULL, 'active', NULL, '2024-04-22 08:20:02', '2024-04-22 08:20:02'),
(9, 'Kusum', 'kb@gmail.com', NULL, '$2y$10$0YNUt2mv715OPYOh2Wa.0ehZHmoAGP69PgkCLexYMNDOXiyBntl8S', NULL, 'user', NULL, NULL, 'active', NULL, '2024-04-22 09:17:13', '2024-04-22 09:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_cart_id_foreign` (`cart_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
