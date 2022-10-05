-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2022 at 12:56 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurantapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `currentorder`
--

CREATE TABLE `currentorder` (
  `placeholderID` int(10) NOT NULL,
  `menuName` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menuitem`
--

CREATE TABLE `menuitem` (
  `menuID` int(10) NOT NULL,
  `menuName` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menuitem`
--

INSERT INTO `menuitem` (`menuID`, `menuName`, `price`, `description`, `type`) VALUES
(1, 'Delicious Fish', 20.99, 'Delicious fish grilled on a pan', 'meat'),
(2, 'Delicious Steak', 25.99, 'Delicious steak grilled on a pan', 'meat'),
(4, 'Delicious Burger', 25.99, 'Delicious burger grilled on a pan', 'meat'),
(5, 'Delicious Bayam', 25.99, 'Delicious bayam grilled on a pan', 'vegetables'),
(6, 'Delicious Fried Rice', 10.99, 'Delicious fried rice grilled on a pan', 'misc'),
(7, 'Delicious Chicken', 17.99, 'Delicious chicken fried on a pan', 'meat'),
(8, 'Delicious Potato', 6.98, 'Delicious potato fried on a pan', 'misc');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(10) NOT NULL,
  `menuList` varchar(100) NOT NULL,
  `totalPrice` double NOT NULL,
  `paymentMethod` varchar(100) NOT NULL,
  `ccNumber` bigint(20) NOT NULL,
  `cvv` int(11) NOT NULL,
  `expDate` date DEFAULT NULL,
  `orderDate` date NOT NULL,
  `tableNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `menuList`, `totalPrice`, `paymentMethod`, `ccNumber`, `cvv`, `expDate`, `orderDate`, `tableNumber`) VALUES
(29, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'mastercard', 301, 0, NULL, '2022-05-11', 11),
(30, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'mastercard', 314, 0, NULL, '2022-05-17', 16),
(32, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 315, 0, NULL, '2022-05-01', 15),
(35, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-13', 1),
(40, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-25', 1),
(41, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-21', 1),
(42, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-17', 1),
(45, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-25', 1),
(46, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-22', 1),
(47, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-25', 1),
(51, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-25', 1),
(52, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-26', 1),
(53, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-26', 1),
(55, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-24', 1),
(58, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-21', 1),
(59, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-20', 1),
(60, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-19', 1),
(61, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-18', 1),
(62, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-17', 1),
(63, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-16', 1),
(64, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-15', 1),
(65, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-14', 1),
(66, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-13', 1),
(67, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-12', 1),
(68, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-11', 1),
(69, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-10', 1),
(70, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-09', 1),
(71, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-08', 1),
(72, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-07', 1),
(73, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-06', 1),
(74, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-05', 1),
(75, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-04', 1),
(76, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-03', 1),
(77, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-02', 1),
(78, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-01', 1),
(79, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-30', 1),
(80, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-29', 1),
(81, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-28', 1),
(82, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-27', 1),
(83, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-26', 1),
(84, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-25', 1),
(85, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-24', 1),
(86, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-23', 1),
(87, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-22', 1),
(88, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-21', 1),
(89, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-20', 1),
(90, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-19', 1),
(91, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-18', 1),
(92, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-17', 1),
(93, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-16', 1),
(94, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-15', 1),
(95, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-14', 1),
(96, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-13', 1),
(97, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-12', 1),
(98, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-11', 1),
(99, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-10', 1),
(100, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-09', 1),
(101, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-08', 1),
(102, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-07', 1),
(103, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-06', 1),
(104, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-05', 1),
(105, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-04', 1),
(106, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-03', 1),
(107, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-02', 1),
(108, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-01', 1),
(109, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-30', 1),
(110, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-29', 1),
(111, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-28', 1),
(112, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-27', 1),
(113, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-26', 1),
(114, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-25', 1),
(115, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-24', 1),
(116, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-23', 1),
(117, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-22', 1),
(118, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-21', 1),
(119, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-20', 1),
(120, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-19', 1),
(121, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-18', 1),
(122, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-17', 1),
(123, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-16', 1),
(124, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-15', 1),
(125, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-14', 1),
(126, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-13', 1),
(127, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-12', 1),
(128, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-11', 1),
(129, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-10', 1),
(130, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-09', 1),
(131, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-08', 1),
(132, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-07', 1),
(133, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-06', 1),
(134, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-05', 1),
(135, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-04', 1),
(136, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-03', 1),
(137, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-02', 1),
(138, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-05-01', 1),
(139, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-30', 1),
(140, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-29', 1),
(141, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-28', 1),
(142, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 0, NULL, '2022-04-27', 1),
(151, '3_Delicious Fish, 3_Delicious Fish, 3_Delicious Fish, ', 188.91, 'visa', 311, 312, '2022-09-23', '2022-09-23', 1),
(152, '5_Delicious Fried Rice, ', 54.95, 'american express', 1234123412341234, 313, '2022-09-24', '2022-09-24', 23),
(155, '4_Delicious Fried Rice, ', 43.96, 'american express', 1234123412341234, 312, '2022-09-24', '2022-09-24', 12),
(156, '5_Delicious Fried Rice, ', 54.95, 'american express', 1234123412341234, 321, '2022-09-24', '2022-09-24', 12),
(157, '1_Delicious Fish, 1_Delicious Potato, ', 27.97, 'american express', 1234123412341234, 312, '2022-09-28', '2022-09-24', 32),
(158, '1_Delicious Fish, ', 20.99, 'visa', 12341234, 321, '2022-09-27', '2022-09-25', 21),
(159, '1_Delicious Fish, 3_Delicious Fried Rice, 4_Delicious Potato, 1_Delicious Burger, ', 107.87, 'visa', 3221231231532123, 454, '2022-10-14', '2022-10-04', 14),
(160, '1_Delicious Burger, ', 25.99, 'visa', 1234123412341234, 657, '2022-10-20', '2022-10-04', 32),
(161, '2_Delicious Fish, ', 41.98, 'american express', 1234123412341234, 314, '2022-10-04', '2022-10-04', 31),
(162, '6_Delicious Steak, ', 155.94, 'american express', 3212321232123211, 314, '2022-10-12', '2022-10-04', 31),
(163, '1_Delicious Fish, 3_Delicious Burger, 1_Delicious Fried Rice, ', 109.95, 'visa', 1234123412341234, 231, '2022-10-06', '2022-10-05', 31),
(164, '6_Delicious Fish, ', 125.94, 'visa', 1234123412341234, 321, '2022-10-05', '2022-10-05', 12),
(165, '3_Delicious Fish, 4_Delicious Fried Rice, ', 106.93, 'visa', 1234123412341234, 312, '2022-10-05', '2022-10-05', 31),
(166, '4_Delicious Steak, 2_Delicious Fried Rice, ', 125.94, 'visa', 1234123412341234, 321, '2022-10-12', '2022-10-05', 31),
(167, '3_Delicious Bayam, ', 77.97, 'mastercard', 1234123412341234, 321, '2022-10-13', '2022-10-05', 31),
(168, '4_Delicious Fish, 1_Delicious Steak, 1_Delicious Burger, 1_Delicious Chicken, 1_Delicious Bayam, ', 179.92, 'mastercard', 4567456744564543, 312, '2022-10-13', '2022-10-05', 31),
(169, '4_Delicious Steak, 2_Delicious Fried Rice, 3_Delicious Chicken, ', 179.91, 'mastercard', 1234123412341234, 312, '2022-10-12', '2022-10-05', 34);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleID` int(11) NOT NULL,
  `roleName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleID`, `roleName`) VALUES
