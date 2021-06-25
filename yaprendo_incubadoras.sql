-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-06-2021 a las 15:20:04
-- Versión del servidor: 5.7.23-23
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `yaprendo_incubadoras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `Idemp` int(11) NOT NULL,
  `Empresa` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Ubicacion` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `Movil` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Correo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Logo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Empresario` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Fecha` date NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`Idemp`, `Empresa`, `Ubicacion`, `Movil`, `Correo`, `Logo`, `Empresario`, `Fecha`, `Estado`) VALUES
(1, 'La mamá de los pollitos', 'Conocida Chiapas, México', '9611245795', 'demo@yaprendo.com', '', 'Jair Saldaña', '2020-11-13', 1);

--
-- Disparadores `empresas`
--
DELIMITER $$
CREATE TRIGGER `Delempresas` BEFORE DELETE ON `empresas` FOR EACH ROW delete from incubadoras where Idemp=Idemp
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incubadoras`
--

CREATE TABLE `incubadoras` (
  `Idinc` int(11) NOT NULL,
  `Modelo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Tipo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Descrip` text COLLATE latin1_spanish_ci NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Resultado` int(11) NOT NULL,
  `Nota` text COLLATE latin1_spanish_ci NOT NULL,
  `Estado` int(11) NOT NULL,
  `Idemp` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `incubadoras`
--

INSERT INTO `incubadoras` (`Idinc`, `Modelo`, `Cantidad`, `Tipo`, `Descrip`, `Fecha`, `Hora`, `Resultado`, `Nota`, `Estado`, `Idemp`) VALUES
(1, 'In20-60-01', 60, 'Gallina', 'Ponedora cuello pelo ', '2020-11-13', '08:57:00', 47, '  13 no nacidos', 1, 1),
(2, 'in20-30-01', 30, 'gallina', 'engorda', '2020-10-31', '09:39:00', 0, '', 1, 1);

--
-- Disparadores `incubadoras`
--
DELIMITER $$
CREATE TRIGGER `Delincubadora` BEFORE DELETE ON `incubadoras` FOR EACH ROW delete from itinerario  where Idinc=Idinc
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itinerarios`
--

CREATE TABLE `itinerarios` (
  `Iditi` int(11) NOT NULL,
  `Dia` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Temperatura` float NOT NULL,
  `Humedad` float NOT NULL,
  `Hora` time NOT NULL,
  `Nota` text COLLATE latin1_spanish_ci NOT NULL,
  `Idinc` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `itinerarios`
--

