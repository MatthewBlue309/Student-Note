CREATE DATABASE IF NOT EXISTS `notebook_management` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- Use existing database
USE `notebook_management`;

-- Create account table
CREATE TABLE `account` (
  `id` int PRIMARY KEY auto_increment NOT NULL,
  `firstname` varchar(128) NOT NULL,
  `lastname` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `activated` int DEFAULT 0
);

-- Create notebook table linked to account
CREATE TABLE `notebook` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `position` INT NOT NULL,
  `color` VARCHAR(20) DEFAULT 'rgb(119, 25, 170)',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `account`(`id`) ON DELETE CASCADE
);

-- Create section table linked to notebook
CREATE TABLE `section` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `position` INT NOT NULL,
  `color` VARCHAR(20) DEFAULT 'rgb(119, 25, 170)',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `pin` INT DEFAULT 0,
  `notebook_id` INT NOT NULL,
  FOREIGN KEY (`notebook_id`) REFERENCES `notebook`(`id`) ON DELETE CASCADE
);

-- Create page table linked to section
CREATE TABLE `page` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(255),
  `content` TEXT,
  `position` INT NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `last_updated` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `section_id` INT NOT NULL,
  FOREIGN KEY (`section_id`) REFERENCES `section`(`id`) ON DELETE CASCADE
);
