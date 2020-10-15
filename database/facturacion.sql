-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2020 a las 17:41:06
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
  `Id` int(11) NOT NULL COMMENT 'Identificador de la tabla Categoria',
  `Nombre` varchar(100) NOT NULL COMMENT 'nombre de la categoria ',
  `NitEmpresa` int(11) NOT NULL COMMENT 'nit de la empresa a la que pertenece la categoria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`Id`, `Nombre`, `NitEmpresa`) VALUES
(1, 'cat1', 2324342);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `DocCliente` varchar(30) NOT NULL COMMENT 'Documento del cliente, se usara para identificar a los clientes relacionados con respectivas operaciones',
  `NombreCliente` varchar(100) NOT NULL COMMENT 'Nombre del cliente',
  `TelefonoCliente` varchar(100) NOT NULL COMMENT 'Telefono del cliente',
  `DireccionCliente` varchar(50) NOT NULL COMMENT 'Direccion del cliente, se utilizara en caso de que se necesite',
  `Estado` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado del cliente, puede estar habilitado o deshabilitado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`DocCliente`, `NombreCliente`, `TelefonoCliente`, `DireccionCliente`, `Estado`) VALUES
('1234678', 'ddddd', '34444', 'sfdsg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosproductofactura`
--

CREATE TABLE `datosproductofactura` (
  `id` int(11) NOT NULL COMMENT 'Identificador unico del detalle de productos y factura',
  `idProducto` int(11) NOT NULL DEFAULT 0 COMMENT 'Identificador del producto el cual se agregara',
  `idFactura` int(11) NOT NULL DEFAULT 0 COMMENT 'Identificador de la factura a la cual pertenece este detalle',
  `CantidadProd` int(11) NOT NULL DEFAULT 1 COMMENT 'Cantidad seleccionada de este producto para esta factura',
  `PrecioUPr` double NOT NULL DEFAULT 0 COMMENT 'Valor unitario del producto que se utilizara para obtener luego el valor total ',
  `SubTot` double NOT NULL DEFAULT 0 COMMENT 'Valor subtotal calculado de la cantidad de productos por el precio unitario de los mismos',
  `Total` double NOT NULL DEFAULT 0 COMMENT 'Valor total de la factura, calculado mediante los datos consultados de datosfacturaproducto sumando todos los valores unitarios'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `datosproductofactura`
--

INSERT INTO `datosproductofactura` (`id`, `idProducto`, `idFactura`, `CantidadProd`, `PrecioUPr`, `SubTot`, `Total`) VALUES
(1, 1, 1, 1, 5000, 5000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `Nit` int(11) NOT NULL COMMENT 'Nit de la empresa que actuara como identificador',
  `Nombre` varchar(100) NOT NULL COMMENT 'Nombre de la empresa',
  `Direccion` varchar(100) NOT NULL COMMENT 'Direccion de la empresa, es unica debido a que no se encontrara mas de una empresa por direccion',
  `Telefono` varchar(25) NOT NULL COMMENT 'Telefono principal de contacto con la empresa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`Nit`, `Nombre`, `Direccion`, `Telefono`) VALUES
(2324342, 'aaaaaaa', 'aaaaaaa', '33333333');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL COMMENT 'Identificador unico de la factura',
  `DocCliente` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'Documento del cliente a quien se le realiza la factura',
  `DocPersonaEncargada` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'Documento del empleado o encargado que genera esta factura',
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'fecha de la factura, por defecto es la fecha actual',
  `estado` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'estado de la factura, la cual es en espera en caso de no contarse con stock'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `DocCliente`, `DocPersonaEncargada`, `fecha`, `estado`) VALUES
(1, '1234678', '567895', '0000-00-00 00:00:00', 1),
(2, '1234678', '567895', '2020-10-15 15:39:22', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Documento` varchar(30) NOT NULL COMMENT 'Documento de la persona',
  `Nombre` varchar(100) NOT NULL COMMENT 'Nombre completo de la persona',
  `Direccion` varchar(100) NOT NULL COMMENT 'Direccion de la persona',
  `Telefono` varchar(25) NOT NULL COMMENT 'Telefono del trabajador o encargado',
  `Correo` varchar(50) NOT NULL COMMENT 'Correo de la persona, no se pueden registrar 2 personas con el mismo correo',
  `Contrasena` varchar(100) NOT NULL COMMENT 'clave de la cuenta de esta persona',
  `NitEmpresa` int(11) NOT NULL COMMENT 'Nit de la empresa a la que pertenece el empleado o encargado',
  `estado` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'estado de la persona en el sistema, puede ser activo o inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Documento`, `Nombre`, `Direccion`, `Telefono`, `Correo`, `Contrasena`, `NitEmpresa`, `estado`) VALUES
('567895', 'jose', 'dir 1', '1234567', 'alguien@example.com', '123', 2324342, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL COMMENT 'Identificador individual de cada producto',
  `Nombre` varchar(50) NOT NULL COMMENT 'Refiere al nombre del producto',
  `stock` int(11) NOT NULL COMMENT 'Indica cuantos productos se encuentran en stock actualmente',
  `Precio` double NOT NULL COMMENT 'precio del producto por unidad, admite decimales en caso de ser necesario',
  `IdCategoria` int(11) NOT NULL COMMENT 'categoria a la que pertenece el producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `Nombre`, `stock`, `Precio`, `IdCategoria`) VALUES
(1, 'prod 1', 50, 1000, 1);

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
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`DocCliente`);

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
  ADD KEY `DocPersonaEncargada` (`DocPersonaEncargada`),
  ADD KEY `DocCliente` (`DocCliente`);

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla Categoria', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `datosproductofactura`
--
ALTER TABLE `datosproductofactura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico del detalle de productos y factura', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de la factura', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador individual de cada producto', AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`DocPersonaEncargada`) REFERENCES `persona` (`Documento`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`DocCliente`) REFERENCES `cliente` (`DocCliente`);

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
