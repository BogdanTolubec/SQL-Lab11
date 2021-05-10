-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Трв 10 2021 р., 12:10
-- Версія сервера: 10.4.17-MariaDB
-- Версія PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `hotelsystem`
--

DELIMITER $$
--
-- Процедури
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `client_id_find` (IN `name` VARCHAR(200), `surname` VARCHAR(200))  SELECT id_client FROM clients WHERE clients.client_name = name AND clients.client_second_name = surname$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `find_rooms_by_category` (`category` VARCHAR(100))  SELECT id_room FROM `hotel_room` WHERE hotel_room.category LIKE category$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблиці `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `client_second_name` varchar(256) DEFAULT NULL,
  `client_name` varchar(256) DEFAULT NULL,
  `client_patronymic` varchar(200) DEFAULT NULL,
  `client_DOB` date DEFAULT NULL,
  `client_sex` varchar(20) DEFAULT NULL,
  `client_phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `clients`
--

INSERT INTO `clients` (`id_client`, `client_second_name`, `client_name`, `client_patronymic`, `client_DOB`, `client_sex`, `client_phone_number`) VALUES
(1, 'Stethem', 'John', 'Nearly', '2000-06-23', 'Male', ''),
(2, 'Berkelly', 'Swonn', 'Georgy', NULL, 'Male', ''),
(3, 'Trestin', 'George', 'Roklin', '0000-00-00', 'Male', ''),
(4, 'Frencuro', 'Clode', 'Dremir', '0000-00-00', 'Male', ''),
(5, 'Pitcher', 'Marry', 'Francis', '0000-00-00', 'Female', ''),
(6, 'Bush', 'Harley', 'Greoly', NULL, 'Female', ''),
(7, 'Devis', 'Carolina', 'Reberrin', '0000-00-00', 'Female', ''),
(9, 'Relly', 'Froyd', 'Bagister', NULL, 'Male', ''),
(10, 'Levchenko', 'Dmitriy', 'Aleksandrovich', '2002-07-08', 'Male', ''),
(21, 'Serfin', 'Hesys', 'Brenton', '2001-08-21', 'Male', ''),
(26, 'Danilova', 'Valeria', 'Sergiivna', '1200-04-04', 'Female', '(067) 314-8762');

--
-- Тригери `clients`
--
DELIMITER $$
CREATE TRIGGER `delete_reservation` BEFORE DELETE ON `clients` FOR EACH ROW DELETE FROM `reservation` WHERE old.id_client = reservation.client_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблиці `entering data`
--

