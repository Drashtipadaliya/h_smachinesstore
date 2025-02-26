-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2024 at 11:39 PM
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
-- Database: `h_smachines`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `fnm` varchar(11) NOT NULL,
  `lnm` varchar(11) NOT NULL,
  `mobileno` double NOT NULL,
  `email` varchar(100) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `ads` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `fnm`, `lnm`, `mobileno`, `email`, `amount`, `ads`) VALUES
(4, 'naman', 'Padaliya', 5678904563, 'namanpadaliya@gmail.com', '70100', ''),
(7, 'khushi', 'padaliya', 1234567890, 'khushi@gmail.com', '100', ''),
(8, 'ayushi', 'sutariya', 5678904563, 'ayushi@gmail.com', '400100', ''),
(10, 'swara', 'Padaliya', 786102098, 'swarapadaliya@gmail.com', '100', ''),
(12, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', ''),
(20, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(21, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(22, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(23, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(24, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(25, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(26, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(27, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(28, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(29, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(30, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(31, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(32, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(33, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(34, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(35, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(36, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(37, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(38, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(39, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(40, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(41, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(42, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(43, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(44, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(45, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(46, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3000', 'RilanceNo'),
(47, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '143099', 'RilanceNo'),
(48, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '6099', 'RilanceNo'),
(49, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '6099', 'RilanceNo'),
(50, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '6099', 'RilanceNo'),
(51, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '76099', 'RilanceNo'),
(52, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '252887', 'RilanceNo'),
(53, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '9099', 'RilanceNo'),
(54, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '9099', 'RilanceNo'),
(55, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '44090', 'RilanceNo'),
(56, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '44090', 'RilanceNo'),
(57, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '44090', 'RilanceNo'),
(58, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(59, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(60, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(61, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(62, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(63, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(64, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(65, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(66, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(67, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '90', 'RilanceNo'),
(68, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(69, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(70, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3090', 'RilanceNo'),
(71, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(72, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(73, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(74, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '35090', 'RilanceNo'),
(75, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '35090', 'RilanceNo'),
(76, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '38090', 'RilanceNo'),
(77, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(78, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '35090', 'RilanceNo'),
(79, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '35090', 'RilanceNo'),
(80, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '35090', 'RilanceNo'),
(81, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '35090', 'RilanceNo'),
(82, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(83, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3090', 'RilanceNo'),
(84, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3090', 'RilanceNo'),
(85, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '6090', 'RilanceNo'),
(86, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(87, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '140090', 'RilanceNo'),
(88, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '140090', 'RilanceNo'),
(89, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(90, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3090', 'RilanceNo'),
(91, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '3090', 'RilanceNo'),
(92, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(93, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(94, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(95, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '70090', 'RilanceNo'),
(96, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '90', 'RilanceNo'),
(97, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '245090', 'RilanceNo'),
(98, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '280090', 'RilanceNo'),
(99, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '175090', 'RilanceNo'),
(100, 'naman', 'Padaliya', 5678904563, 'namanpadaliya@gmail.com', '210090', 'rajkot '),
(101, 'naman', 'Padaliya', 5678904563, 'namanpadaliya@gmail.com', '70090', 'rajkot '),
(102, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '315090', 'RilanceNo'),
(103, 'Drashti', 'Padaliya', 7861021684, 'drashtipadaliya2204@gmail.com', '143090', 'RilanceNo');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `pname` varchar(11) NOT NULL,
  `image` varchar(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `email` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(5) NOT NULL,
  `category` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `image`) VALUES
(11, 'laptop', '1q.jpg'),
(12, 'phone', '4.jpeg'),
(17, 'tablet', 't4.jpg'),
(18, 'headphone', '34.jpeg'),
(19, 'earphone', '89.jpeg'),
(20, 'enspry', 'df.png'),
(26, 'pedometer watch', 'p1.jpeg'),
(27, 'smart watch', 'w1.jpeg'),
(28, 'pendrive', 'p907.jpeg'),
(29, 'glass', 'g1.jpeg'),
(30, 'speaker', 'a1.jpeg'),
(32, 'computer', '15.jpg'),
(33, 'mouse', '8.jpg'),
(34, 'keyboard', '11.jpg'),
(35, 'TV', 'ed.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cnt`
--

CREATE TABLE `cnt` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobileno` int(10) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cnt`
--

INSERT INTO `cnt` (`id`, `name`, `address`, `mobileno`, `email`) VALUES
(1, 'H_SMACHINES PVT .LTD', 'shree v.n.borad mahila bca college,junagadh,joshipura-360002', 2147483647, 'tedvision789@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `contect`
--

CREATE TABLE `contect` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contect`
--

INSERT INTO `contect` (`id`, `name`, `email`, `subject`, `message`) VALUES
(1, 'mona', 'monamathukiya@gmail.com', 'dfdf', 'dfdfdf'),
(2, 'mona', 'monamathukiya@gmail.com', 'dfdf', 'rtrt'),
(3, 'mona', 'monamathukiya@gmail.com', 'dfdf', 'erer'),
(4, 'drashti', 'dfdfdf@gmail.com', 'sport', 'dfdfdf'),
(5, 'swara', 'swarapadaliya@gmail.com', 'laptop', 'where is your import matirial??');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(50) NOT NULL,
  `catgry` varchar(110) NOT NULL,
  `qnty` int(110) NOT NULL,
  `dcn` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `pname`, `price`, `image`, `catgry`, `qnty`, `dcn`) VALUES
(67, 'DELL laptop', 70000, '1q.jpg', 'laptop', 20, 'Dell is a well-known brand that produces a range of laptops for various types of users. Dell laptops come in a variety of models with different specifications, designs, and price points. Dell laptops are known for their reliability, making them a popular choice for both personal and professional use. '),
(71, 'earphone', 3000, '23.jpeg', 'other', 19, 'earphone is best item for clear voice lestion'),
(72, 'HP laptop', 176788, 'u8.jpg', 'laptop', 15, 'vdfdf'),
(73, 'apple laptop', 200000, 'i3.jpg', 'laptop', 25, 'smartphone brand that designs phones with the latest technology for customers in over 60 countries. Tecno phones are known for their competitive pricing, powerful processors, vibrant displays, and innovative designs.'),
(74, 'oppo 15s PRO', 35000, '4.jpeg', 'phone', 10, 'smartphone brand that designs phones with the latest technology for customers in over 60 countries. Tecno phones are known for their competitive pricing, powerful processors, vibrant displays, and innovative designs.'),
(75, 'DELL teblet', 20000, '7878.jpeg', 'tablet', 20, 'earphone is best item for clear voice lestion'),
(76, 'MSI leptop', 40500, '4i.jpg', 'laptop', 6, 'Laptops are designed to be portable computers. They are smaller and lighter than desktops'),
(77, 'acer', 67599, 'd.jpeg', 'laptop', 7, 'Laptops have rechargeable batteries that can be used for a set period away from a power source.'),
(78, 'HP laptop d5', 75999, 'g.jpeg', 'laptop', 9, 'portable computer that can be easily carried around. It\'s a device designed for personal use and can perform various functions such as browsing the internet, creating documents, playing games, etc'),
(79, 'microsoft lp', 102090, 'ythg.jpeg', 'laptop', 2, 'Laptops have rechargeable batteries that can be used for a set period away from a power source.'),
(80, 'vivo y10', 15999, '879.jpeg', 'phone', 4, 'smartphone brand that designs phones with the latest technology for customers in over 60 countries. Tecno phones are known for their competitive pricing, powerful processors, vibrant displays, and innovative designs.'),
(81, 'motorola m4', 60099, '16.jpeg', 'phone', 13, 'smartphone brand that designs phones with the latest technology for customers in over 60 countries. Tecno phones are known for their competitive pricing, powerful processors, vibrant displays, and innovative designs.'),
(82, 'oneplus a3', 50899, '2.jpeg', 'phone', 4, ' Mobile phones typically connect to the public switched telephone network'),
(83, 'realme 7i', 10999, '17.jpeg', 'phone', 5, ' Mobile phones typically connect to the public switched telephone network'),
(84, 'realme t3', 40999, '3434.jpeg', 'tablet', 6, 'Tablets may be defined as the solid unit dosage form of medication with suitable excipients.'),
(85, 'nokia g5', 5000, 't7.jpg', 'tablet', 4, 'Tablets may be defined as the solid unit dosage form of medication with suitable excipients.'),
(86, 'headphone h4', 20000, 'head.jpg', 'headphone', 4, 'headphone is best item for clear voice lestion'),
(87, 'u&i hp', 3699, 'download (3).jpeg', 'headphone', 2, 'headphone is best item for clear voice lestion'),
(88, 'realme h4', 60789, 'download.jpeg', 'headphone', 3, 'headphone is best item for clear voice lestion'),
(89, 'mi g5 ', 50000, 'download (4).jpeg', 'headphone', 3, 'headphone brand that designs phones with the latest technology for customers in over 60 countries. Tecno phones are known for their competitive pricing, powerful processors, vibrant displays, and innovative designs.'),
(90, 'U&I neckbend', 3000, 'default_image.jpg', 'earphone', 3, 'earphone is best item for clear voice lestion'),
(91, 'REALME ER', 5000, 'download (8).jpeg', 'earphone', 3, 'earphone is best item for clear voice lestion'),
(92, 'U&I anspry', 150, 'df.png', 'enspry', 17, 'enspry is best item for clear voice lestion'),
(93, 'TIGGER anspry', 250, 'df.png', 'enspry', 4, 'enspry is best item for clear voice lestion'),
(94, 'vivo anspry', 350, '5120etI-03L._AC_UF1000,1000_QL80_.jpg', 'enspry', 3, 'enspry is best item for clear voice lestion'),
(95, 'realme anspry', 300, 'download (11).jpeg', 'enspry', 2, 'enspry is best item for clear voice lestion'),
(96, 'boat anspry', 450, 'download (10).jpeg', 'enspry', 4, 'enspry is best item for clear voice lestion'),
(97, 'boat pe4', 4589, 'hj6.jpeg', 'pedometer watch', 4, 'Pedometers are designed to detect vertical movement at the hip and so measure the number of steps and provide an estimate of distance walked'),
(98, 'realme pd4', 7000, 'p1.jpeg', 'pedometer watch', 5, 'Pedometers are designed to detect vertical movement at the hip and so measure the number of steps and provide an estimate of distance walked'),
(99, 'U&I POD6', 2367, 'tg.jpeg', 'pedometer watch', 8, 'Pedometers are designed to detect vertical movement at the hip and so measure the number of steps and provide an estimate of distance walked'),
(100, 'MI POD5', 2379, 't4.jpeg', 'pedometer watch', 6, 'Pedometers are designed to detect vertical movement at the hip and so measure the number of steps and provide an estimate of distance walked'),
(101, 'noise e4', 5000, 'w7.jpeg', 'smart watch', 5, 'A smartwatch is a watch that offers extra functionality and connectivity on top of the features offered by standard watches.'),
(102, 'realme sw5', 6549, '45rt.jpeg', 'smart watch', 3, 'A smartwatch is a watch that offers extra functionality and connectivity on top of the features offered by standard watches.'),
(103, 'MI sf5', 4589, 'w2.jpeg', 'smart watch', 3, 'A smartwatch is a watch that offers extra functionality and connectivity on top of the features offered by standard watches.'),
(104, 'GOOGLE sm4', 50000, 'i9.jpeg', 'smart watch', 8, 'A smartwatch is a watch that offers extra functionality and connectivity on top of the features offered by standard watches.'),
(105, 'MONS rf3', 2399, 'oi7.jpeg', 'smart watch', 3, 'A smartwatch is a watch that offers extra functionality and connectivity on top of the features offered by standard watches.'),
(106, 'sundisk 36gb', 700, 'p2.jpeg', 'pendrive', 22, 'A pendrive is a small, portable storage device that plugs into a computer\'s USB port.'),
(107, 'intel 1tb', 6099, 'p3.jpeg', 'pendrive', 6, 'A pendrive is a small, portable storage device that plugs into a computer\'s USB port.'),
(108, 'microsoft 250gb', 4500, 'efg.jpeg', 'pendrive', 9, 'A pendrive is a small, portable storage device that plugs into a computer\'s USB port.'),
(109, 'hp 64gb', 5678, 'p7.jpeg', 'pendrive', 6, 'A pendrive is a small, portable storage device that plugs into a computer\'s USB port.'),
(110, 'pendrive 34gb', 567, 'p5.jpeg', 'pendrive', 6, 'A pendrive is a small, portable storage device that plugs into a computer\'s USB port.'),
(111, 'logs gb', 789, 'p6.jpeg', 'pendrive', 13, 'A pendrive is a small, portable storage device that plugs into a computer\'s USB port.'),
(112, 'nbs 590gb', 1200, 'p4.jpeg', 'pendrive', 6, 'A pendrive is a small, portable storage device that plugs into a computer\'s USB port.'),
(113, 'g glass a1', 176799, 'g2.jpeg', 'glass', 3, 'Google Glass is a wearable computer that resembles eyeglasses'),
(114, 'GOOGLE glass a2', 200000, 'g4.jpg', 'glass', 4, 'Google Glass is a wearable computer that resembles eyeglasses'),
(115, 'g glass a6', 78000, 'g4.jpg', 'glass', 2, 'Google Glass is a wearable computer that resembles eyeglasses'),
(116, 'GOOGLE glass a9', 89499, 'g5.jpeg', 'glass', 8, 'Google Glass is a wearable computer that resembles eyeglasses'),
(117, 'alexa a3', 3500, '2.jpg', 'speaker', 3, 'Alexa is a cloud-based voice assistant that allows users to interact with devices using voice commands'),
(118, 'smart speaker', 5999, '4.jpg', 'speaker', 6, 'Speakers are standard output devices used with computer systems that enable the listener to listen to a sound as an outcome'),
(119, 'cocs speaker', 7000, '3.jpg', 'speaker', 7, 'Speakers are standard output devices used with computer systems that enable the listener to listen to a sound as an outcome'),
(120, 'speaker 4g43', 9000, '5.jpg', 'speaker', 5, 'Speakers are standard output devices used with computer systems that enable the listener to listen to a sound as an outcome'),
(121, 'alexa 12', 6000, '7.jpg', 'speaker', 3, 'Alexa is a cloud-based voice assistant that allows users to interact with devices using voice commands'),
(122, 'alexa a56', 12000, '9.jpg', 'speaker', 10, 'Speakers are standard output devices used with computer systems that enable the listener to listen to a sound as an outcome'),
(123, 'hp computer', 50079, '14.jpg', 'computer', 8, 'computer have rechargeable batteries that can be used for a set period away from a power source.'),
(124, 'dell computer', 23000, '12.jpg', 'computer', 5, 'computer have rechargeable batteries that can be used for a set period away from a power source.'),
(125, 'lenovo computer', 78099, '11.jpg', 'computer', 4, 'computer have rechargeable batteries that can be used for a set period away from a power source.'),
(126, 'acer computer', 56890, '10.jpg', 'computer', 4, 'computer have rechargeable batteries that can be used for a set period away from a power source.'),
(127, 'DELL computer', 46999, '17.jpg', 'computer', 6, 'computer have rechargeable batteries that can be used for a set period away from a power source.'),
(128, 'hp computer f4', 70000, '9.jpg', 'computer', 8, 'computer have rechargeable batteries that can be used for a set period away from a power source.'),
(129, 'hp mouse ', 999, '1wj.jpg', 'mouse', 4, 'mouse is a drag and drop any types of data and its all wireless product '),
(130, 'dell mouse', 1299, '8.jpg', 'mouse', 7, 'mouse is a drag and drop any types of data and its all wireless product'),
(131, 'oracle mouse', 789, '4.jpg', 'mouse', 9, 'mouse is a drag and drop any types of data and its all wireless product'),
(132, 'mi mouse', 899, '5.jpg', 'mouse', 5, 'mouse is a drag and drop any types of data and its all wireless product'),
(133, 'mouse ai', 5000, '3.jpg', 'mouse', 8, 'mouse is a drag and drop any types of data and its all wireless product '),
(134, 'normal keybord', 5000, '9.jpg', 'keyboard', 8, 'keybord is mainly used to typing with another device using keybord'),
(135, 'gaming keybord', 7000, '10.jpg', 'keyboard', 6, 'keybord is mainly used to typing with another device using keybord'),
(136, 'slim keybord', 4599, '2.png', 'keyboard', 8, 'keybord is mainly used to typing with another device using keybord'),
(137, 'keybord black', 569, '6.jpg', 'keyboard', 8, 'keybord is mainly used to typing with another device using keybord'),
(138, 'keybord ', 1999, '4.jpg', 'keyboard', 6, 'keybord is mainly used to typing with another device using keybord'),
(139, 'mi tv', 200000, 'rf.jpeg', 'TV', 7, 'television is a used for all shows in tv for using to channels '),
(140, 'LG tv', 150000, 'tn.jpeg', 'TV', 7, 'television is a used for all shows in tv for using to channels '),
(141, 'hp tv', 176788, 't6.jpeg', 'TV', 6, 'television is a used for all shows in tv for using to channels '),
(142, 'dell tv', 207999, 'tv.jpeg', 'TV', 9, 'television is a used for all shows in tv for using to channels '),
(143, 'TECNO TV', 300000, '5tg.jpeg', 'TV', 6, 'television is a used for all shows in tv for using to channels ');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(10) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `fname`, `lname`, `email`, `mobile`, `password`, `address`, `role`) VALUES
(1, 'ted', 'clone', 'tedvision17@gmail.com', '4567891289', '@ted17', 'reliance jio', 'admin'),
(2, 'Drashti', 'Padaliya', 'drashtipadaliya2204@gmail.com', '7861021684', '112211', 'Rilance\r\nNo', 'user'),
(3, 'naman', 'Padaliya', 'namanpadaliya@gmail.com', '5678904563', '555555', 'rajkot ', 'user'),
(4, 'khushi', 'padaliya', 'khushi@gmail.com', '1234567890', '456456', 'surat', 'user'),
(5, 'khushali', 'sidhdhapara', 'khushalisidhdhapra@gmail.com', '7897896785', '110805', 'khodiyar pan shop near,jangavad,360040', 'user'),
(6, 'srushti', 'ramani', 'ramanisrushti11@gmail.com', '4564552397', '031005', 'mota vadala vali stret,lilapur-382775', 'user'),
(19, 'swara', 'Padaliya', 'swarapadaliya@gmail.com', '0786102098', '160423', 'Rilance\r\nNo', 'user'),
(20, 'ayushi', 'sutariya', 'ayushi@gmail.com', '5678904563', '565656', 'dhank,upleta,rajkot', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `details` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `name`, `image`, `details`) VALUES
(4, 'free shipping', 'free.jpg', 'Free shipping is an increasingly-popular option for online shopping'),
(5, 'service', 'call.jpg', 'Free Services means those aspects of the Services that are free and do not require payment'),
(6, 'secure payment', 'payment.jpg', 'More and more consumers are entering highly sensitive financial information online.');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `image` varchar(25) NOT NULL,
  `work` varchar(100) NOT NULL,
  `exp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `image`, `work`, `exp`) VALUES
(6, 'Khushali Sidhara', 'person_2.jpg', 'HR', 3),
(7, 'Naman Padaliya', 'n_1.jpg', 'Software Engineer', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cnt`
--
ALTER TABLE `cnt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contect`
--
ALTER TABLE `contect`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `cnt`
--
ALTER TABLE `cnt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contect`
--
ALTER TABLE `contect`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