INSERT INTO `itinerarios` (`Iditi`, `Dia`, `Fecha`, `Temperatura`, `Humedad`, `Hora`, `Nota`, `Idinc`) VALUES
(1, 0, '2020-10-31', 37.8, 60.5, '09:28:00', 'X ', 1),
(4, 2, '2020-11-02', 37.8, 60.5, '09:28:00', 'X ', 1),
(5, 2, '2020-11-02', 37.3, 65, '21:22:00', 'X  temperatura: verificar los focos porque deben de estar encendidos ambos, y en caso de estar encendidos pruebe con colocar unos de mayor capacidad, vea que la incubadora se encuentre dentro de una habitación techada humedad:', 1),
(2, 1, '2020-11-01', 37.8, 60.5, '09:28:00', 'X ', 1),
(3, 1, '2020-11-01', 37.9, 62.4, '09:37:00', 'X  temperatura:  humedad:', 1),
(6, 3, '2020-11-03', 37.9, 65, '09:23:00', 'X  temperatura:  humedad:', 1),
(7, 3, '2020-11-03', 37.6, 63, '09:24:00', 'X  temperatura: verificar los focos porque deben de estar encendidos ambos, y en caso de estar encendidos pruebe con colocar unos de mayor capacidad, vea que la incubadora se encuentre dentro de una habitación techada humedad:', 1),
(8, 4, '2020-11-04', 37.8, 62.4, '09:25:00', 'X  temperatura:  humedad:', 1),
(9, 4, '2020-11-04', 37.8, 62.4, '21:26:00', 'X  temperatura:  humedad:', 1),
(10, 5, '2020-11-05', 37.8, 65, '09:27:00', 'X  temperatura:  humedad:', 1),
(11, 5, '2020-11-06', 37.8, 65, '21:01:00', 'X  temperatura:  humedad:', 1),
(12, 6, '2020-11-06', 37.8, 65, '09:29:00', 'X  temperatura:  humedad:', 1),
(13, 6, '2020-11-06', 37.8, 65, '21:29:00', 'X  temperatura:  humedad:', 1),
(14, 7, '2020-11-07', 37.8, 65, '09:31:00', 'X  temperatura:  humedad:', 1),
(15, 7, '2020-11-07', 37.8, 65, '21:31:00', 'X  temperatura:  humedad:', 1),
(16, 8, '2020-11-08', 37.8, 65, '09:31:00', 'X  temperatura:  humedad:', 1),
(17, 8, '2020-11-08', 37.8, 65, '21:32:00', 'X  temperatura:  humedad:', 1),
(18, 9, '2020-11-09', 37.8, 78, '09:32:00', 'tire agua en la incubadora   temperatura:  humedad:verificar los contenedores de agua porque deben de estar con 1pulgada de agua ambos, y en caso de no estar asi colocar el agua al limite o pruebe con quitar un traste  y colocar unos solo en el centro mientras baja la humedad ademas verificar que el ventilador debe de estar encendido', 1),
(19, 9, '2020-11-10', 37.8, 65, '21:34:00', 'X  temperatura:  humedad:', 1),
(20, 10, '2020-11-10', 37.8, 65, '09:34:00', 'X  temperatura:  humedad:', 1),
(21, 10, '2020-11-10', 37.8, 65, '21:35:00', 'X  temperatura:  humedad:', 1),
(22, 11, '2020-11-11', 37.8, 65, '09:36:00', 'X  temperatura:  humedad:', 1),
(23, 11, '2020-11-11', 37.8, 65, '21:36:00', 'X  temperatura:  humedad:', 1),
(24, 12, '2020-11-12', 37.9, 69, '09:37:00', 'X  temperatura:  humedad:', 1),
(25, 12, '2020-11-12', 37.9, 69, '21:37:00', 'X  temperatura:  humedad:', 1),
(26, 13, '2020-11-13', 37.9, 62.4, '09:37:00', 'X  temperatura:  humedad:', 1),
(27, 13, '2020-11-13', 37.8, 62, '09:57:00', 'x temperatura:  humedad:', 0),
(28, 13, '2020-11-13', 37.8, 62, '09:58:00', 'x temperatura:  humedad:', 0),
(29, 14, '2020-11-14', 37.7, 60, '21:10:00', 'X temperatura:  humedad:', 1),
(30, 14, '2020-11-14', 37.7, 60, '21:10:00', 'X temperatura:  humedad:', 1),
(31, 15, '2020-11-15', 37.7, 60, '09:34:21', 'x temperatura:  humedad:', 1),
(32, 15, '2020-12-05', 37.7, 60, '22:35:13', 'x temperatura:  humedad:', 1),
(33, 16, '2020-11-16', 37.7, 60, '09:35:35', 'x temperatura:  humedad:', 1),
(34, 16, '2020-11-16', 37.7, 60, '22:35:57', 'x temperatura:  humedad:', 1),
(35, 17, '2020-11-16', 37.7, 60, '22:35:57', 'x temperatura:  humedad:', 1),
(36, 17, '2020-11-16', 37.7, 60, '22:35:57', 'x temperatura:  humedad:', 1),
(37, 18, '2020-11-18', 37.7, 60, '09:38:02', 'x temperatura:  humedad:', 1),
(38, 18, '2020-11-18', 37.7, 60, '22:38:27', 'x temperatura:  humedad:', 1),
(39, 19, '2020-11-19', 38, 91, '10:38:50', 'x temperatura:  humedad:', 1),
(40, 19, '2020-11-19', 38.1, 89, '22:39:27', 'x temperatura: verificar los focos porque deben de estar apagados ambos, y en caso de estar apagados verificar el ventilador debe de estar encendido vea que la incubadora se encuentre en lugar techado humedad:', 1),
(41, 20, '2020-11-20', 37.9, 90, '09:40:16', 'x temperatura: verificar los focos porque deben de estar encendidos ambos, y en caso de estar encendidos pruebe con insertar unos de mayor capacidad vea que la incubadora se encuentre en lugar techado humedad:', 1),
(42, 20, '2020-11-20', 38.1, 92, '21:41:40', 'x temperatura: verificar los focos porque deben de estar apagados ambos, y en caso de estar apagados verificar el ventilador debe de estar encendido vea que la incubadora se encuentre en lugar techado humedad:verificar los contenedores de agua porque deben de estar con 1pulgada de agua los tres y verificar el ventilador debe de estar encendido puede retirar un traste mientras baja la humedad', 1),
(43, 21, '2020-11-21', 38.1, 92, '09:41:40', 'x temperatura: verificar los focos porque deben de estar apagados ambos, y en caso de estar apagados verificar el ventilador debe de estar encendido vea que la incubadora se encuentre en lugar techado humedad:verificar los contenedores de agua porque deben de estar con 1pulgada de agua los tres y verificar el ventilador debe de estar encendido puede retirar un traste mientras baja la humedad', 1),
(44, 21, '2020-11-21', 38.3, 93, '22:43:47', 'nacimiento de pollitos temperatura: verificar los focos porque deben de estar apagados ambos, y en caso de estar apagados verificar el ventilador debe de estar encendido vea que la incubadora se encuentre en lugar techado humedad:verificar los contenedores de agua porque deben de estar con 1pulgada de agua los tres y verificar el ventilador debe de estar encendido puede retirar un traste mientras baja la humedad', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Idusu` int(11) NOT NULL,
  `Nombres` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Movil` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Correo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Pass` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `Foto` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Fecha` date NOT NULL,
  `Estado` int(11) NOT NULL,
  `Idemp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Idusu`, `Nombres`, `Apellidos`, `Movil`, `Correo`, `Pass`, `Foto`, `Fecha`, `Estado`, `Idemp`) VALUES
(1, 'Demostración', 'Virtual', '9611245795', 'demo@yaprendo.com', '1234', '', '2020-11-13', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`Idemp`);

--
-- Indices de la tabla `incubadoras`
--
ALTER TABLE `incubadoras`
  ADD PRIMARY KEY (`Idinc`),
  ADD KEY `Idemp` (`Idemp`);

--
-- Indices de la tabla `itinerarios`
--
ALTER TABLE `itinerarios`
  ADD PRIMARY KEY (`Iditi`),
  ADD KEY `Idinc` (`Idinc`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Idusu`),
  ADD UNIQUE KEY `Idemp_2` (`Idemp`),
  ADD KEY `Idemp` (`Idemp`),
  ADD KEY `Idemp_3` (`Idemp`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `Idemp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `incubadoras`
--
ALTER TABLE `incubadoras`
  MODIFY `Idinc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `itinerarios`
--
ALTER TABLE `itinerarios`
  MODIFY `Iditi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Idusu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
