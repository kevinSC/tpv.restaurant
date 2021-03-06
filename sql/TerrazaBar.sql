-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-07-2019 a las 21:32:37
-- Versión del servidor: 5.6.37
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `TerrazaBar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cat_ingredientes`
--

CREATE TABLE IF NOT EXISTS `tb_cat_ingredientes` (
  `id` int(11) NOT NULL,
  `Categoria` varchar(255) NOT NULL,
  `Abreviacion` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_cat_ingredientes`
--

INSERT INTO `tb_cat_ingredientes` (`id`, `Categoria`, `Abreviacion`, `Descripcion`, `Estatus`) VALUES
(1, 'Carnes', NULL, 'Productos cárnicos, cortes, y piezas sin procesar', 1),
(2, 'Vegetales', NULL, 'Vegetales frescos', 1),
(3, 'Bebidas', NULL, 'Bebidas', 1),
(4, 'Panes', NULL, 'Panes', 1),
(5, 'Insumos', NULL, 'Insumos', 1),
(6, 'Complementos', NULL, 'Complementos', 1),
(7, 'Pastas', NULL, 'Pastas', 1),
(8, 'Frutas', NULL, 'Fruta fresca', 1),
(9, 'Carnes Frías', NULL, 'Carnes frías, embutidos y procesados', 1),
(10, 'Aderezos', NULL, 'Aderezos y preparados envasados', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cat_menus`
--

CREATE TABLE IF NOT EXISTS `tb_cat_menus` (
  `id` int(11) NOT NULL,
  `Categoria` varchar(255) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_cat_menus`
--

INSERT INTO `tb_cat_menus` (`id`, `Categoria`, `Descripcion`, `Estatus`) VALUES
(1, 'Menú de Desayunos', '', 1),
(2, 'Menú de Comidas', '', 1),
(3, 'Menú de Cenas', '', 1),
(4, 'Barra de Bebidas', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cat_productos`
--

CREATE TABLE IF NOT EXISTS `tb_cat_productos` (
  `id` int(11) NOT NULL,
  `Categoria` varchar(255) NOT NULL,
  `Abreviacion` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_cat_productos`
--

INSERT INTO `tb_cat_productos` (`id`, `Categoria`, `Abreviacion`, `Descripcion`, `Estatus`) VALUES
(1, 'Bebidas ', NULL, 'Bebidas sin gas ni alcohol', 1),
(2, 'Comida Rápida', NULL, 'Comida Rápida', 1),
(3, 'Cortes', NULL, 'Cortes de carne', 1),
(4, 'Botanas', NULL, 'Botanas', 1),
(5, 'Bebidas alcohólicas', NULL, 'Bebidas alcohólicas', 1),
(6, 'Refrescos', NULL, 'Bebidas con gas o agua mineral', 1),
(7, 'A la carta', NULL, 'Comida a la carta', 1),
(8, 'Gourmet', NULL, 'Comida gourmet', 1),
(9, 'Entradas', NULL, '', 1),
(10, 'Sopas', NULL, '', 1),
(11, 'Guisados', NULL, '', 1),
(12, 'Ensaladas', NULL, '', 1),
(13, 'Postres', NULL, '', 1),
(14, 'Antojitos', NULL, 'Antojitos Mexicanos', 1),
(15, 'Extras', NULL, 'Extras', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_comandas`
--

CREATE TABLE IF NOT EXISTS `tb_comandas` (
  `id` int(11) NOT NULL,
  `Comanda` varchar(255) NOT NULL,
  `IdMesa` int(11) DEFAULT '0',
  `IdCliente` int(11) DEFAULT '0',
  `IdAtiende` int(11) DEFAULT '0',
  `RecibidoCocina` tinyint(1) DEFAULT '0',
  `TerminadoCocina` tinyint(1) DEFAULT '0',
  `OrdenCerrada` tinyint(1) DEFAULT '0',
  `IdTicket` int(11) DEFAULT '0',
  `ConServicio` tinyint(1) DEFAULT '0',
  `TasaServicio` decimal(10,2) DEFAULT '0.00',
  `ConIva` tinyint(1) DEFAULT '0',
  `TasaIva` decimal(10,2) DEFAULT '0.00',
  `Subtotal` decimal(10,2) DEFAULT '0.00',
  `SubtotalReal` decimal(10,2) DEFAULT '0.00',
  `DescuentoStr` varchar(25) DEFAULT NULL,
  `Descuento` decimal(10,2) DEFAULT '0.00',
  `IVA` decimal(10,2) DEFAULT '0.00',
  `Total` decimal(10,2) DEFAULT '0.00',
  `Pagado` decimal(10,2) DEFAULT '0.00',
  `OrdenPagada` tinyint(1) DEFAULT '0',
  `Estatus` tinyint(4) DEFAULT '1',
  `IdUsuarioCrea` int(11) NOT NULL DEFAULT '0',
  `FechaCrea` datetime NOT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_comandas_productos`
--

CREATE TABLE IF NOT EXISTS `tb_comandas_productos` (
  `id` int(11) NOT NULL,
  `IdComanda` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `Producto` varchar(255) NOT NULL,
  `Precio` decimal(10,2) DEFAULT '0.00',
  `Cantidad` decimal(10,2) DEFAULT '0.00',
  `DescuentoStr` varchar(25) DEFAULT NULL,
  `Descuento` decimal(10,2) DEFAULT '0.00',
  `Total` decimal(10,2) DEFAULT '0.00',
  `Comentarios` varchar(500) DEFAULT NULL,
  `EnPreparacion` tinyint(1) DEFAULT '0',
  `Terminado` tinyint(1) DEFAULT '0',
  `Entregado` tinyint(1) DEFAULT '0',
  `Estatus` tinyint(1) DEFAULT '1',
  `IdUsuarioCrea` int(11) NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_compras`
--

CREATE TABLE IF NOT EXISTS `tb_compras` (
  `id` int(11) NOT NULL,
  `FolioCompra` varchar(255) DEFAULT NULL,
  `IdProveedor` int(11) DEFAULT NULL,
  `FechaCompra` date DEFAULT NULL,
  `FechaEntrega` date DEFAULT NULL,
  `OrdenCerrada` bigint(20) DEFAULT '0',
  `SaldoTotal` float DEFAULT NULL,
  `SaldoPagado` float DEFAULT NULL,
  `SaldoPendiente` float DEFAULT NULL,
  `Comentarios` varchar(255) DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `IdUsuarioCrea` int(11) DEFAULT NULL,
  `FechaCrea` datetime DEFAULT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_compras`
--

INSERT INTO `tb_compras` (`id`, `FolioCompra`, `IdProveedor`, `FechaCompra`, `FechaEntrega`, `OrdenCerrada`, `SaldoTotal`, `SaldoPagado`, `SaldoPendiente`, `Comentarios`, `Estatus`, `IdUsuarioCrea`, `FechaCrea`, `IdUsuarioModifica`, `FechaModifica`) VALUES
(1, '0001', 1, '2019-03-18', '0000-00-00', 1, 956, 900, 176, '', b'1111111111111111111111111111111', 1, '2019-03-19 02:13:55', 1, '2019-03-19 02:41:00'),
(2, '0056', 3, '2019-03-19', '0000-00-00', 1, 100, 100, 0, '', b'1111111111111111111111111111111', 1, '2019-03-20 03:18:38', 1, '2019-03-20 03:18:43'),
(3, '0056', 2, '2019-03-19', '2019-03-19', 1, 75, 75, 0, '', b'1111111111111111111111111111111', 1, '2019-03-20 03:19:52', NULL, NULL),
(4, '334', 2, '2019-03-22', '0000-00-00', 0, 660, 300, 360, '', b'1111111111111111111111111111111', 1, '2019-03-23 03:27:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_compras_detalle`
--

CREATE TABLE IF NOT EXISTS `tb_compras_detalle` (
  `id` int(11) NOT NULL,
  `IdCompra` int(11) NOT NULL,
  `IdItem` int(11) DEFAULT NULL,
  `IdUnidad` int(11) DEFAULT NULL,
  `IdUnidadOriginal` int(11) DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Cantidad` float DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `Estatus` bit(1) DEFAULT b'1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_compras_detalle`
--

INSERT INTO `tb_compras_detalle` (`id`, `IdCompra`, `IdItem`, `IdUnidad`, `IdUnidadOriginal`, `Precio`, `Cantidad`, `Total`, `Estatus`) VALUES
(1, 1, 1, 2, 2, 56, 16, 896, b'1111111111111111111111111111111'),
(2, 1, 3, 10, 10, 1, 60, 60, b'1111111111111111111111111111111'),
(3, 2, 2, 1, 1, 2.5, 40, 100, b'1111111111111111111111111111111'),
(4, 3, 5, 2, 2, 0.015, 5000, 75, b'1111111111111111111111111111111'),
(5, 4, 8, 5, 5, 33, 20, 660, b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_ctlg_tipos_medida`
--

CREATE TABLE IF NOT EXISTS `tb_ctlg_tipos_medida` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_ctlg_tipos_medida`
--

INSERT INTO `tb_ctlg_tipos_medida` (`id`, `Nombre`, `Descripcion`, `Estatus`) VALUES
(1, 'Cantidad', 'piezas', 1),
(2, 'Peso', 'para solidos', 1),
(3, 'Volumen', 'para líquidos', 1),
(4, 'Volumen', 'para polvos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_empleados`
--

CREATE TABLE IF NOT EXISTS `tb_empleados` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Paterno` varchar(255) DEFAULT NULL,
  `Materno` varchar(255) DEFAULT NULL,
  `IdPuesto` int(11) DEFAULT NULL,
  `Direccion` varchar(500) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Celular` varchar(20) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  `Estatus` tinyint(1) DEFAULT '1',
  `IdUsuarioCrea` int(11) DEFAULT NULL,
  `FechaCrea` datetime DEFAULT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_empleados`
--

INSERT INTO `tb_empleados` (`id`, `Nombre`, `Paterno`, `Materno`, `IdPuesto`, `Direccion`, `Telefono`, `Celular`, `Correo`, `FechaInicio`, `FechaFin`, `Activo`, `Estatus`, `IdUsuarioCrea`, `FechaCrea`, `IdUsuarioModifica`, `FechaModifica`) VALUES
(1, 'Jorge Alejandro', 'Valdez', 'Vanegas', NULL, 'Claveles 50, Frac. Rancho Carbajal', '7222348740', '', 'qwertyk@msn.com', '2019-03-01', '0000-00-00', 1, 1, 10, '2019-03-18 04:25:27', 10, '2019-03-18 04:40:22'),
(2, 'Erick', 'Valdez', '', NULL, '', '1111', '', '', '0000-00-00', '0000-00-00', 1, 1, 1, '2019-04-23 00:27:53', 1, '2019-04-23 00:28:11'),
(3, 'Roberto', 'Vanegas', '', NULL, '', '1111', '', '', '0000-00-00', '0000-00-00', 1, 1, 1, '2019-04-23 00:28:05', 1, '2019-04-23 00:28:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_ingredientes`
--

CREATE TABLE IF NOT EXISTS `tb_ingredientes` (
  `id` int(11) NOT NULL,
  `Ingrediente` varchar(255) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `IdCategoria` int(11) NOT NULL,
  `IdUnidad` int(11) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1',
  `IdUsuarioCrea` int(11) DEFAULT NULL,
  `FechaCrea` datetime DEFAULT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_ingredientes`
--

INSERT INTO `tb_ingredientes` (`id`, `Ingrediente`, `Descripcion`, `IdCategoria`, `IdUnidad`, `Estatus`, `IdUsuarioCrea`, `FechaCrea`, `IdUsuarioModifica`, `FechaModifica`) VALUES
(1, 'Carne para hamburguesa', 'Carne para hamburguesa', 1, 2, 1, 10, '2019-03-09 06:22:30', NULL, NULL),
(2, 'Pan para hamburguesa', 'Pan para hamburguesa', 4, 1, 1, 10, '2019-03-09 06:31:44', NULL, NULL),
(3, 'Queso Amarillo', 'Rebanadas de queso amarillo', 5, 10, 1, 10, '2019-03-09 06:32:11', 10, '2019-03-09 06:34:02'),
(4, 'Papas a la francesa', 'Papas a la francesa congeladas', 2, 2, 1, 10, '2019-03-16 02:10:29', NULL, NULL),
(5, 'Papas en gajos', 'Papas en gajos congelados', 2, 2, 1, 10, '2019-03-16 02:10:48', NULL, NULL),
(6, 'Cerveza', 'Botella de Cerveza', 3, 1, 1, 10, '2019-03-16 02:24:22', 10, '2019-03-16 02:24:58'),
(7, 'Pasta para sopa', 'Pasta para sopa', 7, 2, 1, 1, '2019-03-18 19:37:12', NULL, NULL),
(8, 'Cerveza de barril', 'Cerveza de barril', 3, 5, 1, 1, '2019-03-23 03:26:43', NULL, NULL),
(9, 'Agua Mineral', 'Botella de agua mineral', 3, 3, 1, 1, '2019-04-13 16:43:38', NULL, NULL),
(10, 'Naranja', 'Naranja', 8, 1, 1, 1, '2019-04-13 17:04:24', NULL, NULL),
(11, 'Coca Cola', 'Refresco ', 3, 3, 1, 1, '2019-04-13 17:05:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_menus`
--

CREATE TABLE IF NOT EXISTS `tb_menus` (
  `id` int(11) NOT NULL,
  `Menu` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `IdCategoria` int(11) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1',
  `IdUsuarioCrea` int(11) DEFAULT NULL,
  `FechaCrea` datetime DEFAULT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_menus`
--

INSERT INTO `tb_menus` (`id`, `Menu`, `Descripcion`, `IdCategoria`, `Estatus`, `IdUsuarioCrea`, `FechaCrea`, `IdUsuarioModifica`, `FechaModifica`) VALUES
(1, 'Desayunos', 'Menú de desayunos', 1, 1, 10, '2019-03-16 04:25:53', 10, '2019-03-16 04:26:53'),
(2, 'Comidas', 'Menú a partir de las 12 hrs', 2, 1, 10, '2019-03-16 04:26:16', NULL, NULL),
(3, 'Cena', 'Menú que se sirve a partir de las 6pm', 3, 1, 10, '2019-03-16 04:26:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_menus_productos`
--

CREATE TABLE IF NOT EXISTS `tb_menus_productos` (
  `id` int(11) NOT NULL,
  `IdMenu` varchar(255) NOT NULL,
  `IdProducto` varchar(255) NOT NULL,
  `Costo` float DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1',
  `IdUsuarioCrea` int(11) DEFAULT NULL,
  `FechaCrea` datetime DEFAULT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_menus_productos`
--

INSERT INTO `tb_menus_productos` (`id`, `IdMenu`, `IdProducto`, `Costo`, `Precio`, `Estatus`, `IdUsuarioCrea`, `FechaCrea`, `IdUsuarioModifica`, `FechaModifica`) VALUES
(1, '3', '1', 14.5, 29, 1, 1, '2019-04-16 05:46:08', 1, '2019-04-23 01:27:22'),
(2, '3', '2', 18.5, 40, 1, 1, '2019-04-16 05:46:08', 1, '2019-04-23 01:27:22'),
(3, '3', '3', 10, 25, 1, 1, '2019-04-16 05:46:08', 1, '2019-04-23 01:27:22'),
(4, '3', '4', 10, 25, 1, 1, '2019-04-16 05:46:08', 1, '2019-04-23 01:27:22'),
(5, '3', '5', 10, 20, 1, 1, '2019-04-16 05:46:08', 1, '2019-04-23 01:27:22'),
(6, '3', '6', 3, 10, 1, 1, '2019-04-16 05:46:08', 1, '2019-04-23 01:27:22'),
(7, '3', '7', 30, 45, 1, 1, '2019-04-16 05:46:08', 1, '2019-04-23 01:27:22'),
(8, '3', '8', 10, 25, 1, 1, '2019-04-16 05:46:08', 1, '2019-04-23 01:27:22'),
(9, '3', '9', 10, 20, 1, 1, '2019-04-16 05:46:08', 1, '2019-04-23 01:27:22'),
(10, '3', '10', 15, 25, 1, 1, '2019-04-16 05:46:08', 1, '2019-04-23 01:27:22'),
(11, '3', '11', 10, 25, 1, 1, '2019-04-16 05:46:08', 1, '2019-04-23 01:27:22'),
(12, '3', '12', 15, 30, 1, 1, '2019-04-16 05:46:09', 1, '2019-04-23 01:27:22'),
(13, '3', '13', 10, 20, 1, 1, '2019-04-16 05:46:09', 1, '2019-04-23 01:27:23'),
(14, '3', '14', 10, 15, 1, 1, '2019-04-16 05:46:09', 1, '2019-04-23 01:27:23'),
(15, '3', '15', 10, 15, 1, 1, '2019-04-16 05:46:09', 1, '2019-04-23 01:27:23'),
(16, '3', '16', 9, 15, 1, 1, '2019-04-16 05:46:09', 1, '2019-04-23 01:27:23'),
(17, '3', '17', 12, 20, 1, 1, '2019-04-16 05:46:09', 1, '2019-04-23 01:27:23'),
(18, '3', '18', 10, 20, 1, 1, '2019-04-16 05:46:09', 1, '2019-04-23 01:27:23'),
(19, '1', '6', 3, 10, 1, 1, '2019-04-23 00:54:40', NULL, NULL),
(20, '1', '9', 10, 20, 1, 1, '2019-04-23 00:54:40', NULL, NULL),
(21, '1', '10', 15, 25, 1, 1, '2019-04-23 00:54:40', NULL, NULL),
(22, '1', '5', 10, 25, 1, 1, '2019-04-23 00:54:40', NULL, NULL),
(23, '1', '17', 12, 20, 1, 1, '2019-04-23 00:54:40', NULL, NULL),
(24, '1', '18', 10, 20, 1, 1, '2019-04-23 00:54:40', NULL, NULL),
(25, '3', '19', 0.5, 1, 1, 1, '2019-04-23 01:27:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_mesas`
--

CREATE TABLE IF NOT EXISTS `tb_mesas` (
  `id` int(11) NOT NULL,
  `Mesa` varchar(255) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Estatus` tinyint(1) NOT NULL DEFAULT '1',
  `IdUsuarioCrea` int(11) DEFAULT NULL,
  `FechaCrea` datetime DEFAULT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_mesas`
--

INSERT INTO `tb_mesas` (`id`, `Mesa`, `Descripcion`, `Numero`, `Cantidad`, `Estatus`, `IdUsuarioCrea`, `FechaCrea`, `IdUsuarioModifica`, `FechaModifica`) VALUES
(1, 'Mesa', 'Mesa a la entrada', 1, 4, 1, 1, '2019-03-18 18:04:26', NULL, NULL),
(2, 'Mesa', 'Mesa en salon', 2, 4, 1, 1, '2019-03-18 18:06:40', NULL, NULL),
(3, 'Mesa', 'Mesa en salon', 3, 4, 1, 1, '2019-03-18 18:06:50', NULL, NULL),
(4, 'Mesa', 'Mesa en salon', 4, 4, 1, 1, '2019-03-18 18:46:44', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_preparaciones`
--

CREATE TABLE IF NOT EXISTS `tb_preparaciones` (
  `id` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `Instrucciones` varchar(255) DEFAULT NULL,
  `Estatus` varchar(255) NOT NULL DEFAULT '1',
  `IdUsuarioCrea` int(11) DEFAULT NULL,
  `FechaCrea` datetime DEFAULT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_preparaciones`
--

INSERT INTO `tb_preparaciones` (`id`, `IdProducto`, `Instrucciones`, `Estatus`, `IdUsuarioCrea`, `FechaCrea`, `IdUsuarioModifica`, `FechaModifica`) VALUES
(1, 1, 'Freír la carne.\r\nAgregar al pan.\r\nServir', '1', 10, '2019-03-16 01:21:58', NULL, NULL),
(2, 2, 'Freír la carne.\r\nAgregar al pan.\r\n\r\nFreír las papas\r\n\r\nServir', '1', 10, '2019-03-16 01:40:48', 10, '2019-03-16 02:12:34'),
(4, 4, '', '1', 10, '2019-03-16 02:23:58', 10, '2019-03-16 02:25:12'),
(6, 3, '', '1', 10, '2019-03-16 02:26:03', 10, '2019-03-16 02:27:41'),
(7, 7, NULL, '1', 1, '2019-03-23 03:21:31', NULL, NULL),
(8, 18, NULL, '1', 1, '2019-04-16 04:31:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_preparaciones_ingredientes`
--

CREATE TABLE IF NOT EXISTS `tb_preparaciones_ingredientes` (
  `id` int(11) NOT NULL,
  `IdPreparacion` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `IdPreparacionPaso` int(11) DEFAULT NULL,
  `IdIngrediente` int(11) NOT NULL,
  `IdUnidad` int(11) NOT NULL,
  `Cantidad` float DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1',
  `IdUsuarioCrea` int(11) DEFAULT NULL,
  `FechaCrea` datetime DEFAULT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_preparaciones_ingredientes`
--

INSERT INTO `tb_preparaciones_ingredientes` (`id`, `IdPreparacion`, `IdProducto`, `IdPreparacionPaso`, `IdIngrediente`, `IdUnidad`, `Cantidad`, `Descripcion`, `Estatus`, `IdUsuarioCrea`, `FechaCrea`, `IdUsuarioModifica`, `FechaModifica`) VALUES
(1, 1, 1, NULL, 1, 2, 125, NULL, 1, 10, '2019-03-16 01:25:52', NULL, NULL),
(2, 1, 1, NULL, 2, 1, 1, NULL, 1, 10, '2019-03-16 01:25:52', NULL, NULL),
(3, 2, 2, NULL, 1, 2, 125, NULL, 1, 10, '2019-03-16 02:12:34', NULL, NULL),
(4, 2, 2, NULL, 2, 1, 1, NULL, 1, 10, '2019-03-16 02:12:34', NULL, NULL),
(5, 2, 2, NULL, 4, 2, 200, NULL, 1, 10, '2019-03-16 02:12:34', NULL, NULL),
(6, 4, 4, NULL, 6, 1, 1, NULL, 1, 10, '2019-03-16 02:25:13', NULL, NULL),
(8, 6, 3, NULL, 6, 1, 1, NULL, 1, 10, '2019-03-16 02:27:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_preparaciones_pasos`
--

CREATE TABLE IF NOT EXISTS `tb_preparaciones_pasos` (
  `id` int(11) NOT NULL,
  `IdPreparacion` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Orden` int(11) NOT NULL DEFAULT '99',
  `Estatus` tinyint(1) DEFAULT '1',
  `IdUsuarioCrea` int(11) DEFAULT NULL,
  `FechaCrea` datetime DEFAULT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_productos`
--

CREATE TABLE IF NOT EXISTS `tb_productos` (
  `id` int(11) NOT NULL,
  `Producto` varchar(255) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `IdCategoria` varchar(255) NOT NULL,
  `IdTipoProducto` varchar(255) NOT NULL,
  `CostoBase` float DEFAULT NULL,
  `PrecioBase` float DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1',
  `IdUsuarioCrea` int(11) DEFAULT NULL,
  `FechaCrea` datetime DEFAULT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_productos`
--

INSERT INTO `tb_productos` (`id`, `Producto`, `Descripcion`, `IdCategoria`, `IdTipoProducto`, `CostoBase`, `PrecioBase`, `Estatus`, `IdUsuarioCrea`, `FechaCrea`, `IdUsuarioModifica`, `FechaModifica`) VALUES
(1, 'Hamburguesa Sencilla', 'Hamburguesa Sencilla', '2', '6', 14.5, 30, 1, 10, '2019-03-09 07:13:17', 1, '2019-04-16 05:17:13'),
(2, 'Hamburguesa con papas', 'Hamburguesa sencilla con papas', '2', '7', 20, 40, 1, 10, '2019-03-09 21:36:35', 1, '2019-04-16 05:48:00'),
(3, 'Cerveza Victoria', 'Cerveza', '1', '4', 10, 25, 1, 10, '2019-03-09 21:47:25', 1, '2019-04-16 05:48:08'),
(4, 'Modelo Clara', 'Cerveza', '1', '4', 10, 25, 1, 10, '2019-03-09 21:48:32', 1, '2019-04-16 05:48:31'),
(5, 'Huevos revueltos', 'Huevos revueltos', '9', '', 10, 20, 1, 1, '2019-03-18 18:50:43', 1, '2019-04-16 05:48:41'),
(6, 'Sopa', 'Sopa aguada de pasta', '10', '', 3, 10, 1, 1, '2019-03-18 19:36:09', 1, '2019-04-16 05:48:50'),
(7, 'Alitas', 'sdfghjkl', '9', '8', 30, 45, 1, 1, '2019-03-23 03:21:17', 1, '2019-04-16 05:48:58'),
(8, 'Dedos de queso', 'Dedos de queso', '4', '', 10, 25, 1, 1, '2019-04-13 16:33:48', 1, '2019-04-16 05:49:07'),
(9, 'Sopes de papa', 'Sopes de papa', '14', '', 10, 20, 1, 1, '2019-04-13 16:36:05', 1, '2019-04-16 05:49:22'),
(10, 'Sopes de pollo', 'Sopes de pollo', '14', '', 15, 25, 1, 1, '2019-04-13 16:36:26', 1, '2019-04-16 05:49:31'),
(11, 'Tacos de Pollo', 'Tacos de Pollo', '14', '', 10, 25, 1, 1, '2019-04-13 16:36:39', 1, '2019-04-16 05:49:43'),
(12, 'Torta Cochinita', 'Torta Cochinita', '14', '', 15, 30, 1, 1, '2019-04-13 16:37:11', 1, '2019-04-16 05:49:51'),
(13, 'Salchipulpos', 'Salchipulpos', '4', '', 10, 20, 1, 1, '2019-04-13 16:37:31', 1, '2019-04-16 05:50:07'),
(14, 'Boing Sabores', 'Boing Sabores', '1', '9', 10, 15, 1, 1, '2019-04-13 16:39:46', 1, '2019-04-16 05:53:06'),
(15, 'Coca Cola', 'Coca Cola', '1', '3', 10, 15, 1, 1, '2019-04-13 16:40:25', 1, '2019-04-16 05:53:29'),
(16, 'Manzanita', 'Refresco de manzana', '1', '3', 9, 15, 1, 1, '2019-04-13 16:40:49', 1, '2019-04-16 05:50:29'),
(17, 'Naranjada mineral', 'Naranjada mineral', '1', '3', 12, 20, 1, 1, '2019-04-13 16:41:13', 1, '2019-04-16 05:50:42'),
(18, 'Naranjada natural', 'Naranjada natural', '1', '10', 10, 20, 1, 1, '2019-04-13 16:41:37', 1, '2019-04-16 05:50:50'),
(19, 'Banderilla', 'Banderilla', '15', '', 0.5, 1, 1, 1, '2019-04-23 01:27:11', 1, '2019-04-23 01:32:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_proveedores`
--

CREATE TABLE IF NOT EXISTS `tb_proveedores` (
  `id` int(11) NOT NULL,
  `Proveedor` varchar(255) NOT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `Contacto` varchar(255) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `RazonSocial` varchar(500) DEFAULT NULL,
  `Direccion` varchar(500) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Celular` varchar(20) DEFAULT NULL,
  `RFC` varchar(15) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1',
  `IdUsuarioCrea` int(11) DEFAULT NULL,
  `FechaCrea` datetime DEFAULT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_proveedores`
--

INSERT INTO `tb_proveedores` (`id`, `Proveedor`, `Descripcion`, `Contacto`, `Correo`, `RazonSocial`, `Direccion`, `Telefono`, `Celular`, `RFC`, `Estatus`, `IdUsuarioCrea`, `FechaCrea`, `IdUsuarioModifica`, `FechaModifica`) VALUES
(1, 'Proveedor de Carnes', 'Proveedor de Carnes', 'Manuel Jaimes', 'correo@proveedor.com', 'Proveedor de Carnes SA de CV', 'Dirección del proveedor de carnes', '55 7894 5610', '', 'RFCM786512986', 1, 10, '2019-03-18 00:34:54', NULL, NULL),
(2, 'Fames Ac PC', 'Discount Furniture Showcase', 'Abel King', 'penatibus.et@arcu.co.uk', 'Ac Mattis Velit Consulting', 'Apartado núm.: 869, 6291 Curabitur Calle', '(396) 589-1030', '', 'AFWS010128B5R', 1, 1, '2019-03-20 03:15:12', NULL, NULL),
(3, 'Lorem Vehicula', 'ut quam vel sapien imperdiet', 'Wade Hall', 'montes@luctussitamet.ca', 'Lorem Vehicula Company', '493-2470 Magna Carretera', '(415) 472-5664', '', 'FITU231146X0F', 1, 1, '2019-03-20 03:16:40', NULL, NULL),
(4, 'Arcu Associates', 'mollis. Duis sit amet diam', 'Jeremy Finley', 'tellus.non.magna@ut.com', 'Arcu Associates', 'Apartado núm.: 913, 7630 Luctus Avenida', '(517) 790-0477', '', 'UKGT895008B8J', 1, 1, '2019-03-20 03:17:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_roles`
--

CREATE TABLE IF NOT EXISTS `tb_roles` (
  `id` int(11) NOT NULL,
  `Rol` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_roles`
--

INSERT INTO `tb_roles` (`id`, `Rol`, `Descripcion`, `Estatus`) VALUES
(1, 'ADMIN', 'Administrador', 1),
(2, 'RECADMIN', 'Gerente', 1),
(3, 'USER', 'Usuario', 1),
(4, 'CAJA', 'Caja', 1),
(5, 'ORDER', 'Ordenes', 1),
(6, 'MESAS', 'Mesero', 1),
(7, 'STOCK', 'Inventario', 1),
(8, 'COCINA', 'Cocina', 1),
(9, 'BAR', 'Barra', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_productos`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_productos` (
  `id` int(11) NOT NULL,
  `IdCategoriaProducto` int(11) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_tipo_productos`
--

INSERT INTO `tb_tipo_productos` (`id`, `IdCategoriaProducto`, `Tipo`, `Descripcion`, `Estatus`) VALUES
(1, 1, 'Agua', 'Bebida natural', 1),
(2, 1, 'Vinos y licores', 'Vinos y licores', 1),
(3, 1, 'Gaseosas', 'Refrescos y bebidas con agua mineral', 1),
(4, 1, 'Cervezas', 'Cervezas y preparaciones', 1),
(5, 2, 'Snacks', 'Snacks', 1),
(6, 2, 'Platillos', 'platillos', 1),
(7, 2, 'Combos', 'Combos', 1),
(8, 9, 'Botana', '', 1),
(9, 1, 'Bebidas Envasadas', '', 1),
(10, 1, 'Bebidas Preparadas (sin alcohol)', 'Bebidas preparadas que no contienen alcohol', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_unidades`
--

CREATE TABLE IF NOT EXISTS `tb_unidades` (
  `id` int(11) NOT NULL,
  `Unidad` varchar(255) NOT NULL,
  `Abreviacion` varchar(20) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `IdTipoMedida` int(11) DEFAULT NULL,
  `Estatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_unidades`
--

INSERT INTO `tb_unidades` (`id`, `Unidad`, `Abreviacion`, `Descripcion`, `IdTipoMedida`, `Estatus`) VALUES
(1, 'Pieza', 'pz', 'Piezas', 1, 1),
(2, 'Gramos', 'gr', 'Peso en gramos', 2, 1),
(3, 'mililitros', 'ml', 'Cantidad de líquido en mililitros', 3, 1),
(4, 'Kilos', 'Kg', 'Kilogramos', 2, 1),
(5, 'Litros', 'Lt', 'Litros de líquido', 3, 1),
(6, 'Taza', 'tz', 'Taza de líquido', 3, 1),
(7, 'Cucharada sopera', 'TBL', 'Cucharada sopera (tablespoon) ', 4, 1),
(8, 'Cucharada cafetera', 'TSP', 'Cucharada cafetera (teapsoon)', 4, 1),
(9, 'Paquetes', 'Pq', 'Paquetes que pueden contener varias piezas', 1, 1),
(10, 'Rebanada', 'reb', 'Rebanada de ingrediente', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuarios`
--

CREATE TABLE IF NOT EXISTS `tb_usuarios` (
  `id` int(11) NOT NULL,
  `Usuario` varchar(255) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellidos` varchar(255) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Activo` tinyint(1) NOT NULL DEFAULT '0',
  `IdRol` int(11) DEFAULT '0',
  `EsEmpleado` bit(1) DEFAULT b'0',
  `IdEmpleado` int(11) DEFAULT '0',
  `Pin` varchar(6) DEFAULT NULL,
  `UltimoIngreso` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `IdUsuarioCrea` int(11) NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `IdUsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`id`, `Usuario`, `Contrasena`, `Nombre`, `Apellidos`, `Correo`, `Telefono`, `Activo`, `IdRol`, `EsEmpleado`, `IdEmpleado`, `Pin`, `UltimoIngreso`, `Estatus`, `IdUsuarioCrea`, `FechaCrea`, `IdUsuarioModifica`, `FechaModifica`) VALUES
(1, 'admin', 'admin', 'Alex', 'Valdez', 'qwertyk@msn.com', '7222348740', 1, 1, b'1111111111111111111111111111111', 1, '123456', NULL, b'1111111111111111111111111111111', 10, '2019-03-18 15:11:25', 1, '2019-04-18 02:49:51'),
(2, 'mesero', 'mesero', 'Mesero', 'LaTerraza', '', '0000', 1, 6, b'1111111111111111111111111111111', 0, NULL, NULL, b'1111111111111111111111111111111', 1, '2019-04-17 22:30:28', NULL, NULL),
(3, 'erick.valdez', 'evaldez', 'Erick', 'Valdez', '', '', 1, 2, b'1111111111111111111111111111111', 2, '0294', NULL, b'1111111111111111111111111111111', 1, '2019-04-23 00:29:05', NULL, NULL),
(4, 'roberto.vanegas', 'rvanegas', 'Roberto', 'Vanegas', '', '', 1, 6, b'1111111111111111111111111111111', 3, '1396', NULL, b'1111111111111111111111111111111', 1, '2019-04-23 00:29:42', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_cat_ingredientes`
--
ALTER TABLE `tb_cat_ingredientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_cat_menus`
--
ALTER TABLE `tb_cat_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_cat_productos`
--
ALTER TABLE `tb_cat_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_comandas`
--
ALTER TABLE `tb_comandas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_comandas_productos`
--
ALTER TABLE `tb_comandas_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_compras`
--
ALTER TABLE `tb_compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_compras_detalle`
--
ALTER TABLE `tb_compras_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_ctlg_tipos_medida`
--
ALTER TABLE `tb_ctlg_tipos_medida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_empleados`
--
ALTER TABLE `tb_empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_ingredientes`
--
ALTER TABLE `tb_ingredientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_menus`
--
ALTER TABLE `tb_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_menus_productos`
--
ALTER TABLE `tb_menus_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_mesas`
--
ALTER TABLE `tb_mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_preparaciones`
--
ALTER TABLE `tb_preparaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_preparaciones_ingredientes`
--
ALTER TABLE `tb_preparaciones_ingredientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_preparaciones_pasos`
--
ALTER TABLE `tb_preparaciones_pasos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_productos`
--
ALTER TABLE `tb_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_proveedores`
--
ALTER TABLE `tb_proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_tipo_productos`
--
ALTER TABLE `tb_tipo_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_unidades`
--
ALTER TABLE `tb_unidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_cat_ingredientes`
--
ALTER TABLE `tb_cat_ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `tb_cat_menus`
--
ALTER TABLE `tb_cat_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tb_cat_productos`
--
ALTER TABLE `tb_cat_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `tb_comandas`
--
ALTER TABLE `tb_comandas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tb_comandas_productos`
--
ALTER TABLE `tb_comandas_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tb_compras`
--
ALTER TABLE `tb_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tb_compras_detalle`
--
ALTER TABLE `tb_compras_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tb_ctlg_tipos_medida`
--
ALTER TABLE `tb_ctlg_tipos_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tb_empleados`
--
ALTER TABLE `tb_empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tb_ingredientes`
--
ALTER TABLE `tb_ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `tb_menus`
--
ALTER TABLE `tb_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tb_menus_productos`
--
ALTER TABLE `tb_menus_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `tb_mesas`
--
ALTER TABLE `tb_mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tb_preparaciones`
--
ALTER TABLE `tb_preparaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tb_preparaciones_ingredientes`
--
ALTER TABLE `tb_preparaciones_ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tb_preparaciones_pasos`
--
ALTER TABLE `tb_preparaciones_pasos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tb_productos`
--
ALTER TABLE `tb_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `tb_proveedores`
--
ALTER TABLE `tb_proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `tb_tipo_productos`
--
ALTER TABLE `tb_tipo_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `tb_unidades`
--
ALTER TABLE `tb_unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
