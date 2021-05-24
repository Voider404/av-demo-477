-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 24 2021 г., 22:42
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wsr`
--
CREATE DATABASE IF NOT EXISTS `wsr` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wsr`;

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Тестовая категория');

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `id` int NOT NULL,
  `status` varchar(255) DEFAULT 'Новая' COMMENT 'Статус заявки',
  `name` varchar(255) NOT NULL COMMENT 'Название ',
  `before_img` varchar(255) NOT NULL COMMENT 'Фото до',
  `after_img` varchar(255) DEFAULT NULL COMMENT 'Фото после ',
  `why_not` text COMMENT 'Причина отказа',
  `category_id` int NOT NULL COMMENT 'Категория',
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL COMMENT 'Автор',
  `updated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`id`, `status`, `name`, `before_img`, `after_img`, `why_not`, `category_id`, `created_at`, `created_by`, `updated_by`) VALUES
(1, 'Новая', 'kekw', 'uploads/ot1banner.png', '', 'hmm', 1, '2021-05-24 21:02:00', 101, 101),
(2, 'Отклонена', 'kekw', 'uploads/avo_banner.png', '', '  d', 1, '2021-05-24 21:04:20', 100, 100),
(10, 'Решена', 'NAZVANIE', 'uploads/ns.png', '', 'dddd', 1, '2021-05-24 21:51:01', 100, 100);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
