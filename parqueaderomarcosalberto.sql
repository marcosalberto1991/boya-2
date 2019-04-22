-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-04-2019 a las 03:04:25
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parqueaderomarcosalberto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audits`
--

CREATE TABLE `audits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` int(10) UNSIGNED NOT NULL,
  `auditable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_id`, `auditable_type`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 1, 'created', 5, 'App\\PerfilUsuarioModel', '[]', '{\"nombre\":\"\",\"apellido\":\"\",\"telefono_1\":\"\",\"telefono_2\":\"\",\"direccion\":\"\",\"cedula\":\"\",\"municipios_id\":\"553\",\"entidad_municipal_id\":\"2\",\"foto\":\"\",\"users_id\":5}', 'http://localhost/ruta_girardot/public/login?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-24 02:20:48', '2019-01-24 02:20:48'),
(2, 'App\\User', 1, 'created', 6, 'App\\PerfilUsuarioModel', '[]', '{\"nombre\":\"\",\"apellido\":\"\",\"telefono_1\":\"\",\"telefono_2\":\"\",\"direccion\":\"\",\"cedula\":\"\",\"municipios_id\":\"553\",\"entidad_municipal_id\":\"2\",\"foto\":\"\",\"users_id\":6}', 'http://localhost/ruta_girardot/public/login?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-24 02:21:57', '2019-01-24 02:21:57'),
(3, 'App\\User', 1, 'created', 7, 'App\\PerfilUsuarioModel', '[]', '{\"nombre\":\"\",\"apellido\":\"\",\"telefono_1\":\"\",\"telefono_2\":\"\",\"direccion\":\"\",\"cedula\":\"\",\"municipios_id\":\"553\",\"entidad_municipal_id\":\"2\",\"foto\":\"\",\"users_id\":7}', 'http://localhost/ruta_girardot/public/login?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-24 02:45:22', '2019-01-24 02:45:22'),
(4, 'App\\User', 1, 'updated', 1, 'App\\ImageneModel', '{\"descripcion\":\"como esta\"}', '{\"descripcion\":\"como esta tu\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/1?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-29 03:39:11', '2019-01-29 03:39:11'),
(5, 'App\\User', 1, 'updated', 1, 'App\\Punto_ImagenesModel', '{\"tipo_archivo\":\"jpg\"}', '{\"tipo_archivo\":\"jpgs\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/1?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-29 03:59:31', '2019-01-29 03:59:31'),
(6, 'App\\User', 1, 'updated', 2, 'App\\Punto_ImagenesModel', '{\"icono_punto_id\":null}', '{\"icono_punto_id\":\"3\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/2?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-29 08:16:12', '2019-01-29 08:16:12'),
(7, 'App\\User', 1, 'updated', 5, 'App\\Punto_ImagenesModel', '{\"icono_punto_id\":null}', '{\"icono_punto_id\":\"1\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/5?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-29 08:18:00', '2019-01-29 08:18:00'),
(8, 'App\\User', 1, 'updated', 4, 'App\\Punto_ImagenesModel', '{\"icono_punto_id\":null}', '{\"icono_punto_id\":\"2\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/4?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-29 08:19:17', '2019-01-29 08:19:17'),
(9, 'App\\User', 1, 'updated', 3, 'App\\Punto_ImagenesModel', '{\"icono_punto_id\":null}', '{\"icono_punto_id\":\"1\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/3?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-29 08:20:00', '2019-01-29 08:20:00'),
(10, 'App\\User', 1, 'updated', 1, 'App\\Punto_ImagenesModel', '{\"icono_punto_id\":null}', '{\"icono_punto_id\":\"2\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/1?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-30 01:26:18', '2019-01-30 01:26:18'),
(11, 'App\\User', 1, 'updated', 6, 'App\\Punto_ImagenesModel', '{\"icono_punto_id\":null}', '{\"icono_punto_id\":\"2\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/6?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-30 01:26:32', '2019-01-30 01:26:32'),
(12, 'App\\User', 1, 'updated', 7, 'App\\Punto_ImagenesModel', '{\"icono_punto_id\":null}', '{\"icono_punto_id\":\"2\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/7?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, '2019-01-30 01:26:44', '2019-01-30 01:26:44'),
(13, 'App\\User', 1, 'updated', 4, 'App\\RecursoModel', '{\"descripcion\":\"ddd\"}', '{\"descripcion\":\"dddsss\"}', 'http://localhost/ruta_girardot/public/Recurso/editar/4?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-01-31 19:05:58', '2019-01-31 19:05:58'),
(14, 'App\\User', 1, 'updated', 2, 'App\\RecursoModel', '{\"descripcion\":\"ddd\"}', '{\"descripcion\":\"dddddss\"}', 'http://localhost/ruta_girardot/public/Recurso/editar/2?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-01-31 19:06:42', '2019-01-31 19:06:42'),
(15, 'App\\User', 1, 'updated', 6, 'App\\ImageneModel', '{\"archivo\":\"C:\\\\xampp\\\\tmp\\\\php6AC8.tmp\"}', '{\"archivo\":\"1548946860YKQJl.png\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/6?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-01-31 20:01:00', '2019-01-31 20:01:00'),
(16, 'App\\User', 1, 'updated', 7, 'App\\ImageneModel', '{\"archivo\":\"C:\\\\xampp\\\\tmp\\\\php47FC.tmp\"}', '{\"archivo\":\"1548946868DStD8.jpg\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/7?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-01-31 20:01:08', '2019-01-31 20:01:08'),
(17, 'App\\User', 1, 'updated', 8, 'App\\ImageneModel', '{\"archivo\":\"C:\\\\xampp\\\\tmp\\\\phpDB63.tmp\"}', '{\"archivo\":\"1548946876g04TV.png\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/8?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-01-31 20:01:16', '2019-01-31 20:01:16'),
(18, 'App\\User', 1, 'updated', 4, 'App\\ImageneModel', '{\"archivo\":\"1548641201js7kE.jpg\",\"orden\":45}', '{\"archivo\":\"1548946922gqh6J.png\",\"orden\":\"2\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/4?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-01-31 20:02:03', '2019-01-31 20:02:03'),
(19, 'App\\User', 1, 'updated', 7, 'App\\ImageneModel', '{\"archivo\":\"1548946868DStD8.jpg\",\"orden\":45}', '{\"archivo\":\"1548946929jeYwh.png\",\"orden\":\"32\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/7?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-01-31 20:02:09', '2019-01-31 20:02:09'),
(20, 'App\\User', 1, 'updated', 1, 'App\\Sitio_TuristicoModel', '{\"nombre\":\"comote\"}', '{\"nombre\":\"la locomotora\"}', 'http://localhost/ruta_girardot/public/Sitio_Turistico/editar/1?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 00:20:55', '2019-02-01 00:20:55'),
(21, 'App\\User', 1, 'updated', 2, 'App\\Sitio_TuristicoModel', '{\"nombre\":\"comote\"}', '{\"nombre\":\"puente ferreo\"}', 'http://localhost/ruta_girardot/public/Sitio_Turistico/editar/2?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 00:21:07', '2019-02-01 00:21:07'),
(22, 'App\\User', 1, 'created', 3, 'App\\Sitio_TuristicoModel', '[]', '{\"nombre\":\"puente ospina\",\"descripcion\":\"estado\",\"estado_id\":\"1\",\"users_id\":1,\"id\":3}', 'http://localhost/ruta_girardot/public/Sitio_Turistico?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 00:21:28', '2019-02-01 00:21:28'),
(23, 'App\\User', 1, 'updated', 3, 'App\\Sitio_TuristicoModel', '{\"imagen\":\"\"}', '{\"imagen\":\"1548962548L972u.jpg\"}', 'http://localhost/ruta_girardot/public/Sitio_Turistico/editar/3?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 00:22:28', '2019-02-01 00:22:28'),
(24, 'App\\User', 1, 'updated', 2, 'App\\Sitio_TuristicoModel', '{\"imagen\":\"15486441078R0I2.jpg\"}', '{\"imagen\":\"15489625872YsFc.jpg\"}', 'http://localhost/ruta_girardot/public/Sitio_Turistico/editar/2?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 00:23:08', '2019-02-01 00:23:08'),
(25, 'App\\User', 1, 'updated', 4, 'App\\ImageneModel', '{\"archivo\":\"1548946922gqh6J.png\"}', '{\"archivo\":\"15489677089r4VA.png\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/4?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 01:48:28', '2019-02-01 01:48:28'),
(26, 'App\\User', 1, 'updated', 6, 'App\\ImageneModel', '{\"archivo\":\"1548946860YKQJl.png\"}', '{\"archivo\":\"1548967734IHblF.png\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/6?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 01:48:54', '2019-02-01 01:48:54'),
(27, 'App\\User', 1, 'updated', 7, 'App\\ImageneModel', '{\"archivo\":\"1548946929jeYwh.png\"}', '{\"archivo\":\"1548967760mipZ3.png\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/7?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 01:49:20', '2019-02-01 01:49:20'),
(28, 'App\\User', 1, 'updated', 8, 'App\\ImageneModel', '{\"archivo\":\"1548946876g04TV.png\"}', '{\"archivo\":\"1548967813wnKfh.jpg\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/8?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 01:50:13', '2019-02-01 01:50:13'),
(29, 'App\\User', 1, 'updated', 1, 'App\\ImageneModel', '{\"archivo\":\"1548539414iqtsb.jpg\"}', '{\"archivo\":\"1548971071AMXwe.jpg\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/1?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 02:44:31', '2019-02-01 02:44:31'),
(30, 'App\\User', 1, 'updated', 2, 'App\\ImageneModel', '{\"archivo\":\"1548539634bmLZ8.jpg\"}', '{\"archivo\":\"1548971077lPbGz.jpg\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/2?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 02:44:37', '2019-02-01 02:44:37'),
(31, 'App\\User', 1, 'updated', 3, 'App\\ImageneModel', '{\"archivo\":\"1548539724qUbdB.jpg\"}', '{\"archivo\":\"1548971088e1DPC.jpg\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/3?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 02:44:48', '2019-02-01 02:44:48'),
(32, 'App\\User', 1, 'updated', 5, 'App\\ImageneModel', '{\"archivo\":\"1548456080dtqeD.jpg\"}', '{\"archivo\":\"1548971097dtGSE.jpg\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/5?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 02:44:57', '2019-02-01 02:44:57'),
(33, 'App\\User', 1, 'updated', 9, 'App\\ImageneModel', '{\"archivo\":\"15484566500ML2E.png\"}', '{\"archivo\":\"1548971107UofYY.jpg\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/9?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 02:45:07', '2019-02-01 02:45:07'),
(34, 'App\\User', 1, 'updated', 3, 'App\\ImageneModel', '{\"archivo\":\"1548971088e1DPC.jpg\"}', '{\"archivo\":\"1548971293int9W.jpg\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/3?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36', NULL, '2019-02-01 02:48:13', '2019-02-01 02:48:13'),
(35, 'App\\User', 1, 'deleted', 4, 'App\\ImageneModel', '{\"id\":4,\"descripcion\":\"como\",\"archivo\":\"15489677089r4VA.png\",\"orden\":2,\"titulo\":\"como\",\"users_id\":1}', '[]', 'http://localhost/ruta_girardot/public/Imagene/4?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 06:46:14', '2019-03-06 06:46:14'),
(36, 'App\\User', 1, 'deleted', 10, 'App\\ImageneModel', '{\"id\":10,\"descripcion\":\"como esta\",\"archivo\":\"1548456658TJ01v.png\",\"orden\":45,\"titulo\":\"como\",\"users_id\":1}', '[]', 'http://localhost/ruta_girardot/public/Imagene/10?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 06:46:19', '2019-03-06 06:46:19'),
(37, 'App\\User', 1, 'deleted', 8, 'App\\ImageneModel', '{\"id\":8,\"descripcion\":\"como esta\",\"archivo\":\"1548967813wnKfh.jpg\",\"orden\":45,\"titulo\":\"como\",\"users_id\":1}', '[]', 'http://localhost/ruta_girardot/public/Imagene/8?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 06:46:24', '2019-03-06 06:46:24'),
(38, 'App\\User', 1, 'deleted', 3, 'App\\ImageneModel', '{\"id\":3,\"descripcion\":\"como\",\"archivo\":\"1548971293int9W.jpg\",\"orden\":45,\"titulo\":\"como esta\",\"users_id\":1}', '[]', 'http://localhost/ruta_girardot/public/Imagene/3?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 06:46:31', '2019-03-06 06:46:31'),
(39, 'App\\User', 1, 'updated', 1, 'App\\ImageneModel', '{\"descripcion\":\"como esta tu\",\"archivo\":\"1548971071AMXwe.jpg\",\"orden\":34,\"titulo\":\"ti\"}', '{\"descripcion\":\"Parque de la locomotora\",\"archivo\":\"1551837282B6rzY.jpg\",\"orden\":\"1\",\"titulo\":\"Parque de la locomotora\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/1?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 06:54:43', '2019-03-06 06:54:43'),
(40, 'App\\User', 1, 'updated', 2, 'App\\ImageneModel', '{\"descripcion\":\"como\",\"archivo\":\"1548971077lPbGz.jpg\",\"titulo\":\"como\"}', '{\"descripcion\":\"Vista de la plaza de Mercado\",\"archivo\":\"1551837344N5qZI.png\",\"titulo\":\"Plaza de mercado\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/2?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 06:55:44', '2019-03-06 06:55:44'),
(41, 'App\\User', 1, 'updated', 5, 'App\\ImageneModel', '{\"descripcion\":\"como\",\"archivo\":\"1548971097dtGSE.jpg\",\"titulo\":\"como\"}', '{\"descripcion\":\"Conozca la historia de los ferrocarriles\",\"archivo\":\"1551837389VyesJ.png\",\"titulo\":\"Historia de los ferrocarriles\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/5?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 06:56:29', '2019-03-06 06:56:29'),
(42, 'App\\User', 1, 'updated', 5, 'App\\ImageneModel', '{\"archivo\":\"1551837389VyesJ.png\"}', '{\"archivo\":\"15518374291X5tF.jpg\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/5?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 06:57:10', '2019-03-06 06:57:10'),
(43, 'App\\User', 1, 'updated', 6, 'App\\ImageneModel', '{\"descripcion\":\"como\",\"archivo\":\"1548967734IHblF.png\",\"titulo\":\"como\"}', '{\"descripcion\":\"Embarcadero\",\"archivo\":\"1551837560RGrtb.jpg\",\"titulo\":\"Embarcadero\"}', 'http://localhost/ruta_girardot/public/Imagene/editar/6?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 06:59:20', '2019-03-06 06:59:20'),
(44, 'App\\User', 1, 'deleted', 7, 'App\\ImageneModel', '{\"id\":7,\"descripcion\":\"como\",\"archivo\":\"1548967760mipZ3.png\",\"orden\":32,\"titulo\":\"como\",\"users_id\":1}', '[]', 'http://localhost/ruta_girardot/public/Imagene/7?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 06:59:24', '2019-03-06 06:59:24'),
(45, 'App\\User', 1, 'deleted', 9, 'App\\ImageneModel', '{\"id\":9,\"descripcion\":\"como esta\",\"archivo\":\"1548971107UofYY.jpg\",\"orden\":45,\"titulo\":\"como\",\"users_id\":1}', '[]', 'http://localhost/ruta_girardot/public/Imagene/9?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 06:59:27', '2019-03-06 06:59:27'),
(46, 'App\\User', 1, 'updated', 7, 'App\\Punto_ImagenesModel', '{\"descripcion\":\"como\"}', '{\"descripcion\":\"puente ferreo\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/7?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 07:39:27', '2019-03-06 07:39:27'),
(47, 'App\\User', 1, 'updated', 6, 'App\\Punto_ImagenesModel', '{\"descripcion\":\"como\"}', '{\"descripcion\":\"puente ospina\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/6?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 07:39:43', '2019-03-06 07:39:43'),
(48, 'App\\User', 1, 'updated', 5, 'App\\Punto_ImagenesModel', '{\"descripcion\":\"como\"}', '{\"descripcion\":\"inglesa san migue\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/5?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 07:40:07', '2019-03-06 07:40:07'),
(49, 'App\\User', 1, 'updated', 4, 'App\\Punto_ImagenesModel', '{\"descripcion\":\"como\"}', '{\"descripcion\":\"parque sucre\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/4?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 07:40:23', '2019-03-06 07:40:23'),
(50, 'App\\User', 1, 'updated', 3, 'App\\Punto_ImagenesModel', '{\"descripcion\":\"como\"}', '{\"descripcion\":\"locomotora\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/3?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 07:40:32', '2019-03-06 07:40:32'),
(51, 'App\\User', 1, 'updated', 2, 'App\\Punto_ImagenesModel', '{\"descripcion\":\"como\"}', '{\"descripcion\":\"v\\u00edas f\\u00e9rreas\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/2?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-06 07:40:48', '2019-03-06 07:40:48'),
(52, 'App\\User', 1, 'updated', 7, 'App\\PerfilUsuarioModel', '{\"nombre\":\"dd\"}', '{\"nombre\":\"jimmy alexander\"}', 'http://localhost/ruta_girardot/public/Perfil/Usuario_perfil/Edit/7?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-12 07:08:39', '2019-03-12 07:08:39'),
(53, 'App\\User', 1, 'updated', 7, 'App\\PerfilUsuarioModel', '{\"foto\":\"\"}', '{\"foto\":\"1552356639LB3lv.png\"}', 'http://localhost/ruta_girardot/public/Perfil/Usuario_perfil/Edit/7?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-12 07:10:39', '2019-03-12 07:10:39'),
(54, 'App\\User', 1, 'updated', 7, 'App\\PerfilUsuarioModel', '{\"foto\":\"1552356639LB3lv.png\"}', '{\"foto\":\"1552359159CfDfk.png\"}', 'http://localhost/ruta_girardot/public/Perfil/Usuario_perfil/Edit/7?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-12 07:52:39', '2019-03-12 07:52:39'),
(55, 'App\\User', 1, 'updated', 3, 'App\\Punto_ImagenesModel', '{\"imagen\":\"1548539724qUbdB.jpg\"}', '{\"imagen\":\"1552402353QwelL.png\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/3?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-12 19:52:33', '2019-03-12 19:52:33'),
(56, 'App\\User', 1, 'deleted', 2, 'App\\Punto_ImagenesModel', '{\"id\":2,\"descripcion\":\"v\\u00edas f\\u00e9rreas\",\"latitud\":\"4.30028216132194\",\"longitud\":\"-74.81022135761418\",\"imagen\":\"1548539724qUbdB.jpg\",\"tipo_archivo\":\"jpg\",\"estado_id\":1,\"users_id\":1,\"sitio_turistico_id\":0,\"icono_punto_id\":3}', '[]', 'http://localhost/ruta_girardot/public/Punto_Imagenes/2?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-12 20:42:29', '2019-03-12 20:42:29'),
(57, 'App\\User', 1, 'deleted', 1, 'App\\Punto_ImagenesModel', '{\"id\":1,\"descripcion\":\"como\",\"latitud\":\"4.3019083516286525\",\"longitud\":\"-74.81052176502385\",\"imagen\":\"1548539724qUbdB.jpg\",\"tipo_archivo\":\"jpgs\",\"estado_id\":1,\"users_id\":1,\"sitio_turistico_id\":0,\"icono_punto_id\":2}', '[]', 'http://localhost/ruta_girardot/public/Punto_Imagenes/1?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-12 20:42:45', '2019-03-12 20:42:45'),
(58, 'App\\User', 1, 'updated', 4, 'App\\Punto_ImagenesModel', '{\"sitio_turistico_id\":0}', '{\"sitio_turistico_id\":\"4\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/4?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-12 20:43:23', '2019-03-12 20:43:23'),
(59, 'App\\User', 1, 'updated', 3, 'App\\Punto_ImagenesModel', '{\"sitio_turistico_id\":0}', '{\"sitio_turistico_id\":\"2\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/3?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-12 21:39:08', '2019-03-12 21:39:08'),
(60, 'App\\User', 1, 'updated', 5, 'App\\Punto_ImagenesModel', '{\"sitio_turistico_id\":0}', '{\"sitio_turistico_id\":\"4\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/5?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-12 21:39:16', '2019-03-12 21:39:16'),
(61, 'App\\User', 1, 'updated', 6, 'App\\Punto_ImagenesModel', '{\"sitio_turistico_id\":0}', '{\"sitio_turistico_id\":\"3\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/6?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-12 21:39:24', '2019-03-12 21:39:24'),
(62, 'App\\User', 1, 'updated', 7, 'App\\Punto_ImagenesModel', '{\"sitio_turistico_id\":0}', '{\"sitio_turistico_id\":\"2\"}', 'http://localhost/ruta_girardot/public/Punto_Imagenes/editar/7?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', NULL, '2019-03-12 21:39:32', '2019-03-12 21:39:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_parqueadero`
--

