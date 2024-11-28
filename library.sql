-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2024 at 01:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `authorid` int(9) NOT NULL,
  `name` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`authorid`, `name`) VALUES
(1, 'J.K. Rowling'),
(2, 'J.K. Rowling'),
(3, 'J.K. Rowling'),
(4, 'J.K. Rowling'),
(5, 'J.K. Rowling'),
(6, 'J.K. Rowling'),
(7, 'J.K. Rowling'),
(8, 'J.K. Rowling'),
(9, 'J.K. Rowling'),
(10, 'J.K. Rowling'),
(11, 'J.K. Rowling'),
(16, 'Jhunel M. Uya'),
(17, 'Jhunel Uya'),
(19, 'Jhunel M. Uyaa'),
(20, 'Jhunel Uya');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookid` int(9) NOT NULL,
  `title` char(255) NOT NULL,
  `authorid` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookid`, `title`, `authorid`) VALUES
(1, 'Harry Potter', 1),
(2, 'Harry Potter and the Sorcerer\'s Stone', 2),
(27, 'Harry Potter and the Chamber of Secrets', 3),
(29, 'Harry Potter and the Prisoner of Azkaban', 4),
(30, 'Harry Potter and the Order of the Phoenix', 5),
(31, 'Harry Potter and the Half-Blood Prince', 6),
(32, 'Harry Potter and the Deathly Hallows', 7),
(34, 'Harry Potter and the Curse Child', 8),
(35, 'Harry Potter and the Curse Child', 9),
(39, 'The Story of Boarding Boyz', 12),
(47, 'Harry Potter', 11),
(50, 'egg', 16),
(65, 'Harry Potter', 17),
(68, 'Harry Potter', 19);

-- --------------------------------------------------------

--
-- Table structure for table `books_authors`
--

