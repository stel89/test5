-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Апр 14 2017 г., 13:38
-- Версия сервера: 5.7.17-0ubuntu0.16.04.2
-- Версия PHP: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `parent_id`, `author`, `message`, `email`, `created_at`, `updated_at`) VALUES
(14, 0, 'Я', 'Первый комментарий', 'stel1989@yandex.ru', '2017-04-13 08:39:23', '2017-04-13 08:39:23'),
(15, 0, 'От я2', 'Сообщение 2', 'stel1989@yandex.ru', '2017-04-13 11:44:12', '2017-04-13 11:44:12'),
(16, 15, 'Я3', 'Овтет1', 'stel1989@yandex.ru', '2017-04-13 12:45:19', '2017-04-13 12:45:19'),
(17, 14, 'Я4', 'Ответ2', 'stel1989@yandex.ru', '2017-04-13 12:46:05', '2017-04-13 12:46:05'),
(18, 16, 'Я5', 'Ответ ответа 1', 'stel1989@yandex.ru', '2017-04-13 12:51:21', '2017-04-13 12:51:21'),
(19, 0, 'Я1', 'Сообщение', 'stel1989@yandex.ru', '2017-04-14 05:10:10', '2017-04-14 05:10:10'),
(20, 0, 'я', 'Сообщение', 'stel1989@yandex.ru', '2017-04-14 05:10:32', '2017-04-14 05:10:32'),
(21, 0, 'Я15', 'Последний тест', 'stel1989@yandex.ru', '2017-04-14 06:14:59', '2017-04-14 06:14:59'),
(22, 0, 'Я15', 'Последний тест', 'stel1989@yandex.ru', '2017-04-14 06:16:24', '2017-04-14 06:16:24'),
(23, 0, 'Я15', 'Последний тест', 'stel1989@yandex.ru', '2017-04-14 06:18:28', '2017-04-14 06:18:28'),
(24, 0, 'Я15', 'Последний тест', 'stel1989@yandex.ru', '2017-04-14 06:29:15', '2017-04-14 06:29:15'),
(25, 24, 'Z16', 'message', 'stel1989@yandex.ru', '2017-04-14 07:07:44', '2017-04-14 07:07:44'),
(26, 24, 'Z16', 'message', 'stel1989@yandex.ru', '2017-04-14 07:11:54', '2017-04-14 07:11:54'),
(27, 26, 'Z17', 'ответ3', 'stel1989@yandex.ru', '2017-04-14 07:24:06', '2017-04-14 07:24:06'),
(28, 0, 'Новый', 'J754623', 'stel1989@yandex.ru', '2017-04-14 07:31:17', '2017-04-14 07:31:17'),
(29, 0, 'Новый', 'J754623', 'stel1989@yandex.ru', '2017-04-14 07:32:38', '2017-04-14 07:32:38');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_04_12_123140_messages', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `facebook_id`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Виталий Шаталов', NULL, '220842205067413', 'https://graph.facebook.com/v2.8/220842205067413/picture?type=normal', '3CvX3pELn9HNH0pv8GjG1pxr3u1FGI5vs3V6LDYPTjSReksNTg3JNfA9De1T', '2017-04-12 06:24:47', '2017-04-12 06:24:47');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_facebook_id_unique` (`facebook_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
