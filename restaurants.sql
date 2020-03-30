-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-03-2020 a las 13:09:14
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `kind_food` set('pescadors','tapas','vegetariana','catalana','mediterrania','mexicana','oriental','italiana') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `address`, `lat`, `lng`, `kind_food`) VALUES
('1', 'Tequila Cantina Mexicana', 'Carrer de Bilbao 13 08005 Barcelona', 41.4009, 2.20624, 'catalana,mediterrania,mexicana'),
('2', 'Sports Bar', 'Carrer Ample 51 08002 Barcelona', 41.3813, 2.18044, 'mediterrania,italiana'),
('3', 'Maxi & Max', 'Passeig Fabra i Puig 104 08031 Barcelona', 41.4306, 2.18429, 'tapas,mediterrania'),
('4', 'Ca La Montse', 'Carrer Pizarro 1 08003 Barcelona', 41.3823, 2.18823, 'pescadors,mediterrania'),
('5', 'Ramen Ya-Hiro', 'Carrer Girona 164 08037 Barcelona', 41.3999, 2.16497, 'oriental'),
('6', 'Bar Morrysom', 'Carrer Girona 162 08037 Barcelona', 41.3998, 2.16518, 'tapas'),
('7', 'Toca Teca', 'Carrer Garcilaso 172 08027 Barcelona', 41.4237, 2.18099, 'tapas,mediterrania'),
('8', 'Bar Versalles', 'Carrer Gran de Sant Andreu 255 08030 Barcelona', 41.4356, 2.18964, 'tapas,catalana,mediterrania'),
('9', 'Chen Ji', 'Carrer Ali Bei 67 08013 Barcelona', 41.3939, 2.18081, 'oriental'),
('10', 'Pranalú', 'Carrer Vallmajor 33 Local 1 08021 Barcelona', 41.401, 2.13864, 'vegetariana');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  ADD KEY `id_restaurant` (`id_restaurant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
