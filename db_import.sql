-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2023 at 05:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_import`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances'),
(4, 'Furniture'),
(5, 'Books'),
(6, 'Toys');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `location` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `location`) VALUES
(1, 'John Doe', 'john@example.com', 'New York, USA'),
(2, 'Jane Smith', 'jane@example.com', 'Los Angeles, USA'),
(3, 'Bob Johnson', 'bob@example.com', 'Chicago, USA'),
(4, 'Alice Brown', 'alice@example.com', 'Houston, USA'),
(5, 'Charlie Wilson', 'charlie@example.com', 'Miami, USA'),
(6, 'Eva Davis', 'eva@example.com', 'San Francisco, USA'),
(7, 'Frank White', 'frank@example.com', 'Seattle, USA'),
(8, 'Grace Lee', 'grace@example.com', 'Boston, USA'),
(9, 'Henry Martin', 'henry@example.com', 'Dallas, USA'),
(10, 'Isabel Perez', 'isabel@example.com', 'Denver, USA');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES
(1, 1, '2023-11-03 12:10:40', 799.99),
(2, 1, '2023-11-03 12:10:40', 1299.99),
(3, 1, '2023-11-03 12:10:40', 19.99),
(4, 10, '2023-11-03 12:10:40', 39.99),
(5, 3, '2023-11-03 12:10:40', 699.99),
(6, 3, '2023-11-03 12:10:40', 499.99),
(7, 2, '2023-11-03 12:10:40', 499.99),
(8, 2, '2023-11-03 12:10:40', 299.99),
(9, 2, '2023-11-03 12:10:40', 14.99),
(10, 4, '2023-11-03 12:10:40', 24.99),
(11, 4, '2023-11-03 12:10:40', 29.99),
(12, 4, '2023-11-03 12:10:40', 19.99),
(13, 4, '2023-11-03 12:10:40', 249.99),
(14, 9, '2023-11-03 12:10:40', 49.99),
(15, 5, '2023-11-03 12:10:40', 79.99),
(16, 5, '2023-11-03 12:10:40', 199.99),
(17, 6, '2023-11-03 12:10:40', 12.99),
(18, 7, '2023-11-03 12:10:40', 39.99),
(19, 8, '2023-11-03 12:10:40', 89.99),
(20, 10, '2023-11-03 12:10:40', 69.99);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_items_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` bigint(50) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_items_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 1, 799.99),
(2, 2, 2, 1, 1299.99),
(3, 3, 3, 1, 19.99),
(4, 4, 4, 2, 39.99),
(5, 5, 5, 1, 699.99),
(6, 6, 6, 1, 499.99),
(7, 7, 7, 1, 499.99),
(8, 8, 8, 1, 299.99),
(9, 9, 9, 1, 14.99),
(10, 10, 10, 1, 24.99),
(11, 11, 11, 1, 29.99),
(12, 12, 12, 2, 19.99),
(13, 13, 13, 1, 249.99),
(14, 14, 14, 1, 49.99),
(15, 15, 15, 1, 79.99),
(16, 16, 16, 1, 199.98),
(17, 17, 17, 1, 12.99),
(18, 18, 18, 2, 39.99),
(19, 19, 19, 1, 89.99),
(20, 20, 20, 1, 69.99);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `description`, `price`) VALUES
(1, 1, 'Smartphone', 'High-end smartphone with the latest features', 799.99),
(2, 1, 'Laptop', 'Powerful laptop for work and gaming', 1299.99),
(3, 2, 'T-Shirt', 'Cotton T-shirt in various colors', 19.99),
(4, 2, 'Jeans', 'Classic blue jeans for men', 39.99),
(5, 3, 'Refrigerator', 'Energy-efficient refrigerator for your kitchen', 699.99),
(6, 3, 'Washing Machine', 'Front-load washing machine with multiple cycles', 499.99),
(7, 4, 'Sofa', 'Comfortable 3-seater sofa for your living room', 499.99),
(8, 4, 'Dining Table', 'Wooden dining table with four chairs', 299.99),
(9, 5, 'Science Fiction Book', 'Best-selling science fiction novel', 14.99),
(10, 5, 'Cookbook', 'Collection of delicious recipes from around the world', 24.99),
(11, 6, 'LEGO Set', 'Building blocks for creative play', 29.99),
(12, 6, 'Doll', 'Popular doll with accessories', 19.99),
(13, 1, 'Tablet', 'Compact tablet for entertainment and productivity', 249.99),
(14, 2, 'Sweater', 'Warm and cozy sweater for the winter season', 49.99),
(15, 3, 'Microwave Oven', 'Efficient microwave for quick cooking', 79.99),
(16, 4, 'Bed Frame', 'Sturdy bed frame with headboard', 199.99),
(17, 5, 'Mystery Novel', 'Engaging mystery novel for avid readers', 12.99),
(18, 6, 'Remote Control Car', 'Remote-controlled car for kids and adults', 39.99),
(19, 1, 'Headphones', 'High-quality headphones for music lovers', 89.99),
(20, 2, 'Dress', 'Elegant dress for special occasions', 69.99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_items_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_items_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