CREATE TABLE `entering data` (
  `id_user` int(11) UNSIGNED NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `entering data`
--

INSERT INTO `entering data` (`id_user`, `login`, `password`) VALUES
(1, 'admin', 'admin'),
(10, 'DmitryLevchenko', 'Dimon2002'),
(25, 'Bodia228', 'MerlinSherlok2003'),
(26, 'Danilova777', '1234');

-- --------------------------------------------------------

--
-- Структура таблиці `hotel_room`
--

CREATE TABLE `hotel_room` (
  `id_room` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `image_link` varchar(256) NOT NULL DEFAULT 'https://mozart-hotel.com/storage/app/media/mozart-hotel.com/main/mozart-hotel_text1.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `hotel_room`
--

INSERT INTO `hotel_room` (`id_room`, `id_category`, `image_link`) VALUES
(3, 1, 'https://mozart-hotel.com/storage/app/media/mozart-hotel.com/main/mozart-hotel_text1.jpg'),
(4, 1, 'https://storage.googleapis.com/static-content-hc/sites/default/files/cataloina_porto_doble_balcon2_2.jpg'),
(5, 2, 'https://media-cdn.tripadvisor.com/media/photo-s/15/a1/d2/af/hotel-r-de-paris.jpg'),
(7, 3, 'https://media.radissonhotels.net/image/radisson-collection-grand-place-brussels/suite/16256-113921-f70897441_3xl.jpg?impolicy=HomeHero'),
(8, 1, 'https://assets1.hospitalitytech.com/styles/content_md/s3/2018-06/LuMINN%20room%2054.jpg?itok=l6ngXlgT'),
(10, 3, 'https://media.cntraveler.com/photos/56799015c2ebbef23e7d927b/master/pass/Hotelroom-Alamy.jpg');

-- --------------------------------------------------------

--
-- Структура таблиці `hotel_room_category`
--

CREATE TABLE `hotel_room_category` (
  `id_room_category` int(11) NOT NULL,
  `room_category_name` varchar(150) DEFAULT NULL,
  `number_of_places` smallint(5) UNSIGNED DEFAULT NULL,
  `count_of_rooms` smallint(5) UNSIGNED DEFAULT NULL,
  `price_per_day` mediumint(8) UNSIGNED DEFAULT NULL,
  `extra_info` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `hotel_room_category`
--

INSERT INTO `hotel_room_category` (`id_room_category`, `room_category_name`, `number_of_places`, `count_of_rooms`, `price_per_day`, `extra_info`) VALUES
(1, 'Standart', 3, 2, 800, 'Super hotel room'),
(2, 'Lukshery', 2, 4, 1500, 'Expensive but more comfortable then standart'),
(3, 'Econom', 1, 2, 500, 'So small but cheap');

-- --------------------------------------------------------

--
-- Структура таблиці `position`
--

CREATE TABLE `position` (
  `id_position` int(11) NOT NULL,
  `position_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `position`
--

INSERT INTO `position` (`id_position`, `position_name`) VALUES
(1, 'Udefined position'),
(2, 'Admin'),
(3, 'Maid'),
(4, 'security guard'),
(5, 'headwaiter'),
(6, 'waiter'),
(7, 'cook');

-- --------------------------------------------------------

--
-- Структура таблиці `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `reservation_settling_date` date NOT NULL,
  `reservation_leaving_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `client_id`, `reservation_settling_date`, `reservation_leaving_date`) VALUES
(1, 10, '2021-06-01', '2021-06-15');

-- --------------------------------------------------------

--
-- Структура таблиці `room_condition`
--

CREATE TABLE `room_condition` (
  `id_rooms` int(11) NOT NULL,
  `id_worker` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `room_condition`
--

INSERT INTO `room_condition` (`id_rooms`, `id_worker`, `reservation_id`) VALUES
(3, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `workers`
--

CREATE TABLE `workers` (
  `id_workers` int(11) NOT NULL,
  `worker_name` varchar(200) DEFAULT NULL,
  `worker_second_name` varchar(200) DEFAULT NULL,
  `worker_patronymic` varchar(256) DEFAULT NULL,
  `worker_DOB` date NOT NULL,
  `worker_education` varchar(256) DEFAULT NULL,
  `id_worker_position` int(11) NOT NULL,
  `worker_payment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `workers`
--

INSERT INTO `workers` (`id_workers`, `worker_name`, `worker_second_name`, `worker_patronymic`, `worker_DOB`, `worker_education`, `id_worker_position`, `worker_payment`) VALUES
(1, 'Bob', 'Crimson', 'Ucantin', '2000-01-01', 'High', 3, 5000);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `id_client` (`id_client`,`client_phone_number`);

--
-- Індекси таблиці `entering data`
--
ALTER TABLE `entering data`
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD UNIQUE KEY `id_user_2` (`id_user`),
  ADD UNIQUE KEY `id_user_3` (`id_user`,`login`);

--
-- Індекси таблиці `hotel_room`
--
ALTER TABLE `hotel_room`
  ADD PRIMARY KEY (`id_room`),
  ADD UNIQUE KEY `id_room` (`id_room`),
  ADD KEY `id_category` (`id_category`);

--
-- Індекси таблиці `hotel_room_category`
--
ALTER TABLE `hotel_room_category`
  ADD PRIMARY KEY (`id_room_category`),
  ADD UNIQUE KEY `id_room_category` (`id_room_category`,`room_category_name`);

--
-- Індекси таблиці `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id_position`),
  ADD UNIQUE KEY `id_position` (`id_position`);

--
-- Індекси таблиці `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD UNIQUE KEY `id_reservation` (`id_reservation`),
  ADD UNIQUE KEY `id_reservation_2` (`id_reservation`),
  ADD KEY `client_id` (`client_id`);

--
-- Індекси таблиці `room_condition`
--
ALTER TABLE `room_condition`
  ADD PRIMARY KEY (`id_rooms`),
  ADD UNIQUE KEY `id_rooms` (`id_rooms`),
  ADD UNIQUE KEY `id_rooms_2` (`id_rooms`),
  ADD KEY `id_worker` (`id_worker`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Індекси таблиці `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id_workers`),
  ADD UNIQUE KEY `id_workers` (`id_workers`),
  ADD UNIQUE KEY `id_workers_2` (`id_workers`),
  ADD KEY `id_worker_position` (`id_worker_position`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблиці `hotel_room`
--
ALTER TABLE `hotel_room`
  MODIFY `id_room` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `hotel_room_category`
--
ALTER TABLE `hotel_room_category`
  MODIFY `id_room_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `position`
--
ALTER TABLE `position`
  MODIFY `id_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `room_condition`
--
ALTER TABLE `room_condition`
  MODIFY `id_rooms` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `workers`
--
ALTER TABLE `workers`
  MODIFY `id_workers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `hotel_room`
--
ALTER TABLE `hotel_room`
  ADD CONSTRAINT `hotel_room_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `hotel_room_category` (`id_room_category`);

--
-- Обмеження зовнішнього ключа таблиці `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`);

--
-- Обмеження зовнішнього ключа таблиці `room_condition`
--
ALTER TABLE `room_condition`
  ADD CONSTRAINT `room_condition_ibfk_1` FOREIGN KEY (`id_worker`) REFERENCES `workers` (`id_workers`),
  ADD CONSTRAINT `room_condition_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id_reservation`),
  ADD CONSTRAINT `room_condition_ibfk_3` FOREIGN KEY (`id_rooms`) REFERENCES `hotel_room` (`id_room`);

--
-- Обмеження зовнішнього ключа таблиці `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`id_worker_position`) REFERENCES `position` (`id_position`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
