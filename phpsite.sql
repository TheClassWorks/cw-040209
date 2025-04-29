-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2024 at 02:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpsite`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'برنامه نویسی'),
(2, 'شبکه'),
(3, 'اخبار فناوری'),
(4, 'متفرقه');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `comment`, `post_id`, `status`) VALUES
(6, 'عباس', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.', 1, 1),
(15, 'علی راهپیما', 'بسیار خوب و عالی', 3, 1),
(16, 'تست', 'منصوری تست', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `category_id`, `author`, `image`) VALUES
(1, 'آموزش الگوریتم و ساختمان داده به زبان ساده', 'دوره آموزش ساختمان داده و الگوریتم، یک دوره اساسی و بنیادی هست که برخلاف تصور، فقط مخصوص برنامه نویسان و حوزه تکنولوژی نیست.\r\n\r\nدر واقع مهارت حل مسئله یا همون الگوریتم در همه علوم و تخصص ها کاربرد داره از مدیریت گرفته تا صنعت و تکنولوژی مهارت کلیدی و تعیین کننده محسوب میشه.\r\n\r\nاما متاسفانه حتی توسط برنامه نویسان هم گاهی جدی گرفته نمیشه و باعث میشه با مشکلات زیادی در تحلیل و طراحی پروژه ها برخورد کنن.\r\n\r\nتا حالا به این فکر کردید چرا میلیاردها نفر در دنیا از موتور جستجوی گوگل استفاده میکنن درحالیکه موتور جستجوی ساخت مایکروسافت به اسم بینگ و سایر موارد، حتی به نزدیکی گوگل از لحاظ تعداد جستجو و کاربر نمیرسن؟ جوابش در همین الگوریتم هست. احتمالا با این مثال دیگه کاملا متوجه اهمیت این مبحث شدید.\r\n\r\nاین روزها در فضاهای مثل دیجیتال مارکتینگ کلماتی مثل الگوریتم های گوگل و در شبکه های اجتماعی، الگوریتم های اینستاگرام، می میبینید و می شنوید که نشون دهنده اهمیت و میزان کاربرد این مفهوم هست.\r\n\r\nمهارت اینکه بتونید تمام حالت های مختلف انجام یک کار رو از نقطه صفر تا پایان، پیش بینی و تحلیل کنید تا بهترین و دقیق ترین نتیجه حاصل بشه، کاملا حیاتی و ضروری هست.\r\n\r\nهرجا کاری انجام میشه که در ظاهر احساس میکنیم اتوماتیک هست، ردپای الگوریتم در اون وجود داره. حتی در لوازم خانگی مثل لباسشویی یا قطعات خودرو مثل ECU. چه برسه به نرم افزار که سروکارش با تحلیل و داده و بهینه سازی هست.', 1, 'ماهان زارع', '1.jpg'),
(2, 'آموزش پروژه محور فریمورک Fastify', 'دوره آموزشی فستیفای سبزلرن یک دوره کاملا تخصصی است که در آن علاوه‌بر آموزش مفاهیم مرتبط با Fastify، دانشجویان به‌صورت عملی با انجام پروژه می‌توانند توسعه برنامه‌ها با این فریم‌ورک را یاد بگیرند. با Fastify می‌توان برنامه‌های تحت وب پیچیده را در زمان کوتاه و با کدهای سطح بالاتری توسعه داد. این فریم‌ورک پلاگین‌های کاربردی زیادی هم دارد که در طول دوره نحوه کار با پلاگین‌های فستیفای نیز آموزش داده می‌شود. اگر در حوزه بک اند یا توسعه برنامه‌های تحت وب فعالیت دارید، شرکت در دوره آموزش Fastify سبزلرن به شما کمک می‌کند تا به یک برنامه‌نویس حرفه‌ای تبدیل شوید.\r\n\r\nچه مطالبی را می‌توان با شرکت در دوره Fastify سبزلرن یاد گرفت؟\r\nفستیفای در مقایسه با سایر فریم‌ورک‌های Node.js یک فریم‌ورک جدید است که به‌دلیل سرعت زیاد و امکان نوشتن کدهای سطح بالا شهرت زیادی پیدا کرده و طرفداران زیادی هم در بین کدنویسان دارد. در دوره آموزش Fastify سبزلرن برنامه‌نویسان یاد می‌گیرند که چطور با استفاده از پلاگین‌های کاربردی این فریم‌ورک یک برنامه را با سرعت بالا توسعه دهند و برنامه‌های تحت وب ایمن و قابل اعتماد بسازند.\r\n\r\nبرخلاف توسعه با Node.js خام که پیچیدگی‌هایی مانند عدم وجود routing و Middleware دارد، فستیفای امکانات و ویژگی‌های بسیاری را فراهم می‌کند که باعث ساده‌سازی توسعه این برنامه می‌شود. این دوره شامل آموزش ساختاردهی پروژه‌ها، پیاده‌سازی API های مختلف، اتصال به پایگاه داده‌ها، و بهینه‌سازی و تست برنامه‌ها است. برنامه‌نویسان در دوره آموزشی فستیفای کارکردن با امکانات کانسپت‌های مقدماتی و پیشرفته این فریم‌ورک را با مثال‌های کاربردی یاد می‌گیرند. همچنین در این دوره به‌عنوان پروژه عملی دانشجویان نحوه پیاده‌سازی پروژه فروشگاه اینترنتی، برنامه مدیریت وظایف (Todo App) و سیستم رزرو رستوران و کافه را در فریم‌ورک فستیفای یاد می‌گیرند.', 3, 'فاطمه موسوی', '2.jpg'),
(3, 'آموزش جامع PHP از صفر + پروژه محور', 'دوره آموزشی “متخصص PHP” یک برنامه جامع و کاربردیه که به‌طور ویژه برای افرادی طراحی شده که می‌خواهند مهارت‌های خودشون رو در زمینه برنامه‌نویسی وب با زبان PHP به سطح حرفه‌ای برسونن. PHP یکی از محبوب‌ترین زبان‌های برنامه‌نویسی در دنیای توسعه وب هست که به‌خاطر سادگی، انعطاف‌پذیری، و توانایی بالا در ایجاد وب‌سایت‌های پویا و کاربرپسند شناخته می‌شود. این دوره با هدف آموزش همه‌جانبه، از مبانی تا مباحث پیشرفته ساختاردهی شده، و شما را گام به گام با مفاهیم مختلف PHP آشنا می‌کند.\r\n\r\nدوره با آشنایی با مبانی PHP شروع می‌شود. شما اصول اولیه مانند سینتکس زبان، انواع داده‌ها، و ساختارهای کنترلی را یاد خواهید گرفت. همچنین، با نحوه تعریف و استفاده از متغیرها، توابع، و آرایه‌ها آشنا می‌شوید. این بخش‌ها به‌عنوان پایه‌ای برای درک عمیق‌تر مفاهیم پیشرفته‌تر عمل میکنند.\r\n\r\nیکی از بخش‌های مهم و جذاب این دوره، مدیریت داده‌ها و تعامل با پایگاه‌های داده است. شما یاد خواهید گرفت چگونه با استفاده از PHP و MySQL، داده‌ها را ذخیره، به‌روزرسانی، حذف و بازیابی کنید. همچنین نحوه استفاده از PDO (PHP Data Objects) برای کار با پایگاه‌های داده به شکل امن و کارآمد نیز به‌صورت مفصل آموزش داده می‌شود.\r\n\r\nپس از تسلط به مبانی و مفاهیم پیشرفته، شما وارد فاز ساخت وب‌سایت‌های پویا خواهید شد. یاد می‌گیرید چگونه صفحات وب با محتوای داینامیک ایجاد کنید که با کاربران تعامل داشته باشند. همچنین، نحوه مدیریت نشست‌ها (Sessions) و کوکی‌ها (Cookies) و پیاده‌سازی سیستم احراز هویت کاربران به‌صورت کامل بررسی می‌شود.', 2, 'مینا مجلی', '3.jpg'),
(4, 'مهارت های لازم برای طراحی سایت', 'طراحی سایت نیازمند مهارت‌های مختلفی است. مهارت های لازم برای طراحی سایت به کدنویسی محدود نمیشه و شما باید بتونید مسئله‌ها رو تعریف کنید، سئوی سایت را بهبود بدید و مهم‌تر از همه پروژه‌تون را مدیریت کنین. یکی از مهم‌ترین مهارت‌ها یادگیری تئوری‌های طراحی وب هست. منظور از تئوری طراحی وب تعریف اصول پایه‌ای اص برای ایجاد یک سایت بی‌نقصه.\r\n\r\nیعنی شما باید بتونید بهترین تجربه‌ی کاربری، بهترین تم رنگ، بهترین ساختار و معماری و… را انتخاب کنید. این انتخاب‌ها باید با بررسی جنبه‌های مختلف سایت انجام بشه. اگه شما در دانشگاه با این تئوری و جنبه‌های مختلفش آشنا نشدید، مهم نیست. می‌تونید با یکم مطالعه و بررسی و استفاده از تجربیات بقیه، این مهارت را تو خودتون پرورش بدین.\r\n\r\nسئو را هم که حتما راجبش می‌دونید و نیازی نیست که توضیحش بدیم. فقط اینو بدونین که سئو شاید توی لیست مهارت های لازم برای طراحی سایت نباشه، ولی خیلی خوبه که بلد باشید و از بیس اون را توی طراحی پیاده کنید. شما چه قرار باشه طراحی سایت را خودتون شخصا انجام بدین یا اینکه توی یه تیم کار کنید، در هر حال به مهارت‌های مدیریتی نیاز دارید. این مهارت ها هم جز مهم ترین مهارت های لازم برای طراحی سایت نیستند، ولی خیلی میتونن روی کیفیت کارتون اثر بزارن.\r\n\r\nخب بهتره مهارت های لازم برای طراحی سایت را به شکل دسته بندی شده بررسی کنیم. به طور کلی مهارت های مورد نیاز برای طراحی سایت به دو دسته تقسیم میشن.\r\n\r\nمهارت های شخصیتی یا تعاملی برای طراحی سایت\r\nمهارت‌های فنی و تکنیکی برای طراحی سایت\r\nقبل از اینکه بریم سراغ مهارت‌های تکنیکی، بهتره مهارت‌های شخصیتی و مدیریتی که را بررسی کنیم تا بفهمید این جنبه از مهارت های لازم برای طراح وب چقدر مهمن و نباید نادیده گرفته بشن.', 1, 'سونا کشاورزی', '4.jpg'),
(13, 'دوره آموزش توسعه افزونه مرورگر با جاوا اسکریپت', 'افزونه‌ها امکانات اضافی مانند فیلترشکن، مترجم و مواردی از این قبیل را به مرورگر اضافه می‎‌کنند تا کاربران تجربه بهتری در زمان استفاده از مرورگر داشته باشند. بنابراین توسعه افزونه‌های قابل نصب روی مرورگرها بازار بسیار خوبی دارد. افراد فعال در این حوزه با ابتکارات عمل و طراحی افزونه‌های کاربردی می‌توانند علاوه‌بر تامین نیاز کاربران، درآمد بالایی نیز از توسعه افزونه مرورگر با جاوا اسکریپت داشته باشند.\r\n\r\nاین دوره توسط اساتید حرفه‌ای سبزلرن و با استفاده از پروژه‌های کاملا کاربردی تدریس می‌شود تا شرکت‌کنندگان در این دوره به درک بهتری برسند. همچنین در طول دوره می‌توانید با نیازهای بازار و امکانات جاوا اسکریپت برای توسعه افزونه‌های مرورگر بیشتر آشنا شوید. اگر به زبان جاوا اسکریپت مسلط هستید و دنیای افزونه‌ها برای شما جذاب است، شرکت در دوره آموزش توسعه افزونه مرورگر با JavaScript می‌تواند درهای جدیدی از توسعه نرم افزار با این زبان برنامه‌نویسی را برای شما باز می‌کند.', 4, 'عباس کریمی', '5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `posts_slider`
--

CREATE TABLE `posts_slider` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts_slider`
--

INSERT INTO `posts_slider` (`id`, `post_id`, `active`) VALUES
(1, 1, 1),
(2, 4, 0),
(3, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `name`, `email`) VALUES
(1, 'سارا', 'sara@gmail.com'),
(2, 'نیما', 'nima@gmail.com'),
(3, 'علی', 'ali@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'abbas@gmail.com', '123456789'),
(2, 'mina@gmail.com', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `posts_slider`
--
ALTER TABLE `posts_slider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts_slider`
--
ALTER TABLE `posts_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts_slider`
--
ALTER TABLE `posts_slider`
  ADD CONSTRAINT `posts_slider_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
