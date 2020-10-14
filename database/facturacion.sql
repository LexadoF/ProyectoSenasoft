-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2020 a las 22:07:38
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL COMMENT 'nombre de la categoria ',
  `NitEmpresa` int(11) NOT NULL COMMENT 'nit de la empresa a la que pertenece la categoria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosproductofactura`
--

CREATE TABLE `datosproductofactura` (
  `id` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL COMMENT 'Identificador del producto el cual se agregara',
  `idFactura` int(11) NOT NULL COMMENT 'Identificador de la factura a la cual pertenece este detalle',
  `PrecioUPr` double NOT NULL DEFAULT 0 COMMENT 'Valor unitario del producto que se utilizara para obtener luego el valor total '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `Nit` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `DocCliente` varchar(30) NOT NULL COMMENT 'Documento del cliente a quien se le realiza la factura',
  `NombreCliente` varchar(50) NOT NULL COMMENT 'Nombre del cliente a quien se le realiza la factura',
  `DocPersonaEncargada` varchar(30) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp() COMMENT 'fecha de la factura, por defecto es la fecha actual',
  `estado` tinyint(1) NOT NULL COMMENT 'estado de la factura, la cual es en espera en caso de no contarse con stock'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Documento` varchar(30) NOT NULL COMMENT 'Documento de la persona',
  `Nombre` varchar(100) NOT NULL COMMENT 'Nombre completo de la persona',
  `Direccion` varchar(100) NOT NULL COMMENT 'Direccion de la persona',
  `Telefono` varchar(25) NOT NULL,
  `Correo` varchar(50) NOT NULL COMMENT 'Correo de la persona, no se pueden registrar 2 personas con el mismo correo',
  `Contrasena` varchar(100) NOT NULL COMMENT 'clave de la cuenta de esta persona',
  `NitEmpresa` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL COMMENT 'estado de la persona en el sistema, puede ser activo o inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `Nombre` int(11) NOT NULL,
  `Precio` double NOT NULL DEFAULT 0 COMMENT 'precio del producto por unidad, admite decimales en caso de ser necesario',
  `IdCategoria` int(11) NOT NULL COMMENT 'categoria a la que pertenece el producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `NitEmpresa` (`NitEmpresa`);

--
-- Indices de la tabla `datosproductofactura`
--
ALTER TABLE `datosproductofactura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idFactura` (`idFactura`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`Nit`),
  ADD UNIQUE KEY `Direccion` (`Direccion`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DocPersonaEncargada` (`DocPersonaEncargada`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Documento`),
  ADD UNIQUE KEY `Correo` (`Correo`),
  ADD KEY `NitEmpresa` (`NitEmpresa`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IdCategoria` (`IdCategoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datosproductofactura`
--
ALTER TABLE `datosproductofactura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`NitEmpresa`) REFERENCES `empresa` (`Nit`);

--
-- Filtros para la tabla `datosproductofactura`
--
ALTER TABLE `datosproductofactura`
  ADD CONSTRAINT `datosproductofactura_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `datosproductofactura_ibfk_2` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`DocPersonaEncargada`) REFERENCES `persona` (`Documento`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`NitEmpresa`) REFERENCES `empresa` (`Nit`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
