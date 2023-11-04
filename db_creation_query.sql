CREATE TABLE `customers` (
    `customer_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `location` VARCHAR(1000) NOT NULL
);

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

CREATE TABLE `orders` (
    `order_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_id` BIGINT(20) UNSIGNED NOT NULL,
    `order_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP (),
    `total_amount` DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES
(1, 1, '2023-11-03 18:10:40', 799.99),
(2, 1, '2023-11-03 18:10:40', 1299.99),
(3, 1, '2023-11-03 18:10:40', 19.99),
(4, 10, '2023-11-03 18:10:40', 39.99),
(5, 3, '2023-11-03 18:10:40', 699.99),
(6, 3, '2023-11-03 18:10:40', 499.99),
(7, 2, '2023-11-03 18:10:40', 499.99),
(8, 2, '2023-11-03 18:10:40', 299.99),
(9, 2, '2023-11-03 18:10:40', 14.99),
(10, 4, '2023-11-03 18:10:40', 24.99),
(11, 4, '2023-11-03 18:10:40', 29.99),
(12, 4, '2023-11-03 18:10:40', 19.99),
(13, 4, '2023-11-03 18:10:40', 249.99),
(14, 9, '2023-11-03 18:10:40', 49.99),
(15, 5, '2023-11-03 18:10:40', 79.99),
(16, 5, '2023-11-03 18:10:40', 199.99),
(17, 6, '2023-11-03 18:10:40', 12.99),
(18, 7, '2023-11-03 18:10:40', 39.99),
(19, 8, '2023-11-03 18:10:40', 89.99),
(20, 10, '2023-11-03 18:10:40', 69.99);

CREATE TABLE `categories` (
    `category_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL
);

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances'),
(4, 'Furniture'),
(5, 'Books'),
(6, 'Toys');

CREATE TABLE `products` (
    `product_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_id` BIGINT(20) UNSIGNED NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `description` VARCHAR(5000),
    `price` DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

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

CREATE TABLE `order_items` (
    `order_items_id` BIGINT (20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` BIGINT (20) UNSIGNED NOT NULL,
    `product_id` BIGINT (20) UNSIGNED NOT NULL,
    `quantity` BIGINT (50) NOT NULL,
    `unit_price` DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

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