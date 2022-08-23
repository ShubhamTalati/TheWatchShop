-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2021 at 09:20 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 0),
(2, 'm', 'm', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'Men', 1),
(2, 'Women', 1),
(3, 'Kid', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(5, 'mihir patel', 'pmihir028080@gmail.com', '9999999999', 'hiii', '2021-03-28 04:16:09'),
(6, 'mihir patel', 'pmihir028080@gmail.com', '9999999999', 'hiii', '2021-03-28 04:16:16');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_master`
--

CREATE TABLE `coupon_master` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_type` varchar(10) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupon_master`
--

INSERT INTO `coupon_master` (`id`, `coupon_code`, `coupon_value`, `coupon_type`, `cart_min_value`, `status`) VALUES
(1, 'First50', 1000, 'Rupee', 1500, 1),
(2, 'First60', 20, 'Percentage', 1000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `mihpayid` varchar(20) DEFAULT NULL,
  `ship_order_id` int(11) NOT NULL,
  `ship_shipment_id` int(11) NOT NULL,
  `payu_status` varchar(10) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `txnid`, `mihpayid`, `ship_order_id`, `ship_shipment_id`, `payu_status`, `coupon_id`, `coupon_value`, `coupon_code`, `added_on`) VALUES
(20, 16, 'ahmedabad', 'ahmedabad', 382421, 'COD', 5194, 'pending', 1, '46f6cb19725d85483fdd', NULL, 0, 0, '', 0, 0, '', '2021-04-09 03:05:32'),
(21, 16, 'F102 Shaligram lakeview near vaishnodevi circle', 'ahmedabad', 382421, 'COD', 1099, 'pending', 1, 'bc69ba7eb031c612667e', NULL, 0, 0, '', 0, 0, '', '2021-04-09 03:06:02'),
(22, 19, 'at prajapati bhavan near odi show room ,S.G.Highway', 'ahmedabad', 382529, 'COD', 3463, 'pending', 1, '17b871a7346036b971c0', NULL, 0, 0, '', 0, 0, '', '2021-04-09 03:06:57'),
(23, 19, 'S.G.Highway', 'ahmedabad', 382529, 'COD', 475, 'pending', 1, '355fa54e30889936ac3e', NULL, 0, 0, '', 0, 0, '', '2021-04-09 03:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 1, 2, 1, 155800),
(2, 1, 1, 1, 8499),
(3, 2, 4, 1, 1200),
(6, 5, 28, 1, 1050),
(9, 0, 29, 1, 1000),
(11, 4, 30, 1, 300),
(12, 5, 27, 1, 3300),
(13, 6, 27, 1, 3300),
(14, 7, 27, 1, 3300),
(15, 8, 28, 1, 1050),
(16, 9, 26, 1, 1195),
(17, 10, 26, 1, 1195),
(18, 11, 100, 1, 1999),
(19, 12, 46, 1, 1610),
(20, 13, 154, 1, 499),
(21, 13, 45, 1, 2295),
(22, 14, 43, 1, 1450),
(23, 15, 101, 1, 3463),
(24, 16, 131, 1, 599),
(25, 17, 101, 1, 3463),
(26, 18, 83, 1, 699),
(27, 19, 105, 1, 1749),
(28, 20, 104, 1, 2999),
(29, 20, 35, 1, 2195),
(30, 21, 141, 1, 1099),
(31, 22, 101, 1, 3463),
(32, 23, 67, 1, 475);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `short_desc` varchar(2000) DEFAULT NULL,
  `description` text NOT NULL,
  `best_seller` int(11) DEFAULT NULL,
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_desc` varchar(2000) DEFAULT NULL,
  `meta_keyword` varchar(2000) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `added_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `image1`, `image2`, `short_desc`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `status`, `added_by`) VALUES
(4, 5, 2, 'SHEEN-SOLID TROUSER-OLIVE', 1999, 1200, 3, '697347005_2__1538219531_49.204.69.38_600x.jpg', '', '', 'per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 'Duis a felis congue, feugiat est non, suscipit quam. In elit lacus, auctor sed lacus eget, egestas consectetur leo. Duis pellentesque pharetra ante, ac ornare nibh faucibus id. Integer pulvinar malesuada nisl. Nulla vel orci nunc. Nullam a tellus eu ex ullamcorper mollis. Donec commodo ligula a accumsan fermentum. Mauris sed orci lacinia, posuere leo molestie, pretium mi. Cras sodales, neque id cursus fermentum, mi purus vehicula sem, vel laoreet lorem justo id tortor. Sed ut urna ut ipsum vestibulum commodo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 0, 'SHEEN-SOLID TROUSER-OLIVE', 'SHEEN-SOLID TROUSER-OLIVE', 'SHEEN-SOLID TROUSER-OLIVE', 1, NULL),
(35, 1, 4, 'Analog Blue Dial Men\'s Watch', 2250, 2195, 1, '141843142_product (1).jpg', '981590746_product 1.jpg', '203720364_product 2.jpg', NULL, 'FastTrack Economy 2013 Analog Blue Dial Men\'s Watch -NM3099SP05 / NL3099SP05', NULL, NULL, NULL, NULL, 1, 1),
(36, 1, 4, 'Analog Grey Dial Men\'s Watch', 1695, 1595, 1, '209583690_pro.5.jpg', '316844841_pro.4.jpg', '354755257_product.3.jpg', NULL, 'FastTrack Bold Analog Grey Dial Men\'s Watch NM38051SL03 / NL38051SL03', NULL, NULL, NULL, NULL, 1, 1),
(37, 1, 4, 'FastTrack reflex 2.0', 1995, 1195, 1, '808991144_pro.6.jpg', '458091257_pro.7.jpg', '822987052_pro.8.jpg', NULL, 'FastTrack reflex 2.0 Uni-sex activity tracker - Calorie counter, Call and message notifications and up to 10 Day battery Life - SWD90059PP06 / SWD90059PP06', NULL, NULL, NULL, NULL, 1, 1),
(38, 1, 4, 'Analog Blue Dial Men\'s Watch', 1795, 1750, 1, '933257900_pro.9.jpg', '375218436_pro.10.jpg', '708751385_pro.11.jpg', NULL, 'FastTrack Bold Analog Blue Dial Men\'s Watch NM38051SM05 / NL38051SM05', NULL, NULL, NULL, NULL, 1, 1),
(39, 1, 4, 'Analog White Dial Men\'s Watch', 995, 950, 1, '524815963_pro.12.jpg', '883843290_pro.13.jpg', '724372599_pro.14.jpg', NULL, 'FastTrack Casual Analog White Dial Men\'s Watch NM3116PP02 / NL3116PP02', NULL, NULL, NULL, NULL, 1, 1),
(40, 1, 4, 'FastTrack Unisex', 2195, 1645, 1, '685167415_pro.16.jpg', '801046255_pro.17.jpg', '362983935_pro.18.jpg', NULL, 'FastTrack Unisex Plastic reflex beat activity tracker - Heart rate monitor, Calorie counter, Call and message notifications and up to 5 Day battery Life - Purple - SWD90066PP02 / SWD90066PP02', NULL, NULL, NULL, NULL, 1, 1),
(41, 1, 4, 'Analog Black Dial Men\'s Watch', 1950, 1650, 1, '978976124_pro.19.jpg', '489770748_pro.20.jpg', '174737801_pro.21.jpg', NULL, 'FastTrack Casual Analog Black Dial Men\'s Watch -NM3120SL02 / NL3120SL02', NULL, NULL, NULL, NULL, 1, 1),
(42, 1, 4, 'Analog Green Dial Men\'s Watch', 2200, 1950, 1, '475106174_pro.22.jpg', '471867055_pro.23.jpg', '737730776_pro.24.jpg', NULL, 'FastTrack Space Analog Green Dial Men\'s Watch-3184SL04 / 3184SL04', NULL, NULL, NULL, NULL, 1, 1),
(43, 1, 4, 'Analog Silver Dial Men\'s Watch', 1700, 1450, 1, '952813436_pro.25.jpg', '677899973_pro.26.jpg', '638125994_pro.27.jpg', NULL, 'FastTrack Fundamentals Analog Silver Dial Men\'s Watch -NM38052SL03 / NL38052SL03', NULL, NULL, NULL, NULL, 1, 1),
(44, 1, 4, 'Analog Black Dial Men\'s Watch', 2250, 2095, 1, '120378300_pro.28.jpg', '332437100_pro.29.jpg', '834450841_pro.30.jpg', NULL, 'FastTrack Trendies Analog Black Dial Men\'s Watch-NM38045PP03 / NL38045PP03', NULL, NULL, NULL, NULL, 1, 1),
(45, 1, 4, 'FastTrack New OTS', 2350, 2295, 1, '915566002_pro.31.jpg', '223613873_pro.32.jpg', '590657185_pro.33.jpg', NULL, 'FastTrack New OTS NM9735NL02 / NL9735NL02', NULL, NULL, NULL, NULL, 1, 1),
(46, 1, 4, 'FastTrack Analog Multi', 1750, 1610, 1, '122429187_pro.34.jpg', '993231067_pro.35.jpg', '965866838_pro.36.jpg', NULL, 'FastTrack Analog Multi NM3015AL01 / NL3015AL01', NULL, NULL, NULL, NULL, 1, 1),
(49, 3, 9, 'Melanas Seven Friday Brown', 700, 500, 1, '949745800_pro.7.jpg', '222410107_pro.8.jpg', '338298747_pro.9.jpg', NULL, 'Melians Seven Friday Brown Watch Sporty Look Square Black Analogue Watch for Men\'s & Boys', NULL, NULL, NULL, NULL, 1, 1),
(50, 3, 9, 'Glowing Toy Watch for Kids Children', 699, 259, 1, '592813660_pro.10.jpg', '378844733_pro.11.jpg', '986949761_pro.12.jpg', NULL, 'Digital Kids LED Light Disco Glowing Toy Watch for Kids Children (Spiderman)', NULL, NULL, NULL, NULL, 1, 1),
(53, 3, 9, 'M4 Plus Bluetooth Wireless Smart Fitness Band', 1111, 699, 1, '362876545_pro.19.jpg', '373959847_pro.20.jpg', '937347543_pro.21.jpg', NULL, 'M4 Plus Bluetooth Wireless Smart Fitness Band for Boys/Men/Kids/Women | Sports Watch Compatible with Xiaomi,  Vivo Mobile | Heart Rate and BP Monitor, Calories Counter.', NULL, NULL, NULL, NULL, 1, 1),
(54, 3, 9, 'Avenger infinity war Transforming Robot Hulk Watch For Kid\'s', 640, 440, 1, '171474534_pro.22.jpg', '973199455_pro.23.jpg', '926692566_pro.24.jpg', NULL, 'I & Sony  Avenger infinity war Transforming Robot Hulk Convert to Digital Watch Robot Transformation Wristwatch Toys for Kids (Orange)', NULL, NULL, NULL, NULL, 1, 1),
(56, 3, 9, 'Analog Watch Form Men & Boys', 999, 599, 1, '163186252_pro.28.jpg', '707512376_pro.29.jpg', '897019653_pro.30.jpg', NULL, 'Stylish Designer Multicolor Analog Watch Form Men & Boys', NULL, NULL, NULL, NULL, 1, 1),
(59, 3, 9, 'Formal Black Watch', 999, 499, 1, '887408254_pro.37.jpg', '215347601_pro.38.jpg', '330291614_pro.39.jpg', NULL, 'Formal Black Watch for Boys and Men\'s', NULL, NULL, NULL, NULL, 1, 1),
(60, 3, 18, 'Grey Dial Men\'s Watch', 699, 399, 1, '460525660_1.jpg', '213608535_2.jpg', '432340804_3.jpg', NULL, 'Sonata Digital Grey Dial Men\'s Watch -NM7982PP04 / NL7982PP04', NULL, NULL, NULL, NULL, 1, 1),
(61, 3, 18, 'Analog Blue Dial Girls Watch', 599, 399, 1, '344718303_4.jpg', '689240762_5.jpg', '259562980_6.jpg', NULL, 'Sonata Analog Blue Dial Girls Watch NM87024PP04 / NL87024PP04', NULL, NULL, NULL, NULL, 1, 1),
(62, 3, 18, 'Digital Grey Dial Men\'s Watch', 899, 699, 1, '670211133_7.jpg', '854614132_8.jpg', '908130001_9.jpg', NULL, 'Sonata Fiber (SF) Digital Grey Dial Men\'s Watch NM77072PP05 / NL77072PP05', NULL, NULL, NULL, NULL, 1, 1),
(63, 3, 18, 'Analog Black Small Dial Men\'s Watch', 999, 749, 1, '128588306_10.jpg', '855182841_11.jpg', '937171003_81+ajcm7FqL._UL1500_.jpg', NULL, 'Sonata Super Fiber Analog Black Small Dial Men\'s Watch NL7930PP01 / NL7930PP01', NULL, NULL, NULL, NULL, 1, 1),
(64, 3, 18, 'Digital Grey Small Dial Men\'s Watch', 1100, 899, 1, '317751095_91BLSv-kFsL._UL1500_.jpg', '215072834_81-lyTvr9pL._UL1500_.jpg', '721646409_81fTUPce4qL._UL1500_.jpg', NULL, 'Sonata Super Fiber Digital Grey Small Dial Men\'s Watch NL77043PP02 / NL77043PP02', NULL, NULL, NULL, NULL, 1, 1),
(65, 3, 18, 'Analog Turquoise Dial Women\'s Watch', 675, 475, 1, '371499036_81p9DilPJdL._UL1500_.jpg', '731242909_81HL4yZ5qJL._UL1500_.jpg', '995873063_61SSOqoa1QL._UL1279_.jpg', NULL, 'Sonata Fashion Fiber Analog Turquoise Dial Women\'s Watch NM8992PP01 / NL8992PP01', NULL, NULL, NULL, NULL, 1, 1),
(66, 3, 18, 'Digital Multi Color Dial Men\'s Watch', 699, 399, 1, '589092358_91UX0zACXcL._UL1500_.jpg', '222584652_71UDjYrz1FL._UL1500_.jpg', '413900998_81dxePw6AGL._UL1500_.jpg', NULL, 'Sonata Digital Multi Color Dial Men\'s Watch NM77006PP01 / NL77006PP01', NULL, NULL, NULL, NULL, 1, 1),
(67, 3, 18, 'Digital Grey Dial Men\'s Watch', 875, 475, 1, '536408711_81nRE1M3VRL._UL1500_.jpg', '755319735_71V2KKiKDtL._UL1500_.jpg', '713662122_71NtqzQhPQL._UL1500_.jpg', NULL, 'Sonata Super Fiber Digital Grey Dial Men\'s Watch -NM87011PP04A / NL87011PP04A', NULL, NULL, NULL, NULL, 1, 1),
(68, 3, 18, 'Analog Black Dial Women\'s Watch', 675, 538, 1, '509455305_81nZdHD2lEL._UL1500_.jpg', '922734232_81JmnlhCm9L._UL1500_.jpg', '749467516_61UM-07mrkL._UL1500_ (1).jpg', NULL, 'Sonata Fashion Fiber Analog Black Dial Women\'s Watch NM8992PP02 / NL8992PP02', NULL, NULL, NULL, NULL, 1, 1),
(70, 3, 18, 'Grey Dial Men\'s Watch', 949, 549, 1, '290386452_71zeP70WP5L._UL1500_ (1).jpg', '707178545_81kZMu+jFqL._UL1500_.jpg', '922363114_710mItMMTyL._UL1500_.jpg', NULL, 'Sonata Grey Dial Men\'s Watch -NM77008PP03W / NL77008PP03W', NULL, NULL, NULL, NULL, 1, 1),
(71, 3, 18, 'Analog Black Dial Boy\'s Watch', 1599, 999, 1, '358547465_81fLKxgo60L._UL1500_.jpg', '131126064_81tRP-rmuxL._UL1500_.jpg', '466830379_71fyBqTpM7L._UL1500_.jpg', NULL, 'Sonata Analog Black Dial Boy\'s Watch NM7058NM01 / NL7058NL01', NULL, NULL, NULL, NULL, 1, 1),
(72, 3, 18, 'Analog Green Dial Men\'s Watch', 699, 499, 1, '225257404_81k59PvRqKL._UL1500_.jpg', '948801504_81k64mcXuoL._UL1500_.jpg', '198563953_71tvNPD+W+L._UL1500_.jpg', NULL, 'Sonata Analog Green Dial Men\'s Watch -NM77007PP01W / NL77007PP01W', NULL, NULL, NULL, NULL, 1, 1),
(74, 3, 19, 'Love Watch Series Analogue Girl\'s & Boy\'s Watch', 899, 399, 1, '907700015_61apcoJb-RL._UL1500_.jpg', '446687065_61F58FxMhVL._UL1500_.jpg', '232809497_61HdLYQXhjL._UL1500_.jpg', NULL, 'SWADESI STUFF Love Watch Series Analogue Girl\'s & Boy\'s Watch ( Purple Dial Purple Colored Strap )', NULL, NULL, NULL, NULL, 1, 1),
(75, 3, 19, 'Multi Function Day and Date Alarm Kids Digital Sports Watch', 1499, 999, 1, '350834523_61EoLNf0yRL._UL1500_.jpg', '582541353_61Yj1GtoTnL._UL1500_.jpg', '385587898_71dOJ0MdxIL._UL1500_.jpg', NULL, 'Swadeshi Stuff Multi Function Day and Date Alarm Kids Digital Sports Watch for Boys & Girls', NULL, NULL, NULL, NULL, 1, 1),
(76, 3, 19, 'Analogue Multicolour Dial Girl\'s Watch', 999, 499, 1, '493308395_41c9wkgA0IL.jpg', '307170827_41ScyZ55EzL.jpg', '820378617_41x16YxBwwL.jpg', NULL, 'SWADESI STUFF Analogue Multicolor Dial Girl\'s Watch', NULL, NULL, NULL, NULL, 1, 1),
(77, 3, 19, 'Analogue Multicolor Dial Boy\'s & Girl\'s Watch', 699, 399, 1, '284066294_71wymLbDBFL._UL1500_.jpg', '818096605_61699NiIqoL._UL1500_.jpg', '401791021_61YTWJC8AWL._UL1500_.jpg', NULL, 'SWADESI STUFF Analogue Multicolor Dial Boy\'s & Girl\'s Watch', NULL, NULL, NULL, NULL, 1, 1),
(78, 3, 19, 'Analog Unisex-Child Watch', 799, 399, 1, '143591003_41XWkiNMCSL.jpg', '962273993_41U0qAlatGL.jpg', '238504452_41XfTMgUvFL.jpg', NULL, 'SWADESI STUFF Analog Unisex-Child Watch (Green Dial, Green Colored Strap)', NULL, NULL, NULL, NULL, 1, 1),
(79, 3, 19, 'Digital Boy\'s Watch', 999, 699, 1, '219264480_71OR2eWK4CL._UL1344_.jpg', '977058048_61-RWndcR-L._UL1315_.jpg', '278432455_6181evxQrbL._UL1159_.jpg', NULL, 'SWADESI STUFF Digital Boy\'s Watch (Black Dial, Multicolored Strap)', NULL, NULL, NULL, NULL, 1, 1),
(80, 0, 0, 'Analog Girl\'s Watch', 999, 499, 1, '817477586_81OkZ8BTkvL._UL1500_.jpg', '786825200_81qSCHVIEyL._UL1500_.jpg', '124594376_81+lqX88aiL._UL1500_.jpg', NULL, 'SWADESI STUFF Analog Girl\'s Watch (White Dial, Multicolored Strap)', NULL, NULL, NULL, NULL, 1, 1),
(81, 3, 19, 'Black Dial Digital Sport Kids Watch', 899, 399, 1, '120820662_51a+Xz7OZJL.jpg', '835909497_611PSaEUjfL._UL1205_.jpg', '929249947_71txedZoBcL._UL1500_.jpg', NULL, 'Swadesi Stuff Black Dial Digital Sport Kids Watch for Men & Boys', NULL, NULL, NULL, NULL, 1, 1),
(82, 3, 19, 'Analogue Silver Dial Girl\'s Watch', 799, 299, 1, '464081449_81A85AuIDaL._UL1500_.jpg', '176191647_81TPN3xbS-L._UL1500_.jpg', '614782758_81zfRXQHFXL._UL1500_.jpg', NULL, 'SWADESI STUFF Analogue Silver Dial Girl\'s Watch', NULL, NULL, NULL, NULL, 1, 1),
(83, 3, 19, 'Analogue Girl\'s Watch', 1099, 699, 1, '330548168_51q2tpNi8JL.jpg', '496263575_51A5Z4t2YsL.jpg', '287335639_71MvThr28zL._UL1500_.jpg', NULL, 'SWADESI STUFF Analogue Girl\'s Watch (Off-white Dial Multi Colored Strap)', NULL, NULL, NULL, NULL, 1, 1),
(84, 3, 19, 'Analog Boy\'s Watch', 899, 299, 1, '833524290_617Q2yfhBCL._UL1500_.jpg', '930800455_61Mz8hRLJnL._UL1102_.jpg', '332592433_81I+o+cO+HL._UL1500_.jpg', NULL, 'SWADESI STUFF Analog Boy\'s Watch (Black Dial, Black Colored Strap)', NULL, NULL, NULL, NULL, 1, 1),
(85, 3, 19, 'Analogue IGP Gold Dial', 1499, 999, 1, '965214516_91ajr+QN0PL._UL1500_.jpg', '506413338_81FkZKt9ICL._UL1500_.jpg', '990093849_81zF+cFG08L._UL1500_.jpg', NULL, 'Swadesi Stuff Analogue IGP Gold Dial Day & Date Display Analogue Watch for Men and Boys (Long Life Gold Plated)', NULL, NULL, NULL, NULL, 1, 1),
(86, 3, 19, 'Analogue Girl\'s & Women\'s Watch', 899, 499, 1, '897949404_81CBkyGRSYL._UL1500_.jpg', '205844265_81UjYN3-SQL._UL1500_.jpg', '778336152_813jr2kP1GL._UL1500_.jpg', NULL, 'Swadesi Stuff Casual Analogue Girl\'s & Women\'s Watch (Silver Case Multi Colored Leather Strap)', NULL, NULL, NULL, NULL, 1, 1),
(87, 3, 21, 'White Dial Children\'s Watch', 675, 475, 1, '262433122_71g019zxEaL._UL1500_.jpg', '551659895_71vIDNVeCIL._UL1500_.jpg', '211055793_71JInjVSSZL._UL1500_.jpg', NULL, 'Maxima Analog White Dial Children\'s Watch - 04421PPKW', NULL, NULL, NULL, NULL, 1, 1),
(89, 3, 21, 'Analog Watch for Girl\'s', 1795, 1670, 1, '248379550_414WD-Gjw+L.jpg', '434932459_313WfhlXqSL.jpg', '185722625_41vYIzW74QL.jpg', NULL, 'Maxima Analog Watch for Girl\'s-61775CMGB', NULL, NULL, NULL, NULL, 1, 1),
(90, 3, 21, 'Analog Watch for Girl\'s', 795, 725, 1, '591213872_61PICXDzwML._UL1250_.jpg', '381030018_61oXSYcaffL._UL1250_.jpg', '744888688_71xbEJfBfCL._UL1250_.jpg', NULL, 'Maxima Analog Watch for Girl\'s- 60631LMLR', NULL, NULL, NULL, NULL, 1, 1),
(91, 3, 21, 'Analog Watch for Men boys', 899, 699, 1, '345498539_51LJr0ACfYL._UL1250_.jpg', '162547320_614mvD8Jp7L._UL1250_.jpg', '550009543_61OmVI2qdyL._UL1250_.jpg', NULL, 'Maxima Analog Watch for Men boys-58276PPGW', NULL, NULL, NULL, NULL, 1, 1),
(92, 3, 21, 'Analog Watch for Girls', 749, 699, 1, '368503569_41RMQw9vV0L.jpg', '711933202_41vayQhIkiL.jpg', '762635477_41Tdt2aDzLL.jpg', NULL, 'Maxima Analog Watch for Girls & Women-55130CMLI', NULL, NULL, NULL, NULL, 1, 1),
(93, 3, 21, 'Analog Watch for Boys', 1495, 1449, 1, '279646194_61eVLuWis3L._UL1250_.jpg', '435277436_61j4WKIIkRL._UL1250_.jpg', '732136144_61qyeqn3oUL._UL1250_.jpg', NULL, 'Maxima Analog Watch for Boys-61150PPAN', NULL, NULL, NULL, NULL, 1, 1),
(94, 3, 22, 'Digital Grey Natural DIAL Children\'s Watch', 595, 518, 1, '652740138_81o59JkjU2L._UL1500_.jpg', '471715909_81KlrNvbt9L._UL1500_.jpg', '158225315_819fTKlGc0L._UL1500_.jpg', NULL, 'KOOL KIDZ Digital Grey Natural DIAL Children\'s Watch - KK 222 RED', NULL, NULL, NULL, NULL, 1, 1),
(95, 3, 22, 'Blue Analog Kids Watch', 350, 225, 1, '989181039_71Ohb7JtXTL._UL1500_.jpg', '824523163_81oP1Co0j3L._UL1500_.jpg', '709305271_81-Nw1X3UKL._UL1500_.jpg', NULL, 'KOOL KIDZ Blue Analog Kids Watch Fiber Collection', NULL, NULL, NULL, NULL, 1, 1),
(96, 3, 22, 'Analogue RED Unisex Children\'s Watch', 599, 399, 1, '471952812_71OBve0OT7L._UL1500_.jpg', '737688370_710xNRgFIML._UL1500_.jpg', '246450755_61N6F++t8UL._UL1500_.jpg', NULL, 'KOOL KIDZ Analogue RED Unisex Children\'s Watch - KK 212 RED', NULL, NULL, NULL, NULL, 1, 1),
(97, 3, 22, 'Analogue Black Unisex Children\'s Watch', 525, 365, 1, '409185342_71HZTONZtiL._UL1500_.jpg', '936809952_71hxRwyV8aL._UL1500_.jpg', '203530921_71yznzInBDL._UL1500_.jpg', NULL, 'KOOL KIDZ Analogue Black Unisex Children\'s Watch - DMK 032 Black', NULL, NULL, NULL, NULL, 1, 1),
(98, 3, 22, 'Digital Watch for Kids', 550, 450, 1, '589676839_81tfojyK70L._UL1500_.jpg', '590725640_71YTp+DsxxL._UL1500_.jpg', '597655205_81QcQb2pYgL._UL1500_.jpg', NULL, 'KOOL KIDZ Boys Digital Watch for Kids KK 227 YL', NULL, NULL, NULL, NULL, 1, 1),
(100, 1, 5, 'Full Touch Control Smart Watch', 3999, 1999, 1, '300869055_6113mS+xhyL._SL1500_.jpg', '259471008_71Yu9BimdML._SL1500_.jpg', '406558264_71a81l4gTcL._SL1500_.jpg', NULL, 'Realme Noise Colorfit Pro 2 Full Touch Control Smart Watch (Jet Black)', NULL, NULL, NULL, NULL, 1, 1),
(101, 1, 5, 'Realme Fashion Watch', 4999, 3463, 1, '427590682_71A3Hg7hm4L._SL1500_.jpg', '867868810_71rPVueepmL._SL1500_.jpg', '283948391_61hKEu-APvL._SL1500_.jpg', NULL, 'Realme Fashion Watch 1.4\" Large HD Color Display, Full Touch Screen, SpO2, Continuous Heart Rate Monitor, Black, Free Size (RMA161)', NULL, NULL, NULL, NULL, 1, 1),
(102, 1, 5, 'realme Watch S Pro', 5999, 4999, 1, '718324015_61-SQrGpBWL._SL1500_.jpg', '464421127_61qHWWy5N2L._SL1500_.jpg', '601934584_61WsslrmtTL._SL1500_.jpg', NULL, 'realme Watch S Pro 1.4\" Large AMOLED Touchscreen, SpO2, Continuous Heart Rate Monitor (Black)', NULL, NULL, NULL, NULL, 1, 1),
(103, 0, 0, 'realme Band (Black)', 2999, 1999, 1, '312588902_61-+zVZL4LL._SL1500_.jpg', '790969600_71JYKJvdQOL._SL1500_.jpg', '637899617_61dYKzZT7-L._SL1500_.jpg', NULL, 'realme Band (Black) - Full Color Screen with Touch key, Real-time Heart Rate Monitor, in-Built USB Charging, IP68 Water Resistant', NULL, NULL, NULL, NULL, 1, 1),
(104, 1, 5, 'realme Watch S with', 3999, 2999, 1, '629493268_51KsSgYGOKL._SL1348_.jpg', '454866862_81Iuxf8yAaL._SL1500_.jpg', '853927620_71kkZXKl6sL._SL1500_.jpg', NULL, 'realme Watch S with 1.3\" TFT-LCD Touchscreen, 15 Days Battery Life, SpO2 & Heart Rate Monitoring, IP68 Water Resistance', NULL, NULL, NULL, NULL, 1, 1),
(105, 1, 5, 'realme Band (Black)', 2999, 1749, 1, '453298731_61-+zVZL4LL._SL1500_.jpg', '812648855_71JYKJvdQOL._SL1500_.jpg', '674577403_61dYKzZT7-L._SL1500_.jpg', NULL, 'realme Band (Black) - Full Color Screen with Touchkey, Real-time Heart Rate Monitor, in-Built USB Charging, IP68 Water Resistant', NULL, NULL, NULL, NULL, 1, 1),
(106, 1, 5, 'realme watch S Master Edition', 3575, 2750, 1, '399744973_rma207-android-ios-realme-original-imagymg4pepvbfbz.jpg', '504964486_rma207-android-ios-realme-original-imagymg4madxcbau.jpg', '889891346_rma207-android-ios-realme-original-imagymg4ekgedcfs.jpg', NULL, 'realme watch S Master Edition  (Black Strap, Regular)', NULL, NULL, NULL, NULL, 1, 1),
(107, 1, 13, 'Stride Pro Hybrid Smart Watch Black Dial for Men', 2495, 1775, 1, '897671778_718qm7CQ+OL._UL1500_.jpg', '191051026_814EXc7O0YL._UL1500_.jpg', '945129876_71sJxkxEOrL._UL1500_.jpg', NULL, 'Sonata Stride Pro Hybrid Smart Watch Black Dial for Men -7132PL04', NULL, NULL, NULL, NULL, 1, 1),
(108, 1, 13, 'Analog Black Dial Men\'s Watch', 1625, 1611, 1, '352170318_71VxqRzW+pL._UL1500_.jpg', '279828346_71Enk3K9idL._UL1500_.jpg', '207577519_61fqQRhtp7L._UL1500_.jpg', NULL, 'Sonata Analog Black Dial Men\'s Watch NM7924NM01 / NL7924NL01', NULL, NULL, NULL, NULL, 1, 1),
(109, 1, 13, 'Analog Black Small Dial Men\'s Watch', 799, 499, 1, '742494139_812U98rRWyL._UL1500_.jpg', '531594490_81+ajcm7FqL._UL1500_.jpg', '618456272_61AyeJHvwHL._UL1200_.jpg', NULL, 'Sonata Super Fiber Analog Black Small Dial Men\'s Watch NL7930PP01 / NL7930PP01', NULL, NULL, NULL, NULL, 1, 1),
(110, 1, 13, 'Analog Black Dial Men\'s Watch', 599, 399, 1, '992619823_81QJR0OtjrL._UL1500_.jpg', '180346082_71pj9J++H7L._UL1500_.jpg', '823906320_816Vvv1XonL._UL1500_.jpg', NULL, 'Sonata Analog Black Dial Men\'s Watch NL7930PP02 / NL7930PP02', NULL, NULL, NULL, NULL, 1, 1),
(111, 1, 13, 'Analog Gold Dial Men\'s Watch', 1599, 1549, 1, '154144001_719b2sPahmL._UL1500_.jpg', '201809737_71-NzXh28XL._UL1500_.jpg', '441687803_81CMOc1makL._UL1500_.jpg', NULL, 'Sonata Analog Gold Dial Men\'s Watch -NM7007YM05 / NL7007YM05', NULL, NULL, NULL, NULL, 1, 1),
(112, 1, 13, 'Analog Multicolor Small Dial Men\'s Watch', 625, 499, 1, '574135056_610fTIqLzmL._UL1500_.jpg', '880245154_619POl3IjDL._UL1500_.jpg', '373322037_617ycu7hV4L._UL1360_.jpg', NULL, 'Sonata Analog Multicolor Small Dial Men\'s Watch -NM7987SL01W / NL7987SL01W', NULL, NULL, NULL, NULL, 1, 1),
(113, 1, 14, 'Analog-Digital LED Display Waterproof Watch for Men\'s', 2499, 1499, 1, '630755557_81FqoULL-nL._UL1500_.jpg', '448906860_71QJE2KGWtS._UL1500_.jpg', '702185554_81pStTBLLQL._UL1500_.jpg', NULL, 'Redux 1805 Khaki Dual Time Analog-Digital LED Display Waterproof Watch for Men\'s', NULL, NULL, NULL, NULL, 1, 1),
(114, 1, 14, 'Analog Blue Linear Designer Dial Men’s & Boy\'s Watch', 999, 699, 1, '822695895_81BDpSIwu3L._UL1500_.jpg', '309510033_81GfEceiPSL._UL1500_.jpg', '799121632_715C6Ga9z7L._UL1500_.jpg', NULL, 'Redux RWS0216S Analog Blue Linear Designer Dial Men’s & Boy\'s Watch', NULL, NULL, NULL, NULL, 1, 1),
(115, 1, 14, 'Analogue Black Dial Watch for Men', 1999, 799, 1, '176224990_81iah0keHJL._UL1500_.jpg', '353914942_61Fi3cUq7+L._UL1100_.jpg', '151811738_81qbtJ9p+VL._UL1500_.jpg', NULL, 'Redux RWS0273S IPG Analogue Black Dial Watch for Men', NULL, NULL, NULL, NULL, 1, 1),
(116, 1, 14, 'Analog Blue Linear Designer Dial Men’s & Boy\'s Watch', 1499, 999, 1, '964472778_81O07DYSmVL._UL1500_.jpg', '364787097_91gbsGEqZiL._UL1500_.jpg', '167138040_81ldUJy-GVL._UL1500_.jpg', NULL, 'Redux RWS0216S Analog Blue Linear Designer Dial Men’s & Boy\'s Watch', NULL, NULL, NULL, NULL, 1, 1),
(117, 1, 14, 'Silver Dial Men\'s & Boy\'s Watch', 1599, 1199, 1, '428281244_81Rss8c6pJL._UL1500_.jpg', '133986467_81CUBH+Dt5L._UL1500_.jpg', '131626858_81qRmyDry1L._UL1500_.jpg', NULL, 'Redux Analogue Silver Dial Men\'s & Boy\'s Watch RWS0364S', NULL, NULL, NULL, NULL, 1, 1),
(118, 1, 14, 'Analogue Brown Dial Men\'s & Boy\'s Watch', 999, 699, 1, '615113042_713ObEe69hL._UL1500_ (1).jpg', '185886958_715R6U6kr7L._UL1500_.jpg', '272782050_713ObEe69hL._UL1500_.jpg', NULL, 'Redux RWS0223S Analogue Brown Dial Men\'s & Boy\'s Watch', NULL, NULL, NULL, NULL, 1, 1),
(119, 1, 17, 'Grey Dial Unisex\'s Watch', 2999, 1999, 1, '890846162_71NnuvhOwML._UL1500_.jpg', '759753164_71mO79KUUvL._UL1080_.jpg', '381383235_71sJFUOhPJL._UL1500_.jpg', NULL, 'Timex T80 X Pac-Man Digital Grey Dial Unisex\'s Watch-TW2U31900', NULL, NULL, NULL, NULL, 1, 1),
(120, 1, 17, 'White Dial Men\'s Watch', 3999, 2999, 1, '799603069_81RO0oPdR1L._UL1500_.jpg', '158942244_71EPJ-ifncL._UL1500_ (1).jpg', '363975033_81pfuijPXsL._UL1500_.jpg', NULL, 'Timex Intelligent Quartz Compass Chronograph Off-White Dial Men\'s Watch - T2N721', NULL, NULL, NULL, NULL, 1, 1),
(121, 1, 17, 'Analog Blue Dial Men\'s Watch', 999, 899, 1, '827284574_614RcBFoilL._UL1000_.jpg', '951665428_51nNqYEgWIL._UL1000_.jpg', '921881833_619Khq5-FCL._UL1000_.jpg', NULL, 'Timex Analog Blue Dial Men\'s Watch - TW000T310', NULL, NULL, NULL, NULL, 1, 1),
(122, 1, 17, 'Analog Black Men Watch', 1595, 999, 1, '315094408_71r96-d5EXL._UL1500_.jpg', '688854972_617jk9ycIlL._UL1500_.jpg', '903207556_71gWFyu9PdL._UL1500_.jpg', NULL, 'TIMEX Analog Black Men Watch TW00ZR263E', NULL, NULL, NULL, NULL, 1, 1),
(123, 1, 17, 'Analog Silver Dial Men\'s Watch', 1495, 1044, 1, '796290860_61LwOxjZ9rL._UL1100_.jpg', '717986939_71ePFXks7JL._UL1500_.jpg', '749353649_81glNdzhuNL._UL1500_.jpg', NULL, 'Timex Classics Analog Silver Dial Men\'s Watch - TI000R41400', NULL, NULL, NULL, NULL, 1, 1),
(126, 2, 6, 'Analog Green Dial Women\'s Watch', 899, 299, 1, '591590846_719qSEP3kcL._UL1500_.jpg', '328756039_61PtS10ZucL._UL1500_.jpg', '665776425_61aGIqVaynL._UL1360_.jpg', NULL, 'FastTrack Analog Green Dial Women\'s Watch NM6078SM01 / NL6078SM01', NULL, NULL, NULL, NULL, 1, 1),
(127, 2, 6, 'Analog Black Dial Women\'s Watch', 999, 599, 1, '994127600_71fexUzOcrL._UL1500_.jpg', '231362268_61fVV9JmXUL._UL1500_.jpg', '927401862_61rlc1lwGXL._UL1500_.jpg', NULL, 'FastTrack Analog Black Dial Women\'s Watch NM6117SM01 / NL6117SM01', NULL, NULL, NULL, NULL, 1, 1),
(128, 2, 6, 'Analog Black Dial Women\'s Watch', 799, 499, 1, '114573117_71uxqu-fT6L._UL1500_.jpg', '492354588_61sVPjp1x0L._UL1500_.jpg', '312701248_61cU7HalWjL._UL1440_.jpg', NULL, 'FastTrack Economy Analog Black Dial Women\'s Watch NM6015SM02 / NL6015SM02', NULL, NULL, NULL, NULL, 1, 1),
(129, 2, 6, 'Analog White Dial Women\'s Watch', 1199, 699, 1, '429411258_71crjcEFYSL._UL1500_.jpg', '482186035_61lolYgXgVL._UL1500_.jpg', '120719484_71vfirifNAL._UL1500_.jpg', NULL, 'FastTrack Hip Hop Analog White Dial Women\'s Watch NM9827PP01 / NL9827PP01', NULL, NULL, NULL, NULL, 1, 1),
(130, 2, 6, 'Analog Black Dial Women\'s Watch', 599, 499, 1, '989539555_71Wwn8do+rL._UL1500_.jpg', '771270059_51esMnwrDDL._UL1500_.jpg', '777496056_61nco4FZbwL._UL1500_.jpg', NULL, 'FastTrack Core Analog Black Dial Women\'s Watch NM2298SL04 / NL2298SL04', NULL, NULL, NULL, NULL, 1, 1),
(131, 2, 7, 'Gold DIAL Look Analog - for Girls & Womens', 999, 599, 1, '707216645_61YJYqkdp1L._UL1001_.jpg', '566744042_51II685CxBL._UL1056_.jpg', '571268658_41xWP6eHTGL.jpg', NULL, 'SELLORIA Gold DIAL Look Analog - for Girls & Women\'s', NULL, NULL, NULL, NULL, 1, 1),
(132, 2, 7, 'Silver Dial Silver Metal Belt Analog Watch - for Girls & Women', 899, 699, 1, '296359618_51WbZZB9hTL.jpg', '191242063_41kqYIfll-L.jpg', '907610425_41X+K-oKx5L.jpg', NULL, 'SELLORIA Casual Silver Dial Silver Metal Belt Analog Watch - for Girls & Women', NULL, NULL, NULL, NULL, 1, 1),
(133, 2, 7, 'Analog White Dial Red Flower Printed Women\'s and Girl\'s Watch', 999, 699, 1, '407532998_41QMLBW58tL.jpg', '316573849_41sDeM-oodL.jpg', '727605752_411SYksXluL.jpg', NULL, 'Selloria Analog White Dial Red Flower Printed Women\'s and Girl\'s Watch', NULL, NULL, NULL, NULL, 1, 1),
(134, 0, 0, 'Analog Girl\'s Watch', 799, 399, 1, '868254575_61MYWLV8PHL._UL1500_.jpg', '478931490_616g1anxgRL._UL1500_.jpg', '548080518_61Fv00VLE7L._UL1500_.jpg', NULL, 'SELLORIA Analog Girl\'s Watch (Black Dial)', NULL, NULL, NULL, NULL, 1, 1),
(135, 2, 7, 'Analogue Black Dial Girl\'s Watch', 999, 599, 1, '721962168_41qLi+IHELL.jpg', '898453403_41KIu3gnDcL.jpg', '626903875_51DI4BxkAqL.jpg', NULL, 'SELLORIA Analogue Black Dial Girl\'s Watch (Black Dial Black Colored Strap)', NULL, NULL, NULL, NULL, 1, 1),
(136, 2, 7, 'Analog DIAL Black Chain Belt Bracelet Watch for Women', 999, 599, 1, '591921514_51+vS5QCGrL.jpg', '671637704_41zEf4Rq-LL.jpg', '203865150_41ApmAP56ML.jpg', NULL, 'SELLORIA Gift Analog DIAL Black Chain Belt Bracelet Watch for Women & Girls Analog Watch - for Girls', NULL, NULL, NULL, NULL, 1, 1),
(137, 2, 7, 'Analog Girl\'s Watch', 899, 499, 1, '454976956_61MYWLV8PHL._UL1500_.jpg', '134131484_61Fv00VLE7L._UL1500_.jpg', '812694748_616g1anxgRL._UL1500_.jpg', NULL, 'SELLORIA Analog Girl\'s Watch (Black Dial)', NULL, NULL, NULL, NULL, 1, 1),
(138, 2, 8, 'Analogue Women\'s Watch', 999, 699, 1, '925316441_51iafUyxGUL._UL1056_.jpg', '153125454_51BIIu4WuHL.jpg', '733711433_51OYImesAnL._UL1056_.jpg', NULL, 'Acnos Analogue Women\'s Watch (Multicolored Dial Multi Colored Strap)', NULL, NULL, NULL, NULL, 1, 1),
(139, 2, 8, 'Analogue Women\'s Watch', 1999, 899, 1, '612828516_81PZBKpAx-L._UL1500_.jpg', '331294899_71e5C9uOuoL._UL1500_.jpg', '140135308_71Tv1P7aUmL._UL1500_.jpg', NULL, 'Acnos Analogue Women\'s Watch (Multicolored Dial Multi Colored Strap)', NULL, NULL, NULL, NULL, 1, 1),
(140, 2, 8, 'Analogue Women\'s Watch', 1599, 999, 1, '738855667_71cxCG9afXL._UL1500_.jpg', '494868705_612PCYr56oL._UL1500_.jpg', '879054417_71JNPXtxZ2L._UL1500_.jpg', NULL, 'Acnos Analogue Women\'s Watch (Multicolored Dial Multi Colored Strap)', NULL, NULL, NULL, NULL, 1, 1),
(141, 2, 8, 'Analogue Watch for Women Pack of - 2', 1699, 1099, 1, '527862093_610d0j05J9L._UL1129_.jpg', '451649442_61DBd-j4oPL._UL1191_.jpg', '390687646_51waydGxGYL.jpg', NULL, 'Acnos Black Round Diamond Dial with Latest Generation Black & Purple Magnet Belt Analogue Watch for Women Pack of - 2 (DM-BLACK-PURPLE02)', NULL, NULL, NULL, NULL, 1, 1),
(142, 2, 8, 'Analog Women\'s&Black Dial Black Rose-Gold Colored Strap Analogue Girl\'s Watches', 899, 699, 1, '133831496_71KhQMPpN4L._UL1500_.jpg', '117772725_61kt6XZ5QML._UL1500_.jpg', '333596546_71BM9Xnnl8L._UL1500_.jpg', NULL, 'Acnos White Dial White Rose-Gold Colored Strap Analog Women\'s&Black Dial Black Rose-Gold Colored Strap Analogue Girl\'s Watches Single and Also Available in Combo', NULL, NULL, NULL, NULL, 1, 1),
(143, 2, 8, 'Black Magnet Watch', 999, 799, 1, '839596563_81bAviYbt5L._UL1500_.jpg', '560404508_81Pp-RF622L._UL1500_.jpg', '680891974_61+hgSS7FlL._UL1181_.jpg', NULL, 'Acnos Branded Black Magnet Watch  Women', NULL, NULL, NULL, NULL, 1, 1),
(144, 2, 10, 'Analog White Dial Women\'s Watch', 999, 699, 1, '587177733_71EerpSykRL._UL1500_.jpg', '245075627_61vulmCaw2L._UL1500_.jpg', '151968998_81uhccr2doL._UL1500_.jpg', NULL, 'Sonata Analog White Dial Women\'s Watch NM8976YL02W / NL8976YL02W', NULL, NULL, NULL, NULL, 1, 1),
(145, 2, 10, 'Analog Pink Dial Women\'s Watch', 799, 399, 1, '488892851_71uF0ujXtDL._UL1500_.jpg', '735300498_611JCea3sfL._UL1419_.jpg', '253766290_71LpsItm17L._UL1500_.jpg', NULL, 'Sonata Analog Pink Dial Women\'s Watch NM8976SL03W / NL8976SL03W', NULL, NULL, NULL, NULL, 1, 1),
(146, 2, 10, 'Analog Blue Dial Women\'s Watch', 1099, 799, 1, '562563998_71Qszk0NYsL._UL1500_.jpg', '382336612_61FziMfjHUL._UL1382_.jpg', '157671904_81bMbmZjfcL._UL1500_.jpg', NULL, 'Sonata Analog Blue Dial Women\'s Watch NM8989PP04 / NL8989PP04', NULL, NULL, NULL, NULL, 1, 1),
(147, 2, 10, 'Analog Champagne Dial Women\'s Watch', 1299, 999, 1, '229254737_71VgVYn+GmL._UL1500_.jpg', '483629043_71XVQ5-zvoL._UL1500_.jpg', '965901222_71A9kemgikL._UL1500_.jpg', NULL, 'Sonata Pankh Analog Champagne Dial Women\'s Watch NM8085YM05 / NL8085YM05', NULL, NULL, NULL, NULL, 1, 1),
(148, 2, 10, 'Analog Black Dial Women\'s Watch', 799, 499, 1, '724343059_81nZdHD2lEL._UL1500_.jpg', '162084659_81JmnlhCm9L._UL1500_.jpg', '864477311_61UM-07mrkL._UL1500_.jpg', NULL, 'Sonata Fashion Fibre Analog Black Dial Women\'s Watch NM8992PP02 / NL8992PP02', NULL, NULL, NULL, NULL, 1, 1),
(149, 2, 10, 'Analog Turquoise Dial Women\'s Watch', 999, 899, 1, '456226724_81p9DilPJdL._UL1500_.jpg', '208397791_81HL4yZ5qJL._UL1500_.jpg', '898033380_61SSOqoa1QL._UL1279_.jpg', NULL, 'Sonata Fashion Fibre Analog Turquoise Dial Women\'s Watch NM8992PP01 / NL8992PP01', NULL, NULL, NULL, NULL, 1, 1),
(150, 2, 12, 'Analog Girl\'s Watch', 599, 299, 1, '800799223_61cla0uFo4L._UL1056_.jpg', '902353771_61cLSfkYxFL._UL1500_.jpg', '957408883_61MToQ7IhQL._UL1100_.jpg', NULL, 'casera Analog Girl\'s Watch (Black Dial, Rose Gold Colored Strap)', NULL, NULL, NULL, NULL, 1, 1),
(151, 2, 12, 'Analog Diamond Magnetic Strap Watch', 999, 599, 1, '233110779_71PM1wFNKTL._UL1444_.jpg', '242891187_81CFyKpHFZL._UL1500_.jpg', '959470951_81LqM9zSnPL._UL1500_.jpg', NULL, 'Casera Analog Diamond Magnetic Strap Watch and Free Bracelet for Girls and Women Watch', NULL, NULL, NULL, NULL, 1, 1),
(152, 2, 12, 'Analogue Multicolour Dial Women\'s Watch', 1200, 899, 1, '232211279_61OyY6GL+JL._UL1155_.jpg', '922731018_61NU7RWa14L._UL1198_.jpg', '730788049_61e1Rr+WiiL._UL1122_.jpg', NULL, 'Casera Analogue Multicolour Dial Women\'s Watch Pack of 3', NULL, NULL, NULL, NULL, 1, 1),
(153, 2, 12, 'Women Wrist Watch', 599, 299, 1, '403629496_71Uxdi9zF5L._UL1500_.jpg', '638218976_71hOIy8FubL._UL1500_.jpg', '276318641_81gezLjGCnL._UL1500_.jpg', NULL, 'Casera Women Wrist Watch', NULL, NULL, NULL, NULL, 1, 1),
(154, 2, 6, 'Analog Luxury Bangle Gold Color Combo of 2 Watches for Girls', 899, 499, 1, '200222336_61bq4PEJboL._UL1117_.jpg', '457747502_71tyfQGZfjL._UL1500_.jpg', '671922161_6192dZ-rWmL._UL1125_.jpg', NULL, 'Casera Analog Luxury Bangle Gold Color Combo of 2 Watches for Girls', NULL, NULL, NULL, NULL, 1, 1),
(155, 2, 12, 'Analog Girl\'s Watch', 899, 499, 1, '655671457_41Mh9asjmKL.jpg', '894760538_71x2Bj7DOPL._UL1500_.jpg', '389919042_61GjM3a9h7L._UL1080_.jpg', NULL, 'casera Analog Girl\'s Watch (Multicolored Dial, Pink Colored Strap)', NULL, NULL, NULL, NULL, 1, 1),
(156, 2, 12, 'Analog Luxury Bangle Gold Color Combo of 2 Watches for Girls', 999, 899, 1, '404757109_61bq4PEJboL._UL1117_.jpg', '180378538_71tyfQGZfjL._UL1500_.jpg', '676891999_6192dZ-rWmL._UL1125_.jpg', NULL, 'Casera Analog Luxury Bangle Gold Color Combo of 2 Watches for Girls', NULL, NULL, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shiprocket_token`
--

CREATE TABLE `shiprocket_token` (
  `id` int(11) NOT NULL,
  `token` varchar(500) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(4, 1, 'Fastrack', 1),
(5, 1, 'realme', 1),
(6, 2, 'Fastrack', 1),
(7, 2, 'SELLORIA', 1),
(8, 2, 'Acnos', 1),
(9, 3, 'Generic', 1),
(10, 2, 'Sonata', 1),
(12, 2, 'casera', 1),
(13, 1, 'Sonata', 1),
(14, 1, 'REDUX', 1),
(17, 1, 'TIMEX', 1),
(18, 3, 'Sonata', 1),
(19, 3, 'SWADESI STUFF', 1),
(21, 3, 'Maxima', 1),
(22, 3, 'kool kidz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `added_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `address`, `city`, `pincode`, `added_on`) VALUES
(16, 'm patel', 'ok', 'patelmihir028080@gmail.com', '9999999999', 'F102 Shaligram lakeview near vaishnodevi circle', 'ahmedabad', 382421, '2021-03-28 07:50:12'),
(19, 'hardik', 'hardik1512', 'prajapati.hardik0101@gmail.com', '8140590227', 'at prajapati bhavan near odi show room ,S.G.Highway', 'ahmedabad', 382529, '2021-04-08 02:44:24');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `added_on`) VALUES
(16, 1, 4, '2020-05-13 08:54:24'),
(17, 1, 6, '2020-05-15 12:53:28'),
(24, 4, 31, '2021-03-27 06:22:23'),
(25, 4, 30, '2021-03-27 06:22:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_master`
--
ALTER TABLE `coupon_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `coupon_master`
--
ALTER TABLE `coupon_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
