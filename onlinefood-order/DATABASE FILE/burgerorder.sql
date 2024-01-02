-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2021 at 07:14 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinefoodorder`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(1, 'Steeve Moore', 'steeve', 'E10ADC3949BA59ABBE56E057F20F883E'),
(9, 'Liam Johnson', 'liam', 'E10ADC3949BA59ABBE56E057F20F883E'),
(10, 'Ramsey', 'ramsey', 'E10ADC3949BA59ABBE56E057F20F883E'),
(12, 'Administrator', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(5, 'Large', 'Food_Category_342(1).jpg', 'Yes', 'Yes'),
(4, 'Medium', 'Food_Category_343.jpg', 'Yes', 'Yes'),
(3, 'Small', 'Food_Category_982.jpg', 'Yes', 'Yes'),
(2, 'Fries', 'Food_Category_286.jpg', 'Yes', 'Yes'),
(1,'Shakes','Food_Category_608.jpg','Yes','Yes');




CREATE TABLE `loginform`(
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `fullname` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` varchar(3) NOT NULL DEFAULT 'NO',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `loginform` (`id`, `fullname`, `password`, `admin`, `created_at`) VALUES
(1, 'Bhuvan', 'Teja@369', 'No', '15-10-2023 15:27:00');


--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(4, 'Double veg ', 'Double patty of aloo tikki with cheese and veggies', '200.00', 'Food-Name-4845.png', 4, 'Yes', 'Yes'),
(5, 'Aloo tikki burger', 'Burger with aloo tikki, veggies, and Cheese.', '120.00', 'Food-Name-7177.png', 3, 'Yes', 'Yes'),
(9, 'Veg cheese', 'Burger rich in veggies and cheese', '125.00', 'Food-Name-4326.png', 3, 'Yes', 'Yes'),
(10, 'Chicken burger', 'Burger with a crispy chicken patty including veggies and cheese', '170.00', 'Food-Name-6926.png', 3, 'Yes', 'Yes'),
(11, 'Cheeseburger', 'A cheeseburger is a hamburger topped with cheese. Traditionally, the slice of cheese is placed on top of the meat patty.', '150.00', 'Food-Name-433.jpeg', 3, 'Yes', 'Yes'),
(12, 'Smokey bbq chicken ', 'Grilled bbq chicken patty with veggies', '200.00', 'Food-Name-1435.png', 3, 'Yes', 'Yes'),
(13, 'Double Chicken','Brown bread with double patty of chicken with veggies and cheese','250','chicken-double-decker.png',4,'Yes','Yes'),
(14, 'Double cheese chicken','Double patty of chicken crisps with liquid cheese','250','double_cheese_chicken.png',4,'Yes','Yes'),
(15, 'Maharaja veg','Rich in veggies triple patty of tikki fry','300','Veg_maharaja.jpg',5,'Yes','Yes'),
(16, 'Chicken Maharaja','double patty of chicken with triple bread','350','chicken_maha.png',5,'Yes','Yes'),
(17, 'Salted','Salted French fries','160','french_fries.png',2,'Yes','Yes'),
(18, 'Peri Peri','Fries filled with spicy peri peri flavor','200','peri-peri-fries.jpg',2,'Yes','Yes'),
(19, 'Coke','Half liter coke','45','coke.png',1,'yes','yes');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`) VALUES
(2, 'Aloo tikki burger', '120.00', 2, '160', '2023-11-12 03:52:43', 'Delivered', 'Pramod', '7896547800', 'karasi@gmail.com', '12-2-667,dovedek');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for dumped tables
--
--
-- Indexes for table `loginform`
--
ALTER TABLE `loginform`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fullname` (`fullname`);
--
-- AUTO_INCREMENT for table `tbl_admin`

ALTER TABLE tbl_admin MODIFY id int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
