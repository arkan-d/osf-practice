-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июл 17 2014 г., 10:57
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `like12`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('28c7fb2689260be317b584051abf9c0f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405583531, 'a:6:{s:9:"user_data";s:0:"";s:8:"identity";s:15:"admin@admin.com";s:8:"username";s:13:"administrator";s:5:"email";s:15:"admin@admin.com";s:7:"user_id";s:1:"1";s:14:"old_last_login";s:10:"1405581327";}');

-- --------------------------------------------------------

--
-- Структура таблицы `feeds`
--

CREATE TABLE IF NOT EXISTS `feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` text,
  `users_id` int(11) unsigned NOT NULL,
  `favourite` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feeds_users1` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Дамп данных таблицы `feeds`
--

INSERT INTO `feeds` (`id`, `link`, `thumbnail`, `description`, `users_id`, `favourite`) VALUES
(1, 'http://feeds.feedburner.com/ruseller/CdHX?format=xml', NULL, '<p>\r\n	russelersdsd</p>\r\n', 4, 0),
(3, 'http://www.it-stars.ua/informers/news/companies/rss/', 'yuyuyu', '<p>\r\n	it starsal;kdjslkdjasdolkasdjlajlkasdff111111111111111</p>\r\n', 4, 1),
(24, 'ghgh', 'ghghgh', '<p>\r\n	ghghggghghghgh</p>\r\n', 4, 1),
(27, 'ghgsssss', 'hghghg', '<p>\r\n	ghgh</p>\r\n', 4, 1),
(31, 'sdfsdf', 'sdfsdfsdf', '<p>\r\n	sdfsdfsdf</p>\r\n', 5, 1),
(32, 'esrer', 'serrse', '<p>\r\n	srerssdsdsdsdsdsd</p>\r\n', 15, NULL),
(33, 'fsdsdfs', NULL, '<p>\r\n	sdfsdfsdfsdfsdf</p>\r\n', 15, NULL),
(34, 'qqqqqqqqqqqqqqqq', NULL, '<p>\r\n	qdfdfdfdfdfd</p>\r\n', 5, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Структура таблицы `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Структура таблицы `rss_posts`
--

CREATE TABLE IF NOT EXISTS `rss_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `link` varchar(255) DEFAULT NULL,
  `feeds_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rss_posts_feeds1` (`feeds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1405581941, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(4, '127.0.0.1', 'user', '$2y$08$vQKX4PTcZ8r7jDUXkDCCYOXl4SxcJjj4CNxs/4wyP3wY4qC.BQmmO', NULL, 'user@user.com', NULL, NULL, NULL, 'DD0jIrG0QW0zJcmitvAF1e', 1404810260, 1405522466, 1, 'Us', 'ername', '', ''),
(5, '127.0.0.1', 'denys arkan', '$2y$08$7Dr.Wk4vLbVxlLj2QTnkb.rJNUy6PQz.UH6CL3NMndsVuHWVr6SMq', NULL, 'denys.arkan@gmail.com', NULL, NULL, NULL, NULL, 1405498985, 1405498985, 1, 'Denys', 'Arkan', '', ''),
(6, '127.0.0.1', 'dfdfdf dfdfdfd', '$2y$08$bR2iwiQN6VTJWxf2CJRIUuhjv30HX8VYhI8GXSMHHT0BlqTpY5wB2', NULL, 'fdfdf@dfdfdf.com', NULL, NULL, NULL, NULL, 1405502264, 1405502264, 1, 'dfdfdf', 'dfdfdfd', NULL, NULL),
(7, '127.0.0.1', 'denys arkan1', '$2y$08$/w7i6eBA2iSGDsYqwEG02Oc4kl521AATdAFJh795urGYZHZpAs2Ii', NULL, 'dencik@ukr.cpm', NULL, NULL, NULL, NULL, 1405504352, 1405504352, 1, 'denys', 'arkan', NULL, NULL),
(8, '127.0.0.1', 'denys1 arkan1', '$2y$08$JXrG/jQv/HclX4W.bOox7.g.q/C.n99Ju90cFRn2cSYOGP0ljPTxe', NULL, 'dencik1@ukr.cpm', NULL, NULL, NULL, NULL, 1405504570, 1405504570, 1, 'denys1', 'arkan1', NULL, NULL),
(9, '127.0.0.1', 'sdsdsdsds asasasasas', '$2y$08$C7raL/yMtAw6iw5ZzVLzOOjtEw07v6gYgeblZDcyHApHcwY3f0A5C', NULL, 'profiks11.1994@mail.ru', NULL, NULL, NULL, NULL, 1405504618, 1405504618, 1, 'sdsdsdsds', 'asasasasas', NULL, NULL),
(10, '127.0.0.1', 'denys1 sdsdsd', '$2y$08$hAm1UzzDJ.iDKcA6gH2h9ew0zlbjszXCkbeGp1gd1eGVD1O6C5u0e', NULL, 'admiqqn@admin.com', NULL, NULL, NULL, NULL, 1405504959, 1405504959, 1, 'Denys1', 'sdsdsd', NULL, NULL),
(11, '127.0.0.1', 'dfdfdf addadad', '$2y$08$BI6w5.5FtJCP41d8qzk53eySsNo1Ysr4Cnvw6q4nEA6VsN0dYh0KC', NULL, 'prqqqofiks.1994@mail.ru', NULL, NULL, NULL, NULL, 1405505175, 1405505175, 1, 'dfdfdf', 'addadad', NULL, NULL),
(12, '127.0.0.1', 'fgfgfgfg fgfgfgfgf', '$2y$08$lgmm3mqmWWHp5JwDVHjuMeyv6jaJu0mSlJbUtUMB.7U8/4JscVatW', NULL, 'profiqks.1994@mail.ru', '9c55f4620f15236fa7dea5a788ddcdaffc08fdfd', NULL, NULL, NULL, 1405505419, 1405505419, 0, 'fgfgfgfg', 'fgfgfgfgf', NULL, NULL),
(14, '127.0.0.1', 'denys12 arkan', '$2y$08$QuHohl0n9tQv984vMNBEH.9MIVZexv3kakTlNqFN2/cqYtKo4zkz6', NULL, 'user555@user.com', '256fe0986a46e3848f42d8210d9b2ecfc5749e5d', 'Vf7pHowBng9zETCQ-3xr0O8c269c734ddc091883', 1405512800, NULL, 1405512679, 1405512679, 0, 'denys12', 'Arkan', NULL, NULL),
(15, '127.0.0.1', 'sdsdsds sdsdsds', '$2y$08$Wfp2dz.JyH2rDDP7KWc7W.o14hMIQeZhpw/C8Ji41.4SJdJ3cbD4O', NULL, 'denys@arkan.com', NULL, NULL, NULL, NULL, 1405512862, 1405512862, 1, 'sdsdsds1', 'sdsdsds', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(13, 1, 1),
(8, 4, 2),
(20, 5, 1),
(14, 6, 2),
(15, 7, 2),
(16, 8, 2),
(17, 9, 2),
(18, 10, 2),
(19, 11, 2),
(21, 12, 2),
(23, 14, 2),
(26, 15, 2);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `feeds`
--
ALTER TABLE `feeds`
  ADD CONSTRAINT `fk_feeds_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `rss_posts`
--
ALTER TABLE `rss_posts`
  ADD CONSTRAINT `fk_rss_posts_feeds1` FOREIGN KEY (`feeds_id`) REFERENCES `feeds` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
