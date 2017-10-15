-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 15 2017 г., 08:10
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
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `user`, `message`, `timestamp`) VALUES
(35, '1234', '123412', '2017-10-12 19:04:59'),
(36, '1234', '123412gdfgdf', '2017-10-12 19:05:01'),
(37, '1234', '123412gdfgdf', '2017-10-12 19:05:02'),
(38, '1234', '123412gdfgdf', '2017-10-12 19:05:02'),
(39, '1234', '123412gdfgdf', '2017-10-12 19:05:02'),
(40, '1234', '123412gdfgdf', '2017-10-12 19:05:03'),
(41, '1234', '123412gdfgdf', '2017-10-12 19:05:03'),
(42, '1234', '123412gdfgdf', '2017-10-12 19:05:03'),
(43, '1234', '123412gdfgdfdfgd', '2017-10-12 19:05:05'),
(44, '4234', '2342', '2017-10-12 19:17:19'),
(45, 'John', 'loloda', '2017-10-12 20:56:38'),
(46, 'John', 'loloda', '2017-10-12 20:56:50'),
(47, '43654', '4356', '2017-10-12 21:10:50'),
(48, '6786', '678686', '2017-10-12 21:11:00'),
(49, '6456', '45645', '2017-10-12 21:13:40'),
(50, 'John', 'ole', '2017-10-12 21:16:03'),
(51, 'cmon', 'asdf', '2017-10-12 21:16:13'),
(52, 'dfg', 'dfgd', '2017-10-12 21:18:32'),
(53, 'fsdfs', 'sdfsf', '2017-10-12 21:19:03'),
(54, 'dfgd', 'gdfgd', '2017-10-12 21:19:38'),
(55, 'fghf', 'hfghf', '2017-10-12 21:19:44'),
(56, 'dsfg', 'dfg', '2017-10-12 21:20:30'),
(57, 'ewrr3r', 't34t3', '2017-10-12 21:22:39'),
(58, 'john', 'hello', '2017-10-12 21:23:25'),
(59, 'jgh', 'ghjg', '2017-10-12 21:28:21'),
(60, 'ghjg', 'ghjfghjgfhfj 6j 6j 6j6 j6ghjfghjgfhfj 6j 6j 6j6 j6ghjfghjgfhfj 6j 6j 6j6 j6ghjfghjgfhfj 6j 6j 6j6 j6ghjfghjgfhfj 6j 6j 6j6 j6ghjfghjgfhfj 6j 6j 6j6 j6', '2017-10-12 21:29:20'),
(61, 'dfgs', 'dgdg', '2017-10-12 21:33:23'),
(62, 'sdf', 'sdf', '2017-10-12 21:34:46'),
(63, 'sdf', 'sdf', '2017-10-12 21:37:19'),
(64, 'sdf', 'sdf', '2017-10-12 21:37:26'),
(65, 'sdf', 'sdf', '2017-10-12 21:37:27'),
(66, '123', '123', '2017-10-12 21:37:58'),
(67, '345', '46', '2017-10-12 21:40:21'),
(68, '345', '345', '2017-10-12 21:45:14'),
(69, '345', '345', '2017-10-12 21:46:12'),
(70, '345', 'bob', '2017-10-12 21:48:04'),
(71, 'tert', 'etretre', '2017-10-13 09:11:02'),
(72, 'tert', 'hello', '2017-10-13 13:18:49'),
(73, 'tert', 'hello', '2017-10-13 13:18:59'),
(74, 'tert', 'whatsup', '2017-10-13 13:19:13'),
(75, 'joe', 'whatsup', '2017-10-13 13:19:35'),
(76, 'joe', 'how are you', '2017-10-13 13:19:46'),
(77, 'joe', 'all is fine', '2017-10-13 13:20:07'),
(79, 'hello', 'jhgfghj', '2017-10-13 13:23:10'),
(85, '', '', '2017-10-13 14:41:44'),
(86, '', '', '2017-10-13 14:41:45'),
(87, '', '', '2017-10-13 14:41:45'),
(88, '', '', '2017-10-13 14:41:46'),
(89, '', '', '2017-10-13 14:41:47'),
(90, '', '', '2017-10-13 14:41:47'),
(141, 'fdsdf', 'sdf', '2017-10-14 15:13:49'),
(142, 'fdsdf', 'sdf', '2017-10-14 15:14:14'),
(143, 'fdsdf', 'sdf', '2017-10-14 15:15:54'),
(144, 'dfgdf', 'gdfg', '2017-10-14 15:17:24'),
(145, 'dfgdf', 'gdfg', '2017-10-14 15:17:27'),
(146, 'BOB', 'hello', '2017-10-14 15:29:19'),
(147, 'John', 'hello', '2017-10-14 16:38:00'),
(148, 'John', 'hello', '2017-10-14 16:38:12'),
(149, 'John', 'How are you?', '2017-10-14 16:39:54'),
(150, 'Gena', 'fgdfgd', '2017-10-14 16:41:39'),
(151, 'Gena', '???', '2017-10-14 16:41:47'),
(152, 'Gena', 'HI', '2017-10-14 16:42:29'),
(153, 'John', 'HI', '2017-10-14 16:42:34'),
(154, 'Bob', 'WTF?', '2017-10-14 16:43:55'),
(155, 'John', 'Hi', '2017-10-14 17:20:48'),
(156, 'Bob', 'JOhn', '2017-10-14 17:21:24'),
(157, 'Bob', 'Hi', '2017-10-14 17:21:50'),
(158, 'Bob', '', '2017-10-14 17:21:55'),
(159, 'John', 'HI', '2017-10-14 17:23:17'),
(160, 'John', 'bob', '2017-10-14 17:24:06'),
(161, 'John', 'Bob', '2017-10-14 17:26:34'),
(162, 'John', 'Bob', '2017-10-14 17:26:48'),
(163, 'John', 'Hi', '2017-10-14 17:27:22'),
(164, 'John', 'fdgdfgd', '2017-10-14 17:28:07'),
(165, 'John', 'fdgdfgd', '2017-10-14 17:28:08'),
(166, 'Bob', 'Hi', '2017-10-14 17:29:41'),
(167, 'Bob', 'How are you?', '2017-10-14 17:29:49'),
(168, 'Bob', 'Gena', '2017-10-14 17:29:59'),
(169, 'Jon', 'fsdf', '2017-10-14 17:31:01'),
(170, 'Jon', 'fsdafsadfasdfasd lisdjf hsadfuhsad pfiuhsadpf iushadf pisadhf psadiufh sapdifu hsdpifu hsdpifu hsdpifu hsdpfi ushdfp iusdhfpi usdhfp sduf', '2017-10-14 17:32:07'),
(171, 'Jon', ' flkasdhf sdipfuh sdipfu hsdpfiu hsdpifu hsdpfiu shdapfi ushdapfi usdhpf usadhf pisaudhf', '2017-10-14 17:32:12'),
(172, 'Jon', 'sdufh psdiufh spdiufh spdiufh aspdifu  sdifuhs diufh spdiufh as[duf asdiou fhas', '2017-10-14 17:32:16'),
(173, 'Jon', 'dfgdfg', '2017-10-14 18:02:39'),
(174, 'Jon', 'gdfgdsf', '2017-10-14 18:03:01'),
(175, 'Jon', 'sdfgkljhdfgkj', '2017-10-14 18:03:04'),
(176, 'Bob', 'hell', '2017-10-14 19:37:18'),
(177, 'Admin', 'Тест', '2017-10-15 07:06:08'),
(178, 'Admin', 'Тестинг тест', '2017-10-15 07:06:25'),
(179, 'Admin', 'Testing test', '2017-10-15 07:06:39'),
(180, 'User', 'Hello', '2017-10-15 07:06:50'),
(181, 'User', 'Test two', '2017-10-15 07:07:10'),
(182, 'User', 'Проверка', '2017-10-15 07:07:13'),
(183, 'User', 'Проверка', '2017-10-15 07:07:20');

-- --------------------------------------------------------

--
-- Структура таблицы `onlineUsers`
--

CREATE TABLE `onlineUsers` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `last_seen` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `onlineUsers`
--
ALTER TABLE `onlineUsers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;
--
-- AUTO_INCREMENT для таблицы `onlineUsers`
--
ALTER TABLE `onlineUsers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
