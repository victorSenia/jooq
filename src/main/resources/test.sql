-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 30, 2016 at 03:38 pm
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`` PROCEDURE `AddGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64), `t_srid` INT)  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' ADD ', geometry_column,' GEOMETRY REF_SYSTEM_ID=', t_srid); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

CREATE DEFINER=`` PROCEDURE `DropGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64))  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' DROP ', geometry_column); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `browser`
--

CREATE TABLE `browser` (
  `id` int(11) NOT NULL,
  `browser` varchar(65) NOT NULL,
  `css_grade` varchar(65) NOT NULL,
  `engine` varchar(65) NOT NULL,
  `engine_version` varchar(65) NOT NULL,
  `platform` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `browser`
--

INSERT INTO `browser` (`id`, `browser`, `css_grade`, `engine`, `engine_version`, `platform`) VALUES
(1, 'Internet Explorer 4.0', 'X', 'Trident', '4', 'Win 95+'),
(2, 'Internet Explorer 5.0', 'C', 'Trident', '5', 'Win 95+'),
(3, 'Internet Explorer 5.5', 'A', 'Trident', '5.5', 'Win 95+'),
(4, 'Internet Explorer 6', 'A', 'Trident', '6', 'Win 98+'),
(5, 'Internet Explorer 7', 'A', 'Trident', '7', 'Win XP SP2+'),
(6, 'AOL browser (AOL desktop)', 'A', 'Trident', '6', 'Win XP'),
(7, 'Firefox 1.0', 'A', 'Gecko', '1.7', 'Win 98+ / OSX.2+'),
(8, 'Firefox 1.5', 'A', 'Gecko', '1.8', 'Win 98+ / OSX.2+'),
(9, 'Firefox 2.0', 'A', 'Gecko', '1.8', 'Win 98+ / OSX.2+'),
(10, 'Firefox 3.0', 'A', 'Gecko', '1.9', 'Win 2k+ / OSX.3+'),
(11, 'Camino 1.0', 'A', 'Gecko', '1.8', 'OSX.2+'),
(12, 'Camino 1.5', 'A', 'Gecko', '1.8', 'OSX.3+'),
(13, 'Netscape 7.2', 'A', 'Gecko', '1.7', 'Win 95+ / Mac OS 8.6-9.2'),
(14, 'Netscape Browser 8', 'A', 'Gecko', '1.7', 'Win 98SE+'),
(15, 'Netscape Navigator 9', 'A', 'Gecko', '1.8', 'Win 98+ / OSX.2+'),
(16, 'Mozilla 1.0', 'A', 'Gecko', '1', 'Win 95+ / OSX.1+'),
(17, 'Mozilla 1.1', 'A', 'Gecko', '1.1', 'Win 95+ / OSX.1+'),
(18, 'Mozilla 1.2', 'A', 'Gecko', '1.2', 'Win 95+ / OSX.1+'),
(19, 'Mozilla 1.3', 'A', 'Gecko', '1.3', 'Win 95+ / OSX.1+'),
(20, 'Mozilla 1.4', 'A', 'Gecko', '1.4', 'Win 95+ / OSX.1+'),
(21, 'Mozilla 1.5', 'A', 'Gecko', '1.5', 'Win 95+ / OSX.1+'),
(22, 'Mozilla 1.6', 'A', 'Gecko', '1.6', 'Win 95+ / OSX.1+'),
(23, 'Mozilla 1.7', 'A', 'Gecko', '1.7', 'Win 98+ / OSX.1+'),
(24, 'Mozilla 1.8', 'A', 'Gecko', '1.8', 'Win 98+ / OSX.1+'),
(25, 'Seamonkey 1.1', 'A', 'Gecko', '1.8', 'Win 98+ / OSX.2+'),
(26, 'Epiphany 2.20', 'A', 'Gecko', '1.8', 'Gnome'),
(27, 'Safari 1.2', 'A', 'Webkit', '125.5', 'OSX.3'),
(28, 'Safari 1.3', 'A', 'Webkit', '312.8', 'OSX.3'),
(29, 'Safari 2.0', 'A', 'Webkit', '419.3', 'OSX.4+'),
(30, 'Safari 3.0', 'A', 'Webkit', '522.1', 'OSX.4+'),
(31, 'OmniWeb 5.5', 'A', 'Webkit', '420', 'OSX.4+'),
(32, 'iPod Touch / iPhone', 'A', 'Webkit', '420.1', 'iPod'),
(33, 'S60', 'A', 'Webkit', '413', 'S60'),
(34, 'Opera 7.0', 'A', 'Presto', '-', 'Win 95+ / OSX.1+'),
(35, 'Opera 7.5', 'A', 'Presto', '-', 'Win 95+ / OSX.2+'),
(36, 'Opera 8.0', 'A', 'Presto', '-', 'Win 95+ / OSX.2+'),
(37, 'Opera 8.5', 'A', 'Presto', '-', 'Win 95+ / OSX.2+'),
(38, 'Opera 9.0', 'A', 'Presto', '-', 'Win 95+ / OSX.3+'),
(39, 'Opera 9.2', 'A', 'Presto', '-', 'Win 88+ / OSX.3+'),
(40, 'Opera 9.5', 'A', 'Presto', '-', 'Win 88+ / OSX.3+'),
(41, 'Opera for Wii', 'A', 'Presto', '-', 'Wii'),
(42, 'Nokia N800', 'A', 'Presto', '-', 'N800'),
(43, 'Nintendo DS browser', 'C/A1', 'Presto', '8.5', 'Nintendo DS'),
(44, 'Konqureror 3.1', 'C', 'KHTML', '3.1', 'KDE 3.1'),
(45, 'Konqureror 3.3', 'A', 'KHTML', '3.3', 'KDE 3.3'),
(46, 'Konqureror 3.5', 'A', 'KHTML', '3.5', 'KDE 3.5'),
(47, 'Internet Explorer 4.5', 'X', 'Tasman', '-', 'Mac OS 8-9'),
(48, 'Internet Explorer 5.1', 'C', 'Tasman', '1', 'Mac OS 7.6-9'),
(49, 'Internet Explorer 5.2', 'C', 'Tasman', '1', 'Mac OS 8-X'),
(50, 'NetFront 3.1', 'C', 'Misc', '-', 'Embedded devices'),
(51, 'NetFront 3.4', 'A', 'Misc', '-', 'Embedded devices'),
(52, 'Dillo 0.8', 'X', 'Misc', '-', 'Embedded devices'),
(53, 'Links', 'X', 'Misc', '-', 'Text only'),
(54, 'Lynx', 'X', 'Misc', '-', 'Text only'),
(55, 'IE Mobile', 'C', 'Misc', '-', 'Windows Mobile 6'),
(56, 'PSP browser', 'C', 'Misc', '-', 'PSP'),
(57, 'All others', 'U', 'Other browsers', '-', '-'),

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `state` varchar(255) CHARACTER SET latin1 NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `created`, `name`, `state`, `updated`) VALUES
(1, '2016-08-18 14:53:18', 'Los', 'LA', NULL),
(2, '2016-08-18 14:53:18', 'New', 'NY', NULL),
(3, '2016-08-18 14:53:18', 'San', 'SF', NULL),
(5, '2016-08-19 11:38:43', 'test', 'LA', NULL),
(6, '2016-09-09 13:26:30', 'Neats', 'TS', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `result` blob NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `surname` varchar(20) COLLATE utf8_bin NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(64) COLLATE utf8_bin NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(64) COLLATE utf8_bin NOT NULL,
  `role` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `enabled`, `password`, `role`, `username`) VALUES
