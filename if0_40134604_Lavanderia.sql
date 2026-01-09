-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql205.byetcluster.com
-- Tiempo de generación: 09-01-2026 a las 16:22:54
-- Versión del servidor: 11.4.9-MariaDB
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `if0_40134604_Lavanderia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atencion`
--

CREATE TABLE `atencion` (
  `id_pedido` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `Fecha_asignacion` date DEFAULT NULL,
  `Observaciones` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calzado`
--

CREATE TABLE `calzado` (
  `id_servicio` int(11) NOT NULL,
  `Material_calzado` varchar(60) DEFAULT NULL,
  `Tipo_limpieza` varchar(60) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `calzado`
--

INSERT INTO `calzado` (`id_servicio`, `Material_calzado`, `Tipo_limpieza`) VALUES
(3, 'Tela', 'A mano'),
(4, 'Cuero', 'A mano'),
(11, 'Tela', 'A mano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `correo` varchar(80) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `telefono`, `direccion`, `correo`, `password`) VALUES
(21, 'Ruben', '+554723721', 'Oriente155', 'juan@gmail.com', '$2y$10$fd/gvkbt4tdh5Bn/OlbqeOPsVNH2c9uJM40ENRdJXH0ORChPy5q2q'),
(20, 'Luis', '5543127698', 'Rumania', 'luis@gmail.com', '$2y$10$iwe/CpFmci.pJOKqJVVu8uXgGMZyebeMQ/zlhjBpvGF0n5hO5iYWm'),
(19, 'Ara', '5513209832', 'ESCOM', 'ara@gmail.com', '$2y$10$YJ0c0M6AoR8QybenQfp7MuQ1ZqDFdWCHAMo/prNeacwDTWLrXMtE2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `Turno` varchar(30) DEFAULT NULL,
  `correo` varchar(80) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `Nombre`, `Turno`, `correo`, `password`) VALUES
(1, 'Arale', 'Matutino', 'arale@gmail.com', '$2y$10$rtFOItoi3OtMe2pJb7F4luGAAq.0qNn2OCnNpYrqaLIwXOX4ioZIq');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lavado`
--

CREATE TABLE `lavado` (
  `id_servicio` int(11) NOT NULL,
  `Tipo_tela` varchar(60) DEFAULT NULL,
  `Tipo_lavado` varchar(60) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `lavado`
--

INSERT INTO `lavado` (`id_servicio`, `Tipo_tela`, `Tipo_lavado`) VALUES
(1, 'Licra', 'A lavadora'),
(2, 'Algodon', 'A mano'),
(6, 'Algodon', 'A mano'),
(7, 'Algodon', 'A mano'),
(10, 'Algodon', 'A lavadora'),
(12, 'algodon', 'a mano'),
(13, 'algodon', 'a mano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `Fecha_pago` date NOT NULL,
  `Metodo_pago` varchar(50) DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `estado_pedido` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_cliente`, `fecha_pedido`, `fecha_entrega`, `estado_pedido`) VALUES
(1, 5, '2025-11-02', '2003-02-25', 'Pendiente'),
(5, 1, '2025-11-02', NULL, 'Pendiente'),
(4, 1, '2025-11-02', NULL, 'Pendiente'),
(6, 1, '2025-11-02', '2025-11-05', 'Pendiente'),
(7, 9, '2025-11-03', '2025-11-04', 'Pendiente'),
(8, 9, '2025-11-03', '2025-11-05', 'Pendiente'),
(9, 1, '2025-11-04', '2025-11-06', 'Pendiente'),
(10, 12, '2025-11-11', '2025-11-12', 'Pendiente'),
(11, 12, '2025-11-11', '2025-11-12', 'Pendiente'),
(12, 1, '2026-01-07', '2026-01-09', 'Pendiente'),
(13, 16, '2026-01-09', '2026-01-12', 'Pendiente'),
(14, 19, '2026-01-09', '2026-01-11', 'Pendiente'),
(15, 21, '2026-01-09', '2026-01-11', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_servicio`
--

CREATE TABLE `pedido_servicio` (
  `id_pedido` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedido_servicio`
--

INSERT INTO `pedido_servicio` (`id_pedido`, `id_servicio`) VALUES
(3, 1),
(4, 2),
(5, 3),
(6, 4),
(7, 5),
(8, 6),
(9, 7),
(10, 8),
(11, 9),
(12, 10),
(13, 11),
(14, 12),
(15, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planchado`
--

CREATE TABLE `planchado` (
  `id_servicio` int(11) NOT NULL,
  `Tipo_planchado` varchar(60) DEFAULT NULL,
  `Temperatura` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `planchado`
--

INSERT INTO `planchado` (`id_servicio`, `Tipo_planchado`, `Temperatura`) VALUES
(5, 'A vapor', '20'),
(8, 'A vapor', '20'),
(9, 'A vapor', '20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prenda`
--

CREATE TABLE `prenda` (
  `id_prenda` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `Descripcion` varchar(120) DEFAULT NULL,
  `Cuidados_especiales` varchar(120) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `prenda`
--

INSERT INTO `prenda` (`id_prenda`, `id_pedido`, `Descripcion`, `Cuidados_especiales`) VALUES
(1, 0, 'Camisa', NULL),
(2, 3, 'Playera', 'Ninguno'),
(3, 4, 'Sudadera roja', 'Ninguno'),
(4, 5, 'Tenis', 'Lavar con agua caliente'),
(5, 6, 'Zapatos', 'Ninguno'),
(6, 7, 'Chaqueta', 'Ninguno'),
(7, 8, 'sueter', 'Ninguno'),
(8, 9, 'bufanda', 'Ninguno'),
(9, 10, 'Calcetines', 'Ninguno'),
(10, 11, 'Calcetines', 'Ninguno'),
(11, 12, 'Sudadera roja', 'Ninguno'),
(12, 13, 'Tenis', 'Ninguno'),
(13, 14, 'guantes', 'agua fria'),
(14, 15, 'tangas', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `Precio_base` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `Precio_base`) VALUES
(1, '0.00'),
(2, '60.00'),
(3, '80.00'),
(4, '80.00'),
(5, '30.00'),
(6, '60.00'),
(7, '60.00'),
(8, '30.00'),
(9, '30.00'),
(10, '60.00'),
(11, '80.00'),
(12, '60.00'),
(13, '60.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `atencion`
--
ALTER TABLE `atencion`
  ADD PRIMARY KEY (`id_pedido`,`id_empleado`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `calzado`
--
ALTER TABLE `calzado`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `lavado`
--
ALTER TABLE `lavado`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD UNIQUE KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `pedido_servicio`
--
ALTER TABLE `pedido_servicio`
  ADD PRIMARY KEY (`id_pedido`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `planchado`
--
ALTER TABLE `planchado`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `prenda`
--
ALTER TABLE `prenda`
  ADD PRIMARY KEY (`id_prenda`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `atencion`
--
ALTER TABLE `atencion`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calzado`
--
ALTER TABLE `calzado`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `lavado`
--
ALTER TABLE `lavado`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pedido_servicio`
--
ALTER TABLE `pedido_servicio`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `planchado`
--
ALTER TABLE `planchado`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `prenda`
--
ALTER TABLE `prenda`
  MODIFY `id_prenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
