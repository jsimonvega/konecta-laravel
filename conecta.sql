-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-04-2022 a las 13:03:22
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `conecta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacions`
--

CREATE TABLE `calificacions` (
  `id` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacions`
--

INSERT INTO `calificacions` (`id`, `calificacion`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `califica_cursos`
--

CREATE TABLE `califica_cursos` (
  `id` int(11) NOT NULL,
  `cursos_id` int(11) NOT NULL,
  `calificacions_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `califica_cursos`
--

INSERT INTO `califica_cursos` (`id`, `cursos_id`, `calificacions_id`, `created_at`, `updated_at`) VALUES
(1, 17, 2, '2022-04-17 08:46:05', '2022-04-17 08:46:05'),
(2, 17, 4, '2022-04-17 08:47:12', '2022-04-17 08:47:12'),
(3, 17, 1, '2022-04-17 08:47:17', '2022-04-17 08:47:17'),
(4, 17, 5, '2022-04-17 08:47:20', '2022-04-17 08:47:20'),
(5, 16, 2, '2022-04-17 09:54:06', '2022-04-17 09:54:06'),
(6, 16, 3, '2022-04-17 09:54:10', '2022-04-17 09:54:10'),
(7, 16, 4, '2022-04-17 09:54:29', '2022-04-17 09:54:29'),
(8, 17, 4, '2022-04-17 09:57:14', '2022-04-17 09:57:14'),
(9, 17, 4, '2022-04-17 09:57:22', '2022-04-17 09:57:22'),
(10, 17, 4, '2022-04-17 09:57:30', '2022-04-17 09:57:30'),
(11, 17, 5, '2022-04-17 09:57:39', '2022-04-17 09:57:39'),
(12, 16, 4, '2022-04-17 09:59:09', '2022-04-17 09:59:09'),
(13, 16, 5, '2022-04-17 09:59:16', '2022-04-17 09:59:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resumen` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `autor` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `resumen`, `imagen`, `autor`, `created_at`, `updated_at`) VALUES
(1, 'java', 'resumen de curso', 'java.png', 'Julio', '2022-04-13 08:38:38', '2022-04-13 08:38:38'),
(13, 'sqlServer', 'resumen', '2022041616501015621.png', 'Julito 2', '2022-04-16 09:48:54', '2022-04-16 14:32:42'),
(16, 'node js', 'resumen de node js', '2022041616500853831.png', 'Julito', '2022-04-16 10:03:02', '2022-04-16 10:03:03'),
(17, 'php laravel', 'resumen de laravel', '2022041616500917231.png', 'Julito', '2022-04-16 11:48:43', '2022-04-16 11:48:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_13_060023_create_cursos_table', 2),
(6, '2022_04_13_060024_create_cursos_table', 3),
(7, '2022_04_13_060025_create_cursos_table', 4);

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
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `promedio_view`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `promedio_view` (
`id_curso` bigint(20) unsigned
,`curso` text
,`calificacion` decimal(11,0)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `imagen`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Julio Simon', '2022041616501482422.jpg', 'jsimonvega@gmail.com', '2022-04-14 03:56:06', 'b83dbf9661da01afaca7c83ae9b819cf', '94a08da1fecbb6e8b46990538c7b50b2', '2022-04-14 03:56:06', '2022-04-14 03:56:06'),
(2, 'Jose Simon', '2022041616501482421.jpg', 'jsimonfajardo@gmail.com', NULL, '738a79e6ff9420c91abc13dfb8990fd1', '0198a16da0a342dcdcd507ed8f55ec8c', '2022-04-17 02:41:36', '2022-04-17 02:41:36'),
(4, 'Jose Simon', NULL, 'jsimon_fajardo@gmail.com', NULL, '738a79e6ff9420c91abc13dfb8990fd1', '0198a16da0a342dcdcd507ed8f55ec8c', '2022-04-17 03:27:37', '2022-04-17 03:27:37'),
(5, 'Jose Simon', NULL, 'jsimons_fajardo@gmail.com', NULL, '738a79e6ff9420c91abc13dfb8990fd1', '0198a16da0a342dcdcd507ed8f55ec8c', '2022-04-17 03:29:34', '2022-04-17 03:29:34'),
(6, 'Jose Simon', '2022041616501482421.jpg', 'jtsimons_fajardo@gmail.com', NULL, '738a79e6ff9420c91abc13dfb8990fd1', '0198a16da0a342dcdcd507ed8f55ec8c', '2022-04-17 03:30:42', '2022-04-17 03:30:42'),
(7, '', NULL, '', NULL, '', '', '2022-04-17 04:40:13', '2022-04-17 04:40:13'),
(9, '', NULL, 'admin@vainsa.com', NULL, '', '', '2022-04-17 04:40:14', '2022-04-17 04:40:14'),
(11, '', NULL, 'admidn@vainsdda.com', NULL, '205db7c302d87a8dabae9d3924d4a7e0', '', '2022-04-17 07:21:52', '2022-04-17 07:21:52');

-- --------------------------------------------------------

--
-- Estructura para la vista `promedio_view`
--
DROP TABLE IF EXISTS `promedio_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `promedio_view`  AS  select `cu`.`id` AS `id_curso`,`cu`.`nombre` AS `curso`,round(avg(`ca`.`calificacion`),0) AS `calificacion` from ((`califica_cursos` `cc` join `cursos` `cu` on(`cc`.`cursos_id` = `cu`.`id`)) join `calificacions` `ca` on(`cc`.`calificacions_id` = `ca`.`id`)) group by `cu`.`id`,`cu`.`nombre` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacions`
--
ALTER TABLE `calificacions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `califica_cursos`
--
ALTER TABLE `califica_cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacions`
--
ALTER TABLE `calificacions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `califica_cursos`
--
ALTER TABLE `califica_cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