(1, 'a@a.a', b'1', '$2a$16$KKVpbhCdzMTHSNL7bUY9Y.epSvUPF8LD46Ilj6lFt5yIm32SNhY7e', 0, 'a');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_surname` varchar(255) NOT NULL,
  `updated` datetime DEFAULT NULL,
  `city_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created`, `user_name`, `user_surname`, `updated`, `city_id`) VALUES
(1, '2016-08-18 14:53:18', 'name1', 'surname1', NULL, 1),
(2, '2016-08-18 14:53:18', 'name2', 'surname2', NULL, 1),
(3, '2016-08-18 14:53:18', 'name3', 'surname3', NULL, 3),
(4, '2016-08-18 14:53:18', 'name4', 'surname4', NULL, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `browser`
--
ALTER TABLE `browser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_nsbb4l6mnxchk63d4jdi9qfxa` (`browser`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2qou67djdoba11anakmoowlsn` (`group_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKiub3ue9cklcyyra24v9ns656n` (`course_id`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8xjetnt9t1ff550cbx1l09x4i` (`group_id`),
  ADD KEY `FKk5m148xqefonqw7bgnpm0snwj` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkpqrx37esphstf2tqxbt89avn` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `browser`
--
ALTER TABLE `browser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `FK2qou67djdoba11anakmoowlsn` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`);

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `FKiub3ue9cklcyyra24v9ns656n` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK8xjetnt9t1ff550cbx1l09x4i` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  ADD CONSTRAINT `FKk5m148xqefonqw7bgnpm0snwj` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKkpqrx37esphstf2tqxbt89avn` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
