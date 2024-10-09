-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2024 a las 01:52:55
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
  `Categoria` varchar(15) NOT NULL,
  `Marca` varchar(20) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`ID_Articulo`, `Nombre`, `Categoria`, `Marca`, `Descripcion`, `Precio`) VALUES
(1, 'Brillo Labial Lifter Gloss', 'Labios', 'Maybelline', 'Este gloss con ácido hialurónico mantiene tus labios hidratados hasta 4 horas. Esto significa que el gloss le dará ese efecto volumen a tus labios gracias a su brillo, y también mantendrá su humectación durante este periodo de tiempo. Eso sí, las comidas, y las bebidas podrían modificar esta duración. Por eso, cuando sientas que el brillo de labios haya disminuido, no tengas miedo en volver a aplicar una capa nueva para que el gloss haga su efecto.', 11702),
(2, 'Base True Match Serum', 'Rostro', 'L\'Oreal París', 'True Match Nude Hyaluronic Tinted Serum, al instante ilumina, equilibra e hidrata, todo en uno para un radiante acabado en tono piel. 1% de ácido hialurónico, hidrata y suaviza al instante, pigmentos minerales luminosos para una cobertura ligera que ilumina tu aspecto, el ácido hialurónico se encuentra naturalmente en la piel y mejora la retención de humedad de la piel.', 25289),
(3, 'Polvo Natural Bronzer', 'Rostro', 'Rimmel', 'Este bronceador Rimmel London Natural Bronzer está diseñado para proporcionar un brillo cálido en todo el cuerpo y un aspecto natural y bronceado. Aplica el bronceador en las mejillas y las sienes para crear un brillo cálido y natural.\r\n', 17500),
(4, 'Sombra en Barra Metallic Eyeshadow', 'Ojos', 'Extreme', 'Súper cremosa y de larga duración. Esta sombra en barra logra excelente cobertura en una sola pasada, mientras se siente liviana y confortable. Práctica a la hora de aplicar y trasladar, aporta un efecto metálico único. Probá las sombras con colores más intensos y brillantes. ', 12490),
(5, 'Essencial Exclusivo Floral Eau de Parfum Femenino', 'Fragancias', 'Natura', 'Creación moderna, fuerte y al mismo tiempo misteriosa. Combina las especias frescas con el cuerpo de la madera y los ingredientes naturales inéditos brasileños. Un perfume exclusivo, que hace cada momento único. Camino olfativo:\r\nIntenso, jazmin, osmanthus, ylang ylang', 56469),
(6, 'Labial CC Hidratante FPS 25 Una', 'Labial', 'Natura', 'El Labial CC Hidratante FPS 25 de Una posee colores llamativos, además de tratar tus labios con 10 beneficios increíbles. Contiene ingredientes de origen natural (sésamo, cacao y ceramidas de maracuyá), que combaten el envejecimiento y contribuyen para la firmeza, el volumen y la nutrición de los labios.', 21410),
(7, 'Paleta de Sombras 12 Colores Starlight', 'Sombras', 'Extreme', 'Paleta de Sombras Extreme 12 Colores Starlight. Tener presente que algunos productos pueden venir sin termosellado.', 11693),
(8, 'Superstay Vinyl Ink Unrivaled', 'Labial', 'Maybelline', 'El nuevo labial líquido SuperStay Vinyl Ink de Maybellline New York leda a tus labios un color vinilo de larga duración. Ahora disponible ennuevos tonos nude. Consigue un brillo instantáneo que dura hasta 16horas.', 12803);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`ID_Articulo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `ID_Articulo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
