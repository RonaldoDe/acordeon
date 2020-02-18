-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-02-2020 a las 09:42:01
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `acordeon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `order_by`) VALUES
(1, 'Vallenato', 'Música ', 1),
(2, 'Merengue Vallenatero', 'Cule mentira', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `downloaded_by`
--

CREATE TABLE `downloaded_by` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `downloaded_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('aaaf029dc1ca4a9221428462fb466078207cd70c07d281010f0e60336b154de056963c21e29a4e01', 1, 2, NULL, '[\"*\"]', 0, '2020-01-30 13:51:03', '2020-01-30 13:51:03', '2021-01-30 08:51:03'),
('e62d88cb385b3f43123692f788dfdb7c8efe929c4353b44d8776de31f8c1d6bfeeaefcf73195cbcd', 5, 2, NULL, '[\"*\"]', 0, '2020-02-07 12:20:00', '2020-02-07 12:20:00', '2021-02-07 07:20:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'ppdC37Ueu0o9mBo9KDcykTojmaclyjR6Wo5a9cNs', 'http://localhost', 1, 0, 0, '2019-11-27 08:36:52', '2019-11-27 08:36:52'),
(2, NULL, 'Laravel Password Grant Client', 'ZpgplPtfTHbiCWWDktIRCHg2DNm6BPuJWJ5PPlvM', 'http://localhost', 0, 1, 0, '2019-11-27 08:36:52', '2019-11-27 08:36:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-11-27 08:36:52', '2019-11-27 08:36:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('05b0ed6afc49d62549727b66190db140a556ef2a6db429c30ef821278aeebd8a87e7473ecdeb24b2', 'db77aa231f5bf9587d6381e954b8fcd296352f60220cfc96c4dd0a8a73ae7e45ea918497f08ea1e2', 0, '2021-02-05 08:52:55'),
('0d06639bd6809f5b8c1b183b98125fbcd5e97ba86837f319e21c65bc0d4a04b369a6f935c1698491', 'a4c86438c9672aeda1b45459c34946a6937b4e7b30394415bd4b490539dae08ba2497919e4e977ea', 0, '2020-12-28 02:00:50'),
('22f55f58338ca8f1590fb2563213523cef65835102f66ce0c789dad49b1a72a90b0f8cc1a7cfa521', '6a973d26907fa616bfee5a15801cb8f773bdeceaec78d56bd299db8d524185c36be035222a1e2514', 0, '2021-01-30 08:26:40'),
('28ec8cc1b6d863a5de8cf6cc7d50b1405ca6e3f594813f78026619488d833a62f1f9d4798585131f', '258465403bf19044d623a5d3eb14ca63d34b7a66c90721e683720174eb544cf667ad0541d2471359', 0, '2021-02-01 08:09:34'),
('3403af6c63450ad943509434a36e640dd1da34ebd7935c951ab1f9ce8110335674cd476001d13f4e', 'a4b8072836bc968c20ba475e2f3e6d7b6123cd7f46664410f0ddcca82304750adf4c8d2a72c9c958', 0, '2021-01-31 09:16:30'),
('351f27d25df6d78b376727aa73222d004914dd00d425adcec2e57c6202c96d979cde7133d49961e7', 'e980e5c955e2b3f3639205a4bda0d20b60af35b12507e4e2be123ca444badca329ac26bbf068ecaf', 0, '2021-02-05 08:07:16'),
('3a031d78964b121f56e43bf7e97f0d794905f5a99d3b9b5b844967dd8307228c857326c592308f64', 'd7048666da6c9cf84d3dbf04db00ea95249b0365c76a5e5336ba5acd1ed1094b362b6dc49a3e8ea6', 0, '2021-02-04 09:28:42'),
('3f3877ac0a0e73b5ad65c3d7792dbffa6f1ac040ff15012bb4f1a703896eb30c58373e9523d4b76a', 'e0c3040b1c29d64bdf9b05d092b7aed30ad23306152e0be6c4795db376ed415db1f88ef33a41a105', 0, '2021-02-06 08:52:11'),
('4d4c9fa827ab49f2440f4cf68f04ade839fd482985aee584863c7663fdcb3234edbb6e6984c71a01', 'fd22d4725137f9f43432e0c8943cd7d2d78471cc4f1a5c7e87b269d0ad50137ac8633fca471d1520', 0, '2020-12-28 02:21:15'),
('5126e1ca1608743fda72a421ef9b07bbe81a064992031edcdbefbc9e712a86fa82035afc3574c798', 'aaaf029dc1ca4a9221428462fb466078207cd70c07d281010f0e60336b154de056963c21e29a4e01', 0, '2021-01-30 08:51:03'),
('64baa1c4ee876f6558fc9c9cce0fb2e59233d9d4e5d0f6bdad75760c282371f210abfcdc49cf205c', '866aee11565bd1ac6a93f8dde67b92a922949aa5b4c5761ebadd88ecffbeffb37443ed24c65a5024', 0, '2021-02-06 09:04:12'),
('79f6488998051564ea725f7175236f4fe7b46e36d7774526bcc2023cd70a2fe44f20cc26a637fbf1', '555abc5945ec9c503152a1bb3422f746c7dbc3c51b444b005f1916db5331979287c549d2174e5fdf', 0, '2021-02-05 08:07:33'),
('7c278d603e7155225d36e91debb71c038f3a5738b95ca482dc9113ec58f17097e79b8c59dc394420', '4861fb07cc9555c5f14c7d47e47f4a88901b4c5d60d806873344330e944116f1f12fd7d808604a6f', 0, '2021-02-05 08:32:44'),
('946feab648aa4555a90b4fd393a3f3b7f4fbdf17a121126dae68f73cf995a8a52a4f83ceb4457e63', 'fe28cb9f46fe72693f757676235acbfd6d0a95c4674a4cdb7156e2e961a86c60486d7d567646dc31', 0, '2020-12-19 03:54:39'),
('94902b65b46c859fc78242f15b3d9502d70cd93958940ab116f75e8d2cb843fa5d4c759c253be8c9', 'b9e78f9fc7da4db03244eaf91a2a21e788b73bace3dd72c81f1cb4df4fd9d598280a3a34b15fd3aa', 0, '2021-02-05 08:28:06'),
('af653f59158732cf99579698c59ffcba4e20b67085ec5a5386b9603d8047a8a30037023df55f4873', '8028f5e69001a61fa8c9057b893081c317d4e88c75c561144e359d93c0d59e0e67f946a16fd1f182', 0, '2021-02-04 09:29:42'),
('bcc083a16f43d93ccffdfbfa6170a8ced5c2438d090878d9c24db8b47b82340a27262f9f9e38c01e', 'acdfc716ecb154413c072fd7b545027c1f86e13c19b73cdbb54a610bb8e03e739eb146309bb6ffbb', 0, '2021-02-04 09:32:24'),
('c826f0919fd71e11c3e9e70c4696a6fd699ac433a31c891570ec6ba7442020cfcbde05d954c44a23', 'e62d88cb385b3f43123692f788dfdb7c8efe929c4353b44d8776de31f8c1d6bfeeaefcf73195cbcd', 0, '2021-02-07 07:20:00'),
('c8e041e9b9edad901cceeca4cac102adef0c36c04f14dbfca29effc28ffa012f93aa054e05fbe2ab', '771b9b191a10ec17cdab3f2675a083babe8f63011c841d8b6e2376c8bf4785709f9617b3b9c2482f', 0, '2021-01-30 09:01:51'),
('d50e4c20aaca811ac1514211e5ae2816ed339ffeb50a783bacdd728626e1295f6f74339379485e9f', 'ced5477e20e305c5d0cfe055ba64498270e6d476b3bb00518a8ca118699ac48b481b2e2445345e5c', 0, '2021-02-05 08:28:13'),
('db5bec6a83b8de963f533df2db136096cc8f6cc9f734602ba52b6485b2df41f58b6fa208d61a7af0', 'd59fd79ce59247ac9c2cdb6cc2ea33373a0b57720d596a7e49671d9e8f7dcd006007a6417ab5737a', 0, '2021-02-05 07:09:58'),
('ddde3cd34b53485f78a7bf959809f8db7d5b1f482872b648e7319be5d44d25967050d01ee0202b84', '40d29dbd4031340ff63757595ecdf5aea1f9fa1b5aff86b0a945467195fc0b19c86d8e412bc54b58', 0, '2021-02-05 07:23:49'),
('ea66bbce52321efe4e49f7acf0318f3f5f4acac0c371109f04dba58b97cabb7839cb44109b47413b', '8c5158d241ed232083ae8a913771eb0de3c4dd2052c0abb151f5b944c5e0eac7d6ef097657a6c87b', 0, '2021-02-05 08:27:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission`
--

INSERT INTO `permission` (`id`, `name`, `description`, `route`) VALUES
(1, 'Canciones', 'Crud de las canciones', '/song'),
(2, 'Activar canciones ', 'Activar canciones de los usuarios', '/activated_song');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `name`, `description`) VALUES
(1, 'Administrador', 'Master'),
(2, 'Usuario basico', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_permission`
--

CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `per_show` int(11) NOT NULL DEFAULT 0,
  `per_update` int(11) NOT NULL DEFAULT 0,
  `per_create` int(11) NOT NULL DEFAULT 0,
  `per_delete` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `per_show`, `per_update`, `per_create`, `per_delete`) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 2, 1, 1, 1, 1, 1),
(3, 1, 2, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `song`
--

CREATE TABLE `song` (
  `id` int(11) NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `order_by` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keys_amount` int(11) NOT NULL,
  `register` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `allow_to` enum('free','premiun') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `song`
--

INSERT INTO `song` (`id`, `data`, `created_at`, `created_by`, `order_by`, `name`, `description`, `image`, `keys_amount`, `register`, `state_id`, `allow_to`) VALUES
(1, '{ \"notes\": [{ \"tecla\": [2, 4, 6], \"fila\": [1, 1, 1], \"dedo\": [\"1\", \"2\", \"3\"], \"time\": \"0\" }, { \"tecla\": [3, 5, 7], \"fila\": [1, 2, 1], \"dedo\": [\"1\", \"2\", \"3\"], \"time\": \"0\" }, { \"tecla\": [2, 4, 5], \"fila\": [1, 1, 1], \"dedo\": [\"1\", \"2\", \"3\"], \"time\": \"0\" }, { \"tecla\": [6, 8, 8], \"fila\": [1, 1, 2], \"dedo\": [\"1\", \"2\", \"3\"], \"time\": \"0\" } ], \"points\": 0 }', '2019-12-18 23:21:13', 1, 1, 'Test1', 'Test1 Descr', '/../../image.png', 2, 3, 1, 'free'),
(2, '{ \"notes\": [{ \"tecla\": [2, 4, 6], \"fila\": [1, 1, 1], \"dedo\": [\"1\", \"2\", \"3\"], \"time\": \"0\" }, { \"tecla\": [3, 5, 7], \"fila\": [1, 2, 1], \"dedo\": [\"1\", \"2\", \"3\"], \"time\": \"0\" }, { \"tecla\": [2, 4, 5], \"fila\": [1, 1, 1], \"dedo\": [\"1\", \"2\", \"3\"], \"time\": \"0\" }, { \"tecla\": [6, 8, 8], \"fila\": [1, 1, 2], \"dedo\": [\"1\", \"2\", \"3\"], \"time\": \"0\" } ], \"points\": 0 }', '2019-12-27 21:41:11', 1, 2, 'Testy 2', 'Testy 2', 'testy.png', 2, 3, 1, 'free');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `song_category`
--

CREATE TABLE `song_category` (
  `id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `order_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `song_category`
--

INSERT INTO `song_category` (`id`, `song_id`, `category_id`, `order_by`, `created_at`) VALUES
(1, 1, 1, 1, '2020-01-30 04:25:11'),
(2, 2, 2, 2, '2020-01-30 04:25:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `song_rating`
--

CREATE TABLE `song_rating` (
  `id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `song_rating`
--

INSERT INTO `song_rating` (`id`, `song_id`, `user_id`, `rating`, `created_at`) VALUES
(1, 1, 1, 9.5, '2020-01-30 03:46:36'),
(2, 1, 1, 4.2, '2020-01-30 03:51:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `song_state`
--

CREATE TABLE `song_state` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `song_state`
--

INSERT INTO `song_state` (`id`, `name`, `description`) VALUES
(1, 'Activa', 'Disponible'),
(2, 'Inactiva', 'No disponible'),
(3, 'Pendiente', 'Subida por un usuario y esperando a que se revise.'),
(4, 'En revisión', 'En proceso de admisión.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`id`, `name`, `description`) VALUES
(1, 'Activo', ''),
(2, 'Inactivo', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `category` enum('registered','invited') COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `phone`, `address`, `dni`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `category`, `state_id`) VALUES
(1, 'Ronaldo', 'camacho meza', '3045335043', 'Calle 115a #13-24', '1007730321', 'ronaldo@gmail.com', NULL, '$2y$10$V3nNznBDM5sOxik7hojAJu5uKGqxBYj8PhljL0cF2l5xMxUtxsJoi', NULL, '2019-12-18 05:00:00', '2019-12-18 05:00:00', 1, 'registered', 1),
(5, 'Ronaldlo', 'Camacho meza', '3045335043', 'calle 115a #13-24', '1007730321', 'userfree@gmail.com', NULL, '$2y$10$CMGWuEm5MZyd8r8otpVS6ukJYMNkkWrueceXf0qRrww95J00TxKTm', NULL, '2019-12-28 07:00:07', '2019-12-28 07:00:07', 2, 'registered', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_points`
--

CREATE TABLE `user_points` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `points` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `song_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `downloaded_by`
--
ALTER TABLE `downloaded_by`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `song_id` (`song_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indices de la tabla `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `state_id` (`state_id`);

--
-- Indices de la tabla `song_category`
--
ALTER TABLE `song_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `song_id` (`song_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `song_rating`
--
ALTER TABLE `song_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `song_id` (`song_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `song_state`
--
ALTER TABLE `song_state`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `user_points`
--
ALTER TABLE `user_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `song_id` (`song_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `downloaded_by`
--
ALTER TABLE `downloaded_by`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `song`
--
ALTER TABLE `song`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `song_category`
--
ALTER TABLE `song_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `song_rating`
--
ALTER TABLE `song_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `song_state`
--
ALTER TABLE `song_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `user_points`
--
ALTER TABLE `user_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `downloaded_by`
--
ALTER TABLE `downloaded_by`
  ADD CONSTRAINT `downloaded_by_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `downloaded_by_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `song_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `song_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `song_state` (`id`);

--
-- Filtros para la tabla `song_category`
--
ALTER TABLE `song_category`
  ADD CONSTRAINT `song_category_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `song_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `song_rating`
--
ALTER TABLE `song_rating`
  ADD CONSTRAINT `song_rating_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `song_rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Filtros para la tabla `user_points`
--
ALTER TABLE `user_points`
  ADD CONSTRAINT `user_points_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_points_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