(2, 'manager'),
(11, 'owner'),
(7, 'staff'),
(1, 'useradmin');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `roleName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `email`, `firstName`, `lastName`, `roleName`) VALUES
('manager0', 'manager123', 'manager0@a.com', 'Manager0', 'Manager0', 'manager'),
('manager1', 'manager123', 'manager1@a.com', 'Manager1', 'Manager1', 'manager'),
('manager10', 'manager123', 'manager10@a.com', 'Manager10', 'Manager10', 'manager'),
('manager11', 'manager123', 'manager11@a.com', 'Manager11', 'Manager11', 'manager'),
('manager12', 'manager123', 'manager12@a.com', 'Manager12', 'Manager12', 'manager'),
('manager13', 'manager123', 'manager13@a.com', 'Manager13', 'Manager13', 'manager'),
('manager14', 'manager123', 'manager14@a.com', 'Manager14', 'Manager14', 'manager'),
('manager15', 'manager123', 'manager15@a.com', 'Manager15', 'Manager15', 'manager'),
('manager16', 'manager123', 'manager16@a.com', 'Manager16', 'Manager16', 'manager'),
('manager17', 'manager123', 'manager17@a.com', 'Manager17', 'Manager17', 'manager'),
('manager18', 'manager123', 'manager18@a.com', 'Manager18', 'Manager18', 'manager'),
('manager19', 'manager123', 'manager19@a.com', 'Manager19', 'Manager19', 'manager'),
('manager2', 'manager123', 'manager2@a.com', 'Manager2', 'Manager2', 'manager'),
('manager3', 'manager123', 'manager3@a.com', 'Manager3', 'Manager3', 'manager'),
('manager4', 'manager123', 'manager4@a.com', 'Manager4', 'Manager4', 'manager'),
('manager5', 'manager123', 'manager5@a.com', 'Manager5', 'Manager5', 'manager'),
('manager6', 'manager123', 'manager6@a.com', 'Manager6', 'Manager6', 'manager'),
('manager7', 'manager123', 'manager7@a.com', 'Manager7', 'Manager7', 'manager'),
('manager8', 'manager123', 'manager8@a.com', 'Manager8', 'Manager8', 'manager'),
('manager9', 'manager123', 'manager9@a.com', 'Manager9', 'Manager9', 'manager'),
('oswaldo2', 'Kasd1234', 'o@o.co', 'Loloo', 'Lolo', 'owner'),
('oswaldoo', 'Kczs70967942', 'o@a.co', 'Oswaldo', 'Oswald', 'manager'),
('owner0', 'owner123', 'owner0@a.com', 'owner0', 'owner0', 'owner'),
('owner1', 'owner123', 'owner1@a.com', 'owner1', 'owner1', 'owner'),
('owner10', 'owner123', 'owner10@a.com', 'owner10', 'owner10', 'owner'),
('owner11', 'owner123', 'owner11@a.com', 'owner11', 'owner11', 'owner'),
('owner12', 'owner123', 'owner12@a.com', 'owner12', 'owner12', 'owner'),
('owner13', 'owner123', 'owner13@a.com', 'owner13', 'owner13', 'owner'),
('owner14', 'owner123', 'owner14@a.com', 'owner14', 'owner14', 'owner'),
('owner15', 'owner123', 'owner15@a.com', 'owner15', 'owner15', 'owner'),
('owner16', 'owner123', 'owner16@a.com', 'owner16', 'owner16', 'owner'),
('owner17', 'owner123', 'owner17@a.com', 'owner17', 'owner17', 'owner'),
('owner18', 'owner123', 'owner18@a.com', 'owner18', 'owner18', 'owner'),
('owner19', 'owner123', 'owner19@a.com', 'owner19', 'owner19', 'owner'),
('owner2', 'owner123', 'owner2@a.com', 'owner2', 'owner2', 'owner'),
('owner3', 'owner123', 'owner3@a.com', 'owner3', 'owner3', 'owner'),
('owner4', 'owner123', 'owner4@a.com', 'owner4', 'owner4', 'owner'),
('owner5', 'owner123', 'owner5@a.com', 'owner5', 'owner5', 'owner'),
('owner6', 'owner123', 'owner6@a.com', 'owner6', 'owner6', 'owner'),
('owner7', 'owner123', 'owner7@a.com', 'owner7', 'owner7', 'owner'),
('owner8', 'owner123', 'owner8@a.com', 'owner8', 'owner8', 'owner'),
('owner9', 'owner123', 'owner9@a.com', 'owner9', 'owner9', 'owner'),
('staff0', 'staff123', 'staff0@a.com', 'Staff0', 'Staff0', 'staff'),
('staff1', 'staff123', 'staff1@a.com', 'Staff1', 'Staff1', 'staff'),
('staff10', 'staff123', 'staff10@a.com', 'Staff10', 'Staff10', 'staff'),
('staff11', 'staff123', 'staff11@a.com', 'Staff11', 'Staff11', 'staff'),
('staff12', 'staff123', 'staff12@a.com', 'Staff12', 'Staff12', 'staff'),
('staff13', 'staff123', 'staff13@a.com', 'Staff13', 'Staff13', 'staff'),
('staff14', 'staff123', 'staff14@a.com', 'Staff14', 'Staff14', 'staff'),
('staff15', 'staff123', 'staff15@a.com', 'Staff15', 'Staff15', 'staff'),
('staff16', 'staff123', 'staff16@a.com', 'Staff16', 'Staff16', 'staff'),
('staff17', 'staff123', 'staff17@a.com', 'Staff17', 'Staff17', 'staff'),
('staff18', 'staff123', 'staff18@a.com', 'Staff18', 'Staff18', 'staff'),
('staff19', 'staff123', 'staff19@a.com', 'Staff19', 'Staff19', 'staff'),
('staff2', 'staff123', 'staff2@a.com', 'Staff2', 'Staff2', 'staff'),
('staff3', 'staff123', 'staff3@a.com', 'Staff3', 'Staff3', 'staff'),
('staff4', 'staff123', 'staff4@a.com', 'Staff4', 'Staff4', 'staff'),
('staff5', 'staff123', 'staff5@a.com', 'Staff5', 'Staff5', 'staff'),
('staff6', 'staff123', 'staff6@a.com', 'Staff6', 'Staff6', 'staff'),
('staff7', 'staff123', 'staff7@a.com', 'Staff7', 'Staff7', 'staff'),
('staff8', 'staff123', 'staff8@a.com', 'Staff8', 'Staff8', 'staff'),
('staff9', 'staff123', 'staff9@a.com', 'Staff9', 'Staff9', 'staff'),
('useradmin0', 'useradmin123', 'useradmin0@a.com', 'Admin0', 'Admin0', 'useradmin'),
('useradmin1', 'useradmin123', 'useradmin1@a.com', 'Admin1', 'Admin1', 'useradmin'),
('useradmin10', 'useradmin123', 'useradmin10@a.com', 'Admin10', 'Admin10', 'useradmin'),
('useradmin11', 'useradmin123', 'useradmin11@a.com', 'Admin11', 'Admin11', 'useradmin'),
('useradmin12', 'useradmin123', 'useradmin12@a.com', 'Admin12', 'Admin12', 'useradmin'),
('useradmin13', 'useradmin123', 'useradmin13@a.com', 'Admin13', 'Admin13', 'useradmin'),
('useradmin14', 'useradmin123', 'useradmin14@a.com', 'Admin14', 'Admin14', 'useradmin'),
('useradmin15', 'useradmin123', 'useradmin15@a.com', 'Admin15', 'Admin15', 'useradmin'),
('useradmin16', 'useradmin123', 'useradmin16@a.com', 'Admin16', 'Admin16', 'useradmin'),
('useradmin17', 'useradmin123', 'useradmin17@a.com', 'Admin17', 'Admin17', 'useradmin'),
('useradmin18', 'useradmin123', 'useradmin18@a.com', 'Admin18', 'Admin18', 'useradmin'),
('useradmin19', 'useradmin123', 'useradmin19@a.com', 'Admin19', 'Admin19', 'useradmin'),
('useradmin2', 'useradmin123', 'useradmin2@a.com', 'Admin2', 'Admin2', 'useradmin'),
('useradmin3', 'useradmin123', 'useradmin3@a.com', 'Admin3', 'Admin3', 'useradmin'),
('useradmin4', 'useradmin123', 'useradmin4@a.com', 'Admin4', 'Admin4', 'useradmin'),
('useradmin5', 'useradmin123', 'useradmin5@a.com', 'Admin5', 'Admin5', 'useradmin'),
('useradmin6', 'useradmin123', 'useradmin6@a.com', 'Admin6', 'Admin6', 'useradmin'),
('useradmin7', 'useradmin123', 'useradmin7@a.com', 'Admin7', 'Admin7', 'useradmin'),
('useradmin8', 'useradmin123', 'useradmin8@a.com', 'Admin8', 'Admin8', 'useradmin'),
('useradmin9', 'useradmin123', 'useradmin9@a.com', 'Admin9', 'Admin9', 'useradmin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currentorder`
--
ALTER TABLE `currentorder`
  ADD PRIMARY KEY (`placeholderID`);

--
-- Indexes for table `menuitem`
--
ALTER TABLE `menuitem`
  ADD PRIMARY KEY (`menuID`),
  ADD UNIQUE KEY `menuName` (`menuName`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleID`),
  ADD UNIQUE KEY `roleName` (`roleName`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `UNIQUE_1` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `currentorder`
--
ALTER TABLE `currentorder`
  MODIFY `placeholderID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT for table `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `menuID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
