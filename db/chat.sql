-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 15 2017 г., 17:39
-- Версия сервера: 5.6.37
-- Версия PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `chat`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blocked_user`
--

CREATE TABLE `blocked_user` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blocked_user`
--

INSERT INTO `blocked_user` (`id`, `user`) VALUES
(1, 'Bob2'),
(2, 'Bob'),
(4, 'John');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `user`, `message`, `timestamp`, `room_id`) VALUES
(190, 'Bob', 'Hello', '2017-10-15 16:27:26', 3),
(191, 'Bob', 'dfgd', '2017-10-15 16:27:30', 3),
(192, 'Bob', 'hrhrhr', '2017-10-15 16:27:47', 3),
(193, 'Bob', 'Hello', '2017-10-15 16:30:45', 3),
(194, 'John', 'Hello', '2017-10-15 16:43:33', 4),
(195, 'John', 'Check you', '2017-10-15 16:43:42', 4),
(196, 'John', 'Fuck yesas', '2017-10-15 16:43:56', 4),
(197, 'Bob', 'fghfg', '2017-10-15 16:47:46', 3),
(198, 'Bob', 'fghfgh', '2017-10-15 16:47:47', 3),
(199, 'Bob', 'fghfghf', '2017-10-15 16:47:50', 4),
(200, 'Bob', 'fghfgh', '2017-10-15 16:47:51', 4),
(201, 'Bob2', 'dfgd', '2017-10-15 17:07:39', 3),
(203, 'John', 'Hello', '2017-10-15 17:27:11', 3),
(204, 'John2', 'hello', '2017-10-15 17:27:20', 3),
(205, 'John2', 'Привет', '2017-10-15 17:30:30', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `online_users`
--

CREATE TABLE `online_users` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `last_seen` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rooms`
--

INSERT INTO `rooms` (`id`, `room_name`) VALUES
(3, 'Alpha'),
(4, 'Beta');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `blocked_user`
--
ALTER TABLE `blocked_user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `online_users`
--
ALTER TABLE `online_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `blocked_user`
--
ALTER TABLE `blocked_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;
--
-- AUTO_INCREMENT для таблицы `online_users`
--
ALTER TABLE `online_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;
--
-- AUTO_INCREMENT для таблицы `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
