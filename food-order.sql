-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2024 at 06:46 PM
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
-- Database: `food-order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(14, 'krishna', 'kri', '81dc9bdb52d04dc20036dbd8313ed055'),
(34, 'jathin', 'jaa', '81dc9bdb52d04dc20036dbd8313ed055');

--
-- Triggers `tbl_admin`
--
DELIMITER $$
CREATE TRIGGER `after_admin_delete` AFTER DELETE ON `tbl_admin` FOR EACH ROW BEGIN
    INSERT INTO tbl_admin_log (admin_id, full_name, username, password, action, log_time)
    VALUES (OLD.id, OLD.full_name, OLD.username, OLD.password, 'DELETE', NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_admin_insert` AFTER INSERT ON `tbl_admin` FOR EACH ROW BEGIN
    INSERT INTO tbl_admin_log (admin_id, full_name, username, password, action, log_time)
    VALUES (NEW.id, NEW.full_name, NEW.username, NEW.password, 'INSERT', NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_admin_update` AFTER UPDATE ON `tbl_admin` FOR EACH ROW BEGIN
    INSERT INTO tbl_admin_log (admin_id, full_name, username, password, action, log_time)
    VALUES (NEW.id, NEW.full_name, NEW.username, NEW.password, 'UPDATE', NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_log`
--

CREATE TABLE `tbl_admin_log` (
  `log_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_admin_log`
--

INSERT INTO `tbl_admin_log` (`log_id`, `admin_id`, `full_name`, `username`, `password`, `action`, `log_time`) VALUES
(1, 31, 'Krishna Agrawal', 'PES1202100798', '81dc9bdb52d04dc20036dbd8313ed055', 'INSERT', '2024-11-12 23:43:23'),
(2, 32, 'omkar', 'om', '250cf8b51c773f3f8dc8b4be867a9a02', 'INSERT', '2024-11-14 10:31:23'),
(3, 33, 'test-insert', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'INSERT', '2024-11-14 10:41:09'),
(4, 33, 'test-insert', 'admin123', 'e10adc3949ba59abbe56e057f20f883e', 'UPDATE', '2024-11-14 10:41:28'),
(5, 33, 'test-insert', 'admin123', 'e10adc3949ba59abbe56e057f20f883e', 'DELETE', '2024-11-14 10:42:34'),
(6, 34, 'jathin', 'jaa', '202cb962ac59075b964b07152d234b70', 'INSERT', '2024-11-14 10:45:58'),
(7, 34, 'jathin', 'jaa', '81dc9bdb52d04dc20036dbd8313ed055', 'UPDATE', '2024-11-14 10:46:28'),
(8, 32, 'omkar', 'om', '250cf8b51c773f3f8dc8b4be867a9a02', 'DELETE', '2024-11-14 10:46:58'),
(9, 16, 'parv', 'parv', '9c1d1a5ca996833aa8bd0971f60d0da7', 'DELETE', '2024-11-14 11:21:48'),
(10, 31, 'Krishna Agrawal', 'PES1202100798', '81dc9bdb52d04dc20036dbd8313ed055', 'DELETE', '2024-11-14 12:03:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(10, 'Desserts', 'Food_Category_772.jpg', 'Yes', 'Yes'),
(11, 'Dishes', 'Food_Category_108.jpg', 'Yes', 'Yes'),
(12, 'Burgers', 'Food_Category_61.jpg', 'Yes', 'Yes'),
(13, 'Beverages', 'Food_Category_743.jpg', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(10, 'Family Sundar', 'Delicious Ice Cream with strawberry.', 100.00, 'Food-Name-2746.jpeg', 10, 'Yes', 'Yes'),
(14, 'Mac Burger', 'Burger With Caramelized Onions And Mushrooms', 70.00, 'Food-Name-9288.jpeg', 12, 'Yes', 'Yes'),
(15, 'Peri Peri Chicken Lollipops', 'Fresh Peri Peri Chicken Lollipops', 700.00, 'Food-Name-2965.jpeg', 11, 'No', 'No'),
(16, 'Frozen Coconut Mojito ', 'Fresh Frozen Coconut Mojito Recipe', 80.00, 'Food-Name-4149.jpeg', 10, 'Yes', 'Yes'),
(21, 'Paneer Rice Bowl', 'Royal flavors of paneer in a luscious gravy, fit for royalty ', 210.00, 'Food-Name-1243.webp', 11, 'Yes', 'Yes'),
(25, 'mango shake', 'This is a tropical-style mango shake recipe with the flavour of coconut.', 120.00, 'Food-Name-7289.jpg', 13, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_contact` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`) VALUES
(4, 'Dumplings Specials', 255.00, 3, 765.00, '2021-11-14 07:42:07', 'Delivered', 'Sarvesh Singh', '9780435103', 'sarveshsingh1322@gmail.com', 'House No 112, Thana Road, Banur'),
(5, 'Sweet tops.', 100.00, 1, 100.00, '2024-11-10 05:20:46', 'Ordered', 'dfsag', 'sdfb', 'radhe@gmail.com', 'sdfb'),
(6, 'Mac Burger', 70.00, 2, 140.00, '2024-11-10 08:44:29', 'Ordered', 'dfsag', '8888', 'Sushil33845agrawal@gmail.com', 'wkjdac'),
(7, 'Mac Burger', 70.00, 3, 210.00, '2024-11-10 08:49:20', 'Ordered', 'parv', '12345', 'parv@gmail.com', 'kldcvkqa'),
(8, 'Family Sundar', 100.00, 3, 300.00, '2024-11-12 07:15:25', 'Ordered', 'animesh', '1234', 'Sushil33845agrawal@gmail.com', 'blr'),
(9, 'Paneer Rice Bowl', 200.00, 1, 200.00, '2024-11-14 05:59:08', 'Ordered', 'kka', '60872', 'hhh@gmail.com', 'kiasn'),
(10, 'Family Sundar', 100.00, 1, 100.00, '2024-11-14 06:14:19', 'Ordered', 'xyz', '123', 'aa@gmail.com', '456');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `created_at`) VALUES
(1, 'krishna', 'kri@gmail.com', '202cb962ac59075b964b07152d234b70', '2024-11-14 07:20:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_admin_log`
--
ALTER TABLE `tbl_admin_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_admin_log`
--
ALTER TABLE `tbl_admin_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
