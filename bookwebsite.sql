-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 01:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookwebsite`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `cover` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `available` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `category`, `cover`, `description`, `available`) VALUES
(1, 'Fortress Blood', 'L.D Goffigan', NULL, 'crime-and-mystery-cover-scaled-1.jpeg', 'A thrilling fantasy adventure.', 1),
(2, 'The Fortress of Shadow', 'L.D Goffigan', NULL, 'OIP.jpg', 'A tale of darkness and courage.', 1),
(3, 'Shade of Fae', 'J.L Myers', NULL, 'BWISIT.jpg', 'A fae fantasy full of intrigue.', 1),
(4, 'Forged in Blood', 'Lindsay Buroker', NULL, 'forged_blood.jpg', 'Epic battles and magic.', 1),
(5, 'Defying Roger', 'Sarah Edwards', NULL, 'historical-romance-book-cover-design-ebook-kindle-amazon-sarah-edwards-defying-roger_orig.jpg', 'A historical romance.', 1),
(6, 'Grow a Garden', 'MILDWEST', NULL, 'books\\RobloxScreenShot20250211_065945103.png', 'PALDO!!!!', 1);

-- --------------------------------------------------------

--
-- Table structure for table `recently_read`
--

CREATE TABLE `recently_read` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `read_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recently_read`
--

INSERT INTO `recently_read` (`id`, `user_id`, `book_id`, `read_at`) VALUES
(5, 7, 1, '2025-06-16 10:11:56'),
(7, 7, 6, '2025-06-16 10:12:53'),
(9, 1, 1, '2025-06-16 11:32:59'),
(11, 1, 2, '2025-06-16 11:36:14'),
(13, 1, 4, '2025-06-16 11:53:21'),
(19, 6, 4, '2025-06-16 12:17:30'),
(26, 6, 3, '2025-06-16 12:24:59'),
(29, 6, 1, '2025-06-16 12:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'glennberino1', 'glenn_berino@yahoo.com', '$2y$10$A9BrjyMVRCOZ0jqJ5Hpndutv/LurrrUxu79PCMASEPiDxeHtLsd6C', 'user'),
(3, NULL, 'mint@gmail.com', '$2y$10$5D7DF6yVVhPQmPDng.XqBe2NbQU4GwJfKJ3HSeGwK1O1FOspxVAEm', 'user'),
(4, NULL, 'leahmarieperina7@gmail.com', '$2y$10$EwruBQ1yILtGsjytjNFJOux2gFjqlRyZSYv65tdNBbqoVmaAsiS8C', 'user'),
(5, NULL, 'floyd05@gmail.com', '$2y$10$Kktv3NXntCUEQK.7Wh9IeuuoZIIKLf9Le.dwq2.SUoiqwYlg4Nz6y', 'user'),
(6, 'glenn', '123456@gmail.com', '$2y$10$lW/XHS7Qoga1DFQf8w2trOO4XRKH03ayv3y4Bl2RdTlCiJhDQMNlu', 'admin'),
(7, 'Gianzzz', 'gian@gmail.com', '$2y$10$0aCLEgfKV4Sh3ms33YjpyeyxeylIHPLCZgiz8i0vOCox2i9H6M1eq', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recently_read`
--
ALTER TABLE `recently_read`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `recently_read`
--
ALTER TABLE `recently_read`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recently_read`
--
ALTER TABLE `recently_read`
  ADD CONSTRAINT `recently_read_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `recently_read_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
