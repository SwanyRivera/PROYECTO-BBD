-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2023 a las 12:40:28
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basefinal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id_marca` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id_categoria` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE `company` (
  `NIT` int(11) NOT NULL,
  `nombre` int(80) NOT NULL,
  `direccion` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `portal` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `direccion` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NIT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `id_inventario` int(11) NOT NULL,
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `stock_in` int(11) NOT NULL,
  `entries` int(11) NOT NULL,
  `outlets` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_producto` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `imagen` mediumblob DEFAULT NULL,
  `id_rate` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rates`
--

CREATE TABLE `rates` (
  `id_rate` int(11) NOT NULL,
  `costo` double NOT NULL,
  `precio` double NOT NULL,
  `rt_state` varchar(45) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_d`
--

CREATE TABLE `sales_d` (
  `id` int(11) NOT NULL,
  `cantidad` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `id_producto` int(11) NOT NULL,
  `factura` int(11) NOT NULL,
  `serie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_h`
--

CREATE TABLE `sales_h` (
  `factura` int(11) NOT NULL,
  `serie` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `codigo_cliente` int(11) NOT NULL,
  `NIT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usser`
--

CREATE TABLE `usser` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `usser` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `pswd` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `tipo_usuario` varchar(30) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`NIT`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `products_fk_2` (`id_producto`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `rates_fk` (`id_rate`),
  ADD KEY `brands_fk` (`id_marca`),
  ADD KEY `categories_fk` (`id_categoria`);

--
-- Indices de la tabla `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id_rate`);

--
-- Indices de la tabla `sales_d`
--
ALTER TABLE `sales_d`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_h_fk` (`factura`),
  ADD KEY `products_fk` (`id_producto`);

--
-- Indices de la tabla `sales_h`
--
ALTER TABLE `sales_h`
  ADD PRIMARY KEY (`factura`),
  ADD KEY `customers_fk` (`codigo_cliente`),
  ADD KEY `company_fk` (`NIT`);

--
-- Indices de la tabla `usser`
--
ALTER TABLE `usser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rates`
--
ALTER TABLE `rates`
  MODIFY `id_rate` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sales_d`
--
ALTER TABLE `sales_d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sales_h`
--
ALTER TABLE `sales_h`
  MODIFY `factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usser`
--
ALTER TABLE `usser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `products_fk_2` FOREIGN KEY (`id_producto`) REFERENCES `products` (`id_producto`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `brands_fk` FOREIGN KEY (`id_marca`) REFERENCES `brands` (`id_marca`),
  ADD CONSTRAINT `categories_fk` FOREIGN KEY (`id_categoria`) REFERENCES `categories` (`id_categoria`),
  ADD CONSTRAINT `rates_fk` FOREIGN KEY (`id_rate`) REFERENCES `rates` (`id_rate`);

--
-- Filtros para la tabla `sales_d`
--
ALTER TABLE `sales_d`
  ADD CONSTRAINT `products_fk` FOREIGN KEY (`id_producto`) REFERENCES `products` (`id_producto`),
  ADD CONSTRAINT `sales_h_fk` FOREIGN KEY (`factura`) REFERENCES `sales_h` (`factura`);

--
-- Filtros para la tabla `sales_h`
--
ALTER TABLE `sales_h`
  ADD CONSTRAINT `company_fk` FOREIGN KEY (`NIT`) REFERENCES `company` (`NIT`),
  ADD CONSTRAINT `customers_fk` FOREIGN KEY (`codigo_cliente`) REFERENCES `customers` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
