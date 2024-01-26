-- -------------------------------------------------------------
-- TablePlus 5.4.0(504)
--
-- https://tableplus.com/
--
-- Database: node38_food
-- Generation Time: 2024-01-02 19:11:07.6600
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` date DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Orders` (
  `OrderID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` date DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `decs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Customers` (`CustomerID`, `CustomerName`, `Email`) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 3, '2023-01-15'),
(2, 1, '2023-02-20'),
(3, 5, '2023-03-10'),
(5, 8, '2023-04-05'),
(5, 12, '2023-05-12'),
(1, 15, '2023-06-18'),
(2, 18, '2023-07-22'),
(3, 20, '2023-08-30'),
(4, 7, '2023-09-02'),
(5, 10, '2023-10-08'),
(1, 2, '2023-11-15'),
(2, 4, '2023-12-20'),
(3, 6, '2024-01-25'),
(4, 9, '2024-02-28'),
(5, 11, '2024-03-05'),
(1, 13, '2024-04-10'),
(2, 16, '2024-05-15'),
(3, 19, '2024-06-20'),
(3, 14, '2024-07-25'),
(5, 17, '2024-08-30');

INSERT INTO `Orders` (`OrderID`, `CustomerID`, `OrderDate`, `TotalAmount`) VALUES
(101, 1, '2023-01-15', 150.50),
(102, 2, '2023-01-16', 200.75);

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 3, 4, '2023-01-15'),
(2, 1, 5, '2023-02-20'),
(3, 5, 3, '2023-03-10'),
(4, 8, 4, '2023-04-05'),
(5, 12, 5, '2023-05-12'),
(1, 15, 4, '2023-06-18'),
(2, 18, 3, '2023-07-22'),
(3, 20, 5, '2023-08-30'),
(4, 7, 4, '2023-09-02'),
(5, 10, 5, '2023-10-08'),
(1, 2, 3, '2023-11-15'),
(2, 4, 4, '2023-12-20'),
(3, 6, 5, '2024-01-25'),
(4, 9, 3, '2024-02-28'),
(5, 11, 4, '2024-03-05'),
(1, 13, 5, '2024-04-10'),
(2, 16, 3, '2024-05-15'),
(3, 19, 4, '2024-06-20'),
(4, 14, 5, '2024-07-25'),
(5, 17, 3, '2024-08-30');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `decs`) VALUES
(1, 'Cafe Bella', 'cafe_bella.jpg', 'A cozy cafe with a variety of coffee options.'),
(2, 'Pizza Palace', 'pizza_palace.jpg', 'Home of the best pizza in town!'),
(3, 'Sushi Haven', 'sushi_haven.jpg', 'Fresh and delicious sushi dishes.'),
(4, 'Burger Bistro', 'burger_bistro.jpg', 'Gourmet burgers and fries.'),
(5, 'Thai Spice', 'thai_spice.jpg', 'Authentic Thai cuisine with a touch of spice.'),
(6, 'Mediterranean Delight', 'mediterranean_delight.jpg', 'Experience the flavors of the Mediterranean.'),
(7, 'Taco Fiesta', 'taco_fiesta.jpg', 'Taste the excitement of Mexican street food.'),
(8, 'Vegetarian Oasis', 'vegetarian_oasis.jpg', 'A haven for vegetarian and vegan delights.'),
(9, 'Steakhouse Supreme', 'steakhouse_supreme.jpg', 'Premium steaks cooked to perfection.'),
(10, 'Seafood Harbor', 'seafood_harbor.jpg', 'Fresh seafood served with a view.'),
(11, 'Pasta Paradise', 'pasta_paradise.jpg', 'Indulge in a variety of pasta dishes.'),
(12, 'Deli Delight', 'deli_delight.jpg', 'Classic deli sandwiches and salads.'),
(13, 'Indian Spice', 'indian_spice.jpg', 'Savor the rich flavors of Indian cuisine.'),
(14, 'Smoothie Spot', 'smoothie_spot.jpg', 'Refreshing smoothies and healthy snacks.'),
(15, 'BBQ Barn', 'bbq_barn.jpg', 'BBQ favorites in a rustic setting.'),
(16, 'Noodle Nook', 'noodle_nook.jpg', 'A diverse selection of noodle dishes.'),
(17, 'Crepe Corner', 'crepe_corner.jpg', 'Sweet and savory crepes for every taste.'),
(18, 'Ice Cream Emporium', 'ice_cream_emporium.jpg', 'A paradise of ice cream flavors.'),
(19, 'Diner Daze', 'diner_daze.jpg', 'Classic American diner with comfort food.'),
(20, 'Pho Palace', 'pho_palace.jpg', 'Delicious Vietnamese pho and more.');

INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(1, 'Emily Johnson', 'emily.j@example.com', 'pass789'),
(2, 'Michael Brown', 'michael.b@example.com', 'passwordXYZ'),
(3, 'Sophia Williams', 'sophia.w@example.com', 'secure123'),
(4, 'Daniel Miller', 'daniel.m@example.com', 'pass432'),
(5, 'Olivia Davis', 'olivia.d@example.com', 'mypassword'),
(6, 'Matthew Taylor', 'matthew.t@example.com', 'letmein123'),
(7, 'Emma Wilson', 'emma.w@example.com', 'password789'),
(8, 'Andrew Anderson', 'andrew.a@example.com', 'ilovecoding'),
(9, 'Ava Martinez', 'ava.m@example.com', '1234abcd'),
(10, 'William Jackson', 'william.j@example.com', 'password567'),
(11, 'Isabella Garcia', 'isabella.g@example.com', 'qwerty123'),
(12, 'James Harris', 'james.h@example.com', 'iloveSQL'),
(13, 'Lily Moore', 'lily.m@example.com', 'pass987'),
(14, 'Ethan White', 'ethan.w@example.com', 'abcde123'),
(15, 'Madison Lee', 'madison.l@example.com', 'pass654'),
(16, 'Aiden Smith', 'aiden.s@example.com', 'mypassword123'),
(17, 'Chloe Brown', 'chloe.b@example.com', 'chloepass'),
(18, 'Jackson Clark', 'jackson.c@example.com', 'password999'),
(19, 'Avery Turner', 'avery.t@example.com', 'turnerpass'),
(20, 'Scarlett Adams', 'scarlett.a@example.com', '12345pass'),
(21, 'Ozawa', 'ozawa@yahoo.com', 'ozawa');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;