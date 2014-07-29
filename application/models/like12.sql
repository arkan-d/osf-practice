-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июл 29 2014 г., 14:45
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
('05921da944523647dd8f29c00c039dfa', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1406634302, 'a:6:{s:9:"user_data";s:0:"";s:8:"identity";s:15:"admin@admin.com";s:8:"username";s:13:"administrator";s:5:"email";s:15:"admin@admin.com";s:7:"user_id";s:1:"1";s:14:"old_last_login";s:10:"1406633976";}');

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
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feeds_users1` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=117 ;

--
-- Дамп данных таблицы `feeds`
--

INSERT INTO `feeds` (`id`, `link`, `thumbnail`, `description`, `users_id`, `favourite`, `views`) VALUES
(104, 'http://www.spiegel.de/schlagzeilen/tops/index.rss', NULL, '<p>\r\n	every day is up to date</p>\r\n', 4, 1, 22),
(109, 'http://feeds.feedburner.com/e64f?format=xml', NULL, NULL, 4, 0, 2),
(111, 'http://feeds.visitlondon.com/WhatsOnInLondon?format=xml', NULL, NULL, 4, 0, 2),
(112, 'http://feeds.feedburner.com/ruseller/CdHX?format=xml', NULL, NULL, 4, 0, 4),
(113, 'http://feeds.visitlondon.com/LondonComedyGuide?format=xml', NULL, '<p>\r\n	last description2</p>\r\n', 4, 1, 9),
(114, 'http://www.spiegel.de/schlagzeilen/tops/index.rss', NULL, '<p>\r\n	fgfgfgfgfgfg</p>\r\n', 11, 1, 4),
(115, 'http://feeds.feedburner.com/ruseller/CdHX?format=xml', NULL, NULL, 11, 1, 0),
(116, 'http://www.spiegel.de/schlagzeilen/tops/index.rss', NULL, NULL, 14, 1, 2);

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
(2, 'members', 'General Users');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(4, '127.0.0.1', 'profiks.1994@mail.ru', 1406560857),
(5, '127.0.0.1', 'user@user.com', 1406634251);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1055 ;

--
-- Дамп данных таблицы `rss_posts`
--

INSERT INTO `rss_posts` (`id`, `title`, `description`, `link`, `feeds_id`) VALUES
(250, 'Spreadsheet_Excel_Writer и ограничение в 255 символов для одной ячейки', 'Выполняя очередной проект на работе связанный с генерацией отчета в виде Excel, столкнулся с проблемой, что длинная строка записанная в ячейку обрезается, замерил - оказалось ровно 255 символов.\nТакая длинна не просто так, а зачастую связана со старыми форматами.\nКогда уже все ограничения будут по принципу возможностей железки - мечты, мечты &#8230;\n\nНемного погуглил. Все таки буржуи молодцы, [...]', 'http://www.e64f.ru/?p=342', 109),
(251, 'Осторожно! Торговцы ссылками …', 'На что только не идут люди чтобы нарастить ссылочную массу своего сайта. Спамят блоги, форумы, сервисы закладок и т.д. Некоторые пытаются втиснуть свою ссылку делая что нибудь полезное, например изготовят для какого нибудь вордпресса полезный модуль и ссылку свою в нем же. Если аддон пользуется популярностью, автору обеспечен и яндекс.ТиЦ и гугл.ПР, а это все [...]', 'http://www.e64f.ru/?p=334', 109),
(252, 'Обучающий видео курс по JQuery', 'В последние пару лет в арсенале знаний и умений веб. разработчика стало предпочтительным владеть чем нибудь из javascript фреймворков, например: MooTools, Dojo ToolKit, ProtoType, JQuery.\nИз всего этого списка мне наиболее симпатичен фреймворк JQuery за лакониничность и функциональность.\nСобственно речь о том что я нашел неплохое обучающее видео по JQuery.\n\nНазвание: Курс по JQuery\nАвтор: Хомич Денис\nДанный курс бесплатен. [...]', 'http://www.e64f.ru/?p=331', 109),
(253, 'Иппотерапия - продолжение идеи …', 'Недавно побывал на даче у коллеги по работе. Мы там значит затеяли пиво, шашлыки, прогулка. Дача находится в некотором удалении от нашего загазованного города, аж на 22 километре в горах, лесах и на берегу реки Ульба - живописный район.\nПримечательно, что неподалеку некие товарищи организовали конную станцию, со спокойными лошадками, строениями под старину из камня и [...]', 'http://www.e64f.ru/?p=327', 109),
(254, 'Моя идея - клавиатура', 'Есть такой прикол - изобрести что нибудь, а потом всю жизнь безбедно жить на отчисления занимаясь чем душе угодно. Есть варианты - написать популярную песню (живой пример песенка Отель Калифорния), или там книгу написать по типу Гарри Потер и какая нибудь хрень. В общем если твоя придумка пошла в тираж ты в шоколаде на долгие [...]', 'http://www.e64f.ru/?p=323', 109),
(255, 'Экперимент поискового продвижения низкочастотников через Маремото', 'Никакой определенной цели, кроме как посмотреть и оценить что такое маремото я не ставил. Единственное прикидывал что потом буду так продвигать своим заказчикам. Итого потрачено 1500 рублей.\nИтак в двух словах, что такое маремото &#8230;\n\nМаремото - автоматизированный сервис по продвижению низкочастотников в топ 10.\nСобственно как все происходит. Скармливаете маремоте урл продвигаемого сайта, а он сканирует и [...]', 'http://www.e64f.ru/?p=319', 109),
(256, 'Эксперимент по продвижению статьями завершен', 'Результатом моего первого опыта продвижения статьями стало:\n\nРост ТИЦ с 0 до 10\nРост общего трафика с 300 до 400 уников в день\nРост уников по двум целевым (продающим) запросам с 3-5 (1-3) в день до 30-40 (20-30)\n\nСобственно ожидал большего, но с учетом того что база сайтов принимающих статьи была не очень хороша, все в рамках адекватности. Во [...]', 'http://www.e64f.ru/?p=317', 109),
(257, 'Думал сбой кеширования, а оказалось …', 'На сайте http://www.only-poker.ru/ я разместил рекламу Google-Adsense, но недавно узнал что на сайтах по  азартным играм нельзя размещать адсенс. Решил убрать эту рекламу, и убрал, но она все равно присутствовала на  сайте если смотреть из дома. Пробовал менять заголовки опять же никаких изменений в браузере.\n\nПробовал делать:\n\nF5\nCtrl+F5\nЧистить  временные файлы\nРазные браузеры (FireFox 3.6, InternetExplorer [...]', 'http://www.e64f.ru/?p=313', 109),
(258, 'Первые впечатления от использования Data Life Engine (DLE)', 'Решил на одном из своих проектов использовать в качестве движка DLE, как бы нужно для проекта статьи тискать по категориям т.е. dle это поддерживает и слишком эта cms распространенная, надо с ней разобраться, пригодится для фриланса, своих проектов и общего развития.\nСкачал нуленую версию от M.I.D Team, залил на хост, стартанул install.php &#8230;\n\nВо время инсталяции сделал [...]', 'http://www.e64f.ru/?p=311', 109),
(259, 'Продвижение статьями', 'Наверное многие продвиженцы согласны, что продвижение статьями есть хорошо, якобы поисковики лучше воспринимают внешние ссылки в больших массивах текста (статьях) и хуже в малых (комментах). Некоторые жалуются, что продвигать статьями накладно, т.к. писать пару сотен уникальных статей объемом 1-2 тысячи знаков сам заколебаешься, а заказывать денег стоит умноженных на эту пару сотен статей. Хотя если [...]', 'http://www.e64f.ru/?p=309', 109),
(336, 'IAAF World Athletics Championships 2017', 'Watch the world''s best athletes compete at London''s majestic Olympic Stadium in the summer of 2017. Aug 2017	 	 ', 'http://www.visitlondon.com/things-to-do/event/29351280', 111),
(337, 'London Jazz Festival 2014', 'Don''t miss this feast of music which brings the biggest names in jazz to a variety of London venues. 14-23 Nov	 	 ', 'http://www.visitlondon.com/things-to-do/event/23630785', 111),
(338, 'The Lord Mayor''s Show', 'Enjoy everything from samba dancing to marching bands at London''s annual Lord Mayor''s Show. 8 Nov	 	 ', 'http://www.visitlondon.com/things-to-do/event/7426531', 111),
(339, 'Sherlock Holmes at the Museum of London', 'A study of the greatest detective of them all, Sherlock Holmes, and his relationship with London. 17 Oct-12 Apr	 	 ', 'http://www.visitlondon.com/things-to-do/event/35655157', 111),
(340, 'London Restaurant Festival', 'A celebration of fabulous foodie events and special festival menus in London restaurants. Oct	 	 ', 'http://www.visitlondon.com/things-to-do/event/26845936', 111),
(341, 'London Design Festival 2014', 'Explore the fascinating world of design at the 12th London Design Festival, at venues across London. 13-21 Sep	 	 ', 'http://www.visitlondon.com/things-to-do/event/7428457', 111),
(342, 'Late Turner: Painting Set Free at Tate Britain', 'A look at the innovative work produced by Turner in his later years. 10 Sept-25 Jan	 	 ', 'http://www.visitlondon.com/things-to-do/event/31498258', 111),
(343, 'Epstein: The Man Who Made The Beatles at Leicester Square Theatre', 'A two hander play examining the private life of the man who managed The Beatles. 5 Aug-6 Sep	 Book online: http://visitlondon.entstix.com/tickets/epstein-the-man-who-made-the-beatles	 ', 'http://www.visitlondon.com/things-to-do/event/33427557', 111),
(344, 'Sunny Afternoon at The Harold Pinter Theatre', 'Be transported back to the mid-1960s as the music of Ray Davies and The Kinks is brought to life on stage. 4 Oct-29 Nov	 	 ', 'http://www.visitlondon.com/things-to-do/event/38929914', 111),
(345, 'Little Creatures Family Festival at ZSL London Zoo', 'Enjoy a weekend of family fun in celebration of the bear that inspired Winnie the Pooh, at ZSL London Zoo. 29-31 Aug	 	 ', 'http://www.visitlondon.com/things-to-do/event/3894311', 111),
(346, 'Wome Fashion, Power at Design Museum', 'See how fashion choices have influenced the world''s most powerful women, from Lady Thatcher to Lady Gaga. 29 0ct-26 Apr	 	 ', 'http://www.visitlondon.com/things-to-do/event/36245325', 111),
(347, 'Cats the Musical at London Palladium', 'Book to see Cats at the London Palladium, as the lively musical returns to the West End stage after 14 years. 6 Dec-28 Jan	 Book online: http://visitlondon.eolts.co.uk/index.php?pg=72&action=show&showid=1022	 ', 'http://www.visitlondon.com/things-to-do/event/39005031', 111),
(348, 'Chinatown Family Day', 'Don''t miss Chinatown''s first-ever Family Day! Free to attend, there are plenty of Chinese-themed activities for kids. 27 Jul	 	 ', 'http://www.visitlondon.com/things-to-do/event/39093621', 111),
(349, 'Revolution Series', 'The world''s biggest track cycling league, The Revolution Series, returns to London for the 2014/2015 season. 24-25 Oct	 	 ', 'http://www.visitlondon.com/things-to-do/event/39067711', 111),
(350, 'Revolution Series', 'The world''s biggest track cycling league, The Revolution Series, returns to London for the 2014/2015 season. 27-28 Feb	 	 ', 'http://www.visitlondon.com/things-to-do/event/39067715', 111),
(351, 'EuroHockey Championships 2015', 'Over the course of a week, 40 matches will end in two dramatic finals days, which you won’t want to miss. 21-30 Aug	 	 ', 'http://www.visitlondon.com/things-to-do/event/39055544', 111),
(352, 'The Infidel – The Musical at Theatre Royal Stratford East', 'See the stage version of David Baddiel’s hit film The Infidel at Theatre Royal Stratford East. 3 Oct-2 Nov	 	 ', 'http://www.visitlondon.com/things-to-do/event/39018024', 111),
(353, 'Enrique Iglesias at The 02', 'Listen to new and classic romance and hits tunes from the global latin and pop star at The O2 Arena. 28 Nov	 Book online: http://www.ticketmaster.co.uk/event/35004CCCEE10934D	 ', 'http://www.visitlondon.com/things-to-do/event/38803994', 111),
(354, 'City of Angels at Donmar Warehouse', 'The bright lights of Hollywood beckon for a novelist whose life is changed when he writes for the big screen. 5 Dec-7 Feb	 	 ', 'http://www.visitlondon.com/things-to-do/event/39018030', 111),
(355, 'Lord Of The Dance: Dangerous Games at London Palladium', 'Irish dance legend Michael Flatley returns to the London stage, for the final time, with a thrilling dance show. 1 Sep-25 Oct	 	 ', 'http://www.visitlondon.com/things-to-do/event/38765627', 111),
(356, 'Совет: меняем поведение относительных URL с помощью тега base', 'HTML тег base - относительно малоизвестный тег, который не так давно стал частью HTML5.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/B73y3TAns48" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/B73y3TAns48/lessons.php', 112),
(357, 'Превосходство Google Chrome', 'Google Chrome - один из крупнейших современных игроков в Вебе. Он быстрый, надежный, напичкан различными функциями, а также очень полезный, особенно если вы - веб-разработчик. Chrome также позволяет устанавливать сторонние расширения. Эти расширения пишутся на чистом HTML, CSS и JavaScript. Команда Google делает большую работу. В данной статье мы рассмотрим несколько полезных инструментов Chrome, которые могут помочь в процессе разработки.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/K9IZGPuO7rw" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/K9IZGPuO7rw/lessons.php', 112),
(358, 'Построитель динамического меню на Bootstrap 3: элемент и ссылка', 'В первой части статьи мы описали прототип системы и реализовали основной класс Menu, который играет роль менеджера меню - контейнер, содержащий составные единицы (элементы и ссылки). В этой части мы реализуем оставшиеся классы, и попробуем построитель меню в действии.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/opsGb7Dd6k0" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/opsGb7Dd6k0/lessons.php', 112),
(359, 'Построитель динамического меню на Bootstrap 3: менеджер меню', 'В данной статье я расскажу о том, как можно реализовать построитель динамического меню на PHP. Это урок из двух статей, в первой статье мы фокусируемся на демонстрационном коде и классе Menu, а во второй статье рассказывается о других классах и примерах использования.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Xx_gZasPpUo" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Xx_gZasPpUo/lessons.php', 112),
(360, 'Всесторонний обзор элемента track из HTML5', 'После прочтения статьи вы будете знать, как можно добавить синхронизированные дорожки к вашим медиафайлам, вроде субтитров. Также вы узнаете, как с их помощью улучшить поисковую оптимизацию (SEO) вашего сайта.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/2h6bffzppe0" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/2h6bffzppe0/lessons.php', 112),
(361, 'HTML5 валидация форм на стороне клиента', 'Ранее валидацию на стороне клиента можно было провести только с помощью JavaScript. Но все изменилось (или почти изменилось), так как с помощью HTML5 валидацию можно проводить средствами браузера, без необходимости писать сложные скрипты для валидации на JavaScript.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/zoxFqj9vofs" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/zoxFqj9vofs/lessons.php', 112),
(362, '6 золотых правил дизайна в электронной коммерции', 'Сегодняшняя статья раскроет основные моменты дизайна процесса покупки, включая оформление корзины, и общий процесс оформления и оплаты заказа.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/H0AWhdfyZp8" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/H0AWhdfyZp8/lessons.php', 112),
(363, 'Отладка e-mail с помощью MailCatcher', 'Вы ведь занимаетесь отправкой писем в своих приложениях, не так ли? Вообще-то это риторический вопрос. Конечно же да. Несмотря на то, что электронной почте уже более тридцати лет, она все еще остается самым популярным приложением на планете.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/bblh62eFc9Q" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/bblh62eFc9Q/lessons.php', 112),
(364, '4 простых способа реализации адаптивной сеточной разметки', 'В наши дни для всего есть фреймворки, и кажется, что только вы разберетесь с одним, как на смену ему придет другой. Это особенно касается CSS фреймворков для адаптивной сетки, и каждый называет себя “самым лучшим”. Такой переизбыток информации вводит в замешательство.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/tb_X45EznsQ" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/tb_X45EznsQ/lessons.php', 112),
(365, 'Реализуем эффект мозаичного слайдшоу', 'Руководство по воссозданию эффекта слайдшоу из четырех плиток, подсмотренного на сайте Serge Thoroval. С помощью 3D трансформаций, переходов и анимаций мы реализуем плавный, приятный эффект, вдобавок сделаем еще пару вариантов эффектов.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/S9YN9diJL3A" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/S9YN9diJL3A/lessons.php', 112),
(366, 'Последнее “прощай”, или как закрыть провальный проект', 'В этой статье описаны основные шаги, которые необходимо предпринять при закрытии вашего продукта, и как донести до пользователя сей печальный факт. Отмечу, что данная статья относится к моменту закрытия продукта или сервиса. Мы не говорим о моменте закрытия компании в целом.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/ci1Ioj4WUb4" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/ci1Ioj4WUb4/lessons.php', 112),
(367, 'Переход по страницам с помощью горячих клавиш', 'Мы, люди, которые делают сайты, должны делать их максимально удобными в использовании, в том числе используя клавиатуру. В этом уроке рассмотрим плагин, с помощью которого можно осуществить переход по страницам с помощью горячих клавиш.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/O68bbi0RgMY" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/O68bbi0RgMY/lessons.php', 112),
(368, 'Включаем дополнительные возможности PhpMyAdmin', 'Когда дело доходит до управления базами данных, очень часто приходится пользоваться утилитой PhpMyAdmin. И в стандартной поставке с его помощью можно делать очень много всего. Но, как бы то ни было, у него есть ряд полезных возможностей, которые можно включить отдельно. В этой статье мы раскроем дополнительные возможности PhpMyAdmin, и посмотрим, чем они могут быть нам полезны.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/_gFTFkb_ieU" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/_gFTFkb_ieU/lessons.php', 112),
(369, 'Идея для классных ховер-эффектов', 'Вашему вниманию представляем набор прикольных ховер-эффектов, в работе которых используются современные CSS техники и 3D эффекты.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/L1_FehwsLHY" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/L1_FehwsLHY/lessons.php', 112),
(370, 'Системы контроля версий и анализ изменений', 'Каждый проект состоит из бесчисленного числа маленьких изменений. В конечном итоге, они формируют сайт, приложение, или какой-либо другой продукт. Ваша система контроля версий следит за этими изменениями. Но как только вы поймете, как их читать - вы сможете отслеживать прогресс вашего проекта.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Xv0vr1OZuwM" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Xv0vr1OZuwM/lessons.php', 112),
(371, 'Формы HTML5: CSS', 'Во второй статье серии из трех статей о формах HTML5 я собираюсь познакомить вас со стилизацией, а точнее - о селекторах псевдоклассов, которые можно использовать для стилизации элементов формы в различном своем состоянии.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Q_mc5uTkazY" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Q_mc5uTkazY/lessons.php', 112),
(372, 'Формы HTML5: разметка', 'Это первая из трех статей о веб-формах HTML5. Перед тем, как перейти к стилизации и JavaScript-валидации на стороне клиента, мы рассмотрим основную разметку. Я рекомендую вам прочесть эту статью, даже если вы уже знакомы с формами - здесь описано множество новых атрибутов и плюшек!<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/HiRvRc4VJK8" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/HiRvRc4VJK8/lessons.php', 112),
(373, 'Полное руководство по размещению меток для элементов формы', 'Полное описание по размещению меток для элементов форм.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/SBp3BDexE7M" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/SBp3BDexE7M/lessons.php', 112),
(374, '4 ошибки, которые могут сорвать запуск сайта', 'Сегодня я расскажу о четырех наиболее распространенных ошибках, которые могут разрушить сайт, и как можно с ними бороться, чтобы запуск вашего сайта был успешен.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/EF8m6g33Apw" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/EF8m6g33Apw/lessons.php', 112),
(375, 'Воссоздаем эффект подгрузки сеткой в стиле “Design Samsung”', 'Если вы уже успели увидеть сайт Корпоративного Дизайнерского Центра Samsung, то, скорее всего, вы обратили внимание на стильный и симпатичный эффект загрузки сетки элементов. Повторим данный эффект.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/hR0Iz67TZGU" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/hR0Iz67TZGU/lessons.php', 112),
(376, '40 CSS приложух, инструментов и ресурсов для веб разработчиков', 'Ещё один набор из наиполезнейших CSS сервисов.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Y2XspC5Gicg" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Y2XspC5Gicg/lessons.php', 112),
(377, 'HTML5: API работы с вибрацией', 'HTML5 - глоток свежего воздуха в современном вебе. Она повлиял не только на классический веб, каким мы знаем его сейчас. HTML5 предоставляет разработчикам ряд API для создания и улучшения сайтов с ориентацией на мобильные устройства. В этой статье мы рассмотрим API для работы с вибрацией.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/MBE3CFOUJAA" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/MBE3CFOUJAA/lessons.php', 112),
(378, 'Создаем CSS-анимации с помощью Move.js', 'На данный момент предпочтительным способом создания легких анимаций на сайтах является использование CSS3 переходов и анимаций. К сожалению, многие разработчики считают, что их синтаксис получается сложным и запутанным. Если так же считаете и вы, то, возможно, выходом для вас будет библиотека Move.js. Move.js - простая JavaScript библиотека для создания CSS3 анимаций с использованием простых функций. В этом руководстве описан основной синтаксис Move.js, а также небольшая демонстрация его использования.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Q9AeBt8xZqs" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Q9AeBt8xZqs/lessons.php', 112),
(379, '35 сайтов, использующих в дизайне плоские изображения и иконки', 'Несколько примеров для обмена опыта и получения вдохновения.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/OtgtMQ7kV8w" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/OtgtMQ7kV8w/lessons.php', 112),
(380, 'Работа с датой и временем с помощью Moment.js', 'Работа с датой и временем зачастую весьма обременительна. Я всегда считал, что отдельная JavaScript библиотека для манипуляции датами была бы очень полезной. Не так давно я познакомился с замечательной библиотекой Moment.js, позволяющей валидировать, парсить и управлять датами и временем.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/1hkk1fxoXNI" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/1hkk1fxoXNI/lessons.php', 112),
(381, 'Адаптивный дизайн начинается с URL', 'В данной статье мы рассматриваем адаптивную переработку страниц программ канала BBC.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/2Wm8M5t5ul0" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/2Wm8M5t5ul0/lessons.php', 112),
(382, 'Стили для стрелок навигации', 'Сегодня мы подготовили для вас несколько демок интересных примеров стрелок, которые можно применить для навигации слайдера.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/p-mPlraxs_E" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/p-mPlraxs_E/lessons.php', 112),
(383, 'Учимся фокусироваться на элементах страницы', 'В этом примере я предлагаю вам представить, что вы хотите улучшить навигацию на текущей странице так, что вместо резкого перехода к ссылке-якорю, вы плавно перемещаете пользователя к месту назначения посредством JavaScript анимации scrollTop.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/7cg1a2ifqH8" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/7cg1a2ifqH8/lessons.php', 112),
(384, 'Знакомство с Valentina', 'Valentina - набор инструментов, включающий: Valentina DB (новый SQL-сервер), Valentina Studio (инструмент управления базами данных), Valentina Report (графическая утилита для генерации отчетов, которые могут быть использованы в приложениях, например PHP) и связанный с ними набор инструментов разработки (называемый ADK).<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/QEYMJ0SSu_c" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/QEYMJ0SSu_c/lessons.php', 112),
(385, '34 примера адаптивных портфолио', 'В этой подборке вас ждёт несколько десятков примеров адаптивных портфолио. Не забудьте поиграть с размером окна при просмотре данных страниц.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/b-NgIPR3wTc" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/b-NgIPR3wTc/lessons.php', 112),
(386, 'Wholly: делаем таблицы читабельными', 'Данный jQuery плагин обрабатывает события mouseenter и mouseleave. Используется для подсветки элементов таблиц в зависимости от атрибутов colspan и rowspan.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/v-EWQBVpT8M" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/v-EWQBVpT8M/lessons.php', 112),
(387, 'Git для начинающих', 'Противостояние изменениям - основная черта человека. Если в то время, когда вы начинали работу с системами контроля версий, не было Git - весьма вероятно, что вы начинали с Subversion. Часто люди говорят, что Git слишком сложен для начинающих. Тем не менее, я позволю себе с вами не согласиться.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/lkxi4iLgfpQ" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/lkxi4iLgfpQ/lessons.php', 112),
(388, '9 способов локализации веб-сайта', 'Так как ваш сайт могут просматривать посетители со всего мира, необходимо сохранить суть и подачу вашего бренда, из какой страны бы ни просматривался ваш сайт.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/cZ8T0LFaX_g" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/cZ8T0LFaX_g/lessons.php', 112),
(389, '15 сервисов конвертации из PSD в HTML', 'Ещё одна наиполезнейшая подборка сервисов с помощью которых вы сможете с лёгкостью конвертировать PSD файл в полноценную HTML страницу.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/m4F15Blf7jk" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/m4F15Blf7jk/lessons.php', 112),
(390, '38 бесплатных CSS наработок выпадающих меню', 'Навигация - неотъемлемая часть любого сайта. В этой статье вы найдёте подборку из множества готовых решений, которые могут вам пригодиться.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Rm0NVP45huI" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Rm0NVP45huI/lessons.php', 112),
(391, 'Горячие скрипты: проверка успешности загрузки страницы', 'Когда-то перед вами может возникнуть задача проверки загрузки страницы со статусом ОК (200). В этой статейке вы сможете найти одно из возможных решений.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/zSwshv8mLEk" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/zSwshv8mLEk/lessons.php', 112),
(392, 'Введение в механизм Веб-оповещений', 'Время соединений на скорости 56k уже стерлось из людской памяти (первыми не выдержали пользователи мобильных устройств). Это было время, когда браузеры могли открывать только одну вкладку в окне, и никто даже и представить себе не мог просмотр сайтов в нескольких вкладках. Сегодня на нас свалились все эти социальные сети, посты, ответы, комментарии, фотографии, видео, и много чего еще. Было создано несколько систем, которые пришли на смену необходимости проверять каждую вкладку на предмет новой активности. Одним из таких способов явилась система оповещений, которые широко распространены на различных сайтах.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/E8c9EHjUj6Q" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/E8c9EHjUj6Q/lessons.php', 112),
(393, 'Делаем кнопку-индикатор прогресса в виде кольца', 'Урок, показывающий, как можно претворить в жизнь концепцию кнопки индикатора прогресса в виде кольца, предложенную Колином Гарвеном. Для анимации прогресса в виде заполнения кольца будем использовать технику анимации линии в SVG, описанную Джейком Арчибальдом, а также будем отображать кнопку в успешном и ошибочном состояниях.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/15ZneBlmL2I" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/15ZneBlmL2I/lessons.php', 112),
(394, '36 Bootstrap сниппетов', 'Предлагаем вашему вниманию целый набор из Bootstrap сниппетов, где каждый сможет найти что-то полезное для себя.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/2xlKt-hhBf4" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/2xlKt-hhBf4/lessons.php', 112),
(395, 'Разбираем Underscore.js по косточкам. Метод some', 'Продолжаем разбирать библиотеку underscore и в этой посте посмотрим как работать с методом some.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/PKL9Wx6ys-A" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/PKL9Wx6ys-A/lessons.php', 112),
(396, 'Делаем простой переключатель стилей', 'В данном уроке я покажу, как создать простой переключатель стилей, а также хранить настройки пользователя в локальном хранилище.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/dS3DrcgUiZM" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/dS3DrcgUiZM/lessons.php', 112),
(397, 'Горячие скрипты: как объединить несколько изображений при помощи PHP', 'В этом посте мы рассмотрим небольшой PHP, который выполняет следующую задачу: объединяет два изображения и отображает в видео одного.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Ut_uFPkQEEs" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Ut_uFPkQEEs/lessons.php', 112),
(398, 'Оптимизация конфигурации MySQL', 'MySQL - наиболее используемый движок баз данных в мире PHP. Поэтому для быстрорастущих веб-приложений очень важно знать, что ваши базы данных MySQL работают настолько хорошо, насколько это вообще возможно.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/X9Xmtttyr1E" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/X9Xmtttyr1E/lessons.php', 112),
(399, 'Как распланировать свой следующий мобильный электронный магазин', 'В этой статье мы рассмотрим все основные шаги планирования мобильного электронного магазина с высокой конверсией.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/eDWHcaruBg8" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/eDWHcaruBg8/lessons.php', 112),
(400, 'Аутентификация через Twitter', 'Привет, друзья! Да, да, да, наконец дошли руки до долгожданного урока, о котором просили многие из вас: реализации аутентификации через Twitter.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/SfsdXttgP00" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/SfsdXttgP00/lessons.php', 112),
(401, 'Новые атрибуты HTML5 для ссылок: download, media и ping', 'Ссылки были введены еще на заре веба. Но с расцветом HTML5 к так хорошо знакомым ссылкам были добавлены новые атрибуты, которые призваны составить компанию уже знакомым атрибутам href и rel.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/kHt71qBUkJ4" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/kHt71qBUkJ4/lessons.php', 112),
(402, 'Оптимизация индексов MySQL', 'MySQL - наиболее широко используемая в связке с PHP СУБД. Забота о том, что ваши базы данных MySQL работают настолько хорошо, насколько это вообще возможно - наиважнейший аспект залога хорошей работы растущего приложения.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/wFxLqAJKhZw" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/wFxLqAJKhZw/lessons.php', 112),
(403, '3D-эффект для сетки элементов', 'Воссоздание эффекта анимации, увиденного в приложении Маркуса Экхерта. Идея - переворачивать элемент сетки в пространстве, раскрывая блок на весь экран, и в итоге отображать некоторое содержимое, ассоциированное с элементом. Мы создали две демки, с вертикальным и горизонтальным поворотом.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/IWWBrvXAHqY" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/IWWBrvXAHqY/lessons.php', 112),
(404, 'Делаем “ленивую” прокрутку на jQuery', 'В этой статье мы поговорим о другом подходе - “ленивой” прокрутке, также известной под названием “бесконечной прокрутки” и “отказом от пагинации”. С помощью этой техники подгрузка контента производится с помощью AJAX, когда пользователь прокручивает страницу до места, где загруженный контент заканчивается.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/_acsf4IFKoc" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/_acsf4IFKoc/lessons.php', 112),
(405, 'Animate.Css – CSS3 Библиотека для создания анимации', 'За последние несколько лет в CSS появилось множество интересных фишек, которые делают веб разработку более увлекательной. Одной из таких вещей является CSS3 анимация. До CSS3, анимацию можно было реализовать только с помощью Javascript.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/tUlKqU_L7KA" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/tUlKqU_L7KA/lessons.php', 112),
(406, 'Stewart Lee’s Much A-Stew About Nothing at the Royal Festival Hall', 'Stewart Lee embarks upons a stand-up marathon, with some brand new material, at the Royal Festival Hall. 8-9 Feb	 	 ', 'http://www.visitlondon.com/things-to-do/event/34298994', 113),
(407, 'Lee Evans at The O2', 'Energetic comedian Lee Evans is performing his latest side-splitting material at The O2 in 2014. 26-27 Sep & 3-4 Oct	 	 ', 'http://www.visitlondon.com/things-to-do/event/30326695', 113),
(408, 'Miranda Hart: My, What I Call, Live Show at The O2', 'Don''t miss Miranda Hart live at London''s O2 Arena. There will be galloping and "such fun". 19 Oct	 Book online: http://www.ticketmaster.co.uk/event/35004CC3E7A5A3F0	 ', 'http://www.visitlondon.com/things-to-do/event/39018019', 113),
(409, 'Brick Lane Comedy Festival', 'See a fantastic line-up of world-class comedians alongside live music and local food in 2014	 	 ', 'http://www.visitlondon.com/things-to-do/event/25768059', 113),
(410, 'Afternoon Tease at Volupté', 'A burlesque afternoon tea event at sumptuous London cabaret venue Volupté. Various dates	 	 ', 'http://www.visitlondon.com/things-to-do/event/13664960', 113),
(411, '99 Club Leicester Square', 'Laughs for your weekend at Leicester Square''s 99 Club. Bring your pals and your sense of humour!	 	 ', 'http://www.visitlondon.com/things-to-do/event/973478', 113),
(412, 'Old Rope', 'Award winning comedian Phil Nichol presents a weekly comedy night at The Phoenix. Every Monday	 	 ', 'http://www.visitlondon.com/things-to-do/event/6866216', 113),
(738, 'Совет: меняем поведение относительных URL с помощью тега base', 'HTML тег base - относительно малоизвестный тег, который не так давно стал частью HTML5.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/B73y3TAns48" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/B73y3TAns48/lessons.php', 115),
(739, 'Превосходство Google Chrome', 'Google Chrome - один из крупнейших современных игроков в Вебе. Он быстрый, надежный, напичкан различными функциями, а также очень полезный, особенно если вы - веб-разработчик. Chrome также позволяет устанавливать сторонние расширения. Эти расширения пишутся на чистом HTML, CSS и JavaScript. Команда Google делает большую работу. В данной статье мы рассмотрим несколько полезных инструментов Chrome, которые могут помочь в процессе разработки.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/K9IZGPuO7rw" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/K9IZGPuO7rw/lessons.php', 115),
(740, 'Построитель динамического меню на Bootstrap 3: элемент и ссылка', 'В первой части статьи мы описали прототип системы и реализовали основной класс Menu, который играет роль менеджера меню - контейнер, содержащий составные единицы (элементы и ссылки). В этой части мы реализуем оставшиеся классы, и попробуем построитель меню в действии.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/opsGb7Dd6k0" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/opsGb7Dd6k0/lessons.php', 115),
(741, 'Построитель динамического меню на Bootstrap 3: менеджер меню', 'В данной статье я расскажу о том, как можно реализовать построитель динамического меню на PHP. Это урок из двух статей, в первой статье мы фокусируемся на демонстрационном коде и классе Menu, а во второй статье рассказывается о других классах и примерах использования.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Xx_gZasPpUo" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Xx_gZasPpUo/lessons.php', 115);
INSERT INTO `rss_posts` (`id`, `title`, `description`, `link`, `feeds_id`) VALUES
(742, 'Всесторонний обзор элемента track из HTML5', 'После прочтения статьи вы будете знать, как можно добавить синхронизированные дорожки к вашим медиафайлам, вроде субтитров. Также вы узнаете, как с их помощью улучшить поисковую оптимизацию (SEO) вашего сайта.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/2h6bffzppe0" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/2h6bffzppe0/lessons.php', 115),
(743, 'HTML5 валидация форм на стороне клиента', 'Ранее валидацию на стороне клиента можно было провести только с помощью JavaScript. Но все изменилось (или почти изменилось), так как с помощью HTML5 валидацию можно проводить средствами браузера, без необходимости писать сложные скрипты для валидации на JavaScript.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/zoxFqj9vofs" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/zoxFqj9vofs/lessons.php', 115),
(744, '6 золотых правил дизайна в электронной коммерции', 'Сегодняшняя статья раскроет основные моменты дизайна процесса покупки, включая оформление корзины, и общий процесс оформления и оплаты заказа.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/H0AWhdfyZp8" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/H0AWhdfyZp8/lessons.php', 115),
(745, 'Отладка e-mail с помощью MailCatcher', 'Вы ведь занимаетесь отправкой писем в своих приложениях, не так ли? Вообще-то это риторический вопрос. Конечно же да. Несмотря на то, что электронной почте уже более тридцати лет, она все еще остается самым популярным приложением на планете.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/bblh62eFc9Q" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/bblh62eFc9Q/lessons.php', 115),
(746, '4 простых способа реализации адаптивной сеточной разметки', 'В наши дни для всего есть фреймворки, и кажется, что только вы разберетесь с одним, как на смену ему придет другой. Это особенно касается CSS фреймворков для адаптивной сетки, и каждый называет себя “самым лучшим”. Такой переизбыток информации вводит в замешательство.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/tb_X45EznsQ" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/tb_X45EznsQ/lessons.php', 115),
(747, 'Реализуем эффект мозаичного слайдшоу', 'Руководство по воссозданию эффекта слайдшоу из четырех плиток, подсмотренного на сайте Serge Thoroval. С помощью 3D трансформаций, переходов и анимаций мы реализуем плавный, приятный эффект, вдобавок сделаем еще пару вариантов эффектов.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/S9YN9diJL3A" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/S9YN9diJL3A/lessons.php', 115),
(748, 'Последнее “прощай”, или как закрыть провальный проект', 'В этой статье описаны основные шаги, которые необходимо предпринять при закрытии вашего продукта, и как донести до пользователя сей печальный факт. Отмечу, что данная статья относится к моменту закрытия продукта или сервиса. Мы не говорим о моменте закрытия компании в целом.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/ci1Ioj4WUb4" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/ci1Ioj4WUb4/lessons.php', 115),
(749, 'Переход по страницам с помощью горячих клавиш', 'Мы, люди, которые делают сайты, должны делать их максимально удобными в использовании, в том числе используя клавиатуру. В этом уроке рассмотрим плагин, с помощью которого можно осуществить переход по страницам с помощью горячих клавиш.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/O68bbi0RgMY" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/O68bbi0RgMY/lessons.php', 115),
(750, 'Включаем дополнительные возможности PhpMyAdmin', 'Когда дело доходит до управления базами данных, очень часто приходится пользоваться утилитой PhpMyAdmin. И в стандартной поставке с его помощью можно делать очень много всего. Но, как бы то ни было, у него есть ряд полезных возможностей, которые можно включить отдельно. В этой статье мы раскроем дополнительные возможности PhpMyAdmin, и посмотрим, чем они могут быть нам полезны.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/_gFTFkb_ieU" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/_gFTFkb_ieU/lessons.php', 115),
(751, 'Идея для классных ховер-эффектов', 'Вашему вниманию представляем набор прикольных ховер-эффектов, в работе которых используются современные CSS техники и 3D эффекты.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/L1_FehwsLHY" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/L1_FehwsLHY/lessons.php', 115),
(752, 'Системы контроля версий и анализ изменений', 'Каждый проект состоит из бесчисленного числа маленьких изменений. В конечном итоге, они формируют сайт, приложение, или какой-либо другой продукт. Ваша система контроля версий следит за этими изменениями. Но как только вы поймете, как их читать - вы сможете отслеживать прогресс вашего проекта.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Xv0vr1OZuwM" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Xv0vr1OZuwM/lessons.php', 115),
(753, 'Формы HTML5: CSS', 'Во второй статье серии из трех статей о формах HTML5 я собираюсь познакомить вас со стилизацией, а точнее - о селекторах псевдоклассов, которые можно использовать для стилизации элементов формы в различном своем состоянии.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Q_mc5uTkazY" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Q_mc5uTkazY/lessons.php', 115),
(754, 'Формы HTML5: разметка', 'Это первая из трех статей о веб-формах HTML5. Перед тем, как перейти к стилизации и JavaScript-валидации на стороне клиента, мы рассмотрим основную разметку. Я рекомендую вам прочесть эту статью, даже если вы уже знакомы с формами - здесь описано множество новых атрибутов и плюшек!<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/HiRvRc4VJK8" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/HiRvRc4VJK8/lessons.php', 115),
(755, 'Полное руководство по размещению меток для элементов формы', 'Полное описание по размещению меток для элементов форм.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/SBp3BDexE7M" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/SBp3BDexE7M/lessons.php', 115),
(756, '4 ошибки, которые могут сорвать запуск сайта', 'Сегодня я расскажу о четырех наиболее распространенных ошибках, которые могут разрушить сайт, и как можно с ними бороться, чтобы запуск вашего сайта был успешен.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/EF8m6g33Apw" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/EF8m6g33Apw/lessons.php', 115),
(757, 'Воссоздаем эффект подгрузки сеткой в стиле “Design Samsung”', 'Если вы уже успели увидеть сайт Корпоративного Дизайнерского Центра Samsung, то, скорее всего, вы обратили внимание на стильный и симпатичный эффект загрузки сетки элементов. Повторим данный эффект.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/hR0Iz67TZGU" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/hR0Iz67TZGU/lessons.php', 115),
(758, '40 CSS приложух, инструментов и ресурсов для веб разработчиков', 'Ещё один набор из наиполезнейших CSS сервисов.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Y2XspC5Gicg" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Y2XspC5Gicg/lessons.php', 115),
(759, 'HTML5: API работы с вибрацией', 'HTML5 - глоток свежего воздуха в современном вебе. Она повлиял не только на классический веб, каким мы знаем его сейчас. HTML5 предоставляет разработчикам ряд API для создания и улучшения сайтов с ориентацией на мобильные устройства. В этой статье мы рассмотрим API для работы с вибрацией.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/MBE3CFOUJAA" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/MBE3CFOUJAA/lessons.php', 115),
(760, 'Создаем CSS-анимации с помощью Move.js', 'На данный момент предпочтительным способом создания легких анимаций на сайтах является использование CSS3 переходов и анимаций. К сожалению, многие разработчики считают, что их синтаксис получается сложным и запутанным. Если так же считаете и вы, то, возможно, выходом для вас будет библиотека Move.js. Move.js - простая JavaScript библиотека для создания CSS3 анимаций с использованием простых функций. В этом руководстве описан основной синтаксис Move.js, а также небольшая демонстрация его использования.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Q9AeBt8xZqs" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Q9AeBt8xZqs/lessons.php', 115),
(761, '35 сайтов, использующих в дизайне плоские изображения и иконки', 'Несколько примеров для обмена опыта и получения вдохновения.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/OtgtMQ7kV8w" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/OtgtMQ7kV8w/lessons.php', 115),
(762, 'Работа с датой и временем с помощью Moment.js', 'Работа с датой и временем зачастую весьма обременительна. Я всегда считал, что отдельная JavaScript библиотека для манипуляции датами была бы очень полезной. Не так давно я познакомился с замечательной библиотекой Moment.js, позволяющей валидировать, парсить и управлять датами и временем.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/1hkk1fxoXNI" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/1hkk1fxoXNI/lessons.php', 115),
(763, 'Адаптивный дизайн начинается с URL', 'В данной статье мы рассматриваем адаптивную переработку страниц программ канала BBC.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/2Wm8M5t5ul0" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/2Wm8M5t5ul0/lessons.php', 115),
(764, 'Стили для стрелок навигации', 'Сегодня мы подготовили для вас несколько демок интересных примеров стрелок, которые можно применить для навигации слайдера.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/p-mPlraxs_E" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/p-mPlraxs_E/lessons.php', 115),
(765, 'Учимся фокусироваться на элементах страницы', 'В этом примере я предлагаю вам представить, что вы хотите улучшить навигацию на текущей странице так, что вместо резкого перехода к ссылке-якорю, вы плавно перемещаете пользователя к месту назначения посредством JavaScript анимации scrollTop.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/7cg1a2ifqH8" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/7cg1a2ifqH8/lessons.php', 115),
(766, 'Знакомство с Valentina', 'Valentina - набор инструментов, включающий: Valentina DB (новый SQL-сервер), Valentina Studio (инструмент управления базами данных), Valentina Report (графическая утилита для генерации отчетов, которые могут быть использованы в приложениях, например PHP) и связанный с ними набор инструментов разработки (называемый ADK).<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/QEYMJ0SSu_c" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/QEYMJ0SSu_c/lessons.php', 115),
(767, '34 примера адаптивных портфолио', 'В этой подборке вас ждёт несколько десятков примеров адаптивных портфолио. Не забудьте поиграть с размером окна при просмотре данных страниц.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/b-NgIPR3wTc" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/b-NgIPR3wTc/lessons.php', 115),
(768, 'Wholly: делаем таблицы читабельными', 'Данный jQuery плагин обрабатывает события mouseenter и mouseleave. Используется для подсветки элементов таблиц в зависимости от атрибутов colspan и rowspan.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/v-EWQBVpT8M" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/v-EWQBVpT8M/lessons.php', 115),
(769, 'Git для начинающих', 'Противостояние изменениям - основная черта человека. Если в то время, когда вы начинали работу с системами контроля версий, не было Git - весьма вероятно, что вы начинали с Subversion. Часто люди говорят, что Git слишком сложен для начинающих. Тем не менее, я позволю себе с вами не согласиться.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/lkxi4iLgfpQ" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/lkxi4iLgfpQ/lessons.php', 115),
(770, '9 способов локализации веб-сайта', 'Так как ваш сайт могут просматривать посетители со всего мира, необходимо сохранить суть и подачу вашего бренда, из какой страны бы ни просматривался ваш сайт.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/cZ8T0LFaX_g" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/cZ8T0LFaX_g/lessons.php', 115),
(771, '15 сервисов конвертации из PSD в HTML', 'Ещё одна наиполезнейшая подборка сервисов с помощью которых вы сможете с лёгкостью конвертировать PSD файл в полноценную HTML страницу.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/m4F15Blf7jk" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/m4F15Blf7jk/lessons.php', 115),
(772, '38 бесплатных CSS наработок выпадающих меню', 'Навигация - неотъемлемая часть любого сайта. В этой статье вы найдёте подборку из множества готовых решений, которые могут вам пригодиться.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Rm0NVP45huI" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Rm0NVP45huI/lessons.php', 115),
(773, 'Горячие скрипты: проверка успешности загрузки страницы', 'Когда-то перед вами может возникнуть задача проверки загрузки страницы со статусом ОК (200). В этой статейке вы сможете найти одно из возможных решений.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/zSwshv8mLEk" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/zSwshv8mLEk/lessons.php', 115),
(774, 'Введение в механизм Веб-оповещений', 'Время соединений на скорости 56k уже стерлось из людской памяти (первыми не выдержали пользователи мобильных устройств). Это было время, когда браузеры могли открывать только одну вкладку в окне, и никто даже и представить себе не мог просмотр сайтов в нескольких вкладках. Сегодня на нас свалились все эти социальные сети, посты, ответы, комментарии, фотографии, видео, и много чего еще. Было создано несколько систем, которые пришли на смену необходимости проверять каждую вкладку на предмет новой активности. Одним из таких способов явилась система оповещений, которые широко распространены на различных сайтах.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/E8c9EHjUj6Q" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/E8c9EHjUj6Q/lessons.php', 115),
(775, 'Делаем кнопку-индикатор прогресса в виде кольца', 'Урок, показывающий, как можно претворить в жизнь концепцию кнопки индикатора прогресса в виде кольца, предложенную Колином Гарвеном. Для анимации прогресса в виде заполнения кольца будем использовать технику анимации линии в SVG, описанную Джейком Арчибальдом, а также будем отображать кнопку в успешном и ошибочном состояниях.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/15ZneBlmL2I" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/15ZneBlmL2I/lessons.php', 115),
(776, '36 Bootstrap сниппетов', 'Предлагаем вашему вниманию целый набор из Bootstrap сниппетов, где каждый сможет найти что-то полезное для себя.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/2xlKt-hhBf4" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/2xlKt-hhBf4/lessons.php', 115),
(777, 'Разбираем Underscore.js по косточкам. Метод some', 'Продолжаем разбирать библиотеку underscore и в этой посте посмотрим как работать с методом some.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/PKL9Wx6ys-A" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/PKL9Wx6ys-A/lessons.php', 115),
(778, 'Делаем простой переключатель стилей', 'В данном уроке я покажу, как создать простой переключатель стилей, а также хранить настройки пользователя в локальном хранилище.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/dS3DrcgUiZM" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/dS3DrcgUiZM/lessons.php', 115),
(779, 'Горячие скрипты: как объединить несколько изображений при помощи PHP', 'В этом посте мы рассмотрим небольшой PHP, который выполняет следующую задачу: объединяет два изображения и отображает в видео одного.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/Ut_uFPkQEEs" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/Ut_uFPkQEEs/lessons.php', 115),
(780, 'Оптимизация конфигурации MySQL', 'MySQL - наиболее используемый движок баз данных в мире PHP. Поэтому для быстрорастущих веб-приложений очень важно знать, что ваши базы данных MySQL работают настолько хорошо, насколько это вообще возможно.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/X9Xmtttyr1E" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/X9Xmtttyr1E/lessons.php', 115),
(781, 'Как распланировать свой следующий мобильный электронный магазин', 'В этой статье мы рассмотрим все основные шаги планирования мобильного электронного магазина с высокой конверсией.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/eDWHcaruBg8" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/eDWHcaruBg8/lessons.php', 115),
(782, 'Аутентификация через Twitter', 'Привет, друзья! Да, да, да, наконец дошли руки до долгожданного урока, о котором просили многие из вас: реализации аутентификации через Twitter.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/SfsdXttgP00" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/SfsdXttgP00/lessons.php', 115),
(783, 'Новые атрибуты HTML5 для ссылок: download, media и ping', 'Ссылки были введены еще на заре веба. Но с расцветом HTML5 к так хорошо знакомым ссылкам были добавлены новые атрибуты, которые призваны составить компанию уже знакомым атрибутам href и rel.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/kHt71qBUkJ4" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/kHt71qBUkJ4/lessons.php', 115),
(784, 'Оптимизация индексов MySQL', 'MySQL - наиболее широко используемая в связке с PHP СУБД. Забота о том, что ваши базы данных MySQL работают настолько хорошо, насколько это вообще возможно - наиважнейший аспект залога хорошей работы растущего приложения.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/wFxLqAJKhZw" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/wFxLqAJKhZw/lessons.php', 115),
(785, '3D-эффект для сетки элементов', 'Воссоздание эффекта анимации, увиденного в приложении Маркуса Экхерта. Идея - переворачивать элемент сетки в пространстве, раскрывая блок на весь экран, и в итоге отображать некоторое содержимое, ассоциированное с элементом. Мы создали две демки, с вертикальным и горизонтальным поворотом.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/IWWBrvXAHqY" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/IWWBrvXAHqY/lessons.php', 115),
(786, 'Делаем “ленивую” прокрутку на jQuery', 'В этой статье мы поговорим о другом подходе - “ленивой” прокрутке, также известной под названием “бесконечной прокрутки” и “отказом от пагинации”. С помощью этой техники подгрузка контента производится с помощью AJAX, когда пользователь прокручивает страницу до места, где загруженный контент заканчивается.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/_acsf4IFKoc" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/_acsf4IFKoc/lessons.php', 115),
(787, 'Animate.Css – CSS3 Библиотека для создания анимации', 'За последние несколько лет в CSS появилось множество интересных фишек, которые делают веб разработку более увлекательной. Одной из таких вещей является CSS3 анимация. До CSS3, анимацию можно было реализовать только с помощью Javascript.<img src="http://feeds.feedburner.com/~r/ruseller/CdHX/~4/tUlKqU_L7KA" height="1" width="1"/>', 'http://feedproxy.google.com/~r/ruseller/CdHX/~3/tUlKqU_L7KA/lessons.php', 115),
(940, '50 Milliarden Dollar Schadensersatz: Ex-Jukos-Chef Chodorkowski begrüßt Urteil gegen Russland', 'Genugtuung für Michail Chodorkowski: Der Ex-Chef des Ölkonzerns Jukos feiert den Sieg gegen die russische Regierung. Die ehemaligen Besitzer erhalten 50 Milliarden Dollar. Nur eins bedauert der frühere Oligarch.', 'http://www.spiegel.de/wirtschaft/unternehmen/jukos-chodorkowski-begruesst-50-milliarden-dollar-urteil-gegen-russland-a-983233.html#ref=rss', 114),
(941, 'MH17-Katastrophe: Kiew bezeichnet durchlöcherten Rumpf als Absturzursache', 'Die Ursache für den Absturz der Malaysia-Airlines-Maschine steht für die ukrainische Regierung fest: Nach Angaben der Behörden kam es nach einer starken Explosion zu einem Druckabfall in der Kabine des Flugzeugs.', 'http://www.spiegel.de/politik/ausland/mh17-absturz-ukraine-nennt-druckabfall-nach-explosion-als-ursache-a-983235.html#ref=rss', 114),
(942, '100-Jahre-Gedenken: Serbien feiert sich zum Jahrestag des Ersten Weltkriegs', 'Es war der Beginn einer weltweiten Tragödie: Am 28. Juli 1914 erklärte Österreich-Ungarn Serbien den Krieg. 100 Jahre danach feiern sich viele Serben als "Helden Europas", Zeitungen veröffentlichen patriotische bis nationalistische Artikel.', 'http://www.spiegel.de/politik/ausland/erster-weltkrieg-serbien-gedenkt-kriegserklaerung-oesterreich-ungarns-a-983229.html#ref=rss', 114),
(943, 'Gebäudemodernisierung: Maas plant neue Kostenbremse für Mieter', 'Noch ist die Mietpreisbremse nicht beschlossen, da kündigt Justizminister Maas das nächste Gesetzesvorhaben an: Nach einer Gebäudemodernisierung soll die Miete nicht mehr so stark steigen dürfen.', 'http://www.spiegel.de/wirtschaft/soziales/mieten-maas-plant-kosten-deckel-bei-modernisierungen-a-983218.html#ref=rss', 114),
(944, 'Blutverdünner Pradaxa: Pharmakonzern soll Daten verschwiegen haben', 'Neuer Ärger für Boehringer Ingelheim: Der Pharmakonzern soll aus Marketinggründen verschwiegen haben, dass eine ärztliche Kontrolle die Therapie mit dem Blutverdünner Pradaxa sicherer machen könnte. Kritiker fordern nun genauere Tests.', 'http://www.spiegel.de/wissenschaft/medizin/pradaxa-boehringer-ingelheim-soll-daten-verschwiegen-haben-a-983124.html#ref=rss', 114),
(945, 'Schmähgesang: BVB nimmt Schweinsteigers Entschuldigung an', 'In einem Internetvideo schmähte Bastian Schweinsteigen den Liga-Konkurrenten Borussia Dortmund, später entschuldigte er sich. Der BVB nimmt den Vorfall mit Humor - und bietet dem Bayern-Profi Gesangsunterricht an.', 'http://www.spiegel.de/sport/fussball/bastian-schweinsteiger-borussia-dortmund-nimmt-entschuldigung-an-a-983227.html#ref=rss', 114),
(946, 'Epidemie: Ebola-Infizierter könnte in Hamburg behandelt werden', 'Ein Mediziner, der sich in Westafrika mit Ebola angesteckt hat, wird möglicherweise zur Behandlung nach Hamburg geflogen. Um die Epidemie einzudämmen, hat Liberia seine Grenzen geschlossen. ', 'http://www.spiegel.de/gesundheit/diagnose/ebola-infizierter-koennte-in-hamburg-behandelt-werden-a-983208.html#ref=rss', 114),
(947, 'Prozess in Regensburg: Neuer Krach zwischen Gustl Mollath und seinen Verteidigern', 'Der Verteidiger von Gustl Mollath, Gerhard Strate, hat darum gebeten, ihn und seinen Kollegen als Pflichtverteidiger zu entbinden. Zuvor hatte der Angeklagte erklärt, er wolle 27 weitere Beweisanträge stellen.', 'http://www.spiegel.de/panorama/justiz/mollath-prozess-anwalt-strate-will-nicht-pflichtverteidiger-sein-a-983188.html#ref=rss', 114),
(948, 'Menschenrechtsbericht zur Ukraine: Uno wirft Separatisten Schreckensherrschaft vor', 'Entführungen, Folter, Exekutionen: Der Uno-Menschenrechtsrat erhebt in seinem neuen Bericht schwere Vorwürfe gegen die prorussischen Separatisten in der Ukraine. Der Abschuss von MH17 könnte "einem Kriegsverbrechen gleichkommen".', 'http://www.spiegel.de/politik/ausland/ukraine-uno-spricht-von-schreckensherrschaft-der-separatisten-a-983190.html#ref=rss', 114),
(949, 'Jukos-Zerschlagung: Russland zu 50 Milliarden Dollar Schadensersatz verurteilt', 'Das Urteil ist eine schwere Niederlage für die russische Regierung: Ein internationales Gericht in Den Haag hat zugunsten der Ex-Eigner des zerschlagenen Ölkonzerns Jukos entschieden - und spricht ihnen rund 50 Milliarden Dollar zu.', 'http://www.spiegel.de/wirtschaft/unternehmen/yukos-russland-verliert-rechtsstreit-gegen-ex-eigentuemer-a-983167.html#ref=rss', 114),
(950, 'Streit bei Springer: "Bild"-Chefredaktion distanziert sich von Anti-Islam-Kommentar', 'Der Islam sei ein Integrationshindernis - diese Meinung hat Nicolaus Fest, Vizechefredakteur der "Bild am Sonntag", in einem Kommentar vertreten. Sein Chef Kai Diekmann geht öffentlich auf Distanz.', 'http://www.spiegel.de/kultur/gesellschaft/bild-zeitung-islam-streit-zwischen-fest-und-diekmann-bei-springer-a-983156.html#ref=rss', 114),
(951, 'Geleaktes Video: Schweinsteiger entschuldigt sich für BVB-Schmähgesang', '"BVB, Hurensöhne": Ein Video zeigt, wie Bastian Schweinsteiger Borussia Dortmund verhöhnt. Nun hat sich der Bayern-Star dazu geäußert.', 'http://www.spiegel.de/sport/fussball/bastian-schweinsteiger-entschuldigt-sich-fuer-bvb-schmaehgesang-a-983159.html#ref=rss', 114),
(952, 'Kämpfe in der Ostukraine: USA veröffentlichen angebliche Beweise für russische Angriffe', 'Die USA beschuldigen Russland, Raketen auf ukrainisches Staatsgebiet abgefeuert zu haben. Jetzt hat das US-Außenministerium Satellitenbilder präsentiert, die dies angeblich belegen sollen. ', 'http://www.spiegel.de/politik/ausland/ukraine-usa-veroeffentlichen-angebliche-beweise-fuer-russische-angriffe-a-983153.html#ref=rss', 114),
(953, 'Getöteter Achtjähriger in Freiburg: Polizei warnt vor Aufruf zur Selbstjustiz', 'Unbekannte nutzen die Tötung eines Jungen in Freiburg für eine geschmacklose Aktion: Es kursieren ein gefälschtes Phantombild des Täters und Aufrufe zur Selbstjustiz. Die Polizei spricht von einer gefährlichen Falschmeldung.', 'http://www.spiegel.de/panorama/justiz/getoeteter-achtjaehriger-in-freiburg-warnung-vor-selbstjustiz-aufrufen-a-983152.html#ref=rss', 114),
(954, 'Krieg in Gaza: Uno-Sicherheitsrat fordert einstimmig sofortige Waffenruhe', 'Israelis und Palästinenser sollen "sofort und bedingungslos" die Kampfhandlungen einstellen: Der Sicherheitsrat der Vereinten Nationen ruft im Gaza-Krieg zur Feuerpause auf. Das Uno-Gremium votierte einstimmig für die Erklärung.', 'http://www.spiegel.de/politik/ausland/krieg-in-gaza-uno-sicherheitsrat-fordert-sofortige-waffenruhe-a-983150.html#ref=rss', 114),
(955, 'Tour de France: Nibali feiert Gesamtsieg, Kittel triumphiert in Paris', 'Vincenzo Nibali hat die 101. Tour de France gewonnen. Der Italiener war bei der letzten Etappe nicht mehr einzuholen. Den prestigeträchtigen Tagessieg in Paris sicherte sich der Deutsche Marcel Kittel. ', 'http://www.spiegel.de/sport/sonst/tour-de-france-kittel-siegt-in-paris-nibali-holt-gesamtsieg-a-983135.html#ref=rss', 114),
(956, 'Rüstungsexporte: Gabriel warnt vor "Geschäft mit dem Tod"', 'Welche Waffen darf Deutschland liefern - und vor allem: wohin? Die Große Koalition streitet über den richtigen Kurs bei Rüstungsexporten. CSU-Chef Seehofer warnt vor Arbeitsplatzverlusten - Wirtschaftsminister Gabriel kontert.', 'http://www.spiegel.de/politik/deutschland/ruestungsexporte-gabriel-warnt-vor-heiklen-waffengeschaeften-a-983132.html#ref=rss', 114),
(957, 'Ukraine-Krise: SPD streitet über Schröder-Putin-Allianz', 'In der SPD bahnt sich ein Streit über Gerhard Schröder an. Führende Außenpolitiker fordern vom Ex-Kanzler ein Ende seiner russlandfreundlichen Haltung. Außenminister Steinmeier stärkt dem alten Freund demonstrativ den Rücken.', 'http://www.spiegel.de/politik/deutschland/ukraine-krise-spd-streitet-ueber-schroeders-freundschaft-mit-putin-a-983130.html#ref=rss', 114),
(958, 'Berechnung des "Economist": Putins Politik kostet Investoren eine Billion Dollar', 'Russische Aktien sind bei Anlegern derzeit noch unbeliebter als Unternehmensanteile aus dem Iran oder Argentinien. Das liegt auch an der Ukraine-Krise - vor allem aber an der katastrophalen Wirtschaftspolitik des Kreml.', 'http://www.spiegel.de/wirtschaft/unternehmen/economist-eine-billion-dollar-abschlag-auf-russische-aktien-a-983109.html#ref=rss', 114),
(959, 'Aufstand von Islamisten: Deutsche sollen dringend aus Libyen ausreisen', 'Die Gewalt in Libyen alarmiert das Auswärtige Amt: Es ruft alle Deutschen in dem nordafrikanischen Land auf, schleunigst auszureisen. Bei neuen Kämpfen zwischen Regierungstruppen und Islamisten kamen mindestens 38 Menschen ums Leben.', 'http://www.spiegel.de/politik/ausland/kaempfe-in-libyen-auswaertiges-amt-draengt-deutsche-zu-ausreise-a-983125.html#ref=rss', 114),
(960, 'Afghanistan: Berlin will Todesstrafe für Niedringhaus-Mörder verhindern', 'Ein Gericht in Kabul hat den Mörder der deutschen Fotografin Anja Niedringhaus in einem kurzen und geheim geführten Prozess zum Tode verurteilt. Die Bundesregierung drängt nach SPIEGEL-Informationen darauf, die Entscheidung in eine lange Gefängnisstrafe umzuwandeln.', 'http://www.spiegel.de/politik/ausland/niedringhaus-berlin-gegen-todesstrafe-fuer-moerder-in-afghanistan-a-983097.html#ref=rss', 114),
(961, 'Formel 1 in Ungarn: Ricciardo triumphiert auf dem Hungaroring', 'Red Bull kann doch noch gewinnen: Beim Großen Preis von Ungarn siegte Sebastian Vettels Teamkollege Daniel Ricciardo. Es war erst der zweite Erfolg des Teams in dieser Saison. Nico Rosberg wurde Vierter.', 'http://www.spiegel.de/sport/formel1/formel-1-in-ungarn-ricciardo-triumphiert-auf-dem-hungaroring-a-983112.html#ref=rss', 114),
(962, 'Gaza-Konflikt: Netanjahu will sich nicht auf Hamas-Waffenruhe einlassen', 'Israel will vorerst keine neue 24-stündige Waffenruhe ausrufen. Regierungschef Netanjahu warf der radikalislamischen Hamas vor, gegen die von ihr selbst ausgerufene Feuerpause zu verstoßen.', 'http://www.spiegel.de/politik/ausland/gaza-konflikt-israel-will-sich-nicht-auf-hamas-waffenruhe-einlassen-a-983122.html#ref=rss', 114),
(963, 'Angriff in Kamerun: Boko Haram entführt Frau des Vizepremiers', 'Boko Haram terrorisiert nun auch Städte im Norden Kameruns: Die Extremisten überfielen einen Ort an der Grenze zu Nigeria - sie töteten Bewohner und entführten die Frau des stellvertretenden Regierungschefs. ', 'http://www.spiegel.de/politik/ausland/angriff-in-kamerun-boko-haram-entfuehrt-frau-des-vizepremiers-a-983120.html#ref=rss', 114),
(964, 'Kinderbetreuung: Schwesig verschiebt Kita-Qualitätsgesetz um Jahre', 'In vielen Kitas werden Kinder mehr verwahrt als gefördert. Doch Familienministerin Schwesig verschiebt nach Informationen des SPIEGEL ein geplantes Qualitätsgesetz, das mehr Personal garantieren soll, auf nach 2017. Die Länder fürchten die Kosten besserer Betreuung.', 'http://www.spiegel.de/politik/deutschland/schwesig-plant-doch-kein-kita-gesetz-fuer-mehr-erzieher-a-983115.html#ref=rss', 114),
(1009, 'Türkei: Erdogan-Vize will Frauen das Lachen verbieten', 'Der stellvertretende Regierungschef der Türkei beklagt einen Verfall der Moral. Die Schuld sieht Bülent Arinc bei den Frauen - weshalb er ihnen laute Heiterkeit in der Öffentlichkeit untersagen will.', 'http://www.spiegel.de/politik/ausland/tuerkei-erdogans-stellvertreter-will-frauen-das-lachen-verbieten-a-983400.html#ref=rss', 104),
(1010, 'Modellauto-Affäre: Staatsanwaltschaft beantragt offenbar Aufhebung von Haderthauers Immunität', 'Die bayerische Staatsministerin Haderthauer könnte ihre Immunität verlieren. Die Münchner Staatsanwaltschaft hat laut einem Zeitungsbericht einen entsprechenden Antrag gestellt.', 'http://www.spiegel.de/politik/deutschland/haderthauer-koennte-immunitaet-in-modellauto-affaere-verlieren-a-983402.html#ref=rss', 104),
(1011, 'Wuppertal: Männer werfen Molotowcocktails auf Synagoge', 'Drei Männer haben laut Polizei einen Brandanschlag auf die Wuppertaler Synagoge verübt. Die Ermittler konnten einen mutmaßlichen Täter festnehmen, nach den anderen beiden wird gefahndet.', 'http://www.spiegel.de/panorama/wuppertal-maenner-werfen-molotowcocktails-auf-synagoge-a-983382.html#ref=rss', 104),
(1012, 'Krieg in Nahost: Israels Armee beschießt einziges Elektrizitätswerk in Gaza', 'Die israelische Armee hat die Offensive im Gaza-Streifen massiv ausgeweitet. 150 Ziele wurden in der Nacht attackiert, darunter nach palästinensischen Angaben auch das einzige Kraftwerk des Küstengebiets. Die Anlage fing Feuer. ', 'http://www.spiegel.de/politik/ausland/krieg-in-gaza-einziges-elektrizitaetswerk-getroffen-ausser-betrieb-a-983373.html#ref=rss', 104),
(1013, 'Afghanistan: USA verlieren Kontrolle über große Waffenbestände', 'Hunderttausende Schnellfeuergewehre könnten in Afghanistan in die Hände der Taliban gelangen, warnt die US-Armee. Die Waffen, die an das afghanische Militär und Polizei geliefert wurden, seien nicht ordentlich registriert worden. ', 'http://www.spiegel.de/politik/ausland/afghanistan-usa-verlieren-kontrolle-ueber-hunderttausende-gewehre-a-983347.html#ref=rss', 104),
(1014, 'Milliardenvorsorge: Deutsche Bank erhöht Kapitalpuffer für Rechtsrisiken', 'Die Deutsche Bank hat ihren Gewinn vor Steuern deutlich gesteigert. Doch die Unsicherheit ist groß: Das Institut ist in 6000 Rechtsstreitigkeiten verwickelt und muss seine Rückstellungen deutlich aufstocken.', 'http://www.spiegel.de/wirtschaft/unternehmen/deutsche-bank-gewinn-steigt-hoehere-rueckstellungen-fuer-rechtsrisiken-a-983351.html#ref=rss', 104),
(1015, 'Beihilfe zur Steuerhinterziehung: Schweizer Großbank UBS zahlt Rekordbuße an Deutschland', 'Die UBS muss der Staatsanwaltschaft Bochum rund 300 Millionen Euro zahlen. Die Schweizer Bank hatte wohlhabenden Kunden geholfen, Milliarden vor dem deutschen Fiskus zu verstecken.', 'http://www.spiegel.de/wirtschaft/unternehmen/ubs-zahlt-rekordbusse-wegen-beihilfe-zur-steuerhinterziehung-a-983341.html#ref=rss', 104),
(1016, 'Marschflugkörper: USA werfen Russland Bruch von Abrüstungsvertrag vor', '"Sehr ernst" nennen die USA den Vorgang: Russland soll, so der Vorwurf, illegal eine neue bodengestützte Mittelstreckenrakete getestet haben.', 'http://www.spiegel.de/politik/ausland/usa-werfen-russland-bruch-von-abruestungsvertrag-vor-a-983343.html#ref=rss', 104),
(1017, 'Krieg in Nahost: Gaza unter heftigem Beschuss', 'Israels Armee hat Ziele im südlichen und zentralen Gaza-Streifen in der Nacht massiv attackiert. Auch das Haus des Hamas-Spitzenpolitikers Hanija soll zerstört worden sein.', 'http://www.spiegel.de/politik/ausland/gazastreifen-israel-weitet-bombardements-aus-a-983337.html#ref=rss', 104),
(1018, 'Film und Literatur: Ukraine will Kultur aus Russland zensieren', 'Der Konflikt mit Moskau hat Folgen für die Kultur der Ukraine. Die Regierung in Kiew will russische Filme zensieren und deutlich weniger Bücher aus dem Nachbarland importieren.', 'http://www.spiegel.de/kultur/gesellschaft/ukraine-will-kultur-aus-russland-zensieren-a-983338.html#ref=rss', 104),
(1019, 'Unwetter über Münster: Mann ertrinkt in überflutetem Keller', 'Heftige Gewitter sind über Nordrhein-Westfalen und Baden-Württemberg gezogen. In Münster ertrank ein Mann, eine Frau wurde von einem umstürzenden Baum lebensgefährlich verletzt. Meteorologen sagen weitere Unwetter voraus.', 'http://www.spiegel.de/panorama/muenster-ein-toter-bei-schweren-unwettern-in-nrw-a-983335.html#ref=rss', 104),
(1020, 'Studie: Schon fünf Minuten Joggen pro Tag schützen das Herz', 'Egal ob 30 Minuten pro Tag, zehn oder nur fünf: Wer regelmäßig läuft, hat ein deutlich geringeres Risiko, frühzeitig zu sterben, berichten US-Forscher. Besonders vor Herz-Kreislauf-Krankheiten sind Jogger besser gefeit.', 'http://www.spiegel.de/gesundheit/ernaehrung/joggen-schon-eine-stunde-pro-woche-schuetzt-vorm-tod-a-983280.html#ref=rss', 104),
(1021, 'Air-Algérie-Flugzeugabsturz: Piloten der Unglücksmaschine wollten umkehren', 'Die Blackboxes geben Aufschluss: Experten haben erste Anhaltspunkte über den Hergang des Absturzes der Air-Algérie-Maschine über Mali.', 'http://www.spiegel.de/panorama/air-algerie-crew-wollte-vor-flugzeugabsturz-in-mali-umkehren-a-983327.html#ref=rss', 104),
(1022, 'Urteil: Hartz-IV-Empfänger darf Schonvermögen im Nachtclub ausgeben', 'Ein Mann erbt Geld, gibt es zum Teil in Nachtclubs aus und beantragt dann Hartz IV. Zu Recht, wie das Sozialgericht Heilbronn jetzt entschied. Denn über das sogenannte Schonvermögen dürfe jeder frei verfügen.', 'http://www.spiegel.de/wirtschaft/soziales/hartz-iv-schonvermoegen-darf-laut-urteil-fuer-sex-verwendet-werden-a-983324.html#ref=rss', 104),
(1023, 'U19-Europameisterschaft: 4:0 gegen Österreich - Deutschland steht im Finale', 'Endspiel! Die deutsche U19-Nationalmannschaft träumt bei der EM vom Titel. Im Halbfinale verpasste die DFB-Elf Österreich eine Klatsche. Erneut überragend: Stürmer Davie Selke.', 'http://www.spiegel.de/sport/fussball/u-19-nationalmannschaft-bei-em-nach-sieg-gegen-oesterreich-im-endspiel-a-983304.html#ref=rss', 104),
(1024, 'Krieg im Nahen Osten: Israel fordert Zivilisten in Gaza zur Flucht auf', 'Keine Aussicht auf eine Waffenruhe im Nahen Osten: Israel plant offenbar neue massive Luftschläge gegen die Hamas. Premier Netanjahu bereitet seine Bürger auf einen langwierigen Konflikt vor.', 'http://www.spiegel.de/politik/ausland/gaza-krieg-israel-fordert-zivilisten-zur-flucht-auf-a-983319.html#ref=rss', 104),
(1025, 'Nebeneinkünfte: Abgeordnete kritisieren Top-Verdiener im Bundestag', 'Bundestagsabgeordnete sind empört über Kollegen, die ihre Nebenjobs über die parlamentarische Arbeit stellen. Vor allem Höchstverdiener Peter Gauweiler steht im Fokus. Die Spitzenverdiener zeigen sich uneinsichtig. ', 'http://www.spiegel.de/politik/deutschland/nebenverdienste-im-bundestag-kritik-an-top-verdiener-gauweiler-a-983193.html#ref=rss', 104),
(1026, 'Familienpolitik: Union verbittet sich SPD-Kritik am Betreuungsgeld', 'Ein Jahr nach Einführung des Betreuungsgeldes wachsen die Zweifel an der Prämie. In der SPD sympathisiert mancher mit einer Abschaffung - sehr zum Ärger der Union. ', 'http://www.spiegel.de/politik/deutschland/betreuungsgeld-union-verteidigt-umstrittenen-familienzuschuss-a-983262.html#ref=rss', 104),
(1027, 'Nach Vertreibung aus Mossul: Frankreich bietet irakischen Christen Asyl an', 'Hoffnung für die Christen aus Mossul: Tausende mussten vor der Terrorgruppe Islamischer Staat aus der irakischen Stadt fliehen. Nun bietet Frankreich den Vertriebenen Zuflucht an.', 'http://www.spiegel.de/politik/ausland/christen-und-islamischer-staat-im-irak-frankreich-bietet-asyl-an-a-983266.html#ref=rss', 104),
(1028, '50 Milliarden Dollar Schadensersatz: Ex-Jukos-Chef Chodorkowski begrüßt Urteil gegen Russland', 'Genugtuung für Michail Chodorkowski: Der Ex-Chef des Ölkonzerns Jukos feiert den Sieg gegen die russische Regierung. Die ehemaligen Besitzer erhalten 50 Milliarden Dollar. Nur eins bedauert der frühere Oligarch.', 'http://www.spiegel.de/wirtschaft/unternehmen/jukos-chodorkowski-begruesst-50-milliarden-dollar-urteil-gegen-russland-a-983233.html#ref=rss', 104),
(1029, 'MH17-Katastrophe: Kiew bezeichnet durchlöcherten Rumpf als Absturzursache', 'Die Ursache für den Absturz der Malaysia-Airlines-Maschine steht für die ukrainische Regierung fest: Nach Angaben der Behörden kam es nach einer starken Explosion zu einem Druckabfall in der Kabine des Flugzeugs.', 'http://www.spiegel.de/politik/ausland/mh17-absturz-ukraine-nennt-druckabfall-nach-explosion-als-ursache-a-983235.html#ref=rss', 104),
(1030, '100-Jahre-Gedenken: Serbien feiert sich zum Jahrestag des Ersten Weltkriegs', 'Es war der Beginn einer weltweiten Tragödie: Am 28. Juli 1914 erklärte Österreich-Ungarn Serbien den Krieg. 100 Jahre danach feiern sich viele Serben als "Helden Europas", Zeitungen veröffentlichen patriotische bis nationalistische Artikel.', 'http://www.spiegel.de/politik/ausland/erster-weltkrieg-serbien-gedenkt-kriegserklaerung-oesterreich-ungarns-a-983229.html#ref=rss', 104),
(1031, 'Gebäudemodernisierung: Maas plant neue Kostenbremse für Mieter', 'Noch ist die Mietpreisbremse nicht beschlossen, da kündigt Justizminister Maas das nächste Gesetzesvorhaben an: Nach einer Gebäudemodernisierung soll die Miete nicht mehr so stark steigen dürfen.', 'http://www.spiegel.de/wirtschaft/soziales/mieten-maas-plant-kosten-deckel-bei-modernisierungen-a-983218.html#ref=rss', 104);
INSERT INTO `rss_posts` (`id`, `title`, `description`, `link`, `feeds_id`) VALUES
(1032, 'Blutverdünner Pradaxa: Pharmakonzern soll Daten verschwiegen haben', 'Neuer Ärger für Boehringer Ingelheim: Der Pharmakonzern soll aus Marketinggründen verschwiegen haben, dass eine ärztliche Kontrolle die Therapie mit dem Blutverdünner Pradaxa sicherer machen könnte. Kritiker fordern nun genauere Tests.', 'http://www.spiegel.de/wissenschaft/medizin/pradaxa-boehringer-ingelheim-soll-daten-verschwiegen-haben-a-983124.html#ref=rss', 104),
(1033, 'Türkei: Erdogan-Vize will Frauen das Lachen verbieten', 'Der stellvertretende Regierungschef der Türkei beklagt einen Verfall der Moral. Die Schuld sieht Bülent Arinc bei den Frauen - weshalb er ihnen laute Heiterkeit in der Öffentlichkeit untersagen will.', 'http://www.spiegel.de/politik/ausland/tuerkei-erdogans-stellvertreter-will-frauen-das-lachen-verbieten-a-983400.html#ref=rss', 116),
(1034, 'Modellauto-Affäre: Staatsanwaltschaft beantragt offenbar Aufhebung von Haderthauers Immunität', 'Die bayerische Staatsministerin Haderthauer könnte ihre Immunität verlieren. Die Münchner Staatsanwaltschaft hat laut einem Zeitungsbericht einen entsprechenden Antrag gestellt.', 'http://www.spiegel.de/politik/deutschland/haderthauer-koennte-immunitaet-in-modellauto-affaere-verlieren-a-983402.html#ref=rss', 116),
(1035, 'Wuppertal: Männer werfen Molotowcocktails auf Synagoge', 'Drei Männer haben laut Polizei einen Brandanschlag auf die Wuppertaler Synagoge verübt. Die Ermittler konnten einen mutmaßlichen Täter festnehmen, nach den anderen beiden wird gefahndet.', 'http://www.spiegel.de/panorama/wuppertal-maenner-werfen-molotowcocktails-auf-synagoge-a-983382.html#ref=rss', 116),
(1036, 'Krieg in Nahost: Israels Armee beschießt einziges Elektrizitätswerk in Gaza', 'Die israelische Armee hat die Offensive im Gaza-Streifen massiv ausgeweitet. 150 Ziele wurden in der Nacht attackiert, darunter nach palästinensischen Angaben auch das einzige Kraftwerk des Küstengebiets. Die Anlage fing Feuer. ', 'http://www.spiegel.de/politik/ausland/krieg-in-gaza-einziges-elektrizitaetswerk-getroffen-ausser-betrieb-a-983373.html#ref=rss', 116),
(1037, 'Afghanistan: USA verlieren Kontrolle über große Waffenbestände', 'Hunderttausende Schnellfeuergewehre könnten in Afghanistan in die Hände der Taliban gelangen, warnt die US-Armee. Die Waffen, die an das afghanische Militär und Polizei geliefert wurden, seien nicht ordentlich registriert worden. ', 'http://www.spiegel.de/politik/ausland/afghanistan-usa-verlieren-kontrolle-ueber-hunderttausende-gewehre-a-983347.html#ref=rss', 116),
(1038, 'Milliardenvorsorge: Deutsche Bank erhöht Kapitalpuffer für Rechtsrisiken', 'Die Deutsche Bank hat ihren Gewinn vor Steuern deutlich gesteigert. Doch die Unsicherheit ist groß: Das Institut ist in 6000 Rechtsstreitigkeiten verwickelt und muss seine Rückstellungen deutlich aufstocken.', 'http://www.spiegel.de/wirtschaft/unternehmen/deutsche-bank-gewinn-steigt-hoehere-rueckstellungen-fuer-rechtsrisiken-a-983351.html#ref=rss', 116),
(1039, 'Beihilfe zur Steuerhinterziehung: Schweizer Großbank UBS zahlt Rekordbuße an Deutschland', 'Die UBS muss der Staatsanwaltschaft Bochum rund 300 Millionen Euro zahlen. Die Schweizer Bank hatte wohlhabenden Kunden geholfen, Milliarden vor dem deutschen Fiskus zu verstecken.', 'http://www.spiegel.de/wirtschaft/unternehmen/ubs-zahlt-rekordbusse-wegen-beihilfe-zur-steuerhinterziehung-a-983341.html#ref=rss', 116),
(1040, 'Marschflugkörper: USA werfen Russland Bruch von Abrüstungsvertrag vor', '"Sehr ernst" nennen die USA den Vorgang: Russland soll, so der Vorwurf, illegal eine neue bodengestützte Mittelstreckenrakete getestet haben.', 'http://www.spiegel.de/politik/ausland/usa-werfen-russland-bruch-von-abruestungsvertrag-vor-a-983343.html#ref=rss', 116),
(1041, 'Krieg in Nahost: Gaza unter heftigem Beschuss', 'Israels Armee hat Ziele im südlichen und zentralen Gaza-Streifen in der Nacht massiv attackiert. Auch das Haus des Hamas-Spitzenpolitikers Hanija soll zerstört worden sein.', 'http://www.spiegel.de/politik/ausland/gazastreifen-israel-weitet-bombardements-aus-a-983337.html#ref=rss', 116),
(1042, 'Film und Literatur: Ukraine will Kultur aus Russland zensieren', 'Der Konflikt mit Moskau hat Folgen für die Kultur der Ukraine. Die Regierung in Kiew will russische Filme zensieren und deutlich weniger Bücher aus dem Nachbarland importieren.', 'http://www.spiegel.de/kultur/gesellschaft/ukraine-will-kultur-aus-russland-zensieren-a-983338.html#ref=rss', 116),
(1043, 'Unwetter über Münster: Mann ertrinkt in überflutetem Keller', 'Heftige Gewitter sind über Nordrhein-Westfalen und Baden-Württemberg gezogen. In Münster ertrank ein Mann, eine Frau wurde von einem umstürzenden Baum lebensgefährlich verletzt. Meteorologen sagen weitere Unwetter voraus.', 'http://www.spiegel.de/panorama/muenster-ein-toter-bei-schweren-unwettern-in-nrw-a-983335.html#ref=rss', 116),
(1044, 'Studie: Schon fünf Minuten Joggen pro Tag schützen das Herz', 'Egal ob 30 Minuten pro Tag, zehn oder nur fünf: Wer regelmäßig läuft, hat ein deutlich geringeres Risiko, frühzeitig zu sterben, berichten US-Forscher. Besonders vor Herz-Kreislauf-Krankheiten sind Jogger besser gefeit.', 'http://www.spiegel.de/gesundheit/ernaehrung/joggen-schon-eine-stunde-pro-woche-schuetzt-vorm-tod-a-983280.html#ref=rss', 116),
(1045, 'Air-Algérie-Flugzeugabsturz: Piloten der Unglücksmaschine wollten umkehren', 'Die Blackboxes geben Aufschluss: Experten haben erste Anhaltspunkte über den Hergang des Absturzes der Air-Algérie-Maschine über Mali.', 'http://www.spiegel.de/panorama/air-algerie-crew-wollte-vor-flugzeugabsturz-in-mali-umkehren-a-983327.html#ref=rss', 116),
(1046, 'Urteil: Hartz-IV-Empfänger darf Schonvermögen im Nachtclub ausgeben', 'Ein Mann erbt Geld, gibt es zum Teil in Nachtclubs aus und beantragt dann Hartz IV. Zu Recht, wie das Sozialgericht Heilbronn jetzt entschied. Denn über das sogenannte Schonvermögen dürfe jeder frei verfügen.', 'http://www.spiegel.de/wirtschaft/soziales/hartz-iv-schonvermoegen-darf-laut-urteil-fuer-sex-verwendet-werden-a-983324.html#ref=rss', 116),
(1047, 'U19-Europameisterschaft: 4:0 gegen Österreich - Deutschland steht im Finale', 'Endspiel! Die deutsche U19-Nationalmannschaft träumt bei der EM vom Titel. Im Halbfinale verpasste die DFB-Elf Österreich eine Klatsche. Erneut überragend: Stürmer Davie Selke.', 'http://www.spiegel.de/sport/fussball/u-19-nationalmannschaft-bei-em-nach-sieg-gegen-oesterreich-im-endspiel-a-983304.html#ref=rss', 116),
(1048, 'Krieg im Nahen Osten: Israel fordert Zivilisten in Gaza zur Flucht auf', 'Keine Aussicht auf eine Waffenruhe im Nahen Osten: Israel plant offenbar neue massive Luftschläge gegen die Hamas. Premier Netanjahu bereitet seine Bürger auf einen langwierigen Konflikt vor.', 'http://www.spiegel.de/politik/ausland/gaza-krieg-israel-fordert-zivilisten-zur-flucht-auf-a-983319.html#ref=rss', 116),
(1049, 'Nebeneinkünfte: Abgeordnete kritisieren Top-Verdiener im Bundestag', 'Bundestagsabgeordnete sind empört über Kollegen, die ihre Nebenjobs über die parlamentarische Arbeit stellen. Vor allem Höchstverdiener Peter Gauweiler steht im Fokus. Die Spitzenverdiener zeigen sich uneinsichtig. ', 'http://www.spiegel.de/politik/deutschland/nebenverdienste-im-bundestag-kritik-an-top-verdiener-gauweiler-a-983193.html#ref=rss', 116),
(1050, 'Familienpolitik: Union verbittet sich SPD-Kritik am Betreuungsgeld', 'Ein Jahr nach Einführung des Betreuungsgeldes wachsen die Zweifel an der Prämie. In der SPD sympathisiert mancher mit einer Abschaffung - sehr zum Ärger der Union. ', 'http://www.spiegel.de/politik/deutschland/betreuungsgeld-union-verteidigt-umstrittenen-familienzuschuss-a-983262.html#ref=rss', 116),
(1051, 'Nach Vertreibung aus Mossul: Frankreich bietet irakischen Christen Asyl an', 'Hoffnung für die Christen aus Mossul: Tausende mussten vor der Terrorgruppe Islamischer Staat aus der irakischen Stadt fliehen. Nun bietet Frankreich den Vertriebenen Zuflucht an.', 'http://www.spiegel.de/politik/ausland/christen-und-islamischer-staat-im-irak-frankreich-bietet-asyl-an-a-983266.html#ref=rss', 116),
(1052, '50 Milliarden Dollar Schadensersatz: Ex-Jukos-Chef Chodorkowski begrüßt Urteil gegen Russland', 'Genugtuung für Michail Chodorkowski: Der Ex-Chef des Ölkonzerns Jukos feiert den Sieg gegen die russische Regierung. Die ehemaligen Besitzer erhalten 50 Milliarden Dollar. Nur eins bedauert der frühere Oligarch.', 'http://www.spiegel.de/wirtschaft/unternehmen/jukos-chodorkowski-begruesst-50-milliarden-dollar-urteil-gegen-russland-a-983233.html#ref=rss', 116),
(1053, 'MH17-Katastrophe: Kiew bezeichnet durchlöcherten Rumpf als Absturzursache', 'Die Ursache für den Absturz der Malaysia-Airlines-Maschine steht für die ukrainische Regierung fest: Nach Angaben der Behörden kam es nach einer starken Explosion zu einem Druckabfall in der Kabine des Flugzeugs.', 'http://www.spiegel.de/politik/ausland/mh17-absturz-ukraine-nennt-druckabfall-nach-explosion-als-ursache-a-983235.html#ref=rss', 116),
(1054, '100-Jahre-Gedenken: Serbien feiert sich zum Jahrestag des Ersten Weltkriegs', 'Es war der Beginn einer weltweiten Tragödie: Am 28. Juli 1914 erklärte Österreich-Ungarn Serbien den Krieg. 100 Jahre danach feiern sich viele Serben als "Helden Europas", Zeitungen veröffentlichen patriotische bis nationalistische Artikel.', 'http://www.spiegel.de/politik/ausland/erster-weltkrieg-serbien-gedenkt-kriegserklaerung-oesterreich-ungarns-a-983229.html#ref=rss', 116);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, 'jXOxk1YUD7x5pZLSPENsj.', 1268889823, 1406634302, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(4, '127.0.0.1', 'user', '$2y$08$vQKX4PTcZ8r7jDUXkDCCYOXl4SxcJjj4CNxs/4wyP3wY4qC.BQmmO', NULL, 'user@user.com', NULL, 'me.9QSgsPEFFmM8df6s9tO044352bc6947e58fa2', 1406567757, 'VuRrxeKxA8WWsVt39PH/F.', 1404810260, 1406632112, 1, 'Us', 'ername', 'OSF GLobal Services', ''),
(5, '127.0.0.1', 'denys arkan', '$2y$08$SN.HQQiB/kMcPPjHLGn74.2ea5X4vVEBL6ZfpuljdkS9N60sdi.ga', NULL, 'denys.arkan@gmail.com', NULL, NULL, NULL, NULL, 1405498985, 1406106571, 1, 'Denys', 'Arkan', '', ''),
(7, '127.0.0.1', 'denys arkan1', '$2y$08$/w7i6eBA2iSGDsYqwEG02Oc4kl521AATdAFJh795urGYZHZpAs2Ii', NULL, 'dencik@ukr.cpm', NULL, NULL, NULL, NULL, 1405504352, 1405504352, 1, 'denys', 'arkan', NULL, NULL),
(10, '127.0.0.1', 'denys1 sdsdsd', '$2y$08$hAm1UzzDJ.iDKcA6gH2h9ew0zlbjszXCkbeGp1gd1eGVD1O6C5u0e', NULL, 'admiqqn@admin.com', 'd7855e6de7eee43604f7df42407627403a90d548', NULL, NULL, NULL, 1405504959, 1405504959, 0, 'Denys1', 'sdsdsd', NULL, NULL),
(11, '127.0.0.1', 'denys arkan2', '$2y$08$mgiseNojfpZ7VsHxsQOOC.MhWhN1mfWOdUCJyu835wcYE7djLXkRW', NULL, 'denys.arkan@gm.com', NULL, NULL, NULL, NULL, 1406189268, 1406630636, 1, 'Denys', 'Arkan', 'OSF GLobal Services2', ''),
(12, '127.0.0.1', 'denys xcvxcvxcvxc', '$2y$08$xxThcWtRs.cOYvxXrVzHyOXnEPRUEqW3Ashr/vWfTkQat/akdPkcS', NULL, 'denyxxxxs.arkan@gm.com', NULL, NULL, NULL, NULL, 1406632647, 1406632647, 1, 'denys', 'xcvxcvxcvxc', NULL, NULL),
(13, '127.0.0.1', 'denys arkan3', '$2y$08$GPjwnMSdnBSQRhQRy5OV2er6SGlrlPPTdT1/R8vcG1jne6GAipTge', NULL, 'denys.ark@gmail.com', NULL, NULL, NULL, NULL, 1406632879, 1406632879, 1, 'Denys', 'Arkan', NULL, NULL),
(14, '127.0.0.1', 'denys arkan4', '$2y$08$GEIhXUNlZJWJqCaTDJ.dieKuuOqt6zKWwc6Zw0nhp/k9tLREOGETq', NULL, 'arkan.arkadiy@mail.ru', NULL, 'HdzU1XIG4cWX3xpfAU35W.caae6beb4c20e7a6a6', 1406634097, NULL, 1406633569, 1406633920, 1, 'Denys', 'Arkan', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Дамп данных таблицы `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(23, 1, 1),
(25, 4, 2),
(21, 5, 2),
(15, 7, 2),
(18, 10, 2),
(22, 11, 2),
(26, 12, 2),
(27, 13, 2),
(28, 14, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `usertracking`
--

CREATE TABLE IF NOT EXISTS `usertracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `user_identifier` int(5) NOT NULL,
  `request_uri` text NOT NULL,
  `timestamp` varchar(20) NOT NULL,
  `client_ip` varchar(50) NOT NULL,
  `client_user_agent` text NOT NULL,
  `referer_page` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=529 ;

--
-- Дамп данных таблицы `usertracking`
--

INSERT INTO `usertracking` (`id`, `session_id`, `user_identifier`, `request_uri`, `timestamp`, `client_ip`, `client_user_agent`, `referer_page`) VALUES
(1, 'de1b045a91fbd77b56d89aee6c969bf9', 4, '/user', '1406463766', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(2, 'de1b045a91fbd77b56d89aee6c969bf9', 4, '/user', '1406463767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(3, 'de1b045a91fbd77b56d89aee6c969bf9', 4, '/user/all_feeds/4', '1406463784', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(4, 'de1b045a91fbd77b56d89aee6c969bf9', 4, '/user/all_feeds/js/jquery-1.10.2.js', '1406463785', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(5, 'de1b045a91fbd77b56d89aee6c969bf9', 4, '/user/all_feeds/js/bootstrap.js', '1406463785', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(6, 'de1b045a91fbd77b56d89aee6c969bf9', 4, '/user/single_feed/104', '1406463787', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(7, 'de1b045a91fbd77b56d89aee6c969bf9', 4, '/user/single_feed/js/bootstrap.js', '1406463787', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(8, 'de1b045a91fbd77b56d89aee6c969bf9', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406463787', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(9, 'ca699b1541641e68ddadb76209ac9c06', 4, '/user', '1406464902', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(10, 'ca699b1541641e68ddadb76209ac9c06', 4, '/user/all_feeds/4', '1406464904', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(11, 'ca699b1541641e68ddadb76209ac9c06', 4, '/user/all_feeds/js/bootstrap.js', '1406464905', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(12, 'ca699b1541641e68ddadb76209ac9c06', 4, '/user/all_feeds/js/jquery-1.10.2.js', '1406464905', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(13, '6fa9cdf05fcf31d54246a035b2b36865', 11, '/user', '1406464911', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(14, '6fa9cdf05fcf31d54246a035b2b36865', 11, '/user/single_feed/114', '1406464913', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(15, '6fa9cdf05fcf31d54246a035b2b36865', 11, '/user/single_feed/js/jquery-1.10.2.js', '1406464913', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(16, '6fa9cdf05fcf31d54246a035b2b36865', 11, '/user/single_feed/js/bootstrap.js', '1406464913', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(17, '6fa9cdf05fcf31d54246a035b2b36865', 11, '/user/refresh_posts/114', '1406464915', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(18, '6fa9cdf05fcf31d54246a035b2b36865', 11, '/user/single_feed/114', '1406464917', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(19, '6fa9cdf05fcf31d54246a035b2b36865', 11, '/user/single_feed/js/bootstrap.js', '1406464917', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(20, '6fa9cdf05fcf31d54246a035b2b36865', 11, '/user/single_feed/js/jquery-1.10.2.js', '1406464917', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(21, '76733f5e08c61bfc8f4f314fcbaa4927', 11, '/user/refresh_posts/114', '1406471587', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(22, '76733f5e08c61bfc8f4f314fcbaa4927', 11, '/user/single_feed/114', '1406471588', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(23, '76733f5e08c61bfc8f4f314fcbaa4927', 11, '/user/single_feed/js/jquery-1.10.2.js', '1406471588', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(24, '76733f5e08c61bfc8f4f314fcbaa4927', 11, '/user/single_feed/js/bootstrap.js', '1406471588', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(25, '76733f5e08c61bfc8f4f314fcbaa4927', 11, '/user', '1406471590', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(26, '76733f5e08c61bfc8f4f314fcbaa4927', 11, '/user/all_feeds/11', '1406471603', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(27, '76733f5e08c61bfc8f4f314fcbaa4927', 11, '/user/all_feeds/js/jquery-1.10.2.js', '1406471604', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/11'),
(28, '76733f5e08c61bfc8f4f314fcbaa4927', 11, '/user/all_feeds/js/bootstrap.js', '1406471604', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/11'),
(29, '76733f5e08c61bfc8f4f314fcbaa4927', 11, '/user', '1406471612', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/11'),
(30, 'bf93479de4c444b00517ff344aa2cbc9', 4, '/user', '1406480715', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(31, 'bf93479de4c444b00517ff344aa2cbc9', 4, '/user', '1406480727', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(32, '821635d6c8bbf2adbffe36bdee2e26d2', 1, '/user/all_feeds/11', '1406540762', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(33, '821635d6c8bbf2adbffe36bdee2e26d2', 1, '/user/all_feeds/js/jquery-1.10.2.js', '1406540762', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/11'),
(34, '821635d6c8bbf2adbffe36bdee2e26d2', 1, '/user/all_feeds/js/bootstrap.js', '1406540762', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/11'),
(35, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user', '1406541371', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(36, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user/single_feed/104', '1406541375', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(37, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406541376', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(38, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user/single_feed/js/bootstrap.js', '1406541376', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(39, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user/refresh_posts/104', '1406541378', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(40, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user/single_feed/104', '1406541379', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(41, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user/single_feed/js/bootstrap.js', '1406541380', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(42, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406541380', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(43, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user/all_feeds/4', '1406541381', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(44, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user/all_feeds/js/bootstrap.js', '1406541382', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(45, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user/all_feeds/js/jquery-1.10.2.js', '1406541382', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(46, 'fbd8c0877e2b18adc953f638b1403f9c', 4, '/user', '1406541386', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(47, 'b6624a30171e1c4aa1f35572a9b96e0a', 4, '/user', '1406541758', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/auth/login'),
(48, 'b6624a30171e1c4aa1f35572a9b96e0a', 4, '/user/all_feeds/4', '1406541761', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user'),
(49, 'b6624a30171e1c4aa1f35572a9b96e0a', 4, '/user/all_feeds/js/bootstrap.js', '1406541762', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/all_feeds/4'),
(50, 'b6624a30171e1c4aa1f35572a9b96e0a', 4, '/user/all_feeds/js/jquery-1.10.2.js', '1406541762', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/all_feeds/4'),
(51, 'b6624a30171e1c4aa1f35572a9b96e0a', 4, '/user/single_feed/113', '1406541763', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/all_feeds/4'),
(52, 'b6624a30171e1c4aa1f35572a9b96e0a', 4, '/user/single_feed/js/bootstrap.js', '1406541763', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/single_feed/113'),
(53, 'b6624a30171e1c4aa1f35572a9b96e0a', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406541763', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/single_feed/113'),
(54, 'b6624a30171e1c4aa1f35572a9b96e0a', 4, '/user', '1406541771', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/single_feed/113'),
(55, '4212cff8ccc0fe501ada8a8642fd7467', 4, '/user', '1406541795', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'http://osf_practice/auth/login'),
(56, '4212cff8ccc0fe501ada8a8642fd7467', 4, '/user/all_feeds/4', '1406541799', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'http://osf_practice/user'),
(57, '4212cff8ccc0fe501ada8a8642fd7467', 4, '/user/all_feeds/js/jquery-1.10.2.js', '1406541800', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'http://osf_practice/user/all_feeds/4'),
(58, '4212cff8ccc0fe501ada8a8642fd7467', 4, '/user/all_feeds/js/bootstrap.js', '1406541800', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'http://osf_practice/user/all_feeds/4'),
(59, '4212cff8ccc0fe501ada8a8642fd7467', 4, '/user', '1406541802', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'http://osf_practice/user/all_feeds/4'),
(60, 'c298d51a1e9f2b0416199eb81b979c58', 4, '/user', '1406542215', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(61, '361e9d828ee400595b730d305d55d425', 4, '/user', '1406550778', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(62, '361e9d828ee400595b730d305d55d425', 4, '/user/add_feed/4', '1406550782', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(63, '361e9d828ee400595b730d305d55d425', 4, '/user/add_feed/js/jquery-1.10.2.js', '1406550783', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/add_feed/4'),
(64, '361e9d828ee400595b730d305d55d425', 4, '/user/add_feed/js/bootstrap.js', '1406550783', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/add_feed/4'),
(65, '361e9d828ee400595b730d305d55d425', 4, '/user', '1406550784', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/add_feed/4'),
(66, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4', '1406550788', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(67, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/js/jquery-1.10.2.js', '1406550789', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(68, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/js/bootstrap.js', '1406550789', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(69, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/js/jquery-1.10.2.js', '1406550791', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(70, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/js/bootstrap.js', '1406550791', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(71, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/ajax_list_info', '1406550791', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(72, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/ajax_list_info', '1406550791', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(73, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/ajax_list', '1406550792', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(74, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/ajax_list', '1406550792', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(75, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/edit/113', '1406550795', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(76, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/edit/js/jquery-1.10.2.js', '1406550796', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4/edit/113'),
(77, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/edit/js/bootstrap.js', '1406550796', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4/edit/113'),
(78, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/update_validation/113', '1406550804', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4/edit/113'),
(79, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/update/113', '1406550804', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4/edit/113'),
(80, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/success/113', '1406550805', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4/edit/113'),
(81, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/success/js/jquery-1.10.2.js', '1406550806', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4/success/113'),
(82, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/success/js/bootstrap.js', '1406550806', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4/success/113'),
(83, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/ajax_list_info', '1406550808', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4/success/113'),
(84, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/ajax_list_info', '1406550808', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4/success/113'),
(85, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/ajax_list', '1406550808', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4/success/113'),
(86, '361e9d828ee400595b730d305d55d425', 4, '/user/edit_feeds/4/ajax_list', '1406550808', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4/success/113'),
(87, '361e9d828ee400595b730d305d55d425', 4, '/user', '1406551021', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/add_feed/4'),
(88, '361e9d828ee400595b730d305d55d425', 4, '/user/single_feed/113', '1406551023', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(89, '361e9d828ee400595b730d305d55d425', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406551024', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(90, '361e9d828ee400595b730d305d55d425', 4, '/user/single_feed/js/bootstrap.js', '1406551024', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(91, '361e9d828ee400595b730d305d55d425', 4, '/user/single_feed/113', '1406551036', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(92, '361e9d828ee400595b730d305d55d425', 4, '/user/single_feed/js/bootstrap.js', '1406551037', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(93, '361e9d828ee400595b730d305d55d425', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406551037', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(94, '361e9d828ee400595b730d305d55d425', 4, '/user', '1406551049', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(95, '361e9d828ee400595b730d305d55d425', 4, '/user/fetch_increment/', '1406551062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(96, '361e9d828ee400595b730d305d55d425', 4, '/user/', '1406551067', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(97, '361e9d828ee400595b730d305d55d425', 4, '/user/js/bootstrap.js', '1406551068', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/'),
(98, '361e9d828ee400595b730d305d55d425', 4, '/user/js/jquery-1.10.2.js', '1406551068', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/'),
(99, '361e9d828ee400595b730d305d55d425', 4, '/user/js/bootstrap.js', '1406551068', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/'),
(100, '361e9d828ee400595b730d305d55d425', 4, '/user', '1406551069', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(101, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/all_feeds/4', '1406551149', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(102, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/all_feeds/js/jquery-1.10.2.js', '1406551150', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(103, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/all_feeds/js/bootstrap.js', '1406551150', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(104, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/104', '1406551156', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(105, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/104', '1406551173', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(106, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406551174', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(107, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/js/bootstrap.js', '1406551174', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(108, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/refresh_posts/104', '1406551175', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(109, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/104', '1406551177', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(110, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406551177', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(111, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/js/bootstrap.js', '1406551177', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(112, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user', '1406551179', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(113, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/all_feeds/4', '1406551191', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(114, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/all_feeds/js/jquery-1.10.2.js', '1406551192', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(115, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/all_feeds/js/bootstrap.js', '1406551192', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(116, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/104', '1406551193', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(117, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406551194', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(118, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/js/bootstrap.js', '1406551194', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(119, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/refresh_posts/104', '1406551196', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(120, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/104', '1406551196', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(121, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/js/bootstrap.js', '1406551196', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(122, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406551196', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(123, '14834923018c0b1b0068491e1b8c3f2d', 4, '/user', '1406551198', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(124, '0f0d1e9d08f3c73d42e9c29bbda6a633', 4, '/user', '1406552288', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(125, '0f0d1e9d08f3c73d42e9c29bbda6a633', 4, '/user/all_feeds/4', '1406552291', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(126, '0f0d1e9d08f3c73d42e9c29bbda6a633', 4, '/user/all_feeds/js/jquery-1.10.2.js', '1406552291', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(127, '0f0d1e9d08f3c73d42e9c29bbda6a633', 4, '/user/all_feeds/js/bootstrap.js', '1406552291', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(128, '0f0d1e9d08f3c73d42e9c29bbda6a633', 4, '/user/single_feed/109', '1406552294', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(129, '0f0d1e9d08f3c73d42e9c29bbda6a633', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406552294', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/109'),
(130, '0f0d1e9d08f3c73d42e9c29bbda6a633', 4, '/user/single_feed/js/bootstrap.js', '1406552294', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/109'),
(131, '0f0d1e9d08f3c73d42e9c29bbda6a633', 4, '/user/refresh_posts/109', '1406552296', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/109'),
(132, '0f0d1e9d08f3c73d42e9c29bbda6a633', 4, '/user/single_feed/109', '1406552297', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/109'),
(133, '0f0d1e9d08f3c73d42e9c29bbda6a633', 4, '/user/single_feed/js/bootstrap.js', '1406552297', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/109'),
(134, '0f0d1e9d08f3c73d42e9c29bbda6a633', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406552297', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/109'),
(135, '8fe5c0b16a6f1e6f83259d8f12f48f92', 11, '/user', '1406552304', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(136, '8fe5c0b16a6f1e6f83259d8f12f48f92', 11, '/user/all_feeds/11', '1406552309', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(137, '8fe5c0b16a6f1e6f83259d8f12f48f92', 11, '/user/all_feeds/js/jquery-1.10.2.js', '1406552309', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/11'),
(138, '8fe5c0b16a6f1e6f83259d8f12f48f92', 11, '/user/all_feeds/js/bootstrap.js', '1406552309', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/11'),
(139, '8fe5c0b16a6f1e6f83259d8f12f48f92', 11, '/user/single_feed/114', '1406552312', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/11'),
(140, '8fe5c0b16a6f1e6f83259d8f12f48f92', 11, '/user/single_feed/js/jquery-1.10.2.js', '1406552313', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(141, '8fe5c0b16a6f1e6f83259d8f12f48f92', 11, '/user/single_feed/js/bootstrap.js', '1406552313', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(142, '8fe5c0b16a6f1e6f83259d8f12f48f92', 11, '/user/refresh_posts/114', '1406552315', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(143, '8fe5c0b16a6f1e6f83259d8f12f48f92', 11, '/user/single_feed/114', '1406552315', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(144, '8fe5c0b16a6f1e6f83259d8f12f48f92', 11, '/user/single_feed/js/bootstrap.js', '1406552316', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(145, '8fe5c0b16a6f1e6f83259d8f12f48f92', 11, '/user/single_feed/js/jquery-1.10.2.js', '1406552316', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(146, '5cb2303cbfb8e8b9a6d6ceec49d064ac', 11, '/user', '1406553628', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(147, '5cb2303cbfb8e8b9a6d6ceec49d064ac', 11, '/user/single_feed/114', '1406553630', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(148, '5cb2303cbfb8e8b9a6d6ceec49d064ac', 11, '/user/single_feed/js/jquery-1.10.2.js', '1406553631', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(149, '5cb2303cbfb8e8b9a6d6ceec49d064ac', 11, '/user/single_feed/js/bootstrap.js', '1406553631', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(150, '5cb2303cbfb8e8b9a6d6ceec49d064ac', 11, '/user/refresh_posts/114', '1406553633', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(151, '5cb2303cbfb8e8b9a6d6ceec49d064ac', 11, '/user/single_feed/114', '1406553634', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(152, '5cb2303cbfb8e8b9a6d6ceec49d064ac', 11, '/user/single_feed/js/bootstrap.js', '1406553635', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(153, '5cb2303cbfb8e8b9a6d6ceec49d064ac', 11, '/user/single_feed/js/jquery-1.10.2.js', '1406553635', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/114'),
(154, 'ae204e73cb66357c399e9506da369461', 4, '/user', '1406554991', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(155, 'ae204e73cb66357c399e9506da369461', 4, '/user/single_feed/113', '1406554994', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(156, 'ae204e73cb66357c399e9506da369461', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406554994', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(157, 'ae204e73cb66357c399e9506da369461', 4, '/user/single_feed/js/bootstrap.js', '1406554994', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(158, 'dbd67d91f5fb8220eea4260dbfef1229', 4, '/user', '1406555016', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(159, 'dbd67d91f5fb8220eea4260dbfef1229', 4, '/user/single_feed/113', '1406555022', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(160, 'dbd67d91f5fb8220eea4260dbfef1229', 4, '/user/single_feed/js/bootstrap.js', '1406555023', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(161, 'dbd67d91f5fb8220eea4260dbfef1229', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406555023', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(162, 'dbd67d91f5fb8220eea4260dbfef1229', 4, '/user/refresh_posts/113', '1406555025', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(163, 'dbd67d91f5fb8220eea4260dbfef1229', 4, '/user/single_feed/113', '1406555026', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(164, 'dbd67d91f5fb8220eea4260dbfef1229', 4, '/user/single_feed/js/bootstrap.js', '1406555027', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(165, 'dbd67d91f5fb8220eea4260dbfef1229', 4, '/user/single_feed/js/jquery-1.10.2.js', '1406555027', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(166, '17bfc27a1a3239402112d14a11dbb2f2', 4, '/user', '1406559080', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(167, '17bfc27a1a3239402112d14a11dbb2f2', 4, '/user/all_feeds/4', '1406559090', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(168, '17bfc27a1a3239402112d14a11dbb2f2', 4, '/user/single_feed/112', '1406559094', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(169, '17bfc27a1a3239402112d14a11dbb2f2', 4, '/user/refresh_posts/112', '1406559097', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/112'),
(170, '17bfc27a1a3239402112d14a11dbb2f2', 4, '/user/single_feed/112', '1406559098', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/112'),
(171, '17bfc27a1a3239402112d14a11dbb2f2', 4, '/user', '1406559100', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/112'),
(172, 'd857994c44a2db45158f4751d4d932d3', 4, '/user', '1406560280', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(173, '83948855366d837bd5f3944ab9c5e3a0', 1, '/user/', '1406561792', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(174, '7a76b85f08396535a453e6116142fda2', 4, '/user', '1406561804', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(175, '5a16b96d495a55940183c2bba535e77e', 4, '/user', '1406566793', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(176, '5a16b96d495a55940183c2bba535e77e', 4, '/user', '1406566933', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(177, '5a16b96d495a55940183c2bba535e77e', 4, '/user', '1406566983', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(178, '5a16b96d495a55940183c2bba535e77e', 4, '/user', '1406567012', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(179, '5a16b96d495a55940183c2bba535e77e', 4, '/user', '1406567028', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(180, '84eadcbfffb7155360cb74db69c6f065', 4, '/user', '1406567136', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(181, '84eadcbfffb7155360cb74db69c6f065', 4, '/user', '1406567163', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(182, '84eadcbfffb7155360cb74db69c6f065', 4, '/user', '1406567179', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(183, '84eadcbfffb7155360cb74db69c6f065', 4, '/user', '1406567202', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(184, '84eadcbfffb7155360cb74db69c6f065', 4, '/user', '1406567217', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(185, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/all_feeds/4', '1406567219', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(186, '84eadcbfffb7155360cb74db69c6f065', 4, '/user', '1406567222', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(187, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/all_feeds/4', '1406567228', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(188, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/single_feed/113', '1406567231', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(189, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/refresh_posts/113', '1406567234', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(190, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/single_feed/113', '1406567235', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(191, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/all_feeds/4', '1406567237', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(192, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/single_feed/112', '1406567240', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(193, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/single_feed/112/10', '1406567247', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/112'),
(194, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/all_feeds/4', '1406567254', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/112/10'),
(195, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/single_feed/104', '1406567256', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(196, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/refresh_posts/104', '1406567259', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(197, '84eadcbfffb7155360cb74db69c6f065', 4, '/user/single_feed/104', '1406567261', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(198, '84eb61b72cb1ab7dec6c9b364f95c53e', 4, '/user', '1406567771', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(199, '84eb61b72cb1ab7dec6c9b364f95c53e', 4, '/user/edit_feeds/4', '1406567780', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(200, '84eb61b72cb1ab7dec6c9b364f95c53e', 4, '/user/all_feeds/4', '1406567796', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(201, '84eb61b72cb1ab7dec6c9b364f95c53e', 4, '/user', '1406567798', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(202, '84eb61b72cb1ab7dec6c9b364f95c53e', 4, '/user/add_feed/4', '1406567801', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(203, '84eb61b72cb1ab7dec6c9b364f95c53e', 4, '/user', '1406567806', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/add_feed/4'),
(204, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user', '1406568717', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(205, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/all_feeds/4', '1406568728', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(206, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user', '1406568792', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(207, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/all_feeds/4', '1406568799', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(208, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/all_feeds/5', '1406568802', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(209, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/all_feeds/', '1406568806', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(210, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user', '1406568808', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/'),
(211, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user', '1406568817', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/forgot_password'),
(212, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/add_feed/4', '1406568822', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(213, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/add_feed/4', '1406568891', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(214, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/all_feeds/4', '1406568893', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/add_feed/4'),
(215, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user', '1406568896', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(216, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/single_feed/104', '1406568899', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(217, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/refresh_posts/104', '1406568925', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(218, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/single_feed/104', '1406568926', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(219, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/single_feed/104', '1406568934', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(220, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/refresh_posts/104', '1406568941', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(221, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/single_feed/104', '1406568941', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(222, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/single_feed/104/10', '1406568944', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(223, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/all_feeds/4', '1406568950', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104/10'),
(224, '890e3e974086f6e78bcd5dc8492ac6c2', 4, '/user/all_feeds/4', '1406568977', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104/10'),
(225, '1763b4734ca84c05256dda517513260a', 4, '/user/all_feeds/4', '1406569014', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104/10'),
(226, '1763b4734ca84c05256dda517513260a', 4, '/user/all_feeds/4', '1406569028', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104/10'),
(227, '1763b4734ca84c05256dda517513260a', 4, '/user/all_feeds/4', '1406569046', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104/10'),
(228, '1763b4734ca84c05256dda517513260a', 4, '/user', '1406569053', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(229, '1763b4734ca84c05256dda517513260a', 4, '/user', '1406569058', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(230, '1763b4734ca84c05256dda517513260a', 4, '/user/edit_feeds/4', '1406569076', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(231, '1763b4734ca84c05256dda517513260a', 4, '/user/add_feed/4', '1406569081', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(232, '1763b4734ca84c05256dda517513260a', 4, '/user/add_feed/4', '1406569103', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(233, '1763b4734ca84c05256dda517513260a', 4, '/user', '1406569108', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/add_feed/4'),
(234, '90290812d26d619fe3636ada3f76bffa', 4, '/user', '1406570070', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(235, '90290812d26d619fe3636ada3f76bffa', 4, '/user/all_feeds/11asa', '1406570074', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(236, '90290812d26d619fe3636ada3f76bffa', 4, '/user/all_feeds/', '1406570079', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(237, '90290812d26d619fe3636ada3f76bffa', 4, '/user/', '1406570083', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(238, '90290812d26d619fe3636ada3f76bffa', 4, '/user/3', '1406570086', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(239, '90290812d26d619fe3636ada3f76bffa', 4, '/user/3', '1406570126', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(240, '90290812d26d619fe3636ada3f76bffa', 4, '/user/3', '1406570140', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(241, '90290812d26d619fe3636ada3f76bffa', 4, '/user/3', '1406570293', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(242, '188df417745d1b60b36425587bcd296c', 4, '/user/3', '1406570388', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(243, '188df417745d1b60b36425587bcd296c', 4, '/user/3', '1406570414', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(244, '188df417745d1b60b36425587bcd296c', 4, '/user/3', '1406570415', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(245, '188df417745d1b60b36425587bcd296c', 4, '/user/3', '1406570416', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(246, '188df417745d1b60b36425587bcd296c', 4, '/user/3', '1406570445', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(247, '188df417745d1b60b36425587bcd296c', 4, '/user/3', '1406570461', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(248, '188df417745d1b60b36425587bcd296c', 4, '/user/3', '1406570492', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(249, '188df417745d1b60b36425587bcd296c', 4, '/user/', '1406570494', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(250, '188df417745d1b60b36425587bcd296c', 4, '/user/single_feed/113', '1406570498', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/');
INSERT INTO `usertracking` (`id`, `session_id`, `user_identifier`, `request_uri`, `timestamp`, `client_ip`, `client_user_agent`, `referer_page`) VALUES
(251, '188df417745d1b60b36425587bcd296c', 4, '/user/all_feeds/4', '1406570503', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(252, '188df417745d1b60b36425587bcd296c', 4, '/user/single_feed/104', '1406570506', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(253, '188df417745d1b60b36425587bcd296c', 4, '/user/single_feed/104/10', '1406570509', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(254, '188df417745d1b60b36425587bcd296c', 4, '/user/single_feed/104/', '1406570512', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104/10'),
(255, '188df417745d1b60b36425587bcd296c', 4, '/user', '1406570514', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104/'),
(256, '24d60d1228bf600e67c83736287afd22', 4, '/user', '1406570568', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(257, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570573', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(258, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570601', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(259, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570605', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(260, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570654', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(261, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570663', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(262, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570668', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(263, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570674', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(264, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570705', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(265, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570761', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(266, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570776', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(267, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570783', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(268, '24d60d1228bf600e67c83736287afd22', 4, '/user/3', '1406570802', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(269, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/3', '1406570879', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(270, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/3', '1406570917', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(271, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/3', '1406570918', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(272, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/3', '1406570969', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(273, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb3.jpg', '1406570970', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(274, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb1.jpg', '1406570970', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(275, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb2.jpg', '1406570970', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(276, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/3', '1406571035', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(277, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/css/bootstrap.min.css', '1406571036', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(278, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/css/font-awesome.min.css', '1406571036', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(279, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/css/prettyPhoto.css', '1406571036', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(280, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/ico/favicon.ico', '1406571036', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(281, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/css/animate.css', '1406571036', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(282, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/css/main.css', '1406571036', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(283, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/ico/favicon.ico', '1406571037', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(284, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/bootstrap.min.js', '1406571037', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(285, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/main.js', '1406571037', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(286, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/jquery.prettyPhoto.js', '1406571037', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(287, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/jquery.js', '1406571037', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(288, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb1.jpg', '1406571037', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(289, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb3.jpg', '1406571038', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(290, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb2.jpg', '1406571038', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(291, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/bootstrap.min.js', '1406571038', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(292, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/jquery.prettyPhoto.js', '1406571038', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(293, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/main.js', '1406571038', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(294, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/ico/apple-touch-icon-144-precomposed.png', '1406571046', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(295, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/ico/js/jquery.prettyPhoto.js', '1406571055', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(296, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/3', '1406571096', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(297, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/main.js', '1406571096', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(298, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/bootstrap.min.js', '1406571097', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(299, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/jquery.js', '1406571097', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(300, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/jquery.prettyPhoto.js', '1406571097', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(301, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb2.jpg', '1406571097', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(302, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb1.jpg', '1406571097', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(303, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb3.jpg', '1406571097', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(304, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/bootstrap.min.js', '1406571097', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(305, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/jquery.prettyPhoto.js', '1406571098', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(306, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/main.js', '1406571098', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(307, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/3', '1406571156', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(308, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/jquery.js', '1406571157', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(309, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/main.js', '1406571157', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(310, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/bootstrap.min.js', '1406571157', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(311, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/jquery.prettyPhoto.js', '1406571157', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(312, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb1.jpg', '1406571157', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(313, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb2.jpg', '1406571157', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(314, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb3.jpg', '1406571158', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(315, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/main.js', '1406571158', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(316, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user', '1406571159', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/3'),
(317, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/5', '1406571168', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(318, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb1.jpg', '1406571169', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(319, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb2.jpg', '1406571169', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(320, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/images/blog/thumb3.jpg', '1406571169', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(321, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/main.js', '1406571169', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(322, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/bootstrap.min.js', '1406571169', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(323, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/jquery.js', '1406571169', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(324, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/jquery.prettyPhoto.js', '1406571169', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(325, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/bootstrap.min.js', '1406571170', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(326, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/jquery.prettyPhoto.js', '1406571170', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(327, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user/js/main.js', '1406571170', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(328, 'e5ecf70c6e8e49c0ff141f45d3d4be0d', 4, '/user', '1406571174', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(329, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user', '1406571196', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(330, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/5', '1406571199', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(331, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.js', '1406571200', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(332, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb1.jpg', '1406571200', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(333, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb2.jpg', '1406571200', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(334, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb3.jpg', '1406571200', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(335, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/bootstrap.min.js', '1406571201', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(336, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571201', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(337, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.prettyPhoto.js', '1406571201', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(338, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571201', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(339, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/5', '1406571209', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(340, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.prettyPhoto.js', '1406571210', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(341, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb1.jpg', '1406571210', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(342, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/bootstrap.min.js', '1406571211', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(343, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb2.jpg', '1406571211', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(344, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.js', '1406571211', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(345, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb3.jpg', '1406571211', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(346, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571211', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(347, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/bootstrap.min.js', '1406571211', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(348, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.prettyPhoto.js', '1406571211', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(349, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571212', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(350, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/5', '1406571221', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(351, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.prettyPhoto.js', '1406571222', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(352, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb2.jpg', '1406571222', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(353, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.js', '1406571222', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(354, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/bootstrap.min.js', '1406571222', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(355, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb1.jpg', '1406571222', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(356, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571223', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(357, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb3.jpg', '1406571223', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(358, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.prettyPhoto.js', '1406571223', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(359, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571223', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(360, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/5', '1406571238', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(361, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/bootstrap.min.js', '1406571239', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(362, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.js', '1406571239', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(363, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb1.jpg', '1406571239', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(364, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571240', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(365, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb2.jpg', '1406571240', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(366, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.prettyPhoto.js', '1406571240', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(367, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb3.jpg', '1406571240', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(368, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/bootstrap.min.js', '1406571240', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(369, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.prettyPhoto.js', '1406571240', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(370, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571240', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(371, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user', '1406571243', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(372, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/5', '1406571249', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(373, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb2.jpg', '1406571250', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(374, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb3.jpg', '1406571250', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(375, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/bootstrap.min.js', '1406571250', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(376, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.prettyPhoto.js', '1406571250', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(377, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/images/blog/thumb1.jpg', '1406571250', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(378, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.js', '1406571250', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(379, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571250', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(380, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/bootstrap.min.js', '1406571251', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(381, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.prettyPhoto.js', '1406571251', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(382, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571251', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(383, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/5', '1406571291', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(384, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/bootstrap.min.js', '1406571292', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(385, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.js', '1406571292', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(386, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571292', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(387, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.prettyPhoto.js', '1406571292', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(388, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/bootstrap.min.js', '1406571293', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(389, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/jquery.prettyPhoto.js', '1406571293', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(390, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/js/main.js', '1406571293', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(391, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user', '1406571296', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/5'),
(392, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user/single_feed/113', '1406571302', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(393, 'fdf54c0d19e65f44f9ceb297cf912502', 4, '/user', '1406571308', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/113'),
(394, '635e79ca4286f3efca649f886c3cbf5f', 4, '/user', '1406623965', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(395, '635e79ca4286f3efca649f886c3cbf5f', 4, '/user/all_feeds/4', '1406623969', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(396, '635e79ca4286f3efca649f886c3cbf5f', 4, '/user', '1406623981', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/forgot_password'),
(397, '635e79ca4286f3efca649f886c3cbf5f', 4, '/user', '1406623986', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(398, '635e79ca4286f3efca649f886c3cbf5f', 4, '/user/edit_feeds/4', '1406623993', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(399, '635e79ca4286f3efca649f886c3cbf5f', 4, '/user/edit_feeds/4', '1406624083', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(400, '828086122baa10e2e4c08b1462534a55', 4, '/user', '1406624148', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/auth/login'),
(401, '828086122baa10e2e4c08b1462534a55', 4, '/user/edit_feeds/4', '1406624151', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user'),
(402, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user', '1406624272', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(403, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4', '1406624275', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(404, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list_info', '1406624277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(405, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list_info', '1406624277', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(406, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list', '1406624278', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(407, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list', '1406624278', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(408, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user', '1406624313', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(409, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4', '1406624316', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(410, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list_info', '1406624319', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(411, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list_info', '1406624319', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(412, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list', '1406624319', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(413, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list', '1406624319', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(414, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user', '1406624340', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(415, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4', '1406624344', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(416, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list_info', '1406624346', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(417, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list_info', '1406624346', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(418, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list', '1406624346', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(419, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/edit_feeds/4/ajax_list', '1406624346', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/4'),
(420, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/add_feed/4', '1406624362', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(421, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user', '1406624366', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/add_feed/4'),
(422, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/all_feeds/4', '1406624374', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(423, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/single_feed/111', '1406624377', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(424, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/single_feed/111/10', '1406624381', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/111'),
(425, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/all_feeds/4', '1406624385', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/111/10'),
(426, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user', '1406624391', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(427, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/all_feeds/4', '1406624398', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(428, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/single_feed/104', '1406624401', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(429, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/refresh_posts/104', '1406624406', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(430, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user/single_feed/104', '1406624408', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(431, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user', '1406624422', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(432, '025bd587a0adfc5b33c51eac9e4bf0ba', 4, '/user', '1406624535', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(433, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4', '1406624539', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user'),
(434, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/ajax_list_info', '1406624540', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4'),
(435, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/ajax_list_info', '1406624540', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4'),
(436, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/ajax_list', '1406624541', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4'),
(437, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/ajax_list', '1406624541', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4'),
(438, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/edit/104', '1406624558', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4'),
(439, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/update_validation/104', '1406624577', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4/edit/104'),
(440, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/update/104', '1406624578', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4/edit/104'),
(441, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/success/104', '1406624578', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4/edit/104'),
(442, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/ajax_list_info', '1406624579', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4/success/104'),
(443, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/ajax_list_info', '1406624579', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4/success/104'),
(444, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/ajax_list', '1406624580', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4/success/104'),
(445, '301828335c535ec93ebe303b7f922c0d', 4, '/user/edit_feeds/4/ajax_list', '1406624580', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/edit_feeds/4/success/104'),
(446, '301828335c535ec93ebe303b7f922c0d', 4, '/user', '1406624582', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user'),
(447, '301828335c535ec93ebe303b7f922c0d', 4, '/user/all_feeds/4', '1406624585', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user'),
(448, '301828335c535ec93ebe303b7f922c0d', 4, '/user/single_feed/104', '1406624589', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/all_feeds/4'),
(449, '301828335c535ec93ebe303b7f922c0d', 4, '/user/refresh_posts/104', '1406624591', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/single_feed/104'),
(450, '301828335c535ec93ebe303b7f922c0d', 4, '/user/single_feed/104', '1406624591', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/single_feed/104'),
(451, '301828335c535ec93ebe303b7f922c0d', 4, '/user', '1406624787', '127.0.0.1', 'Opera/9.80 (Windows NT 6.1; U; Edition Yx 01; ru) Presto/2.10.229 Version/11.61', 'http://osf_practice/user/single_feed/104'),
(452, '9d56ecfb2e2a9a1923ad0162c458b287', 4, '/user', '1406629437', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(453, '9d56ecfb2e2a9a1923ad0162c458b287', 4, '/user/all_feeds/4', '1406629441', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(454, '9d56ecfb2e2a9a1923ad0162c458b287', 4, '/user', '1406629443', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(455, '9d56ecfb2e2a9a1923ad0162c458b287', 4, '/user', '1406629531', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(456, '9d56ecfb2e2a9a1923ad0162c458b287', 4, '/user', '1406629547', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/4'),
(457, 'bd9e492a31fa7beace5f1a8f7b6f4aa2', 4, '/user', '1406629927', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(458, 'bd9e492a31fa7beace5f1a8f7b6f4aa2', 4, '/user', '1406629928', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(459, 'bd9e492a31fa7beace5f1a8f7b6f4aa2', 4, '/user', '1406629979', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(460, 'bd9e492a31fa7beace5f1a8f7b6f4aa2', 4, '/user', '1406629990', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(461, 'bd9e492a31fa7beace5f1a8f7b6f4aa2', 4, '/user', '1406629997', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(462, 'bd9e492a31fa7beace5f1a8f7b6f4aa2', 4, '/user', '1406630007', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(463, 'bd9e492a31fa7beace5f1a8f7b6f4aa2', 4, '/user', '1406630196', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(464, 'bd9e492a31fa7beace5f1a8f7b6f4aa2', 4, '/user', '1406630208', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(465, 'c37f3a6d734ace896dd0702aba72705d', 4, '/user', '1406630284', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(466, 'c37f3a6d734ace896dd0702aba72705d', 4, '/user', '1406630306', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(467, '13a31c00de124c81443466f6f764fbf8', 4, '/user', '1406630617', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(468, '13a31c00de124c81443466f6f764fbf8', 4, '/user', '1406630628', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(469, '1a5f54318471bc23796d68993c6a8765', 11, '/user', '1406630637', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(470, '1a5f54318471bc23796d68993c6a8765', 11, '/user/all_feeds/11', '1406630640', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(471, '1a5f54318471bc23796d68993c6a8765', 11, '/user', '1406544283', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/11'),
(472, '1a5f54318471bc23796d68993c6a8765', 11, '/user', '1406544298', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/11'),
(473, '1a5f54318471bc23796d68993c6a8765', 11, '/user', '1406630708', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/11'),
(474, 'b3c447b5a19558ad3fc4d9154bc43364', 4, '/user', '1406630855', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(475, 'b3c447b5a19558ad3fc4d9154bc43364', 4, '/user/single_feed/104', '1406630858', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(476, 'b3c447b5a19558ad3fc4d9154bc43364', 4, '/user/refresh_posts/104', '1406630860', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(477, 'b3c447b5a19558ad3fc4d9154bc43364', 4, '/user/single_feed/104', '1406630862', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(478, '2b9f21aac27496cf088ecd0de397ff23', 4, '/user', '1406632037', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(479, '2b9f21aac27496cf088ecd0de397ff23', 4, '/user/single_feed/104', '1406632041', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(480, '2b9f21aac27496cf088ecd0de397ff23', 4, '/user/refresh_posts/104', '1406632044', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(481, '2b9f21aac27496cf088ecd0de397ff23', 4, '/user/single_feed/104', '1406632044', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/104'),
(482, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632113', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(483, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632193', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(484, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632208', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(485, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632219', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(486, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632228', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(487, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632242', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(488, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632253', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(489, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632280', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(490, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632290', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(491, '3607cb5975f34f79457b35c113701588', 4, '/user/all_feeds/4', '1406632302', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(492, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632306', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(493, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632325', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(494, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632365', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(495, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632376', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(496, '3607cb5975f34f79457b35c113701588', 4, '/user', '1406632383', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(497, '98610bda77fa2c3aef7038bd384329fc', 4, '/user', '1406632421', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(498, '98610bda77fa2c3aef7038bd384329fc', 4, '/user', '1406632439', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(499, '98610bda77fa2c3aef7038bd384329fc', 4, '/user', '1406632498', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(500, '98610bda77fa2c3aef7038bd384329fc', 4, '/user', '1406632510', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(501, '98610bda77fa2c3aef7038bd384329fc', 4, '/user', '1406632566', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(502, '98610bda77fa2c3aef7038bd384329fc', 4, '/user', '1406632568', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(503, '98610bda77fa2c3aef7038bd384329fc', 4, '/user', '1406632576', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(504, '98610bda77fa2c3aef7038bd384329fc', 4, '/user', '1406632589', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/auth/edit_user/4'),
(505, '98610bda77fa2c3aef7038bd384329fc', 4, '/user/all_feeds/4', '1406632609', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(506, '63024f9f74850751d37b2f191acc0e40', 14, '/user', '1406633921', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', ''),
(507, '63024f9f74850751d37b2f191acc0e40', 14, '/user/all_feeds/14', '1406633926', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(508, '63024f9f74850751d37b2f191acc0e40', 14, '/user', '1406633930', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/all_feeds/14'),
(509, '63024f9f74850751d37b2f191acc0e40', 14, '/user/add_feed/14', '1406633933', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(510, '63024f9f74850751d37b2f191acc0e40', 14, '/user/add_feed', '1406633938', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/add_feed/14');
INSERT INTO `usertracking` (`id`, `session_id`, `user_identifier`, `request_uri`, `timestamp`, `client_ip`, `client_user_agent`, `referer_page`) VALUES
(511, '63024f9f74850751d37b2f191acc0e40', 14, '/user', '1406633939', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/add_feed/14'),
(512, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14', '1406633944', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(513, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/ajax_list_info', '1406633947', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14'),
(514, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/ajax_list_info', '1406633947', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14'),
(515, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/ajax_list', '1406633947', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14'),
(516, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/ajax_list', '1406633947', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14'),
(517, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/edit/116', '1406633949', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14'),
(518, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/update_validation/116', '1406633954', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14/edit/116'),
(519, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/update/116', '1406633955', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14/edit/116'),
(520, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/success/116', '1406633956', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14/edit/116'),
(521, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/ajax_list_info', '1406633958', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14/success/116'),
(522, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/ajax_list_info', '1406633958', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14/success/116'),
(523, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/ajax_list', '1406633959', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14/success/116'),
(524, '63024f9f74850751d37b2f191acc0e40', 14, '/user/edit_feeds/14/ajax_list', '1406633959', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/edit_feeds/14/success/116'),
(525, '63024f9f74850751d37b2f191acc0e40', 14, '/user', '1406633962', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(526, '63024f9f74850751d37b2f191acc0e40', 14, '/user/single_feed/116', '1406633965', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user'),
(527, '63024f9f74850751d37b2f191acc0e40', 14, '/user/refresh_posts/116', '1406633968', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/116'),
(528, '63024f9f74850751d37b2f191acc0e40', 14, '/user/single_feed/116', '1406633968', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 'http://osf_practice/user/single_feed/116');

-- --------------------------------------------------------

--
-- Структура таблицы `views`
--

CREATE TABLE IF NOT EXISTS `views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(50) NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `day` (`day`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Дамп данных таблицы `views`
--

INSERT INTO `views` (`id`, `day`, `views`) VALUES
(1, '2014-07-29', 35),
(7, '2014-07-28', 2);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `feeds`
--
ALTER TABLE `feeds`
  ADD CONSTRAINT `fk_feeds_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rss_posts`
--
ALTER TABLE `rss_posts`
  ADD CONSTRAINT `fk_rss_posts_feeds1` FOREIGN KEY (`feeds_id`) REFERENCES `feeds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
