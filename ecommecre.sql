-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 06, 2023 at 11:22 AM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id20467408_ecommecre_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_user_id` int(11) NOT NULL,
  `address_city` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `address_street` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `address_lat` double NOT NULL,
  `address_lng` double NOT NULL,
  `address_user_phone` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `address_type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `address_note` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_user_id`, `address_city`, `address_street`, `address_lat`, `address_lng`, `address_user_phone`, `address_type`, `address_note`) VALUES
(17, 15, 'City', 'Street', 30.5317734, 31.0928747, '01000100066', 'Other', ''),
(25, 15, 'City', 'Street', 30.5317381, 31.0928968, '01061075996', 'Office', '');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_user_id` int(11) NOT NULL,
  `cart_product_id` int(11) NOT NULL,
  `cart_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_user_id`, `cart_product_id`, `cart_order`) VALUES
(26, 15, 2, 0),
(29, 15, 2, 0),
(30, 15, 2, 0),
(31, 15, 3, 0),
(32, 15, 3, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartView`
-- (See below for the actual view)
--
CREATE TABLE `cartView` (
`priceItems` double
,`countItems` bigint(21)
,`cart_id` int(11)
,`cart_user_id` int(11)
,`cart_product_id` int(11)
,`cart_order` int(11)
,`product_name` varchar(250)
,`product_name_ar` varchar(250)
,`product_desc` varchar(750)
,`product_desc_ar` varchar(750)
,`product_image` varchar(250)
,`product_count` int(11)
,`product_active` tinyint(4)
,`product_price` float
,`product_discount` smallint(6)
,`product_dateTime` timestamp
,`product_category_id` int(11)
,`product_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_name_ar` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_name`, `category_name_ar`, `category_image`, `dateTime`, `category_id`) VALUES
('Laptop', 'لابتوب', 'desktop.png', '2023-03-14 16:52:17', 1),
('Mobile', 'الهواتف', 'phone.png', '2023-03-14 16:55:39', 2),
('Camera', 'الكاميرا', 'camera.png', '2023-03-14 16:57:27', 3),
('Dresses', 'الفساتين', 'dress.png', '2023-03-18 04:32:31', 4),
('Shoes', 'الاحذية', 'shoes.png', '2023-03-18 04:33:31', 5);

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_discount` smallint(6) NOT NULL DEFAULT 0,
  `coupon_expired_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_count`, `coupon_discount`, `coupon_expired_date`) VALUES
(1, 'B612', 10, 20, '2023-03-30 16:35:45');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_user_id` int(11) NOT NULL,
  `favorite_product_id` int(11) NOT NULL,
  `favorite_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_user_id`, `favorite_product_id`, `favorite_id`) VALUES
(15, 2, 76);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myFavourites`
-- (See below for the actual view)
--
CREATE TABLE `myFavourites` (
`favorite_id` int(11)
,`favorite_user_id` int(11)
,`favorite_product_id` int(11)
,`product_id` int(11)
,`product_name` varchar(250)
,`product_name_ar` varchar(250)
,`product_desc` varchar(750)
,`product_desc_ar` varchar(750)
,`product_image` varchar(250)
,`product_count` int(11)
,`product_active` tinyint(4)
,`product_price` float
,`product_discount` smallint(6)
,`product_dateTime` timestamp
,`product_category_id` int(11)
,`user_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_user_id` int(11) NOT NULL,
  `order_address` int(11) NOT NULL,
  `order_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Delivery Man ; 1=> Drive Thru',
  `order_delivery_price` int(11) NOT NULL DEFAULT 0,
  `order_price` int(11) NOT NULL,
  `order_coupon` int(11) NOT NULL DEFAULT 0,
  `order_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `order_payment_method` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Cash ; 1=> Credit Card'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `product_name_ar` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `product_desc` varchar(750) COLLATE utf8_unicode_ci NOT NULL,
  `product_desc_ar` varchar(750) COLLATE utf8_unicode_ci NOT NULL,
  `product_image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `product_count` int(11) NOT NULL,
  `product_active` tinyint(4) NOT NULL DEFAULT 1,
  `product_price` float NOT NULL,
  `product_discount` smallint(6) NOT NULL,
  `product_dateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_name`, `product_name_ar`, `product_desc`, `product_desc_ar`, `product_image`, `product_count`, `product_active`, `product_price`, `product_discount`, `product_dateTime`, `product_category_id`, `product_id`) VALUES
