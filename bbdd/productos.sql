-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-10-2024 a las 06:32:34
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `productos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `ID_Articulo` int(10) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `FK_Categoria` int(10) NOT NULL,
  `FK_Subcategoria` int(10) NOT NULL,
  `FK_Tipo` int(10) NOT NULL,
  `FK_Marca` int(10) DEFAULT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`ID_Articulo`, `Nombre`, `FK_Categoria`, `FK_Subcategoria`, `FK_Tipo`, `FK_Marca`, `Descripcion`, `Precio`) VALUES
(1, 'Brillo Labial Lifter Gloss', 1, 1, 1, 1, 'Este gloss con ácido hialurónico mantiene tus labios hidratados hasta 4 horas. Esto significa que el gloss le dará ese efecto volumen a tus labios gracias a su brillo, y también mantendrá su humectación durante este periodo de tiempo. Eso sí, las comidas, y las bebidas podrían modificar esta duración. Por eso, cuando sientas que el brillo de labios haya disminuido, no tengas miedo en volver a aplicar una capa nueva para que el gloss haga su efecto.', 11702),
(2, 'Base True Match Serum', 1, 2, 2, 2, 'True Match Nude Hyaluronic Tinted Serum, al instante ilumina, equilibra e hidrata, todo en uno para un radiante acabado en tono piel. 1% de ácido hialurónico, hidrata y suaviza al instante, pigmentos minerales luminosos para una cobertura ligera que ilumina tu aspecto, el ácido hialurónico se encuentra naturalmente en la piel y mejora la retención de humedad de la piel.', 25289),
(3, 'Polvo Natural Bronzer', 1, 2, 3, 5, 'Este bronceador Rimmel London Natural Bronzer está diseñado para proporcionar un brillo cálido en todo el cuerpo y un aspecto natural y bronceado. Aplica el bronceador en las mejillas y las sienes para crear un brillo cálido y natural.\r\n', 17500),
(4, 'Sombra en Barra Metallic Eyeshadow', 1, 3, 4, 6, 'Súper cremosa y de larga duración. Esta sombra en barra logra excelente cobertura en una sola pasada, mientras se siente liviana y confortable. Práctica a la hora de aplicar y trasladar, aporta un efecto metálico único. Probá las sombras con colores más intensos y brillantes. ', 12490),
(5, 'Essencial Exclusivo Floral Eau de Parfum Femenino', 2, 2, 5, 7, 'Creación moderna, fuerte y al mismo tiempo misteriosa. Combina las especias frescas con el cuerpo de la madera y los ingredientes naturales inéditos brasileños. Un perfume exclusivo, que hace cada momento único. Camino olfativo:\r\nIntenso, jazmin, osmanthus, ylang ylang', 56469),
(6, 'Labial CC Hidratante FPS 25 Una', 1, 1, 6, 7, 'El Labial CC Hidratante FPS 25 de Una posee colores llamativos, además de tratar tus labios con 10 beneficios increíbles. Contiene ingredientes de origen natural (sésamo, cacao y ceramidas de maracuyá), que combaten el envejecimiento y contribuyen para la firmeza, el volumen y la nutrición de los labios.', 21410),
(7, 'Paleta de Sombras 12 Colores Starlight', 1, 3, 4, 6, 'Paleta de Sombras Extreme 12 Colores Starlight. Tener presente que algunos productos pueden venir sin termosellado.', 11693),
(8, 'Superstay Vinyl Ink Unrivaled', 1, 1, 7, 1, 'El nuevo labial líquido SuperStay Vinyl Ink de Maybellline New York leda a tus labios un color vinilo de larga duración. Ahora disponible ennuevos tonos nude. Consigue un brillo instantáneo que dura hasta 16horas.', 12803),
(15, 'Articulofalso', 1, 1, 1, 1, 'iodfgsfvdsfffdsfsfdfsfddsf', 1234);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `Id_Categoria` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`Id_Categoria`, `Nombre`) VALUES
(1, 'Maquillaje'),
(2, 'Fragancia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `ID_Login` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Mail` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`ID_Login`, `Nombre`, `Mail`, `Password`) VALUES
(1, 'Carla', 'carla@mail.com', '123456'),
(2, 'Carlitos', 'carlitos@mail.com', '654321'),
(3, 'Pepito', 'pepito@mail.com', '$2a$08$ixOHS4eiYqqTf'),
(5, 'Laura', 'laura@mail.com', '$2a$08$f0B.lyQOvBCyP'),
(6, 'Juan', 'juan@mail.com', '$2a$08$X/F.Sicw.pB8V'),
(7, 'Martita', 'martita@mail.com', '$2a$08$EAHhP5ciub6mA'),
(8, 'Lucianita', 'lucianita@mail.com', '1233466');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `ID_Marca` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `FK_Pais` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`ID_Marca`, `Nombre`, `FK_Pais`) VALUES
(1, 'Maybelline', 1),
(2, 'L\'Oreal París', 2),
(5, 'Rimmel', 3),
(6, 'Extreme', 5),
(7, 'Natura', 4),
(8, 'MAC', 6),
(9, 'Lancôme', 2),
(10, 'marcafalsa', 1),
(13, 'Marcafalsa321', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `ID_Pais` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`ID_Pais`, `Nombre`) VALUES
(1, 'Estados Unidos'),
(2, 'Francia'),
(3, 'Inglaterra'),
(4, 'Brasíl'),
(5, 'Argentina'),
(6, 'Canadá');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `ID_Sub` int(10) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `FK_Categoria` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`ID_Sub`, `Nombre`, `FK_Categoria`) VALUES
(1, 'Labios', 1),
(2, 'Piel', 1),
(3, 'Ojos', 1),
(4, 'Eau de Parfum', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `ID_Tipos` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `FK_Subcategoria` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`ID_Tipos`, `Nombre`, `FK_Subcategoria`) VALUES
(1, 'Gloss', 1),
(2, 'Base', 2),
(3, 'Bronzer', 2),
(4, 'Sombra', 3),
(5, 'Floral', 4),
(6, 'Hidratante', 1),
(7, 'Liquido', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`ID_Articulo`),
  ADD KEY `Marca` (`FK_Marca`),
  ADD KEY `Marca_2` (`FK_Marca`),
  ADD KEY `FK_Categoria` (`FK_Categoria`),
  ADD KEY `FK_Subcategoria` (`FK_Subcategoria`),
  ADD KEY `FK_Tipo` (`FK_Tipo`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID_Login`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`ID_Marca`),
  ADD KEY `FK_Pais` (`FK_Pais`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`ID_Pais`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`ID_Sub`),
  ADD KEY `FK_Categoria` (`FK_Categoria`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`ID_Tipos`),
  ADD KEY `FK_Subcategoria` (`FK_Subcategoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `ID_Articulo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `Id_Categoria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `ID_Login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `ID_Marca` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `ID_Pais` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `ID_Sub` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `ID_Tipos` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`FK_Marca`) REFERENCES `marcas` (`ID_Marca`) ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`FK_Tipo`) REFERENCES `tipos` (`ID_Tipos`) ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_3` FOREIGN KEY (`FK_Subcategoria`) REFERENCES `subcategorias` (`ID_Sub`) ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_4` FOREIGN KEY (`FK_Categoria`) REFERENCES `categorias` (`Id_Categoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD CONSTRAINT `marcas_ibfk_1` FOREIGN KEY (`FK_Pais`) REFERENCES `paises` (`ID_Pais`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`FK_Categoria`) REFERENCES `categorias` (`Id_Categoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD CONSTRAINT `tipos_ibfk_1` FOREIGN KEY (`FK_Subcategoria`) REFERENCES `subcategorias` (`ID_Sub`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