CREATE TABLE `categoria_parqueadero` (
  `id` int(11) NOT NULL,
  `letra` varchar(45) NOT NULL,
  `zona_parqueadero_id` int(11) NOT NULL,
  `niveles_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `zona_parqueadero_sitios_parqueadero_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_parqueadero`
--

INSERT INTO `categoria_parqueadero` (`id`, `letra`, `zona_parqueadero_id`, `niveles_id`, `estado_id`, `zona_parqueadero_sitios_parqueadero_id`, `created_at`, `updated_at`) VALUES
(1, 'A', 1, 1, 1, 1, '2019-04-02 17:23:11', '2019-04-02 17:09:14'),
(2, 'B', 1, 1, 1, 1, '2019-04-02 17:23:09', '2019-04-02 17:11:25'),
(3, 'C', 1, 1, 1, 1, '2019-04-02 17:23:06', '2019-04-02 17:19:41'),
(4, 'D', 1, 1, 1, 1, '2019-04-02 17:22:36', '2019-04-02 17:22:36'),
(5, 'GA', 2, 3, 1, 2, '2019-04-02 23:20:53', '2019-04-02 23:20:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `nombre`, `created_at`, `update_at`) VALUES
(1, 'Activo', '2019-01-06 17:21:58', '2019-01-08 05:00:00'),
(2, 'Inactivo', '2019-01-06 17:22:02', '2019-01-01 05:00:00');

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
(3, '2017_01_02_221802_create_products_table', 1),
(4, '2017_01_24_112847_create_orders_table', 1),
(5, '2017_02_01_154943_create_categories_table', 1),
(6, '2017_02_04_172640_create_brands_table', 1),
(7, '2017_02_04_175220_create_brand_product_table', 1),
(8, '2017_02_04_190821_create_brand_categories', 1),
(9, '2017_02_08_205424_create_images_table', 1),
(10, '2017_02_22_000948_update_users_table', 1),
(11, '2017_02_22_001133_create_subscriptions_table', 1),
(12, '2017_02_23_171727_create_social_providers_table', 1),
(13, '2019_01_05_154546_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 1),
(3, 'App\\User', 1),
(3, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `zona_parqueadero_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `codigo`, `zona_parqueadero_id`, `estado_id`, `created_at`, `updated_at`) VALUES
(1, 'piso 1', 'P1', 1, 1, '2019-04-02 14:54:46', '2019-04-02 14:54:46'),
(2, 'piso 2', 'P2', 1, 1, '2019-04-02 14:55:14', '2019-04-02 14:55:14'),
(3, 'Piso 1', 'P1', 2, 1, '2019-04-03 14:25:00', '2019-04-05 14:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parqueadero_vehiculo`
--

CREATE TABLE `parqueadero_vehiculo` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `categoria_parqueadero_id` int(11) NOT NULL,
  `tipo_vehiculo_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `estado_vehiculo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parqueadero_vehiculo`
--

INSERT INTO `parqueadero_vehiculo` (`id`, `numero`, `codigo`, `categoria_parqueadero_id`, `tipo_vehiculo_id`, `estado_id`, `estado_vehiculo`, `created_at`, `updated_at`) VALUES
(1, 1, 'P1-A-1 ', 1, 1, 1, 2, '2019-04-02 22:14:03', '2019-04-02 22:11:05'),
(2, 2, 'P1-A-2 ', 1, 1, 1, 1, '2019-04-02 21:20:57', '2019-04-02 20:55:56'),
(3, 3, 'P1-A-3 ', 1, 1, 1, 1, '2019-04-02 21:20:59', '2019-04-02 21:14:24'),
(4, 4, 'P1-A-4 ', 1, 1, 1, 1, '2019-04-02 21:21:01', '2019-04-02 21:16:57'),
(5, 5, 'P1-A-5 ', 1, 1, 1, 1, '2019-04-02 21:21:02', '2019-04-02 21:17:53'),
(6, 1, 'P1-B-1 ', 2, 2, 1, 1, '2019-04-02 20:36:31', '2019-04-02 19:22:09'),
(7, 2, 'P1-B-2 ', 2, 2, 1, 1, '2019-04-02 20:36:33', '2019-04-02 19:22:15'),
(8, 3, 'P1-B-3 ', 2, 2, 1, 1, '2019-04-02 20:36:35', '2019-04-02 19:22:20'),
(9, 1, 'P1-GA-1 ', 5, 3, 1, 2, '2019-04-03 00:09:23', '2019-04-03 00:09:23'),
(10, 2, 'P1-GA-2 ', 5, 4, 1, 1, '2019-04-03 00:09:13', '2019-04-02 23:53:55'),
(11, 3, 'P1-GA-3 ', 5, 5, 1, 1, '2019-04-03 00:09:15', '2019-04-03 00:06:53');

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
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(62, 'SitiosParqueadero Add', 'web', '2019-04-02 14:26:52', '2019-04-02 14:27:01'),
(63, 'SitiosParqueadero Editar', 'web', '2019-04-02 14:27:24', '2019-04-02 14:27:24'),
(64, 'SitiosParqueadero Show', 'web', '2019-04-02 14:27:37', '2019-04-02 14:27:37'),
(65, 'ZonaParqueadero Add', 'web', '2019-04-02 14:30:56', '2019-04-02 14:30:56'),
(66, 'ZonaParqueadero Editar', 'web', '2019-04-02 14:31:09', '2019-04-02 14:31:09'),
(67, 'ZonaParqueadero  Show', 'web', '2019-04-02 14:31:31', '2019-04-02 14:31:31'),
(68, 'ZonaParqueadero Eliminar', 'web', '2019-04-02 14:31:56', '2019-04-02 14:31:56'),
(69, 'CategoriaParqueadero Add', 'web', '2019-04-02 14:41:07', '2019-04-02 14:41:32'),
(70, 'CategoriaParqueadero Show', 'web', '2019-04-02 14:41:53', '2019-04-02 14:41:53'),
(71, 'CategoriaParqueadero Editar', 'web', '2019-04-02 14:42:05', '2019-04-02 14:42:05'),
(72, 'CategoriaParqueadero Eliminar', 'web', '2019-04-02 14:42:18', '2019-04-02 14:42:18'),
(73, 'Niveles Show', 'web', '2019-04-02 14:51:43', '2019-04-02 14:51:43'),
(74, 'Niveles Editar', 'web', '2019-04-02 14:51:55', '2019-04-02 14:51:55'),
(75, 'Niveles Add', 'web', '2019-04-02 14:52:06', '2019-04-02 14:52:06'),
(76, 'ParqueaderoVehiculo Show', 'web', '2019-04-02 18:59:37', '2019-04-02 18:59:37'),
(77, 'ParqueaderoVehiculo Editar', 'web', '2019-04-02 18:59:49', '2019-04-02 19:00:03'),
(78, 'ParqueaderoVehiculo Add', 'web', '2019-04-02 19:00:14', '2019-04-02 19:00:14'),
(79, 'TipoVehiculo Add', 'web', '2019-04-02 19:04:22', '2019-04-02 19:04:32'),
(80, 'TipoVehiculo Show', 'web', '2019-04-02 19:04:42', '2019-04-02 19:04:42'),
(81, 'TipoVehiculo Editar', 'web', '2019-04-02 19:04:56', '2019-04-02 19:04:56'),
(82, 'ParqueaderoVehiculo cobra', 'web', '2019-04-02 21:47:28', '2019-04-02 21:47:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_estacionamientos`
--

CREATE TABLE `precio_estacionamientos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL,
  `tiempo` varchar(45) NOT NULL,
  `tipo_vehiculo_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `precio_estacionamientos`
--

INSERT INTO `precio_estacionamientos` (`id`, `nombre`, `precio`, `tiempo`, `tipo_vehiculo_id`, `created_at`, `updated_at`) VALUES
(1, 'carro_hora', '100', '1', 1, '2019-04-02 22:06:49', '2019-04-17 16:28:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_has_perdidos`
--

CREATE TABLE `productos_has_perdidos` (
  `id` int(11) NOT NULL,
  `productos_id` int(11) NOT NULL,
  `perdidos_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `unidades_cajas` int(11) NOT NULL DEFAULT '1',
  `valor_total` decimal(11,3) NOT NULL,
  `vaor_unitario` int(11) NOT NULL,
  `iva` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_has_perdidos`
--

INSERT INTO `productos_has_perdidos` (`id`, `productos_id`, `perdidos_id`, `cantidad`, `unidades_cajas`, `valor_total`, `vaor_unitario`, `iva`, `updated_at`, `created_at`) VALUES
(1, 1, 3, 45, 1, '45.000', 45, 19, '2019-01-16 02:27:04', '2019-01-10 23:38:59'),
(2, 1, 3, 4, 1, '4.000', 4, 4, '2019-01-16 02:27:08', '2019-01-10 23:45:48'),
(3, 2, 3, 4, 1, '4.000', 4, 4, '2019-01-16 02:27:10', '2019-01-10 23:47:57'),
(4, 3, 3, 4, 1, '4.000', 4, 4, '2019-01-16 02:27:13', '2019-01-10 23:53:34'),
(5, 1, 3, 4555, 1, '4.000', 4, 4, '2019-01-16 02:27:15', '2019-01-10 23:55:20'),
(6, 2, 3, 433, 1, '4.000', 4, 4, '2019-01-16 02:27:17', '2019-01-10 23:55:52'),
(7, 3, 3, 4, 1, '4.000', 4, 4, '2019-01-16 02:27:19', '2019-01-10 23:56:15'),
(8, 3, 3, 4, 1, '4.000', 4, 4, '2019-01-16 02:27:22', '2019-01-10 23:56:15'),
(9, 4, 2, 2, 20, '107200.000', 53600, 19, '2019-01-16 01:47:36', '2019-01-16 00:41:35'),
(10, 5, 2, 1, 10, '53600.000', 53600, 19, '2019-01-16 01:47:44', '2019-01-16 00:42:00'),
(11, 6, 2, 1, 20, '66100.000', 66100, 19, '2019-01-16 01:57:08', '2019-01-16 00:42:30'),
(13, 7, 4, 6, 1, '8060.770', 1343, 19, '2019-01-16 02:27:24', '2019-01-16 01:23:13'),
(14, 8, 4, 6, 1, '8060.770', 1343, 19, '2019-01-16 02:27:27', '2019-01-16 01:23:19'),
(15, 9, 4, 6, 1, '8060.770', 1343, 19, '2019-01-16 02:27:31', '2019-01-16 01:23:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso`
--

CREATE TABLE `recurso` (
  `id` int(11) NOT NULL,
  `descripcion` longtext NOT NULL,
  `archivo` varchar(45) NOT NULL,
  `punto_x` varchar(45) NOT NULL,
  `punto_y` varchar(45) NOT NULL,
  `punto_z` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `estado_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `punto_imagenes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recurso`
--

INSERT INTO `recurso` (`id`, `descripcion`, `archivo`, `punto_x`, `punto_y`, `punto_z`, `created_at`, `updated_at`, `estado_id`, `users_id`, `punto_imagenes_id`) VALUES
(1, 'ddd', 'eee', '44', '44', '44', '2019-01-28 03:19:42', '2019-01-28 03:19:42', 1, 1, 1),
(2, 'dddddss', 'eee', '44', '44', '44', '2019-01-31 14:06:42', '2019-01-31 19:06:42', 1, 1, 1),
(4, 'dddsss', '15486469762QUgo.jpg', '44', '44', '44', '2019-01-31 14:05:58', '2019-01-31 19:05:58', 1, 1, 1),
(5, 'ddd', '1548647064U7DdV.jpg', '44', '44', '44', '2019-01-28 03:44:24', '2019-01-28 08:44:24', 1, 1, 1),
(6, 'ddd', '1548647100fhpHL.jpg', '44', '44', '44', '2019-01-28 03:45:00', '2019-01-28 08:45:00', 1, 1, 1),
(7, 'ddd', 'eee', '44', '44', '44', '2019-01-28 08:33:40', '2019-01-28 08:33:40', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `id` int(11) NOT NULL,
  `cosecutivo` varchar(45) DEFAULT NULL,
  `fecha_ingreso` varchar(45) NOT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `fecha_pago` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `valor_pagado` varchar(45) NOT NULL,
  `parqueadero_vehiculo_id` int(11) NOT NULL,
  `placa_vehiculo` varchar(8) DEFAULT NULL,
  `precio_estacionamiento` varchar(45) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `estado_vehiculo` int(11) NOT NULL DEFAULT '2',
  `sitios_parqueadero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id`, `cosecutivo`, `fecha_ingreso`, `fecha_salida`, `fecha_pago`, `updated_at`, `created_at`, `valor_pagado`, `parqueadero_vehiculo_id`, `placa_vehiculo`, `precio_estacionamiento`, `user_id`, `estado_vehiculo`, `sitios_parqueadero_id`) VALUES
(32, NULL, '2019-04-02 16:42:19', '2019-04-02 18:05:19', '0000-00-00 00:00:00', '2019-04-03 00:00:55', '2019-04-02 21:42:19', '8300', 1, NULL, '100', NULL, 2, 1),
(33, NULL, '2019-04-02 19:09:23', '2019-04-02 19:09:39', '0000-00-00 00:00:00', '2019-04-03 00:09:39', '2019-04-03 00:09:23', '0', 9, NULL, '100', 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2019-01-05 21:03:14', '2019-01-05 21:03:14'),
(2, 'Administrador', 'web', '2019-01-24 02:32:21', '2019-01-24 02:32:21'),
(3, 'Super Administrador', 'web', '2019-04-02 14:22:39', '2019-04-02 14:22:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 3),
(63, 3),
(64, 3),
(65, 2),
(65, 3),
(66, 2),
(66, 3),
(67, 2),
(67, 3),
(68, 3),
(69, 2),
(69, 3),
(70, 2),
(70, 3),
(71, 2),
(71, 3),
(72, 2),
(72, 3),
(73, 2),
(73, 3),
(74, 2),
(74, 3),
(75, 2),
(75, 3),
(76, 2),
(76, 3),
(77, 2),
(77, 3),
(78, 2),
(78, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 2),
(82, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitios_parqueadero`
--

CREATE TABLE `sitios_parqueadero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sitios_parqueadero`
--

INSERT INTO `sitios_parqueadero` (`id`, `nombre`, `direccion`, `created_at`, `updated_at`) VALUES
(1, 'Centro Comercial Centro Mayor', 'carrera 34-34 autopista sur', '2019-04-02 14:29:38', '2019-04-02 14:29:38'),
(2, 'Centro Comercial La Gran Estación', 'carrera 80 autopista norte', '2019-04-02 14:57:33', '2019-04-02 14:57:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitios_parqueadero_has_user`
--

CREATE TABLE `sitios_parqueadero_has_user` (
  `id` int(11) NOT NULL,
  `sitios_parqueadero_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sitios_parqueadero_has_user`
--

INSERT INTO `sitios_parqueadero_has_user` (`id`, `sitios_parqueadero_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2019-04-02 23:19:26', '2019-04-16 14:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculo`
--

CREATE TABLE `tipo_vehiculo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio_minutos` int(11) NOT NULL,
  `sitios_parqueadero_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_vehiculo`
--

INSERT INTO `tipo_vehiculo` (`id`, `nombre`, `precio_minutos`, `sitios_parqueadero_id`, `created_at`, `updated_at`) VALUES
(1, 'carro', 100, 1, '2019-04-02 23:31:59', '2019-04-02 19:05:51'),
(2, 'moto', 50, 1, '2019-04-02 23:31:57', '2019-04-02 19:06:02'),
(3, 'moto', 100, 2, '2019-04-02 23:48:02', '2019-04-02 23:48:02'),
(4, 'carro', 150, 2, '2019-04-02 23:45:57', '2019-04-02 23:39:48'),
(5, 'bicicletas', 100, 2, '2019-04-02 23:48:55', '2019-04-02 23:48:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https://placehold.it/88x88',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula` int(11) NOT NULL,
  `correo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` int(11) NOT NULL,
  `telefono_fijo` int(11) NOT NULL,
  `direccion_correo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `nickname`, `avatar`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `nombre`, `apellido`, `cedula`, `correo`, `celular`, `telefono_fijo`, `direccion_correo`) VALUES
(1, 'marcos alberto saavedra', 'once.marcos.alberto@gmail.com', '$2y$10$7ULrAbLcMD8BiPyZ3UqcEOAU2944pzdvDORQiL7RGyYdiM5n7lF36', NULL, '1552359159CfDfk.png', '06xG47nURALjGKPhqzodAko1WLL6m3bIMT1OqZamZNBzIiEDwujUIia8nFpZ', '2019-01-05 03:53:36', '2019-04-03 00:48:35', NULL, NULL, NULL, NULL, 'marcos', 'saavedra', 1069176309, 'once.marcos.alberto@gmail.com', 2147483647, 32456, 'como esta'),
(2, 'marcos alberto', 'marcos-saavedra23@upc.edu.co', '$2y$10$YUVhzBqquZzxvn50.bYiK.33BvojalnieDSEXPD2vj4sVCnSea4te', NULL, '', NULL, '2019-02-06 01:29:23', '2019-02-06 01:29:23', NULL, NULL, NULL, NULL, '', '', 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_perfil`
--

CREATE TABLE `users_perfil` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `telefono_1` varchar(15) NOT NULL,
  `telefono_2` varchar(15) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_perfil`
--

INSERT INTO `users_perfil` (`id`, `nombre`, `apellido`, `telefono_1`, `telefono_2`, `direccion`, `cedula`, `foto`, `created_at`, `updated_at`, `users_id`) VALUES
(7, 'jimmy alexander', 'dd', '33', '33', 'dee', '332', '1552359159CfDfk.png', '2019-03-12 02:52:39', '2019-03-12 07:52:39', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona_parqueadero`
--

CREATE TABLE `zona_parqueadero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `sitios_parqueadero_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `estado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `zona_parqueadero`
--

INSERT INTO `zona_parqueadero` (`id`, `nombre`, `sitios_parqueadero_id`, `created_at`, `updated_at`, `estado_id`) VALUES
(1, 'Parqueadero principal centro mayor', 1, '2019-04-02 15:49:28', '2019-04-02 14:38:32', 1),
(2, 'parqueadero zona libre gran estacion', 2, '2019-04-02 15:49:36', '2019-04-02 15:18:07', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_id_auditable_type_index` (`auditable_id`,`auditable_type`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indices de la tabla `categoria_parqueadero`
--
ALTER TABLE `categoria_parqueadero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria_parqueadero_zona_parqueadero1_idx` (`zona_parqueadero_id`),
  ADD KEY `fk_categoria_parqueadero_niveles1_idx` (`niveles_id`),
  ADD KEY `fk_categoria_parqueadero_estado1_idx` (`estado_id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_niveles_zona_parqueadero1_idx` (`zona_parqueadero_id`),
  ADD KEY `fk_niveles_estado1_idx` (`estado_id`);

--
-- Indices de la tabla `parqueadero_vehiculo`
--
ALTER TABLE `parqueadero_vehiculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_parqueadero_vehiculo_categoria_parqueadero1_idx` (`categoria_parqueadero_id`),
  ADD KEY `fk_parqueadero_vehiculo_tipo_vehiculo1_idx` (`tipo_vehiculo_id`),
  ADD KEY `fk_parqueadero_vehiculo_estado1_idx` (`estado_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `precio_estacionamientos`
--
ALTER TABLE `precio_estacionamientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_precio_estacionamientos_tipo_vehiculo1_idx` (`tipo_vehiculo_id`);

--
-- Indices de la tabla `productos_has_perdidos`
--
ALTER TABLE `productos_has_perdidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productos_has_perdidos_perdidos1_idx` (`perdidos_id`),
  ADD KEY `fk_productos_has_perdidos_productos_idx` (`productos_id`);

--
-- Indices de la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_recurso_estado1_idx` (`estado_id`),
  ADD KEY `fk_recurso_users1_idx` (`users_id`),
  ADD KEY `fk_recurso_punto_imagenes1_idx` (`punto_imagenes_id`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_registro_parqueadero_vehiculo1_idx` (`parqueadero_vehiculo_id`),
  ADD KEY `fk_registro_user1_idx` (`user_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `sitios_parqueadero`
--
ALTER TABLE `sitios_parqueadero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sitios_parqueadero_has_user`
--
ALTER TABLE `sitios_parqueadero_has_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sitios_parqueadero_has_user_user1_idx` (`user_id`),
  ADD KEY `fk_sitios_parqueadero_has_user_sitios_parqueadero1_idx` (`sitios_parqueadero_id`);

--
-- Indices de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `users_perfil`
--
ALTER TABLE `users_perfil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_perfil_users1_idx` (`users_id`);

--
-- Indices de la tabla `zona_parqueadero`
--
ALTER TABLE `zona_parqueadero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zona_parqueadero_sitios_parqueadero_idx` (`sitios_parqueadero_id`),
  ADD KEY `fk_zona_parqueadero_estado1_idx` (`estado_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `audits`
--
ALTER TABLE `audits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `categoria_parqueadero`
--
ALTER TABLE `categoria_parqueadero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `parqueadero_vehiculo`
--
ALTER TABLE `parqueadero_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `precio_estacionamientos`
--
ALTER TABLE `precio_estacionamientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos_has_perdidos`
--
ALTER TABLE `productos_has_perdidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `recurso`
--
ALTER TABLE `recurso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sitios_parqueadero`
--
ALTER TABLE `sitios_parqueadero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sitios_parqueadero_has_user`
--
ALTER TABLE `sitios_parqueadero_has_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users_perfil`
--
ALTER TABLE `users_perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `zona_parqueadero`
--
ALTER TABLE `zona_parqueadero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria_parqueadero`
--
ALTER TABLE `categoria_parqueadero`
  ADD CONSTRAINT `fk_categoria_parqueadero_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_categoria_parqueadero_niveles1` FOREIGN KEY (`niveles_id`) REFERENCES `niveles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_categoria_parqueadero_zona_parqueadero1` FOREIGN KEY (`zona_parqueadero_id`) REFERENCES `zona_parqueadero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD CONSTRAINT `fk_niveles_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_niveles_zona_parqueadero1` FOREIGN KEY (`zona_parqueadero_id`) REFERENCES `zona_parqueadero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `parqueadero_vehiculo`
--
ALTER TABLE `parqueadero_vehiculo`
  ADD CONSTRAINT `fk_parqueadero_vehiculo_categoria_parqueadero1` FOREIGN KEY (`categoria_parqueadero_id`) REFERENCES `categoria_parqueadero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_parqueadero_vehiculo_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_parqueadero_vehiculo_tipo_vehiculo1` FOREIGN KEY (`tipo_vehiculo_id`) REFERENCES `tipo_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `precio_estacionamientos`
--
ALTER TABLE `precio_estacionamientos`
  ADD CONSTRAINT `fk_precio_estacionamientos_tipo_vehiculo1` FOREIGN KEY (`tipo_vehiculo_id`) REFERENCES `tipo_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `fk_registro_parqueadero_vehiculo1` FOREIGN KEY (`parqueadero_vehiculo_id`) REFERENCES `parqueadero_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registro_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sitios_parqueadero_has_user`
--
ALTER TABLE `sitios_parqueadero_has_user`
  ADD CONSTRAINT `fk_sitios_parqueadero_has_user_sitios_parqueadero1` FOREIGN KEY (`sitios_parqueadero_id`) REFERENCES `sitios_parqueadero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sitios_parqueadero_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_perfil`
--
ALTER TABLE `users_perfil`
  ADD CONSTRAINT `fk_userds_perfil` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `zona_parqueadero`
--
ALTER TABLE `zona_parqueadero`
  ADD CONSTRAINT `fk_zona_parqueadero_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_zona_parqueadero_sitios_parqueadero` FOREIGN KEY (`sitios_parqueadero_id`) REFERENCES `sitios_parqueadero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
