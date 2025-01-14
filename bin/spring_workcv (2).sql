-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 20, 2021 lúc 11:57 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `spring_workcv`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `applypost`
--

CREATE TABLE `applypost` (
  `id` int(11) NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `recruitment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `applypost`
--

INSERT INTO `applypost` (`id`, `created_at`, `recruitment_id`, `user_id`) VALUES
(1, NULL, 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number_choose` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `number_choose`) VALUES
(1, 'PHP', 2),
(2, 'JAVA', 1),
(3, 'ASP .NET', 0),
(4, 'NODEJS', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name_company` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `company`
--

INSERT INTO `company` (`id`, `address`, `description`, `email`, `logo`, `name_company`, `phone_number`, `status`, `user_id`) VALUES
(1, 'Đà Nẵng', '<p><strong>hello</strong></p>', 'tuyendungnhansu@gmail.com', '1637145840379fpt-601x400.png', 'FPT Software', '0394073712', 0, 2),
(3, 'Đà Nẵng', '<p><strong>hello</strong></p>', 'kmstech@gmail.com', '1637147685714getarticleimage.png', 'KMS Technology', '0394073712', 0, 5),
(4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6),
(5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 7),
(6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 8),
(7, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9),
(8, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10),
(9, NULL, NULL, NULL, NULL, NULL, NULL, 0, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cv`
--

CREATE TABLE `cv` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cv`
--

INSERT INTO `cv` (`id`, `file_name`, `user_id`) VALUES
(1, '1637135308228bt-3.pdf', 4),
(3, '1637307842723bt-3.pdf', 8),
(4, '1637308768465bt-3.pdf', 9),
(5, '1637309030813bt-3.pdf', 10),
(6, '1637309724722bt-3.pdf', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `follow_company`
--

CREATE TABLE `follow_company` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `recruitment`
--

CREATE TABLE `recruitment` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `view` int(11) DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `recruitment`
--

INSERT INTO `recruitment` (`id`, `address`, `created_at`, `description`, `experience`, `quantity`, `rank`, `salary`, `status`, `title`, `type`, `view`, `category_id`, `company_id`, `deadline`) VALUES
(1, 'Tam tiến Núi thành Quảng Nam', '2021-11-14', '<p>Làm việc ngày 8 tiếng tại văn phòng</p>', '3 năm kinh nghiệm', 15, NULL, '6.000.000 - 10.000.000 vnđ', 1, 'Tuyển Senior', 'Full time', 0, 1, 1, NULL),
(3, 'Tam tiến Núi thành Quảng Nam', '2021-11-16', '<p>Hiểu rõ về vòng đời</p>', '1 năm', 13, NULL, '6.000.000 - 10.000.000 vnđ', 1, 'Tuyển lập trình react js', 'Part time', 0, 1, 1, NULL),
(4, 'Tam tiến Núi thành Quảng Nam', '2021-11-17', '<p><strong>fsadfasdf</strong></p>', '4 năm kinh nghiệm', 12, NULL, '6.000.000 - 10.000.000 vnđ', 0, 'Tuyển Senior PHP', 'Full time', 0, 3, 1, '2021-11-20'),
(5, 'Hải Châu, Đà Nẵng', '2021-11-17', '<p><strong>Xin chào</strong></p>', '4 năm kinh nghiệm', 12, NULL, '6.000.000 - 10.000.000 vnđ', 1, 'Tuyển Java', 'Full time', 0, 4, 3, NULL),
(6, 'Đà Nẵng', '2021-11-17', '<p>.NET &gt; 2 năm kinh nghiệm</p>', '2 năm', 12, NULL, '12 triệu', 1, 'Tuyển lập trình viên .NET', 'Full time', 0, 2, 3, '2021-11-30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `role_name`) VALUES
(1, 'Candidate'),
(2, 'Company');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `save_job`
--

CREATE TABLE `save_job` (
  `id` int(11) NOT NULL,
  `recruitment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `save_job`
--

INSERT INTO `save_job` (`id`, `recruitment_id`, `user_id`) VALUES
(1, 4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `address`, `description`, `email`, `full_name`, `image`, `password`, `phone_number`, `status`, `role_id`) VALUES
(1, 'Tam tiến Núi thành Quảng Nam', '<p><strong>Minh nha</strong></p>', 'minhnha2308@gmail.com', 'Nguyên Minh Nhã', 'https://res.cloudinary.com/workcv/image/upload/v1637047317/wyveqapjisxapzudrhni.jpg', '25f9e794323b453885f5181f1b624d0b', '01223415449', 1, 1),
(2, 'Tam tiến Núi thành Quảng Nam', '<p>Helo anh em</p>', 'congty@gmail.com', 'Fpt Soft', 'https://res.cloudinary.com/workcv/image/upload/v1637083609/ince0ojpgsqfkuwrg9yy.jpg', '25f9e794323b453885f5181f1b624d0b', '01223415449', 1, 2),
(3, 'Tam tiến Núi thành Quảng Nam', '<p><strong>Hoàng</strong></p>', 'congty1@gmail.com', 'Nguyên Minh Nhã', NULL, '25f9e794323b453885f5181f1b624d0b', '01223415449', 1, 1),
(4, NULL, NULL, 'n2ftechnology@gmail.com', 'N2F Technology', NULL, '25f9e794323b453885f5181f1b624d0b', NULL, 1, 2),
(5, 'Tam tiến Núi thành Quảng Nam', '<p>Helo anh em</p>', 'kms@gmail.com', 'KMS', 'https://res.cloudinary.com/workcv/image/upload/v1637083609/ince0ojpgsqfkuwrg9yy.jpg', '25f9e794323b453885f5181f1b624d0b', '01223415449', 1, 2),
(6, NULL, NULL, 'suntech@gmail.com', 'Sun Tech', NULL, '25f9e794323b453885f5181f1b624d0b', NULL, 0, 2),
(7, NULL, NULL, 'nguyencaonguyenamv@gmail.com', 'Công ty', NULL, '25f9e794323b453885f5181f1b624d0b', NULL, 0, 2),
(8, NULL, NULL, 'dangphat@gmail.com', 'Đăng Phát', NULL, '25f9e794323b453885f5181f1b624d0b', NULL, 1, 1),
(9, NULL, NULL, 'hung29manh@gmail.com', 'Nguyen Manh Hung', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, 1),
(10, NULL, NULL, 'binki56789@gmail.com', 'Đỗ Văn Tiến', NULL, '202cb962ac59075b964b07152d234b70', NULL, 1, 1),
(11, NULL, NULL, 'quanghuy@gmail.com', 'Quang Huy', NULL, '25f9e794323b453885f5181f1b624d0b', NULL, 1, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `applypost`
--
ALTER TABLE `applypost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK23qxvxqx8q0ycwv1g3qxv3o7x` (`recruitment_id`),
  ADD KEY `FKohwwkdg1b9pxardq62w3mamow` (`user_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdy4v2yb46hefqicjpyj7b7e4s` (`user_id`);

--
-- Chỉ mục cho bảng `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKb98t5j2q1innj39yov3v9oga2` (`user_id`);

--
-- Chỉ mục cho bảng `follow_company`
--
ALTER TABLE `follow_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnd2vjc9iflx2g7kydn0b4xdxv` (`company_id`),
  ADD KEY `FK9a4lj6ypi86frac2419i39fvc` (`user_id`);

--
-- Chỉ mục cho bảng `recruitment`
--
ALTER TABLE `recruitment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtj8cu8x5ar1c5hmu0j3veteit` (`category_id`),
  ADD KEY `FKc8ro055m1iceebbktg9epdci9` (`company_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `save_job`
--
ALTER TABLE `save_job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7mhpldb69f4sjyn9ijta42tep` (`recruitment_id`),
  ADD KEY `FKpkwn87ixxhdfek8rbljowpbdp` (`user_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `applypost`
--
ALTER TABLE `applypost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `cv`
--
ALTER TABLE `cv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `follow_company`
--
ALTER TABLE `follow_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `recruitment`
--
ALTER TABLE `recruitment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `save_job`
--
ALTER TABLE `save_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
