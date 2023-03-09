-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Мар 09 2023 г., 09:06
-- Версия сервера: 8.0.32
-- Версия PHP: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Категория №1'),
(2, 'Категория №2'),
(3, 'Категория №3'),
(4, 'Категория №4'),
(5, 'Категория №5'),
(6, 'Категория №6');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `id_category` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `id_category`, `name`, `price`) VALUES
(1, 1, 'Табурет №1', 230.1),
(2, 1, 'Табурет №2', 55),
(3, 2, 'Табурет №3', 123),
(4, 2, 'Табурет №4', 321),
(5, 2, 'Табурет №5', 117),
(6, 3, 'Табурет №6', 53),
(7, 3, 'Табурет №7', 21),
(8, 3, 'Табурет №8', 32),
(9, 3, 'Табурет №9', 14),
(10, 4, 'Табурет №9', 33),
(11, 4, 'Табурет №10', 21),
(12, 4, 'Табурет №11', 56),
(13, 4, 'Табурет №12', 99),
(14, 4, 'Табурет №13', 38),
(15, 5, 'Табурет №14', 141),
(16, 5, 'Табурет №15', 92),
(17, 5, 'Табурет №16', 31),
(18, 5, 'Табурет №17', 43),
(19, 5, 'Табурет №18', 77),
(21, 6, 'Табурет №20', 11),
(22, 6, 'Табурет №21', 17),
(23, 6, 'Табурет №22', 23),
(24, 6, 'Табурет №23', 33),
(25, 6, 'Табурет №24', 76),
(26, 6, 'Табурет №25', 34);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
