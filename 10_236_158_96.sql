-- phpMyAdmin SQL Dump
-- version 4.6.2
-- https://www.phpmyadmin.net/
--
-- Host: 10.236.158.96:17716
-- Generation Time: 2017-06-07 22:37:51
-- 服务器版本： 5.6.28-cdb20160902-log
-- PHP Version: 5.6.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game_platform`
--
CREATE DATABASE IF NOT EXISTS `game_platform` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `game_platform`;

-- --------------------------------------------------------

--
-- 表的结构 `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `summonerid` int(11) UNSIGNED NOT NULL,
  `platform` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='游戏账号绑定表';

--
-- 转存表中的数据 `account`
--

INSERT INTO `account` (`id`, `userid`, `summonerid`, `platform`) VALUES
(1, 1, 27971322, 'KR'),
(2, 1, 58645222, 'NA1'),
(3, 1, 85309722, 'NA1');

-- --------------------------------------------------------

--
-- 表的结构 `forum`
--

CREATE TABLE `forum` (
  `fid` mediumint(8) UNSIGNED NOT NULL,
  `name` char(50) NOT NULL DEFAULT '',
  `desc` varchar(100) DEFAULT NULL,
  `icon` varchar(50) NOT NULL,
  `threads` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `posts` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `forum`
--

INSERT INTO `forum` (`fid`, `name`, `desc`, `icon`, `threads`, `posts`) VALUES
(1, '赛事讨论', '赛事讨论区', 'event.png', 145, 293),
(2, '官方公告', '官方公告区', 'notice.png', 102, 253),
(3, '组队开黑', '组队开黑区', 'team.png', 323, 503),
(4, '娱乐休闲', '娱乐休闲区', 'recreation.png', 212, 233);

-- --------------------------------------------------------

--
-- 表的结构 `member`
--

CREATE TABLE `member` (
  `userid` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `posts` int(11) DEFAULT '0',
  `replies` int(11) DEFAULT '0',
  `actives` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `member`
--

INSERT INTO `member` (`userid`, `username`, `posts`, `replies`, `actives`) VALUES
(1, 'sugl', 17, 28, 76),
(2, 'kakaxi', 10, 20, 90),
(3, 'xiye', 10, 20, 8),
(8, 'asd', 3, 0, 15),
(9, 'zhaosi', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `post`
--

CREATE TABLE `post` (
  `pid` int(10) UNSIGNED NOT NULL,
  `fid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `tid` mediumint(8) DEFAULT NULL,
  `author` varchar(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `dateline` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message` mediumtext NOT NULL,
  `userip` varchar(15) NOT NULL DEFAULT '',
  `isFirst` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `post`
--

INSERT INTO `post` (`pid`, `fid`, `tid`, `author`, `authorid`, `dateline`, `message`, `userip`, `isFirst`) VALUES
(1, 1, 1, 'sugl', 1, '2017-05-22 16:28:17', '北京时间5月22日凌晨，2017赛季《英雄联盟》集中冠军赛（MSI）决赛赛场中，SKT战队3:1战胜G2战队，成功卫冕，续写着自己在国际赛场上的彪炳战绩，恭喜SKT！', '127.0.0.1', 1),
(2, 1, 1, 'kakaxi', 2, '2017-05-23 10:36:22', '恭喜SKT！', '192.168.0.1', 0),
(3, 1, 1, 'xiye', 3, '2017-05-23 10:36:57', '呵呵！', '192.168.0.2', 0),
(4, 1, 1, 'kakaxi', 2, '2017-05-23 10:38:15', '讲个笑话，G2', '192.168.0.1', 0),
(5, 1, 2, 'kakaxi', 2, '2017-05-23 11:39:03', 'SKT成功卫冕季中赛冠军！', '192.168.0.1', 1),
(6, 1, 1, 'sugl', 1, '2017-05-23 20:45:21', '讲个笑话，4396', '127.0.0.1', 0),
(7, 1, 1, 'sugl', 1, '2017-05-23 20:47:18', '呵呵！', '127.0.0.1', 0),
(8, 1, 1, 'sugl', 1, '2017-05-23 20:48:54', 'test1', '127.0.0.1', 0),
(9, 1, 1, 'sugl', 1, '2017-05-23 20:49:12', 'test2', '127.0.0.1', 0),
(10, 1, 1, 'kakaxi', 2, '2017-05-23 20:54:40', 'test3', '192.168.0.1', 0),
(11, 1, 2, 'kakaxi', 2, '2017-05-25 14:07:52', 'reply test1', '192.168.0.1', 0),
(13, 1, 2, 'sugl', 1, '2017-05-25 15:05:06', 'reply test2', '127.0.0.1', 0),
(14, 1, 1, 'sugl', 1, '2017-05-25 17:12:44', '<p>qeqeq</p>', '0:0:0:0:0:0:0:1', 0),
(15, 1, 1, 'sugl', 1, '2017-05-25 17:19:42', '<p><b>ueditor reply test&nbsp;</b></p><p><b>hahahaha</b></p><p><b>i am pic<img src="/ueditor/jsp/upload/image/20170525/1495703878364078303.png" title="1495703878364078303.png" alt="QQ截图20170302203326.png"/></b></p><p><b><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></b></p>', '172.22.40.5', 0),
(16, 1, 1, 'sugl', 1, '2017-05-25 17:21:25', '<p>test vediohahaha<video class="edui-upload-video  vjs-default-skin  video-js" controls="" preload="none" width="420" height="280" src data-setup="{}"></video></p>', '172.22.40.5', 0),
(17, 1, 1, 'sugl', 1, '2017-05-25 18:44:16', '<p><video class="edui-upload-video  vjs-default-skin video-js" controls="" preload="none" width="420" height="280" src="/ueditor/jsp/upload/video/20170525/1495709052150019855.mp4" data-setup="{}"></video></p>', '0:0:0:0:0:0:0:1', 0),
(18, 1, 2, 'kakaxi', 2, '2017-05-26 19:19:17', '<p><video class="edui-upload-video  vjs-default-skin video-js" controls="" preload="none" width="420" height="280" src="/ueditor/jsp/upload/video/20170526/1495797549863027208.mp4" data-setup="{}"></video></p>', '0:0:0:0:0:0:0:1', 0),
(19, 1, 1, 'sugl', 1, '2017-05-26 19:32:10', '<p>qqee<img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></p>', '0:0:0:0:0:0:0:1', 0),
(20, 1, 1, 'sugl', 1, '2017-05-26 19:32:49', '<p><video class="edui-upload-video  vjs-default-skin video-js" controls="" preload="none" width="420" height="280" src="/ueditor/jsp/upload/video/20170526/1495798362560086921.mp4" data-setup="{}"></video></p>', '0:0:0:0:0:0:0:1', 0),
(21, 1, 4, 'sugl', 1, '2017-05-29 16:52:33', '<p>thread</p><p>test<img src="http://img.baidu.com/hi/jx2/j_0002.gif"/></p>', '0:0:0:0:0:0:0:1', 1),
(22, 1, 6, 'sugl', 1, '2017-05-29 16:54:48', '<p>呵呵<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/></p>', '0:0:0:0:0:0:0:1', 1),
(23, 1, 7, 'sugl', 1, '2017-05-29 16:56:04', '<p>去问驱蚊器我去问</p>', '0:0:0:0:0:0:0:1', 1),
(24, 1, 8, 'sugl', 1, '2017-05-29 16:56:35', '<p>123131231212</p>', '0:0:0:0:0:0:0:1', 1),
(25, 1, 5, 'sugl', 1, '2017-05-29 16:57:13', '<p>13131驱蚊器额外<img src="http://img.baidu.com/hi/jx2/j_0062.gif"/></p>', '0:0:0:0:0:0:0:1', 0),
(26, 1, 5, 'sugl', 1, '2017-05-29 16:57:30', '<p>企鹅强强呜呜呜恶趣味请问</p>', '0:0:0:0:0:0:0:1', 0),
(27, 1, 6, 'sugl', 1, '2017-05-29 16:57:46', '<p>去恶趣味强强企鹅</p>', '0:0:0:0:0:0:0:1', 0),
(28, 1, 7, 'sugl', 1, '2017-05-29 16:59:37', '<p>文万琴俄文去<img src="http://img.baidu.com/hi/jx2/j_0076.gif"/></p>', '0:0:0:0:0:0:0:1', 0),
(29, 3, 9, 'sugl', 1, '2017-05-29 17:00:30', '<p>问起我</p>', '0:0:0:0:0:0:0:1', 1),
(30, 3, 9, 'sugl', 1, '2017-05-29 17:00:52', '<p>饿我去饿饿我去额为</p>', '0:0:0:0:0:0:0:1', 0),
(31, 1, 1, 'sugl', 1, '2017-05-29 18:15:16', '<p>qewqeqwqweqweqw</p>', '0:0:0:0:0:0:0:1', 0),
(32, 4, 10, 'asd', 8, '2017-05-30 12:35:21', '<p>qeqeqweqweqwewe<img src="http://img.baidu.com/hi/jx2/j_0003.gif"/></p>', '0:0:0:0:0:0:0:1', 1),
(33, 2, 11, 'asd', 8, '2017-05-30 13:10:28', '<p>eqeqeqweqweqweqweqw</p>', '115.200.19.50', 1),
(34, 3, 12, 'asd', 8, '2017-05-30 13:11:16', '<p>qweqeqwddas</p>', '115.200.19.50', 1),
(35, 2, 13, 'sugl', 1, '2017-05-31 18:37:10', '<p>jopjpkk<br/></p>', '0:0:0:0:0:0:0:1', 1),
(36, 1, 14, 'sugl', 1, '2017-06-04 20:43:40', '<p><img src="http://img.baidu.com/hi/jx2/j_0025.gif"/>这是帖子内容aaa</p><p><b>游戏信息交流平台qqqqq</b></p><br/>', '0:0:0:0:0:0:0:1', 1),
(37, 1, 14, 'sugl', 1, '2017-06-04 20:47:17', '<p>ttttt</p>', '0:0:0:0:0:0:0:1', 0),
(38, 1, 14, 'sugl', 1, '2017-06-04 20:47:33', '<p>啊啊啊<img src="http://img.baidu.com/hi/jx2/j_0004.gif"/></p>', '0:0:0:0:0:0:0:1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `reply`
--

CREATE TABLE `reply` (
  `rid` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL COMMENT 'postid',
  `authorid` int(11) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `toid` varchar(45) DEFAULT NULL,
  `touser` varchar(45) DEFAULT NULL,
  `message` mediumtext,
  `dateline` timestamp NULL DEFAULT NULL,
  `userip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼中楼';

--
-- 转存表中的数据 `reply`
--

INSERT INTO `reply` (`rid`, `pid`, `authorid`, `author`, `toid`, `touser`, `message`, `dateline`, `userip`) VALUES
(1, 2, 1, 'sugl', '2', 'kakaxi', 'replay test 1', '2017-05-24 15:57:41', '127.0.0.1'),
(2, 2, 2, 'kakaxi', '1', 'sugl', 'replay test 2', '2017-05-24 15:59:37', '192.168.0.1'),
(3, 2, 1, 'sugl', '2', 'kakaxi', 'replay test 3', '2017-05-24 16:00:46', '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `thread`
--

CREATE TABLE `thread` (
  `tid` mediumint(8) UNSIGNED NOT NULL,
  `fid` mediumint(8) UNSIGNED NOT NULL,
  `author` char(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) UNSIGNED NOT NULL,
  `subject` char(80) NOT NULL DEFAULT '',
  `dateline` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `replies` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `thread`
--

INSERT INTO `thread` (`tid`, `fid`, `author`, `authorid`, `subject`, `dateline`, `views`, `replies`) VALUES
(1, 1, 'sugl', 1, '冠军神话延续，SKT成功卫冕MSI冠军', '2017-05-22 16:28:17', 41, 5),
(2, 1, 'kakaxi', 2, 'SKT冠军神话延续！', '2017-05-22 16:28:25', 21, 2),
(3, 2, 'sugl', 1, 'test subject', '2017-05-29 13:08:55', 0, 0),
(4, 1, 'sugl', 1, 'test', '2017-05-29 16:52:33', 0, 0),
(5, 1, 'sugl', 1, 'heh', '2017-05-29 16:53:58', 0, 2),
(6, 1, 'sugl', 1, 'heh', '2017-05-29 16:54:48', 0, 1),
(7, 1, 'sugl', 1, '饿我去恶趣味全额委屈', '2017-05-29 16:56:04', 0, 1),
(8, 1, 'sugl', 1, '1321312', '2017-05-29 16:56:35', 0, 0),
(9, 3, 'sugl', 1, '委屈恶趣味我', '2017-05-29 17:00:30', 0, 1),
(10, 4, 'asd', 8, 'eqe', '2017-05-30 12:35:21', 0, 0),
(11, 2, 'asd', 8, 'qeqeqweqw', '2017-05-30 13:10:28', 0, 0),
(12, 3, 'asd', 8, 'eqeqw', '2017-05-30 13:11:16', 0, 0),
(13, 2, 'sugl', 1, 'guyiu', '2017-05-31 18:37:10', 0, 0),
(14, 1, 'sugl', 1, '发帖测试111111', '2017-06-04 20:43:40', 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `userinfo`
--

CREATE TABLE `userinfo` (
  `userid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `userpwd` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `icon` varchar(45) DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `userinfo`
--

INSERT INTO `userinfo` (`userid`, `username`, `userpwd`, `email`, `icon`) VALUES
(1, 'sugl', '123456', '1500093634@qq.com', '1.jpg'),
(2, 'kakaxi', '123456', NULL, '2.jpg'),
(3, 'xiye', '123456', NULL, '3.jpg'),
(5, 'qwe', '123456', '1500093634@qq.com', '5.jpg'),
(6, 'qwea', '123456', '123@qq.com', '6.jpg'),
(7, 'qweae', '123456', '121@qq.com', 'default.jpg'),
(8, 'asd', '123456', '1500093634@qq.com', '8.jpg'),
(9, 'zhaosi', '123456', 'qweerr@qq.com', 'default.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `userid_UNIQUE` (`userid`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `forum`
--
ALTER TABLE `forum`
  MODIFY `fid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `post`
--
ALTER TABLE `post`
  MODIFY `pid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- 使用表AUTO_INCREMENT `reply`
--
ALTER TABLE `reply`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `thread`
--
ALTER TABLE `thread`
  MODIFY `tid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
