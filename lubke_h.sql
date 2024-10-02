-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2024 a las 08:25:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lubke_h`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripción` text NOT NULL,
  `activo` varchar(2) NOT NULL DEFAULT 'si'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripción`, `activo`) VALUES
(1, 'Gatos', 'balanceado', 'si'),
(2, 'Perros', 'balanceado', 'si'),
(3, 'Accesorios', 'Perros-Gatos', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL,
  `asunto` varchar(255) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `visto` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id`, `asunto`, `mensaje`, `usuario_id`, `visto`) VALUES
(6, 'consulta de compra', 'Hola, quiero saber en que horarios puedo pasar a retirar mi compra online. Gracias', 3, 'no'),
(7, 'Compra', 'Buenas tardes, ¿Cuánto demora en llegar mi compra?', 3, 'no'),
(8, 'Compra online', 'Compre dos collares p/pulgas. ¿Puedo elegir el tamaño en el local, cuando paso a retirar?', 2, 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` int(50) NOT NULL,
  `asunto` varchar(250) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `visto` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallesfactura`
--

CREATE TABLE `detallesfactura` (
  `id` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(100) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallesfactura`
--

INSERT INTO `detallesfactura` (`id`, `id_factura`, `id_producto`, `cantidad`, `subtotal`) VALUES
(91, 64, 16, 2, 8800),
(119, 82, 2, 1, 35050),
(120, 82, 16, 1, 4400),
(121, 82, 9, 1, 48000),
(125, 84, 8, 1, 41000),
(126, 84, 18, 1, 38650),
(137, 90, 13, 2, 11000),
(138, 91, 11, 1, 3500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `importe_total` decimal(10,0) NOT NULL,
  `activo` varchar(2) DEFAULT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id`, `id_usuario`, `importe_total`, `activo`, `fecha`) VALUES
(64, 2, 8800, '1', '2024-06-14 00:00:00'),
(82, 3, 87450, '1', '2024-06-15 00:00:00'),
(84, 3, 79650, '1', '2024-06-15 00:00:00'),
(90, 2, 11000, '1', '2024-06-15 00:00:00'),
(91, 2, 3500, '1', '2024-06-15 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `Id_perfiles` int(11) NOT NULL,
  `descripción` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`Id_perfiles`, `descripción`) VALUES
(1, 'admin'),
(2, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `url_imagen` varchar(255) NOT NULL,
  `activo` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `id_categoria`, `nombre`, `descripcion`, `precio`, `cantidad`, `url_imagen`, `activo`) VALUES
(1, 1, 'Royal canin', 'balanceado ', 45000, 260, '1717961913_b400ad43fd4da2bc7259.png', 'si'),
(2, 1, 'Agility urinary', 'balanceado ', 35050, 234, '1717949702_fdb1895f87cebb440157.png', 'si'),
(3, 1, 'Raza', 'adulto', 38650, 13, '1717949912_69b1afba406fce8da66e.png', 'no'),
(4, 1, 'Proplan ', 'mediano', 29850, 250, '1717949920_8aa20ad69703d269fb06.png', 'si'),
(5, 2, 'Dogui', 'Adulto', 36000, 250, '1717949985_bb3e52884daff8a268c5.png', 'si'),
(6, 2, 'Pedigri', 'Adulto', 40000, 250, '1717950163_9f502cdaa48455628abe.png', 'si'),
(7, 2, 'Pedigri', 'mediano', 35000, 999, '1717950248_a847dbb8f0cc537a671e.png', 'si'),
(8, 2, 'Proplan ', 'cachorro', 41000, 984, '1717950294_2ca7b43ea64b1633187b.png', 'si'),
(9, 2, 'Royal canin', 'mediano', 48000, 243, '1717950328_c2fc0648903da68f7fa3.png', 'si'),
(10, 2, 'Sieger', 'mediano', 35050, 250, '1717950437_2ac113567d28222de888.png', 'si'),
(11, 3, 'Cepillo', 'De acero', 3500, 249, '1717950488_4c3e4333879f7b17b784.png', 'si'),
(12, 3, 'Collar con moños', 'Para gatos', 1950, 900, '1717950534_263be8efc2def78c356b.png', 'si'),
(13, 3, 'Collar p/pulgas', 'Perros y gatos', 5500, 898, '1717951269_394e410d78c7c74c27a0.png', 'si'),
(14, 3, 'Correas', 'Perros y gatos', 6500, 250, '1717951317_7d41d1b681bdc9746356.png', 'si'),
(15, 3, 'Juguetes', 'Gatos', 4800, 180, '1717951372_bda9575023c581f72a20.png', 'si'),
(16, 3, 'Juguetes', 'Perros', 4400, 793, '1717951415_bab2e0641e36119333c6.png', 'si'),
(17, 1, 'Whiskas', 'Adulto', 29800, 250, '1717951524_46332ad8a92b9db5dcb0.png', 'si'),
(18, 1, 'Raza', 'Adulto', 38650, 244, '1717951566_30d9705157aaff7c2735.png', 'si'),
(19, 1, 'Cat Chow ', 'Adulto', 38000, 280, '1717951635_cdd2ab3c8c3c5ebb5e71.png', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id_usuario` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Apellido` varchar(40) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Pass` varchar(100) NOT NULL,
  `Perfil_id` int(11) NOT NULL DEFAULT 2,
  `Baja` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id_usuario`, `Nombre`, `Apellido`, `Usuario`, `Email`, `Pass`, `Perfil_id`, `Baja`) VALUES
(1, 'Hernan', 'Lubke', 'hernan_lubke', 'lubkehernan@gmail.com', '$2y$10$5mk9IdlBEBLF3dsk1iIGBuvG.aQF3NH4Enbz50BCjM4X1oWxIQlPG', 1, ''),
(2, 'Juan', 'Castillo', 'juan_castillo', 'juan24@gmail.com', '$2y$10$XO2wo/bc7nAuWb5ARWE6U.e44GZL4l4m.E7exxRRfSW1m4h0uvT2C', 2, ''),
(3, 'Dario', 'Perez', 'dar_perzz', 'darperez@gmail.com', '$2y$10$9VY3aP42HoLmOMKCU5NBa.eBPcu.w.OEhhnKJaxf2U0ZtRjkl2HHW', 2, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detallesfactura`
--
ALTER TABLE `detallesfactura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_factura` (`id_factura`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`Id_perfiles`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id_usuario`),
  ADD KEY `Perfil_id` (`Perfil_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallesfactura`
--
ALTER TABLE `detallesfactura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `Id_perfiles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`Id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallesfactura`
--
ALTER TABLE `detallesfactura`
  ADD CONSTRAINT `detallesfactura_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detallesfactura_ibfk_2` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`Id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
