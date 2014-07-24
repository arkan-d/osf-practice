-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июл 24 2014 г., 11:11
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
('5d13f0eac73ac663bcbbc295051d6ed5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1406189387, 'a:6:{s:9:"user_data";s:0:"";s:8:"identity";s:18:"denys.arkan@gm.com";s:8:"username";s:12:"denys arkan2";s:5:"email";s:18:"denys.arkan@gm.com";s:7:"user_id";s:2:"11";s:14:"old_last_login";s:10:"1406189268";}');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=115 ;

--
-- Дамп данных таблицы `feeds`
--

INSERT INTO `feeds` (`id`, `link`, `thumbnail`, `description`, `users_id`, `favourite`) VALUES
(104, 'http://www.spiegel.de/schlagzeilen/tops/index.rss', NULL, NULL, 4, 1),
(109, 'http://feeds.feedburner.com/e64f?format=xml', NULL, NULL, 4, 0),
(111, 'http://feeds.visitlondon.com/WhatsOnInLondon?format=xml', NULL, NULL, 4, 0),
(112, 'http://feeds.feedburner.com/ruseller/CdHX?format=xml', NULL, NULL, 4, 0),
(113, 'http://feeds.visitlondon.com/LondonComedyGuide?format=xml', NULL, '<p>\r\n	last description</p>\r\n', 4, 1),
(114, 'http://www.spiegel.de/schlagzeilen/tops/index.rss', NULL, NULL, 11, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=607 ;

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
(547, 'Sudan: Zum Tode verurteilte Christin rettet sich nach Italien', 'Wegen ihres Übertritts zum Christentum wurde eine Frau im Sudan zum Tode verurteilt. Jetzt durfte Mariam Jahia Ibrahim Ishak mit ihrer Familie nach Italien ausfliegen.', 'http://www.spiegel.de/politik/ausland/sudan-zum-tode-verurteilte-christin-nach-italien-a-982643.html#ref=rss', 104),
(548, 'Afghanistan: Gericht verhängt Todesstrafe gegen Mörder der Fotografin Niedringhaus', 'Die sechs Richter in Kabul waren sich einig: Sie verurteilten den Mörder der in Afghanistan getöteten deutschen Fotografin Anja Niedringhaus zum Tode.', 'http://www.spiegel.de/politik/ausland/anja-niedringhaus-todesstrafe-fuer-moerder-der-fotografin-in-afghanistan-a-982631.html#ref=rss', 104),
(549, 'Gaza-Konflikt: Uno-Generalsekretär empört über Raketenfunde in Schulen', 'In mehreren Uno-Schulen im Gazastreifen sind Raketen versteckt worden. Generalsekretär Ban Ki Moon fordert Aufklärung: Das Leben unschuldiger Kinder sei in Gefahr gebracht worden.', 'http://www.spiegel.de/politik/ausland/krieg-in-gaza-ban-ki-moon-empoert-ueber-raketen-fund-in-uno-schulen-a-982624.html#ref=rss', 104),
(550, 'Stiftung Warentest: Viele Mineralwässer sind verunreinigt', 'Die Stiftung Warentest hat in 10 von 30 Medium-Mineralwässern Süßstoff oder Abbauprodukte von Pestiziden entdeckt. Uneingeschränkt empfehlen können die Tester nur wenige Produkte - vor allem günstige Eigenmarken von Lidl und Co.', 'http://www.spiegel.de/wirtschaft/service/stiftung-warentest-verunreinigung-vieler-mineralwasser-mit-a-982627.html#ref=rss', 104),
(551, 'Zwei Stunden Todeskampf: US-Doppelmörder stirbt bei qualvoller Hinrichtung', 'In den USA ist erneut ein Mann grausam hingerichtet worden. Bis Joseph Wood tot war, vergingen zwei Stunden.', 'http://www.spiegel.de/panorama/justiz/qualvolle-hinrichtung-in-arizona-moerder-stirbt-nach-zwei-stunden-a-982625.html#ref=rss', 104),
(552, 'Gaza-Konflikt: Deutsche Politiker kritisieren Flugstopp nach Israel', 'Die US-Luftfahrtbehörde hat das Flugverbot für amerikanische Airlines nach Tel Aviv aufgehoben. Doch die Lufthansa und andere Gesellschaften steuern Israel weiter nicht an. Deutsche Politiker kritisieren die Einstellung der Flüge massiv.', 'http://www.spiegel.de/politik/ausland/gaza-konflikt-flugverbot-nach-israel-in-der-kritik-a-982623.html#ref=rss', 104),
(553, 'Akute Rückenschmerzen: Paracetamol nicht besser als Placebo', 'Bei akuten Rückenschmerzen entscheiden sich Patienten wie Ärzte häufig für einen Wirkstoff: Paracetamol. Doch einer neuen Studie zufolge hilft das Schmerzmittel nicht besser als ein Placebo.', 'http://www.spiegel.de/gesundheit/diagnose/akute-rueckenschmerzen-paracetamol-nicht-besser-als-placebo-a-982366.html#ref=rss', 104);
INSERT INTO `rss_posts` (`id`, `title`, `description`, `link`, `feeds_id`) VALUES
(554, 'Maccabi Haifa: Testspiel von israelischem Spitzenklub nach Platzsturm abgebrochen', 'Anti-Israel-Proteste auch beim Fußball: Nach Angriffen auf Spieler und einem Zuschauersturm auf den Rasen ist ein Spiel des israelischen Klubs Maccabi Haifa in Österreich abgebrochen worden. Am Samstag spielt das Team gegen Paderborn.', 'http://www.spiegel.de/sport/fussball/anti-israel-proteste-testspiel-abgebrochen-a-982622.html#ref=rss', 104),
(555, 'Erdumrundung: 17-Jähriger stirbt bei Weltrekordversuch mit Flugzeug', 'Er wollte der jüngste Mensch sein, der jemals in einer einmotorigen Maschine in 30 Tagen um die Welt flog. Diesen Wunsch musste Haris Suleman nun mit dem Leben bezahlen. Sein Flugzeug stürzte vor Amerikanisch-Samoa ins Meer.', 'http://www.spiegel.de/panorama/weltrekordversuch-17-jaehriger-stirbt-bei-flugzeugabsturz-a-982620.html#ref=rss', 104),
(556, 'Ostukraine: Rebellenführer bestätigt Besitz von Buk-Flugabwehr', 'Die Separatisten in der Ostukraine verfügten über das Buk-System, mit dessen Raketen offenbar der Malaysia-Airlines-Flug MH17 abgeschossen wurde. Das räumt jetzt ein einflussreicher Rebellenkommandeur ein. Er will auch wissen, woher die Waffe kam.', 'http://www.spiegel.de/politik/ausland/mh17-rebellenkommandeur-bestaetigt-besitz-von-buk-raketen-a-982616.html#ref=rss', 104),
(557, 'Unglücksflug MH17: Niederlande finden keine Hinweise auf Manipulation der Blackbox', 'Die Flugschreiber des abgestürzten Malaysia-Airlines-Flugzeugs befanden sich tagelang in den Händen von Aufständischen. Doch Befürchtungen, dass die Separatisten die Blackbox manipulierten, waren unbegründet. ', 'http://www.spiegel.de/politik/ausland/malaysia-airlines-mh17-boeing-777-blackbox-wurde-nicht-manipuliert-a-982607.html#ref=rss', 104),
(558, '"Russisches Blackwater": Moskau will Privatarmeen aufbauen', 'Die russische Regierung plant den Einsatz privater Sicherheitsfirmen. Die nichtstaatlichen Kämpfer sollen einspringen, wenn es politisch brenzlig wird.', 'http://www.spiegel.de/politik/ausland/russland-kreml-plant-privatarmee-nach-dem-vorbild-blackwater-a-982559.html#ref=rss', 104),
(559, 'Internet-Agenda der Bundesregierung: Drei Minister, eine Enttäuschung', 'Schneller, höher, weiter: Die Bundesregierung hat ihre Digitale Agenda vorgelegt - sie verspricht nicht weniger als eine Internet-Revolution für Deutschland. Und was heißt das konkret?', 'http://www.spiegel.de/politik/deutschland/digitale-agenda-erster-gesetzentwurf-ist-eine-enttaeuschung-a-982503.html#ref=rss', 104),
(560, 'Kämpfe in der Ostukraine: Kiew macht Russland für Kampfjet-Abschuss verantwortlich', 'Für die Regierung in Kiew ist die Sache klar: Die Raketen auf zwei ukrainische Kampfjets seien von russischem Territorium aus abgefeuert worden. ', 'http://www.spiegel.de/politik/ausland/ukraine-macht-russland-fuer-abschuss-von-kampfjets-verantwortlich-a-982587.html#ref=rss', 104),
(561, 'Gauck zu judenfeindlichen Demos: "Wir wollen Antisemitismus nicht hinnehmen"', 'Nach antisemitischen Parolen bei Anti-Israel-Kundgebungen verlangt Bundespräsident Gauck mehr Zivilcourage von den Deutschen. Die Kanzlerin warnt vor einem "Angriff auf Freiheit und Toleranz".', 'http://www.spiegel.de/politik/deutschland/antisemitismus-bundespraesident-gauck-fordert-zivilcourage-a-982566.html#ref=rss', 104),
(562, 'Antisemitismus: Staatsanwaltschaft ermittelt gegen Berliner Hassprediger', 'Sheikh Abu Bilal Ismail wetterte in der Berliner Al-Nur-Moschee gegen Juden. Jetzt hat die Staatsanwaltschaft Ermittlungen eingeleitet. Der Vorwurf: Volksverhetzung.', 'http://www.spiegel.de/politik/deutschland/antisemitismus-ermittlungen-gegen-hassprediger-wegen-volksverhetzung-a-982381.html#ref=rss', 104),
(563, 'Flugzeugunglück: Bruchlandung in Taiwan - viele Tote', 'In der taiwanischen Provinz Penghu sind bei einem Flugzeugunglück offenbar mindestens 47 Menschen gestorben. Laut der chinesischen Nachrichtenagentur Xinhua missglückte die Notlandung eines Flugzeugs der Linie Transasia.', 'http://www.spiegel.de/panorama/taiwan-tote-bei-flugzeugunglueck-der-transasia-a-982557.html#ref=rss', 104),
(564, 'Prozess in Regensburg: Mollath-Anwälte sollen als Pflichtverteidiger weitermachen', 'Turbulenter Tag vor dem Landgericht Regensburg: Die Mollath-Anwälte legen ihr Mandat nieder - weil der Mandant offenbar das Vertrauen in sie verloren hat. Nun sollen die Juristen als Pflichtverteidiger weiterarbeiten.', 'http://www.spiegel.de/panorama/justiz/mollath-prozes-anwalt-strate-wird-pflichtverteidiger-a-982550.html#ref=rss', 104),
(565, 'Transport-App: Hamburg verbietet Fahrdienst Uber', 'Taxifahrer hassen die Konkurrenz durch Uber, jetzt will die Stadt Hamburg den kalifornischen Dienst stoppen. Die Verkehrsbehörde bezeichnet dessen App als "nicht legal". Privatleute, die sich dem Verbot widersetzen, riskieren hohe Strafen.', 'http://www.spiegel.de/wirtschaft/unternehmen/uber-hamburg-verbietet-fahrtdienst-a-982543.html#ref=rss', 104),
(566, 'Krise in der Ukraine: Merkel verlangt schnelle Sanktionen gegen Russland', 'Der Druck auf Wladimir Putin steigt. Bundeskanzlerin Merkel fordert jetzt weitere Strafmaßnahmen gegen Russland - weil Moskau kein Interesse an einer schnellen Aufklärung des MH17-Abschusses zeige. Das Auswärtige Amt erklärt: "Jetzt reicht es."', 'http://www.spiegel.de/politik/ausland/ukraine-merkel-fordert-schnelle-eu-sanktionen-gegen-russland-a-982546.html#ref=rss', 104),
(567, 'Prozess in Regensburg: Verteidiger von Mollath legen Mandat nieder', 'Die beiden Verteidiger von Gustl Mollath haben ihr Mandat niedergelegt. Dies erfolge auf Wunsch des Angeklagten, sagte Mollaths Anwalt Gerhard Strate. ', 'http://www.spiegel.de/panorama/justiz/gustl-mollath-verteidiger-legen-mandat-nieder-a-982541.html#ref=rss', 104),
(568, 'Deutsche Fußball-Nationalmannschaft: Bundestrainer Löw macht bis 2016 weiter', 'Er macht weiter: Joachim Löw bleibt bis 2016 Bundestrainer der Fußball-Nationalmannschaft. "Ich bin so motiviert wie am ersten Tag", sagt der 54-Jährige.', 'http://www.spiegel.de/sport/fussball/joachim-loew-bundestrainer-macht-bis-2016-weiter-a-982542.html#ref=rss', 104),
(569, 'Terrorgruppe im Irak: "Islamischer Staat" lässt Schaufensterpuppen verhüllen', 'Die Radikalen berufen sich auf das Bilderverbot im Islam: Im Einflussgebiet der Terrorgruppe "Islamischer Staat" müssen sich nicht nur Frauen verschleiern - sondern auch Schaufensterpuppen.', 'http://www.spiegel.de/politik/ausland/irak-islamischer-staat-laesst-schaufensterpuppen-in-mossul-verhuellen-a-982485.html#ref=rss', 104),
(570, 'Kämpfe in der Ostukraine: Separatisten schießen zwei ukrainische Militärjets ab', 'Schon wieder sind in der Ostukraine zwei Flugzeuge abgestürzt: Die prorussischen Milizen haben zwei Militärjets der Armee abgeschossen - nahe dem Unglücksort des Malaysian-Airlines-Fluges MH17.', 'http://www.spiegel.de/politik/ausland/ukraine-separatisten-teilen-abschuss-von-zwei-militaerjets-mit-a-982525.html#ref=rss', 104),
(571, 'Klimapolitik: Brüssel beschließt Energiesparziel von 30 Prozent', 'Die EU-Kommission wird nach SPIEGEL-ONLINE-Informationen ein Energieeffizienzziel von 30 Prozent für 2030 vorschlagen. Dies ist höher als erwartet - und entspricht der Forderung des künftigen Kommissionschefs Jean-Claude Juncker.', 'http://www.spiegel.de/wirtschaft/soziales/energieeffizienz-eu-kommission-will-ziel-von-30-prozent-fuer-2030-a-982471.html#ref=rss', 104),
(572, 'Reaktion auf Russlands Ukraine-Politik: Nato hält Putin Lügen vor', 'Die Nato schlägt einen eisigen Ton gegenüber Russland an: In einer Erklärung wirft das Militärbündnis Kreml-Chef Wladimir Putin vor, Unwahrheiten zu verbreiten. Im Gegensatz zu Moskau halte sich der Westen an internationale Vereinbarungen.', 'http://www.spiegel.de/politik/ausland/ukraine-konflikt-mit-russland-nato-haelt-putin-luegen-vor-a-982517.html#ref=rss', 104),
(573, '"Freies Netz Süd": Bayern verbietet größtes Neonazi-Netzwerk', '"Aggressiv und verfassungsfeindlich": Das bayerische Innenministerium hat das rechtsextreme "Freie Netz Süd" verboten. Zudem gehen die Behörden gegen Unterstützer vor - ein bundesweit bekannter Neonazi-Treffpunkt wird durchsucht. ', 'http://www.spiegel.de/politik/deutschland/freies-netz-sued-bayern-verbietet-neonazi-netzwerk-a-982487.html#ref=rss', 104),
(574, 'Eingestellter Flugverkehr nach Tel Aviv: Airlines bescheren der Hamas einen Erfolg', 'Dutzende internationale Airlines haben ihren Flugverkehr nach Israel eingestellt: Ein großer strategischer Sieg für die Hamas - er könnte Israel zu Zugeständnissen zwingen. ', 'http://www.spiegel.de/politik/ausland/fluege-nach-tel-aviv-airlines-bescheren-der-hamas-einen-erfolg-a-982452.html#ref=rss', 104),
(575, 'Allianz-Berechnung: Mini-Zinsen kosten deutsche Sparer im Schnitt 67 Euro im Jahr', 'Die mickrigen Zinsen kommen Deutschlands Sparer teuer zu stehen. Laut Allianz summierte sich der Verlust 2013 auf 67,60 Euro pro Kopf im Vergleich zur Zeit vor der Finanzkrise. Dieses Jahr fällt das Minus wohl noch größer aus.', 'http://www.spiegel.de/wirtschaft/service/mini-zinsen-kosten-sparer-in-deutschland-laut-allianz-milliarden-a-982463.html#ref=rss', 104),
(576, '"Costa Concordia": Wrack nimmt Kurs auf Genua', 'Die letzte Reise der "Costa Concordia" hat begonnen. Zweieinhalb Jahre nach der Havarie bewegt sich das Kreuzfahrtschiff wieder. Schlepper haben das Wrack von der Insel Giglio weggezogen und Kurs auf Genua genommen.', 'http://www.spiegel.de/panorama/costa-concordia-abtransport-von-giglio-nach-genua-beginnt-a-982468.html#ref=rss', 104),
(577, 'Sudan: Zum Tode verurteilte Christin rettet sich nach Italien', 'Wegen ihres Übertritts zum Christentum wurde eine Frau im Sudan zum Tode verurteilt. Jetzt durfte Mariam Jahia Ibrahim Ishak mit ihrer Familie nach Italien ausfliegen.', 'http://www.spiegel.de/politik/ausland/sudan-zum-tode-verurteilte-christin-nach-italien-a-982643.html#ref=rss', 114),
(578, 'Afghanistan: Gericht verhängt Todesstrafe gegen Mörder der Fotografin Niedringhaus', 'Die sechs Richter in Kabul waren sich einig: Sie verurteilten den Mörder der in Afghanistan getöteten deutschen Fotografin Anja Niedringhaus zum Tode.', 'http://www.spiegel.de/politik/ausland/anja-niedringhaus-todesstrafe-fuer-moerder-der-fotografin-in-afghanistan-a-982631.html#ref=rss', 114),
(579, 'Gaza-Konflikt: Uno-Generalsekretär empört über Raketenfunde in Schulen', 'In mehreren Uno-Schulen im Gazastreifen sind Raketen versteckt worden. Generalsekretär Ban Ki Moon fordert Aufklärung: Das Leben unschuldiger Kinder sei in Gefahr gebracht worden.', 'http://www.spiegel.de/politik/ausland/krieg-in-gaza-ban-ki-moon-empoert-ueber-raketen-fund-in-uno-schulen-a-982624.html#ref=rss', 114),
(580, 'Stiftung Warentest: Viele Mineralwässer sind verunreinigt', 'Die Stiftung Warentest hat in 10 von 30 Medium-Mineralwässern Süßstoff oder Abbauprodukte von Pestiziden entdeckt. Uneingeschränkt empfehlen können die Tester nur wenige Produkte - vor allem günstige Eigenmarken von Lidl und Co.', 'http://www.spiegel.de/wirtschaft/service/stiftung-warentest-verunreinigung-vieler-mineralwasser-mit-a-982627.html#ref=rss', 114),
(581, 'Zwei Stunden Todeskampf: US-Doppelmörder stirbt bei qualvoller Hinrichtung', 'In den USA ist erneut ein Mann grausam hingerichtet worden. Bis Joseph Wood tot war, vergingen zwei Stunden.', 'http://www.spiegel.de/panorama/justiz/qualvolle-hinrichtung-in-arizona-moerder-stirbt-nach-zwei-stunden-a-982625.html#ref=rss', 114),
(582, 'Gaza-Konflikt: Deutsche Politiker kritisieren Flugstopp nach Israel', 'Die US-Luftfahrtbehörde hat das Flugverbot für amerikanische Airlines nach Tel Aviv aufgehoben. Doch die Lufthansa und andere Gesellschaften steuern Israel weiter nicht an. Deutsche Politiker kritisieren die Einstellung der Flüge massiv.', 'http://www.spiegel.de/politik/ausland/gaza-konflikt-flugverbot-nach-israel-in-der-kritik-a-982623.html#ref=rss', 114),
(583, 'Akute Rückenschmerzen: Paracetamol nicht besser als Placebo', 'Bei akuten Rückenschmerzen entscheiden sich Patienten wie Ärzte häufig für einen Wirkstoff: Paracetamol. Doch einer neuen Studie zufolge hilft das Schmerzmittel nicht besser als ein Placebo.', 'http://www.spiegel.de/gesundheit/diagnose/akute-rueckenschmerzen-paracetamol-nicht-besser-als-placebo-a-982366.html#ref=rss', 114),
(584, 'Maccabi Haifa: Testspiel von israelischem Spitzenklub nach Platzsturm abgebrochen', 'Anti-Israel-Proteste auch beim Fußball: Nach Angriffen auf Spieler und einem Zuschauersturm auf den Rasen ist ein Spiel des israelischen Klubs Maccabi Haifa in Österreich abgebrochen worden. Am Samstag spielt das Team gegen Paderborn.', 'http://www.spiegel.de/sport/fussball/anti-israel-proteste-testspiel-abgebrochen-a-982622.html#ref=rss', 114),
(585, 'Erdumrundung: 17-Jähriger stirbt bei Weltrekordversuch mit Flugzeug', 'Er wollte der jüngste Mensch sein, der jemals in einer einmotorigen Maschine in 30 Tagen um die Welt flog. Diesen Wunsch musste Haris Suleman nun mit dem Leben bezahlen. Sein Flugzeug stürzte vor Amerikanisch-Samoa ins Meer.', 'http://www.spiegel.de/panorama/weltrekordversuch-17-jaehriger-stirbt-bei-flugzeugabsturz-a-982620.html#ref=rss', 114),
(586, 'Ostukraine: Rebellenführer bestätigt Besitz von Buk-Flugabwehr', 'Die Separatisten in der Ostukraine verfügten über das Buk-System, mit dessen Raketen offenbar der Malaysia-Airlines-Flug MH17 abgeschossen wurde. Das räumt jetzt ein einflussreicher Rebellenkommandeur ein. Er will auch wissen, woher die Waffe kam.', 'http://www.spiegel.de/politik/ausland/mh17-rebellenkommandeur-bestaetigt-besitz-von-buk-raketen-a-982616.html#ref=rss', 114),
(587, 'Unglücksflug MH17: Niederlande finden keine Hinweise auf Manipulation der Blackbox', 'Die Flugschreiber des abgestürzten Malaysia-Airlines-Flugzeugs befanden sich tagelang in den Händen von Aufständischen. Doch Befürchtungen, dass die Separatisten die Blackbox manipulierten, waren unbegründet. ', 'http://www.spiegel.de/politik/ausland/malaysia-airlines-mh17-boeing-777-blackbox-wurde-nicht-manipuliert-a-982607.html#ref=rss', 114),
(588, '"Russisches Blackwater": Moskau will Privatarmeen aufbauen', 'Die russische Regierung plant den Einsatz privater Sicherheitsfirmen. Die nichtstaatlichen Kämpfer sollen einspringen, wenn es politisch brenzlig wird.', 'http://www.spiegel.de/politik/ausland/russland-kreml-plant-privatarmee-nach-dem-vorbild-blackwater-a-982559.html#ref=rss', 114),
(589, 'Internet-Agenda der Bundesregierung: Drei Minister, eine Enttäuschung', 'Schneller, höher, weiter: Die Bundesregierung hat ihre Digitale Agenda vorgelegt - sie verspricht nicht weniger als eine Internet-Revolution für Deutschland. Und was heißt das konkret?', 'http://www.spiegel.de/politik/deutschland/digitale-agenda-erster-gesetzentwurf-ist-eine-enttaeuschung-a-982503.html#ref=rss', 114),
(590, 'Kämpfe in der Ostukraine: Kiew macht Russland für Kampfjet-Abschuss verantwortlich', 'Für die Regierung in Kiew ist die Sache klar: Die Raketen auf zwei ukrainische Kampfjets seien von russischem Territorium aus abgefeuert worden. ', 'http://www.spiegel.de/politik/ausland/ukraine-macht-russland-fuer-abschuss-von-kampfjets-verantwortlich-a-982587.html#ref=rss', 114),
(591, 'Gauck zu judenfeindlichen Demos: "Wir wollen Antisemitismus nicht hinnehmen"', 'Nach antisemitischen Parolen bei Anti-Israel-Kundgebungen verlangt Bundespräsident Gauck mehr Zivilcourage von den Deutschen. Die Kanzlerin warnt vor einem "Angriff auf Freiheit und Toleranz".', 'http://www.spiegel.de/politik/deutschland/antisemitismus-bundespraesident-gauck-fordert-zivilcourage-a-982566.html#ref=rss', 114),
(592, 'Antisemitismus: Staatsanwaltschaft ermittelt gegen Berliner Hassprediger', 'Sheikh Abu Bilal Ismail wetterte in der Berliner Al-Nur-Moschee gegen Juden. Jetzt hat die Staatsanwaltschaft Ermittlungen eingeleitet. Der Vorwurf: Volksverhetzung.', 'http://www.spiegel.de/politik/deutschland/antisemitismus-ermittlungen-gegen-hassprediger-wegen-volksverhetzung-a-982381.html#ref=rss', 114),
(593, 'Flugzeugunglück: Bruchlandung in Taiwan - viele Tote', 'In der taiwanischen Provinz Penghu sind bei einem Flugzeugunglück offenbar mindestens 47 Menschen gestorben. Laut der chinesischen Nachrichtenagentur Xinhua missglückte die Notlandung eines Flugzeugs der Linie Transasia.', 'http://www.spiegel.de/panorama/taiwan-tote-bei-flugzeugunglueck-der-transasia-a-982557.html#ref=rss', 114),
(594, 'Prozess in Regensburg: Mollath-Anwälte sollen als Pflichtverteidiger weitermachen', 'Turbulenter Tag vor dem Landgericht Regensburg: Die Mollath-Anwälte legen ihr Mandat nieder - weil der Mandant offenbar das Vertrauen in sie verloren hat. Nun sollen die Juristen als Pflichtverteidiger weiterarbeiten.', 'http://www.spiegel.de/panorama/justiz/mollath-prozes-anwalt-strate-wird-pflichtverteidiger-a-982550.html#ref=rss', 114),
(595, 'Transport-App: Hamburg verbietet Fahrdienst Uber', 'Taxifahrer hassen die Konkurrenz durch Uber, jetzt will die Stadt Hamburg den kalifornischen Dienst stoppen. Die Verkehrsbehörde bezeichnet dessen App als "nicht legal". Privatleute, die sich dem Verbot widersetzen, riskieren hohe Strafen.', 'http://www.spiegel.de/wirtschaft/unternehmen/uber-hamburg-verbietet-fahrtdienst-a-982543.html#ref=rss', 114),
(596, 'Krise in der Ukraine: Merkel verlangt schnelle Sanktionen gegen Russland', 'Der Druck auf Wladimir Putin steigt. Bundeskanzlerin Merkel fordert jetzt weitere Strafmaßnahmen gegen Russland - weil Moskau kein Interesse an einer schnellen Aufklärung des MH17-Abschusses zeige. Das Auswärtige Amt erklärt: "Jetzt reicht es."', 'http://www.spiegel.de/politik/ausland/ukraine-merkel-fordert-schnelle-eu-sanktionen-gegen-russland-a-982546.html#ref=rss', 114),
(597, 'Prozess in Regensburg: Verteidiger von Mollath legen Mandat nieder', 'Die beiden Verteidiger von Gustl Mollath haben ihr Mandat niedergelegt. Dies erfolge auf Wunsch des Angeklagten, sagte Mollaths Anwalt Gerhard Strate. ', 'http://www.spiegel.de/panorama/justiz/gustl-mollath-verteidiger-legen-mandat-nieder-a-982541.html#ref=rss', 114),
(598, 'Deutsche Fußball-Nationalmannschaft: Bundestrainer Löw macht bis 2016 weiter', 'Er macht weiter: Joachim Löw bleibt bis 2016 Bundestrainer der Fußball-Nationalmannschaft. "Ich bin so motiviert wie am ersten Tag", sagt der 54-Jährige.', 'http://www.spiegel.de/sport/fussball/joachim-loew-bundestrainer-macht-bis-2016-weiter-a-982542.html#ref=rss', 114),
(599, 'Terrorgruppe im Irak: "Islamischer Staat" lässt Schaufensterpuppen verhüllen', 'Die Radikalen berufen sich auf das Bilderverbot im Islam: Im Einflussgebiet der Terrorgruppe "Islamischer Staat" müssen sich nicht nur Frauen verschleiern - sondern auch Schaufensterpuppen.', 'http://www.spiegel.de/politik/ausland/irak-islamischer-staat-laesst-schaufensterpuppen-in-mossul-verhuellen-a-982485.html#ref=rss', 114),
(600, 'Kämpfe in der Ostukraine: Separatisten schießen zwei ukrainische Militärjets ab', 'Schon wieder sind in der Ostukraine zwei Flugzeuge abgestürzt: Die prorussischen Milizen haben zwei Militärjets der Armee abgeschossen - nahe dem Unglücksort des Malaysian-Airlines-Fluges MH17.', 'http://www.spiegel.de/politik/ausland/ukraine-separatisten-teilen-abschuss-von-zwei-militaerjets-mit-a-982525.html#ref=rss', 114),
(601, 'Klimapolitik: Brüssel beschließt Energiesparziel von 30 Prozent', 'Die EU-Kommission wird nach SPIEGEL-ONLINE-Informationen ein Energieeffizienzziel von 30 Prozent für 2030 vorschlagen. Dies ist höher als erwartet - und entspricht der Forderung des künftigen Kommissionschefs Jean-Claude Juncker.', 'http://www.spiegel.de/wirtschaft/soziales/energieeffizienz-eu-kommission-will-ziel-von-30-prozent-fuer-2030-a-982471.html#ref=rss', 114),
(602, 'Reaktion auf Russlands Ukraine-Politik: Nato hält Putin Lügen vor', 'Die Nato schlägt einen eisigen Ton gegenüber Russland an: In einer Erklärung wirft das Militärbündnis Kreml-Chef Wladimir Putin vor, Unwahrheiten zu verbreiten. Im Gegensatz zu Moskau halte sich der Westen an internationale Vereinbarungen.', 'http://www.spiegel.de/politik/ausland/ukraine-konflikt-mit-russland-nato-haelt-putin-luegen-vor-a-982517.html#ref=rss', 114),
(603, '"Freies Netz Süd": Bayern verbietet größtes Neonazi-Netzwerk', '"Aggressiv und verfassungsfeindlich": Das bayerische Innenministerium hat das rechtsextreme "Freie Netz Süd" verboten. Zudem gehen die Behörden gegen Unterstützer vor - ein bundesweit bekannter Neonazi-Treffpunkt wird durchsucht. ', 'http://www.spiegel.de/politik/deutschland/freies-netz-sued-bayern-verbietet-neonazi-netzwerk-a-982487.html#ref=rss', 114),
(604, 'Eingestellter Flugverkehr nach Tel Aviv: Airlines bescheren der Hamas einen Erfolg', 'Dutzende internationale Airlines haben ihren Flugverkehr nach Israel eingestellt: Ein großer strategischer Sieg für die Hamas - er könnte Israel zu Zugeständnissen zwingen. ', 'http://www.spiegel.de/politik/ausland/fluege-nach-tel-aviv-airlines-bescheren-der-hamas-einen-erfolg-a-982452.html#ref=rss', 114),
(605, 'Allianz-Berechnung: Mini-Zinsen kosten deutsche Sparer im Schnitt 67 Euro im Jahr', 'Die mickrigen Zinsen kommen Deutschlands Sparer teuer zu stehen. Laut Allianz summierte sich der Verlust 2013 auf 67,60 Euro pro Kopf im Vergleich zur Zeit vor der Finanzkrise. Dieses Jahr fällt das Minus wohl noch größer aus.', 'http://www.spiegel.de/wirtschaft/service/mini-zinsen-kosten-sparer-in-deutschland-laut-allianz-milliarden-a-982463.html#ref=rss', 114),
(606, '"Costa Concordia": Wrack nimmt Kurs auf Genua', 'Die letzte Reise der "Costa Concordia" hat begonnen. Zweieinhalb Jahre nach der Havarie bewegt sich das Kreuzfahrtschiff wieder. Schlepper haben das Wrack von der Insel Giglio weggezogen und Kurs auf Genua genommen.', 'http://www.spiegel.de/panorama/costa-concordia-abtransport-von-giglio-nach-genua-beginnt-a-982468.html#ref=rss', 114);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, 'jXOxk1YUD7x5pZLSPENsj.', 1268889823, 1406189186, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(4, '127.0.0.1', 'user', '$2y$08$vQKX4PTcZ8r7jDUXkDCCYOXl4SxcJjj4CNxs/4wyP3wY4qC.BQmmO', NULL, 'user@user.com', NULL, 'TycT.YvC6jvogsS-9eeS.O8bf3988e02339842cf', 1406018508, 'mvG0oTgvGkxBY0wxir5VPe', 1404810260, 1406189381, 1, 'Us', 'er', '', ''),
(5, '127.0.0.1', 'denys arkan', '$2y$08$SN.HQQiB/kMcPPjHLGn74.2ea5X4vVEBL6ZfpuljdkS9N60sdi.ga', NULL, 'denys.arkan@gmail.com', NULL, NULL, NULL, NULL, 1405498985, 1406106571, 1, 'Denys', 'Arkan', '', ''),
(6, '127.0.0.1', 'dfdfdf dfdfdfd', '$2y$08$bR2iwiQN6VTJWxf2CJRIUuhjv30HX8VYhI8GXSMHHT0BlqTpY5wB2', NULL, 'fdfdf@dfdfdf.com', NULL, NULL, NULL, NULL, 1405502264, 1405502264, 1, 'dfdfdf', 'dfdfdfd', NULL, NULL),
(7, '127.0.0.1', 'denys arkan1', '$2y$08$/w7i6eBA2iSGDsYqwEG02Oc4kl521AATdAFJh795urGYZHZpAs2Ii', NULL, 'dencik@ukr.cpm', NULL, NULL, NULL, NULL, 1405504352, 1405504352, 1, 'denys', 'arkan', NULL, NULL),
(8, '127.0.0.1', 'denys1 arkan1', '$2y$08$JXrG/jQv/HclX4W.bOox7.g.q/C.n99Ju90cFRn2cSYOGP0ljPTxe', NULL, 'dencik1@ukr.cpm', NULL, NULL, NULL, NULL, 1405504570, 1405504570, 1, 'denys1', 'arkan1', NULL, NULL),
(9, '127.0.0.1', 'sdsdsdsds asasasasas', '$2y$08$C7raL/yMtAw6iw5ZzVLzOOjtEw07v6gYgeblZDcyHApHcwY3f0A5C', NULL, 'profiks11.1994@mail.ru', NULL, NULL, NULL, NULL, 1405504618, 1405504618, 1, 'sdsdsdsds', 'asasasasas', NULL, NULL),
(10, '127.0.0.1', 'denys1 sdsdsd', '$2y$08$hAm1UzzDJ.iDKcA6gH2h9ew0zlbjszXCkbeGp1gd1eGVD1O6C5u0e', NULL, 'admiqqn@admin.com', '28fdaf9cee7a002b805f9ad030bfb5d0265c5565', NULL, NULL, NULL, 1405504959, 1405504959, 0, 'Denys1', 'sdsdsd', NULL, NULL),
(11, '127.0.0.1', 'denys arkan2', '$2y$08$mgiseNojfpZ7VsHxsQOOC.MhWhN1mfWOdUCJyu835wcYE7djLXkRW', NULL, 'denys.arkan@gm.com', NULL, NULL, NULL, NULL, 1406189268, 1406189401, 1, 'Denys', 'Arkan', 'OSF GLobal Services', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Дамп данных таблицы `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(13, 1, 1),
(8, 4, 2),
(21, 5, 2),
(14, 6, 2),
(15, 7, 2),
(16, 8, 2),
(17, 9, 2),
(18, 10, 2),
(22, 11, 2);

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
