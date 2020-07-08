-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 08, 2020 at 11:45 AM
-- Server version: 10.3.23-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jasoumik_testshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_name` varchar(250) NOT NULL,
  `order_item_qnty` int(11) NOT NULL,
  `order_item_price` double(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `order_id`, `order_item_name`, `order_item_qnty`, `order_item_price`) VALUES
(1, 1, 'Apple iPhone SE 2020(64GB)', 1, 349.00),
(2, 2, 'Apple iPhone XR (64GB)', 1, 649.00),
(3, 3, 'Apple iPhone 11 Pro(64GB)', 1, 999.00),
(4, 4, 'Apple iPhone 11 Pro(64GB)', 1, 999.00),
(5, 5, 'Apple iPhone 11 Pro(64GB)', 1, 999.00),
(6, 6, 'Apple iPhone XR (64GB)', 1, 649.00),
(7, 7, 'Apple iPhone XR (64GB)', 1, 649.00),
(8, 8, 'Apple iPhone SE 2020(64GB)', 1, 349.00),
(9, 9, 'Apple iPhone 11 Pro(64GB)', 1, 999.00),
(10, 10, 'Apple iPhone XR (64GB)', 2, 649.00),
(11, 11, 'Apple iPhone SE 2020(64GB)', 1, 349.00),
(12, 12, 'Apple iPhone XR (64GB)', 1, 649.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `order_id` int(11) NOT NULL,
  `order_num` int(11) NOT NULL,
  `order_total_amnt` double(12,2) NOT NULL,
  `tran_id` varchar(200) NOT NULL,
  `card_cvc` int(5) NOT NULL,
  `card_exp_m` varchar(30) NOT NULL,
  `card_exp_y` varchar(30) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `card_holder_num` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `cus_name` varchar(250) NOT NULL,
  `cus_adrs` text NOT NULL,
  `cus_city` varchar(250) NOT NULL,
  `cus_pin` varchar(30) NOT NULL,
  `cus_state` varchar(250) NOT NULL,
  `cus_country` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`order_id`, `order_num`, `order_total_amnt`, `tran_id`, `card_cvc`, `card_exp_m`, `card_exp_y`, `order_status`, `card_holder_num`, `email`, `cus_name`, `cus_adrs`, `cus_city`, `cus_pin`, `cus_state`, `cus_country`) VALUES
(1, 798286, 349.00, 'txn_1GxaWeJGONcE1avpoiIyG0TJ', 856, '03', '2021', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Jarif Ahmed', 'House No#03,Road No#32,Sector#07.Uttara', 'Dhaka', '1230', 'Dhaka', 'US'),
(2, 265306, 649.00, 'txn_1GxabKJGONcE1avpkU6eCLE8', 856, '03', '2021', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Jarif Ahmed', 'House No#03,Road No#32,Sector#07.Uttara', 'Dhaka', '1230', 'Dhaka', 'Bangladesh'),
(3, 361948, 999.00, 'txn_1GxaqCJGONcE1avpzheXaM0w', 856, '03', '2021', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Jarif Ahmed', 'House No#03,Road No#32,Sector#07.Uttara', 'Dhaka', '1230', 'Dhaka', 'US'),
(4, 598726, 999.00, 'txn_1Gxb2vJGONcE1avpJImbotjx', 856, '03', '2022', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Jarif Ahmed Soumik', 'House No#03,Road No#32,Sector#07.Uttara', 'Dhaka', '1230', 'Dhaka', 'Bangladesh'),
(5, 251679, 999.00, 'txn_1Gxb3oJGONcE1avp9Oc9vd1j', 865, '03', '2022', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Jarif Ahmed', 'House No#03,Road No#32,Sector#07.Uttara', 'Dhaka', '1230', 'Dhaka', 'Bangladesh'),
(6, 329869, 649.00, 'txn_1GxbGDJGONcE1avp0SCq0ovB', 856, '03', '2021', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Jarif Ahmed ', 'House No#03,Road No#32,Sector#07.Uttara', 'Dhaka', '1230', 'Dhaka', 'Bangladesh'),
(7, 554555, 649.00, 'txn_1GxbJEJGONcE1avpPzWiQAaO', 589, '10', '2021', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Jarif', 'House No#03,Road No#32,Sector#07.Uttara', 'Dhaka', '1230', 'Dhaka', 'Bangladesh'),
(8, 369002, 349.00, 'txn_1GxbSKJGONcE1avpw549K9z7', 325, '10', '2022', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Soumik', 'House No#03,Road No#32,Sector#07.Uttara', 'Dhaka', '1230', 'Dhaka', 'Bangladesh'),
(9, 720051, 999.00, 'txn_1GxcT3JGONcE1avp6OvRipD5', 325, '02', '2021', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Jarif Ahmed Soumik', 'House No#03,Road No#32,Sector#07.Uttara', 'Dhaka', '1230', 'Dhaka', 'Bangladesh'),
(10, 589271, 1298.00, 'txn_1GxeUWJGONcE1avpPA2paX7Z', 896, '02', '2021', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Jarif Ahmed Soumik', 'House No#03,Road No#32,Sector#07.Uttara', 'Dhaka', '1230', 'Dhaka', 'Bangladesh'),
(11, 369140, 349.00, 'txn_1GxebPJGONcE1avpIJUCkzf6', 852, '02', '2021', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Jarif Ahmed Soumik', 'House No#03,Road No#32,Sector#07.Uttara', 'Dhaka', '1230', 'Dhaka', 'Bangladesh'),
(12, 328778, 649.00, 'txn_1GxejCJGONcE1avprOWiJebp', 896, '10', '2021', 'succeeded', '4242424242424242', 'jasoumik@gmail.com', 'Jarif Ahmed ', 'Uttara,sec10', 'Dhaka', '1233', 'Dhaka', 'Bangladesh');

-- --------------------------------------------------------

--
-- Table structure for table `pdt_table`
--

CREATE TABLE `pdt_table` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pdt_table`
--

INSERT INTO `pdt_table` (`id`, `name`, `image`, `price`) VALUES
(1, 'Apple iPhone XR (64GB)', 'xr.jpg', 649.00),
(2, 'Apple iPhone 11 Pro(64GB)', '11pro.jpg', 999.00),
(3, 'Apple iPhone XS (64GB)', 'xs.jpg', 899.00),
(4, 'Apple iPhone SE 2020(64GB)', 'se20.jpg', 349.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `pdt_table`
--
ALTER TABLE `pdt_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pdt_table`
--
ALTER TABLE `pdt_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
