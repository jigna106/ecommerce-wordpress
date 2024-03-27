-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 06:11 AM
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
-- Database: `wordpress`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2024-02-07 12:59:43', '2024-02-07 12:59:43', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://192.168.1.5/wordpress', 'yes'),
(2, 'home', 'http://192.168.1.5/wordpress', 'yes'),
(3, 'blogname', 'ecommerce', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'jraval106001@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '2', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:153:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:10:\"product/?$\";s:27:\"index.php?post_type=product\";s:40:\"product/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:35:\"product/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:27:\"product/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:12:\"shoporder/?$\";s:29:\"index.php?post_type=shoporder\";s:42:\"shoporder/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?post_type=shoporder&feed=$matches[1]\";s:37:\"shoporder/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?post_type=shoporder&feed=$matches[1]\";s:29:\"shoporder/page/([0-9]{1,})/?$\";s:47:\"index.php?post_type=shoporder&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:48:\"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:43:\"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:46:\"brand/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?brand=$matches[1]&feed=$matches[2]\";s:41:\"brand/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?brand=$matches[1]&feed=$matches[2]\";s:22:\"brand/([^/]+)/embed/?$\";s:38:\"index.php?brand=$matches[1]&embed=true\";s:34:\"brand/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?brand=$matches[1]&paged=$matches[2]\";s:16:\"brand/([^/]+)/?$\";s:27:\"index.php?brand=$matches[1]\";s:52:\"product_cat/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:47:\"product_cat/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:28:\"product_cat/([^/]+)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:40:\"product_cat/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:22:\"product_cat/([^/]+)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:46:\"color/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?color=$matches[1]&feed=$matches[2]\";s:41:\"color/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?color=$matches[1]&feed=$matches[2]\";s:22:\"color/([^/]+)/embed/?$\";s:38:\"index.php?color=$matches[1]&embed=true\";s:34:\"color/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?color=$matches[1]&paged=$matches[2]\";s:16:\"color/([^/]+)/?$\";s:27:\"index.php?color=$matches[1]\";s:37:\"shoporder/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"shoporder/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"shoporder/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"shoporder/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"shoporder/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"shoporder/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"shoporder/([^/]+)/embed/?$\";s:42:\"index.php?shoporder=$matches[1]&embed=true\";s:30:\"shoporder/([^/]+)/trackback/?$\";s:36:\"index.php?shoporder=$matches[1]&tb=1\";s:50:\"shoporder/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?shoporder=$matches[1]&feed=$matches[2]\";s:45:\"shoporder/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?shoporder=$matches[1]&feed=$matches[2]\";s:38:\"shoporder/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?shoporder=$matches[1]&paged=$matches[2]\";s:45:\"shoporder/([^/]+)/comment-page-([0-9]{1,})/?$\";s:49:\"index.php?shoporder=$matches[1]&cpage=$matches[2]\";s:34:\"shoporder/([^/]+)(?:/([0-9]+))?/?$\";s:48:\"index.php?shoporder=$matches[1]&page=$matches[2]\";s:26:\"shoporder/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:36:\"shoporder/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:56:\"shoporder/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"shoporder/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"shoporder/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:32:\"shoporder/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=74&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:43:\"user-authentication/user-authentication.php\";i:1;s:15:\"wpide/wpide.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:63:\"C:\\xampp\\htdocs\\wordpress/wp-content/themes/ecommerce/style.css\";i:1;s:67:\"C:\\xampp\\htdocs\\wordpress/wp-content/themes/ecommerce/functions.php\";i:3;s:64:\"C:\\xampp\\htdocs\\wordpress/wp-content/plugins/akismet/akismet.php\";i:4;s:70:\"C:\\xampp\\htdocs\\wordpress/wp-content/themes/twentytwentyfour/style.css\";i:5;s:80:\"C:\\xampp\\htdocs\\wordpress/wp-content/themes/twentytwentyfour/templates/home.html\";}', 'no'),
(40, 'template', 'ecommerce', 'yes'),
(41, 'stylesheet', 'ecommerce', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '56657', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '74', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1722862783', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'wp_attachment_pages_enabled', '0', 'yes'),
(100, 'initial_db_version', '56657', 'yes'),
(101, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(102, 'fresh_site', '0', 'yes'),
(103, 'user_count', '4', 'no'),
(104, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:9:\"sidebar-1\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(106, 'cron', 'a:9:{i:1711033184;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1711069184;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1711069206;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1711112384;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1711112406;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1711112408;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1711610504;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1711630784;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(107, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(120, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(121, '_transient_wp_core_block_css_files', 'a:2:{s:7:\"version\";s:5:\"6.4.3\";s:5:\"files\";a:500:{i:0;s:23:\"archives/editor-rtl.css\";i:1;s:27:\"archives/editor-rtl.min.css\";i:2;s:19:\"archives/editor.css\";i:3;s:23:\"archives/editor.min.css\";i:4;s:22:\"archives/style-rtl.css\";i:5;s:26:\"archives/style-rtl.min.css\";i:6;s:18:\"archives/style.css\";i:7;s:22:\"archives/style.min.css\";i:8;s:20:\"audio/editor-rtl.css\";i:9;s:24:\"audio/editor-rtl.min.css\";i:10;s:16:\"audio/editor.css\";i:11;s:20:\"audio/editor.min.css\";i:12;s:19:\"audio/style-rtl.css\";i:13;s:23:\"audio/style-rtl.min.css\";i:14;s:15:\"audio/style.css\";i:15;s:19:\"audio/style.min.css\";i:16;s:19:\"audio/theme-rtl.css\";i:17;s:23:\"audio/theme-rtl.min.css\";i:18;s:15:\"audio/theme.css\";i:19;s:19:\"audio/theme.min.css\";i:20;s:21:\"avatar/editor-rtl.css\";i:21;s:25:\"avatar/editor-rtl.min.css\";i:22;s:17:\"avatar/editor.css\";i:23;s:21:\"avatar/editor.min.css\";i:24;s:20:\"avatar/style-rtl.css\";i:25;s:24:\"avatar/style-rtl.min.css\";i:26;s:16:\"avatar/style.css\";i:27;s:20:\"avatar/style.min.css\";i:28;s:20:\"block/editor-rtl.css\";i:29;s:24:\"block/editor-rtl.min.css\";i:30;s:16:\"block/editor.css\";i:31;s:20:\"block/editor.min.css\";i:32;s:21:\"button/editor-rtl.css\";i:33;s:25:\"button/editor-rtl.min.css\";i:34;s:17:\"button/editor.css\";i:35;s:21:\"button/editor.min.css\";i:36;s:20:\"button/style-rtl.css\";i:37;s:24:\"button/style-rtl.min.css\";i:38;s:16:\"button/style.css\";i:39;s:20:\"button/style.min.css\";i:40;s:22:\"buttons/editor-rtl.css\";i:41;s:26:\"buttons/editor-rtl.min.css\";i:42;s:18:\"buttons/editor.css\";i:43;s:22:\"buttons/editor.min.css\";i:44;s:21:\"buttons/style-rtl.css\";i:45;s:25:\"buttons/style-rtl.min.css\";i:46;s:17:\"buttons/style.css\";i:47;s:21:\"buttons/style.min.css\";i:48;s:22:\"calendar/style-rtl.css\";i:49;s:26:\"calendar/style-rtl.min.css\";i:50;s:18:\"calendar/style.css\";i:51;s:22:\"calendar/style.min.css\";i:52;s:25:\"categories/editor-rtl.css\";i:53;s:29:\"categories/editor-rtl.min.css\";i:54;s:21:\"categories/editor.css\";i:55;s:25:\"categories/editor.min.css\";i:56;s:24:\"categories/style-rtl.css\";i:57;s:28:\"categories/style-rtl.min.css\";i:58;s:20:\"categories/style.css\";i:59;s:24:\"categories/style.min.css\";i:60;s:19:\"code/editor-rtl.css\";i:61;s:23:\"code/editor-rtl.min.css\";i:62;s:15:\"code/editor.css\";i:63;s:19:\"code/editor.min.css\";i:64;s:18:\"code/style-rtl.css\";i:65;s:22:\"code/style-rtl.min.css\";i:66;s:14:\"code/style.css\";i:67;s:18:\"code/style.min.css\";i:68;s:18:\"code/theme-rtl.css\";i:69;s:22:\"code/theme-rtl.min.css\";i:70;s:14:\"code/theme.css\";i:71;s:18:\"code/theme.min.css\";i:72;s:22:\"columns/editor-rtl.css\";i:73;s:26:\"columns/editor-rtl.min.css\";i:74;s:18:\"columns/editor.css\";i:75;s:22:\"columns/editor.min.css\";i:76;s:21:\"columns/style-rtl.css\";i:77;s:25:\"columns/style-rtl.min.css\";i:78;s:17:\"columns/style.css\";i:79;s:21:\"columns/style.min.css\";i:80;s:29:\"comment-content/style-rtl.css\";i:81;s:33:\"comment-content/style-rtl.min.css\";i:82;s:25:\"comment-content/style.css\";i:83;s:29:\"comment-content/style.min.css\";i:84;s:30:\"comment-template/style-rtl.css\";i:85;s:34:\"comment-template/style-rtl.min.css\";i:86;s:26:\"comment-template/style.css\";i:87;s:30:\"comment-template/style.min.css\";i:88;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:89;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:90;s:38:\"comments-pagination-numbers/editor.css\";i:91;s:42:\"comments-pagination-numbers/editor.min.css\";i:92;s:34:\"comments-pagination/editor-rtl.css\";i:93;s:38:\"comments-pagination/editor-rtl.min.css\";i:94;s:30:\"comments-pagination/editor.css\";i:95;s:34:\"comments-pagination/editor.min.css\";i:96;s:33:\"comments-pagination/style-rtl.css\";i:97;s:37:\"comments-pagination/style-rtl.min.css\";i:98;s:29:\"comments-pagination/style.css\";i:99;s:33:\"comments-pagination/style.min.css\";i:100;s:29:\"comments-title/editor-rtl.css\";i:101;s:33:\"comments-title/editor-rtl.min.css\";i:102;s:25:\"comments-title/editor.css\";i:103;s:29:\"comments-title/editor.min.css\";i:104;s:23:\"comments/editor-rtl.css\";i:105;s:27:\"comments/editor-rtl.min.css\";i:106;s:19:\"comments/editor.css\";i:107;s:23:\"comments/editor.min.css\";i:108;s:22:\"comments/style-rtl.css\";i:109;s:26:\"comments/style-rtl.min.css\";i:110;s:18:\"comments/style.css\";i:111;s:22:\"comments/style.min.css\";i:112;s:20:\"cover/editor-rtl.css\";i:113;s:24:\"cover/editor-rtl.min.css\";i:114;s:16:\"cover/editor.css\";i:115;s:20:\"cover/editor.min.css\";i:116;s:19:\"cover/style-rtl.css\";i:117;s:23:\"cover/style-rtl.min.css\";i:118;s:15:\"cover/style.css\";i:119;s:19:\"cover/style.min.css\";i:120;s:22:\"details/editor-rtl.css\";i:121;s:26:\"details/editor-rtl.min.css\";i:122;s:18:\"details/editor.css\";i:123;s:22:\"details/editor.min.css\";i:124;s:21:\"details/style-rtl.css\";i:125;s:25:\"details/style-rtl.min.css\";i:126;s:17:\"details/style.css\";i:127;s:21:\"details/style.min.css\";i:128;s:20:\"embed/editor-rtl.css\";i:129;s:24:\"embed/editor-rtl.min.css\";i:130;s:16:\"embed/editor.css\";i:131;s:20:\"embed/editor.min.css\";i:132;s:19:\"embed/style-rtl.css\";i:133;s:23:\"embed/style-rtl.min.css\";i:134;s:15:\"embed/style.css\";i:135;s:19:\"embed/style.min.css\";i:136;s:19:\"embed/theme-rtl.css\";i:137;s:23:\"embed/theme-rtl.min.css\";i:138;s:15:\"embed/theme.css\";i:139;s:19:\"embed/theme.min.css\";i:140;s:19:\"file/editor-rtl.css\";i:141;s:23:\"file/editor-rtl.min.css\";i:142;s:15:\"file/editor.css\";i:143;s:19:\"file/editor.min.css\";i:144;s:18:\"file/style-rtl.css\";i:145;s:22:\"file/style-rtl.min.css\";i:146;s:14:\"file/style.css\";i:147;s:18:\"file/style.min.css\";i:148;s:23:\"footnotes/style-rtl.css\";i:149;s:27:\"footnotes/style-rtl.min.css\";i:150;s:19:\"footnotes/style.css\";i:151;s:23:\"footnotes/style.min.css\";i:152;s:23:\"freeform/editor-rtl.css\";i:153;s:27:\"freeform/editor-rtl.min.css\";i:154;s:19:\"freeform/editor.css\";i:155;s:23:\"freeform/editor.min.css\";i:156;s:22:\"gallery/editor-rtl.css\";i:157;s:26:\"gallery/editor-rtl.min.css\";i:158;s:18:\"gallery/editor.css\";i:159;s:22:\"gallery/editor.min.css\";i:160;s:21:\"gallery/style-rtl.css\";i:161;s:25:\"gallery/style-rtl.min.css\";i:162;s:17:\"gallery/style.css\";i:163;s:21:\"gallery/style.min.css\";i:164;s:21:\"gallery/theme-rtl.css\";i:165;s:25:\"gallery/theme-rtl.min.css\";i:166;s:17:\"gallery/theme.css\";i:167;s:21:\"gallery/theme.min.css\";i:168;s:20:\"group/editor-rtl.css\";i:169;s:24:\"group/editor-rtl.min.css\";i:170;s:16:\"group/editor.css\";i:171;s:20:\"group/editor.min.css\";i:172;s:19:\"group/style-rtl.css\";i:173;s:23:\"group/style-rtl.min.css\";i:174;s:15:\"group/style.css\";i:175;s:19:\"group/style.min.css\";i:176;s:19:\"group/theme-rtl.css\";i:177;s:23:\"group/theme-rtl.min.css\";i:178;s:15:\"group/theme.css\";i:179;s:19:\"group/theme.min.css\";i:180;s:21:\"heading/style-rtl.css\";i:181;s:25:\"heading/style-rtl.min.css\";i:182;s:17:\"heading/style.css\";i:183;s:21:\"heading/style.min.css\";i:184;s:19:\"html/editor-rtl.css\";i:185;s:23:\"html/editor-rtl.min.css\";i:186;s:15:\"html/editor.css\";i:187;s:19:\"html/editor.min.css\";i:188;s:20:\"image/editor-rtl.css\";i:189;s:24:\"image/editor-rtl.min.css\";i:190;s:16:\"image/editor.css\";i:191;s:20:\"image/editor.min.css\";i:192;s:19:\"image/style-rtl.css\";i:193;s:23:\"image/style-rtl.min.css\";i:194;s:15:\"image/style.css\";i:195;s:19:\"image/style.min.css\";i:196;s:19:\"image/theme-rtl.css\";i:197;s:23:\"image/theme-rtl.min.css\";i:198;s:15:\"image/theme.css\";i:199;s:19:\"image/theme.min.css\";i:200;s:29:\"latest-comments/style-rtl.css\";i:201;s:33:\"latest-comments/style-rtl.min.css\";i:202;s:25:\"latest-comments/style.css\";i:203;s:29:\"latest-comments/style.min.css\";i:204;s:27:\"latest-posts/editor-rtl.css\";i:205;s:31:\"latest-posts/editor-rtl.min.css\";i:206;s:23:\"latest-posts/editor.css\";i:207;s:27:\"latest-posts/editor.min.css\";i:208;s:26:\"latest-posts/style-rtl.css\";i:209;s:30:\"latest-posts/style-rtl.min.css\";i:210;s:22:\"latest-posts/style.css\";i:211;s:26:\"latest-posts/style.min.css\";i:212;s:18:\"list/style-rtl.css\";i:213;s:22:\"list/style-rtl.min.css\";i:214;s:14:\"list/style.css\";i:215;s:18:\"list/style.min.css\";i:216;s:25:\"media-text/editor-rtl.css\";i:217;s:29:\"media-text/editor-rtl.min.css\";i:218;s:21:\"media-text/editor.css\";i:219;s:25:\"media-text/editor.min.css\";i:220;s:24:\"media-text/style-rtl.css\";i:221;s:28:\"media-text/style-rtl.min.css\";i:222;s:20:\"media-text/style.css\";i:223;s:24:\"media-text/style.min.css\";i:224;s:19:\"more/editor-rtl.css\";i:225;s:23:\"more/editor-rtl.min.css\";i:226;s:15:\"more/editor.css\";i:227;s:19:\"more/editor.min.css\";i:228;s:30:\"navigation-link/editor-rtl.css\";i:229;s:34:\"navigation-link/editor-rtl.min.css\";i:230;s:26:\"navigation-link/editor.css\";i:231;s:30:\"navigation-link/editor.min.css\";i:232;s:29:\"navigation-link/style-rtl.css\";i:233;s:33:\"navigation-link/style-rtl.min.css\";i:234;s:25:\"navigation-link/style.css\";i:235;s:29:\"navigation-link/style.min.css\";i:236;s:33:\"navigation-submenu/editor-rtl.css\";i:237;s:37:\"navigation-submenu/editor-rtl.min.css\";i:238;s:29:\"navigation-submenu/editor.css\";i:239;s:33:\"navigation-submenu/editor.min.css\";i:240;s:25:\"navigation/editor-rtl.css\";i:241;s:29:\"navigation/editor-rtl.min.css\";i:242;s:21:\"navigation/editor.css\";i:243;s:25:\"navigation/editor.min.css\";i:244;s:24:\"navigation/style-rtl.css\";i:245;s:28:\"navigation/style-rtl.min.css\";i:246;s:20:\"navigation/style.css\";i:247;s:24:\"navigation/style.min.css\";i:248;s:23:\"nextpage/editor-rtl.css\";i:249;s:27:\"nextpage/editor-rtl.min.css\";i:250;s:19:\"nextpage/editor.css\";i:251;s:23:\"nextpage/editor.min.css\";i:252;s:24:\"page-list/editor-rtl.css\";i:253;s:28:\"page-list/editor-rtl.min.css\";i:254;s:20:\"page-list/editor.css\";i:255;s:24:\"page-list/editor.min.css\";i:256;s:23:\"page-list/style-rtl.css\";i:257;s:27:\"page-list/style-rtl.min.css\";i:258;s:19:\"page-list/style.css\";i:259;s:23:\"page-list/style.min.css\";i:260;s:24:\"paragraph/editor-rtl.css\";i:261;s:28:\"paragraph/editor-rtl.min.css\";i:262;s:20:\"paragraph/editor.css\";i:263;s:24:\"paragraph/editor.min.css\";i:264;s:23:\"paragraph/style-rtl.css\";i:265;s:27:\"paragraph/style-rtl.min.css\";i:266;s:19:\"paragraph/style.css\";i:267;s:23:\"paragraph/style.min.css\";i:268;s:25:\"post-author/style-rtl.css\";i:269;s:29:\"post-author/style-rtl.min.css\";i:270;s:21:\"post-author/style.css\";i:271;s:25:\"post-author/style.min.css\";i:272;s:33:\"post-comments-form/editor-rtl.css\";i:273;s:37:\"post-comments-form/editor-rtl.min.css\";i:274;s:29:\"post-comments-form/editor.css\";i:275;s:33:\"post-comments-form/editor.min.css\";i:276;s:32:\"post-comments-form/style-rtl.css\";i:277;s:36:\"post-comments-form/style-rtl.min.css\";i:278;s:28:\"post-comments-form/style.css\";i:279;s:32:\"post-comments-form/style.min.css\";i:280;s:23:\"post-date/style-rtl.css\";i:281;s:27:\"post-date/style-rtl.min.css\";i:282;s:19:\"post-date/style.css\";i:283;s:23:\"post-date/style.min.css\";i:284;s:27:\"post-excerpt/editor-rtl.css\";i:285;s:31:\"post-excerpt/editor-rtl.min.css\";i:286;s:23:\"post-excerpt/editor.css\";i:287;s:27:\"post-excerpt/editor.min.css\";i:288;s:26:\"post-excerpt/style-rtl.css\";i:289;s:30:\"post-excerpt/style-rtl.min.css\";i:290;s:22:\"post-excerpt/style.css\";i:291;s:26:\"post-excerpt/style.min.css\";i:292;s:34:\"post-featured-image/editor-rtl.css\";i:293;s:38:\"post-featured-image/editor-rtl.min.css\";i:294;s:30:\"post-featured-image/editor.css\";i:295;s:34:\"post-featured-image/editor.min.css\";i:296;s:33:\"post-featured-image/style-rtl.css\";i:297;s:37:\"post-featured-image/style-rtl.min.css\";i:298;s:29:\"post-featured-image/style.css\";i:299;s:33:\"post-featured-image/style.min.css\";i:300;s:34:\"post-navigation-link/style-rtl.css\";i:301;s:38:\"post-navigation-link/style-rtl.min.css\";i:302;s:30:\"post-navigation-link/style.css\";i:303;s:34:\"post-navigation-link/style.min.css\";i:304;s:28:\"post-template/editor-rtl.css\";i:305;s:32:\"post-template/editor-rtl.min.css\";i:306;s:24:\"post-template/editor.css\";i:307;s:28:\"post-template/editor.min.css\";i:308;s:27:\"post-template/style-rtl.css\";i:309;s:31:\"post-template/style-rtl.min.css\";i:310;s:23:\"post-template/style.css\";i:311;s:27:\"post-template/style.min.css\";i:312;s:24:\"post-terms/style-rtl.css\";i:313;s:28:\"post-terms/style-rtl.min.css\";i:314;s:20:\"post-terms/style.css\";i:315;s:24:\"post-terms/style.min.css\";i:316;s:24:\"post-title/style-rtl.css\";i:317;s:28:\"post-title/style-rtl.min.css\";i:318;s:20:\"post-title/style.css\";i:319;s:24:\"post-title/style.min.css\";i:320;s:26:\"preformatted/style-rtl.css\";i:321;s:30:\"preformatted/style-rtl.min.css\";i:322;s:22:\"preformatted/style.css\";i:323;s:26:\"preformatted/style.min.css\";i:324;s:24:\"pullquote/editor-rtl.css\";i:325;s:28:\"pullquote/editor-rtl.min.css\";i:326;s:20:\"pullquote/editor.css\";i:327;s:24:\"pullquote/editor.min.css\";i:328;s:23:\"pullquote/style-rtl.css\";i:329;s:27:\"pullquote/style-rtl.min.css\";i:330;s:19:\"pullquote/style.css\";i:331;s:23:\"pullquote/style.min.css\";i:332;s:23:\"pullquote/theme-rtl.css\";i:333;s:27:\"pullquote/theme-rtl.min.css\";i:334;s:19:\"pullquote/theme.css\";i:335;s:23:\"pullquote/theme.min.css\";i:336;s:39:\"query-pagination-numbers/editor-rtl.css\";i:337;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:338;s:35:\"query-pagination-numbers/editor.css\";i:339;s:39:\"query-pagination-numbers/editor.min.css\";i:340;s:31:\"query-pagination/editor-rtl.css\";i:341;s:35:\"query-pagination/editor-rtl.min.css\";i:342;s:27:\"query-pagination/editor.css\";i:343;s:31:\"query-pagination/editor.min.css\";i:344;s:30:\"query-pagination/style-rtl.css\";i:345;s:34:\"query-pagination/style-rtl.min.css\";i:346;s:26:\"query-pagination/style.css\";i:347;s:30:\"query-pagination/style.min.css\";i:348;s:25:\"query-title/style-rtl.css\";i:349;s:29:\"query-title/style-rtl.min.css\";i:350;s:21:\"query-title/style.css\";i:351;s:25:\"query-title/style.min.css\";i:352;s:20:\"query/editor-rtl.css\";i:353;s:24:\"query/editor-rtl.min.css\";i:354;s:16:\"query/editor.css\";i:355;s:20:\"query/editor.min.css\";i:356;s:19:\"query/style-rtl.css\";i:357;s:23:\"query/style-rtl.min.css\";i:358;s:15:\"query/style.css\";i:359;s:19:\"query/style.min.css\";i:360;s:19:\"quote/style-rtl.css\";i:361;s:23:\"quote/style-rtl.min.css\";i:362;s:15:\"quote/style.css\";i:363;s:19:\"quote/style.min.css\";i:364;s:19:\"quote/theme-rtl.css\";i:365;s:23:\"quote/theme-rtl.min.css\";i:366;s:15:\"quote/theme.css\";i:367;s:19:\"quote/theme.min.css\";i:368;s:23:\"read-more/style-rtl.css\";i:369;s:27:\"read-more/style-rtl.min.css\";i:370;s:19:\"read-more/style.css\";i:371;s:23:\"read-more/style.min.css\";i:372;s:18:\"rss/editor-rtl.css\";i:373;s:22:\"rss/editor-rtl.min.css\";i:374;s:14:\"rss/editor.css\";i:375;s:18:\"rss/editor.min.css\";i:376;s:17:\"rss/style-rtl.css\";i:377;s:21:\"rss/style-rtl.min.css\";i:378;s:13:\"rss/style.css\";i:379;s:17:\"rss/style.min.css\";i:380;s:21:\"search/editor-rtl.css\";i:381;s:25:\"search/editor-rtl.min.css\";i:382;s:17:\"search/editor.css\";i:383;s:21:\"search/editor.min.css\";i:384;s:20:\"search/style-rtl.css\";i:385;s:24:\"search/style-rtl.min.css\";i:386;s:16:\"search/style.css\";i:387;s:20:\"search/style.min.css\";i:388;s:20:\"search/theme-rtl.css\";i:389;s:24:\"search/theme-rtl.min.css\";i:390;s:16:\"search/theme.css\";i:391;s:20:\"search/theme.min.css\";i:392;s:24:\"separator/editor-rtl.css\";i:393;s:28:\"separator/editor-rtl.min.css\";i:394;s:20:\"separator/editor.css\";i:395;s:24:\"separator/editor.min.css\";i:396;s:23:\"separator/style-rtl.css\";i:397;s:27:\"separator/style-rtl.min.css\";i:398;s:19:\"separator/style.css\";i:399;s:23:\"separator/style.min.css\";i:400;s:23:\"separator/theme-rtl.css\";i:401;s:27:\"separator/theme-rtl.min.css\";i:402;s:19:\"separator/theme.css\";i:403;s:23:\"separator/theme.min.css\";i:404;s:24:\"shortcode/editor-rtl.css\";i:405;s:28:\"shortcode/editor-rtl.min.css\";i:406;s:20:\"shortcode/editor.css\";i:407;s:24:\"shortcode/editor.min.css\";i:408;s:24:\"site-logo/editor-rtl.css\";i:409;s:28:\"site-logo/editor-rtl.min.css\";i:410;s:20:\"site-logo/editor.css\";i:411;s:24:\"site-logo/editor.min.css\";i:412;s:23:\"site-logo/style-rtl.css\";i:413;s:27:\"site-logo/style-rtl.min.css\";i:414;s:19:\"site-logo/style.css\";i:415;s:23:\"site-logo/style.min.css\";i:416;s:27:\"site-tagline/editor-rtl.css\";i:417;s:31:\"site-tagline/editor-rtl.min.css\";i:418;s:23:\"site-tagline/editor.css\";i:419;s:27:\"site-tagline/editor.min.css\";i:420;s:25:\"site-title/editor-rtl.css\";i:421;s:29:\"site-title/editor-rtl.min.css\";i:422;s:21:\"site-title/editor.css\";i:423;s:25:\"site-title/editor.min.css\";i:424;s:24:\"site-title/style-rtl.css\";i:425;s:28:\"site-title/style-rtl.min.css\";i:426;s:20:\"site-title/style.css\";i:427;s:24:\"site-title/style.min.css\";i:428;s:26:\"social-link/editor-rtl.css\";i:429;s:30:\"social-link/editor-rtl.min.css\";i:430;s:22:\"social-link/editor.css\";i:431;s:26:\"social-link/editor.min.css\";i:432;s:27:\"social-links/editor-rtl.css\";i:433;s:31:\"social-links/editor-rtl.min.css\";i:434;s:23:\"social-links/editor.css\";i:435;s:27:\"social-links/editor.min.css\";i:436;s:26:\"social-links/style-rtl.css\";i:437;s:30:\"social-links/style-rtl.min.css\";i:438;s:22:\"social-links/style.css\";i:439;s:26:\"social-links/style.min.css\";i:440;s:21:\"spacer/editor-rtl.css\";i:441;s:25:\"spacer/editor-rtl.min.css\";i:442;s:17:\"spacer/editor.css\";i:443;s:21:\"spacer/editor.min.css\";i:444;s:20:\"spacer/style-rtl.css\";i:445;s:24:\"spacer/style-rtl.min.css\";i:446;s:16:\"spacer/style.css\";i:447;s:20:\"spacer/style.min.css\";i:448;s:20:\"table/editor-rtl.css\";i:449;s:24:\"table/editor-rtl.min.css\";i:450;s:16:\"table/editor.css\";i:451;s:20:\"table/editor.min.css\";i:452;s:19:\"table/style-rtl.css\";i:453;s:23:\"table/style-rtl.min.css\";i:454;s:15:\"table/style.css\";i:455;s:19:\"table/style.min.css\";i:456;s:19:\"table/theme-rtl.css\";i:457;s:23:\"table/theme-rtl.min.css\";i:458;s:15:\"table/theme.css\";i:459;s:19:\"table/theme.min.css\";i:460;s:23:\"tag-cloud/style-rtl.css\";i:461;s:27:\"tag-cloud/style-rtl.min.css\";i:462;s:19:\"tag-cloud/style.css\";i:463;s:23:\"tag-cloud/style.min.css\";i:464;s:28:\"template-part/editor-rtl.css\";i:465;s:32:\"template-part/editor-rtl.min.css\";i:466;s:24:\"template-part/editor.css\";i:467;s:28:\"template-part/editor.min.css\";i:468;s:27:\"template-part/theme-rtl.css\";i:469;s:31:\"template-part/theme-rtl.min.css\";i:470;s:23:\"template-part/theme.css\";i:471;s:27:\"template-part/theme.min.css\";i:472;s:30:\"term-description/style-rtl.css\";i:473;s:34:\"term-description/style-rtl.min.css\";i:474;s:26:\"term-description/style.css\";i:475;s:30:\"term-description/style.min.css\";i:476;s:27:\"text-columns/editor-rtl.css\";i:477;s:31:\"text-columns/editor-rtl.min.css\";i:478;s:23:\"text-columns/editor.css\";i:479;s:27:\"text-columns/editor.min.css\";i:480;s:26:\"text-columns/style-rtl.css\";i:481;s:30:\"text-columns/style-rtl.min.css\";i:482;s:22:\"text-columns/style.css\";i:483;s:26:\"text-columns/style.min.css\";i:484;s:19:\"verse/style-rtl.css\";i:485;s:23:\"verse/style-rtl.min.css\";i:486;s:15:\"verse/style.css\";i:487;s:19:\"verse/style.min.css\";i:488;s:20:\"video/editor-rtl.css\";i:489;s:24:\"video/editor-rtl.min.css\";i:490;s:16:\"video/editor.css\";i:491;s:20:\"video/editor.min.css\";i:492;s:19:\"video/style-rtl.css\";i:493;s:23:\"video/style-rtl.min.css\";i:494;s:15:\"video/style.css\";i:495;s:19:\"video/style.min.css\";i:496;s:19:\"video/theme-rtl.css\";i:497;s:23:\"video/theme-rtl.min.css\";i:498;s:15:\"video/theme.css\";i:499;s:19:\"video/theme.min.css\";}}', 'yes'),
(123, 'recovery_keys', 'a:1:{s:22:\"tXACYJHiYAytW6fNwAmlHT\";a:2:{s:10:\"hashed_key\";s:34:\"$P$BP4irC2RaDBudML.fAY4fbjUJ.6sUh.\";s:10:\"created_at\";i:1711024359;}}', 'yes'),
(124, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.4.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.4.3-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.4.3\";s:7:\"version\";s:5:\"6.4.3\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1711026075;s:15:\"version_checked\";s:5:\"6.4.3\";s:12:\"translations\";a:0:{}}', 'no'),
(125, 'theme_mods_twentytwentyfour', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1707741066;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(130, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1711026076;s:7:\"checked\";a:4:{s:9:\"ecommerce\";s:3:\"1.0\";s:16:\"twentytwentyfour\";s:3:\"1.0\";s:17:\"twentytwentythree\";s:3:\"1.3\";s:15:\"twentytwentytwo\";s:3:\"1.6\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.0\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.0.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.3.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentytwo\";a:6:{s:5:\"theme\";s:15:\"twentytwentytwo\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentytwo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentytwo.1.6.zip\";s:8:\"requires\";s:3:\"5.9\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'no'),
(138, 'can_compress_scripts', '1', 'yes'),
(151, 'finished_updating_comment_type', '1', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(185, 'wp_calendar_block_has_published_posts', '1', 'yes'),
(189, 'recently_activated', 'a:0:{}', 'yes'),
(195, 'WPLANG', '', 'yes'),
(228, 'https_detection_errors', 'a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:21:\"HTTPS request failed.\";}}', 'yes'),
(229, '_transient_health-check-site-status-result', '{\"good\":17,\"recommended\":5,\"critical\":1}', 'yes'),
(306, 'current_theme', '', 'yes'),
(307, 'theme_mods_ecommerce', 'a:5:{i:0;b:0;s:18:\"nav_menu_locations\";a:4:{s:14:\"ecommerce-menu\";i:0;s:11:\"footer_menu\";i:4;s:11:\"header-menu\";i:40;s:16:\"Logout_user_Menu\";i:40;}s:18:\"custom_css_post_id\";i:-1;s:12:\"header_image\";s:81:\"http://localhost:81/wordpress/wp-content/uploads/2024/02/imgpsh_fullsize_anim.png\";s:17:\"header_image_data\";O:8:\"stdClass\":5:{s:13:\"attachment_id\";i:90;s:3:\"url\";s:81:\"http://localhost:81/wordpress/wp-content/uploads/2024/02/imgpsh_fullsize_anim.png\";s:13:\"thumbnail_url\";s:81:\"http://localhost:81/wordpress/wp-content/uploads/2024/02/imgpsh_fullsize_anim.png\";s:6:\"height\";i:499;s:5:\"width\";i:499;}}', 'yes'),
(308, 'theme_switched', '', 'yes'),
(337, 'recovery_mode_email_last_sent', '1711024359', 'yes'),
(402, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(738, 'term_children', 'a:0:{}', 'yes'),
(748, 'Category_children', 'a:0:{}', 'yes'),
(796, 'product_cat_children', 'a:0:{}', 'yes'),
(851, 'Color_children', 'a:0:{}', 'yes'),
(1043, '_site_transient_timeout_php_check_da775d00ae55849f14f81cf79fc50d46', '1711343872', 'no'),
(1044, '_site_transient_php_check_da775d00ae55849f14f81cf79fc50d46', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:3:\"7.0\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(1153, 'brand_children', 'a:0:{}', 'yes'),
(1159, '_site_transient_timeout_browser_4f09e01c83d69100c363c33aecfef9f8', '1711533980', 'no'),
(1160, '_site_transient_browser_4f09e01c83d69100c363c33aecfef9f8', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"122.0.0.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(1175, '_site_transient_timeout_browser_5e705226acd7a97aa6ee95ab188632d6', '1711603179', 'no'),
(1176, '_site_transient_browser_5e705226acd7a97aa6ee95ab188632d6', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"123.0.0.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(1177, '_site_transient_timeout_community-events-2c8826d5d44014f3d257734977965683', '1711041581', 'no'),
(1178, '_site_transient_community-events-2c8826d5d44014f3d257734977965683', 'a:4:{s:9:\"sandboxed\";b:0;s:5:\"error\";N;s:8:\"location\";a:1:{s:2:\"ip\";s:11:\"192.168.1.0\";}s:6:\"events\";a:0:{}}', 'no'),
(1179, '_transient_timeout_feed_9bbd59226dc36b9b26cd43f15694c5c3', '1711041582', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1180, '_transient_feed_9bbd59226dc36b9b26cd43f15694c5c3', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:52:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n\n \n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:8:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"WordPress News\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:26:\"https://wordpress.org/news\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:59:\"The latest news about WordPress and the WordPress community\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 19 Mar 2024 16:19:30 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"en-US\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://wordpress.org/?v=6.6-alpha-57860\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:5:\"image\";a:1:{i:0;a:6:{s:4:\"data\";s:11:\"\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:5:{s:3:\"url\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://s.w.org/favicon.ico?2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"WordPress News\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:26:\"https://wordpress.org/news\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:5:\"width\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"32\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:6:\"height\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"32\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}s:4:\"item\";a:10:{i:0;a:6:{s:4:\"data\";s:69:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"WordPress 6.5 Release Candidate 3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:69:\"https://wordpress.org/news/2024/03/wordpress-6-5-release-candidate-3/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 19 Mar 2024 16:19:30 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:5:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"6.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:11:\"development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:4;a:5:{s:4:\"data\";s:8:\"releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"https://wordpress.org/news/?p=17110\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:214:\"WordPress 6.5 RC3 is ready for download and testing. Reaching this phase of the release cycle is an important milestone. Check out what\'s coming in this release and how to get involved with the open source project.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Lauren Stein\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:9078:\"\n<p>The third release candidate (RC3) for WordPress 6.5 is ready!&nbsp;</p>\n\n\n\n<p><strong>This version of the WordPress software is under development</strong>.<strong> Please do not install, run, or test this version of WordPress on production or mission-critical websites.</strong> Instead, it’s recommended that you evaluate RC3 on a test server and site.</p>\n\n\n\n<p>While release candidates are considered ready for release, testing remains crucial to ensure that everything in WordPress 6.5 is the best it can be.</p>\n\n\n\n<p>You can test WordPress 6.5 RC3 in four ways:</p>\n\n\n\n<figure class=\"wp-block-table\"><table><tbody><tr><th>Plugin</th><td>Install and activate the <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> plugin on a WordPress install. (Select the “Bleeding edge” channel and “Beta/RC Only” stream).</td></tr><tr><th>Direct Download</th><td>Download the <a href=\"https://wordpress.org/wordpress-6.5-RC3.zip\">RC3 version (zip)</a> and install it on a WordPress website.</td></tr><tr><th>Command Line</th><td>Use the following <a href=\"https://make.wordpress.org/cli/\">WP-CLI</a> command:<br><code>wp core update --version=6.5-RC</code>3</td></tr><tr><th>WordPress Playground</th><td>Use the <a href=\"https://playground.wordpress.net/#%7B%20%22preferredVersions%22:%20%7B%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20%7D,%20%22features%22:%20%7B%20%22networking%22:%20true%20%7D,%20%22steps%22:%20[%20%7B%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20%7D,%20%22options%22:%20%7B%20%22activate%22:%20false%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D%20]%20%7D\">6.5 RC3 WordPress Playground instance</a> (available within 35 minutes after the release is ready) to test the software directly in your browser without the need for a separate site or setup.</td></tr></tbody></table></figure>\n\n\n\n<p>The current target for the WordPress 6.5 release is <strong>March 26, 2024</strong>. Get an overview of the <a href=\"https://make.wordpress.org/core/6-5/\">6.5 release cycle</a>, and check the <a href=\"https://make.wordpress.org/core/\">Make WordPress Core blog</a> for <a href=\"https://make.wordpress.org/core/tag/6-5/\">6.5-related posts</a> in the coming weeks for further details. </p>\n\n\n\n<p>If you’re looking for more detailed technical notes on new features and improvements, the <a href=\"https://make.wordpress.org/core/2024/03/15/wordpress-6-5-field-guide/\">WordPress 6.5 Field Guide</a> is for you.</p>\n\n\n\n<h2 class=\"wp-block-heading\">What to expect in WordPress 6.5 RC3</h2>\n\n\n\n<p>Thanks to the many contributors testing up to this point, this release includes 10+ bug fixes for the Editor and around 15 <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=03%2F13%2F2024..03%2F19%2F2024&amp;resolution=fixed&amp;milestone=6.5&amp;col=id&amp;col=summary&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">tickets for WordPress Core</a>. For more technical information related to issues addressed since RC2, you can browse the following links:&nbsp;</p>\n\n\n\n<ul>\n<li><a href=\"https://github.com/WordPress/gutenberg/commits/wp/6.5?since=2024-03-13&amp;until=2024-03-19\">GitHub commits for 6.5</a> </li>\n\n\n\n<li><a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=03%2F13%2F2024..03%2F19%2F2024&amp;resolution=fixed&amp;milestone=6.5&amp;col=id&amp;col=summary&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">Closed Trac tickets</a> </li>\n</ul>\n\n\n\n<h2 class=\"wp-block-heading\">How to contribute to this release</h2>\n\n\n\n<p>WordPress is open source software made possible by a passionate community of people collaborating on and contributing to its development. The resources below outline various ways you can help the world’s most popular open source web platform, regardless of your technical expertise.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Get involved in testing</h2>\n\n\n\n<p>Testing for issues is critical to ensuring WordPress is performant and stable. It’s also a meaningful way for anyone to contribute. <a href=\"https://make.wordpress.org/test/2024/02/28/help-test-wordpress-beta-3/\">This detailed guide</a> will walk you through testing features in WordPress 6.5. For those new to testing, follow <a href=\"https://make.wordpress.org/test/2024/02/15/help-test-wordpress-6-5-beta-1\">this general testing guide</a> for more details on getting set up.</p>\n\n\n\n<p>If you encounter an issue, please report it to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">Alpha/Beta area</a> of the support forums or directly to <a href=\"https://core.trac.wordpress.org/newticket\">WordPress Trac</a> if you are comfortable writing a reproducible bug report. You can also check your issue against a list of <a href=\"https://core.trac.wordpress.org/tickets/major\">known bugs</a>.</p>\n\n\n\n<p>Curious about testing releases in general? Follow along with the <a href=\"https://make.wordpress.org/test/\">testing initiatives in Make Core</a> and join the <a href=\"https://wordpress.slack.com/messages/core-test/\">#core-test channel</a> on <a href=\"https://wordpress.slack.com/\">Making WordPress Slack</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Search for vulnerabilities</h3>\n\n\n\n<p>During the release candidate phase of WordPress 6.5, the <a href=\"https://make.wordpress.org/security/2024/02/12/welcoming-2024-with-wordpress-6-5-beta-1/\">monetary reward for reporting new, unreleased security vulnerabilities</a> is doubled. Please follow responsible disclosure practices as detailed in the project’s security practices and policies outlined on the <a href=\"https://hackerone.com/wordpress\">HackerOne page</a> and in the <a href=\"https://wordpress.org/about/security/\">security white paper</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Update your theme or plugin</h3>\n\n\n\n<p>For plugin and theme authors, your products play an integral role in extending the functionality and value of WordPress for all users.&nbsp;</p>\n\n\n\n<p>Thanks for continuing to test your themes and plugins with the WordPress 6.5 beta releases. With RC3, you’ll want to conclude your testing and update the <em>“Tested up to”</em> version in your <a href=\"https://developer.wordpress.org/plugins/wordpress-org/how-your-readme-txt-works/\">plugin’s readme file</a> to 6.5.</p>\n\n\n\n<p>If you find compatibility issues, please post detailed information to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">support forum</a>.&nbsp;</p>\n\n\n\n<h3 class=\"wp-block-heading\">Help translate WordPress</h3>\n\n\n\n<p>Do you speak a language other than English? ¿Español? Français? Русский? 日本? हिन्दी? বাংলা? You can <a href=\"https://translate.wordpress.org/projects/wp/dev/\">help translate WordPress into more than 100 languages</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Release the haiku</h2>\n\n\n\n<p>Another RC<br>We are getting really close<br>Have you tested yet?</p>\n\n\n\n<p><em>Thank you to the following contributors for collaborating on this post: <a href=\'https://profiles.wordpress.org/dansoschin/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>dansoschin</a></em>, <em><a href=\'https://profiles.wordpress.org/audrasjb/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>audrasjb</a></em>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"17110\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:61:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:53:\"WP Briefing: Episode 75: WordCamp Asia 2024 Unwrapped\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:75:\"https://wordpress.org/news/2024/03/episode-75-wordcamp-asia-2024-unwrapped/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 18 Mar 2024 12:00:00 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:7:\"Podcast\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:11:\"wp-briefing\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:53:\"https://wordpress.org/news/?post_type=podcast&p=17107\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:485:\"WordCamp Asia 2024 was a dynamic three-day celebration of collaboration, diversity, and innovation in the WordPress project. This week, Executive Director Josepha Haden Chomphosy shares her insights and experiences from the event, which featured one of the largest Contributor Days in the region, a variety of speakers, engaging panel discussions, and workshops. Josepha offers her thoughts on the latest topics being discussed within the community and forming the future of WordPress.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"enclosure\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"url\";s:51:\"https://wordpress.org/news/files/2024/03/WPB075.mp3\";s:6:\"length\";s:1:\"0\";s:4:\"type\";s:0:\"\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Brett McSherry\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:12163:\"\n<p>WordCamp Asia 2024 was a dynamic three-day celebration of collaboration, diversity, and innovation in the WordPress project. This week, Executive Director Josepha Haden Chomphosy shares her insights and experiences from the event, which featured one of the largest Contributor Days in the region, a variety of speakers, engaging panel discussions, and workshops. Josepha offers her thoughts on the latest topics being discussed within the community and forming the future of WordPress.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Credits</h2>\n\n\n\n<p>Host:&nbsp;<a href=\"https://profiles.wordpress.org/chanthaboune/\">Josepha Haden Chomphosy</a><br>Editor:&nbsp;<a href=\"https://profiles.wordpress.org/dustinhartzler/\">Dustin Hartzler</a><br>Logo:&nbsp;<a href=\"https://profiles.wordpress.org/javiarce/\">Javier Arce</a><br>Production:&nbsp;<a href=\"https://profiles.wordpress.org/bjmcsherry/\">Brett McSherry</a><br>Song: Fearless First by Kevin MacLeod</p>\n\n\n\n<h2 class=\"wp-block-heading\">Show Notes</h2>\n\n\n\n<ul>\n<li><a href=\"https://asia.wordcamp.org/2024/\">WordCamp Asia 2024</a>\n<ul>\n<li><a href=\"https://asia.wordcamp.org/2024/contributor-day/\">Contributor Day</a></li>\n\n\n\n<li><a href=\"https://www.youtube.com/playlist?list=PL1pJFUVKQ7ETpYuALlCQPikuKEuihFsvU\">WordCamp Asia Playlist</a></li>\n</ul>\n</li>\n\n\n\n<li><strong>Small List of Big Things</strong>\n<ul>\n<li><a href=\"https://wordpress.org/news/category/releases/\" target=\"_blank\" rel=\"noreferrer noopener\">WordPress 6.5</a> is on target for release on&nbsp;March 26, 2024.</li>\n\n\n\n<li>Get involved with WordPress events:\n<ul>\n<li>Find events near you on <a href=\"https://events.wordpress.org/\">events.WordPress.org</a> and <a href=\"https://central.wordcamp.org/\">WordCamp Central</a></li>\n\n\n\n<li>Learn more about <a href=\"https://events.wordpress.org/organize-an-event/\">organizing your own local event</a></li>\n</ul>\n</li>\n\n\n\n<li><a href=\"https://make.wordpress.org/community/2024/03/06/proposal-non-editable-footer-for-all-event-website-pages/\" target=\"_blank\" rel=\"noreferrer noopener\">Proposal: Non-editable Footer for all Event Website Pages</a></li>\n</ul>\n</li>\n\n\n\n<li>Have a question you&#8217;d like answered? Submit them to <a href=\"mailto:wpbriefing@WordPress.org\">WPBriefing@WordPress.org</a>.</li>\n</ul>\n\n\n\n<h2 class=\"wp-block-heading\">Transcript</h2>\n\n\n\n<span id=\"more-17107\"></span>\n\n\n\n<p>[00:00:00]&nbsp;<strong>Josepha:</strong>&nbsp;Hello, everyone, and welcome to the WordPress Briefing, the podcast where you can catch quick explanations of the ideas behind the WordPress open source project, some insight into the community that supports it, and get a small list of big things coming up in the next two weeks. I’m your host, Josepha Haden Chomphosy. Here we go.&nbsp;</p>\n\n\n\n<p>[00:00:29] (Intro music)&nbsp;</p>\n\n\n\n<p>[00:00:40]&nbsp;<strong>Josepha:</strong> I have returned from WordCamp Asia and struggled my way through some truly aggressive jet lag, so that means it&#8217;s time for a little WordCamp wrap-up. I spoke with a couple hundred people at the event, and I came away with a few topics that seemed to be on everyone&#8217;s minds. Those topics are: making business in WordPress, the business of making WordPress, and how to communicate both sides a little better.</p>\n\n\n\n<p>[00:01:04] <strong>Josepha:</strong> So first, let&#8217;s start with making business in WordPress. This comes up at every event, and that honestly just makes sense. WordPress is a tool that people use to power their businesses across our global economy, and sometimes the businesses are closely related to WordPress itself. They are creating custom themes or plugins, building WordPress powered commerce sites for clients, or offering any number of agency services. But there are also businesses that are a little less close: restaurants, museums, local governments, schools. But it was clear that they all rely on the software just as much as the other.</p>\n\n\n\n<p>So, it was nice to see some sessions that focused specifically on business matters in WordPress. And I heard so many people tell me about a conversation they had had earlier in the day with someone who helped them figure out their pricing or advised them on early errors they made in their business journey and generally helped them feel a little less lost.</p>\n\n\n\n<p>I always love seeing this. Hearing how people are accomplishing their goals because of connections they made at one of our events, it&#8217;s enough to keep me coming back for years.</p>\n\n\n\n<p>[00:02:10] <strong>Josepha:</strong> The next thing that came up a lot was the business of making WordPress. I don&#8217;t know if that came up a lot because of the sorts of conversations that people are willing to bring to me these days or because there was overwhelming interest in knowing how we keep all these trains on their tracks. But either way, it was refreshing to be able to have so many conversations about the invisible work that goes into a project like this. There was a Contributor Day that hosted over 600 people, if I recall correctly, which makes it the largest Contributor Day in the area to date. 35 percent of those people had never attended a Contributor Day before, so there were a lot of people who were discovering the WordPress community for the first time.</p>\n\n\n\n<p>And for folks who&#8217;ve been here for a long time, it&#8217;s so easy for us to forget how much there is to learn at first. Even if you happen to show up with a skill set that fits a contributor team&#8217;s needs exactly, you still have to learn where we collaborate, how distributed contribution works, and all these rules and guidelines about open source freedoms and copyleft.</p>\n\n\n\n<p>[00:03:10] <strong><strong>Josepha</strong>:</strong> And then also you have to come to terms with the fact that we define and design all of our spaces and programs with belonging in mind. I mean, for every one question that you get answered, there are going to be six new ones that you didn&#8217;t know you had yet. So I came away from a lot of these conversations with the reminder that it&#8217;s important in so many ways for us to talk about the work that we do, even when it&#8217;s boring, even when we think it doesn&#8217;t really matter, because a lot of people have questions about how this works, how it runs, and how they can be part of making sure that it&#8217;s around for the long-term.</p>\n\n\n\n<p>And the final thing that came up all over the place last week was how to communicate these things better. It&#8217;s easy to forget that folks who listen to this podcast don&#8217;t actually make up like a hundred percent of the people using WordPress; that&#8217;s on me. So just cause I&#8217;ve said here that, you know, enterprise is our next big space for biz dev or that, our primary growth markets are APAC, or that events are our best tool for brand expression.</p>\n\n\n\n<p>[00:04:08] <strong><strong>Josepha</strong>:</strong> Like, just because I said it doesn&#8217;t mean that everyone heard it. And we absolutely have to get those messages to more people, more frequently, and with more certainty. You&#8217;ll hear often from WordPress pundits that rising tides lift all boats, and the bigger the pie, the more the slices. We believe fully in the spirit of coopetition here, that we are all better together.</p>\n\n\n\n<p>But I can&#8217;t shake the feeling that we&#8217;re mostly just talking to ourselves about it. It&#8217;s hard to get outside our own little bubble, but I believe completely that doing so is the best thing for our project in the long term. Not only so that we can continue to grow and provide access to the opportunities we know we offer but also so that we can do more to dignify our profession.</p>\n\n\n\n<p>WordPress developers are not taken seriously, and yet you all are some of the smartest and most compassionate people I&#8217;ve ever met in my career. And I&#8217;d like to see how we can fix that perception together. And so that&#8217;s it. Those are the big, big, giant, old topics that came up a lot in conversation last week.</p>\n\n\n\n<p>[00:05:14] <strong><strong>Josepha</strong>:</strong> Don&#8217;t forget that you can catch up on all the sessions via the live stream, or if you are feeling inspired to contribute, reach out to the community team and see what sorts of meetup events you can host.&nbsp;</p>\n\n\n\n<p>[00:05:24] (Music interlude)&nbsp;</p>\n\n\n\n<p>[00:05:32] <strong><strong>Josepha</strong>:</strong> Which brings us now to our small list of big things. I have two big things and one slightly less big thing, but they&#8217;re all fairly big.</p>\n\n\n\n<p>So, the first thing on the list is that the latest version of WordPress, WordPress 6.5, is on target for release on March 26th. That&#8217;s, I think, a couple weeks from now. So keep an eye out for that. In the event, I mean, we have auto-updates everywhere, and probably you are on a WordPress-specific host and, so you won&#8217;t necessarily need to do anything. But if you have any desire or concerns about seeing the software a little bit ahead of time, you can always go and download the beta, give it a quick test or the release candidate, give that a quick test. See if there&#8217;s anything that&#8217;s not functioning as you expected it to function, and let us know if it&#8217;s not. But yeah, there are auto-updates. You don&#8217;t have to go out and proactively do anything if you don&#8217;t want to, that&#8217;s just in case you do want to. That&#8217;s coming up March 26th.&nbsp;</p>\n\n\n\n<p>[00:06:27] <strong><strong>Josepha</strong>:</strong> The next thing is that I want to give everybody a general call-in for event contribution. So, WordPress events is where I entered the community. It is one of the most affirming and life-changing types of contribution I&#8217;ve ever done because you get to see a bunch of people succeed in their own goals because of something that you were able to tell them. It&#8217;s like teaching, but with people who elected to be there. So we have a lot of opportunities, for contribution by volunteering at events, either as volunteering at the event itself or to volunteer to organize it. We have small-scale, easy-to-do meetups, but we also have slightly larger WordCamps that can be done. If you have any hope for doing that or are just kind of interested. I&#8217;ll leave a link for you in the show notes.&nbsp;</p>\n\n\n\n<p>[00:07:19] <strong><strong>Josepha</strong>:</strong> And then the final thing on here is that we actually have a pretty substantial proposal out at the moment. It&#8217;s for non-editable footers on all event website pages. This might not sound interesting to you, but it actually is kind of interesting. So, it&#8217;s been proposed to add a non-editable footer to all of the event website pages moving forward. So that&#8217;s everything that would be displayed on a WordCamp or on any of the new formatted event sites that we have. This proposal intends to meet two goals. One, it fills any legal requirements a site or country might have about displaying the privacy policy and other items. And two, it brings visibility to the new events.WordPress.org website, where a community member can find more events in their area.&nbsp;The last day to respond to that proposal is March 20th, which I think is two days from now. I think it&#8217;s on Wednesday and this is airing on Monday. So, I&#8217;ll have a link to that in the show notes as well in case you have any thoughts about it.</p>\n\n\n\n<p>[00:08:15] <strong><strong>Josepha</strong>:</strong> And that, my friends, is your small list of big things. Don&#8217;t forget to follow us on your favorite podcast app or subscribe directly on WordPress.org/news. You&#8217;ll get a friendly reminder whenever there&#8217;s a new episode. And if you like what you heard today, share it with a fellow WordPresser. Or, if you ended up with questions about what you heard, you can share those with me at WPBriefing@WordPress.org. I&#8217;m your host, Josepha Haden Chomphosy. Thanks for tuning in today for the WordPress Briefing, and I&#8217;ll see you again in a couple of weeks. </p>\n\n\n\n<p>[00:08:43] (Music outro)&nbsp;</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"17107\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:69:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"WordPress 6.5 Release Candidate 2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:69:\"https://wordpress.org/news/2024/03/wordpress-6-5-release-candidate-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 12 Mar 2024 16:58:03 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:5:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"6.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:11:\"development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:4;a:5:{s:4:\"data\";s:8:\"releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"https://wordpress.org/news/?p=17053\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:185:\"WordPress 6.5 RC2 is ready for download and testing. Reaching this phase of the release cycle is an important milestone. Check out what\'s coming in this release and how to get involved.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Lauren Stein\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:9625:\"\n<p>The second release candidate (RC2) for WordPress 6.5 is ready!&nbsp;</p>\n\n\n\n<p><strong>This version of the WordPress software is under development</strong>.<strong> Please do not install, run, or test this version of WordPress on production or mission-critical websites.</strong> Instead, it’s recommended that you evaluate RC2 on a test server and site.</p>\n\n\n\n<p>While release candidates are considered ready for release, testing remains crucial to ensure that everything in WordPress 6.5 is the best it can be.</p>\n\n\n\n<p>You can test WordPress 6.5 RC2 in four ways:</p>\n\n\n\n<figure class=\"wp-block-table\"><table><tbody><tr><th>Plugin</th><td>Install and activate the <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> plugin on a WordPress install. (Select the “Bleeding edge” channel and “Beta/RC Only” stream).</td></tr><tr><th>Direct Download</th><td>Download the <a href=\"https://wordpress.org/wordpress-6.5-RC2.zip\">RC2 version (zip)</a> and install it on a WordPress website.</td></tr><tr><th>Command Line</th><td>Use the following <a href=\"https://make.wordpress.org/cli/\">WP-CLI</a> command:<br><code>wp core update --version=6.5-RC</code>2</td></tr><tr><th>WordPress Playground</th><td>Use the <a href=\"https://playground.wordpress.net/#%7B%20%22preferredVersions%22:%20%7B%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20%7D,%20%22features%22:%20%7B%20%22networking%22:%20true%20%7D,%20%22steps%22:%20[%20%7B%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20%7D,%20%22options%22:%20%7B%20%22activate%22:%20false%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D%20]%20%7D\">6.5 RC2 WordPress Playground instance</a> (available within 35 minutes after the release is ready) to test the software directly in your browser without the need for a separate site or setup.</td></tr></tbody></table></figure>\n\n\n\n<p>The current target for the WordPress 6.5 release is <strong>March 26, 2024</strong>. That’s a mere two weeks away! Get an overview of the <a href=\"https://make.wordpress.org/core/6-5/\">6.5 release cycle</a>, and check the <a href=\"https://make.wordpress.org/core/\">Make WordPress Core blog</a> for <a href=\"https://make.wordpress.org/core/tag/6-5/\">6.5-related posts</a> in the coming weeks for further details.</p>\n\n\n\n<h2 class=\"wp-block-heading\">What to expect in WordPress 6.5 RC2</h2>\n\n\n\n<p>Thanks to the many contributors testing up to this point, this release includes approximately 20 bug fixes for the Editor and 30+ <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=03%2F05%2F2024..03%2F12%2F2024&amp;resolution=fixed&amp;milestone=6.5&amp;col=id&amp;col=summary&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">tickets for WordPress Core</a>. For more technical information related to issues addressed since RC1, you can browse the following links:&nbsp;</p>\n\n\n\n<ul>\n<li><a href=\"https://github.com/WordPress/gutenberg/commits/wp/6.5?since=2024-03-05&amp;until=2024-03-12\">GitHub commits for 6.5</a> since March 5</li>\n\n\n\n<li><a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=03%2F05%2F2024..03%2F12%2F2024&amp;resolution=fixed&amp;milestone=6.5&amp;col=id&amp;col=summary&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">Closed Trac tickets</a> since March 5</li>\n</ul>\n\n\n\n<h3 class=\"wp-block-heading\">Update on content overrides for synced patterns</h3>\n\n\n\n<p>As synced patterns evolve and improve, every enhancement must continue to provide the best experience possible. With this in mind, WordPress 6.5 <a href=\"https://make.wordpress.org/core/2024/03/07/unblocking-wp6-5-font-library-and-synced-pattern-overrides/\">will not include the ability to override content in synced patterns</a>. This allows more time for feedback and testing to ensure it can really shine. Expect this feature to debut in the next major release!</p>\n\n\n\n<h2 class=\"wp-block-heading\">Contribute to this release</h2>\n\n\n\n<p>WordPress is open source software made possible by a passionate community of people collaborating on and contributing to its development. The resources below outline various ways you can help the world’s most popular open source web platform, regardless of your technical expertise.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Get involved in testing</h3>\n\n\n\n<p>Testing for issues is critical to ensuring WordPress is performant and stable. It’s also a meaningful way for anyone to contribute. <a href=\"https://make.wordpress.org/test/2024/02/28/help-test-wordpress-beta-3/\">This detailed guide</a> will walk you through testing features in WordPress 6.5. For those new to testing, follow <a href=\"https://make.wordpress.org/test/2024/02/15/help-test-wordpress-6-5-beta-1\">this general testing guide</a> for more details on getting set up.</p>\n\n\n\n<p>If you encounter an issue, please report it to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">Alpha/Beta area</a> of the support forums or directly to <a href=\"https://core.trac.wordpress.org/newticket\">WordPress Trac</a> if you are comfortable writing a reproducible bug report. You can also check your issue against a list of <a href=\"https://core.trac.wordpress.org/tickets/major\">known bugs</a>.</p>\n\n\n\n<p>Curious about testing releases in general? Follow along with the <a href=\"https://make.wordpress.org/test/\">testing initiatives in Make Core</a> and join the <a href=\"https://wordpress.slack.com/messages/core-test/\">#core-test channel</a> on <a href=\"https://wordpress.slack.com/\">Making WordPress Slack</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Search for vulnerabilities</h3>\n\n\n\n<p>From now until the final release candidate of WordPress 6.5 (scheduled for March 19), the <a href=\"https://make.wordpress.org/security/2024/02/12/welcoming-2024-with-wordpress-6-5-beta-1/\">monetary reward for reporting new, unreleased security vulnerabilities</a> is doubled. Please follow responsible disclosure practices as detailed in the project’s security practices and policies outlined on the <a href=\"https://hackerone.com/wordpress\">HackerOne page</a> and in the <a href=\"https://wordpress.org/about/security/\">security white paper</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Update your theme or plugin</h3>\n\n\n\n<p>For plugin and theme authors, your products play an integral role in extending the functionality and value of WordPress for all users.&nbsp;</p>\n\n\n\n<p>Thanks for continuing to test your themes and plugins with the WordPress 6.5 beta releases. With RC1, you’ll want to conclude your testing and update the <em>“Tested up to”</em> version in your <a href=\"https://developer.wordpress.org/plugins/wordpress-org/how-your-readme-txt-works/\">plugin’s readme file</a> to 6.5.</p>\n\n\n\n<p>If you find compatibility issues, please post detailed information to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">support forum</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Help translate WordPress</h3>\n\n\n\n<p>Do you speak a language other than English? ¿Español? Français? Русский? 日本? हिन्दी? বাংলা? You can <a href=\"https://translate.wordpress.org/projects/wp/dev/\">help translate WordPress into more than 100 languages</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Release the haiku</h2>\n\n\n\n<p>RC2, a bridge,<br>From development to launch,<br>One more step forward.<br>&#8211; <em>submitted by <a href=\'https://profiles.wordpress.org/huzaifaalmesbah/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>huzaifaalmesbah</a></em></p>\n\n\n\n<p><em>Thank you to the following contributors for collaborating on this post: <a href=\"https://profiles.wordpress.org/dansoschin/\">@dansoschin</a></em>, <a href=\"https://profiles.wordpress.org/get_dave/\">@get_dave</a>, and <a href=\"https://profiles.wordpress.org/audrasjb/\">@audrasjb</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"17053\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"Highlights from WordCamp Asia 2024\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:70:\"https://wordpress.org/news/2024/03/highlights-from-wordcamp-asia-2024/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 09 Mar 2024 13:39:27 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:6:\"Events\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"WordCamp\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"https://wordpress.org/news/?p=17064\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:268:\"Over 1,300 attendees gathered at the Taipei International Convention Center in Taiwan for WordCamp Asia 2024. The three-day event emerged as a vibrant celebration showcasing the collaboration, diversity, and innovation that drive the world\'s most popular web platform.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Reyes Martínez\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:7224:\"\n<p>Over 1,300 attendees gathered at the Taipei International Convention Center in Taiwan for <a href=\"https://asia.wordcamp.org/2024/\">WordCamp Asia 2024</a>. This three-day event emerged as a vibrant celebration showcasing the collaboration, diversity, and innovation that drive the world&#8217;s most popular web platform.</p>\n\n\n\n<p>The Asian WordPress flagship event started with a dedicated Contributor Day, followed by two days of engaging talks, panels, hands-on workshops, and networking. Notable guests, including WordPress Cofounder <a href=\"https://profiles.wordpress.org/matt/\">Matt Mullenweg</a> and Executive Director <a href=\"https://profiles.wordpress.org/chanthaboune/\">Josepha Haden Chomphosy</a>, joined the diverse lineup of <a href=\"https://asia.wordcamp.org/2024/speakers/\">speakers</a>. Popular topics featured cutting-edge web technologies and trends, use cases, open source dynamics, and more. WordPress enthusiasts seized the opportunity to gain insights from international and local industry experts and to learn about the project&#8217;s future.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Converting walled gardens into community gardens</h2>\n\n\n\n<p>On March 8, Josepha Haden Chomphosy <a href=\"https://www.youtube.com/live/UK7FnaEeTrU?si=0H6eEEijj4tDWm_t&amp;t=30830\">took the stage</a> for an insightful journey comparing and contrasting the “walled” and “community” gardens in software ecosystems, drawing an analogy between closed and open source platforms. After exploring both concepts, she posed an important question to the audience.</p>\n\n\n\n<div style=\"height:2px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<blockquote class=\"wp-block-quote is-layout-flow wp-block-quote-is-layout-flow\">\n<p>What would it take for someone to move from a walled garden to a community garden?</p>\n</blockquote>\n\n\n\n<div style=\"height:2px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<p>Open source software, symbolized by community gardens, represents freedom from copyright restrictions and usage limitations. Unlike proprietary software (described as walled gardens), the core value lies in long-term empowerment, giving people control and ownership of their digital presence.</p>\n\n\n\n<p>Acknowledging the longstanding values held by WordPress and its open source community for two decades, Josepha focused on the importance of caring for foundations that make us strong, managing what distracts us, and nurturing growth by embracing new opportunities. She celebrated the strengths of the WordPress community and how its shared ethos furthers a thriving ecosystem.</p>\n\n\n\n<figure class=\"wp-block-image size-large\"><img fetchpriority=\"high\" decoding=\"async\" width=\"1024\" height=\"576\" src=\"https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-slide.png?resize=1024%2C576&#038;ssl=1\" alt=\"Slide from Josepha Haden Chomphosy\'s presentation showing colorful flowers on a blue background and the quote, &quot;To plant a garden is to believe in tomorrow&quot; by Audrey Hepburn.\" class=\"wp-image-17066\" srcset=\"https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-slide.png?resize=1024%2C576&amp;ssl=1 1024w, https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-slide.png?resize=300%2C169&amp;ssl=1 300w, https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-slide.png?resize=768%2C432&amp;ssl=1 768w, https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-slide.png?resize=1536%2C864&amp;ssl=1 1536w, https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-slide.png?resize=2048%2C1152&amp;ssl=1 2048w\" sizes=\"(max-width: 1000px) 100vw, 1000px\" data-recalc-dims=\"1\" /></figure>\n\n\n\n<p>Quoting artist and activist Audrey Hepburn, Josepha expressed that, much like a community garden, the power of contributions—whether through time, knowledge, or product use— sustains and maintains shared spaces like WordPress.</p>\n\n\n\n<p>In the <a href=\"https://www.youtube.com/live/UK7FnaEeTrU?si=pjg0nkwla-d7mP69&amp;t=32274\">Q&amp;A portion</a> of her presentation, Josepha addressed inquiries about community involvement and contributions. Highlighted resources included the <a href=\"https://jobs.wordpress.net/\">WordPress job board</a> for opportunities within the ecosystem and the <a href=\"https://wordpress.org/data-liberation/\">Data Liberation</a> project, emphasizing its role in fostering a more open web and helping the transition out of proprietary platforms.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Q&amp;A with Matt Mullenweg</h2>\n\n\n\n<p>WordCamp Asia concluded with a live audience Q&amp;A session featuring WordPress Cofounder Matt Mullenweg. Attendees gained insights into the future of WordPress, including ongoing projects like <a href=\"https://wordpress.org/data-liberation/\">Data Liberation</a>, <a href=\"https://make.wordpress.org/community/handbook/wordcamp-organizer/first-steps/inclusive-and-welcoming-events/community-inclusion-initiatives/\">community inclusion initiatives</a>, artificial intelligence (AI), and more.</p>\n\n\n\n<p>The atmosphere was filled with excitement when Matt revealed that this year’s State of the Word will take place in Tokyo, Japan, on December 16, 2024.</p>\n\n\n\n<figure class=\"wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\n<iframe class=\"youtube-player\" width=\"600\" height=\"338\" src=\"https://www.youtube.com/embed/EOF70YJLC5U?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en-US&#038;autohide=2&#038;wmode=transparent\" allowfullscreen=\"true\" style=\"border:0;\" sandbox=\"allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox\"></iframe>\n</div></figure>\n\n\n\n<p>Additional questions from this session will be addressed in an upcoming post on the <a href=\"https://make.wordpress.org/project/\">Make WordPress Project blog</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Stay connected</h2>\n\n\n\n<p><a href=\"https://events.wordpress.org/\">WordPress events</a> enable technologists, open source enthusiasts, and community members around the globe to meet, share ideas, and collaborate to drive WordPress and the open web forward.</p>\n\n\n\n<p>Don’t forget to mark your calendars for <a href=\"https://europe.wordcamp.org/2024/\">WordCamp Europe</a> (Torino, Italy), <a href=\"https://us.wordcamp.org/2024/\">WordCamp US</a> (Portland, Oregon, United States), and next year’s <a href=\"https://asia.wordcamp.org/2025/\">WordCamp Asia</a> in Manila, Philippines!</p>\n\n\n\n<p><em>Thank you to the <a href=\"https://asia.wordcamp.org/2024/\">WordCamp Asia</a> organizers, volunteers, and sponsors who made this event possible, and to <a href=\'https://profiles.wordpress.org/angelasjin/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>angelasjin</a>, <a href=\'https://profiles.wordpress.org/dansoschin/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>dansoschin</a>, <a href=\'https://profiles.wordpress.org/eidolonnight/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>eidolonnight</a>, <a href=\'https://profiles.wordpress.org/bjmcsherry/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>bjmcsherry</a> for collaborating on this post.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"17064\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"The Month in WordPress – February 2024\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:72:\"https://wordpress.org/news/2024/03/the-month-in-wordpress-february-2024/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 06 Mar 2024 13:20:00 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:18:\"Month in WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:18:\"month in wordpress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"https://wordpress.org/news/?p=17030\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:358:\"February saw significant progress towards the upcoming WordPress 6.5 release and final preparations for WordCamp Asia. The results of the annual WordPress survey were released, and discussions began on the next steps for the Data Liberation project. Read on for the latest happenings in the WordPress space. Get ready for WordCamp Asia The stage is [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Reyes Martínez\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:12369:\"\n<p>February saw significant progress towards the upcoming WordPress 6.5 release and final preparations for WordCamp Asia. The results of the annual WordPress survey were released, and discussions began on the next steps for the Data Liberation project. Read on for the latest happenings in the WordPress space.</p>\n\n\n\n<div style=\"height:3px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2 class=\"wp-block-heading\">Get ready for WordCamp Asia</h2>\n\n\n\n<p>The stage is ready for the first WordPress flagship event of the year in Taipei, Taiwan. WordCamp Asia 2024 will kick off on March 7, promising three days of learning, networking, and inspiration.</p>\n\n\n\n<p><a href=\"https://asia.wordcamp.org/2024/schedule/\">This year’s schedule</a> features an extensive lineup of speakers, including guests <a href=\"https://asia.wordcamp.org/2024/speaker/josepha-haden-chomphosy/\">Josepha Haden Chomphosy</a>, <a href=\"https://asia.wordcamp.org/2024/speaker/ben-thompson/\">Ben Thompson</a>, <a href=\"https://asia.wordcamp.org/2024/speaker/noel-tock/\">Noel Tock</a>, and <a href=\"https://asia.wordcamp.org/2024/speaker/ju-chun-ko/\">JU-CHUN KO</a>. To conclude the summit, attendees can engage with WordPress co-founder <a href=\"https://asia.wordcamp.org/2024/speaker/matt-mullenweg/\">Matt Mullenweg</a> in a Q&amp;A session. <a href=\"https://wordpress.org/news/2024/03/wordcamp-asia-2024-qa-with-matt-mullenweg/\">Find out how to submit your questions</a>.</p>\n\n\n\n<p>Can’t make it to Taipei? Watch the event live stream on the <a href=\"https://www.youtube.com/wordpress\">WordPress YouTube channel</a>.</p>\n\n\n\n<div style=\"height:3px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<a class=\"wp-block-jetpack-podcast-player jetpack-podcast-player__direct-link\" href=\"https://wordpress.org/news/2023/10/episode-64-patterns-in-wordpress/\">https://wordpress.org/news/2023/10/episode-64-patterns-in-wordpress/</a>\n\n\n\n<div style=\"height:3px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2 class=\"wp-block-heading\">Countdown to WordPress 6.5</h2>\n\n\n\n<p>WordPress 6.5 is on track for its much-anticipated release on March 26. Following last month’s beta releases, the <a href=\"https://wordpress.org/news/2024/03/wordpress-6-5-release-candidate-1/\">first release candidate (RC1)</a> is now available for testing—marking another milestone in the development cycle.</p>\n\n\n\n<p>This major release will add finesse and fine-tuning to how you control your site-building experience, with lots to explore specifically for developers. Get a detailed overview of highlighted features in the <a href=\"https://wordpress.org/news/2024/02/wordpress-6-5-beta-1/\">Beta 1 announcement</a>.</p>\n\n\n\n<blockquote class=\"wp-block-quote has-extra-large-font-size is-layout-flow wp-block-quote-is-layout-flow\">\n<p>Stay on top of the latest updates in WordPress development with <a href=\"https://developer.wordpress.org/news/2024/02/10/whats-new-for-developers-february-2024/\">February’s edition of What’s New for Developers?</a></p>\n</blockquote>\n\n\n\n<div style=\"height:3px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2 class=\"wp-block-heading\">New in the Gutenberg plugin</h2>\n\n\n\n<p>Two new versions of Gutenberg shipped in February:</p>\n\n\n\n<ul>\n<li><a href=\"https://make.wordpress.org/core/2024/02/14/whats-new-in-gutenberg-17-7-14th-february/\"><strong>Gutenberg 17.7</strong></a> introduced multiple performance improvements, refinements to the link control UI, and shadow support for more blocks, among other notable highlights.</li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/02/28/whats-new-in-gutenberg-17-8-28-february/\"><strong>Gutenberg 17.8</strong></a> focused on stability updates. New features included a grid layout variation for the Group block, bulk export of patterns, and the ability to browse and try alternative templates from the editor’s sidebar.</li>\n</ul>\n\n\n\n<div class=\"wp-block-media-text is-stacked-on-mobile has-off-white-2-background-color has-background\" style=\"padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;grid-template-columns:57% auto\"><figure class=\"wp-block-media-text__media\"><a href=\"https://make.wordpress.org/core/2024/02/10/core-editor-improvement-power-in-the-details/\"><img decoding=\"async\" width=\"1024\" height=\"576\" src=\"https://i0.wp.com/wordpress.org/news/files/2024/03/Core-Editor-Improvement-Power-in-the-Details-Featured-Image.png?resize=1024%2C576&#038;ssl=1\" alt=\"Decorative blue background with text &quot;Core Editor Improvement: Power in the Details.&quot;\" class=\"wp-image-17031 size-full\" srcset=\"https://i0.wp.com/wordpress.org/news/files/2024/03/Core-Editor-Improvement-Power-in-the-Details-Featured-Image.png?resize=1024%2C576&amp;ssl=1 1024w, https://i0.wp.com/wordpress.org/news/files/2024/03/Core-Editor-Improvement-Power-in-the-Details-Featured-Image.png?resize=300%2C169&amp;ssl=1 300w, https://i0.wp.com/wordpress.org/news/files/2024/03/Core-Editor-Improvement-Power-in-the-Details-Featured-Image.png?resize=768%2C432&amp;ssl=1 768w, https://i0.wp.com/wordpress.org/news/files/2024/03/Core-Editor-Improvement-Power-in-the-Details-Featured-Image.png?resize=1536%2C864&amp;ssl=1 1536w, https://i0.wp.com/wordpress.org/news/files/2024/03/Core-Editor-Improvement-Power-in-the-Details-Featured-Image.png?resize=2048%2C1152&amp;ssl=1 2048w\" sizes=\"(max-width: 1000px) 100vw, 1000px\" data-recalc-dims=\"1\" /></a></figure><div class=\"wp-block-media-text__content\">\n<p>Beyond major features, many small yet mighty updates are coming in WordPress 6.5 that will make a big difference in your WordPress experience. <a href=\"https://make.wordpress.org/core/2024/02/10/core-editor-improvement-power-in-the-details/\">Read more »</a></p>\n</div></div>\n\n\n\n<div style=\"height:3px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2 class=\"wp-block-heading\">Team updates</h2>\n\n\n\n<ul>\n<li><a href=\"https://wordpress.org/news/2024/02/2023-annual-survey-results-and-next-steps/\">Results of the 2023 annual WordPress survey</a> were announced last month.</li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/02/19/data-liberation-next-steps/\">An update on the Data Liberation project</a> informs the next steps of this initiative and how to contribute to current conversations.</li>\n\n\n\n<li>The Community team shared <a href=\"https://make.wordpress.org/community/2024/02/09/2023-wordpress-meetup-survey-key-findings/\">key findings from the 2023 WordPress meetup survey</a>.</li>\n\n\n\n<li><a href=\"https://make.wordpress.org/community/2024/02/16/contributor-mentorship-program-second-cohort-2024-q1/\">Meet the new cohort</a> of the Contributor Mentorship Program.</li>\n\n\n\n<li>The Photos team posted <a href=\"https://make.wordpress.org/photos/2024/02/02/alt-text-for-wordpress-photos/\">recommendations for improving alternative texts</a> when submitting images to the Photo Directory.</li>\n\n\n\n<li>Following discussions on the evolution of the Outreach Program, a <a href=\"https://make.wordpress.org/core/2024/02/27/connect-with-the-github-outreach-group-to-request-feedback-or-further-testing/\">new outreach group</a> has been created on GitHub. This group will provide expertise and feedback to those seeking additional testing or perspectives on a new feature or solution.</li>\n\n\n\n<li>Core team members introduced the <a href=\"https://make.wordpress.org/core/2024/02/22/introducing-the-wordpress-core-trac-sustainability-focus/\">WordPress Core Trac Sustainability Focus</a>, a part of the Sustainability team&#8217;s effort to enhance the sustainability of the WordPress codebase.</li>\n\n\n\n<li>A new release of WP-CLI is <a href=\"https://make.wordpress.org/cli/2024/02/08/wp-cli-v2-10-0-release-notes/\">now available</a>.</li>\n\n\n\n<li>Learn WordPress is regularly updated with new tutorials, online workshops, and more learning resources. <a href=\"https://learn.wordpress.org/learn-wordpress-newsletter-march-2024/\">Check out what’s new</a>.</li>\n\n\n\n<li>The latest edition of People of WordPress features <a href=\"https://wordpress.org/news/2024/02/people-of-wordpress-sunita-rai/\">Sunita Rai</a>, a content marketer and volunteer translator from Nepal.</li>\n</ul>\n\n\n\n<div style=\"height:3px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<a class=\"wp-block-jetpack-podcast-player jetpack-podcast-player__direct-link\" href=\"https://wordpress.org/news/2023/10/episode-64-patterns-in-wordpress/\">https://wordpress.org/news/2023/10/episode-64-patterns-in-wordpress/</a>\n\n\n\n<div style=\"height:3px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2 class=\"wp-block-heading\">Requests for feedback and testing</h2>\n\n\n\n<ul>\n<li><a href=\"https://wordpress.org/news/2024/03/wordpress-6-5-release-candidate-1/\">Your help testing WordPress 6.5</a> is key to ensuring everything in this release is the best it can be. New to testing? <a href=\"https://make.wordpress.org/test/2024/02/15/help-test-wordpress-6-5-beta-1/\">Read this post</a> for more details on getting set up.</li>\n\n\n\n<li>The Training team is discussing <a href=\"https://make.wordpress.org/training/2024/02/20/discussion-bringing-accessibility-first-approaches-into-content-development/\">how to bring accessibility-first approaches</a> into their content creation and processes. Feedback is open until March 9.</li>\n\n\n\n<li><a href=\"https://make.wordpress.org/updates/2024/02/27/mobile-team-update-february-26th-2/\">Version 24.3</a> of the WordPress mobile app for iOS and Android is ready for testing.</li>\n</ul>\n\n\n\n<div style=\"height:3px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2 class=\"wp-block-heading\">WordPress events</h2>\n\n\n\n<ul>\n<li>WordCamp Europe 2024 is <a href=\"https://europe.wordcamp.org/2024/call-for-photographers-is-now-open/\">looking for photographers</a>.</li>\n\n\n\n<li>The WordPress Kerala Photo Festival wrapped up with great success. The event received over <a href=\"https://wordpress.org/photos/t/wpkeralaphotos/\">1,500 images</a> from 163 participants, contributing to the Photo Directory passing the 15,000 photo milestone. Winners were announced <a href=\"https://events.wordpress.org/kerala/2024/photo-festival/winners-of-the-kerala-wordpress-photo-festival/\">in this post</a>.</li>\n\n\n\n<li>Don’t miss these other WordPress events happening soon:\n<ul>\n<li><img src=\"https://s.w.org/images/core/emoji/15.0.3/72x72/1f1e8-1f1f7.png\" alt=\"🇨🇷\" class=\"wp-smiley\" style=\"height: 1em; max-height: 1em;\" /> <a href=\"https://events.wordpress.org/sanjose/2024/women-wordpress-day/\">Women WordPress Day</a>, Costa Rica, on March 8</li>\n\n\n\n<li><img src=\"https://s.w.org/images/core/emoji/15.0.3/72x72/1f1e8-1f1ed.png\" alt=\"🇨🇭\" class=\"wp-smiley\" style=\"height: 1em; max-height: 1em;\" /> <a href=\"https://events.wordpress.org/switzerland/2024/community-day/\">Switzerland Community Day</a> on March 23</li>\n\n\n\n<li><img src=\"https://s.w.org/images/core/emoji/15.0.3/72x72/1f1ea-1f1f8.png\" alt=\"🇪🇸\" class=\"wp-smiley\" style=\"height: 1em; max-height: 1em;\" /> <a href=\"https://torrelodones.wordcamp.org/2024/\">WordCamp Torrelodones</a>, Spain, on March 23-24</li>\n</ul>\n</li>\n\n\n\n<li>Find out more local events or apply to organize one on the <a href=\"https://events.wordpress.org/\">Events page</a>.</li>\n</ul>\n\n\n\n<div style=\"height:1px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<hr class=\"wp-block-separator has-alpha-channel-opacity\" />\n\n\n\n<p><em><strong>Have a story we should include in the next issue of The Month in WordPress? Fill out </strong></em><a href=\"https://make.wordpress.org/community/month-in-wordpress-submissions/\"><strong><em>this quick form</em></strong></a><em><strong> to let us know.</strong></em></p>\n\n\n\n<div class=\"wp-block-group is-layout-constrained wp-block-group-is-layout-constrained\">\n<h3 class=\"wp-block-heading\">Subscribe to WordPress News</h3>\n\n\n\n<p>Join other subscribers and receive WordPress news directly in your inbox.</p>\n\n\n<div class=\"wp-block-jetpack-subscriptions__supports-newline is-style-split wp-block-jetpack-subscriptions\">\n		<div>\n			<div>\n				<div>\n					<p >\n						<a href=\"https://wordpress.org/news/?post_type=post&#038;p=17030\" style=\"font-size: 16px;padding: 15px 23px 15px 23px;margin: 0px; margin-left: 10px;border-radius: 0px;border-width: 1px; background-color: #113AF5; color: #FFFFFF; text-decoration: none; white-space: nowrap; margin-left: 0\">Subscribe</a>\n					</p>\n				</div>\n			</div>\n		</div>\n	</div></div>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"17030\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:69:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"WordPress 6.5 Release Candidate 1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:69:\"https://wordpress.org/news/2024/03/wordpress-6-5-release-candidate-1/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 05 Mar 2024 16:26:05 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:5:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"6.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:11:\"development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:4;a:5:{s:4:\"data\";s:8:\"releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"https://wordpress.org/news/?p=17008\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:185:\"WordPress 6.5 RC1 is ready for download and testing. Reaching this phase of the release cycle is an important milestone. Check out what\'s coming in this release and how to get involved.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Lauren Stein\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:11482:\"\n<p>The first release candidate (RC1) for WordPress 6.5 is ready for download and testing!</p>\n\n\n\n<p><strong>This version of the WordPress software is under development</strong>.<strong> Please do not install, run, or test this version of WordPress on production or mission-critical websites.</strong> Instead, it’s recommended that you evaluate RC1 on a test server and site.</p>\n\n\n\n<p>Reaching this phase of the release cycle is an important milestone. While release candidates are considered ready for release, testing remains crucial to ensure that everything in WordPress 6.5 is the best it can be.</p>\n\n\n\n<p>You can test WordPress 6.5 RC1 in four ways:</p>\n\n\n\n<figure class=\"wp-block-table\"><table><tbody><tr><th>Plugin</th><td>Install and activate the <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> plugin on a WordPress install. (Select the “Bleeding edge” channel and “Beta/RC Only” stream).</td></tr><tr><th>Direct Download</th><td>Download the <a href=\"https://wordpress.org/wordpress-6.5-RC1.zip\">RC1 version (zip)</a> and install it on a WordPress website.</td></tr><tr><th>Command Line</th><td>Use the following <a href=\"https://make.wordpress.org/cli/\">WP-CLI</a> command:<br><code>wp core update --version=6.5-RC1</code></td></tr><tr><th>WordPress Playground</th><td>Use the <a href=\"https://playground.wordpress.net/#%7B%20%22preferredVersions%22:%20%7B%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20%7D,%20%22features%22:%20%7B%20%22networking%22:%20true%20%7D,%20%22steps%22:%20[%20%7B%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20%7D,%20%22options%22:%20%7B%20%22activate%22:%20false%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D%20]%20%7D\">6.5 RC1 WordPress Playground instance</a> (available within 35 minutes after the release is ready) to test the software directly in your browser without the need for a separate site or setup.</td></tr></tbody></table></figure>\n\n\n\n<p>The current target for the WordPress 6.5 release is <strong>March 26, 2024</strong>. Get an overview of the <a href=\"https://make.wordpress.org/core/6-5/\">6.5 release cycle</a>, and check the <a href=\"https://make.wordpress.org/core/\">Make WordPress Core blog</a> for <a href=\"https://make.wordpress.org/core/tag/6-5/\">6.5-related posts</a> in the coming weeks for further details.</p>\n\n\n\n<h2 class=\"wp-block-heading\">What&#8217;s in WordPress 6.5 RC1?</h2>\n\n\n\n<p>Thanks to the many contributors testing up to this point, this release includes more than 20 bug fixes for the Editor and more than 40 <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=02%2F27%2F2024..03%2F05%2F2024&amp;milestone=6.5&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">tickets for WordPress Core</a>.</p>\n\n\n\n<p>Get a recap of WordPress 6.5’s highlighted features in the <a href=\"https://wordpress.org/news/2024/02/wordpress-6-5-beta-1/\">Beta 1 announcement</a>. For more technical information related to issues addressed since Beta 3, you can browse the following links:</p>\n\n\n\n<ul>\n<li><a href=\"https://github.com/WordPress/gutenberg/commits/wp/6.5?since=2024-02-27&amp;until=2024-03-05\">GitHub commits for 6.5</a> since February 27</li>\n\n\n\n<li><a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=02%2F27%2F2024..03%2F05%2F2024&amp;milestone=6.5&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">Closed Trac tickets</a> since February 27</li>\n</ul>\n\n\n\n<p>Want to look deeper into the details and technical notes for this release? These recent posts cover some of the latest updates:</p>\n\n\n\n<ul>\n<li><a href=\"https://make.wordpress.org/core/2024/03/05/introducing-plugin-dependencies-in-wordpress-6-5/\" data-type=\"link\" data-id=\"https://make.wordpress.org/core/2024/03/05/introducing-plugin-dependencies-in-wordpress-6-5/\">Introducing Plugin Dependencies in WordPress 6.5</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/03/05/unification-of-the-site-and-post-editors-in-6-5/\" data-type=\"link\" data-id=\"https://make.wordpress.org/core/2024/03/05/unification-of-the-site-and-post-editors-in-6-5/\">Unification of the Site and Post Editors in 6.5</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/03/04/updates-to-the-html-api-in-6-5/\" data-type=\"link\" data-id=\"https://make.wordpress.org/core/2024/03/04/updates-to-the-html-api-in-6-5/\">Updates to the HTML API in 6.5</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/03/04/interactivity-api-dev-note/\" data-type=\"link\" data-id=\"https://make.wordpress.org/core/2024/03/04/interactivity-api-dev-note/\">Interactivity API in 6.5</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/02/27/i18n-improvements-6-5-performant-translations/\">I18N Improvements in 6.5 (Performant Translations)</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/02/23/wordpress-6-5-adds-avif-support/\">WordPress 6.5 adds AVIF support</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/02/10/core-editor-improvement-power-in-the-details/\">Core Editor Improvement: Power in the Details</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/01/22/core-editor-improvement-robust-revisions-in-the-site-editor/\">Core Editor Improvement: Robust Revisions in the Site Editor</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/tag/dev-notes-6-5/\">All 6.5-related developer notes</a></li>\n</ul>\n\n\n\n<h2 class=\"wp-block-heading\">How you can contribute</h2>\n\n\n\n<p>WordPress is open source software made possible by a passionate community of people collaborating on and contributing to its development. The resources below outline various ways you can help the world’s most popular open source web platform, regardless of your technical expertise.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Get involved in testing</h3>\n\n\n\n<p>Testing for issues is critical to ensuring WordPress is performant and stable. It’s also a meaningful way for anyone to contribute. <a href=\"https://make.wordpress.org/test/2024/02/28/help-test-wordpress-beta-3/\">This detailed guide</a> will walk you through testing features in WordPress 6.5. For those new to testing, follow <a href=\"https://make.wordpress.org/test/2024/02/15/help-test-wordpress-6-5-beta-1\">this general testing guide</a> for more details on getting set up.</p>\n\n\n\n<p>If you encounter an issue, please report it to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">Alpha/Beta area</a> of the support forums or directly to <a href=\"https://core.trac.wordpress.org/newticket\">WordPress Trac</a> if you are comfortable writing a reproducible bug report. You can also check your issue against a list of <a href=\"https://core.trac.wordpress.org/tickets/major\">known bugs</a>.</p>\n\n\n\n<p>Curious about testing releases in general? Follow along with the <a href=\"https://make.wordpress.org/test/\">testing initiatives in Make Core</a> and join the <a href=\"https://wordpress.slack.com/messages/core-test/\">#core-test channel</a> on <a href=\"https://wordpress.slack.com/\">Making WordPress Slack</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Search for vulnerabilities</h3>\n\n\n\n<p>From now until the final release candidate of WordPress 6.5 (scheduled for March 19), the <a href=\"https://make.wordpress.org/security/2024/02/12/welcoming-2024-with-wordpress-6-5-beta-1/\">monetary reward for reporting new, unreleased security vulnerabilities</a> is doubled. Please follow responsible disclosure practices as detailed in the project’s security practices and policies outlined on the <a href=\"https://hackerone.com/wordpress\">HackerOne page</a> and in the <a href=\"https://wordpress.org/about/security/\">security white paper</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Update your theme or plugin</h3>\n\n\n\n<p>For plugin and theme authors, your products play an integral role in extending the functionality and value of WordPress for all users.&nbsp;</p>\n\n\n\n<p>Thanks for continuing to test your themes and plugins with the WordPress 6.5 beta releases. With RC1, you’ll want to conclude your testing and update the <em>“Tested up to”</em> version in your <a href=\"https://developer.wordpress.org/plugins/wordpress-org/how-your-readme-txt-works/\">plugin’s readme file</a> to 6.5.</p>\n\n\n\n<p>If you find compatibility issues, please post detailed information to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">support forum</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Help translate WordPress</h3>\n\n\n\n<p>Do you speak a language other than English? ¿Español? Français? Русский? 日本? हिन्दी? বাংলা? You can <a href=\"https://translate.wordpress.org/projects/wp/dev/\">help translate WordPress into more than 100 languages</a>. This release milestone (RC1) also marks the <a href=\"https://make.wordpress.org/polyglots/handbook/glossary/#hard-freeze\">hard string freeze</a> point of the 6.5 release cycle.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Release the haiku</h2>\n\n\n\n<p>What’s this? RC1?<br>Three weeks left until it’s done.<br>Come and test. It’s fun!</p>\n\n\n\n<p><em>Thank you to the following contributors for collaborating on this post: <a href=\'https://profiles.wordpress.org/dansoschin/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>dansoschin</a>,</em> <em><a href=\'https://profiles.wordpress.org/courane01/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>courane01</a>, <a href=\'https://profiles.wordpress.org/hellosatya/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>hellosatya</a>, <a href=\'https://profiles.wordpress.org/huzaifaalmesbah/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>huzaifaalmesbah</a></em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"17008\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:63:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:47:\"WordCamp Asia 2024: Q&amp;A with Matt Mullenweg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://wordpress.org/news/2024/03/wordcamp-asia-2024-qa-with-matt-mullenweg/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 04 Mar 2024 15:50:16 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:6:\"Events\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"WordCamp\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:6:\"WCAsia\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"https://wordpress.org/news/?p=17015\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:261:\"WordCamp Asia 2024 is just a few days away—starting on March 7 in Taipei, Taiwan. This three-day summit will feature a distinguished lineup of speakers, numerous networking opportunities, and a closing Q&#38;A session with WordPress co-founder Matt Mullenweg.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"Dan Soschin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3072:\"\n<figure class=\"wp-block-image size-large\"><img loading=\"lazy\" decoding=\"async\" width=\"1024\" height=\"299\" src=\"https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-logo.png?resize=1024%2C299&#038;ssl=1\" alt=\"WordCamp Asia 2024\" class=\"wp-image-17016\" srcset=\"https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-logo.png?resize=1024%2C299&amp;ssl=1 1024w, https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-logo.png?resize=300%2C87&amp;ssl=1 300w, https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-logo.png?resize=768%2C224&amp;ssl=1 768w, https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-logo.png?resize=1536%2C448&amp;ssl=1 1536w, https://i0.wp.com/wordpress.org/news/files/2024/03/wcasia-logo.png?resize=2048%2C597&amp;ssl=1 2048w\" sizes=\"(max-width: 1000px) 100vw, 1000px\" data-recalc-dims=\"1\" /></figure>\n\n\n\n<p>WordCamp Asia 2024 is just a few days away—starting on March 7 in Taipei, Taiwan. This unique three-day summit will feature a distinguished lineup of speakers, numerous networking opportunities, and a closing Q&amp;A experience with WordPress co-founder Matt Mullenweg. The live Q&amp;A session will be streamed for WordPress enthusiasts worldwide, beginning at 3:30 p.m. Taipei Standard Time (7:30 a.m. UTC) on Saturday, March 9, 2024.</p>\n\n\n\n<p>Watch the event live stream on the <a href=\"https://youtube.com/wordpress\">WordPress YouTube channel</a> or visit the <a href=\"https://asia.wordcamp.org/2024/\">event website</a> for more details.</p>\n\n\n\n<p><strong>What:</strong> Q&amp;A Session with Matt Mullenweg<br><strong>When: </strong>March 9, 2024 at 7:30 a.m. UTC (Start of live stream)<br><strong>Where: </strong><a href=\"https://asia.wordcamp.org/2024/location/\">Taipei International Convention Center<br></a><strong>Streaming: </strong><a href=\"https://youtube.com/wordpress\">Watch the live stream</a> on the WordPress YouTube channel.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Have a question for Matt?</h2>\n\n\n\n<p>If you want to participate, please submit your question via Slido from March 7 until about 6:00 a.m. UTC on Friday, March 8. <em>Slido is now closed.</em></p>\n\n\n\n<p>Given the expected volume of submitted questions, only some will be answered live, while others will be covered in a follow-up post published after the event on <a href=\"https://make.wordpress.org/project\">make.wordpress.org/project</a>.</p>\n\n\n\n<p>See you in-person and online on March 7!</p>\n\n\n\n<p>谢谢!</p>\n\n\n\n<hr class=\"wp-block-separator has-alpha-channel-opacity\" />\n\n\n\n<p><em>Thank you to <a href=\'https://profiles.wordpress.org/rmartinezduque/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>rmartinezduque</a>, <a href=\'https://profiles.wordpress.org/eidolonnight/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>eidolonnight</a>, <a href=\'https://profiles.wordpress.org/cbringmann/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>cbringmann</a>, and <a href=\'https://profiles.wordpress.org/bjmcsherry/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>bjmcsherry</a> for reviewing this post.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"17015\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:61:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:73:\"WP Briefing: Episode 74: Kickstart (Or Level-Up) Your Contributor Journey\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:93:\"https://wordpress.org/news/2024/03/episode-74-kickstart-or-level-up-your-contributor-journey/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 04 Mar 2024 12:00:00 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:7:\"Podcast\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:11:\"wp-briefing\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:53:\"https://wordpress.org/news/?post_type=podcast&p=17007\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:447:\"Explore the impact you can make on WordPress without coding in this WordPress Briefing episode hosted by Executive Director Josepha Haden Chomphosy. She\'ll guide you through diverse non-coding contributions suitable for all skill levels, including content translation, photo submissions, event organization, and software testing. Listen and discover how you can enhance the WordPress community in ways that align with your interests and expertise.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"enclosure\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"url\";s:51:\"https://wordpress.org/news/files/2024/03/WPB074.mp3\";s:6:\"length\";s:1:\"0\";s:4:\"type\";s:0:\"\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Brett McSherry\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:12311:\"\n<p>Explore the impact you can make on WordPress without coding in this WordPress Briefing episode hosted by Executive Director Josepha Haden Chomphosy. She&#8217;ll guide you through diverse non-coding contributions suitable for all skill levels, including content translation, photo submissions, event organization, and software testing. Listen and discover how you can enhance the WordPress community in ways that align with your interests and expertise.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Credits</h2>\n\n\n\n<p>Host: <a href=\"https://profiles.wordpress.org/chanthaboune/\">Josepha Haden Chomphosy</a><br>Editor: <a href=\"https://profiles.wordpress.org/dustinhartzler/\">Dustin Hartzler</a><br>Logo: <a href=\"https://profiles.wordpress.org/javiarce/\">Javier Arce</a><br>Production: <a href=\"https://profiles.wordpress.org/bjmcsherry/\">Brett McSherry</a>, <a href=\"https://profiles.wordpress.org/cbringmann/\">Chloé Bringmann</a><br>Song: Fearless First by Kevin MacLeod</p>\n\n\n\n<h2 class=\"wp-block-heading\">Show Notes</h2>\n\n\n\n<ul>\n<li><a href=\"https://asia.wordcamp.org/2024/\">WordCamp Asia 2024</a>\n<ul>\n<li><a href=\"https://asia.wordcamp.org/2024/contributor-day/\">Contributor Day</a></li>\n</ul>\n</li>\n\n\n\n<li><a href=\"https://wordpress.org/photos/\">WordPress Photo Directory</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/polyglots/\">Polyglots</a></li>\n\n\n\n<li><a href=\"https://wordpress.org/support/forums/\">WordPress Support Forums</a></li>\n\n\n\n<li><a href=\"https://events.wordpress.org/\">Upcoming WordPress Events</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/test/\">Make WordPress Testing</a></li>\n\n\n\n<li><a href=\"https://learn.wordpress.org/\">Learn WordPress</a></li>\n\n\n\n<li><strong>Small List of Big Things</strong>\n<ul>\n<li><a href=\"https://wordpress.org/news/2024/02/2023-annual-survey-results-and-next-steps/\" target=\"_blank\" rel=\"noreferrer noopener\">2023 Annual Survey Results and Next Steps</a>&nbsp; </li>\n\n\n\n<li><a href=\"https://make.wordpress.org/community/2024/01/22/proposal-pilot-program-to-test-gatherpress-on-the-wordpress-org-network-as-a-meetup-alternative/\" target=\"_blank\" rel=\"noreferrer noopener\">Gather Press Pilot Program</a>&nbsp;</li>\n</ul>\n</li>\n</ul>\n\n\n\n<h2 class=\"wp-block-heading\">Transcripts</h2>\n\n\n\n<p>[00:00:00]&nbsp;<strong>Josepha:</strong>&nbsp;Hello, everyone, and welcome to the WordPress Briefing, the podcast where you can catch quick explanations of the ideas behind the WordPress open source project, some insight into the community that supports it, and get a small list of big things coming up in the next two weeks. I&#8217;m your host, Josepha Haden Chomphosy. Here we go.&nbsp;</p>\n\n\n\n<p>[00:00:29] (Intro music)&nbsp;</p>\n\n\n\n<p>[00:00:40]&nbsp;<strong>Josepha:</strong> At the end of this week, WordCamp Asia is happening. It&#8217;s one of our largest events dedicated to WordPress, and it will cover a wide range of topics. From advanced concepts like running thriving businesses to more beginner things like building your first theme, there is bound to be something for you at this event.</p>\n\n\n\n<p>For folks who have the opportunity to attend in person, you might also be going to your first-ever Contributor Day. Now, as much as I want there to be something for everyone there, I recognize that it&#8217;s a little more frenetic than your average WordPress event. It&#8217;s not any less welcoming than the event that has like a schedule and, tracks, and rooms.</p>\n\n\n\n<p>[00:01:19] <strong>Josepha:</strong> But in my experience of any group of open source contributors, they get really excited when they are tackling problems together. And that&#8217;s most of what happens at a Contributor Day. It can make it a little difficult to see how you can join in. But never fear; the crew at the WordPress Briefing has you covered. We&#8217;ve got a couple of ways you can contribute immediately, no code required, and a handful of good next steps when you&#8217;re feeling comfortable and ready to level up.</p>\n\n\n\n<p>For total beginners, so you&#8217;ve got a WordPress site, or you know, you&#8217;re about to launch one. And you&#8217;re here to learn and meet people and hopefully find someone who answers the questions you feel too shy to mention in public.</p>\n\n\n\n<p>So these two ways of contribution are for you. First, you can contribute photos. WordPress has a photo directory for openly licensed photos, which are included in Openverse searches. Users can submit photographs to be used by folks all over the world. There are some basic guidelines, such as no faces or identifying characteristics. It can&#8217;t be overly edited or processed, but even photos taken on a smartphone are accepted. Because we understand that the best camera is the one you have on you.</p>\n\n\n\n<p>[00:02:30] <strong>Josepha</strong>: You can also contribute translations. If you speak a language other than English, you can visit <code>translate.WordPress.org</code> and help translate not only the WordPress software but also plugins, themes, and other parts of the WordPress project into your native language. Since more than half of all WordPress installations are in non-English languages, adding or improving translations is really impactful. We are actually at WordCamp Asia trialing a new self-serve translation day process. So that&#8217;s a great place to have a double impact.</p>\n\n\n\n<p>[00:03:03] <strong>Josepha:</strong> So those are your two completely code-free ways that you can contribute, completely beginner friendly ways to contribute at Contributor Day coming up later this week. And then for your next steps, so say that you&#8217;ve had your site for a while, you are an absolute expert in the admin, you&#8217;ve had to answer a few tough questions for yourself, you&#8217;ve watched a lot of tutorials, and so now you&#8217;re thinking of ways you can share that knowledge.</p>\n\n\n\n<p>[00:03:29] <strong>Josepha:</strong> Here are a few ways that you can exercise your new knowledge and really solidify it in your brain. </p>\n\n\n\n<p>Firstly, you can contribute help. Supporting other WordPress users is a great way to give back to WordPress. This can involve answering questions, providing guidance, or even providing the right resources to users. You can check out the WordPress support forums for more information, and they actually have a dedicated support team as well that works toward making sure that WordPress users have answers to the questions they are asking. You can head over to WordPress.org/support/forums and just pick an appropriate area for you, something that you are currently an expert in, and start answering questions. Start contributing.</p>\n\n\n\n<p>[00:04:10] <strong>Josepha:</strong> Second thing you can do is you can contribute patterns. So WordPress has a dedicated Patterns directory, which stores a list of Block patterns. So custom designs that were created using blocks in Gutenberg that then can be used across any WordPress site, anyone&#8217;s WordPress site. You can submit those patterns, any pattern that you built, to the directory, and then they can be used by people all around the world. Basically, like anything with WordPress, if you put it in there, it can be used by anyone all around the world.&nbsp;</p>\n\n\n\n<p>The third thing is that you can contribute events. This is one of my favorite ways to contribute. Organizing in person events to an extent has no code requirement to it, but also it does kind of require that you have a good understanding of your local community and have a willingness to get out there and build your network.&nbsp;</p>\n\n\n\n<p>WordPress is where it is today thanks to its excellent community and all the lovely in-person events that happen all over the world. They bring our community together, and anyone can contribute by helping to organize just a small gathering or support an in-person event.</p>\n\n\n\n<p>[00:05:13] <strong>Josepha:</strong> The fourth way that you can level up your contributions is to contribute by breaking things. I know that sounds weird, but testing the software to see where it breaks is actually a really valuable contribution. It&#8217;s as easy as downloading the WordPress beta tester plugin and the test reports plugin to a WordPress installation, Preferably a testing one, not one that&#8217;s currently publicly in use. But you can test out the newest version of WordPress before the release and provide useful feedback to the development team.&nbsp;</p>\n\n\n\n<p>And the fifth way that you can level up your contribution is to contribute learning. Not that you are learning as a contribution, but what one person can learn through a tutorial or documentation, another person has to learn through discussion and hands-on learning.</p>\n\n\n\n<p>This team, the folks over at <code>learn.WordPress.org</code>, they are the official team and official learning platform and resource for WordPress. They host video tutorials. Yes, but also host live online workshops, courses and even provide lesson plans on different topics related to WordPress. So if you are an educator or otherwise really like to help spread knowledge around, pass around the knowledge that has been hard-earned by you, this is an excellent opportunity.</p>\n\n\n\n<p>[00:06:28] <strong>Josepha:</strong> And of course, if you are brave and afraid of nothing, then you can just go to Contributor Day and move from table to table until something sounds interesting to you. You don&#8217;t have to have a plan. Your whole plan can absolutely be to wander until you are found.</p>\n\n\n\n<p>[00:06:45] (Music interlude)&nbsp;</p>\n\n\n\n<p>[00:06:52] <strong>Josepha:</strong> That brings us now to our small list of big things. It&#8217;s actually a very small list today. I&#8217;ve got two things on it.</p>\n\n\n\n<p>[00:07:00] <strong>Josepha:</strong> The first is that a couple of weeks back, we published the results from the 2023 annual survey. So, each year, we collect some high-level data about trends and themes across this vast ecosystem of users and site builders, people who extend WordPress core, and contributors who build WordPress core to help inform decision-making and provide valuable feedback on the project status. I looked at the results from our last survey. We had a bit of an increase in the respondents, not as much as we would have liked, but still a little bit greater number than we had in the past couple of years. And I have a lot of questions myself about what we are doing compared to what we are being asked to do and so go take a look at the blog post that has some highlights from it. It&#8217;s got a couple of contextual pieces of information in there as well, and come with your questions to WordCamps around the world or ask them in community meetings as you find them.&nbsp;</p>\n\n\n\n<p>[00:07:58] <strong>Josepha:</strong> And then the second thing is actually that we have kind of a pilot program going on. There&#8217;s a proposal out right now about GatherPress. It&#8217;s a group of community leaders that have built a tool, a community plugin, to help gather WordPress events a bit better and a bit more &#8220;open source-ely&#8221;. It&#8217;s open currently to anyone who is running a WordPress meetup group that is interested in learning more about how a WordPress-first and open source first community gathering tool might look.</p>\n\n\n\n<p>[00:08:32] <strong>Josepha:</strong> I&#8217;ll have a link to the proposal in the show notes that&#8217;ll give you more detailed information and give you an opportunity to figure out how you can join that pilot and help us figure out whether it will work or not ultimately for WordPress.&nbsp;</p>\n\n\n\n<p>And that, my friends, is your small list of big things. Don&#8217;t forget to follow us on your favorite podcast app or subscribe directly on <code>WordPress.org/news</code>. You&#8217;ll get a friendly reminder whenever there&#8217;s a new episode. If you liked what you heard today, share it with a fellow WordPresser or fellow brand new WordCamper. But if you had questions about what you heard, you can share those with me at <code>wpbriefing@WordPress.org</code>. I&#8217;m your host, Josepha Haden Chomphosy.</p>\n\n\n\n<p>[00:09:13] <strong>Josepha:</strong> Thanks again for tuning in today for the WordPress Briefing, and I&#8217;ll see you again in a couple of weeks.&nbsp;</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"17007\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:69:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 6.5 Beta 3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2024/02/wordpress-6-5-beta-3/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 27 Feb 2024 16:27:30 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:5:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"6.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:11:\"development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:4;a:5:{s:4:\"data\";s:8:\"releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"https://wordpress.org/news/?p=16992\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:301:\"WordPress 6.5 Beta 3 is now ready for download and testing!\n\nThis version of the WordPress software is under development. Please do not install, run, or test this version of WordPress on production or mission-critical websites. Instead, it is recommended you evaluate Beta 3 on a test server and site.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Lauren Stein\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:10983:\"\n<p>WordPress 6.5 Beta 3 is here and ready for testing!</p>\n\n\n\n<p><strong>This beta version of the WordPress software is under development</strong>. Please do not install, run, or test this version of WordPress on production or mission-critical websites. Instead, it is recommended you evaluate Beta 3 on a test server and site.</p>\n\n\n\n<p>You can test WordPress 6.5 Beta 3 in four ways:</p>\n\n\n\n<figure class=\"wp-block-table\"><table><tbody><tr><th>Plugin</th><td>Install and activate the <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> plugin on a WordPress install. (Select the “Bleeding edge” channel and “Beta/RC Only” stream).</td></tr><tr><th>Direct Download</th><td>Download the <a href=\"https://wordpress.org/wordpress-6.5-beta3.zip\" data-type=\"link\" data-id=\"https://wordpress.org/wordpress-6.5-beta3.zip\">Beta 3 version (zip)</a> and install it on a WordPress website.</td></tr><tr><th>Command Line</th><td>Use the following <a href=\"https://make.wordpress.org/cli/\">WP-CLI</a> command:<br><code>wp core update --version=6.5-beta</code>3</td></tr><tr><th>WordPress Playground</th><td>Use the <a href=\"https://playground.wordpress.net/#{%20%22preferredVersions%22:%20{%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20},%20%22features%22:%20{%20%22networking%22:%20true%20},%20%22steps%22:%20[%20{%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20}%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20},%20%22options%22:%20{%20%22activate%22:%20false%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20}%20]%20}\" data-type=\"link\" data-id=\"https://playground.wordpress.net/#{%20%22preferredVersions%22:%20{%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20},%20%22features%22:%20{%20%22networking%22:%20true%20},%20%22steps%22:%20[%20{%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20}%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20},%20%22options%22:%20{%20%22activate%22:%20false%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20}%20]%20}\">6.5 Beta 3 WordPress Playground instance</a> to test the software directly in your browser without the need for a separate site or setup.&nbsp;</td></tr></tbody></table></figure>\n\n\n\n<p>The current target date for the final release of WordPress 6.5 is <strong>March 26, 2024</strong>. That&#8217;s only four weeks away! Get an overview of the <a href=\"https://make.wordpress.org/core/6-5/\">6.5 release cycle</a>, and check the <a href=\"https://make.wordpress.org/core/\">Make WordPress Core blog</a> for <a href=\"https://make.wordpress.org/core/tag/6-5/\">6.5-related posts</a> in the coming weeks for more information.</p>\n\n\n\n<p class=\"is-style-default\"><strong>Catch up on what&#8217;s new in WordPress 6.5</strong>: <a href=\"https://wordpress.org/news/2024/02/wordpress-6-5-beta-1/\">Read the Beta 1 announcement</a> for details and highlights.</p>\n\n\n\n<h2 class=\"wp-block-heading\">How to test this release</h2>\n\n\n\n<p>Your help testing the WordPress 6.5 Beta 3 version is key to ensuring everything in the release is the best it can be. While testing the upgrade process is essential, trying out new features is equally important. <a href=\"https://make.wordpress.org/test/2024/02/28/help-test-wordpress-beta-3/\" data-type=\"link\" data-id=\"https://make.wordpress.org/test/2024/02/15/help-test-wordpress-6-5-beta-1/\">This detailed guide</a> will walk you through testing features in WordPress 6.5. For those new to testing, follow <a href=\"https://make.wordpress.org/test/2024/02/15/help-test-wordpress-6-5-beta-1\" data-type=\"link\" data-id=\"https://make.wordpress.org/test/2024/02/15/help-test-wordpress-6-5-beta-1\">this general testing guide</a> for more details on getting set up. </p>\n\n\n\n<p>If you encounter an issue, please report it to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">Alpha/Beta area</a> of the support forums or directly to <a href=\"https://core.trac.wordpress.org/newticket\">WordPress Trac</a> if you are comfortable writing a reproducible bug report. You can also check your issue against a list of <a href=\"https://core.trac.wordpress.org/tickets/major\">known bugs</a>.</p>\n\n\n\n<p>Curious about testing releases in general? Follow along with the <a href=\"https://make.wordpress.org/test/\">testing initiatives in Make Core</a> and join the <a href=\"https://wordpress.slack.com/messages/core-test/\">#core-test channel</a> on <a href=\"https://wordpress.slack.com/\">Making WordPress Slack</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Vulnerability bounty doubles during Beta/RC</h2>\n\n\n\n<p>Between Beta 1, released on February 13, and the final Release Candidate (RC) scheduled for March 19, the <a href=\"https://make.wordpress.org/security/2024/02/12/welcoming-2024-with-wordpress-6-5-beta-1/\">monetary reward for reporting new, unreleased security vulnerabilities</a> is doubled. Please follow responsible disclosure practices as detailed in the project’s security practices and policies outlined on the <a href=\"https://hackerone.com/wordpress\">HackerOne page</a> and in the <a href=\"https://wordpress.org/about/security/\">security white paper</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Beta 3 updates and highlights</h2>\n\n\n\n<p>WordPress 6.5 Beta 3 contains more than 45 updates to the Editor since the Beta 2 release, including more than 35 <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=02%2F21%2F2024..02%2F27%2F2024&amp;milestone=6.5&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\" data-type=\"link\" data-id=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=02%2F21%2F2024..02%2F27%2F2024&amp;milestone=6.5&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">tickets for WordPress Core</a>.</p>\n\n\n\n<p>Each beta cycle focuses on bug fixes; more are on the way with your help through testing. You can browse the technical details for all issues addressed since Beta 2 using these links:</p>\n\n\n\n<ul>\n<li><a href=\"https://github.com/WordPress/gutenberg/commits/wp/6.5?since=2024-02-21&amp;until=2024-02-27\" data-type=\"link\" data-id=\"https://github.com/WordPress/gutenberg/commits/wp/6.5?since=2024-02-14&amp;until=2024-02-20\">GitHub commits for 6.5</a> since February 21</li>\n\n\n\n<li><a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=02%2F21%2F2024..02%2F27%2F2024&amp;milestone=6.5&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">Closed Trac tickets</a> since February 21</li>\n</ul>\n\n\n\n<h2 class=\"wp-block-heading\">Double the haiku for Beta 3</h2>\n\n\n\n<p>Find a Beta bug,<br>it will help the team a lot,<br>and improve WordPress!<br><em>&#8211; submitted by</em> <em><a href=\'https://profiles.wordpress.org/lada7042/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>lada7042</a></em></p>\n\n\n\n<p>In code, dreams are bold,<br>WordPress&#8217;s story unfolds,<br>Beta journey&#8217;s told.<br><em>&#8211; submitted by <a href=\'https://profiles.wordpress.org/huzaifaalmesbah/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>huzaifaalmesbah</a></em></p>\n\n\n\n<p><em>Thank you to the following contributors for collaborating on this post: <a href=\'https://profiles.wordpress.org/dansoschin/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>dansoschin</a></em>, <em><a href=\'https://profiles.wordpress.org/swissspidy/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>swissspidy</a>, <a href=\'https://profiles.wordpress.org/adarshposimyth/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>adarshposimyth</a></em>, <em><a href=\'https://profiles.wordpress.org/davidbaumwald/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>davidbaumwald</a></em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"16992\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:69:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 6.5 Beta 2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2024/02/wordpress-6-5-beta-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 20 Feb 2024 17:25:18 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:5:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"6.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:11:\"development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:4;a:5:{s:4:\"data\";s:8:\"releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"https://wordpress.org/news/?p=16955\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:301:\"WordPress 6.5 Beta 2 is now ready for download and testing!\n\nThis version of the WordPress software is under development. Please do not install, run, or test this version of WordPress on production or mission-critical websites. Instead, it is recommended you evaluate Beta 2 on a test server and site.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Lauren Stein\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:10039:\"\n<p>WordPress 6.5 Beta 2 is now ready for testing!</p>\n\n\n\n<p><strong>This beta version of the WordPress software is under development</strong>. Please do not install, run, or test this version of WordPress on production or mission-critical websites. Instead, it is recommended you evaluate Beta 2 on a test server and site.</p>\n\n\n\n<p>You can test WordPress 6.5 Beta 2 in four ways:</p>\n\n\n\n<figure class=\"wp-block-table\"><table><tbody><tr><th>Plugin</th><td>Install and activate the <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> plugin on a WordPress install. (Select the “Bleeding edge” channel and “Beta/RC Only” stream).</td></tr><tr><th>Direct Download</th><td>Download the <a href=\"https://wordpress.org/wordpress-6.5-beta2.zip\">Beta 2 version (zip)</a> and install it on a WordPress website.</td></tr><tr><th>Command Line</th><td>Use the following <a href=\"https://make.wordpress.org/cli/\">WP-CLI</a> command:<br><code>wp core update --version=6.5-beta</code>2</td></tr><tr><th>WordPress Playground</th><td>Use the <a href=\"https://playground.wordpress.net/#{%20%22preferredVersions%22:%20{%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20},%20%22features%22:%20{%20%22networking%22:%20true%20},%20%22steps%22:%20[%20{%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20}%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20},%20%22options%22:%20{%20%22activate%22:%20false%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20}%20]%20}\" data-type=\"link\" data-id=\"https://playground.wordpress.net/#{%20%22preferredVersions%22:%20{%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20},%20%22features%22:%20{%20%22networking%22:%20true%20},%20%22steps%22:%20[%20{%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20}%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20},%20%22options%22:%20{%20%22activate%22:%20false%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20}%20]%20}\">6.5 Beta 2 WordPress Playground instance</a> to test the software directly in your browser without the need for a separate site or setup.&nbsp;</td></tr></tbody></table></figure>\n\n\n\n<p>The current target date for the final release of WordPress 6.5 is <strong>March 26, 2024</strong>. Get an overview of the <a href=\"https://make.wordpress.org/core/6-5/\">6.5 release cycle</a>, and check the <a href=\"https://make.wordpress.org/core/\">Make WordPress Core blog</a> for <a href=\"https://make.wordpress.org/core/tag/6-5/\">6.5-related posts</a> in the coming weeks for more information.</p>\n\n\n\n<p class=\"is-style-default\"><strong>Catch up on what&#8217;s new in WordPress 6.5</strong>: <a href=\"https://wordpress.org/news/2024/02/wordpress-6-5-beta-1/\">Read the Beta 1 announcement</a> for details and highlights.</p>\n\n\n\n<h2 class=\"wp-block-heading\">How to test this release</h2>\n\n\n\n<p>Your help testing the WordPress 6.5 Beta 2 version is key to ensuring everything in the release is the best it can be. While testing the upgrade process is essential, trying out new features is equally important. <a href=\"https://make.wordpress.org/test/2024/02/15/help-test-wordpress-6-5-beta-1/\" data-type=\"link\" data-id=\"https://make.wordpress.org/test/2024/02/15/help-test-wordpress-6-5-beta-1/\">This detailed guide</a> will walk you through testing features in WordPress 6.5.</p>\n\n\n\n<p>If you encounter an issue, please report it to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">Alpha/Beta area</a> of the support forums or directly to <a href=\"https://core.trac.wordpress.org/newticket\">WordPress Trac</a> if you are comfortable writing a reproducible bug report. You can also check your issue against a list of <a href=\"https://core.trac.wordpress.org/tickets/major\">known bugs</a>.</p>\n\n\n\n<p>Curious about testing releases in general? Follow along with the <a href=\"https://make.wordpress.org/test/\">testing initiatives in Make Core</a> and join the <a href=\"https://wordpress.slack.com/messages/core-test/\">#core-test channel</a> on <a href=\"https://wordpress.slack.com/\">Making WordPress Slack</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Vulnerability bounty doubles during Beta 2</h2>\n\n\n\n<p>Between Beta 1, released on February 13, and the final Release Candidate (RC) scheduled for March 19, the <a href=\"https://make.wordpress.org/security/2024/02/12/welcoming-2024-with-wordpress-6-5-beta-1/\">monetary reward for reporting new, unreleased security vulnerabilities</a> is doubled. Please follow responsible disclosure practices as detailed in the project’s security practices and policies outlined on the <a href=\"https://hackerone.com/wordpress\">HackerOne page</a> and in the <a href=\"https://wordpress.org/about/security/\">security white paper</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Beta 2 updates and highlights</h2>\n\n\n\n<p>WordPress 6.5 Beta 2 contains more than 50 updates to the Editor since the Beta 1 release, including 40+ <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=02%2F14%2F2024..02%2F19%2F2024&amp;milestone=6.5&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">tickets for WordPress core</a>.</p>\n\n\n\n<p>Each beta cycle focuses on bug fixes; more are on the way with your help through testing. You can browse the technical details for all issues addressed since Beta 1 using these links:</p>\n\n\n\n<ul>\n<li><a href=\"https://github.com/WordPress/gutenberg/commits/wp/6.5?since=2024-02-14&amp;until=2024-02-20\" data-type=\"link\" data-id=\"https://github.com/WordPress/gutenberg/commits/wp/6.5?since=2024-02-14&amp;until=2024-02-20\">GitHub commits for 6.5</a> since February 14</li>\n\n\n\n<li><a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=02%2F14%2F2024..02%2F20%2F2024&amp;milestone=6.5&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">Closed Trac tickets</a> since February 14</li>\n</ul>\n\n\n\n<h2 class=\"wp-block-heading\">A Beta 2 haiku</h2>\n\n\n\n<p>Help out with testing<br>Contribute! Make an impact<br>Let’s find all those bugs</p>\n\n\n\n<p><em>Thank you to the following contributors for collaborating on this post: <a href=\'https://profiles.wordpress.org/dansoschin/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>dansoschin</a></em>, <em><a href=\'https://profiles.wordpress.org/huzaifaalmesbah/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>huzaifaalmesbah</a></em>, <em><a href=\'https://profiles.wordpress.org/rajinsharwar/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>rajinsharwar</a>, <a href=\'https://profiles.wordpress.org/swissspidy/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>swissspidy</a>, <a href=\'https://profiles.wordpress.org/courane01/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>courane01</a>.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"16955\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:32:\"https://wordpress.org/news/feed/\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"\n	hourly	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"\n	1	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:4:\"site\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"14607090\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:48:\"WpOrg\\Requests\\Utility\\CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:12:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Thu, 21 Mar 2024 05:19:41 GMT\";s:12:\"content-type\";s:34:\"application/rss+xml; charset=UTF-8\";s:4:\"vary\";s:15:\"Accept-Encoding\";s:25:\"strict-transport-security\";s:12:\"max-age=3600\";s:6:\"x-olaf\";s:3:\"⛄\";s:13:\"last-modified\";s:29:\"Tue, 19 Mar 2024 16:19:30 GMT\";s:4:\"link\";s:63:\"<https://wordpress.org/news/wp-json/>; rel=\"https://api.w.org/\"\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:16:\"content-encoding\";s:4:\"gzip\";s:7:\"alt-svc\";s:19:\"h3=\":443\"; ma=86400\";s:4:\"x-nc\";s:9:\"HIT ord 2\";}}s:5:\"build\";s:14:\"20211220193300\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1181, '_transient_timeout_feed_mod_9bbd59226dc36b9b26cd43f15694c5c3', '1711041582', 'no'),
(1182, '_transient_feed_mod_9bbd59226dc36b9b26cd43f15694c5c3', '1710998382', 'no'),
(1183, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1711041584', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1185, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1711041584', 'no'),
(1186, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1710998384', 'no'),
(1187, '_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b', '1711041584', 'no'),
(1188, '_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b', '<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2024/03/wordpress-6-5-release-candidate-3/\'>WordPress 6.5 Release Candidate 3</a></li><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2024/03/episode-75-wordcamp-asia-2024-unwrapped/\'>WP Briefing: Episode 75: WordCamp Asia 2024 Unwrapped</a></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://akismet.com/blog/version-5-3-2-of-the-akismet-wordpress-plugin-is-now-available/\'>Akismet: Version 5.3.2 of the Akismet WordPress plugin is now available</a></li><li><a class=\'rsswidget\' href=\'https://wptavern.com/podcast/112-miriam-schwab-on-balancing-wordpress-success-and-family-life\'>WPTavern: #112 – Miriam Schwab on Balancing WordPress Success and Family Life</a></li><li><a class=\'rsswidget\' href=\'https://akismet.com/blog/best-lead-generation-tools/\'>Akismet: 8 Best Lead Generation Tools to Capture More Leads in 2024</a></li></ul></div>', 'no'),
(1200, '_site_transient_timeout_theme_roots', '1711027868', 'no'),
(1201, '_site_transient_theme_roots', 'a:4:{s:9:\"ecommerce\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";s:15:\"twentytwentytwo\";s:7:\"/themes\";}', 'no'),
(1203, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1711026077;s:8:\"response\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"5.3.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.5.3.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";s:6:\"tested\";s:5:\"6.4.3\";s:12:\"requires_php\";s:6:\"5.6.20\";s:16:\"requires_plugins\";a:0:{}}s:15:\"wpide/wpide.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:19:\"w.org/plugins/wpide\";s:4:\"slug\";s:5:\"wpide\";s:6:\"plugin\";s:15:\"wpide/wpide.php\";s:11:\"new_version\";s:5:\"3.4.8\";s:3:\"url\";s:36:\"https://wordpress.org/plugins/wpide/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/wpide.3.4.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:58:\"https://ps.w.org/wpide/assets/icon-256x256.png?rev=2769504\";s:2:\"1x\";s:58:\"https://ps.w.org/wpide/assets/icon-128x128.png?rev=2769504\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/wpide/assets/banner-1544x500.png?rev=2763745\";s:2:\"1x\";s:60:\"https://ps.w.org/wpide/assets/banner-772x250.png?rev=2763745\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";s:6:\"tested\";s:5:\"6.4.3\";s:12:\"requires_php\";s:5:\"7.4.0\";s:16:\"requires_plugins\";a:0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:43:\"custom-post-type-ui/custom-post-type-ui.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:33:\"w.org/plugins/custom-post-type-ui\";s:4:\"slug\";s:19:\"custom-post-type-ui\";s:6:\"plugin\";s:43:\"custom-post-type-ui/custom-post-type-ui.php\";s:11:\"new_version\";s:6:\"1.15.1\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/custom-post-type-ui/\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/plugin/custom-post-type-ui.1.15.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/custom-post-type-ui/assets/icon-256x256.png?rev=2744389\";s:2:\"1x\";s:72:\"https://ps.w.org/custom-post-type-ui/assets/icon-128x128.png?rev=2744389\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/custom-post-type-ui/assets/banner-1544x500.png?rev=2744389\";s:2:\"1x\";s:74:\"https://ps.w.org/custom-post-type-ui/assets/banner-772x250.png?rev=2744389\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.3\";}s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}s:7:\"checked\";a:5:{s:19:\"akismet/akismet.php\";s:5:\"5.3.1\";s:43:\"custom-post-type-ui/custom-post-type-ui.php\";s:6:\"1.15.1\";s:9:\"hello.php\";s:5:\"1.7.2\";s:43:\"user-authentication/user-authentication.php\";s:5:\"1.0.0\";s:15:\"wpide/wpide.php\";s:3:\"2.5\";}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(9, 1, '_edit_lock', '1707375645:1'),
(10, 11, '_edit_lock', '1707375672:1'),
(18, 11, '_wp_old_slug', 'wordpress__trashed'),
(20, 14, '_edit_lock', '1710843963:1'),
(22, 17, '_wp_attached_file', '2024/02/opb7YuFp7SBrX-xxlarge-1.jpg'),
(23, 17, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:800;s:6:\"height\";i:800;s:4:\"file\";s:35:\"2024/02/opb7YuFp7SBrX-xxlarge-1.jpg\";s:8:\"filesize\";i:23826;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(26, 23, '_edit_last', '1'),
(27, 23, '_edit_lock', '1709725214:1'),
(28, 23, '_thumbnail_id', '163'),
(29, 28, '_wp_attached_file', '2024/02/11.jpg'),
(30, 28, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:800;s:4:\"file\";s:14:\"2024/02/11.jpg\";s:8:\"filesize\";i:110438;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(31, 28, '_edit_lock', '1707820800:1'),
(35, 23, 'ecommerce_price', '1000'),
(36, 23, 'ecommerce_saleprice', '2000'),
(38, 23, 'ecommerce_sale_price', '2000'),
(39, 36, '_edit_last', '1'),
(40, 36, '_edit_lock', '1710325078:1'),
(41, 36, 'ecommerce_price', '2500'),
(42, 36, 'ecommerce_sale_price', '3000'),
(43, 37, '_edit_last', '1'),
(44, 37, 'ecommerce_price', '2500'),
(45, 37, 'ecommerce_sale_price', '3000'),
(46, 37, '_edit_lock', '1709725194:1'),
(47, 39, '_wp_attached_file', '2024/02/img-2.jpg'),
(48, 39, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:192;s:6:\"height\";i:128;s:4:\"file\";s:17:\"2024/02/img-2.jpg\";s:8:\"filesize\";i:6941;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(49, 36, '_thumbnail_id', '66'),
(50, 40, '_wp_attached_file', '2024/02/template-5.jpg'),
(51, 40, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:3000;s:6:\"height\";i:4500;s:4:\"file\";s:22:\"2024/02/template-5.jpg\";s:8:\"filesize\";i:2754561;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(52, 37, '_thumbnail_id', '170'),
(138, 52, '_edit_lock', '1708430476:1'),
(229, 65, '_wp_attached_file', '2024/02/watch.webp'),
(230, 65, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:800;s:6:\"height\";i:800;s:4:\"file\";s:18:\"2024/02/watch.webp\";s:8:\"filesize\";i:35964;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(231, 66, '_wp_attached_file', '2024/02/shoes.jpg'),
(232, 66, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:225;s:6:\"height\";i:225;s:4:\"file\";s:17:\"2024/02/shoes.jpg\";s:8:\"filesize\";i:3518;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(233, 67, '_wp_attached_file', '2024/02/shampoo.jpg'),
(234, 67, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:225;s:6:\"height\";i:225;s:4:\"file\";s:19:\"2024/02/shampoo.jpg\";s:8:\"filesize\";i:7171;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(243, 74, '_edit_lock', '1710745319:1'),
(244, 14, '_edit_last', '1'),
(245, 77, '_edit_lock', '1710843605:1'),
(264, 81, '_menu_item_type', 'post_type'),
(265, 81, '_menu_item_menu_item_parent', '0'),
(266, 81, '_menu_item_object_id', '74'),
(267, 81, '_menu_item_object', 'page'),
(268, 81, '_menu_item_target', ''),
(269, 81, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(270, 81, '_menu_item_xfn', ''),
(271, 81, '_menu_item_url', ''),
(273, 82, '_menu_item_type', 'post_type'),
(274, 82, '_menu_item_menu_item_parent', '0'),
(275, 82, '_menu_item_object_id', '14'),
(276, 82, '_menu_item_object', 'page'),
(277, 82, '_menu_item_target', ''),
(278, 82, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(279, 82, '_menu_item_xfn', ''),
(280, 82, '_menu_item_url', ''),
(302, 86, '_menu_item_type', 'post_type'),
(303, 86, '_menu_item_menu_item_parent', '0'),
(304, 86, '_menu_item_object_id', '77'),
(305, 86, '_menu_item_object', 'page'),
(306, 86, '_menu_item_target', ''),
(307, 86, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(308, 86, '_menu_item_xfn', ''),
(309, 86, '_menu_item_url', ''),
(338, 90, '_wp_attached_file', '2024/02/imgpsh_fullsize_anim.png'),
(339, 90, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:499;s:6:\"height\";i:499;s:4:\"file\";s:32:\"2024/02/imgpsh_fullsize_anim.png\";s:8:\"filesize\";i:62075;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(340, 90, '_wp_attachment_custom_header_last_used_ecommerce', '1708408859'),
(341, 90, '_wp_attachment_is_custom_header', 'ecommerce'),
(353, 94, '_edit_lock', '1709030166:1'),
(354, 94, '_wp_page_template', 'template-cart.php'),
(355, 97, '_menu_item_type', 'post_type_archive'),
(356, 97, '_menu_item_menu_item_parent', '0'),
(357, 97, '_menu_item_object_id', '-17'),
(358, 97, '_menu_item_object', 'product'),
(359, 97, '_menu_item_target', ''),
(360, 97, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(361, 97, '_menu_item_xfn', ''),
(362, 97, '_menu_item_url', ''),
(364, 81, '_wp_old_date', '2024-02-19'),
(365, 86, '_wp_old_date', '2024-02-19'),
(366, 82, '_wp_old_date', '2024-02-19'),
(367, 98, '_menu_item_type', 'post_type'),
(368, 98, '_menu_item_menu_item_parent', '0'),
(369, 98, '_menu_item_object_id', '94'),
(370, 98, '_menu_item_object', 'page'),
(371, 98, '_menu_item_target', ''),
(372, 98, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(373, 98, '_menu_item_xfn', ''),
(374, 98, '_menu_item_url', ''),
(376, 99, '_edit_last', '1'),
(377, 99, '_edit_lock', '1709725184:1'),
(378, 100, '_wp_attached_file', '2024/02/1111.jpg'),
(379, 100, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:320;s:6:\"height\";i:320;s:4:\"file\";s:16:\"2024/02/1111.jpg\";s:8:\"filesize\";i:38101;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(380, 99, '_thumbnail_id', '167'),
(381, 99, 'ecommerce_price', '700'),
(382, 99, 'ecommerce_sale_price', '400'),
(383, 101, '_edit_last', '1'),
(384, 101, 'ecommerce_price', '85000'),
(385, 101, 'ecommerce_sale_price', '75000'),
(386, 101, '_edit_lock', '1709201823:1'),
(387, 102, '_wp_attached_file', '2024/02/i.jpg'),
(388, 102, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:320;s:6:\"height\";i:320;s:4:\"file\";s:13:\"2024/02/i.jpg\";s:8:\"filesize\";i:8929;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(389, 101, '_thumbnail_id', '102'),
(390, 103, '_edit_lock', '1709201222:1'),
(391, 103, '_wp_page_template', 'checkout.php'),
(392, 107, '_edit_lock', '1709040802:1'),
(393, 110, '_wp_trash_meta_status', 'draft'),
(394, 110, '_wp_trash_meta_time', '1709041093'),
(395, 110, '_wp_desired_post_slug', ''),
(396, 109, '_wp_trash_meta_status', 'draft'),
(397, 109, '_wp_trash_meta_time', '1709041095'),
(398, 109, '_wp_desired_post_slug', ''),
(399, 107, '_wp_trash_meta_status', 'draft'),
(400, 107, '_wp_trash_meta_time', '1709041096'),
(401, 107, '_wp_desired_post_slug', ''),
(402, 108, '_wp_trash_meta_status', 'draft'),
(403, 108, '_wp_trash_meta_time', '1709041097'),
(404, 108, '_wp_desired_post_slug', ''),
(405, 111, '_wp_trash_meta_status', 'draft'),
(406, 111, '_wp_trash_meta_time', '1709041098'),
(407, 111, '_wp_desired_post_slug', ''),
(408, 112, '_wp_trash_meta_status', 'draft'),
(409, 112, '_wp_trash_meta_time', '1709041773'),
(410, 112, '_wp_desired_post_slug', ''),
(411, 114, '_wp_trash_meta_status', 'draft'),
(412, 114, '_wp_trash_meta_time', '1709041775'),
(413, 114, '_wp_desired_post_slug', ''),
(414, 117, '_wp_trash_meta_status', 'draft'),
(415, 117, '_wp_trash_meta_time', '1709042351'),
(416, 117, '_wp_desired_post_slug', ''),
(417, 116, '_wp_trash_meta_status', 'draft'),
(418, 116, '_wp_trash_meta_time', '1709042353'),
(419, 116, '_wp_desired_post_slug', ''),
(420, 113, '_wp_trash_meta_status', 'draft'),
(421, 113, '_wp_trash_meta_time', '1709042355'),
(422, 113, '_wp_desired_post_slug', ''),
(423, 118, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:5:\"jigna\";s:8:\"lastName\";s:5:\"Raval\";s:5:\"email\";s:22:\"jraval106001@gmail.com\";s:7:\"address\";s:24:\"Uttam mangal soc navsari\";s:8:\"address2\";s:5:\"asdas\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"396424\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(424, 118, '_edit_lock', '1709102573:1'),
(425, 119, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:5:\"jigna\";s:8:\"lastName\";s:5:\"Raval\";s:5:\"email\";s:22:\"jraval106001@gmail.com\";s:7:\"address\";s:24:\"Uttam mangal soc navsari\";s:8:\"address2\";s:5:\"asdas\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"396424\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(426, 119, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:2:{i:99;s:1:\"3\";i:23;s:1:\"2\";}}'),
(427, 120, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:8:\"Shreyash\";s:8:\"lastName\";s:7:\"Makadia\";s:5:\"email\";s:20:\"srmakadia7@gmail.com\";s:7:\"address\";s:7:\"vadodra\";s:8:\"address2\";s:0:\"\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"308704\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(428, 120, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:2:{i:99;s:1:\"3\";i:23;s:1:\"2\";}}'),
(429, 118, '_wp_trash_meta_status', 'draft'),
(430, 118, '_wp_trash_meta_time', '1709103449'),
(431, 118, '_wp_desired_post_slug', ''),
(432, 121, 'ecommerce_billing_data', 'a:9:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:0:\"\";s:8:\"lastName\";s:0:\"\";s:5:\"email\";s:0:\"\";s:7:\"address\";s:0:\"\";s:8:\"address2\";s:0:\"\";s:7:\"country\";s:0:\"\";s:5:\"state\";s:0:\"\";s:3:\"zip\";s:0:\"\";}'),
(433, 121, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:2:{i:99;s:1:\"3\";i:23;s:1:\"2\";}}'),
(434, 121, '_edit_lock', '1709103342:1'),
(435, 121, '_wp_trash_meta_status', 'draft'),
(436, 121, '_wp_trash_meta_time', '1709103495'),
(437, 121, '_wp_desired_post_slug', ''),
(438, 122, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:7:\"Priyank\";s:8:\"lastName\";s:5:\"Raval\";s:5:\"email\";s:18:\"patel123@gmail.com\";s:7:\"address\";s:5:\"Surat\";s:8:\"address2\";s:0:\"\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"785855\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(439, 122, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:1:{i:99;s:1:\"4\";}}'),
(440, 122, '_edit_lock', '1709201893:1'),
(441, 120, '_edit_lock', '1710159994:1'),
(442, 119, '_edit_lock', '1709191890:1'),
(465, 147, '_edit_lock', '1709206426:1'),
(466, 147, '_wp_page_template', 'Thankyou.php'),
(467, 149, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:4:\"Veer\";s:8:\"lastName\";s:4:\"Shah\";s:5:\"email\";s:16:\"vir123@gmail.com\";s:7:\"address\";s:9:\"Ahemdabad\";s:8:\"address2\";s:0:\"\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"380112\";s:13:\"paymentMethod\";s:6:\"credit\";}'),
(468, 149, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:1:{i:36;s:1:\"5\";}}'),
(469, 150, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:4:\"Veer\";s:8:\"lastName\";s:4:\"Shah\";s:5:\"email\";s:16:\"vir123@gmail.com\";s:7:\"address\";s:9:\"Ahemdabad\";s:8:\"address2\";s:0:\"\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"380112\";s:13:\"paymentMethod\";s:6:\"credit\";}'),
(470, 150, 'ecommerce_cart_data', 'a:0:{}'),
(471, 149, '_wp_trash_meta_status', 'draft'),
(472, 149, '_wp_trash_meta_time', '1709204578'),
(473, 149, '_wp_desired_post_slug', ''),
(474, 150, '_wp_trash_meta_status', 'draft'),
(475, 150, '_wp_trash_meta_time', '1709204580'),
(476, 150, '_wp_desired_post_slug', ''),
(477, 151, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:4:\"Veer\";s:8:\"lastName\";s:4:\"Shah\";s:5:\"email\";s:16:\"vir123@gmail.com\";s:7:\"address\";s:9:\"Ahemdabad\";s:8:\"address2\";s:5:\"asdas\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"380112\";s:13:\"paymentMethod\";s:6:\"credit\";}'),
(478, 151, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:1:{i:37;s:1:\"1\";}}'),
(479, 152, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:4:\"Yash\";s:8:\"lastName\";s:5:\"Patel\";s:5:\"email\";s:18:\"yash1923@gmail.com\";s:7:\"address\";s:14:\"Uttam park soc\";s:8:\"address2\";s:7:\"Navsari\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"396424\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(480, 152, 'ecommerce_cart_data', NULL),
(481, 153, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:4:\"Yash\";s:8:\"lastName\";s:5:\"Patel\";s:5:\"email\";s:18:\"yash1923@gmail.com\";s:7:\"address\";s:14:\"Uttam park soc\";s:8:\"address2\";s:7:\"Navsari\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"396424\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(482, 153, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:1:{i:37;s:1:\"4\";}}'),
(483, 154, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:4:\"Yash\";s:8:\"lastName\";s:5:\"Patel\";s:5:\"email\";s:18:\"yash1923@gmail.com\";s:7:\"address\";s:14:\"Uttam park soc\";s:8:\"address2\";s:7:\"Navsari\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"396424\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(484, 154, 'ecommerce_cart_data', 'a:0:{}'),
(485, 154, '_wp_trash_meta_status', 'draft'),
(486, 154, '_wp_trash_meta_time', '1709207145'),
(487, 154, '_wp_desired_post_slug', ''),
(488, 153, '_wp_trash_meta_status', 'draft'),
(489, 153, '_wp_trash_meta_time', '1709207147'),
(490, 153, '_wp_desired_post_slug', ''),
(491, 152, '_wp_trash_meta_status', 'draft'),
(492, 152, '_wp_trash_meta_time', '1709207151'),
(493, 152, '_wp_desired_post_slug', ''),
(494, 151, '_edit_lock', '1709530182:1'),
(495, 155, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:4:\"Yash\";s:8:\"lastName\";s:5:\"Patel\";s:5:\"email\";s:18:\"yash1923@gmail.com\";s:7:\"address\";s:17:\"Uttam Mangal Soc,\";s:8:\"address2\";s:7:\"Navsari\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"380112\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(496, 155, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:1:{i:101;s:1:\"1\";}}'),
(497, 155, '_edit_lock', '1709207540:1'),
(498, 155, '_wp_trash_meta_status', 'draft'),
(499, 155, '_wp_trash_meta_time', '1709207686'),
(500, 155, '_wp_desired_post_slug', ''),
(501, 156, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:4:\"Yash\";s:8:\"lastName\";s:5:\"Patel\";s:5:\"email\";s:18:\"yash1923@gmail.com\";s:7:\"address\";s:17:\"Uttam Mangal Soc,\";s:8:\"address2\";s:7:\"Navsari\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"308704\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(502, 156, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:2:{i:36;s:1:\"2\";i:99;s:1:\"3\";}}'),
(503, 119, '_wp_trash_meta_status', 'draft'),
(504, 119, '_wp_trash_meta_time', '1709273681'),
(505, 119, '_wp_desired_post_slug', ''),
(506, 157, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:5:\"jigna\";s:8:\"lastName\";s:5:\"Raval\";s:5:\"email\";s:22:\"jraval106001@gmail.com\";s:7:\"address\";s:16:\"Uttam mangal soc\";s:8:\"address2\";s:7:\"Navsari\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"396424\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(507, 157, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:2:{i:23;s:1:\"2\";i:37;s:1:\"1\";}}'),
(508, 157, '_edit_lock', '1710331704:1'),
(509, 158, '_edit_lock', '1710333983:1'),
(510, 158, '_wp_page_template', 'registration.php'),
(511, 160, '_edit_lock', '1710394245:1'),
(512, 160, '_wp_page_template', 'login.php'),
(515, 101, '_wp_trash_meta_status', 'publish'),
(516, 101, '_wp_trash_meta_time', '1709550495'),
(517, 101, '_wp_desired_post_slug', 'iphone'),
(518, 163, '_wp_attached_file', '2024/02/tresme.jpg'),
(519, 163, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:700;s:6:\"height\";i:450;s:4:\"file\";s:18:\"2024/02/tresme.jpg\";s:8:\"filesize\";i:20380;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(520, 164, '_edit_lock', '1709725165:1'),
(521, 164, '_edit_last', '1'),
(522, 165, '_wp_attached_file', '2024/03/dove.jpg'),
(523, 165, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1000;s:6:\"height\";i:1000;s:4:\"file\";s:16:\"2024/03/dove.jpg\";s:8:\"filesize\";i:28563;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(524, 164, '_thumbnail_id', '165'),
(525, 164, 'ecommerce_price', '580'),
(526, 164, 'ecommerce_sale_price', '420'),
(527, 167, '_wp_attached_file', '2024/02/ClassmateSingleLineNotebook172Pages_600x600.jpg'),
(528, 167, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:600;s:6:\"height\";i:600;s:4:\"file\";s:55:\"2024/02/ClassmateSingleLineNotebook172Pages_600x600.jpg\";s:8:\"filesize\";i:36044;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(529, 168, '_edit_lock', '1710937451:1'),
(530, 168, '_edit_last', '1'),
(531, 169, '_wp_attached_file', '2024/03/61U0hf1EcbL.jpg'),
(532, 169, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1100;s:6:\"height\";i:1100;s:4:\"file\";s:23:\"2024/03/61U0hf1EcbL.jpg\";s:8:\"filesize\";i:80177;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(533, 168, '_thumbnail_id', '296'),
(534, 168, 'ecommerce_price', '120'),
(535, 168, 'ecommerce_sale_price', '100'),
(536, 170, '_wp_attached_file', '2024/02/dddd.webp'),
(537, 170, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1019;s:6:\"height\";i:1200;s:4:\"file\";s:17:\"2024/02/dddd.webp\";s:8:\"filesize\";i:28496;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(538, 171, '_edit_lock', '1710933234:1'),
(539, 171, '_edit_last', '1'),
(540, 172, '_wp_attached_file', '2024/03/61Fn1C65YL.jpg'),
(541, 172, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2000;s:6:\"height\";i:2000;s:4:\"file\";s:22:\"2024/03/61Fn1C65YL.jpg\";s:8:\"filesize\";i:112425;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(542, 171, '_thumbnail_id', '294'),
(543, 171, 'ecommerce_price', '1800'),
(544, 171, 'ecommerce_sale_price', '1800'),
(545, 174, '_edit_lock', '1709725123:1'),
(546, 174, '_edit_last', '1'),
(547, 175, '_wp_attached_file', '2024/03/shopping.webp'),
(548, 175, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:450;s:6:\"height\";i:600;s:4:\"file\";s:21:\"2024/03/shopping.webp\";s:8:\"filesize\";i:50082;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(549, 174, '_thumbnail_id', '175'),
(550, 174, 'ecommerce_price', '3500'),
(551, 174, 'ecommerce_sale_price', '3000'),
(579, 179, '_menu_item_type', 'post_type'),
(580, 179, '_menu_item_menu_item_parent', '0'),
(581, 179, '_menu_item_object_id', '103'),
(582, 179, '_menu_item_object', 'page'),
(583, 179, '_menu_item_target', ''),
(584, 179, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(585, 179, '_menu_item_xfn', ''),
(586, 179, '_menu_item_url', ''),
(587, 179, '_menu_item_orphaned', '1709616783'),
(597, 181, '_menu_item_type', 'post_type'),
(598, 181, '_menu_item_menu_item_parent', '0'),
(599, 181, '_menu_item_object_id', '160'),
(600, 181, '_menu_item_object', 'page'),
(601, 181, '_menu_item_target', ''),
(602, 181, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(603, 181, '_menu_item_xfn', ''),
(604, 181, '_menu_item_url', ''),
(605, 181, '_menu_item_orphaned', '1709616783'),
(615, 183, '_menu_item_type', 'post_type'),
(616, 183, '_menu_item_menu_item_parent', '0'),
(617, 183, '_menu_item_object_id', '158'),
(618, 183, '_menu_item_object', 'page'),
(619, 183, '_menu_item_target', ''),
(620, 183, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(621, 183, '_menu_item_xfn', ''),
(622, 183, '_menu_item_url', ''),
(623, 183, '_menu_item_orphaned', '1709616783'),
(624, 184, '_menu_item_type', 'post_type'),
(625, 184, '_menu_item_menu_item_parent', '0'),
(626, 184, '_menu_item_object_id', '147'),
(627, 184, '_menu_item_object', 'page'),
(628, 184, '_menu_item_target', ''),
(629, 184, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(630, 184, '_menu_item_xfn', ''),
(631, 184, '_menu_item_url', ''),
(632, 184, '_menu_item_orphaned', '1709616783'),
(760, 200, '_edit_lock', '1709623489:1'),
(761, 200, '_wp_page_template', 'page-brand_list.php'),
(762, 203, '_edit_lock', '1709636179:1'),
(763, 203, '_wp_page_template', 'page-product_category.php'),
(764, 205, '_edit_lock', '1709725107:1'),
(765, 205, '_edit_last', '1'),
(766, 206, '_wp_attached_file', '2024/03/c2386af9-4349-432f-8ba5-2b6aa06025c8_600x.webp'),
(767, 206, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:600;s:6:\"height\";i:600;s:4:\"file\";s:54:\"2024/03/c2386af9-4349-432f-8ba5-2b6aa06025c8_600x.webp\";s:8:\"filesize\";i:15892;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(768, 205, '_thumbnail_id', '206'),
(769, 205, 'ecommerce_price', '2500'),
(770, 205, 'ecommerce_sale_price', '2500'),
(789, 209, '_edit_lock', '1710929355:1'),
(790, 209, '_edit_last', '1'),
(791, 210, '_wp_attached_file', '2024/03/shg.webp'),
(792, 210, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:278;s:6:\"height\";i:449;s:4:\"file\";s:16:\"2024/03/shg.webp\";s:8:\"filesize\";i:23956;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(793, 209, '_thumbnail_id', '293'),
(794, 209, 'ecommerce_price', '50'),
(795, 209, 'ecommerce_sale_price', '50'),
(796, 216, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:4:\"Deep\";s:8:\"lastName\";s:4:\"Shah\";s:5:\"email\";s:16:\"dip123@gmail.com\";s:7:\"address\";s:9:\"Ahemdabad\";s:8:\"address2\";s:5:\"asdas\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"784564\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(797, 216, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:1:{i:23;s:1:\"7\";}}'),
(798, 156, '_edit_lock', '1710160596:1'),
(799, 217, 'ecommerce_billing_data', 'a:9:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:0:\"\";s:8:\"lastName\";s:0:\"\";s:5:\"email\";s:0:\"\";s:7:\"address\";s:0:\"\";s:8:\"address2\";s:0:\"\";s:7:\"country\";s:0:\"\";s:5:\"state\";s:0:\"\";s:3:\"zip\";s:0:\"\";}'),
(800, 217, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:1:{i:174;s:1:\"2\";}}'),
(801, 115, '_edit_lock', '1710164101:1'),
(802, 217, '_edit_lock', '1710163968:1'),
(803, 216, '_wp_trash_meta_status', 'draft'),
(804, 216, '_wp_trash_meta_time', '1710164116'),
(805, 216, '_wp_desired_post_slug', ''),
(806, 217, '_wp_trash_meta_status', 'draft'),
(807, 217, '_wp_trash_meta_time', '1710164118'),
(808, 217, '_wp_desired_post_slug', ''),
(811, 220, '_edit_lock', '1710399707:1'),
(812, 220, '_wp_page_template', 'allorderd.php'),
(813, 223, '_menu_item_type', 'post_type'),
(814, 223, '_menu_item_menu_item_parent', '0'),
(815, 223, '_menu_item_object_id', '94'),
(816, 223, '_menu_item_object', 'page'),
(817, 223, '_menu_item_target', ''),
(818, 223, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(819, 223, '_menu_item_xfn', ''),
(820, 223, '_menu_item_url', ''),
(821, 223, '_menu_item_orphaned', '1710331294'),
(838, 157, '_wp_trash_meta_status', 'draft'),
(839, 157, '_wp_trash_meta_time', '1710398963'),
(840, 157, '_wp_desired_post_slug', ''),
(841, 156, '_wp_trash_meta_status', 'draft'),
(842, 156, '_wp_trash_meta_time', '1710398965'),
(843, 156, '_wp_desired_post_slug', ''),
(844, 115, '_wp_trash_meta_status', 'draft'),
(845, 115, '_wp_trash_meta_time', '1710398968'),
(846, 115, '_wp_desired_post_slug', ''),
(847, 120, '_wp_trash_meta_status', 'draft'),
(848, 120, '_wp_trash_meta_time', '1710398970'),
(849, 120, '_wp_desired_post_slug', ''),
(850, 151, '_wp_trash_meta_status', 'draft'),
(851, 151, '_wp_trash_meta_time', '1710398971'),
(852, 151, '_wp_desired_post_slug', ''),
(853, 226, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:5:\"jigna\";s:8:\"lastName\";s:5:\"Raval\";s:5:\"email\";s:18:\"raval123@gmail.com\";s:7:\"address\";s:17:\"Uttam mangal soc \";s:8:\"address2\";s:7:\"Navsari\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"396424\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(854, 226, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:2:{i:205;i:8;i:171;s:1:\"2\";}}'),
(855, 227, 'ecommerce_billing_data', 'a:10:{s:10:\"placeorder\";s:0:\"\";s:9:\"firstName\";s:5:\"jigna\";s:8:\"lastName\";s:5:\"Raval\";s:5:\"email\";s:18:\"raval123@gmail.com\";s:7:\"address\";s:24:\"Uttam mangal soc navsari\";s:8:\"address2\";s:7:\"Navsari\";s:7:\"country\";s:5:\"India\";s:5:\"state\";s:7:\"Gujarat\";s:3:\"zip\";s:6:\"380112\";s:13:\"paymentMethod\";s:16:\"cash-on-delivery\";}'),
(856, 227, 'ecommerce_cart_data', 'a:1:{s:12:\"productitems\";a:1:{i:209;s:1:\"3\";}}'),
(857, 227, '_edit_lock', '1710914699:1'),
(858, 226, '_edit_lock', '1710416256:1'),
(874, 233, '_edit_lock', '1710418385:1'),
(883, 233, '_wp_page_template', 'orderdetail.php'),
(884, 238, '_edit_lock', '1710745381:1'),
(902, 242, '_menu_item_type', 'post_type'),
(903, 242, '_menu_item_menu_item_parent', '0'),
(904, 242, '_menu_item_object_id', '220'),
(905, 242, '_menu_item_object', 'page'),
(906, 242, '_menu_item_target', ''),
(907, 242, '_menu_item_classes', 'a:1:{i:0;s:8:\"as-login\";}'),
(908, 242, '_menu_item_xfn', ''),
(909, 242, '_menu_item_url', ''),
(920, 244, '_menu_item_type', 'post_type'),
(921, 244, '_menu_item_menu_item_parent', '0'),
(922, 244, '_menu_item_object_id', '94'),
(923, 244, '_menu_item_object', 'page'),
(924, 244, '_menu_item_target', ''),
(925, 244, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(926, 244, '_menu_item_xfn', ''),
(927, 244, '_menu_item_url', ''),
(929, 245, '_menu_item_type', 'post_type'),
(930, 245, '_menu_item_menu_item_parent', '0'),
(931, 245, '_menu_item_object_id', '77'),
(932, 245, '_menu_item_object', 'page'),
(933, 245, '_menu_item_target', ''),
(934, 245, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(935, 245, '_menu_item_xfn', ''),
(936, 245, '_menu_item_url', ''),
(947, 247, '_menu_item_type', 'post_type'),
(948, 247, '_menu_item_menu_item_parent', '0'),
(949, 247, '_menu_item_object_id', '74'),
(950, 247, '_menu_item_object', 'page'),
(951, 247, '_menu_item_target', ''),
(952, 247, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(953, 247, '_menu_item_xfn', ''),
(954, 247, '_menu_item_url', ''),
(956, 248, '_menu_item_type', 'post_type'),
(957, 248, '_menu_item_menu_item_parent', '0'),
(958, 248, '_menu_item_object_id', '238'),
(959, 248, '_menu_item_object', 'page'),
(960, 248, '_menu_item_target', ''),
(961, 248, '_menu_item_classes', 'a:1:{i:0;s:8:\"as-login\";}'),
(962, 248, '_menu_item_xfn', ''),
(963, 248, '_menu_item_url', ''),
(965, 249, '_menu_item_type', 'post_type_archive'),
(966, 249, '_menu_item_menu_item_parent', '0'),
(967, 249, '_menu_item_object_id', '-42'),
(968, 249, '_menu_item_object', 'product'),
(969, 249, '_menu_item_target', ''),
(970, 249, '_menu_item_classes', 'a:1:{i:0;s:12:\"as_shop_menu\";}'),
(971, 249, '_menu_item_xfn', ''),
(972, 249, '_menu_item_url', ''),
(974, 247, '_wp_old_date', '2024-03-14'),
(975, 249, '_wp_old_date', '2024-03-14'),
(976, 245, '_wp_old_date', '2024-03-14'),
(977, 242, '_wp_old_date', '2024-03-14'),
(978, 244, '_wp_old_date', '2024-03-14'),
(979, 248, '_wp_old_date', '2024-03-14'),
(980, 238, '_wp_page_template', 'logout.php'),
(981, 77, '_wp_page_template', 'aboutus.php'),
(982, 14, '_wp_page_template', 'contactus.php'),
(983, 250, '_menu_item_type', 'post_type'),
(984, 250, '_menu_item_menu_item_parent', '0'),
(985, 250, '_menu_item_object_id', '209'),
(986, 250, '_menu_item_object', 'product'),
(987, 250, '_menu_item_target', ''),
(988, 250, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(989, 250, '_menu_item_xfn', ''),
(990, 250, '_menu_item_url', ''),
(991, 250, '_menu_item_orphaned', '1710847170'),
(992, 251, '_menu_item_type', 'post_type'),
(993, 251, '_menu_item_menu_item_parent', '0'),
(994, 251, '_menu_item_object_id', '205'),
(995, 251, '_menu_item_object', 'product'),
(996, 251, '_menu_item_target', ''),
(997, 251, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(998, 251, '_menu_item_xfn', ''),
(999, 251, '_menu_item_url', ''),
(1000, 251, '_menu_item_orphaned', '1710847170'),
(1001, 252, '_menu_item_type', 'post_type'),
(1002, 252, '_menu_item_menu_item_parent', '0'),
(1003, 252, '_menu_item_object_id', '174'),
(1004, 252, '_menu_item_object', 'product'),
(1005, 252, '_menu_item_target', ''),
(1006, 252, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1007, 252, '_menu_item_xfn', ''),
(1008, 252, '_menu_item_url', ''),
(1009, 252, '_menu_item_orphaned', '1710847170'),
(1010, 253, '_menu_item_type', 'post_type'),
(1011, 253, '_menu_item_menu_item_parent', '0'),
(1012, 253, '_menu_item_object_id', '171'),
(1013, 253, '_menu_item_object', 'product'),
(1014, 253, '_menu_item_target', ''),
(1015, 253, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1016, 253, '_menu_item_xfn', ''),
(1017, 253, '_menu_item_url', ''),
(1018, 253, '_menu_item_orphaned', '1710847170'),
(1019, 254, '_menu_item_type', 'post_type'),
(1020, 254, '_menu_item_menu_item_parent', '0'),
(1021, 254, '_menu_item_object_id', '168'),
(1022, 254, '_menu_item_object', 'product'),
(1023, 254, '_menu_item_target', ''),
(1024, 254, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1025, 254, '_menu_item_xfn', ''),
(1026, 254, '_menu_item_url', ''),
(1027, 254, '_menu_item_orphaned', '1710847170'),
(1028, 255, '_menu_item_type', 'post_type'),
(1029, 255, '_menu_item_menu_item_parent', '0'),
(1030, 255, '_menu_item_object_id', '164'),
(1031, 255, '_menu_item_object', 'product'),
(1032, 255, '_menu_item_target', ''),
(1033, 255, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1034, 255, '_menu_item_xfn', ''),
(1035, 255, '_menu_item_url', ''),
(1036, 255, '_menu_item_orphaned', '1710847170'),
(1037, 256, '_menu_item_type', 'post_type'),
(1038, 256, '_menu_item_menu_item_parent', '0'),
(1039, 256, '_menu_item_object_id', '99'),
(1040, 256, '_menu_item_object', 'product'),
(1041, 256, '_menu_item_target', ''),
(1042, 256, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1043, 256, '_menu_item_xfn', ''),
(1044, 256, '_menu_item_url', ''),
(1045, 256, '_menu_item_orphaned', '1710847170'),
(1046, 257, '_menu_item_type', 'post_type'),
(1047, 257, '_menu_item_menu_item_parent', '0'),
(1048, 257, '_menu_item_object_id', '37'),
(1049, 257, '_menu_item_object', 'product'),
(1050, 257, '_menu_item_target', ''),
(1051, 257, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1052, 257, '_menu_item_xfn', ''),
(1053, 257, '_menu_item_url', ''),
(1054, 257, '_menu_item_orphaned', '1710847170'),
(1055, 258, '_menu_item_type', 'post_type'),
(1056, 258, '_menu_item_menu_item_parent', '0'),
(1057, 258, '_menu_item_object_id', '36'),
(1058, 258, '_menu_item_object', 'product'),
(1059, 258, '_menu_item_target', ''),
(1060, 258, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1061, 258, '_menu_item_xfn', ''),
(1062, 258, '_menu_item_url', ''),
(1063, 258, '_menu_item_orphaned', '1710847170'),
(1064, 259, '_menu_item_type', 'post_type'),
(1065, 259, '_menu_item_menu_item_parent', '0'),
(1066, 259, '_menu_item_object_id', '23'),
(1067, 259, '_menu_item_object', 'product'),
(1068, 259, '_menu_item_target', ''),
(1069, 259, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1070, 259, '_menu_item_xfn', ''),
(1071, 259, '_menu_item_url', ''),
(1072, 259, '_menu_item_orphaned', '1710847170'),
(1073, 260, '_menu_item_type', 'post_type_archive'),
(1074, 260, '_menu_item_menu_item_parent', '0'),
(1075, 260, '_menu_item_object_id', '-42'),
(1076, 260, '_menu_item_object', 'product'),
(1077, 260, '_menu_item_target', ''),
(1078, 260, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1079, 260, '_menu_item_xfn', ''),
(1080, 260, '_menu_item_url', ''),
(1081, 260, '_menu_item_orphaned', '1710847218'),
(1082, 261, '_menu_item_type', 'post_type'),
(1083, 261, '_menu_item_menu_item_parent', '0'),
(1084, 261, '_menu_item_object_id', '205'),
(1085, 261, '_menu_item_object', 'product'),
(1086, 261, '_menu_item_target', ''),
(1087, 261, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1088, 261, '_menu_item_xfn', ''),
(1089, 261, '_menu_item_url', ''),
(1090, 261, '_menu_item_orphaned', '1710847218'),
(1091, 262, '_menu_item_type', 'post_type'),
(1092, 262, '_menu_item_menu_item_parent', '0'),
(1093, 262, '_menu_item_object_id', '37'),
(1094, 262, '_menu_item_object', 'product'),
(1095, 262, '_menu_item_target', ''),
(1096, 262, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1097, 262, '_menu_item_xfn', ''),
(1098, 262, '_menu_item_url', ''),
(1099, 262, '_menu_item_orphaned', '1710847218'),
(1100, 263, '_menu_item_type', 'post_type'),
(1101, 263, '_menu_item_menu_item_parent', '0'),
(1102, 263, '_menu_item_object_id', '99'),
(1103, 263, '_menu_item_object', 'product'),
(1104, 263, '_menu_item_target', ''),
(1105, 263, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1106, 263, '_menu_item_xfn', ''),
(1107, 263, '_menu_item_url', ''),
(1108, 263, '_menu_item_orphaned', '1710847218'),
(1109, 264, '_menu_item_type', 'post_type'),
(1110, 264, '_menu_item_menu_item_parent', '0'),
(1111, 264, '_menu_item_object_id', '209'),
(1112, 264, '_menu_item_object', 'product'),
(1113, 264, '_menu_item_target', ''),
(1114, 264, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1115, 264, '_menu_item_xfn', ''),
(1116, 264, '_menu_item_url', ''),
(1117, 264, '_menu_item_orphaned', '1710847218'),
(1118, 265, '_menu_item_type', 'post_type'),
(1119, 265, '_menu_item_menu_item_parent', '0'),
(1120, 265, '_menu_item_object_id', '164'),
(1121, 265, '_menu_item_object', 'product'),
(1122, 265, '_menu_item_target', ''),
(1123, 265, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1124, 265, '_menu_item_xfn', ''),
(1125, 265, '_menu_item_url', ''),
(1126, 265, '_menu_item_orphaned', '1710847218'),
(1127, 266, '_menu_item_type', 'post_type'),
(1128, 266, '_menu_item_menu_item_parent', '0'),
(1129, 266, '_menu_item_object_id', '171'),
(1130, 266, '_menu_item_object', 'product'),
(1131, 266, '_menu_item_target', ''),
(1132, 266, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1133, 266, '_menu_item_xfn', ''),
(1134, 266, '_menu_item_url', ''),
(1135, 266, '_menu_item_orphaned', '1710847218'),
(1136, 267, '_menu_item_type', 'post_type'),
(1137, 267, '_menu_item_menu_item_parent', '0'),
(1138, 267, '_menu_item_object_id', '168'),
(1139, 267, '_menu_item_object', 'product'),
(1140, 267, '_menu_item_target', ''),
(1141, 267, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1142, 267, '_menu_item_xfn', ''),
(1143, 267, '_menu_item_url', ''),
(1144, 267, '_menu_item_orphaned', '1710847218'),
(1145, 268, '_menu_item_type', 'post_type'),
(1146, 268, '_menu_item_menu_item_parent', '0'),
(1147, 268, '_menu_item_object_id', '174'),
(1148, 268, '_menu_item_object', 'product'),
(1149, 268, '_menu_item_target', ''),
(1150, 268, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1151, 268, '_menu_item_xfn', ''),
(1152, 268, '_menu_item_url', ''),
(1153, 268, '_menu_item_orphaned', '1710847218'),
(1154, 269, '_menu_item_type', 'post_type'),
(1155, 269, '_menu_item_menu_item_parent', '0'),
(1156, 269, '_menu_item_object_id', '23'),
(1157, 269, '_menu_item_object', 'product'),
(1158, 269, '_menu_item_target', ''),
(1159, 269, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1160, 269, '_menu_item_xfn', ''),
(1161, 269, '_menu_item_url', ''),
(1162, 269, '_menu_item_orphaned', '1710847218'),
(1163, 270, '_menu_item_type', 'post_type'),
(1164, 270, '_menu_item_menu_item_parent', '0'),
(1165, 270, '_menu_item_object_id', '36'),
(1166, 270, '_menu_item_object', 'product'),
(1167, 270, '_menu_item_target', ''),
(1168, 270, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1169, 270, '_menu_item_xfn', ''),
(1170, 270, '_menu_item_url', ''),
(1171, 270, '_menu_item_orphaned', '1710847218'),
(1172, 271, '_menu_item_type', 'post_type'),
(1173, 271, '_menu_item_menu_item_parent', '0'),
(1174, 271, '_menu_item_object_id', '77'),
(1175, 271, '_menu_item_object', 'page'),
(1176, 271, '_menu_item_target', ''),
(1177, 271, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1178, 271, '_menu_item_xfn', ''),
(1179, 271, '_menu_item_url', ''),
(1180, 271, '_menu_item_orphaned', '1710847729'),
(1181, 272, '_menu_item_type', 'post_type'),
(1182, 272, '_menu_item_menu_item_parent', '0'),
(1183, 272, '_menu_item_object_id', '52'),
(1184, 272, '_menu_item_object', 'page'),
(1185, 272, '_menu_item_target', ''),
(1186, 272, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1187, 272, '_menu_item_xfn', ''),
(1188, 272, '_menu_item_url', ''),
(1189, 272, '_menu_item_orphaned', '1710847739'),
(1190, 273, '_menu_item_type', 'post_type_archive'),
(1191, 273, '_menu_item_menu_item_parent', '0'),
(1192, 273, '_menu_item_object_id', '-42'),
(1193, 273, '_menu_item_object', 'product'),
(1194, 273, '_menu_item_target', ''),
(1195, 273, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1196, 273, '_menu_item_xfn', ''),
(1197, 273, '_menu_item_url', ''),
(1198, 273, '_menu_item_orphaned', '1710847974'),
(1199, 274, '_menu_item_type', 'post_type'),
(1200, 274, '_menu_item_menu_item_parent', '0'),
(1201, 274, '_menu_item_object_id', '11'),
(1202, 274, '_menu_item_object', 'post'),
(1203, 274, '_menu_item_target', ''),
(1204, 274, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1205, 274, '_menu_item_xfn', ''),
(1206, 274, '_menu_item_url', ''),
(1207, 274, '_menu_item_orphaned', '1710848003'),
(1208, 275, '_menu_item_type', 'taxonomy'),
(1209, 275, '_menu_item_menu_item_parent', '0'),
(1210, 275, '_menu_item_object_id', '31'),
(1211, 275, '_menu_item_object', 'brand'),
(1212, 275, '_menu_item_target', ''),
(1213, 275, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1214, 275, '_menu_item_xfn', ''),
(1215, 275, '_menu_item_url', ''),
(1216, 275, '_menu_item_orphaned', '1710848021'),
(1226, 247, '_wp_old_date', '2024-03-18'),
(1227, 249, '_wp_old_date', '2024-03-18'),
(1228, 245, '_wp_old_date', '2024-03-18'),
(1229, 242, '_wp_old_date', '2024-03-18'),
(1230, 244, '_wp_old_date', '2024-03-18'),
(1231, 248, '_wp_old_date', '2024-03-18'),
(1309, 285, '_wp_attached_file', '2024/03/1200px-Boat_Logo.webp.png'),
(1310, 285, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:628;s:4:\"file\";s:33:\"2024/03/1200px-Boat_Logo.webp.png\";s:8:\"filesize\";i:89575;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1311, 286, 'contact_data', 'a:2:{s:4:\"data\";a:5:{s:9:\"Firstname\";s:5:\"Jigna\";s:8:\"Lastname\";s:5:\"Raval\";s:5:\"Email\";s:22:\"jraval106001@gmail.com\";s:5:\"phone\";s:12:\"789656522000\";s:7:\"Message\";s:10:\"test data \";}s:6:\"action\";s:14:\"as_contactdata\";}'),
(1312, 286, '_edit_lock', '1710920496:1'),
(1313, 287, 'contact_data', 'a:2:{s:4:\"data\";a:5:{s:9:\"Firstname\";s:5:\"Jigna\";s:8:\"Lastname\";s:5:\"Raval\";s:5:\"Email\";s:22:\"jraval106001@gmail.com\";s:5:\"phone\";s:12:\"789656522000\";s:7:\"Message\";s:10:\"test data \";}s:6:\"action\";s:14:\"as_contactdata\";}'),
(1314, 286, '_wp_trash_meta_status', 'draft'),
(1315, 286, '_wp_trash_meta_time', '1710920724'),
(1316, 286, '_wp_desired_post_slug', ''),
(1317, 287, '_wp_trash_meta_status', 'draft'),
(1318, 287, '_wp_trash_meta_time', '1710920726'),
(1319, 287, '_wp_desired_post_slug', ''),
(1320, 288, 'contact_data', 'a:2:{s:4:\"data\";a:5:{s:9:\"Firstname\";s:5:\"Jigna\";s:8:\"Lastname\";s:5:\"Raval\";s:5:\"Email\";s:22:\"jraval106001@gmail.com\";s:5:\"phone\";s:4:\"7985\";s:7:\"Message\";s:4:\"test\";}s:6:\"action\";s:14:\"as_contactdata\";}'),
(1321, 289, 'contact_data', 'a:2:{s:4:\"data\";a:5:{s:9:\"Firstname\";s:0:\"\";s:8:\"Lastname\";s:0:\"\";s:5:\"Email\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:7:\"Message\";s:0:\"\";}s:6:\"action\";s:14:\"as_contactdata\";}'),
(1322, 290, 'contact_data', 'a:2:{s:4:\"data\";a:5:{s:9:\"Firstname\";s:5:\"Jigna\";s:8:\"Lastname\";s:0:\"\";s:5:\"Email\";s:22:\"jraval106001@gmail.com\";s:5:\"phone\";s:12:\"789656522000\";s:7:\"Message\";s:2:\"ee\";}s:6:\"action\";s:14:\"as_contactdata\";}'),
(1323, 288, '_wp_trash_meta_status', 'draft'),
(1324, 288, '_wp_trash_meta_time', '1710921000'),
(1325, 288, '_wp_desired_post_slug', ''),
(1326, 289, '_wp_trash_meta_status', 'draft'),
(1327, 289, '_wp_trash_meta_time', '1710921002'),
(1328, 289, '_wp_desired_post_slug', ''),
(1329, 290, '_wp_trash_meta_status', 'draft'),
(1330, 290, '_wp_trash_meta_time', '1710921003'),
(1331, 290, '_wp_desired_post_slug', ''),
(1332, 291, 'ecommerce_billing_data', 'a:2:{s:4:\"data\";a:5:{s:9:\"Firstname\";s:5:\"Jigna\";s:8:\"Lastname\";s:4:\"sdfs\";s:5:\"Email\";s:18:\"yash1923@gmail.com\";s:5:\"phone\";s:2:\"78\";s:7:\"Message\";s:8:\"datatest\";}s:6:\"action\";s:14:\"as_contactdata\";}'),
(1333, 292, 'contact_data', 'a:2:{s:4:\"data\";a:5:{s:9:\"Firstname\";s:5:\"Jigna\";s:8:\"Lastname\";s:5:\"Raval\";s:5:\"Email\";s:22:\"jraval106001@gmail.com\";s:5:\"phone\";s:3:\"789\";s:7:\"Message\";s:10:\"test data \";}s:6:\"action\";s:14:\"as_contactdata\";}'),
(1334, 292, '_edit_lock', '1710931503:1'),
(1335, 293, '_wp_attached_file', '2024/03/61eaKfHFFpL._AC_UF350350_QL80_.jpg'),
(1336, 293, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:350;s:6:\"height\";i:350;s:4:\"file\";s:42:\"2024/03/61eaKfHFFpL._AC_UF350350_QL80_.jpg\";s:8:\"filesize\";i:16111;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1337, 294, '_wp_attached_file', '2024/03/38094PP01_1.jpg'),
(1338, 294, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:360;s:6:\"height\";i:360;s:4:\"file\";s:23:\"2024/03/38094PP01_1.jpg\";s:8:\"filesize\";i:9469;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1339, 295, '_wp_attached_file', '2024/03/SideAngle2edited_9af5ad42-bd7d-4a1c-aa03-.webp'),
(1340, 295, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:54:\"2024/03/SideAngle2edited_9af5ad42-bd7d-4a1c-aa03-.webp\";s:8:\"filesize\";i:73644;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1341, 296, '_wp_attached_file', '2024/03/download-1.jpg'),
(1342, 296, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:204;s:6:\"height\";i:192;s:4:\"file\";s:22:\"2024/03/download-1.jpg\";s:8:\"filesize\";i:9306;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1349, 247, '_wp_old_date', '2024-03-19'),
(1350, 249, '_wp_old_date', '2024-03-19'),
(1351, 245, '_wp_old_date', '2024-03-19'),
(1352, 242, '_wp_old_date', '2024-03-19'),
(1353, 244, '_wp_old_date', '2024-03-19'),
(1354, 248, '_wp_old_date', '2024-03-19'),
(1364, 299, '_menu_item_type', 'taxonomy'),
(1365, 299, '_menu_item_menu_item_parent', '249'),
(1366, 299, '_menu_item_object_id', '28'),
(1367, 299, '_menu_item_object', 'product_cat'),
(1368, 299, '_menu_item_target', ''),
(1369, 299, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1370, 299, '_menu_item_xfn', ''),
(1371, 299, '_menu_item_url', ''),
(1373, 300, '_menu_item_type', 'taxonomy'),
(1374, 300, '_menu_item_menu_item_parent', '249'),
(1375, 300, '_menu_item_object_id', '24'),
(1376, 300, '_menu_item_object', 'product_cat'),
(1377, 300, '_menu_item_target', ''),
(1378, 300, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1379, 300, '_menu_item_xfn', ''),
(1380, 300, '_menu_item_url', ''),
(1382, 301, '_menu_item_type', 'taxonomy'),
(1383, 301, '_menu_item_menu_item_parent', '249'),
(1384, 301, '_menu_item_object_id', '26'),
(1385, 301, '_menu_item_object', 'product_cat'),
(1386, 301, '_menu_item_target', ''),
(1387, 301, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1388, 301, '_menu_item_xfn', ''),
(1389, 301, '_menu_item_url', ''),
(1391, 302, '_menu_item_type', 'taxonomy'),
(1392, 302, '_menu_item_menu_item_parent', '249'),
(1393, 302, '_menu_item_object_id', '30'),
(1394, 302, '_menu_item_object', 'product_cat');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1395, 302, '_menu_item_target', ''),
(1396, 302, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1397, 302, '_menu_item_xfn', ''),
(1398, 302, '_menu_item_url', ''),
(1400, 303, '_menu_item_type', 'taxonomy'),
(1401, 303, '_menu_item_menu_item_parent', '249'),
(1402, 303, '_menu_item_object_id', '34'),
(1403, 303, '_menu_item_object', 'product_cat'),
(1404, 303, '_menu_item_target', ''),
(1405, 303, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1406, 303, '_menu_item_xfn', ''),
(1407, 303, '_menu_item_url', ''),
(1409, 304, '_menu_item_type', 'post_type'),
(1410, 304, '_menu_item_menu_item_parent', '0'),
(1411, 304, '_menu_item_object_id', '160'),
(1412, 304, '_menu_item_object', 'page'),
(1413, 304, '_menu_item_target', ''),
(1414, 304, '_menu_item_classes', 'a:1:{i:0;s:9:\"as-logout\";}'),
(1415, 304, '_menu_item_xfn', ''),
(1416, 304, '_menu_item_url', ''),
(1418, 305, '_menu_item_type', 'post_type'),
(1419, 305, '_menu_item_menu_item_parent', '0'),
(1420, 305, '_menu_item_object_id', '103'),
(1421, 305, '_menu_item_object', 'page'),
(1422, 305, '_menu_item_target', ''),
(1423, 305, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(1424, 305, '_menu_item_xfn', ''),
(1425, 305, '_menu_item_url', ''),
(1426, 305, '_menu_item_orphaned', '1711021652'),
(1427, 306, '_menu_item_type', 'post_type'),
(1428, 306, '_menu_item_menu_item_parent', '0'),
(1429, 306, '_menu_item_object_id', '14'),
(1430, 306, '_menu_item_object', 'page'),
(1431, 306, '_menu_item_target', ''),
(1432, 306, '_menu_item_classes', 'a:1:{i:0;s:8:\"as-login\";}'),
(1433, 306, '_menu_item_xfn', ''),
(1434, 306, '_menu_item_url', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2024-02-07 12:59:43', '2024-02-07 12:59:43', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2024-02-07 12:59:43', '2024-02-07 12:59:43', '', 0, 'http://localhost:81/wordpress/?p=1', 0, 'post', '', 1),
(4, 0, '2024-02-07 12:59:45', '2024-02-07 12:59:45', '<!-- wp:page-list /-->', 'Navigation', '', 'publish', 'closed', 'closed', '', 'navigation', '', '', '2024-02-07 12:59:45', '2024-02-07 12:59:45', '', 0, 'http://localhost:81/wordpress/2024/02/07/navigation/', 0, 'wp_navigation', '', 0),
(7, 1, '2024-02-08 05:44:32', '2024-02-08 05:44:32', '{\"version\": 2, \"isGlobalStylesUserThemeJSON\": true }', 'Custom Styles', '', 'publish', 'closed', 'closed', '', 'wp-global-styles-twentytwentyfour', '', '', '2024-02-08 05:44:32', '2024-02-08 05:44:32', '', 0, 'http://localhost:81/wordpress/2024/02/08/wp-global-styles-twentytwentyfour/', 0, 'wp_global_styles', '', 0),
(11, 1, '2024-02-08 07:03:33', '2024-02-08 07:03:33', '', 'wordpress', '', 'publish', 'open', 'open', '', 'wordpress', '', '', '2024-02-08 07:04:49', '2024-02-08 07:04:49', '', 0, 'http://localhost:81/wordpress/?p=11', 0, 'post', '', 0),
(12, 1, '2024-02-08 07:03:33', '2024-02-08 07:03:33', '', 'wordpress', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2024-02-08 07:03:33', '2024-02-08 07:03:33', '', 11, 'http://localhost:81/wordpress/?p=12', 0, 'revision', '', 0),
(14, 1, '2024-02-08 07:31:20', '2024-02-08 07:31:20', '', 'Contact Us', '', 'publish', 'closed', 'closed', '', 'contact-us', '', '', '2024-03-19 10:28:24', '2024-03-19 10:28:24', '', 0, 'http://localhost:81/wordpress/?page_id=14', 0, 'page', '', 0),
(15, 1, '2024-02-08 07:31:20', '2024-02-08 07:31:20', '', 'contact us', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2024-02-08 07:31:20', '2024-02-08 07:31:20', '', 14, 'http://localhost:81/wordpress/?p=15', 0, 'revision', '', 0),
(17, 1, '2024-02-12 07:13:04', '2024-02-12 07:13:04', '', 'opb7YuFp7SBrX-xxlarge (1)', '', 'inherit', 'open', 'closed', '', 'opb7yufp7sbrx-xxlarge-1', '', '', '2024-02-13 07:35:32', '2024-02-13 07:35:32', '', 23, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/opb7YuFp7SBrX-xxlarge-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(23, 1, '2024-02-12 13:15:12', '2024-02-12 13:15:12', '', 'Tresemme Shampoo, Keratin Smooth', '', 'publish', 'closed', 'closed', '', 'hair-shampoo', '', '', '2024-03-06 11:42:37', '2024-03-06 11:42:37', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=23', 0, 'product', '', 0),
(27, 1, '2024-02-13 07:35:41', '2024-02-13 07:35:41', '<img class=\"alignnone size-full wp-image-17\" src=\"http://localhost:81/wordpress/wp-content/uploads/2024/02/opb7YuFp7SBrX-xxlarge-1.jpg\" alt=\"\" width=\"800\" height=\"800\" />', 'Hair shampoo', '', 'inherit', 'closed', 'closed', '', '23-autosave-v1', '', '', '2024-02-13 07:35:41', '2024-02-13 07:35:41', '', 23, 'http://localhost:81/wordpress/?p=27', 0, 'revision', '', 0),
(28, 1, '2024-02-13 10:34:37', '2024-02-13 10:34:37', '', '11', '', 'inherit', 'open', 'closed', '', '11', '', '', '2024-02-13 10:34:37', '2024-02-13 10:34:37', '', 23, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/11.jpg', 0, 'attachment', 'image/jpeg', 0),
(36, 1, '2024-02-15 05:02:54', '2024-02-15 05:02:54', '', 'Women\'s Running Shoes PUMA', '', 'publish', 'open', 'closed', '', 'shoes', '', '', '2024-03-06 11:42:25', '2024-03-06 11:42:25', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=36', 0, 'product', '', 0),
(37, 1, '2024-02-15 05:03:18', '2024-02-15 05:03:18', '&nbsp;\r\n\r\n&nbsp;', 'boAt Xtend Smartwatch', '', 'publish', 'open', 'closed', '', 'watch', '', '', '2024-03-06 11:42:16', '2024-03-06 11:42:16', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=37', 0, 'product', '', 0),
(39, 1, '2024-02-15 07:45:10', '2024-02-15 07:45:10', '', 'img-2', '', 'inherit', 'open', 'closed', '', 'img-2', '', '', '2024-02-15 07:45:10', '2024-02-15 07:45:10', '', 36, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/img-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(40, 1, '2024-02-15 07:45:35', '2024-02-15 07:45:35', '', 'template (5)', '', 'inherit', 'open', 'closed', '', 'template-5', '', '', '2024-02-15 07:45:35', '2024-02-15 07:45:35', '', 37, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/template-5.jpg', 0, 'attachment', 'image/jpeg', 0),
(52, 1, '2024-02-15 09:09:29', '2024-02-15 09:09:29', '', 'Products', '', 'publish', 'closed', 'closed', '', 'products', '', '', '2024-02-15 09:09:29', '2024-02-15 09:09:29', '', 0, 'http://localhost:81/wordpress/?page_id=52', 0, 'page', '', 0),
(53, 1, '2024-02-15 09:09:29', '2024-02-15 09:09:29', '', 'Products', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2024-02-15 09:09:29', '2024-02-15 09:09:29', '', 52, 'http://localhost:81/wordpress/?p=53', 0, 'revision', '', 0),
(64, 1, '2024-03-04 11:22:49', '2024-03-04 11:22:49', '&nbsp;\n\n&nbsp;', 'boAt Xtend Smartwatch', '', 'inherit', 'closed', 'closed', '', '37-autosave-v1', '', '', '2024-03-04 11:22:49', '2024-03-04 11:22:49', '', 37, 'http://localhost:81/wordpress/?p=64', 0, 'revision', '', 0),
(65, 1, '2024-02-15 13:18:37', '2024-02-15 13:18:37', '', 'watch', '', 'inherit', 'open', 'closed', '', 'watch-2', '', '', '2024-02-15 13:18:37', '2024-02-15 13:18:37', '', 37, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/watch.webp', 0, 'attachment', 'image/webp', 0),
(66, 1, '2024-02-15 13:22:03', '2024-02-15 13:22:03', '', 'shoes', '', 'inherit', 'open', 'closed', '', 'shoes-2', '', '', '2024-02-15 13:22:03', '2024-02-15 13:22:03', '', 36, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/shoes.jpg', 0, 'attachment', 'image/jpeg', 0),
(67, 1, '2024-02-15 13:23:30', '2024-02-15 13:23:30', '', 'shampoo', '', 'inherit', 'open', 'closed', '', 'shampoo', '', '', '2024-02-15 13:23:30', '2024-02-15 13:23:30', '', 23, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/shampoo.jpg', 0, 'attachment', 'image/jpeg', 0),
(74, 1, '2024-02-19 09:43:11', '2024-02-19 09:43:11', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2024-02-19 09:43:11', '2024-02-19 09:43:11', '', 0, 'http://localhost:81/wordpress/?page_id=74', 0, 'page', '', 0),
(75, 1, '2024-02-19 09:43:11', '2024-02-19 09:43:11', '', 'Home', '', 'inherit', 'closed', 'closed', '', '74-revision-v1', '', '', '2024-02-19 09:43:11', '2024-02-19 09:43:11', '', 74, 'http://localhost:81/wordpress/?p=75', 0, 'revision', '', 0),
(76, 1, '2024-02-19 09:43:30', '2024-02-19 09:43:30', '', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2024-02-19 09:43:30', '2024-02-19 09:43:30', '', 14, 'http://localhost:81/wordpress/?p=76', 0, 'revision', '', 0),
(77, 1, '2024-02-19 09:48:06', '2024-02-19 09:48:06', '', 'About Us', '', 'publish', 'closed', 'closed', '', 'about-us', '', '', '2024-03-19 10:22:26', '2024-03-19 10:22:26', '', 0, 'http://localhost:81/wordpress/?page_id=77', 0, 'page', '', 0),
(78, 1, '2024-02-19 09:48:06', '2024-02-19 09:48:06', '', 'About Us', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2024-02-19 09:48:06', '2024-02-19 09:48:06', '', 77, 'http://localhost:81/wordpress/?p=78', 0, 'revision', '', 0),
(81, 1, '2024-02-20 13:02:16', '2024-02-19 09:51:23', ' ', '', '', 'publish', 'closed', 'closed', '', '81', '', '', '2024-02-20 13:02:16', '2024-02-20 13:02:16', '', 0, 'http://localhost:81/wordpress/?p=81', 1, 'nav_menu_item', '', 0),
(82, 1, '2024-02-20 13:02:16', '2024-02-19 09:51:23', ' ', '', '', 'publish', 'closed', 'closed', '', '82', '', '', '2024-02-20 13:02:16', '2024-02-20 13:02:16', '', 0, 'http://localhost:81/wordpress/?p=82', 4, 'nav_menu_item', '', 0),
(86, 1, '2024-02-20 13:02:16', '2024-02-19 10:05:52', ' ', '', '', 'publish', 'closed', 'closed', '', '86', '', '', '2024-02-20 13:02:16', '2024-02-20 13:02:16', '', 0, 'http://localhost:81/wordpress/?p=86', 2, 'nav_menu_item', '', 0),
(90, 1, '2024-02-20 06:00:21', '2024-02-20 06:00:21', '', 'imgpsh_fullsize_anim', '', 'inherit', 'open', 'closed', '', 'imgpsh_fullsize_anim', '', '', '2024-02-20 06:00:21', '2024-02-20 06:00:21', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/imgpsh_fullsize_anim.png', 0, 'attachment', 'image/png', 0),
(94, 1, '2024-02-20 12:03:15', '2024-02-20 12:03:15', '', 'Cart', '', 'publish', 'closed', 'closed', '', 'add-to-cart', '', '', '2024-02-20 12:12:42', '2024-02-20 12:12:42', '', 0, 'http://localhost:81/wordpress/?page_id=94', 0, 'page', '', 0),
(95, 1, '2024-02-20 12:03:15', '2024-02-20 12:03:15', '', 'Add To Cart', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2024-02-20 12:03:15', '2024-02-20 12:03:15', '', 94, 'http://localhost:81/wordpress/?p=95', 0, 'revision', '', 0),
(96, 1, '2024-02-20 12:04:12', '2024-02-20 12:04:12', '', 'Cart', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2024-02-20 12:04:12', '2024-02-20 12:04:12', '', 94, 'http://localhost:81/wordpress/?p=96', 0, 'revision', '', 0),
(97, 1, '2024-02-20 13:02:16', '2024-02-20 12:56:21', ' ', '', '', 'publish', 'closed', 'closed', '', '97', '', '', '2024-02-20 13:02:16', '2024-02-20 13:02:16', '', 0, 'http://localhost:81/wordpress/?p=97', 3, 'nav_menu_item', '', 0),
(98, 1, '2024-02-20 13:02:16', '2024-02-20 13:02:16', ' ', '', '', 'publish', 'closed', 'closed', '', '98', '', '', '2024-02-20 13:02:16', '2024-02-20 13:02:16', '', 0, 'http://localhost:81/wordpress/?p=98', 5, 'nav_menu_item', '', 0),
(99, 1, '2024-02-23 06:33:48', '2024-02-23 06:33:48', '', 'Classmate Notebook', '', 'publish', 'open', 'closed', '', 'book', '', '', '2024-03-06 11:42:07', '2024-03-06 11:42:07', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=99', 0, 'product', '', 0),
(100, 1, '2024-02-23 06:33:44', '2024-02-23 06:33:44', '', '1111', '', 'inherit', 'open', 'closed', '', '1111', '', '', '2024-02-23 06:33:44', '2024-02-23 06:33:44', '', 99, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/1111.jpg', 0, 'attachment', 'image/jpeg', 0),
(101, 1, '2024-02-23 06:39:21', '2024-02-23 06:39:21', '', 'iphone', '', 'trash', 'open', 'closed', '', 'iphone__trashed', '', '', '2024-03-04 11:08:15', '2024-03-04 11:08:15', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=101', 0, 'product', '', 0),
(102, 1, '2024-02-23 06:39:17', '2024-02-23 06:39:17', '', 'i', '', 'inherit', 'open', 'closed', '', 'i', '', '', '2024-02-23 06:39:17', '2024-02-23 06:39:17', '', 101, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/i.jpg', 0, 'attachment', 'image/jpeg', 0),
(103, 1, '2024-02-23 10:54:26', '2024-02-23 10:54:26', '', 'Checkout', '', 'publish', 'closed', 'closed', '', 'checkout', '', '', '2024-02-27 05:55:12', '2024-02-27 05:55:12', '', 0, 'http://localhost:81/wordpress/?page_id=103', 0, 'page', '', 0),
(104, 1, '2024-02-23 10:54:26', '2024-02-23 10:54:26', '', 'Checkout', '', 'inherit', 'closed', 'closed', '', '103-revision-v1', '', '', '2024-02-23 10:54:26', '2024-02-23 10:54:26', '', 103, 'http://localhost:81/wordpress/?p=104', 0, 'revision', '', 0),
(107, 1, '2024-02-27 13:38:16', '2024-02-27 13:38:16', 'Test post content', 'Test post', '', 'trash', 'open', 'closed', '', '__trashed-3', '', '', '2024-02-27 13:38:16', '2024-02-27 13:38:16', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=107', 0, 'shoporder', '', 0),
(108, 1, '2024-02-27 13:38:17', '2024-02-27 13:38:17', 'Test post content', 'Test post', '', 'trash', 'open', 'closed', '', '__trashed-4', '', '', '2024-02-27 13:38:17', '2024-02-27 13:38:17', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=108', 0, 'shoporder', '', 0),
(109, 1, '2024-02-27 13:38:15', '2024-02-27 13:38:15', 'Test post content', 'Test post', '', 'trash', 'open', 'closed', '', '__trashed-2', '', '', '2024-02-27 13:38:15', '2024-02-27 13:38:15', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=109', 0, 'shoporder', '', 0),
(110, 1, '2024-02-27 13:38:13', '2024-02-27 13:38:13', 'Test post content', 'Test post', '', 'trash', 'open', 'closed', '', '__trashed', '', '', '2024-02-27 13:38:13', '2024-02-27 13:38:13', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=110', 0, 'shoporder', '', 0),
(111, 1, '2024-02-27 13:38:18', '2024-02-27 13:38:18', 'Test post content', 'Test post', '', 'trash', 'open', 'closed', '', '__trashed-5', '', '', '2024-02-27 13:38:18', '2024-02-27 13:38:18', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=111', 0, 'shoporder', '', 0),
(112, 1, '2024-02-27 13:49:33', '2024-02-27 13:49:33', 'Test post content', 'Test post', '', 'trash', 'open', 'closed', '', '__trashed-6', '', '', '2024-02-27 13:49:33', '2024-02-27 13:49:33', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=112', 0, 'shoporder', '', 0),
(113, 1, '2024-02-27 13:59:15', '2024-02-27 13:59:15', 'Test post content', 'Test post', '', 'trash', 'open', 'closed', '', '__trashed-10', '', '', '2024-02-27 13:59:15', '2024-02-27 13:59:15', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=113', 0, 'shoporder', '', 0),
(114, 1, '2024-02-27 13:49:35', '2024-02-27 13:49:35', 'Test post content', 'Test post', '', 'trash', 'open', 'closed', '', '__trashed-7', '', '', '2024-02-27 13:49:35', '2024-02-27 13:49:35', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=114', 0, 'shoporder', '', 0),
(115, 1, '2024-03-14 06:49:28', '2024-03-14 06:49:28', 'Test post content', 'Test post', '', 'trash', 'open', 'closed', '', '__trashed-24', '', '', '2024-03-14 06:49:28', '2024-03-14 06:49:28', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=115', 0, 'shoporder', '', 0),
(116, 1, '2024-02-27 13:59:13', '2024-02-27 13:59:13', 'Test post content', 'Test post', '', 'trash', 'open', 'closed', '', '__trashed-9', '', '', '2024-02-27 13:59:13', '2024-02-27 13:59:13', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=116', 0, 'shoporder', '', 0),
(117, 1, '2024-02-27 13:59:11', '2024-02-27 13:59:11', 'Test post content', 'Test post', '', 'trash', 'open', 'closed', '', '__trashed-8', '', '', '2024-02-27 13:59:11', '2024-02-27 13:59:11', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=117', 0, 'shoporder', '', 0),
(118, 1, '2024-02-28 06:57:29', '2024-02-28 06:57:29', 'jignaRavaljraval106001@gmail.comUttam mangal soc navsariasdasIndiaGujarat396424cash-on-delivery', 'OrderData', '', 'trash', 'open', 'closed', '', '__trashed-11', '', '', '2024-02-28 06:57:29', '2024-02-28 06:57:29', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=118', 0, 'shoporder', '', 0),
(119, 1, '2024-03-01 06:14:41', '2024-03-01 06:14:41', 'jigna Raval', 'jigna Raval', '', 'trash', 'open', 'closed', '', '__trashed-19', '', '', '2024-03-01 06:14:41', '2024-03-01 06:14:41', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=119', 0, 'shoporder', '', 0),
(120, 1, '2024-03-14 06:49:30', '2024-03-14 06:49:30', 'Shreyash Makadia', 'Shreyash Makadia', '', 'trash', 'open', 'closed', '', '__trashed-25', '', '', '2024-03-14 06:49:30', '2024-03-14 06:49:30', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=120', 0, 'shoporder', '', 0),
(121, 1, '2024-02-28 06:58:15', '2024-02-28 06:58:15', ' ', '', '', 'trash', 'open', 'closed', '', '__trashed-12', '', '', '2024-02-28 06:58:15', '2024-02-28 06:58:15', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=121', 0, 'shoporder', '', 0),
(122, 1, '2024-02-28 06:59:35', '0000-00-00 00:00:00', 'Priyank Raval', 'Priyank Raval', '', 'draft', 'open', 'closed', '', '', '', '', '2024-02-28 06:59:35', '0000-00-00 00:00:00', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&p=122', 0, 'shoporder', '', 0),
(147, 1, '2024-02-29 10:22:19', '2024-02-29 10:22:19', '', 'Thankyou', '', 'publish', 'closed', 'closed', '', 'thankyou', '', '', '2024-02-29 10:22:19', '2024-02-29 10:22:19', '', 0, 'http://localhost:81/wordpress/?page_id=147', 0, 'page', '', 0),
(148, 1, '2024-02-29 10:22:19', '2024-02-29 10:22:19', '', 'Thankyou', '', 'inherit', 'closed', 'closed', '', '147-revision-v1', '', '', '2024-02-29 10:22:19', '2024-02-29 10:22:19', '', 147, 'http://localhost:81/wordpress/?p=148', 0, 'revision', '', 0),
(149, 1, '2024-02-29 11:02:58', '2024-02-29 11:02:58', 'Veer Shah', 'Veer Shah', '', 'trash', 'closed', 'closed', '', '__trashed-13', '', '', '2024-02-29 11:02:58', '2024-02-29 11:02:58', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=149', 0, 'shoporder', '', 0),
(150, 1, '2024-02-29 11:03:00', '2024-02-29 11:03:00', 'Veer Shah', 'Veer Shah', '', 'trash', 'closed', 'closed', '', '__trashed-14', '', '', '2024-02-29 11:03:00', '2024-02-29 11:03:00', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=150', 0, 'shoporder', '', 0),
(151, 1, '2024-03-14 06:49:31', '2024-03-14 06:49:31', 'Veer Shah', 'Veer Shah', '', 'trash', 'closed', 'closed', '', '__trashed-26', '', '', '2024-03-14 06:49:31', '2024-03-14 06:49:31', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=151', 0, 'shoporder', '', 0),
(152, 1, '2024-02-29 11:45:51', '2024-02-29 11:45:51', 'Yash Patel', 'Yash Patel', '', 'trash', 'closed', 'closed', '', '__trashed-17', '', '', '2024-02-29 11:45:51', '2024-02-29 11:45:51', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=152', 0, 'shoporder', '', 0),
(153, 1, '2024-02-29 11:45:47', '2024-02-29 11:45:47', 'Yash Patel', 'Yash Patel', '', 'trash', 'closed', 'closed', '', '__trashed-16', '', '', '2024-02-29 11:45:47', '2024-02-29 11:45:47', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=153', 0, 'shoporder', '', 0),
(154, 1, '2024-02-29 11:45:45', '2024-02-29 11:45:45', 'Yash Patel', 'Yash Patel', '', 'trash', 'closed', 'closed', '', '__trashed-15', '', '', '2024-02-29 11:45:45', '2024-02-29 11:45:45', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=154', 0, 'shoporder', '', 0),
(155, 1, '2024-02-29 11:54:46', '2024-02-29 11:54:46', 'Yash Patel', 'Yash Patel', '', 'trash', 'closed', 'closed', '', '__trashed-18', '', '', '2024-02-29 11:54:46', '2024-02-29 11:54:46', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=155', 0, 'shoporder', '', 0),
(156, 1, '2024-03-14 06:49:25', '2024-03-14 06:49:25', 'Yash Patel', 'Yash Patel', '', 'trash', 'closed', 'closed', '', '__trashed-23', '', '', '2024-03-14 06:49:25', '2024-03-14 06:49:25', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=156', 0, 'shoporder', '', 0),
(157, 1, '2024-03-14 06:49:23', '2024-03-14 06:49:23', 'jigna Raval', 'jigna Raval', '', 'trash', 'closed', 'closed', '', '__trashed-22', '', '', '2024-03-14 06:49:23', '2024-03-14 06:49:23', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=157', 0, 'shoporder', '', 0),
(158, 1, '2024-03-01 10:53:07', '2024-03-01 10:53:07', '', 'registration', '', 'publish', 'closed', 'closed', '', 'registration', '', '', '2024-03-01 10:54:28', '2024-03-01 10:54:28', '', 0, 'http://localhost:81/wordpress/?page_id=158', 0, 'page', '', 0),
(159, 1, '2024-03-01 10:53:07', '2024-03-01 10:53:07', '', 'registration', '', 'inherit', 'closed', 'closed', '', '158-revision-v1', '', '', '2024-03-01 10:53:07', '2024-03-01 10:53:07', '', 158, 'http://localhost:81/wordpress/?p=159', 0, 'revision', '', 0),
(160, 1, '2024-03-01 10:54:51', '2024-03-01 10:54:51', '', 'login', '', 'publish', 'closed', 'closed', '', 'login', '', '', '2024-03-06 07:21:37', '2024-03-06 07:21:37', '', 0, 'http://localhost:81/wordpress/?page_id=160', 0, 'page', '', 0),
(161, 1, '2024-03-01 10:54:51', '2024-03-01 10:54:51', '', 'login', '', 'inherit', 'closed', 'closed', '', '160-revision-v1', '', '', '2024-03-01 10:54:51', '2024-03-01 10:54:51', '', 160, 'http://localhost:81/wordpress/?p=161', 0, 'revision', '', 0),
(163, 1, '2024-03-04 11:09:58', '2024-03-04 11:09:58', '', 'tresme', '', 'inherit', 'open', 'closed', '', 'tresme', '', '', '2024-03-04 11:09:58', '2024-03-04 11:09:58', '', 23, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/tresme.jpg', 0, 'attachment', 'image/jpeg', 0),
(164, 1, '2024-03-04 11:13:05', '2024-03-04 11:13:05', '', 'Dove Hair Fall Rescue Shampoo', '', 'publish', 'open', 'closed', '', 'dove-hair-fall-rescue-shampoo', '', '', '2024-03-06 11:41:46', '2024-03-06 11:41:46', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=164', 0, 'product', '', 0),
(165, 1, '2024-03-04 11:12:23', '2024-03-04 11:12:23', '', 'dove', '', 'inherit', 'open', 'closed', '', 'dove', '', '', '2024-03-04 11:12:23', '2024-03-04 11:12:23', '', 164, 'http://localhost:81/wordpress/wp-content/uploads/2024/03/dove.jpg', 0, 'attachment', 'image/jpeg', 0),
(166, 1, '2024-03-04 11:14:33', '2024-03-04 11:14:33', '', 'Classmate Notebook', '', 'inherit', 'closed', 'closed', '', '99-autosave-v1', '', '', '2024-03-04 11:14:33', '2024-03-04 11:14:33', '', 99, 'http://localhost:81/wordpress/?p=166', 0, 'revision', '', 0),
(167, 1, '2024-03-04 11:14:36', '2024-03-04 11:14:36', '', 'ClassmateSingleLineNotebook172Pages_600x600', '', 'inherit', 'open', 'closed', '', 'classmatesinglelinenotebook172pages_600x600', '', '', '2024-03-04 11:14:36', '2024-03-04 11:14:36', '', 99, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/ClassmateSingleLineNotebook172Pages_600x600.jpg', 0, 'attachment', 'image/jpeg', 0),
(168, 1, '2024-03-04 11:19:07', '2024-03-04 11:19:07', '', 'Navneet Note Book', '', 'publish', 'open', 'closed', '', 'navneet-note-book', '', '', '2024-03-20 12:09:35', '2024-03-20 12:09:35', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=168', 0, 'product', '', 0),
(169, 1, '2024-03-04 11:19:01', '2024-03-04 11:19:01', '', '61U0hf1EcbL', '', 'inherit', 'open', 'closed', '', '61u0hf1ecbl', '', '', '2024-03-04 11:19:01', '2024-03-04 11:19:01', '', 168, 'http://localhost:81/wordpress/wp-content/uploads/2024/03/61U0hf1EcbL.jpg', 0, 'attachment', 'image/jpeg', 0),
(170, 1, '2024-03-04 11:22:33', '2024-03-04 11:22:33', '', 'dddd', '', 'inherit', 'open', 'closed', '', 'dddd', '', '', '2024-03-04 11:22:33', '2024-03-04 11:22:33', '', 37, 'http://localhost:81/wordpress/wp-content/uploads/2024/02/dddd.webp', 0, 'attachment', 'image/webp', 0),
(171, 1, '2024-03-04 11:24:45', '2024-03-04 11:24:45', '', 'Fastrack 38024pp25', '', 'publish', 'open', 'closed', '', 'fastrack-38024pp25', '', '', '2024-03-20 10:47:47', '2024-03-20 10:47:47', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=171', 0, 'product', '', 0),
(172, 1, '2024-03-04 11:24:28', '2024-03-04 11:24:28', '', '61Fn1C6+5YL', '', 'inherit', 'open', 'closed', '', '61fn1c65yl', '', '', '2024-03-04 11:24:28', '2024-03-04 11:24:28', '', 171, 'http://localhost:81/wordpress/wp-content/uploads/2024/03/61Fn1C65YL.jpg', 0, 'attachment', 'image/jpeg', 0),
(173, 1, '2024-03-04 11:26:44', '2024-03-04 11:26:44', '', 'Women\'s Running Shoes PUMA', '', 'inherit', 'closed', 'closed', '', '36-autosave-v1', '', '', '2024-03-04 11:26:44', '2024-03-04 11:26:44', '', 36, 'http://localhost:81/wordpress/?p=173', 0, 'revision', '', 0),
(174, 1, '2024-03-04 11:28:23', '2024-03-04 11:28:23', '', 'Nike Shoes', '', 'publish', 'open', 'closed', '', 'nike-shoes', '', '', '2024-03-06 11:41:06', '2024-03-06 11:41:06', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=174', 0, 'product', '', 0),
(175, 1, '2024-03-04 11:27:58', '2024-03-04 11:27:58', '', 'shopping', '', 'inherit', 'open', 'closed', '', 'shopping', '', '', '2024-03-04 11:27:58', '2024-03-04 11:27:58', '', 174, 'http://localhost:81/wordpress/wp-content/uploads/2024/03/shopping.webp', 0, 'attachment', 'image/webp', 0),
(179, 1, '2024-03-05 05:33:03', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-05 05:33:03', '0000-00-00 00:00:00', '', 0, 'http://localhost:81/wordpress/?p=179', 1, 'nav_menu_item', '', 0),
(181, 1, '2024-03-05 05:33:03', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-05 05:33:03', '0000-00-00 00:00:00', '', 0, 'http://localhost:81/wordpress/?p=181', 1, 'nav_menu_item', '', 0),
(183, 1, '2024-03-05 05:33:03', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-05 05:33:03', '0000-00-00 00:00:00', '', 0, 'http://localhost:81/wordpress/?p=183', 1, 'nav_menu_item', '', 0),
(184, 1, '2024-03-05 05:33:03', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-05 05:33:03', '0000-00-00 00:00:00', '', 0, 'http://localhost:81/wordpress/?p=184', 1, 'nav_menu_item', '', 0),
(200, 1, '2024-03-05 07:25:06', '2024-03-05 07:25:06', '', 'Brand_list', '', 'publish', 'closed', 'closed', '', 'brand_list', '', '', '2024-03-05 07:27:11', '2024-03-05 07:27:11', '', 0, 'http://localhost:81/wordpress/?page_id=200', 0, 'page', '', 0),
(201, 1, '2024-03-05 07:25:00', '2024-03-05 07:25:00', '', 'brand_list', '', 'inherit', 'closed', 'closed', '', '200-revision-v1', '', '', '2024-03-05 07:25:00', '2024-03-05 07:25:00', '', 200, 'http://localhost:81/wordpress/?p=201', 0, 'revision', '', 0),
(202, 1, '2024-03-05 07:25:06', '2024-03-05 07:25:06', '', 'Brand_list', '', 'inherit', 'closed', 'closed', '', '200-revision-v1', '', '', '2024-03-05 07:25:06', '2024-03-05 07:25:06', '', 200, 'http://localhost:81/wordpress/?p=202', 0, 'revision', '', 0),
(203, 1, '2024-03-05 07:27:42', '2024-03-05 07:27:42', '', 'Product_category', '', 'publish', 'closed', 'closed', '', 'product_category', '', '', '2024-03-05 07:27:42', '2024-03-05 07:27:42', '', 0, 'http://localhost:81/wordpress/?page_id=203', 0, 'page', '', 0),
(204, 1, '2024-03-05 07:27:42', '2024-03-05 07:27:42', '', 'Product_category', '', 'inherit', 'closed', 'closed', '', '203-revision-v1', '', '', '2024-03-05 07:27:42', '2024-03-05 07:27:42', '', 203, 'http://localhost:81/wordpress/?p=204', 0, 'revision', '', 0),
(205, 1, '2024-03-05 09:38:19', '2024-03-05 09:38:19', '', 'Airdopes-131', '', 'publish', 'open', 'closed', '', 'airdopes-131', '', '', '2024-03-06 11:40:38', '2024-03-06 11:40:38', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=205', 0, 'product', '', 0),
(206, 1, '2024-03-05 09:38:15', '2024-03-05 09:38:15', '', 'c2386af9-4349-432f-8ba5-2b6aa06025c8_600x', '', 'inherit', 'open', 'closed', '', 'c2386af9-4349-432f-8ba5-2b6aa06025c8_600x', '', '', '2024-03-05 09:38:15', '2024-03-05 09:38:15', '', 205, 'http://localhost:81/wordpress/wp-content/uploads/2024/03/c2386af9-4349-432f-8ba5-2b6aa06025c8_600x.webp', 0, 'attachment', 'image/webp', 0),
(209, 1, '2024-03-05 10:50:19', '2024-03-05 10:50:19', '', 'Classmate Octane Ball Pen', '', 'publish', 'open', 'closed', '', 'classmate-octane-ball-pen', '', '', '2024-03-20 10:09:27', '2024-03-20 10:09:27', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=209', 0, 'product', '', 0),
(210, 1, '2024-03-05 10:50:14', '2024-03-05 10:50:14', '', 'shg', '', 'inherit', 'open', 'closed', '', 'shg', '', '', '2024-03-05 10:50:14', '2024-03-05 10:50:14', '', 209, 'http://localhost:81/wordpress/wp-content/uploads/2024/03/shg.webp', 0, 'attachment', 'image/webp', 0),
(211, 1, '2024-03-06 07:06:16', '2024-03-06 07:06:16', '<!-- wp:shortcode -->\n[wporg]\n<!-- /wp:shortcode -->', 'login', '', 'inherit', 'closed', 'closed', '', '160-revision-v1', '', '', '2024-03-06 07:06:16', '2024-03-06 07:06:16', '', 160, 'http://localhost:81/wordpress/?p=211', 0, 'revision', '', 0),
(213, 1, '2024-03-06 07:09:24', '2024-03-06 07:09:24', '<!-- wp:shortcode -->\nwporg\n<!-- /wp:shortcode -->', 'login', '', 'inherit', 'closed', 'closed', '', '160-revision-v1', '', '', '2024-03-06 07:09:24', '2024-03-06 07:09:24', '', 160, 'http://localhost:81/wordpress/?p=213', 0, 'revision', '', 0),
(214, 1, '2024-03-06 07:09:44', '2024-03-06 07:09:44', '<!-- wp:paragraph -->\n<p>[wporg]</p>\n<!-- /wp:paragraph -->', 'login', '', 'inherit', 'closed', 'closed', '', '160-revision-v1', '', '', '2024-03-06 07:09:44', '2024-03-06 07:09:44', '', 160, 'http://localhost:81/wordpress/?p=214', 0, 'revision', '', 0),
(215, 1, '2024-03-06 07:10:13', '2024-03-06 07:10:13', '', 'login', '', 'inherit', 'closed', 'closed', '', '160-revision-v1', '', '', '2024-03-06 07:10:13', '2024-03-06 07:10:13', '', 160, 'http://localhost:81/wordpress/?p=215', 0, 'revision', '', 0),
(216, 1, '2024-03-11 13:35:16', '2024-03-11 13:35:16', 'Deep Shah', 'Deep Shah', '', 'trash', 'closed', 'closed', '', '__trashed-20', '', '', '2024-03-11 13:35:16', '2024-03-11 13:35:16', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=216', 0, 'shoporder', '', 0),
(217, 1, '2024-03-11 13:35:18', '2024-03-11 13:35:18', ' ', '', '', 'trash', 'closed', 'closed', '', '__trashed-21', '', '', '2024-03-11 13:35:18', '2024-03-11 13:35:18', '', 0, 'http://localhost:81/wordpress/?post_type=shoporder&#038;p=217', 0, 'shoporder', '', 0),
(220, 1, '2024-03-13 11:58:26', '2024-03-13 11:58:26', '', 'All Orders', '', 'publish', 'closed', 'closed', '', 'your-order', '', '', '2024-03-14 07:00:50', '2024-03-14 07:00:50', '', 0, 'http://192.168.1.4/wordpress/?page_id=220', 0, 'page', '', 0),
(221, 1, '2024-03-13 11:58:24', '2024-03-13 11:58:24', '', 'Your order', '', 'inherit', 'closed', 'closed', '', '220-revision-v1', '', '', '2024-03-13 11:58:24', '2024-03-13 11:58:24', '', 220, 'http://192.168.1.4/wordpress/?p=221', 0, 'revision', '', 0),
(222, 1, '2024-03-13 12:00:41', '2024-03-13 12:00:41', '', 'Orderdetails', '', 'inherit', 'closed', 'closed', '', '220-revision-v1', '', '', '2024-03-13 12:00:41', '2024-03-13 12:00:41', '', 220, 'http://192.168.1.4/wordpress/?p=222', 0, 'revision', '', 0),
(223, 1, '2024-03-13 12:01:34', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-13 12:01:34', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.4/wordpress/?p=223', 1, 'nav_menu_item', '', 0),
(226, 8, '2024-03-14 06:50:23', '0000-00-00 00:00:00', 'jigna Raval', 'jigna Raval', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-14 06:50:23', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.4/wordpress/?post_type=shoporder&p=226', 0, 'shoporder', '', 0),
(227, 8, '2024-03-14 06:54:45', '0000-00-00 00:00:00', 'jigna Raval', 'jigna Raval', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-14 06:54:45', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.4/wordpress/?post_type=shoporder&p=227', 0, 'shoporder', '', 0),
(228, 1, '2024-03-14 06:56:11', '2024-03-14 06:56:11', '', 'Orders', '', 'inherit', 'closed', 'closed', '', '220-revision-v1', '', '', '2024-03-14 06:56:11', '2024-03-14 06:56:11', '', 220, 'http://192.168.1.4/wordpress/?p=228', 0, 'revision', '', 0),
(229, 1, '2024-03-14 06:58:35', '2024-03-14 06:58:35', '', 'All Orders', '', 'inherit', 'closed', 'closed', '', '220-revision-v1', '', '', '2024-03-14 06:58:35', '2024-03-14 06:58:35', '', 220, 'http://192.168.1.4/wordpress/?p=229', 0, 'revision', '', 0),
(230, 1, '2024-03-14 06:59:17', '2024-03-14 06:59:17', '', 'AllOrders', '', 'inherit', 'closed', 'closed', '', '220-revision-v1', '', '', '2024-03-14 06:59:17', '2024-03-14 06:59:17', '', 220, 'http://192.168.1.4/wordpress/?p=230', 0, 'revision', '', 0),
(232, 1, '2024-03-14 07:00:50', '2024-03-14 07:00:50', '', 'All Orders', '', 'inherit', 'closed', 'closed', '', '220-revision-v1', '', '', '2024-03-14 07:00:50', '2024-03-14 07:00:50', '', 220, 'http://192.168.1.4/wordpress/?p=232', 0, 'revision', '', 0),
(233, 1, '2024-03-14 11:40:16', '2024-03-14 11:40:16', '', 'order detail', '', 'publish', 'closed', 'closed', '', 'orderdetail', '', '', '2024-03-14 12:15:12', '2024-03-14 12:15:12', '', 0, 'http://192.168.1.4/wordpress/?page_id=233', 0, 'page', '', 0),
(235, 1, '2024-03-14 11:40:16', '2024-03-14 11:40:16', '', 'orderhistory', '', 'inherit', 'closed', 'closed', '', '233-revision-v1', '', '', '2024-03-14 11:40:16', '2024-03-14 11:40:16', '', 233, 'http://192.168.1.4/wordpress/?p=235', 0, 'revision', '', 0),
(236, 1, '2024-03-14 11:40:39', '2024-03-14 11:40:39', '', 'order history', '', 'inherit', 'closed', 'closed', '', '233-revision-v1', '', '', '2024-03-14 11:40:39', '2024-03-14 11:40:39', '', 233, 'http://192.168.1.4/wordpress/?p=236', 0, 'revision', '', 0),
(237, 1, '2024-03-14 11:55:18', '2024-03-14 11:55:18', '', 'order detail', '', 'inherit', 'closed', 'closed', '', '233-revision-v1', '', '', '2024-03-14 11:55:18', '2024-03-14 11:55:18', '', 233, 'http://192.168.1.4/wordpress/?p=237', 0, 'revision', '', 0),
(238, 1, '2024-03-14 12:24:31', '2024-03-14 12:24:31', '', 'Logout', '', 'publish', 'closed', 'closed', '', 'logout', '', '', '2024-03-18 07:05:23', '2024-03-18 07:05:23', '', 0, 'http://192.168.1.4/wordpress/?page_id=238', 0, 'page', '', 0),
(240, 1, '2024-03-14 12:24:31', '2024-03-14 12:24:31', '', 'Logout', '', 'inherit', 'closed', 'closed', '', '238-revision-v1', '', '', '2024-03-14 12:24:31', '2024-03-14 12:24:31', '', 238, 'http://192.168.1.4/wordpress/?p=240', 0, 'revision', '', 0),
(242, 1, '2024-03-21 11:58:08', '2024-03-14 13:26:18', ' ', '', '', 'publish', 'closed', 'closed', '', '242', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.4/wordpress/?p=242', 10, 'nav_menu_item', '', 0),
(244, 1, '2024-03-21 11:58:08', '2024-03-14 13:26:18', ' ', '', '', 'publish', 'closed', 'closed', '', '244', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.4/wordpress/?p=244', 11, 'nav_menu_item', '', 0),
(245, 1, '2024-03-21 11:58:08', '2024-03-14 13:26:18', ' ', '', '', 'publish', 'closed', 'closed', '', '245', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.4/wordpress/?p=245', 8, 'nav_menu_item', '', 0),
(247, 1, '2024-03-21 11:58:08', '2024-03-14 13:26:18', ' ', '', '', 'publish', 'closed', 'closed', '', '247', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.4/wordpress/?p=247', 1, 'nav_menu_item', '', 0),
(248, 1, '2024-03-21 11:58:08', '2024-03-14 13:28:20', ' ', '', '', 'publish', 'closed', 'closed', '', '248', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.4/wordpress/?p=248', 13, 'nav_menu_item', '', 0),
(249, 1, '2024-03-21 11:58:08', '2024-03-14 13:50:30', '', 'Shop', '', 'publish', 'closed', 'closed', '', '249', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.4/wordpress/?p=249', 2, 'nav_menu_item', '', 0),
(250, 1, '2024-03-19 11:19:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:19:30', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=250', 1, 'nav_menu_item', '', 0),
(251, 1, '2024-03-19 11:19:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:19:30', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=251', 1, 'nav_menu_item', '', 0),
(252, 1, '2024-03-19 11:19:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:19:30', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=252', 1, 'nav_menu_item', '', 0),
(253, 1, '2024-03-19 11:19:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:19:30', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=253', 1, 'nav_menu_item', '', 0),
(254, 1, '2024-03-19 11:19:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:19:30', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=254', 1, 'nav_menu_item', '', 0),
(255, 1, '2024-03-19 11:19:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:19:30', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=255', 1, 'nav_menu_item', '', 0),
(256, 1, '2024-03-19 11:19:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:19:30', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=256', 1, 'nav_menu_item', '', 0),
(257, 1, '2024-03-19 11:19:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:19:30', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=257', 1, 'nav_menu_item', '', 0),
(258, 1, '2024-03-19 11:19:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:19:30', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=258', 1, 'nav_menu_item', '', 0),
(259, 1, '2024-03-19 11:19:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:19:30', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=259', 1, 'nav_menu_item', '', 0),
(260, 1, '2024-03-19 11:20:18', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:20:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=260', 1, 'nav_menu_item', '', 0),
(261, 1, '2024-03-19 11:20:18', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:20:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=261', 1, 'nav_menu_item', '', 0),
(262, 1, '2024-03-19 11:20:18', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:20:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=262', 1, 'nav_menu_item', '', 0),
(263, 1, '2024-03-19 11:20:18', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:20:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=263', 1, 'nav_menu_item', '', 0),
(264, 1, '2024-03-19 11:20:18', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:20:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=264', 1, 'nav_menu_item', '', 0),
(265, 1, '2024-03-19 11:20:18', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:20:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=265', 1, 'nav_menu_item', '', 0),
(266, 1, '2024-03-19 11:20:18', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:20:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=266', 1, 'nav_menu_item', '', 0),
(267, 1, '2024-03-19 11:20:18', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:20:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=267', 1, 'nav_menu_item', '', 0),
(268, 1, '2024-03-19 11:20:18', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:20:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=268', 1, 'nav_menu_item', '', 0),
(269, 1, '2024-03-19 11:20:18', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:20:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=269', 1, 'nav_menu_item', '', 0),
(270, 1, '2024-03-19 11:20:18', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:20:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=270', 1, 'nav_menu_item', '', 0),
(271, 1, '2024-03-19 11:28:49', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:28:49', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=271', 1, 'nav_menu_item', '', 0),
(272, 1, '2024-03-19 11:28:59', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:28:59', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=272', 1, 'nav_menu_item', '', 0),
(273, 1, '2024-03-19 11:32:54', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:32:54', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=273', 1, 'nav_menu_item', '', 0),
(274, 1, '2024-03-19 11:33:23', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:33:23', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=274', 1, 'nav_menu_item', '', 0),
(275, 1, '2024-03-19 11:33:41', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-19 11:33:41', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=275', 1, 'nav_menu_item', '', 0),
(285, 1, '2024-03-20 05:43:08', '2024-03-20 05:43:08', '', '1200px-Boat_Logo.webp', '', 'inherit', 'open', 'closed', '', '1200px-boat_logo-webp', '', '', '2024-03-20 05:43:08', '2024-03-20 05:43:08', '', 0, 'http://192.168.1.5/wordpress/wp-content/uploads/2024/03/1200px-Boat_Logo.webp.png', 0, 'attachment', 'image/png', 0),
(286, 0, '2024-03-20 07:45:24', '2024-03-20 07:45:24', ' ', '', '', 'trash', 'closed', 'closed', '', '__trashed', '', '', '2024-03-20 07:45:24', '2024-03-20 07:45:24', '', 0, 'http://192.168.1.5/wordpress/?post_type=contact&#038;p=286', 0, 'contact', '', 0),
(287, 0, '2024-03-20 07:45:26', '2024-03-20 07:45:26', ' ', '', '', 'trash', 'closed', 'closed', '', '__trashed-2', '', '', '2024-03-20 07:45:26', '2024-03-20 07:45:26', '', 0, 'http://192.168.1.5/wordpress/?post_type=contact&#038;p=287', 0, 'contact', '', 0),
(288, 0, '2024-03-20 07:50:00', '2024-03-20 07:50:00', ' ', '', '', 'trash', 'closed', 'closed', '', '__trashed-3', '', '', '2024-03-20 07:50:00', '2024-03-20 07:50:00', '', 0, 'http://192.168.1.5/wordpress/?post_type=contact&#038;p=288', 0, 'contact', '', 0),
(289, 0, '2024-03-20 07:50:02', '2024-03-20 07:50:02', ' ', '', '', 'trash', 'closed', 'closed', '', '__trashed-4', '', '', '2024-03-20 07:50:02', '2024-03-20 07:50:02', '', 0, 'http://192.168.1.5/wordpress/?post_type=contact&#038;p=289', 0, 'contact', '', 0),
(290, 0, '2024-03-20 07:50:03', '2024-03-20 07:50:03', ' ', '', '', 'trash', 'closed', 'closed', '', '__trashed-5', '', '', '2024-03-20 07:50:03', '2024-03-20 07:50:03', '', 0, 'http://192.168.1.5/wordpress/?post_type=contact&#038;p=290', 0, 'contact', '', 0),
(291, 0, '2024-03-20 08:00:29', '0000-00-00 00:00:00', '', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-20 08:00:29', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?post_type=shoporder&p=291', 0, 'shoporder', '', 0),
(292, 0, '2024-03-20 08:08:09', '0000-00-00 00:00:00', 'Jigna Raval', 'Jigna Raval', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-20 08:08:09', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?post_type=contact&p=292', 0, 'contact', '', 0),
(293, 1, '2024-03-20 10:09:17', '2024-03-20 10:09:17', '', '61eaKfHFFpL._AC_UF350,350_QL80_', '', 'inherit', 'open', 'closed', '', '61eakfhffpl-_ac_uf350350_ql80_', '', '', '2024-03-20 10:09:17', '2024-03-20 10:09:17', '', 209, 'http://192.168.1.5/wordpress/wp-content/uploads/2024/03/61eaKfHFFpL._AC_UF350350_QL80_.jpg', 0, 'attachment', 'image/jpeg', 0),
(294, 1, '2024-03-20 10:47:40', '2024-03-20 10:47:40', '', '38094PP01_1', '', 'inherit', 'open', 'closed', '', '38094pp01_1', '', '', '2024-03-20 10:47:40', '2024-03-20 10:47:40', '', 171, 'http://192.168.1.5/wordpress/wp-content/uploads/2024/03/38094PP01_1.jpg', 0, 'attachment', 'image/jpeg', 0),
(295, 1, '2024-03-20 12:08:51', '2024-03-20 12:08:51', '', 'SideAngle2edited_9af5ad42-bd7d-4a1c-aa03-', '', 'inherit', 'open', 'closed', '', 'sideangle2edited_9af5ad42-bd7d-4a1c-aa03', '', '', '2024-03-20 12:08:51', '2024-03-20 12:08:51', '', 168, 'http://192.168.1.5/wordpress/wp-content/uploads/2024/03/SideAngle2edited_9af5ad42-bd7d-4a1c-aa03-.webp', 0, 'attachment', 'image/webp', 0),
(296, 1, '2024-03-20 12:09:32', '2024-03-20 12:09:32', '', 'download (1)', '', 'inherit', 'open', 'closed', '', 'download-1', '', '', '2024-03-20 12:09:32', '2024-03-20 12:09:32', '', 168, 'http://192.168.1.5/wordpress/wp-content/uploads/2024/03/download-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(297, 1, '2024-03-20 13:55:18', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2024-03-20 13:55:18', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=297', 0, 'post', '', 0),
(299, 1, '2024-03-21 11:58:08', '2024-03-21 06:03:12', ' ', '', '', 'publish', 'closed', 'closed', '', '299', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.5/wordpress/?p=299', 3, 'nav_menu_item', '', 0),
(300, 1, '2024-03-21 11:58:08', '2024-03-21 06:03:12', ' ', '', '', 'publish', 'closed', 'closed', '', '300', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.5/wordpress/?p=300', 5, 'nav_menu_item', '', 0),
(301, 1, '2024-03-21 11:58:08', '2024-03-21 06:03:12', ' ', '', '', 'publish', 'closed', 'closed', '', '301', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.5/wordpress/?p=301', 6, 'nav_menu_item', '', 0),
(302, 1, '2024-03-21 11:58:08', '2024-03-21 06:03:12', ' ', '', '', 'publish', 'closed', 'closed', '', '302', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.5/wordpress/?p=302', 4, 'nav_menu_item', '', 0),
(303, 1, '2024-03-21 11:58:08', '2024-03-21 06:03:12', ' ', '', '', 'publish', 'closed', 'closed', '', '303', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.5/wordpress/?p=303', 7, 'nav_menu_item', '', 0),
(304, 1, '2024-03-21 11:58:08', '2024-03-21 11:49:28', ' ', '', '', 'publish', 'closed', 'closed', '', '304', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.5/wordpress/?p=304', 12, 'nav_menu_item', '', 0),
(305, 1, '2024-03-21 11:47:32', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2024-03-21 11:47:32', '0000-00-00 00:00:00', '', 0, 'http://192.168.1.5/wordpress/?p=305', 1, 'nav_menu_item', '', 0),
(306, 1, '2024-03-21 11:58:08', '2024-03-21 11:49:28', ' ', '', '', 'publish', 'closed', 'closed', '', '306', '', '', '2024-03-21 11:58:08', '2024-03-21 11:58:08', '', 0, 'http://192.168.1.5/wordpress/?p=306', 9, 'nav_menu_item', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 32, 'term_image', 'http://192.168.1.5/wordpress/wp-content/uploads/2024/03/1200px-Boat_Logo.webp.png');

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(23, 'Nike', 'nike', 0),
(24, 'Shoes', 'shoes', 0),
(25, 'Fastrack', 'fastrack', 0),
(26, 'Watch', 'watch', 0),
(27, 'Navneet', 'navneet', 0),
(28, 'stationery', 'stationery', 0),
(29, 'Dove', 'dove', 0),
(30, 'Beautyproduct', 'beautyproduct', 0),
(31, 'Classmate', 'classmate', 0),
(32, 'boat', 'boat', 0),
(33, 'puma', 'puma', 0),
(34, 'Earbuds', 'earbuds', 0),
(35, 'Blue', 'blue', 0),
(36, 'Black', 'black', 0),
(37, 'Orange', 'orange', 0),
(38, 'Green', 'green', 0),
(39, 'Yellow', 'yellow', 0),
(40, 'Login User Menu', 'login-user-menu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(23, 30, 0),
(23, 36, 0),
(36, 24, 0),
(36, 33, 0),
(36, 36, 0),
(37, 26, 0),
(37, 32, 0),
(37, 38, 0),
(99, 28, 0),
(99, 31, 0),
(99, 39, 0),
(164, 29, 0),
(164, 30, 0),
(164, 38, 0),
(168, 27, 0),
(168, 28, 0),
(168, 37, 0),
(171, 25, 0),
(171, 26, 0),
(171, 36, 0),
(174, 23, 0),
(174, 24, 0),
(174, 35, 0),
(205, 32, 0),
(205, 34, 0),
(205, 36, 0),
(209, 28, 0),
(209, 31, 0),
(209, 35, 0),
(242, 40, 0),
(244, 40, 0),
(245, 40, 0),
(247, 40, 0),
(248, 40, 0),
(249, 40, 0),
(299, 40, 0),
(300, 40, 0),
(301, 40, 0),
(302, 40, 0),
(303, 40, 0),
(304, 40, 0),
(306, 40, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(23, 23, 'brand', '', 0, 1),
(24, 24, 'product_cat', '', 0, 2),
(25, 25, 'brand', '', 0, 1),
(26, 26, 'product_cat', '', 0, 2),
(27, 27, 'brand', '', 0, 1),
(28, 28, 'product_cat', '', 0, 3),
(29, 29, 'brand', '', 0, 1),
(30, 30, 'product_cat', '', 0, 2),
(31, 31, 'brand', '', 0, 2),
(32, 32, 'brand', '', 0, 2),
(33, 33, 'brand', '', 0, 1),
(34, 34, 'product_cat', '', 0, 1),
(35, 35, 'Color', '', 0, 2),
(36, 36, 'Color', '', 0, 4),
(37, 37, 'Color', '', 0, 1),
(38, 38, 'Color', '', 0, 2),
(39, 39, 'Color', '', 0, 1),
(40, 40, 'nav_menu', '', 0, 13);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice,plugin_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:11:{s:64:\"365e00fae27fba8ec0068de97b5aff3d8a7ae96bc022e9e11562361ff6208319\";a:4:{s:10:\"expiration\";i:1711545953;s:2:\"ip\";s:11:\"192.168.1.4\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710336353;}s:64:\"8b134830b09dcffbd322255695420001712f20ba20b5136ff1cef232c557aa73\";a:4:{s:10:\"expiration\";i:1711547546;s:2:\"ip\";s:11:\"192.168.1.4\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710337946;}s:64:\"352033ae733fbca71b55bfe75a4f1db18e01c20c05a7b109aa58c15e128a6d37\";a:4:{s:10:\"expiration\";i:1711547699;s:2:\"ip\";s:11:\"192.168.1.4\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710338099;}s:64:\"e7667f68dacc8a14f1c79c2013fc01eebea17fe178e4f2c531b6abe73223973e\";a:4:{s:10:\"expiration\";i:1711547819;s:2:\"ip\";s:11:\"192.168.1.4\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710338219;}s:64:\"76c0361d4d3b789c2755e66a1df342a137257c97ab3c2bd10c0f661a7a99bb03\";a:4:{s:10:\"expiration\";i:1711085473;s:2:\"ip\";s:11:\"192.168.1.5\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710912673;}s:64:\"41ccdfcf368c4b1231866a5b7c31296953ee8f89954ef3e4f0b18300b8d201a5\";a:4:{s:10:\"expiration\";i:1711085762;s:2:\"ip\";s:12:\"192.168.1.13\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710912962;}s:64:\"e22cb3240c902e477efab16fbb2f144badc02caa9df369c655d43eff0a9cd2c0\";a:4:{s:10:\"expiration\";i:1711102885;s:2:\"ip\";s:11:\"192.168.1.9\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710930085;}s:64:\"dd26971c6114c96b21db502602638081a06fa2aa97b8840361f477b262eb5174\";a:4:{s:10:\"expiration\";i:1711171178;s:2:\"ip\";s:12:\"192.168.1.13\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36\";s:5:\"login\";i:1710998378;}s:64:\"eab0b36cea4807653331744da642bda4173499e4bab250691d9eb7b9c5803462\";a:4:{s:10:\"expiration\";i:1711171906;s:2:\"ip\";s:11:\"192.168.1.5\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710999106;}s:64:\"d6f645dae313b0b57afc6d264ee323cace8715ef1e570d3b999c6420821784cf\";a:4:{s:10:\"expiration\";i:1711174278;s:2:\"ip\";s:11:\"192.168.1.6\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1711001478;}s:64:\"a59226eeef8bff78f17960db4ee223e80f907d25de22656f1d672ed49035126d\";a:4:{s:10:\"expiration\";i:1711193241;s:2:\"ip\";s:11:\"192.168.1.5\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1711020441;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '297'),
(18, 1, 'wp_persisted_preferences', 'a:5:{s:14:\"core/edit-post\";a:3:{s:26:\"isComplementaryAreaVisible\";b:1;s:12:\"welcomeGuide\";b:0;s:10:\"openPanels\";a:3:{i:0;s:11:\"post-status\";i:1;s:15:\"page-attributes\";i:2;s:14:\"featured-image\";}}s:9:\"_modified\";s:24:\"2024-03-06T07:06:38.354Z\";s:4:\"core\";a:1:{s:29:\"isTemplatePartMoveHintVisible\";b:0;}s:14:\"core/edit-site\";a:3:{s:12:\"welcomeGuide\";b:0;s:26:\"isComplementaryAreaVisible\";b:1;s:18:\"welcomeGuideStyles\";b:0;}s:17:\"core/edit-widgets\";a:2:{s:26:\"isComplementaryAreaVisible\";b:1;s:12:\"welcomeGuide\";b:0;}}'),
(33, 1, 'wp_user-settings', 'libraryContent=browse&editor=tinymce&post_dfw=off&mfold=o'),
(34, 1, 'wp_user-settings-time', '1710848146'),
(35, 1, 'wp_media_library_mode', 'list'),
(36, 1, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:41:\"dashboard_site_health,dashboard_right_now\";s:4:\"side\";s:39:\"dashboard_quick_press,dashboard_primary\";s:7:\"column3\";s:18:\"dashboard_activity\";s:7:\"column4\";s:0:\"\";}'),
(37, 1, 'meta-box-order_product', 'a:3:{s:4:\"side\";s:67:\"submitdiv,test-meta-id,postimagediv,slugdiv,branddiv,product_catdiv\";s:6:\"normal\";s:49:\"postexcerpt,commentstatusdiv,postcustom,authordiv\";s:8:\"advanced\";s:0:\"\";}'),
(38, 1, 'screen_layout_product', '2'),
(39, 1, 'closedpostboxes_product', 'a:1:{i:0;s:11:\"postexcerpt\";}'),
(40, 1, 'metaboxhidden_product', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(41, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:\"link-target\";i:1;s:15:\"title-attribute\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}'),
(42, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(43, 1, 'nav_menu_recently_edited', '40'),
(44, 1, 'closedpostboxes_nav-menus', 'a:0:{}'),
(45, 1, 'closedpostboxes_shoporder', 'a:0:{}'),
(46, 1, 'metaboxhidden_shoporder', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(47, 1, 'meta-box-order_shoporder', 'a:3:{s:4:\"side\";s:26:\"submitdiv,commentstatusdiv\";s:6:\"normal\";s:7:\"slugdiv\";s:8:\"advanced\";s:18:\"billing-id,cart-id\";}'),
(48, 1, 'screen_layout_shoporder', '2'),
(90, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:11:\"192.168.1.0\";}'),
(119, 8, 'nickname', 'Jigna'),
(120, 8, 'first_name', ''),
(121, 8, 'last_name', ''),
(122, 8, 'description', ''),
(123, 8, 'rich_editing', 'true'),
(124, 8, 'syntax_highlighting', 'true'),
(125, 8, 'comment_shortcuts', 'false'),
(126, 8, 'admin_color', 'fresh'),
(127, 8, 'use_ssl', '0'),
(128, 8, 'show_admin_bar_front', 'true'),
(129, 8, 'locale', ''),
(130, 8, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(131, 8, 'wp_user_level', '0'),
(132, 8, 'session_tokens', 'a:4:{s:64:\"bb0352062d69f66758e972ac1be66363eb0a120b91f07b7f8837c47340e3fc19\";a:4:{s:10:\"expiration\";i:1711607735;s:2:\"ip\";s:11:\"192.168.1.4\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710398135;}s:64:\"d7bebf9a891608a070481097ff925997b87a61684fc7f727f8e3dca2b12c1404\";a:4:{s:10:\"expiration\";i:1711625511;s:2:\"ip\";s:12:\"192.168.1.13\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710415911;}s:64:\"3768101e2d5fbbc097ee3a673ca69b74d1b38ec8e2327c5c8e44c211c790f7d6\";a:4:{s:10:\"expiration\";i:1711633179;s:2:\"ip\";s:11:\"192.168.1.4\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710423579;}s:64:\"4e85e80f8c80415807ead0e8bfbee221e8f30eb936efcba5bb0fb52224c94946\";a:4:{s:10:\"expiration\";i:1711633955;s:2:\"ip\";s:12:\"192.168.1.11\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710424355;}}'),
(133, 8, 'community-events-location', 'a:1:{s:2:\"ip\";s:11:\"192.168.1.0\";}'),
(134, 9, 'nickname', 'shreyash'),
(135, 9, 'first_name', ''),
(136, 9, 'last_name', ''),
(137, 9, 'description', ''),
(138, 9, 'rich_editing', 'true'),
(139, 9, 'syntax_highlighting', 'true'),
(140, 9, 'comment_shortcuts', 'false'),
(141, 9, 'admin_color', 'fresh'),
(142, 9, 'use_ssl', '0'),
(143, 9, 'show_admin_bar_front', 'true'),
(144, 9, 'locale', ''),
(145, 9, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(146, 9, 'wp_user_level', '0'),
(147, 9, 'session_tokens', 'a:3:{s:64:\"e58f232a920c3570a0c62de9c89583275b144a18a7d3ab2e741e89c77f36204c\";a:4:{s:10:\"expiration\";i:1711952348;s:2:\"ip\";s:11:\"192.168.1.5\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710742748;}s:64:\"d6d8610f971c5c6570962d7f6742418101470d2a321233a5984b0d78bfd5820c\";a:4:{s:10:\"expiration\";i:1711954400;s:2:\"ip\";s:11:\"192.168.1.5\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710744800;}s:64:\"2dd856af0a81087b20c4b032ace5c9c17e983047aec14c58eb97012e0478fb68\";a:4:{s:10:\"expiration\";i:1711964053;s:2:\"ip\";s:11:\"192.168.1.5\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36\";s:5:\"login\";i:1710754453;}}'),
(174, 12, 'nickname', 'Deep'),
(175, 12, 'first_name', ''),
(176, 12, 'last_name', ''),
(177, 12, 'description', ''),
(178, 12, 'rich_editing', 'true'),
(179, 12, 'syntax_highlighting', 'true'),
(180, 12, 'comment_shortcuts', 'false'),
(181, 12, 'admin_color', 'fresh'),
(182, 12, 'use_ssl', '0'),
(183, 12, 'show_admin_bar_front', 'true'),
(184, 12, 'locale', ''),
(185, 12, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(186, 12, 'wp_user_level', '0');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BwjvKTcQ6ZIAetAHn/HzWtHLH1sbk40', 'admin', 'jraval106001@gmail.com', 'http://localhost:81/wordpress', '2024-02-07 12:59:43', '', 0, 'admin'),
(8, 'Jigna', '$P$BPPQKbdpGZYm.TvfC./JtbAwJEjZ5p/', 'jigna', 'raval123@gmail.com', '', '2024-03-14 06:35:12', '', 0, 'Jigna'),
(9, 'shreyash', '$P$BjRcb7V41rgBeXsFxc/I8/V3mg2/4Q/', 'shreyash', 'srmakadia7@gmail.com', '', '2024-03-18 06:19:00', '', 0, 'shreyash'),
(12, 'Deep', '$P$BxnUEngslCKjUcvEqMXPTK983sz2vv.', 'deep', 'dip123@gmail.com', '', '2024-03-19 13:37:01', '', 0, 'Deep');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1205;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1436;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;