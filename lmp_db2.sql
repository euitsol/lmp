-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 26, 2022 at 11:53 PM
-- Server version: 5.7.38-41-log
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbve7kvmocjtn4`
--

-- --------------------------------------------------------

--
-- Table structure for table `centers`
--

CREATE TABLE `centers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `director_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `centers`
--

INSERT INTO `centers` (`id`, `name`, `email`, `reference`, `director_id`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Test Center 1', 'center1@gmail.com', 'ASDFGH', 4, 'Active', 3, '2022-06-25 14:28:53', '2022-07-01 04:28:33'),
(2, 'Test Center 2', 'center2@gmail.com', 'ZXCVBN', 5, 'Active', 3, '2022-06-26 06:59:46', '2022-07-01 04:28:42');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `country_id`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 1, 'Active', 1, '2022-06-24 14:27:36', '2022-06-24 14:27:36'),
(2, 'Delhi', 2, 'Active', 3, '2022-06-24 14:44:28', '2022-06-24 14:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Bangladesh', 'Active', 1, '2022-06-24 13:36:01', '2022-07-07 01:38:24'),
(2, 'India', 'Active', 3, '2022-06-24 14:44:11', '2022-06-25 04:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  `visibility` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`, `visibility`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2, 1),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3, 1),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4, 1),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5, 1),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6, 1),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7, 1),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8, 1),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10, 1),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11, 1),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12, 1),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2, 1),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3, 1),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4, 1),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2, 1),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3, 1),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4, 1),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5, 1),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9, 1),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1, 1),
(57, 7, 'name', 'text', 'Country Name', 1, 1, 1, 1, 1, 1, '{}', 2, 1),
(58, 7, 'status', 'hidden', 'Status', 1, 1, 1, 0, 1, 0, '{\"1\":\"Active\",\"-1\":\"Deactive\"}', 3, 1),
(59, 7, 'created_by', 'hidden', 'Created By', 1, 0, 1, 0, 1, 0, '{}', 5, 1),
(60, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 6, 1),
(61, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7, 1),
(62, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1, 1),
(63, 8, 'name', 'text', 'City Name', 1, 1, 1, 1, 1, 1, '{}', 2, 1),
(64, 8, 'country_id', 'select_dropdown', 'Country Name', 1, 0, 0, 1, 1, 0, '{}', 4, 1),
(65, 8, 'status', 'text', 'Status', 1, 1, 1, 0, 0, 0, '{}', 5, 1),
(66, 8, 'created_by', 'hidden', 'Created By', 1, 0, 0, 0, 0, 0, '{}', 7, 1),
(67, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 8, 1),
(68, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9, 1),
(69, 8, 'city_hasmany_country_relationship', 'relationship', 'Country Name', 1, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Country\",\"table\":\"countries\",\"type\":\"belongsTo\",\"column\":\"country_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3, 1),
(70, 8, 'city_belongsto_user_relationship', 'relationship', 'Created By', 1, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"created_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6, 1),
(71, 7, 'country_belongsto_user_relationship', 'relationship', 'Created By', 1, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"created_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cities\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4, 1),
(72, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1, 1),
(73, 9, 'name', 'text', 'Center Name', 1, 1, 1, 1, 1, 1, '{}', 2, 1),
(74, 9, 'email', 'text', 'Center Email', 1, 0, 1, 1, 1, 1, '{}', 4, 1),
(76, 9, 'director_id', 'hidden', 'Center Director Id', 1, 0, 0, 1, 1, 0, '{}', 6, 1),
(77, 9, 'created_by', 'hidden', 'Created By', 1, 0, 0, 0, 0, 0, '{}', 8, 1),
(78, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 9, 1),
(79, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10, 1),
(80, 9, 'center_belongsto_user_relationship', 'relationship', 'Director', 1, 1, 1, 1, 1, 1, '{\"scope\":\"director\",\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"director_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"centers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3, 1),
(81, 9, 'center_belongsto_user_relationship_1', 'relationship', 'Created By', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"created_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"centers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7, 1),
(82, 9, 'status', 'hidden', 'Status', 1, 1, 1, 0, 0, 0, '{}', 6, 1),
(83, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6, 1),
(84, 9, 'reference', 'text', 'Reference', 1, 1, 1, 1, 1, 1, '{}', 4, 1),
(85, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1, 1),
(86, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 2, 1),
(87, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3, 1),
(88, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1, 1),
(89, 11, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2, 1),
(90, 11, 'status', 'hidden', 'Status', 0, 1, 1, 1, 1, 1, '{}', 3, 1),
(91, 11, 'created_by', 'hidden', 'Created By', 0, 0, 0, 1, 1, 1, '{}', 4, 1),
(92, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 6, 1),
(93, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7, 1),
(94, 11, 'edu_level_belongsto_user_relationship', 'relationship', 'Created By', 0, 0, 1, 0, 0, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"created_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"centers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5, 1),
(96, 11, 'table_order', 'hidden', 'Table Order', 0, 1, 1, 1, 1, 1, '{}', 7, 0),
(97, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1, 1),
(98, 12, 'name', 'text', 'English Test Name', 1, 1, 1, 1, 1, 1, '{}', 2, 1),
(99, 12, 'status', 'text', 'Status', 1, 1, 1, 0, 0, 0, '{}', 3, 1),
(100, 12, 'table_order', 'hidden', 'Table Order', 0, 1, 0, 0, 0, 0, '{}', 4, 0),
(101, 12, 'created_by', 'hidden', 'Created By', 0, 0, 0, 1, 1, 1, '{}', 6, 1),
(102, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 7, 1),
(103, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8, 1),
(104, 12, 'english_test_belongsto_user_relationship', 'relationship', 'Created By', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"created_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"centers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":\"notStudent\"}', '2022-06-15 10:08:59', '2022-06-25 14:58:19'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-06-15 10:08:59', '2022-06-15 10:08:59'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-06-15 10:09:00', '2022-06-15 10:09:00'),
(7, 'countries', 'countries', 'Country', 'Countries', 'voyager-list', 'App\\Models\\Country', NULL, 'App\\Http\\Controllers\\CountryController', 'This is a county table is used for preferred countries in student registration.', 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-06-24 12:33:54', '2022-06-25 14:30:15'),
(8, 'cities', 'cities', 'City', 'Cities', 'voyager-list', 'App\\Models\\City', NULL, 'App\\Http\\Controllers\\CityController', 'This city table is used for preferred cities in student registration.', 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-06-24 12:37:32', '2022-06-25 14:29:58'),
(9, 'centers', 'centers', 'Center', 'Centers', 'voyager-study', 'App\\Models\\Center', NULL, 'App\\Http\\Controllers\\CenterController', NULL, 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-06-25 12:48:26', '2022-06-25 15:54:53'),
(10, 'student_details', 'student-details', 'Student Management', 'Student Managements', 'voyager-people', 'App\\Models\\StudentDetail', NULL, 'App\\Http\\Controllers\\StudentDetailController', NULL, 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2022-06-26 07:34:03', '2022-06-26 07:34:03'),
(11, 'edu_levels', 'education-levels', 'Education Level', 'Education Levels', 'fa-solid fa-layer-group', 'App\\Models\\EduLevel', NULL, 'App\\Http\\Controllers\\EduLevelController', NULL, 1, 0, '{\"order_column\":\"table_order\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-07-03 01:00:34', '2022-07-04 00:41:50'),
(12, 'english_tests', 'english-tests', 'English Test', 'English Tests', 'fa-solid fa-pen-to-square', 'App\\Models\\EnglishTest', NULL, 'App\\Http\\Controllers\\EnglishTestController', NULL, 1, 0, '{\"order_column\":\"table_order\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-07-04 02:27:11', '2022-07-04 05:09:02');

-- --------------------------------------------------------

--
-- Table structure for table `edu_levels`
--

CREATE TABLE `edu_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `table_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `edu_levels`
--

INSERT INTO `edu_levels` (`id`, `name`, `status`, `created_by`, `created_at`, `updated_at`, `table_order`) VALUES
(1, 'Level 3 - 8', 'Active', 3, '2022-07-03 01:12:24', '2022-07-04 01:55:33', 3),
(2, 'Honous Degree', 'Active', 3, '2022-07-03 01:14:51', '2022-07-04 01:55:33', 2),
(3, 'Masters Dergree', 'Active', 3, '2022-07-04 00:34:46', '2022-07-04 01:55:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `english_tests`
--

CREATE TABLE `english_tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `english_tests`
--

INSERT INTO `english_tests` (`id`, `name`, `status`, `table_order`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'IELTS', 'Active', 2, 3, '2022-07-04 06:01:52', '2022-07-04 06:14:12'),
(2, 'TOEFL', 'Active', 1, 3, '2022-07-04 06:03:43', '2022-07-04 06:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-06-15 10:09:02', '2022-06-15 10:09:02'),
(2, 'student', '2022-06-24 01:07:59', '2022-06-24 01:07:59');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-06-15 10:09:03', '2022-06-15 10:09:03', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2022-06-15 10:09:03', '2022-06-24 14:43:22', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2022-06-15 10:09:03', '2022-06-15 10:09:03', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-06-15 10:09:03', '2022-06-15 10:09:03', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 5, '2022-06-15 10:09:03', '2022-06-24 14:43:22', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-06-15 10:09:03', '2022-06-24 14:43:22', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 4, '2022-06-15 10:09:03', '2022-07-02 07:41:59', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 2, '2022-06-15 10:09:03', '2022-07-02 07:41:57', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 3, '2022-06-15 10:09:03', '2022-07-02 07:41:57', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 6, '2022-06-15 10:09:04', '2022-07-02 07:41:59', 'voyager.settings.index', NULL),
(15, 2, 'Profile', '', '_self', 'fa-solid fa-id-badge', '#000000', NULL, 2, '2022-06-24 04:13:20', '2022-06-28 19:16:25', 'student.profile', 'null'),
(16, 1, 'Countries', '', '_self', 'fa-solid fa-earth-americas', '#000000', NULL, 8, '2022-06-24 12:33:55', '2022-07-02 07:41:59', 'voyager.countries.index', 'null'),
(17, 1, 'Cities', '', '_self', 'fa-solid fa-city', '#000000', NULL, 9, '2022-06-24 12:37:33', '2022-07-02 07:41:59', 'voyager.cities.index', 'null'),
(19, 1, 'Centers', '', '_self', 'voyager-study', NULL, NULL, 7, '2022-06-25 12:48:27', '2022-07-02 07:41:59', 'voyager.centers.index', NULL),
(21, 2, 'Dashboard', '', '_self', 'fa-solid fa-house', '#000000', NULL, 1, '2022-06-28 17:28:29', '2022-06-28 17:31:07', 'student.dashboard', 'null'),
(22, 1, 'Education Levels', '', '_self', 'fa-solid fa-layer-group', NULL, 24, 1, '2022-07-03 01:00:34', '2022-07-07 01:51:20', 'voyager.education-levels.index', NULL),
(23, 1, 'English Tests', '', '_self', 'fa-solid fa-pen-to-square', '#000000', 24, 2, '2022-07-04 02:27:12', '2022-07-07 01:51:21', 'voyager.english-tests.index', 'null'),
(25, 1, 'Student Managements', '', '_self', 'fa-solid fa-people-line', '#000000', NULL, 10, '2022-07-07 01:55:35', '2022-07-07 02:00:19', 'voyager.student-details.index', NULL),
(26, 1, 'Education Level', '', '_self', 'fa-solid fa-layer-group', '#000000', NULL, 11, '2022-07-07 02:00:12', '2022-07-07 02:02:21', 'voyager.education-levels.index', 'null'),
(27, 1, 'English Test', '', '_self', 'fa-solid fa-pen-to-square', '#000000', NULL, 12, '2022-07-07 02:03:35', '2022-07-07 02:04:10', 'voyager.english-tests.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-06-15 10:09:04', '2022-06-15 10:09:04'),
(2, 'browse_bread', NULL, '2022-06-15 10:09:04', '2022-06-15 10:09:04'),
(3, 'browse_database', NULL, '2022-06-15 10:09:04', '2022-06-15 10:09:04'),
(4, 'browse_media', NULL, '2022-06-15 10:09:05', '2022-06-15 10:09:05'),
(5, 'browse_compass', NULL, '2022-06-15 10:09:05', '2022-06-15 10:09:05'),
(6, 'browse_menus', 'menus', '2022-06-15 10:09:05', '2022-06-15 10:09:05'),
(7, 'read_menus', 'menus', '2022-06-15 10:09:05', '2022-06-15 10:09:05'),
(8, 'edit_menus', 'menus', '2022-06-15 10:09:05', '2022-06-15 10:09:05'),
(9, 'add_menus', 'menus', '2022-06-15 10:09:05', '2022-06-15 10:09:05'),
(10, 'delete_menus', 'menus', '2022-06-15 10:09:05', '2022-06-15 10:09:05'),
(11, 'browse_roles', 'roles', '2022-06-15 10:09:05', '2022-06-15 10:09:05'),
(12, 'read_roles', 'roles', '2022-06-15 10:09:06', '2022-06-15 10:09:06'),
(13, 'edit_roles', 'roles', '2022-06-15 10:09:06', '2022-06-15 10:09:06'),
(14, 'add_roles', 'roles', '2022-06-15 10:09:06', '2022-06-15 10:09:06'),
(15, 'delete_roles', 'roles', '2022-06-15 10:09:06', '2022-06-15 10:09:06'),
(16, 'browse_users', 'users', '2022-06-15 10:09:06', '2022-06-15 10:09:06'),
(17, 'read_users', 'users', '2022-06-15 10:09:06', '2022-06-15 10:09:06'),
(18, 'edit_users', 'users', '2022-06-15 10:09:06', '2022-06-15 10:09:06'),
(19, 'add_users', 'users', '2022-06-15 10:09:06', '2022-06-15 10:09:06'),
(20, 'delete_users', 'users', '2022-06-15 10:09:06', '2022-06-15 10:09:06'),
(21, 'browse_settings', 'settings', '2022-06-15 10:09:07', '2022-06-15 10:09:07'),
(22, 'read_settings', 'settings', '2022-06-15 10:09:07', '2022-06-15 10:09:07'),
(23, 'edit_settings', 'settings', '2022-06-15 10:09:07', '2022-06-15 10:09:07'),
(24, 'add_settings', 'settings', '2022-06-15 10:09:07', '2022-06-15 10:09:07'),
(25, 'delete_settings', 'settings', '2022-06-15 10:09:07', '2022-06-15 10:09:07'),
(41, 'browse_countries', 'countries', '2022-06-24 12:33:55', '2022-06-24 12:33:55'),
(42, 'read_countries', 'countries', '2022-06-24 12:33:55', '2022-06-24 12:33:55'),
(43, 'edit_countries', 'countries', '2022-06-24 12:33:55', '2022-06-24 12:33:55'),
(44, 'add_countries', 'countries', '2022-06-24 12:33:55', '2022-06-24 12:33:55'),
(45, 'delete_countries', 'countries', '2022-06-24 12:33:55', '2022-06-24 12:33:55'),
(46, 'browse_cities', 'cities', '2022-06-24 12:37:32', '2022-06-24 12:37:32'),
(47, 'read_cities', 'cities', '2022-06-24 12:37:32', '2022-06-24 12:37:32'),
(48, 'edit_cities', 'cities', '2022-06-24 12:37:32', '2022-06-24 12:37:32'),
(49, 'add_cities', 'cities', '2022-06-24 12:37:32', '2022-06-24 12:37:32'),
(50, 'delete_cities', 'cities', '2022-06-24 12:37:32', '2022-06-24 12:37:32'),
(51, 'browse_centers', 'centers', '2022-06-25 12:48:27', '2022-06-25 12:48:27'),
(52, 'read_centers', 'centers', '2022-06-25 12:48:27', '2022-06-25 12:48:27'),
(53, 'edit_centers', 'centers', '2022-06-25 12:48:27', '2022-06-25 12:48:27'),
(54, 'add_centers', 'centers', '2022-06-25 12:48:27', '2022-06-25 12:48:27'),
(55, 'delete_centers', 'centers', '2022-06-25 12:48:27', '2022-06-25 12:48:27'),
(56, 'browse_student_details', 'student_details', '2022-06-26 07:34:03', '2022-06-26 07:34:03'),
(57, 'read_student_details', 'student_details', '2022-06-26 07:34:03', '2022-06-26 07:34:03'),
(58, 'edit_student_details', 'student_details', '2022-06-26 07:34:03', '2022-06-26 07:34:03'),
(59, 'add_student_details', 'student_details', '2022-06-26 07:34:03', '2022-06-26 07:34:03'),
(60, 'delete_student_details', 'student_details', '2022-06-26 07:34:03', '2022-06-26 07:34:03'),
(61, 'browse_edu_levels', 'edu_levels', '2022-07-03 01:00:34', '2022-07-03 01:00:34'),
(62, 'read_edu_levels', 'edu_levels', '2022-07-03 01:00:34', '2022-07-03 01:00:34'),
(63, 'edit_edu_levels', 'edu_levels', '2022-07-03 01:00:34', '2022-07-03 01:00:34'),
(64, 'add_edu_levels', 'edu_levels', '2022-07-03 01:00:34', '2022-07-03 01:00:34'),
(65, 'delete_edu_levels', 'edu_levels', '2022-07-03 01:00:34', '2022-07-03 01:00:34'),
(66, 'browse_english_tests', 'english_tests', '2022-07-04 02:27:11', '2022-07-04 02:27:11'),
(67, 'read_english_tests', 'english_tests', '2022-07-04 02:27:11', '2022-07-04 02:27:11'),
(68, 'edit_english_tests', 'english_tests', '2022-07-04 02:27:11', '2022-07-04 02:27:11'),
(69, 'add_english_tests', 'english_tests', '2022-07-04 02:27:11', '2022-07-04 02:27:11'),
(70, 'delete_english_tests', 'english_tests', '2022-07-04 02:27:11', '2022-07-04 02:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 1),
(4, 4),
(5, 4),
(6, 1),
(6, 4),
(7, 1),
(7, 4),
(8, 1),
(8, 4),
(9, 1),
(9, 4),
(10, 1),
(10, 4),
(11, 1),
(11, 4),
(12, 1),
(12, 4),
(13, 1),
(13, 4),
(14, 1),
(14, 4),
(15, 1),
(15, 4),
(16, 1),
(16, 4),
(17, 1),
(17, 4),
(18, 1),
(18, 4),
(19, 1),
(19, 4),
(20, 1),
(20, 4),
(21, 1),
(21, 4),
(22, 1),
(22, 4),
(23, 1),
(23, 4),
(24, 1),
(24, 4),
(25, 1),
(25, 4),
(41, 1),
(41, 4),
(42, 1),
(42, 4),
(43, 1),
(43, 4),
(44, 1),
(44, 4),
(45, 1),
(45, 4),
(46, 1),
(46, 4),
(47, 1),
(47, 4),
(48, 1),
(48, 4),
(49, 1),
(49, 4),
(50, 1),
(50, 4),
(51, 1),
(51, 4),
(51, 5),
(52, 1),
(52, 4),
(52, 5),
(53, 1),
(53, 4),
(53, 5),
(54, 1),
(54, 4),
(54, 5),
(55, 1),
(55, 4),
(55, 5),
(56, 1),
(56, 4),
(57, 1),
(57, 4),
(58, 1),
(58, 4),
(59, 1),
(59, 4),
(60, 1),
(60, 4),
(61, 1),
(61, 4),
(62, 1),
(62, 4),
(63, 1),
(63, 4),
(64, 1),
(64, 4),
(65, 1),
(65, 4),
(66, 1),
(66, 4),
(67, 1),
(67, 4),
(68, 1),
(68, 4),
(69, 1),
(69, 4),
(70, 1),
(70, 4);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Administrator', '2022-06-15 10:09:04', '2022-06-24 01:06:48'),
(3, 'Student', 'Student', '2022-06-24 01:06:32', '2022-06-24 01:06:32'),
(4, 'Developer', 'Developer', '2022-06-24 14:37:18', '2022-06-24 14:37:18'),
(5, 'Director', 'Center Director', '2022-06-25 13:00:41', '2022-06-25 13:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'LMP', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'The LMP student management system', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\July2022\\rruOGwa0BMfA3jhflXa2.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\June2022\\y2Uh7MBt535PRAScn7Fr.png', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'LMP', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'The LMP student management system', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\June2022\\deOc0H8zZQoFmJdZAt6I.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\July2022\\MgnhlkE3YiqoJFVUXged.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', 'AIzaSyBdKwOeKmZCvXElh2HX5ne_ls_jXH78vY8', '', 'text', 1, 'Admin'),
(11, 'admin.stu_reg_img', 'Student Register Image', 'settings\\June2022\\LgQcoei8wxhEUYBG3BxC.jpg', NULL, 'image', 6, 'Admin'),
(12, 'admin.bg_color', 'Background Color', '#EAEBFC', NULL, 'text', 7, 'Admin'),
(13, 'admin.version', 'App Version', '1.0.1', NULL, 'text', 8, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `center_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0 => Applicant,\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birth_country` int(11) DEFAULT NULL,
  `postcode` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `e_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_country_code` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `edu_level` int(11) DEFAULT NULL,
  `edu_degree` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_awarding_body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_awarding_country` int(11) DEFAULT NULL,
  `edu_qualification_result` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_qualification_result_outof` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_qualification_date` date DEFAULT NULL,
  `edu_eng_test` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_eng_writting_result` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_eng_listening_result` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_eng_reading_result` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_eng_spoken_result` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_eng_other_result` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edu_eng_exam_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`id`, `student_id`, `center_id`, `status`, `created_at`, `updated_at`, `f_name`, `m_name`, `s_name`, `title`, `gender`, `birth_country`, `postcode`, `age`, `e_contact`, `e_country_code`, `address`, `edu_level`, `edu_degree`, `edu_awarding_body`, `edu_awarding_country`, `edu_qualification_result`, `edu_qualification_result_outof`, `edu_qualification_date`, `edu_eng_test`, `edu_eng_writting_result`, `edu_eng_listening_result`, `edu_eng_reading_result`, `edu_eng_spoken_result`, `edu_eng_other_result`, `edu_eng_exam_date`) VALUES
(1, 6, 1, 0, '2022-06-26 16:49:05', '2022-06-26 16:49:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 7, 2, 0, '2022-06-26 16:56:40', '2022-07-04 10:21:31', 'AL', 'KAFI', 'SOHAG', 5, 1, 1, '5680', 21, NULL, '355', 'Fulbari, kurigam bla bla bla', 2, 'BSc Engineering in ECE', 'HSTU', 1, '3.04', '4.00', '1970-01-01', '2', '4', '4', '4', NULL, NULL, '2022-07-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-06-15 10:09:29', '2022-06-15 10:09:29'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-06-15 10:09:29', '2022-06-15 10:09:29'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-06-15 10:09:29', '2022-06-15 10:09:29'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-06-15 10:09:29', '2022-06-15 10:09:29'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-06-15 10:09:30', '2022-06-15 10:09:30'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-06-15 10:09:30', '2022-06-15 10:09:30'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-06-15 10:09:30', '2022-06-15 10:09:30'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-06-15 10:09:30', '2022-06-15 10:09:30'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-06-15 10:09:30', '2022-06-15 10:09:30'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-06-15 10:09:30', '2022-06-15 10:09:30'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-06-15 10:09:30', '2022-06-15 10:09:30'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-06-15 10:09:30', '2022-06-15 10:09:30'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-06-15 10:09:31', '2022-06-15 10:09:31'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-06-15 10:09:31', '2022-06-15 10:09:31'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-06-15 10:09:31', '2022-06-15 10:09:31'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-06-15 10:09:31', '2022-06-15 10:09:31'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-06-15 10:09:31', '2022-06-15 10:09:31'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-06-15 10:09:31', '2022-06-15 10:09:31'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-06-15 10:09:31', '2022-06-15 10:09:31'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-06-15 10:09:32', '2022-06-15 10:09:32'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-06-15 10:09:32', '2022-06-15 10:09:32'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-06-15 10:09:32', '2022-06-15 10:09:32'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-06-15 10:09:32', '2022-06-15 10:09:32'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-06-15 10:09:32', '2022-06-15 10:09:32'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-06-15 10:09:32', '2022-06-15 10:09:32'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-06-15 10:09:32', '2022-06-15 10:09:32'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-06-15 10:09:32', '2022-06-15 10:09:32'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-06-15 10:09:32', '2022-06-15 10:09:32'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-06-15 10:09:32', '2022-06-15 10:09:32'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-06-15 10:09:32', '2022-06-15 10:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `tel`, `country_code`, `dob`, `country_id`, `city_id`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', NULL, NULL, NULL, NULL, NULL, 'users/default.png', NULL, '$2y$10$Ya1glilZ.PiRc3KLtkx2w.MffwpTR8sOx6pXKEvYNxxoW6V8Y.VyO', 'EhUSwCxgLzgEYgH8QPnLyt6asSmVAP4FzQFJNQAX69DDcsqwUmFD0IM1crAG', '{\"locale\":\"en\"}', NULL, '2022-06-15 10:09:23', '2022-07-26 23:40:16'),
(3, 4, 'Al Kafi Sohag', 'dev1@gmail.com', NULL, NULL, NULL, NULL, NULL, 'users\\July2022\\uLZ3KMEfTmZ6oifHN42w.jpg', NULL, '$2y$10$/1FzN.5Y0ReS/vcPOubvXeuyefdM18ZwRaa7bpTVZ1wpNjS0qxOn6', 'ozOVDM2WNJBykeitXvOtJ5UwwdmwwJG9BuW4DB0yNBCzmKeBzjJvF4wFu1AL', '{\"locale\":\"en\"}', NULL, '2022-06-24 14:38:11', '2022-07-01 08:11:27'),
(4, 5, 'Director 1', 'director1@gmial.com', NULL, NULL, NULL, NULL, NULL, 'users/default.png', NULL, '$2y$10$uDq0dvHNLHQK3ENiws/.vO0VT8CBZ2G9gUQI.nYaqxxMiadNjFoY2', NULL, '{\"locale\":\"en\"}', NULL, '2022-06-25 13:02:14', '2022-06-25 13:02:14'),
(5, 5, 'Director 2', 'director2@gmial.com', NULL, NULL, NULL, NULL, NULL, 'users/default.png', NULL, '$2y$10$EFU60V.ZmNzsG8r1JmGkOuGsMI0PEHaZrCE9tsU3ahH7ABISyO1M6', NULL, '{\"locale\":\"en\"}', NULL, '2022-06-26 06:59:10', '2022-06-26 06:59:10'),
(6, 3, 'AL KAFI SOHAG', 'aksohag16@gmail.com', '1773-301138', '880', NULL, 2, 2, 'users/default.png', NULL, '$2y$10$m4QXyYHJVaayBmhIwwY8JepyKcgkzlEaK.3EPdagHX9jbywZGFkmm', NULL, NULL, NULL, '2022-06-26 16:49:05', '2022-06-26 16:49:05'),
(7, 3, 'Student 1', 'student1@gmail.com', '1773-30113X', '880', '2001-02-15', 1, 1, 'users/default.png', NULL, '$2y$10$uUzPcY2774duI566r4GYPOIXsJeqBJJ21aLLJFy0YteKd59b0AGcS', 'ltOVeemaWf0VIv9qUKXm4SMKJO5VeUFtup3Nuhdrh29KhgjJ3QA1tZI2n1po', NULL, NULL, '2022-06-26 16:56:40', '2022-06-26 16:56:40'),
(8, 4, 'Developer 2', 'dev2@gmail.com', NULL, NULL, NULL, NULL, NULL, 'users/default.png', NULL, '$2y$10$/g/sqiQhQYzq7w.az2kQhehWsJ.8kZtPK6l9HWOKuHCX7HYfLj1Ra', NULL, '{\"locale\":\"en\"}', NULL, '2022-07-26 23:41:55', '2022-07-26 23:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `centers`
--
ALTER TABLE `centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `edu_levels`
--
ALTER TABLE `edu_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `english_tests`
--
ALTER TABLE `english_tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `centers`
--
ALTER TABLE `centers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `edu_levels`
--
ALTER TABLE `edu_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `english_tests`
--
ALTER TABLE `english_tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `student_details`
--
ALTER TABLE `student_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