('Apple MacBook Pro 2021', 'أبل ماك بوك برو 2021', 'Apple MacBook Pro 2021 (14-Inch, Apple M1 Pro Chipset with 8-Inch CPU and 14-Inch GPU, 16GB RAM, 512GB SSD) - Space Gray', '14 بوصة ، مجموعة شرائح Apple M1 Pro مع وحدة معالجة مركزية مقاس 8 بوصة\r\nووحدة معالجة رسومات 14 بوصة ، وذاكرة وصول عشوائي 16 جيجابايت ، وذاكرة SSD بسعة 512 جيجابايت - رمادي فلكي', 'desktop1.png', 5, 1, 72999, 10, '2023-03-15 04:50:30', 1, 1),
('The new Apple iPhone 14 Pro Max, 256 GB, dark purple', 'موبايل ابل ايفون 14 برو ماكس الجديد، 256 جيجابايت، ارجواني غامق', 'The 6.7-inch Super Retina XDR display features Always On and ProMotion\r\nDynamic Island, a magical new way to interact with your iPhone\r\n48MP main camera, up to 4 times larger\r\nCinematic mode now in Dolby Vision in 4K resolution at up to 30 frames per second\r\nMotion Mode for smooth, steady handheld videos\r\nVital Safety Features - Satellite Emergency Function and Collision Detection\r\nAll-day battery life, up to 29 hours of video playback\r\nA16 Bionic chip, the perfect smartphone chip. Ultra-fast cellular network, the fifth generation 5G network\r\nFeatures industry-leading durability with ceramic shield and water resistance', 'شاشة سوبر ريتينا اكس دي ار مقاس 6.7 بوصة تتميز دائمًا بتشغيل وبرو موشن\r\nجزيرة ديناميكية، طريقة جديدة سحرية للتفاعل مع ايفون\r\nكاميرا رئيسية بدقة 48 ميجابكسل بدقة أكبر تصل إلى 4 أضعاف\r\nوضع سينمائي الآن في بتقنية دولبي فيجن بدقة 4 كيه حتى 30 إطار في الثانية\r\nوضع الحركة لمقاطع فيديو سلسة وثابتة ومحمولة باليد\r\nمميزات السلامة الحيوية - وظيفة الطوارئ عبر الأقمار الصناعية والكشف عن التصادم\r\nعمر البطارية طوال اليوم وحتى 29 ساعة من تشغيل الفيديو\r\nشريحة A16 بيونيك، شريحة الهاتف الذكي المثالية. شبكة خلوية فائقة السرعة، شبكة الجيل الخامس 5G\r\nمميزات المتانة الرائدة في الصناعة مع درع السيراميك ومقاومة الماء', 'phone1.png', 10, 1, 53600, 40, '2023-03-15 04:54:23', 2, 2),
('Canon EOS M50 Mark Camera', 'كاميرا كانون EOS M50 Mark', 'Country of origin: China Light weight and convenient suitable color Canon EOS M50 Mark II Camera Housing (24.1 MP, 7.5 cm LCD Touchscreen, WLAN, HDMI, Bluetooth, APS-C Dual Pixel CMOS AF System, Eye Detection, DIGIC 8, 4K Video, OLED EVF) Unique and fashionable design.', 'بلد المنشأ: الصينخفيف الوزن ومريحلون مناسبغطاء كاميرا Canon EOS M50 Mark II (24.1 ميجابكسل ، شاشة لمس LCD 7.5 سم ، WLAN ، HDMI ، Bluetooth ، APS-C ثنائي البكسل CMOS نظام AF ، اكتشاف العين ، DIGIC 8 ، فيديو 4K ، OLED EVF)تصميم فريد وعصري.', 'camera1.png', 9, 1, 28312, 10, '2023-03-15 05:00:46', 3, 3),
('Desert for Men Fs15 - Fashion Chunky Sole Sneaker', 'ديزرت للرجال Fs15 - حذاء رياضي بنعل سميك عصري', 'Distinctive shoes with a comfortable leather upper, classic lace-up, soft inner lining that ensures all-day comfort, and a durable PVC outsole that gives your feet more comfort', 'حذاء مميز بجزء علوي من الجلد المريح ورباط كلاسيكي وبطانة داخلية ناعمة تضمن الراحة طوال اليوم ونعل خارجي متين من مادة PVC يمنح قدميك مزيدًا من الراحة', 'shoes1.png', 15, 1, 299, 0, '2023-03-15 05:00:46', 5, 4),
('Chelsea Boots Men Shoes Black', 'أحذية تشيلسي أحذية سوداء للرجال', 'Style: high boots, snow boots, hiking boots, motorcycle shoes Sole: thick sole Sole characteristics: wear-resistant and non-slip Workmanship: cold sticky, waterproof Size: Chinese size', 'النمط: أحذية عالية ، أحذية ثلجية ، أحذية تنزه ، أحذية دراجات نارية النعل: نعل سميك خصائص النعل: مقاومة للاهتراء وعدم الانزلاق صنعة: بارد لزج ، مقاوم للماء الحجم: الحجم الصيني', 'shoes2.png', 25, 1, 1150, 10, '2023-03-15 05:06:03', 5, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `productsView`
-- (See below for the actual view)
--
CREATE TABLE `productsView` (
`product_id` int(11)
,`product_name` varchar(250)
,`product_name_ar` varchar(250)
,`product_desc` varchar(750)
,`product_desc_ar` varchar(750)
,`product_image` varchar(250)
,`product_count` int(11)
,`product_active` tinyint(4)
,`product_price` float
,`product_discount` smallint(6)
,`product_dateTime` timestamp
,`product_category_id` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`category_name_ar` varchar(100)
,`category_image` varchar(100)
,`dateTime` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `verify_code` int(11) NOT NULL,
  `approve` tinyint(4) NOT NULL DEFAULT 0,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_name`, `email`, `phone`, `verify_code`, `approve`, `create_at`, `password`, `user_id`) VALUES
('Mohamed', 'mHosny88@gmail.com', '01061075996', 67524, 1, '2023-03-13 18:56:18', '7c222fb2927d828af22f592134e8932480637c0d', 15);

-- --------------------------------------------------------

--
-- Structure for view `cartView`
--
DROP TABLE IF EXISTS `cartView`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id20467408_ecommecre`@`%` SQL SECURITY DEFINER VIEW `cartView`  AS  select sum(`products`.`product_price` - `products`.`product_price` * `products`.`product_discount` / 100) AS `priceItems`,count(`cart`.`cart_product_id`) AS `countItems`,`cart`.`cart_id` AS `cart_id`,`cart`.`cart_user_id` AS `cart_user_id`,`cart`.`cart_product_id` AS `cart_product_id`,`cart`.`cart_order` AS `cart_order`,`products`.`product_name` AS `product_name`,`products`.`product_name_ar` AS `product_name_ar`,`products`.`product_desc` AS `product_desc`,`products`.`product_desc_ar` AS `product_desc_ar`,`products`.`product_image` AS `product_image`,`products`.`product_count` AS `product_count`,`products`.`product_active` AS `product_active`,`products`.`product_price` AS `product_price`,`products`.`product_discount` AS `product_discount`,`products`.`product_dateTime` AS `product_dateTime`,`products`.`product_category_id` AS `product_category_id`,`products`.`product_id` AS `product_id` from (`cart` join `products` on(`products`.`product_id` = `cart`.`cart_product_id`)) where `cart`.`cart_order` = 0 group by `cart`.`cart_product_id`,`cart`.`cart_user_id` ;

-- --------------------------------------------------------

--
-- Structure for view `myFavourites`
--
DROP TABLE IF EXISTS `myFavourites`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id20467408_ecommecre`@`%` SQL SECURITY DEFINER VIEW `myFavourites`  AS  select `favorite`.`favorite_id` AS `favorite_id`,`favorite`.`favorite_user_id` AS `favorite_user_id`,`favorite`.`favorite_product_id` AS `favorite_product_id`,`products`.`product_id` AS `product_id`,`products`.`product_name` AS `product_name`,`products`.`product_name_ar` AS `product_name_ar`,`products`.`product_desc` AS `product_desc`,`products`.`product_desc_ar` AS `product_desc_ar`,`products`.`product_image` AS `product_image`,`products`.`product_count` AS `product_count`,`products`.`product_active` AS `product_active`,`products`.`product_price` AS `product_price`,`products`.`product_discount` AS `product_discount`,`products`.`product_dateTime` AS `product_dateTime`,`products`.`product_category_id` AS `product_category_id`,`users`.`user_id` AS `user_id` from ((`favorite` join `users` on(`users`.`user_id` = `favorite`.`favorite_user_id`)) join `products` on(`products`.`product_id` = `favorite`.`favorite_product_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `productsView`
--
DROP TABLE IF EXISTS `productsView`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id20467408_ecommecre`@`%` SQL SECURITY DEFINER VIEW `productsView`  AS  select `products`.`product_id` AS `product_id`,`products`.`product_name` AS `product_name`,`products`.`product_name_ar` AS `product_name_ar`,`products`.`product_desc` AS `product_desc`,`products`.`product_desc_ar` AS `product_desc_ar`,`products`.`product_image` AS `product_image`,`products`.`product_count` AS `product_count`,`products`.`product_active` AS `product_active`,`products`.`product_price` AS `product_price`,`products`.`product_discount` AS `product_discount`,`products`.`product_dateTime` AS `product_dateTime`,`products`.`product_category_id` AS `product_category_id`,`categories`.`category_id` AS `category_id`,`categories`.`category_name` AS `category_name`,`categories`.`category_name_ar` AS `category_name_ar`,`categories`.`category_image` AS `category_image`,`categories`.`dateTime` AS `dateTime` from (`products` join `categories` on(`products`.`product_category_id` = `categories`.`category_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_user_id` (`address_user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_product_id` (`cart_product_id`),
  ADD KEY `cart_user_id` (`cart_user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_product_id` (`favorite_product_id`),
  ADD KEY `favorite_user_id` (`favorite_user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