CREATE TABLE `books_authors` (
  `collectionid` int(9) NOT NULL,
  `bookid` int(9) NOT NULL,
  `authorid` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books_authors`
--

INSERT INTO `books_authors` (`collectionid`, `bookid`, `authorid`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(5, 5, 1),
(4, 5, 2),
(6, 6, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 27, 1),
(12, 29, 1),
(13, 30, 1),
(14, 31, 1),
(15, 32, 1),
(16, 34, 1),
(17, 35, 1),
(18, 36, 5),
(19, 37, 5);

-- --------------------------------------------------------

--
-- Table structure for table `jwt_tokens`
--

CREATE TABLE `jwt_tokens` (
  `id` int(11) NOT NULL,
  `token` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iat` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `used` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jwt_tokens`
--

INSERT INTO `jwt_tokens` (`id`, `token`, `iat`, `created_at`, `used`) VALUES
(114, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDQ4NjAsImV4cCI6MTczMjYwODQ2MH0.q6DFth22wWoeuY9dOMYi6JMttw7lVFfmhguZLN4aqDw', 0, '2024-11-26 15:07:40', 1),
(115, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDQ4NzgsImV4cCI6MTczMjYwODQ3OH0.KhMhG1K6e_dBvSTw5qJ6gEJWRYPRUG2Ki1LwkM_DDeY', 0, '2024-11-26 15:07:58', 0),
(116, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDUxMjcsImV4cCI6MTczMjYwODcyN30.6vwfz_IaH4no2UfmWmT3O5jLkfjqaz7nuu1ZlSH0Swo', 0, '2024-11-26 15:12:07', 1),
(117, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDUxNTUsImV4cCI6MTczMjYwODc1NX0.ualrMu5Zev1Ks_n490-UPeMC1w7lUER0-SYMuKimbiA', 0, '2024-11-26 15:12:35', 1),
(118, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDUyMDYsImV4cCI6MTczMjYwODgwNn0.eandQxiCSPGRoNlSuu69D2EvAjoOOBvy9gQlPmoTfCw', 0, '2024-11-26 15:13:26', 1),
(119, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDUyMjcsImV4cCI6MTczMjYwODgyN30.8c9C-JcB9K9F8cP_9IIVCKvA0YYrmbkKbP7Og6RIPn8', 0, '2024-11-26 15:13:47', 1),
(120, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDUyOTIsImV4cCI6MTczMjYwODg5Mn0.2oupAjUocdfkl5CwvxrrbxEwHczjfbFo0ARImC-AEh4', 0, '2024-11-26 15:14:52', 0),
(121, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDUzMDksImV4cCI6MTczMjYwODkwOX0.WJPsLr6NTFUtiB45XUzja_H0LtPNYPg0E3-WGLbkGGs', 0, '2024-11-26 15:15:09', 1),
(122, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDUzMzUsImV4cCI6MTczMjYwODkzNX0.QVKFCgC1Or__V12WI3vcU6UXS6xkYPneToOI2df7jiE', 0, '2024-11-26 15:15:35', 1),
(123, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDUzNTcsImV4cCI6MTczMjYwODk1N30.QWKjslQWd_fwGFxa0Xc_2e5I1AoKQxo1x7OtrL8Shrs', 0, '2024-11-26 15:15:57', 1),
(124, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDUzNzUsImV4cCI6MTczMjYwODk3NX0.RP_oziRBswF9ZDdySHupcNrvXY4UsLD14pVdRoGT2S8', 0, '2024-11-26 15:16:15', 1),
(125, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2MDU0MDUsImV4cCI6MTczMjYwOTAwNX0.ogAMJ8h_IgA2w2-hxMIRj_3Q9e-9SUCyH1p_zuT74yc', 0, '2024-11-26 15:16:45', 0),
(126, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbGlicmFyeS5vcmciLCJhdWQiOiJodHRwOi8vbGlicmFyeS5jb20iLCJpYXQiOjE3MzI2ODA5MTUsImV4cCI6MTczMjY4NDUxNX0.IAZazw2w1rDPHI28L-LNXXoZdqNWpsXjFyAwTPrSCQo', 0, '2024-11-27 12:15:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(9) NOT NULL,
  `username` char(255) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`) VALUES
(1, 'Jhunel Uya', '$2y$10$JyZ81OsULN.DQLj/w1jAnuGQbXZKPLl76u763A4.DR4FibvvvzAP2'),
(2, 'Jhunel Uya', '$2y$10$0pjB6LwLVAXTXxPoBWUmwOHsuVRJakQRpdOQXdAg7w0wqtnlnjp52'),
(3, 'Jhunel', '$2y$10$G0GkKSgLcmfw/VQc/0SMrO2hgAZJ/vm40BF4v8bcNU4atiizrHb.K'),
(4, 'Junel', '$2y$10$r9CxjWlADpD/vi2MuFCzquxs.GTXeDc0d6jiIbtvmf7.7J8wzdnP6'),
(5, 'Jhunel Mondina Uya', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
(6, 'Jhunel Mondina', '$2y$10$DSn5qIwuMIvsBUvp5Bwwke8jn8nAFjfsxLTy3ZAbpmbFKW63tiefy'),
(7, 'J.K Rowling', '$2y$10$pS8piIPqs.2.yV4pjX/2fOL306RTe.ULxqPyxEh35HJY1cZriW/ai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`authorid`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookid`),
  ADD UNIQUE KEY `authorid` (`authorid`);

--
-- Indexes for table `books_authors`
--
ALTER TABLE `books_authors`
  ADD PRIMARY KEY (`collectionid`),
  ADD UNIQUE KEY `bookid` (`bookid`,`authorid`);

--
-- Indexes for table `jwt_tokens`
--
ALTER TABLE `jwt_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `authorid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `books_authors`
--
ALTER TABLE `books_authors`
  MODIFY `collectionid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `jwt_tokens`
--
ALTER TABLE `jwt_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
