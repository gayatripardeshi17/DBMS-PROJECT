


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Database: `farmers`
--

-- --------------------------------------------------------

--
-- Table structure for table `addagroproducts`
--

CREATE TABLE `addagroproducts` (
  `username` varchar(50) ,
  `email` varchar(50) ,
  `pid` int(11) ,
  `productname` varchar(100) ,
  `productdesc` text NOT NULL,
  `price` int(100) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addagroproducts`
--

INSERT INTO `addagroproducts` (`username`, `email`, `pid`, `productname`, `productdesc`, `price`) VALUES
('test', 'test@gmail.com', 1, 'GIRIJA CAULIFLOWER', ' Tips for Growing Cauliflower. Well drained medium loam and or sandy loam soils are suitable.', 520),
('test', 'test@gmail.com', 2, 'COTTON', 'Cotton is a soft, fluffy staple fiber that grows in a boll,around the seeds of the cotton ', 563),
('arkpro', 'arkpro@gmail.com', 3, 'silk', 'silk is best business developed from coocon for saries preparation and so on', 582);

-- --------------------------------------------------------

--
-- Table structure for table `farming`
--

CREATE TABLE `farming` (
  `fid` int(20) NOT NULL,
  `farmingtype` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farming`
--

INSERT INTO `farming` (`fid`, `farmingtype`) VALUES
(1, 'Seed Farming'),
(2, 'coccon'),
(3, 'silk');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `rid` int(11) NOT NULL,
  `farmername` varchar(50) NOT NULL,
  `adharnumber` varchar(20) NOT NULL,
  `age` int(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phonenumber` varchar(12) NOT NULL,
  `address` varchar(50) NOT NULL,
  `farming` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Triggers `register`
--
DELIMITER $$
CREATE TRIGGER `deletion` BEFORE DELETE ON `register` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.rid,'FARMER DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertion` AFTER INSERT ON `register` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rid,'Farmer Inserted',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updation` AFTER UPDATE ON `register` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rid,'FARMER UPDATED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 'harshith');

-- --------------------------------------------------------

--
-- Table structure for table `trig`
--

CREATE TABLE `trig` (
  `id` int(11) NOT NULL,
  `fid` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trig`
--

INSERT INTO `trig` (`id`, `fid`, `action`, `timestamp`) VALUES
(1, '2', 'FARMER UPDATED', '2021-01-19 23:04:44'),
(2, '2', 'FARMER DELETED', '2021-01-19 23:04:58'),
(3, '8', 'Farmer Inserted', '2021-01-19 23:16:52'),
(4, '8', 'FARMER UPDATED', '2021-01-19 23:17:17'),
(5, '8', 'FARMER DELETED', '2021-01-19 23:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'ARG', 'ARG@gmail.com', 'abcdefg');

--
-- Indexes for dumped tables
--
-- --------------------------------------------------------

--
-- Table structure for table ``farmers_profile``
--
CREATE TABLE `farmers_profile` (
  `farmer_id` int(11) NOT NULL AUTO_INCREMENT,
  `farmer_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`farmer_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--
INSERT INTO `farmers_profile` (`farmer_name`, `email`, `phone_number`, `address`) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, Anytown');

--
-- Table structure for table `product_catalog``
--
CREATE TABLE `product_catalog` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` int(100) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_catalog`
--
INSERT INTO `product_catalog` (`product_name`, `category`, `price`) VALUES
('Potatoes', 'Vegetables', 5),
('Wheat', 'Grains', 10),
('Tomatoes', 'Vegetables', 3);

--
-- Table structure for table `purchase_requests``
--
CREATE TABLE `purchase_requests` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_name` varchar(50) NOT NULL,
  `buyer_email` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`request_id`),
  FOREIGN KEY (`product_id`) REFERENCES `product_catalog`(`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_catalog`
--
INSERT INTO `purchase_requests` (`buyer_name`, `buyer_email`, `product_id`, `quantity`, `status`) VALUES
('Alice', 'alice@example.com', 1, 10, 'Pending'),
('Bob', 'bob@example.com', 2, 5, 'Approved');


--
-- Table structure for table `transactions``
--
CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  PRIMARY KEY (`transaction_id`),
  FOREIGN KEY (`seller_id`) REFERENCES `farmers_profile`(`farmer_id`),
  FOREIGN KEY (`buyer_id`) REFERENCES `farmers_profile`(`farmer_id`),
  FOREIGN KEY (`product_id`) REFERENCES `product_catalog`(`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`seller_id`, `buyer_id`, `product_id`, `quantity`, `total_amount`, `transaction_date`) VALUES
(1, 2, 1, 10, 50, '2023-03-15 10:00:00'),
(2, 1, 2, 5, 50, '2023-03-16 11:00:00');

--
-- Table structure for table `tools_seed``
--
CREATE TABLE `tools_seeds` (
  `tool_seed_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` int(100) NOT NULL,
  PRIMARY KEY (`tool_seed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Dumping data for table `tools_seed`
--
INSERT INTO `tools_seeds` (`product_name`, `category`, `price`) VALUES
('Plow', 'Tools', 100),
('Corn Seeds', 'Seeds', 20),
('Sprinkler System', 'Tools', 200);
--
-- Table structure for table `seller_ratings``
--

CREATE TABLE `seller_ratings` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `feedback` text,
  PRIMARY KEY (`rating_id`),
  FOREIGN KEY (`seller_id`) REFERENCES `farmers_profile`(`farmer_id`),
  FOREIGN KEY (`buyer_id`) REFERENCES `farmers_profile`(`farmer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Dumping data for table `seller_ratings`
--

INSERT INTO `seller_ratings` (`seller_id`, `buyer_id`, `rating`, `feedback`) VALUES
(1, 2, 5, 'Great service and quality products.'),
(2, 1, 4, 'Fast delivery but product quality could be improved.');
--
-- Table structure for table `messages``
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message_body` text NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`message_id`),
  FOREIGN KEY (`sender_id`) REFERENCES `farmers_profile`(`farmer_id`),
  FOREIGN KEY (`receiver_id`) REFERENCES `farmers_profile`(`farmer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`sender_id`, `receiver_id`, `subject`, `message_body`, `timestamp`) VALUES
(1, 2, 'Regarding Product Inquiry', 'I am interested in purchasing potatoes. Can you provide more details?', '2023-03-17 09:00:00'),
(2, 1, 'Re: Product Inquiry', 'Sure, here are the details...', '2023-03-17 10:00:00');


--
-- Indexes for table `addagroproducts`
--
ALTER TABLE `addagroproducts`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `farming`
--
ALTER TABLE `farming`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trig`
--
ALTER TABLE `trig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addagroproducts`
--
ALTER TABLE `addagroproducts`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `farming`
--
ALTER TABLE `farming`
  MODIFY `fid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trig`
--
ALTER TABLE `trig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

