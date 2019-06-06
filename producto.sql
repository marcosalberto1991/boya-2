-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2019 a las 20:55:52
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mitienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre_proveedor` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `precio_caja` int(11) NOT NULL,
  `cantidad_caja` int(11) NOT NULL,
  `precio_unidad` int(11) NOT NULL,
  `iva` int(11) NOT NULL,
  `porcentaje_ganacia` int(11) NOT NULL,
  `precio_venta` int(11) NOT NULL,
  `ganacia` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre_proveedor`, `nombre`, `imagen`, `precio_caja`, `cantidad_caja`, `precio_unidad`, `iva`, `porcentaje_ganacia`, `precio_venta`, `ganacia`, `proveedor_id`, `created_at`, `updated_at`) VALUES
(3, 'bocadillo veleño', 'bocadillo veleño', 'EE', 7800, 36, 217, 19, 60, 388, 171, 1, '2019-05-06 17:20:15', '2019-05-06 22:20:15'),
(4, 'vive 100', 'vive 100', 'EE', 35464, 24, 1478, 19, 50, 2501, 1023, 1, '2019-05-06 17:22:10', '2019-05-06 22:22:10'),
(5, 'schon cerveroni zenu 1.2kg', 'schon cerveroni zenu 1.2kg', 'EE', 13787, 1, 13787, 19, 30, 20543, 6756, 1, '2019-05-06 19:52:21', '2019-05-07 00:52:21'),
(6, 'schon cervec rica 950g', 'schon cervec rica 950g', 'EE', 7636, 1, 7636, 19, 30, 11378, 3742, 1, '2019-05-06 19:53:48', '2019-05-07 00:53:48'),
(7, 'pañuelo normal chicx12x10', 'pañuelo normal chicx12x10', 'EE', 7193, 10, 719, 19, 48, 1201, 481, 1, '2019-05-30 16:25:56', '2019-05-30 21:25:56'),
(8, 'yogurt original', 'yogurt original', 'no tiene', 1145, 1, 1145, 19, 56, 2000, 855, 1, '2019-05-31 19:52:27', '2019-05-31 19:52:27'),
(9, 'aguadiente necta club tetra 1500cc', 'aguadiente necta club 1500cc', 'notiene', 47594, 1, 47594, 5, 30, 64252, 16658, 1, '2019-05-31 20:09:42', '2019-05-31 20:09:42'),
(10, 'coca cola 400ml pet', 'cocacola 400ml', 'hh', 14790, 12, 1233, 19, 43, 2000, 768, 1, '2019-05-31 20:37:08', '2019-05-31 20:37:08'),
(11, 'coca cola 1.5lt', 'cocacola 400ml', 'hh', 29580, 12, 2465, 19, 43, 4001, 1536, 1, '2019-05-31 20:38:22', '2019-05-31 20:38:22'),
(12, 'coca cola 3lt', 'coca cola 3 litros', 'hh', 26219, 6, 4370, 19, 41, 7000, 2631, 1, '2019-05-31 20:42:45', '2019-05-31 20:42:45'),
(13, 'coca cola 6.5oz vir', 'coca cola 250ml', 'hh', 16723, 30, 557, 19, 61, 1003, 446, 1, '2019-05-31 20:50:56', '2019-05-31 20:50:56'),
(14, 'coca cola 20oz pet', 'coca cola 600ml', 'hh', 29832, 15, 1989, 19, 32, 3000, 1011, 1, '2019-05-31 21:05:03', '2019-05-31 21:05:03'),
(15, 'Agua brisa pet 600ml', 'agua brisa pet 600ml', 'ff', 27900, 24, 1163, 19, 96, 2501, 1338, 1, '2019-05-31 21:08:43', '2019-05-31 21:08:43'),
(16, 'jumbo mani 12', 'jumbo mani mini 18gm', 'ff', 11324, 24, 472, 19, 30, 703, 231, 1, '2019-05-31 21:54:46', '2019-05-31 21:54:46');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_proveedor1_idx` (`proveedor_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
