-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2023 at 07:51 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pay`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `access` text DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `access`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Ultron', 'admin@site.com', 'admin', NULL, '6517d364db4a31696060260.jpg', NULL, '$2y$10$5gr3rmixm8otVdEyUI18muVkcOUl4Gw/d.H5Fhx7MM0isx3YVzCHu', NULL, '2023-10-03 22:49:15');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(100) DEFAULT NULL,
  `read_status` tinyint(4) NOT NULL DEFAULT 0,
  `click_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `read_status`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'New member registered', 1, 'http://localhost/pay/admin/user/detail/1', '2023-09-30 00:49:10', '2023-09-30 00:51:34'),
(2, 1, 'Deposit request from greathimansh', 1, 'http://localhost/pay/admin/deposit/details/1', '2023-09-30 02:08:06', '2023-09-30 02:08:31'),
(3, 1, 'Requested for Recharge service from greathimansh', 1, 'http://localhost/pay/admin/service/pending', '2023-09-30 02:09:32', '2023-09-30 02:09:52'),
(4, 1, 'New support ticket has opened', 0, 'http://localhost/pay/admin/tickets/view/1', '2023-10-03 23:26:24', '2023-10-03 23:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apply_services`
--

CREATE TABLE `apply_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `total_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `select_field` text DEFAULT NULL,
  `user_data` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Data insert but not confirm, 1=>Approved, 2=>Pending, 3=>Rejected',
  `admin_feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apply_services`
--

INSERT INTO `apply_services` (`id`, `user_id`, `service_id`, `amount`, `total_charge`, `after_charge`, `post_balance`, `select_field`, `user_data`, `status`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10.00000000, 1.20000000, 11.20000000, 0.00000000, NULL, NULL, 0, NULL, '2023-09-30 02:09:23', '2023-09-30 02:09:23'),
(2, 1, 1, 10.00000000, 1.20000000, 11.20000000, 2038.80000000, '{\"operator\":\"Airtel\"}', '{\"mobile_number\":{\"field_name\":\"mobile_number\",\"field_value\":\"7696802762\",\"type\":\"text\"}}', 1, 'DOne', '2023-09-30 02:09:24', '2023-09-30 02:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method_code` int(10) UNSIGNED NOT NULL,
  `amount` decimal(18,8) NOT NULL,
  `method_currency` varchar(191) NOT NULL,
  `charge` decimal(18,8) NOT NULL,
  `rate` decimal(18,8) NOT NULL,
  `final_amo` decimal(18,8) DEFAULT 0.00000000,
  `detail` text DEFAULT NULL,
  `btc_amo` varchar(191) DEFAULT NULL,
  `btc_wallet` varchar(191) DEFAULT NULL,
  `trx` varchar(191) DEFAULT NULL,
  `try` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `admin_feedback` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `try`, `status`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 1000, 50.00000000, 'USD', 15.00000000, 10.00000000, 650.00000000, '{\"asdsa\":{\"field_name\":\"sdasd\",\"type\":\"text\"}}', '0', '', '3YB23FKTSD1O', 0, 1, NULL, '2023-09-30 02:07:59', '2023-09-30 02:08:36'),
(2, 1, 110, 1000.00000000, 'INR', 40.00000000, 83.00000000, 86320.00000000, NULL, '0', '', '3FXB33TG7TBB', 0, 0, NULL, '2023-09-30 02:34:49', '2023-09-30 02:34:49'),
(3, 1, 105, 1000.00000000, 'INR', 40.00000000, 83.00000000, 86320.00000000, NULL, '0', '', '3Y6WO6QMHGY8', 0, 0, NULL, '2023-10-03 23:41:21', '2023-10-03 23:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_templates`
--

CREATE TABLE `email_sms_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `act` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `subj` varchar(191) NOT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `shortcodes` text NOT NULL,
  `email_status` tinyint(4) NOT NULL DEFAULT 1,
  `sms_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_sms_templates`
--

INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'PASS_RESET_CODE', 'Password Reset', 'Password Reset', '<div>We have received a request to reset the password for your account on <b>{{time}} .<br></b></div><div>Requested From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div><div><br></div><br><div><div><div>Your account recovery code is:&nbsp;&nbsp; <font size=\"6\"><b>{{code}}</b></font></div><div><br></div></div></div><div><br></div><div><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><br>', 'Your account recovery code is: {{code}}', ' {\"code\":\"Password Reset Code\",\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-06 00:49:06'),
(2, 'PASS_RESET_DONE', 'Password Reset Confirmation', 'You have Reset your password', '<div><p>\r\n    You have successfully reset your password.</p><p>You changed from&nbsp; IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}}&nbsp;</b> on <b>{{time}}</b></p><p><b><br></b></p><p><font color=\"#FF0000\"><b>If you did not changed that, Please contact with us as soon as possible.</b></font><br></p></div>', 'Your password has been changed successfully', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-07 10:23:47'),
(3, 'EVER_CODE', 'Email Verification', 'Please verify your email address', '<div><br></div><div>Thanks For join with us. <br></div><div>Please use below code to verify your email address.<br></div><div><br></div><div>Your email verification code is:<font size=\"6\"><b> {{code}}</b></font></div>', 'Your email verification code is: {{code}}', '{\"code\":\"Verification code\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-03 23:35:10'),
(4, 'SVER_CODE', 'SMS Verification ', 'Please verify your phone', 'Your phone verification code is: {{code}}', 'Your phone verification code is: {{code}}', '{\"code\":\"Verification code\"}', 0, 1, '2019-09-24 23:04:05', '2020-03-08 01:28:52'),
(5, '2FA_ENABLE', 'Google Two Factor - Enable', 'Google Two Factor Authentication is now  Enabled for Your Account', '<div>You just enabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Enabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Your verification code is: {{code}}', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:42:59'),
(6, '2FA_DISABLE', 'Google Two Factor Disable', 'Google Two Factor Authentication is now  Disabled for Your Account', '<div>You just Disabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Disabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Google two factor verification is disabled', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:43:46'),
(16, 'ADMIN_SUPPORT_REPLY', 'Support Ticket Reply ', 'Reply Support Ticket', '<div><p><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong>A member from our support team has replied to the following ticket:</strong></span></p><p><b><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong><br></strong></span></b></p><p><b>[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</b></p><p>----------------------------------------------</p><p>Here is the reply : <br></p><p> {{reply}}<br></p></div><div><br></div>', '{{subject}}\r\n\r\n{{reply}}\r\n\r\n\r\nClick here to reply:  {{link}}', '{\"ticket_id\":\"Support Ticket ID\", \"ticket_subject\":\"Subject Of Support Ticket\", \"reply\":\"Reply from Staff/Admin\",\"link\":\"Ticket URL For relpy\"}', 1, 1, '2020-06-08 18:00:00', '2020-05-04 02:24:40'),
(206, 'DEPOSIT_COMPLETE', 'Automated Deposit - Successful', 'Deposit Completed Successfully', '<div>Your deposit of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#000000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br></div>', '{{amount}} {{currrency}} Deposit successfully by {{gateway_name}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-24 18:00:00', '2020-11-17 03:10:00'),
(207, 'DEPOSIT_REQUEST', 'Manual Deposit - User Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br></div>', '{{amount}} Deposit requested by {{method}}. Charge: {{charge}} . Trx: {{trx}}\r\n', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\"}', 1, 1, '2020-05-31 18:00:00', '2020-06-01 18:00:00'),
(208, 'DEPOSIT_APPROVE', 'Manual Deposit - Admin Approved', 'Your Deposit is Approved', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br></div>', 'Admin Approve Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}} transaction : {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-16 18:00:00', '2020-06-14 18:00:00'),
(209, 'DEPOSIT_REJECT', 'Manual Deposit - Admin Rejected', 'Your Deposit Request is Rejected', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} has been rejected</b>.<b><br></b></div><br><div>Transaction Number was : {{trx}}</div><div><br></div><div>if you have any query, feel free to contact us.<br></div><br><div><br><br></div>\r\n\r\n\r\n\r\n{{rejection_message}}', 'Admin Rejected Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"rejection_message\":\"Rejection message\"}', 1, 1, '2020-06-09 18:00:00', '2020-06-14 18:00:00'),
(215, 'BAL_ADD', 'Balance Add by Admin', 'Your Account has been Credited', '<div>{{amount}} {{currency}} has been added to your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}&nbsp;</b></font>', '{{amount}} {{currency}} credited in your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2021-01-06 00:46:18'),
(216, 'BAL_SUB', 'Balance Subtracted by Admin', 'Your Account has been Debited', '<div>{{amount}} {{currency}} has been subtracted from your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}</b></font>', '{{amount}} {{currency}} debited from your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2019-11-10 09:07:12'),
(217, 'SERVICE_APPLY_COMPLETE', 'Service Apply- Successful', 'Service Apply Successfully', '<div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Transaction Number: {{trx}}</span><br></div><div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Amoun: {{amount}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{currency}}</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\"><br></span></div><div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Charge: {{charge}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{currency}}</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\"><br></span></div><div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Post Balance:&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{post_balance}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{currency}}</span></div><div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Service:&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{service_name}}</span></div>', 'Transaction Number: {{trx}}\r\nAmoun: {{amount}} {{currency}}\r\nCharge: {{charge}} {{currency}}\r\nPost Balance: {{post_balance}} {{currency}}\r\nService: {{service_name}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Total Charge\",\"currency\":\"Site Currency\",\"post_balance\":\"Users Balance After this operation\",\"service_name\":\"Service name\"}', 1, 1, '2020-06-24 18:00:00', '2021-06-30 05:46:21'),
(218, 'SERVICE_APPROVE', 'Service- Admin  Approved', 'Service Request has been Processed and your money is sent', '<div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Amount:&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{amount}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{currency}}</span><br></div><div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Charge: {{charge}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{currency}}</span></div><div><font color=\"#212529\"><span style=\"font-size: 12px; white-space: nowrap;\"><b>Service: {{service_name}}</b></span></font><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\"><br></span></div><div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Details : {{admin_feedback}}</span><br></div><div><br><br><br></div>', 'Amount: {{amount}} {{currency}}\r\nCharge: {{charge}} {{currency}}\r\nService: {{service_name}}\r\nDetails : {{admin_feedback}}\r\n', '{\"amount\":\"Request Amount By user\",\"charge\":\"Total Charge\",\"currency\":\"Site Currency\",\"service_name\":\"Service Name\",\"admin_feedback\":\"Admin Feedback\"}', 1, 1, '2020-06-10 18:00:00', '2021-07-01 03:40:23'),
(219, 'SERVICE_REJECTED', 'Service- Admin Rejected', 'Service Request has been rejected and your money is refunded to your account', '<div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Amount: {{amount}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{currency}}</span></div><div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Charge: {{charge}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{currency}}</span></div><div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Post Balance:&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{post_balance}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{currency}}</span></div><div><span style=\"font-size: 12px; white-space: nowrap;\"><b>Service:&nbsp;</b></span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{service_name}}</span></div><div><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">Reason:&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap;\">{{reason}}</span></div><div><br></div>', 'Admin Rejected Your {{amount}} {{currency}} withdraw request. Your Main Balance {{main_balance}}  {{method}} , Transaction {{transaction}}', '{\"amount\":\"Request Amount By user\",\"charge\":\"Total Charge\",\"currency\":\"Site Currency\",\"post_balance\":\"Users Balance After this operation\",\"service_name\":\"Service Name\",\"reason\":\"Reason of cancelation\"}', 1, 1, '2020-06-09 18:00:00', '2021-06-30 05:49:42');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` int(10) UNSIGNED NOT NULL,
  `act` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL COMMENT 'object',
  `support` text DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"*************\"}}', 'twak.png', 0, NULL, '2019-10-18 23:16:05', '2021-06-28 00:15:34'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\r\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\r\n<div class=\"g-recaptcha\" data-sitekey=\"{{sitekey}}\" data-callback=\"verifyCaptcha\"></div>\r\n<div id=\"g-recaptcha-error\"></div>', '{\"sitekey\":{\"title\":\"Site Key\",\"value\":\"***********\"}}', 'recaptcha.png', 0, NULL, '2019-10-18 23:16:05', '2021-06-27 08:06:03'),
(3, 'custom-captcha', 'Custom Captcha', 'Just Put Any Random String', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, NULL, '2019-10-18 23:16:05', '2021-06-29 10:13:38'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google-analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"***********\"}}', 'ganalytics.png', 1, NULL, NULL, '2021-06-27 07:57:07'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"*************\"}}', 'fb_com.PNG', 1, NULL, NULL, '2021-06-27 07:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_keys` varchar(40) NOT NULL,
  `data_values` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"PayLab\",\"Recharge\",\"Utility Bill\",\"Payment\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"PayLab - Mobile Recharge and Utility Bill Payment Platform\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ff\",\"image\":\"610133dc3531e1627468764.jpg\"}', '2020-07-04 23:42:52', '2021-07-28 04:39:24'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"Who We are\",\"sub_heading\":\"Dolorem, excepturi iure dicta dolores, repellat vero similique quidem accusantium fugiat consequuntur porro. Corrupti?\",\"description\":\"Recusandae ipsum neque quaerat, quibusdam tenetur rerum ratione modi exercitationem, corrupti similique earum deserunt delectus nobis vitae quam omnis totam cum repellendus at! Omnis possimus quidem perspiciatis sit \\r\\n\\r\\nRecusandae ipsum neque quaerat, quibusdam tenetur rerum ratione modi exercitationem, corrupti similique earum deserunt delectus nobis vitae quam omnis totam cum repellendus at! Omnis possimus quidem perspiciatis sit accusantium temporibus.\",\"image\":\"607d4408126f11618822152.png\"}', '2020-10-28 00:51:20', '2021-04-19 02:49:12'),
(25, 'blog.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Hic tenetur nihil ex. Doloremque ipsa velit, ea molestias expedita sed voluptatem ex voluptatibus temporibus sequi. sddd\"}', '2020-10-28 00:51:34', '2020-10-28 00:52:52'),
(27, 'contact_us.content', '{\"heading\":\"Contact Us For Any informations\",\"location\":\"119 W 24th Street 4th New York, USA\",\"email\":\"company@support.email\"}', '2020-10-28 00:59:19', '2021-06-27 07:07:46'),
(28, 'counter.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Register New Account\"}', '2020-10-28 01:04:02', '2020-10-28 01:04:02'),
(31, 'social_icon.element', '{\"url\":\"https:\\/\\/www.facebook.com\\/\",\"social_icon\":\"<i class=\\\"lab la-facebook\\\"><\\/i>\"}', '2020-11-12 04:07:30', '2021-04-19 01:31:35'),
(39, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Online mobile recharge And bill payment.\",\"sub_heading\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem odit consequuntur omnis est mollitia sint atque voluptas voluptatibus iure.\",\"image\":\"60fe8d9db5cac1627295133.jpg\"}', '2021-04-18 08:00:55', '2021-07-26 04:25:34'),
(47, 'faq.content', '{\"has_image\":\"1\",\"heading\":\"Frequently asked questions\",\"sub_heading\":\"Exercitationem qui cum perferendis mollitia debitis, nobis inventore, quisquam voluptatum molestiae esse praesentium?\",\"image\":\"607c604a8e03c1618763850.png\"}', '2021-04-18 10:37:30', '2021-04-18 10:37:30'),
(48, 'faq.element', '{\"question\":\"What is the policy of bestbills?\",\"answer\":\"<p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;color:rgba(25,42,86,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\"><span style=\\\"font-weight:700;color:rgb(15,45,146);\\\">First:<\\/span>\\u00a0Odio dolores, corporis debitis nobis distinctio aperiam error eius assumenda nemo magnam exercitationem fugit quod veniam dolorem eum voluptatem et.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;color:rgba(25,42,86,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\"><span style=\\\"font-weight:700;color:rgb(15,45,146);\\\">Then:<\\/span>\\u00a0Odio dolores, corporis debitis nobis distinctio aperiam error eius assumenda nemo magnam exercitationem fugit quod veniam dolorem eum voluptatem et.<\\/p>\"}', '2021-04-18 10:38:44', '2021-04-18 10:38:44'),
(49, 'faq.element', '{\"question\":\"How To play bestbills?\",\"answer\":\"<p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;color:rgba(25,42,86,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\"><span style=\\\"font-weight:700;color:rgb(15,45,146);\\\">First:<\\/span>\\u00a0Odio dolores, corporis debitis nobis distinctio aperiam error eius assumenda nemo magnam exercitationem fugit quod veniam dolorem eum voluptatem et.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;color:rgba(25,42,86,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\"><span style=\\\"font-weight:700;color:rgb(15,45,146);\\\">Then:<\\/span>\\u00a0Odio dolores, corporis debitis nobis distinctio aperiam error eius assumenda nemo magnam exercitationem fugit quod veniam dolorem eum voluptatem et.<\\/p>\"}', '2021-04-18 10:39:11', '2021-04-18 10:39:11'),
(50, 'faq.element', '{\"question\":\"how many times can i make transaction in a day?\",\"answer\":\"<p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;color:rgba(25,42,86,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\"><span style=\\\"font-weight:700;color:rgb(15,45,146);\\\">First:<\\/span>\\u00a0Odio dolores, corporis debitis nobis distinctio aperiam error eius assumenda nemo magnam exercitationem fugit quod veniam dolorem eum voluptatem et.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;color:rgba(25,42,86,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\"><span style=\\\"font-weight:700;color:rgb(15,45,146);\\\">Then:<\\/span>\\u00a0Odio dolores, corporis debitis nobis distinctio aperiam error eius assumenda nemo magnam exercitationem fugit quod veniam dolorem eum voluptatem et.<\\/p>\"}', '2021-04-18 10:39:35', '2021-04-18 10:39:35'),
(51, 'apps.content', '{\"has_image\":\"1\",\"heading\":\"Download the app and make your life more easy.\",\"sub_heading\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia omnis quas excepturi corporis adipisci odio id culpa praesentium. Quis fuga officiis iure rerum modi temporibus mollitia, quidem veritatis illum vero. Lorem ipsum dolor sit.\",\"app_link\":\"#\",\"image\":\"60d85e8a70e6e1624792714.png\"}', '2021-04-18 22:39:55', '2021-06-27 05:18:34'),
(52, 'agent.content', '{\"has_image\":\"1\",\"heading\":\"We are all over the world\",\"sub_heading\":\"Ullam libero culpa, velit voluptatum molestiae vel nobis quasi nam nisi repellat laudantium ipsa! Veniam perferendis aut quasi.\",\"btn_text\":\"Our Agents\",\"btn_link\":\"#\",\"first_image\":\"607d1030c908f1618808880.png\",\"second_image\":\"607d1031113351618808881.png\",\"third_image\":\"607d10314ff2c1618808881.png\"}', '2021-04-18 22:54:28', '2021-04-18 23:08:01'),
(53, 'agent.element', '{\"has_image\":\"1\",\"image\":\"607d0dec7adce1618808300.png\"}', '2021-04-18 22:58:20', '2021-04-18 22:58:20'),
(54, 'agent.element', '{\"has_image\":\"1\",\"image\":\"607d0e531f08c1618808403.png\"}', '2021-04-18 23:00:03', '2021-04-18 23:00:03'),
(55, 'agent.element', '{\"has_image\":\"1\",\"image\":\"607d0e5a1f21d1618808410.png\"}', '2021-04-18 23:00:10', '2021-04-18 23:00:10'),
(56, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Mr Unbara DIsara\",\"designation\":\"Industrialist\",\"number_of_star\":\"4\",\"say\":\"Quasi repudiandae dolor reprehenderit, obcaecati officia temporibus qui animi consequuntur facere. Omnis molestiae voluptates non ab accusantium aperiam quis vitae voluptas dolor.\",\"image\":\"607d124f54bb61618809423.jpg\"}', '2021-04-18 23:17:03', '2021-04-18 23:33:41'),
(57, 'testimonial.content', '{\"heading\":\"What Our Client Say\",\"sub_heading\":\"Nesciunt repudiandae at deleniti obcaecati fugiat omnis ut repellat sapiente, quam labore necessitatibus autem est sequi itaque?\"}', '2021-04-18 23:20:26', '2021-04-18 23:20:26'),
(58, 'partner.content', '{\"heading\":\"Join 800+ Businesses Partners That Trust PayLab\",\"sub_heading\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo alias sint vero praesentium Praesentium ex neque placeat illo animi, dignissimos.\"}', '2021-04-18 23:40:59', '2021-06-27 04:40:55'),
(59, 'partner.element', '{\"text\":\"Pulvinar cum morbi eleifend\",\"has_image\":\"1\",\"image\":\"60d855f9ba3fe1624790521.png\"}', '2021-04-18 23:50:13', '2021-06-27 04:42:01'),
(60, 'partner.element', '{\"text\":\"Sagittis tempor varius\",\"has_image\":\"1\",\"image\":\"60d85600586bf1624790528.png\"}', '2021-04-19 00:17:40', '2021-06-27 04:42:08'),
(61, 'partner.element', '{\"text\":\"Pulvinar cum morbi eleifend\",\"has_image\":\"1\",\"image\":\"60d85605bc56a1624790533.png\"}', '2021-04-19 00:18:06', '2021-06-27 04:42:13'),
(62, 'partner.element', '{\"text\":\"Pulvinar cum morbi eleifend\",\"has_image\":\"1\",\"image\":\"60d8560acf9a71624790538.png\"}', '2021-04-19 00:18:26', '2021-06-27 04:42:18'),
(63, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"ulvinar cum morbi eleifend\",\"designation\":\"Industrialist\",\"number_of_star\":\"asdfasdf\",\"say\":\"Obcaecati voluptas autem magni qui quasi, delectus repellendus ipsa iure minima consecteturObcaecati voluptas autem magni qui quasi, delectus repellendus ipsa iure minima consectetur\",\"image\":\"607d216b87d6b1618813291.png\"}', '2021-04-19 00:21:31', '2021-04-19 00:21:31'),
(64, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"asdfasdfasdf\",\"designation\":\"Industrialist\",\"number_of_star\":\"4\",\"say\":\"asdfasdf\",\"image\":\"607d21894c3211618813321.png\"}', '2021-04-19 00:22:01', '2021-04-19 00:22:01'),
(65, 'social_icon.element', '{\"url\":\"https:\\/\\/www.google.com\\/\",\"social_icon\":\"<i class=\\\"lab la-google-plus-g\\\"><\\/i>\"}', '2021-04-19 01:31:53', '2021-04-19 01:37:02'),
(66, 'social_icon.element', '{\"url\":\"https:\\/\\/www.instagram.com\\/\",\"social_icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\"}', '2021-04-19 01:32:25', '2021-04-19 01:37:15'),
(67, 'footer.content', '{\"has_image\":\"1\",\"text\":\"\\u00a9 Copyright 2021 PayLab| All right reserved\",\"image\":\"60d854ae475cd1624790190.jpg\"}', '2021-04-19 01:47:31', '2021-07-28 04:50:50'),
(68, 'pages.element', '{\"name\":\"Privacy Policy\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', '2021-04-19 01:52:51', '2021-07-28 00:05:15'),
(69, 'pages.element', '{\"name\":\"Terms and Policy\",\"description\":\"<div class=\\\"hatnote navigation-not-searchable\\\" style=\\\"font-style:italic;padding-left:1.6em;margin-bottom:0.5em;color:rgb(32,33,34);font-family:sans-serif;font-size:14px;\\\"><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-style:normal;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-style:normal;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-style:normal;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-style:normal;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-style:normal;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-style:normal;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;font-size:16px;font-style:normal;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div><\\/div>\"}', '2021-04-19 01:53:22', '2021-07-28 00:05:28'),
(70, 'contact_us.element', '{\"address_type\":\"Office Address\",\"address\":\"119 W 24th Street 4th New York, USA\",\"icon\":\"<i class=\\\"las la-building\\\"><\\/i>\"}', '2021-04-19 03:15:26', '2021-06-27 07:05:50'),
(71, 'contact_us.element', '{\"address_type\":\"Email Address\",\"icon\":\"<i class=\\\"las la-envelope\\\"><\\/i>\",\"address\":\"demo@gmail.com\"}', '2021-04-19 03:21:17', '2021-04-19 03:21:30'),
(72, 'contact_us.element', '{\"address_type\":\"Phone Number\",\"icon\":\"<i class=\\\"las la-phone\\\"><\\/i>\",\"address\":\"+834 3838 838 8383\"}', '2021-04-19 03:21:59', '2021-04-19 03:21:59'),
(73, 'pages.content', '{\"has_image\":\"1\",\"image\":\"607d4dc5d00ad1618824645.png\"}', '2021-04-19 03:30:45', '2021-04-19 03:30:46'),
(74, 'breadcrumb.content', '{\"has_image\":\"1\",\"image\":\"60d85361c71521624789857.jpg\"}', '2021-04-19 03:31:48', '2021-06-27 04:30:58'),
(75, 'user_dashboard_image.content', '{\"has_image\":\"1\",\"image\":\"607d4eeaf08fe1618824938.png\"}', '2021-04-19 03:35:38', '2021-04-19 03:35:39'),
(76, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Advantages Minimal Repair Technique\",\"short_description\":\"Posuere justo diam, commodo wisi dolor vivamus non velit. Luctus faucibus eget id imdiet nibh molestie, eu id convallis libero consectetuer magna, montes curabitur, pellentesque luctus mollis. In et, lacus venenatisMorbi viverra nonummy eget sed libero morbi. Etiam sit lacinia suspendisse sociosqu aliquam nunc. Dictum class non ut consequat eget consectetuer. Suscipit est eleifend porta pharetra, nullam iaculis, vel pretium molestie, aliquam pulvinar rerum arcu. Ac imperdiet at velit vel eu, nisl lacinia ut est gravida pharetra mauris, hendrerit laoreet. Nulla augue primis ut nec augue sapien,\",\"long_description\":\"<p style=\\\"margin-top:-12px;margin-bottom:31px;color:rgb(80,76,137);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\">malesuada. Ad et, rhoncus scelerisque nunc donec odio, wisi ac quos odio integer rutrum, urna dui integer placerat. Sagittis placerat praesent, nullam quam nam tortor mus, torquent facilisi, fermentum risus adipiscing amet dictumst. Senectus quo ut nunc in sem ac. Praesent et in ligula enim, dolor sit. Quis sapien, nec hac fusce iaculis, quisque ut consequat orci ullamcorper sit vestibulum. Dolor arcu quis massa lectus diam eu, lectus orci elementum nihil.<\\/p><blockquote style=\\\"margin-bottom:39px;padding-left:30px;font-size:22px;font-style:italic;line-height:1.4;color:rgb(80,76,137);font-family:\'Open Sans\', sans-serif;\\\">Fermentum risus adipiscing amet dictumst. Senectus quo ut nunc in sem ac. Praesent et in ligula enim, dolor sit. Quis sapien, nec hac fusce iaculis, quisque ut consequat orci ullamcorper sit vestibulum. Dolor arcu quis massa nislvel malesuadat<\\/blockquote><p style=\\\"margin-top:-12px;margin-bottom:31px;color:rgb(80,76,137);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\">tiam nisl sit quis, ante tempus pede phasellus vitae nulla, id semper vestibulum. Auctor pulvinar eget id at aliquam, lorem mattis praesent donec amet magna in, mauris etiam est ligula cras. Nec quisque. Pellentesque eget suspendisse ut. In eros, magna auctor augue ligula, amet vel erat amet litora ante. Auctor vestibulum erat vulputate, eget dictum amet quisque sem, a quaerat sed, ipsum aenean integer tellus, rutrum feugiat pellentesque turpis pede a quam.<\\/p><p style=\\\"margin-top:-12px;margin-bottom:31px;color:rgb(80,76,137);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\">Libero tincidunt tristique, vestibulum tempor ipsum praesent. A a, dolor in dui mauris sed proin sit, mattis ipsum id molestie integer sollicitudin, quis vivamus hymenaeos mi leo, sed condimentum. Sodales dolore vestibulum<\\/p>\",\"image\":\"607d894865f1d1618839880.jpg\"}', '2021-04-19 07:44:40', '2021-04-19 07:44:40'),
(77, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Minimal Repair Technique\",\"short_description\":\"sollicitudin parturient sodales nunc justo consectetuer at, scelerisque pede a faucibus, maecenas elit diam. Maecenas facilisis wisi duis lobortis, suscipit laoreet ultricies nec, a mauris convallis, ullamcorper volutpat. Ante cras lacus ullamcorper, interdum rhoncus vitae enim diam vestibulum, mauris mauris pellentesque et blandit aliquet.\",\"long_description\":\"<p style=\\\"margin-top:-12px;margin-bottom:31px;color:rgb(80,76,137);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\">malesuada. Ad et, rhoncus scelerisque nunc donec odio, wisi ac quos odio integer rutrum, urna dui integer placerat. Sagittis placerat praesent, nullam quam nam tortor mus, torquent facilisi, fermentum risus adipiscing amet dictumst. Senectus quo ut nunc in sem ac. Praesent et in ligula enim, dolor sit. Quis sapien, nec hac fusce iaculis, quisque ut consequat orci ullamcorper sit vestibulum. Dolor arcu quis massa lectus diam eu, lectus orci elementum nihil.<\\/p><blockquote style=\\\"margin-bottom:39px;padding-left:30px;font-size:22px;font-style:italic;line-height:1.4;color:rgb(80,76,137);font-family:\'Open Sans\', sans-serif;\\\">Fermentum risus adipiscing amet dictumst. Senectus quo ut nunc in sem ac. Praesent et in ligula enim, dolor sit. Quis sapien, nec hac fusce iaculis, quisque ut consequat orci ullamcorper sit vestibulum. Dolor arcu quis massa nislvel malesuadat<\\/blockquote><p style=\\\"margin-top:-12px;margin-bottom:31px;color:rgb(80,76,137);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\">tiam nisl sit quis, ante tempus pede phasellus vitae nulla, id semper vestibulum. Auctor pulvinar eget id at aliquam, lorem mattis praesent donec amet magna in, mauris etiam est ligula cras. Nec quisque. Pellentesque eget suspendisse ut. In eros, magna auctor augue ligula, amet vel erat amet litora ante. Auctor vestibulum erat vulputate, eget dictum amet quisque sem, a quaerat sed, ipsum aenean integer tellus, rutrum feugiat pellentesque turpis pede a quam.<\\/p><p style=\\\"margin-top:-12px;margin-bottom:31px;color:rgb(80,76,137);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\">Libero tincidunt tristique, vestibulum tempor ipsum praesent. A a, dolor in dui mauris sed proin sit, mattis ipsum id molestie integer sollicitudin, quis vivamus hymenaeos mi leo, sed condimentum. Sodales dolore vestibulum<\\/p>\",\"image\":\"607d898e499fa1618839950.jpg\"}', '2021-04-19 07:45:50', '2021-04-19 07:45:50'),
(78, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Consectetuer aliquam, a duis sit praese\",\"short_description\":\"Strategic initiatives all ideas welcome rather it\\u2019s by our employees generous boundaries by listening intentlyStrategic initiatives all ideas welcome rather it\\u2019s by our employees generous boundaries by listening intentlyStrategic initiatives all ideas welcome rather it\\u2019s by our employees generous boundaries by listening intently\",\"long_description\":\"<p style=\\\"margin-top:-12px;margin-bottom:31px;color:rgb(80,76,137);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\">tiam nisl sit quis, ante tempus pede phasellus vitae nulla, id semper vestibulum. Auctor pulvinar eget id at aliquam, lorem mattis praesent donec amet magna in, mauris etiam est ligula cras. Nec quisque. Pellentesque eget suspendisse ut. In eros, magna auctor augue ligula, amet vel erat amet litora ante. Auctor vestibulum erat vulputate, eget dictum amet quisque sem, a quaerat sed, ipsum aenean integer tellus, rutrum feugiat pellentesque turpis pede a quam.<\\/p><p style=\\\"margin-top:-12px;margin-bottom:31px;color:rgb(80,76,137);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\">Libero tincidunt tristique, vestibulum tempor ipsum praesent. A a, dolor in dui mauris sed proin sit, mattis ipsum id molestie integer sollicitudin, quis vivamus hymenaeos mi leo, sed condimentum. Sodales dolore vestibulum<span style=\\\"color:rgb(80,76,137);\\\">tiam nisl sit quis, ante tempus pede phasellus vitae nulla, id semper vestibulum. Auctor pulvinar eget id at aliquam, lorem mattis praesent donec amet magna in, mauris etiam est ligula cras. Nec quisque. Pellentesque eget suspendisse ut. In eros, magna auctor augue ligula, amet vel erat amet litora ante. Auctor vestibulum erat vulputate, eget dictum amet quisque sem, a quaerat sed, ipsum aenean integer tellus, rutrum feugiat pellentesque turpis pede a quam.<\\/span><\\/p><p style=\\\"margin-top:-12px;margin-bottom:31px;color:rgb(80,76,137);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\">Libero tincidunt tristique, vestibulum tempor ipsum praesent. A a, dolor in dui mauris sed proin sit, mattis ipsum id molestie integer sollicitudin, quis vivamus hymenaeos mi leo, sed condimentum. Sodales dolore vestibulum<\\/p><hr \\/>\",\"image\":\"607d8e8340b901618841219.jpg\"}', '2021-04-19 07:46:27', '2021-04-19 08:06:59'),
(81, 'service.content', '{\"heading\":\"OUR POPULAR SERVICES\",\"sub_heading\":\"What We Do\"}', '2021-04-21 00:47:02', '2021-06-27 06:32:48'),
(82, 'why_we_are.content', '{\"heading\":\"We are here to serve you\",\"sub_heading\":\"Ullam libero culpa, velit voluptatum molestiae vel nobis quasi nam nisi repellat laudantium ipsa! Veniam perferendis aut quasi.\"}', '2021-04-21 01:13:16', '2021-04-21 01:13:16'),
(83, 'why_we_are.element', '{\"title\":\"Deserunt nihil eos optio!\",\"content\":\"Et officiis quas laudantium hic reprehenderit, id consequatur eos unde eius corporis\",\"icon\":\"<i class=\\\"las la-user\\\"><\\/i>\"}', '2021-04-21 01:19:26', '2021-04-21 01:19:26'),
(86, 'why_we_are.element', '{\"title\":\"Deserunt nihil eos optio!\",\"content\":\"Et officiis quas laudantium hic reprehenderit, id consequatur eos unde eius corporis.\",\"icon\":\"<i class=\\\"las la-check\\\"><\\/i>\"}', '2021-04-21 01:38:00', '2021-04-21 01:38:50'),
(91, 'heading_info.content', '{\"phone\":\"123456789\",\"email\":\"demo@admin.com\"}', '2021-06-27 04:26:02', '2021-06-27 04:26:02'),
(92, 'partner.element', '{\"has_image\":\"1\",\"image\":\"60d85622525811624790562.png\"}', '2021-06-27 04:42:42', '2021-06-27 04:42:42'),
(93, 'partner.element', '{\"has_image\":\"1\",\"image\":\"60d859e8a16781624791528.png\"}', '2021-06-27 04:58:48', '2021-06-27 04:58:48'),
(94, 'partner.element', '{\"has_image\":\"1\",\"image\":\"60d85a59e13641624791641.png\"}', '2021-06-27 05:00:41', '2021-06-27 05:00:41'),
(95, 'payment.content', '{\"heading\":\"Our Payment Partners\",\"sub_heading\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo alias sint vero praesentium Praesentium ex neque placeat illo animi, dignissimos.\"}', '2021-06-27 05:04:58', '2021-06-27 05:04:58'),
(96, 'overview.content', '{\"has_image\":\"1\",\"heading\":\"Our company overview all over the statistices.\",\"sub_heading\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo repellat quae doloribus, dolores rem porro quo placeat obcaecati esse animi minima, deleniti labore ipsam.  305K\",\"image\":\"60fe8e73b6c371627295347.jpg\"}', '2021-06-27 05:43:51', '2021-07-26 04:29:08'),
(97, 'overview.element', '{\"heading\":\"Transactions\",\"text\":\"800M\",\"icon\":\"<i class=\\\"fas fa-exchange-alt\\\"><\\/i>\"}', '2021-06-27 05:59:31', '2021-06-27 05:59:31'),
(98, 'overview.element', '{\"heading\":\"Award\",\"text\":\"305K\",\"icon\":\"<i class=\\\"fas fa-award\\\"><\\/i>\"}', '2021-06-27 06:00:06', '2021-06-27 06:00:06'),
(99, 'overview.element', '{\"heading\":\"Users\",\"text\":\"3205M\",\"icon\":\"<i class=\\\"fas fa-users\\\"><\\/i>\"}', '2021-06-27 06:00:43', '2021-06-27 06:00:43'),
(100, 'overview.element', '{\"heading\":\"App Downloads\",\"text\":\"12M\",\"icon\":\"<i class=\\\"far fa-copy\\\"><\\/i>\"}', '2021-06-27 06:01:36', '2021-06-27 06:01:36'),
(101, 'feature.content', '{\"has_image\":\"1\",\"heading\":\"OUR POPULAR FEATURES\",\"sub_heading\":\"Some Of The Best Features\",\"image\":\"60d86add5db2c1624795869.png\"}', '2021-06-27 06:09:59', '2021-06-27 06:11:10'),
(102, 'feature.element', '{\"icon\":\"<i class=\\\"fas fa-cloud\\\"><\\/i>\",\"heading\":\"Get instant recharge\",\"text\":\"Lorem, ipsum dolor sit amet consectetur adipisicing elit.1\"}', '2021-06-27 06:16:09', '2021-06-27 06:31:23'),
(103, 'feature.element', '{\"icon\":\"<i class=\\\"fas fa-wallet\\\"><\\/i>\",\"heading\":\"Balance wallet\",\"text\":\"Lorem, ipsum dolor sit amet consectetur adipisicing elit.\"}', '2021-06-27 06:17:22', '2021-06-27 06:17:22'),
(104, 'feature.element', '{\"icon\":\"<i class=\\\"fas fa-gift\\\"><\\/i>\",\"heading\":\"Send Gift\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, minus maiores.\"}', '2021-06-27 06:18:00', '2021-06-27 06:18:00'),
(105, 'feature.element', '{\"icon\":\"<i class=\\\"fas fa-money-bill-wave\\\"><\\/i>\",\"heading\":\"Get amazing Cashbacke\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, minus maiores.\"}', '2021-06-27 06:18:17', '2021-06-27 06:18:17'),
(106, 'service.element', '{\"heading\":\"Phone Recharge And DTH\",\"text\":\"Phone Recharge &amp; DTH\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit. Maiores soluta et debitis facere architecto fugit. Quod\",\"icon\":\"<i class=\\\"fas fa-mobile-alt\\\"><\\/i>\"}', '2021-06-27 06:36:35', '2021-06-27 06:41:11'),
(107, 'service.element', '{\"heading\":\"Bill Payments\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores soluta et debitis facere architecto fugit. Quod, minus earum. Dolore veritatis tempora.\",\"icon\":\"<i class=\\\"fas fa-print\\\"><\\/i>\"}', '2021-06-27 06:37:03', '2021-06-27 06:37:03'),
(108, 'service.element', '{\"heading\":\"Bus Tickets\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores soluta et debitis facere architecto fugit. Quod, minus earum. Dolore veritatis tempora.\",\"icon\":\"<i class=\\\"fas fa-bus\\\"><\\/i>\"}', '2021-06-27 06:37:18', '2021-06-27 06:37:18'),
(109, 'service.element', '{\"heading\":\"Transfer money to Bank\",\"text\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores soluta et debitis facere architecto fugit. Quod, minus earum. Dolore veritatis tempora.\",\"icon\":\"<i class=\\\"fas fa-university\\\"><\\/i>\"}', '2021-06-27 06:37:42', '2021-06-27 06:37:42'),
(110, 'auth_image.content', '{\"has_image\":\"1\",\"image\":\"60fe9022e0d661627295778.jpg\"}', '2021-06-29 10:20:24', '2021-07-26 04:36:19'),
(111, 'social_icon.element', '{\"url\":\"https:\\/\\/twitter.com\\/\",\"social_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\"}', '2021-07-01 05:02:56', '2021-07-01 05:02:56'),
(112, 'social_icon.element', '{\"url\":\"https:\\/\\/linkedin.com\",\"social_icon\":\"<i class=\\\"fab fa-linkedin\\\"><\\/i>\"}', '2021-07-01 05:03:51', '2021-07-01 05:03:51');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` int(11) DEFAULT NULL,
  `alias` varchar(191) NOT NULL DEFAULT 'NULL',
  `image` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `parameters` text DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `input_form` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `alias`, `image`, `name`, `status`, `parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `input_form`, `created_at`, `updated_at`) VALUES
(1, 101, 'paypal', '5f6f1bd8678601601117144.jpg', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"zapay@paypal.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2023-09-30 02:19:51'),
(2, 102, 'perfect_money', '5f6f1d2a742211601117482.jpg', 'Perfect Money', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"---------------------------\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:20:04'),
(3, 103, 'stripe', '5f6f1d4bc69e71601117515.jpg', 'Stripe Hosted', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"-------------------------------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:20:19'),
(4, 104, 'skrill', '5f6f1d41257181601117505.jpg', 'Skrill', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"--------------------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"------------------------\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:20:30'),
(5, 105, 'paytm', '5f6f1d1d3ec731601117469.jpg', 'PayTM', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"----------------------------------\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"-------------------------------------\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"--------------------------------------\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"--------------------------------\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"---------------------------------\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"------------------------------------\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"----------------------------------------\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:20:58'),
(6, 106, 'payeer', '5f6f1bc61518b1601117126.jpg', 'Payeer', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"--------------------------\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"------------------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.payeer\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:21:10'),
(7, 107, 'paystack', '5f7096563dfb71601214038.jpg', 'PayStack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"----------------------------------\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"-----------------------\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.paystack\"}}\r\n', NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:21:22'),
(8, 108, 'voguepay', '5f6f1d5951a111601117529.jpg', 'VoguePay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"--------------------------\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:21:29'),
(9, 109, 'flutterwave', '5f6f1b9e4bb961601117086.jpg', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"----------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:21:40'),
(10, 110, 'razorpay', '5f6f1d3672dd61601117494.jpg', 'RazorPay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_live_2GA4H7krhmFdvT\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"1FUm4mkgDsg70StPbapEGLbH\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2023-09-30 02:23:57'),
(11, 111, 'stripe_js', '5f7096a31ed9a1601214115.jpg', 'Stripe Storefront', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"-------------------------------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:22:00'),
(12, 112, 'instamojo', '5f6f1babbdbb31601117099.jpg', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"-----------------------------------------\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"----------------------------\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"-----------------------------------------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:22:12'),
(13, 501, 'blockchain', '5f6f1b2b20c6f1601116971.jpg', 'Blockchain', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-----------------------------------------\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"-------------------------------------------\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:22:24'),
(14, 502, 'blockio', '5f6f19432bedf1601116483.jpg', 'Block.io', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":false,\"value\":\"1658-8015-2e5e-9afb\"},\"api_pin\":{\"title\":\"API PIN\",\"global\":true,\"value\":\"-----------------------------\"}}', '{\"BTC\":\"BTC\",\"LTC\":\"LTC\",\"DOGE\":\"DOGE\"}', 1, '{\"cron\":{\"title\": \"Cron URL\",\"value\":\"ipn.blockio\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:22:31'),
(15, 503, 'coinpayments', '5f6f1b6c02ecd1601117036.jpg', 'CoinPayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------------------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"----------------------------------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"--------------------------\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:22:43'),
(16, 504, 'coinpayments_fiat', '5f6f1b94e9b2b1601117076.jpg', 'CoinPayments Fiat', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"--------------------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:22:50'),
(17, 505, 'coingate', '5f6f1b5fe18ee1601117023.jpg', 'Coingate', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-----------------------------------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:22:57'),
(18, 506, 'coinbase_commerce', '5f6f1b4c774af1601117004.jpg', 'Coinbase Commerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-----------------------------------------\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"---------------------------------------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.coinbase_commerce\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:23:07'),
(24, 113, 'paypal_sdk', '5f6f1bec255c61601117164.jpg', 'Paypal Express', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"--------------------------------------------\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"----------------------------------------\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:23:17'),
(25, 114, 'stripe_v3', '5f709684736321601214084.jpg', 'Stripe Checkout', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"-------------------------------------\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"-----------------------------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.stripe_v3\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:23:30'),
(27, 115, 'mollie', '5f6f1bb765ab11601117111.jpg', 'Mollie', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"-----------------------------------------\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"-----------------------------------------\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-07-28 06:23:42'),
(30, 116, 'cashmaal', '5f9a8b62bb4dd1603963746.png', 'Cashmaal', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"-------------------------------\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"-----------------------------------\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.cashmaal\"}}', NULL, NULL, NULL, '2021-07-28 06:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `method_code` int(11) DEFAULT NULL,
  `gateway_alias` varchar(25) DEFAULT NULL,
  `min_amount` decimal(18,8) NOT NULL,
  `max_amount` decimal(18,8) NOT NULL,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(191) DEFAULT NULL,
  `gateway_parameter` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(2, 'RazorPay', 'INR', '₹', 110, 'razorpay', 100.00000000, 10000.00000000, 2.00, 20.00000000, 83.00000000, NULL, '{\"key_id\":\"rzp_live_2GA4H7krhmFdvT\",\"key_secret\":\"1FUm4mkgDsg70StPbapEGLbH\"}', '2023-09-30 02:33:52', '2023-09-30 02:33:52'),
(3, 'PayTM - INR', 'INR', '₹', 105, 'paytm', 100.00000000, 10000.00000000, 2.00, 20.00000000, 83.00000000, NULL, '{\"MID\":\"----------------------------------\",\"merchant_key\":\"-------------------------------------\",\"WEBSITE\":\"--------------------------------------\",\"INDUSTRY_TYPE_ID\":\"--------------------------------\",\"CHANNEL_ID\":\"---------------------------------\",\"transaction_url\":\"------------------------------------\",\"transaction_status_url\":\"----------------------------------------\"}', '2023-09-30 02:36:55', '2023-09-30 02:36:55'),
(4, 'Stripe Hosted - INR', 'INR', '₹', 103, 'stripe', 100.00000000, 10000.00000000, 5.00, 20.00000000, 83.00000000, NULL, '{\"secret_key\":\"-----------------------\",\"publishable_key\":\"-------------------------------------\"}', '2023-09-30 02:37:42', '2023-09-30 02:37:42'),
(5, 'Paypal Express - INR', 'INR', '₹', 113, 'paypal_sdk', 100.00000000, 10000.00000000, 5.00, 120.00000000, 83.00000000, NULL, '{\"clientId\":\"--------------------------------------------\",\"clientSecret\":\"----------------------------------------\"}', '2023-09-30 02:39:17', '2023-09-30 02:39:17'),
(6, 'Skrill - INR', 'INR', '₹', 104, 'skrill', 100.00000000, 10000.00000000, 5.00, 10.00000000, 83.00000000, NULL, '{\"pay_to_email\":\"--------------------------------\",\"secret_key\":\"------------------------\"}', '2023-09-30 02:40:43', '2023-09-30 02:40:43'),
(7, 'Stripe Storefront - INR', 'INR', '₹', 111, 'stripe_js', 100.00000000, 10000.00000000, 2.00, 11.00000000, 83.00000000, NULL, '{\"secret_key\":\"-----------------------\",\"publishable_key\":\"-------------------------------------\"}', '2023-09-30 02:41:57', '2023-09-30 02:41:57'),
(8, 'Instamojo - INR', 'INR', '₹', 112, 'instamojo', 100.00000000, 10000.00000000, 5.00, 10.00000000, 83.00000000, NULL, '{\"api_key\":\"-----------------------------------------\",\"auth_token\":\"----------------------------\",\"salt\":\"-----------------------------------------\"}', '2023-09-30 02:42:39', '2023-09-30 02:42:39'),
(9, 'CoinPayments Fiat - INR', 'INR', '₹', 504, 'coinpayments_fiat', 100.00000000, 10000.00000000, 2.00, 10.00000000, 83.00000000, NULL, '{\"merchant_id\":\"--------------------------\"}', '2023-09-30 02:44:09', '2023-09-30 02:44:09'),
(10, 'Coinbase Commerce - INR', 'INR', '₹', 506, 'coinbase_commerce', 100.00000000, 10000.00000000, 2.00, 10.00000000, 83.00000000, NULL, '{\"api_key\":\"-----------------------------------------\",\"secret\":\"---------------------------------------------\"}', '2023-09-30 02:45:39', '2023-09-30 02:45:39'),
(11, 'Stripe Checkout - INR', 'INR', '₹', 114, 'stripe_v3', 100.00000000, 10000.00000000, 2.00, 15.00000000, 83.00000000, NULL, '{\"secret_key\":\"-----------------------\",\"publishable_key\":\"-------------------------------------\",\"end_point\":\"-----------------------------------\"}', '2023-09-30 02:46:41', '2023-09-30 02:46:41');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sitename` varchar(50) DEFAULT NULL,
  `upline_ref_sign_up` decimal(18,8) DEFAULT 0.00000000,
  `cur_text` varchar(20) DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(20) DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(255) DEFAULT NULL,
  `email_template` text DEFAULT NULL,
  `sms_api` varchar(255) DEFAULT NULL,
  `base_color` varchar(10) DEFAULT NULL,
  `secondary_color` varchar(10) DEFAULT NULL,
  `mail_config` text DEFAULT NULL COMMENT 'email configuration',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(4) NOT NULL DEFAULT 0,
  `secure_password` tinyint(4) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `social_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'social login',
  `social_credential` text DEFAULT NULL,
  `active_template` varchar(50) DEFAULT NULL,
  `sys_version` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `sitename`, `upline_ref_sign_up`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_api`, `base_color`, `secondary_color`, `mail_config`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `secure_password`, `registration`, `social_login`, `social_credential`, `active_template`, `sys_version`, `created_at`, `updated_at`) VALUES
(1, 'ZAPAY', 10.00000000, 'USD', '$', 'admin@gmail.com', '<table style=\"color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(0, 23, 54); text-decoration-style: initial; text-decoration-color: initial;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" bgcolor=\"#001736\"><tbody><tr><td valign=\"top\" align=\"center\"><table class=\"mobile-shell\" width=\"650\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"td container\" style=\"width: 650px; min-width: 650px; font-size: 0pt; line-height: 0pt; margin: 0px; font-weight: normal; padding: 55px 0px;\"><div style=\"text-align: center;\"><img src=\"https://i.ibb.co/2cKPhLK/logo2.png\" style=\"height: 240 !important;width: 338px;margin-bottom: 20px;\"></div><table style=\"width: 650px; margin: 0px auto;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td style=\"padding-bottom: 10px;\"><table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"tbrr p30-15\" style=\"padding: 60px 30px; border-radius: 26px 26px 0px 0px;\" bgcolor=\"#000036\"><table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td style=\"color: rgb(255, 255, 255); font-family: Muli, Arial, sans-serif; font-size: 20px; line-height: 46px; padding-bottom: 25px; font-weight: bold;\">Hi {{name}} ,</td></tr><tr><td style=\"color: rgb(193, 205, 220); font-family: Muli, Arial, sans-serif; font-size: 20px; line-height: 30px; padding-bottom: 25px;\">{{message}}</td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table><table style=\"width: 650px; margin: 0px auto;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"p30-15 bbrr\" style=\"padding: 50px 30px; border-radius: 0px 0px 26px 26px;\" bgcolor=\"#000036\"><table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"text-footer1 pb10\" style=\"color: rgb(0, 153, 255); font-family: Muli, Arial, sans-serif; font-size: 18px; line-height: 30px; text-align: center; padding-bottom: 10px;\">© 2020 PayLab. All Rights Reserved.</td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>', 'https://api.infobip.com/api/v3/sendsms/plain?user=*******&password=**********&sender=PayLab&SMSText={{message}}&GSM={{number}}&type=longSMS', '145BCD', '00006B', '{\"name\":\"php\"}', 1, 1, 0, 1, 0, 0, 1, 0, '{\"google_client_id\":\"53929591142-l40gafo7efd9onfe6tj545sf9g7tv15t.apps.googleusercontent.com\",\"google_client_secret\":\"BRdB3np2IgYLiy4-bwMcmOwN\",\"fb_client_id\":\"277229062999748\",\"fb_client_secret\":\"1acfc850f73d1955d14b282938585122\"}', 'basic', NULL, NULL, '2023-10-04 00:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `text_align` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '5f15968db08911595250317.png', 0, 1, '2020-07-06 03:47:55', '2021-03-18 06:45:08'),
(5, 'Hindi', 'hn', NULL, 0, 0, '2020-12-29 02:20:07', '2020-12-29 02:20:16'),
(9, 'Bangla', 'bn', NULL, 0, 0, '2021-03-14 04:37:41', '2021-03-14 04:37:41');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2023_10_20_053306_create_payment_logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `tempname` varchar(191) DEFAULT NULL COMMENT 'template name',
  `secs` text DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', 'home', 'templates.basic.', '[\"service\",\"feature\",\"overview\",\"apps\",\"payment\",\"partner\"]', 1, '2020-07-11 06:23:58', '2021-06-29 10:43:07');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_logs`
--

INSERT INTO `payment_logs` (`id`, `log`, `created_at`, `updated_at`) VALUES
(1, '{\"statuscode\":\"ERR\",\"actcode\":null,\"status\":\"Request made from invalid ip address - 180.188.237.25\",\"data\":null,\"timestamp\":\"2023-10-20 11:07:56\",\"ipay_uuid\":\"h0059a698707-6537-4374-a4d4-9470a23a41be-jPcDRRbcn2Zd\",\"orderid\":null,\"environment\":\"LIVE\",\"internalCode\":null}', '2023-10-20 00:07:58', '2023-10-20 00:07:58');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `delay` varchar(191) NOT NULL,
  `select_field` text DEFAULT NULL,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `description` text DEFAULT NULL,
  `user_data` text NOT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '0=> Disable, 1=>Enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `icon`, `category_id`, `delay`, `select_field`, `fixed_charge`, `percent_charge`, `description`, `user_data`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fast Recharge', '<i class=\"las la-money-bill-alt\"></i>', 1, '48 Hours', '{\"operator\":[\"Airtel\",\"Jio\",\"VI\",\"BSNL\"]}', 1.00000000, 2.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br>', '{\"mobile_number\":{\"field_name\":\"mobile_number\",\"field_level\":\"Mobile Number\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-09-30 01:34:13', '2023-09-30 01:34:13'),
(2, 'F. Internet Bill', '<i class=\"las la-globe-asia\"></i>', 2, '1 hours', NULL, 1.00000000, 2.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br>', '{\"internet_provider_id\":{\"field_name\":\"internet_provider_id\",\"field_level\":\"Internet Provider ID\",\"type\":\"text\",\"validation\":\"required\"},\"nid_front\":{\"field_name\":\"nid_front\",\"field_level\":\"NID Front\",\"type\":\"file\",\"validation\":\"required\"},\"nid_back\":{\"field_name\":\"nid_back\",\"field_level\":\"NID Back\",\"type\":\"file\",\"validation\":\"required\"}}', 1, '2023-09-30 01:36:39', '2023-09-30 01:52:55'),
(3, 'Internet Bill', '<i class=\"las la-globe-americas\"></i>', 2, '30 Seconds', NULL, 1.00000000, 2.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br>', '{\"internet_provider_id\":{\"field_name\":\"internet_provider_id\",\"field_level\":\"Internet Provider ID\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-09-30 01:37:27', '2023-09-30 01:37:27'),
(4, 'M. Balance', '<i class=\"lab la-amazon-pay\"></i>', 1, '48 Hours', '{\"operator\":[\"Airtal\",\"TATA DOCOMO\",\"JIO\",\"IDEA\"]}', 1.00000000, 1.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br>', '{\"mobile_number\":{\"field_name\":\"mobile_number\",\"field_level\":\"Mobile Number\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-09-30 01:38:54', '2023-09-30 01:38:54'),
(5, 'GAS', '<i class=\"las la-fire\"></i>', 3, '48 Hours', NULL, 1.00000000, 1.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br>', '{\"gass_card_number\":{\"field_name\":\"gass_card_number\",\"field_level\":\"Gass Card Number\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-09-30 01:39:38', '2023-09-30 01:39:38'),
(6, 'Electricity', '<i class=\"las la-assistive-listening-systems\"></i>', 3, '48 Hours', NULL, 1.00000000, 1.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br>', '{\"meter_number\":{\"field_name\":\"meter_number\",\"field_level\":\"Meter Number\",\"type\":\"text\",\"validation\":\"required\"},\"meter_owner_name\":{\"field_name\":\"meter_owner_name\",\"field_level\":\"Meter Owner Name\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-09-30 01:40:57', '2023-09-30 01:41:34'),
(7, 'TV', '<i class=\"las la-tv\"></i>', 3, '48 Hours', NULL, 1.00000000, 1.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br>', '{\"tv_card_number\":{\"field_name\":\"tv_card_number\",\"field_level\":\"TV Card Number\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-09-30 01:42:09', '2023-09-30 01:42:09'),
(8, 'Shopping Bill', '<i class=\"las la-shopping-bag\"></i>', 4, '48 Hours', '{\"send_via\":[\"PAYTEM\",\"GPAY\",\"AMAZON\"]}', 1.00000000, 1.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br>', '{\"account_number\":{\"field_name\":\"account_number\",\"field_level\":\"Account Number\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-09-30 01:43:18', '2023-09-30 01:43:18'),
(9, 'Other', '<i class=\"las la-infinity\"></i>', 4, '48 Hours', '{\"send_via\":[\"BANK\",\"MOBILE COMPANY\",\"Debit Card\"]}', 1.00000000, 1.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br>', '{\"receiver_account_number\":{\"field_name\":\"receiver_account_number\",\"field_level\":\"Receiver Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"receiver_name\":{\"field_name\":\"receiver_name\",\"field_level\":\"Receiver Name\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-09-30 01:49:10', '2023-09-30 01:49:10'),
(10, 'Salary', '<i class=\"las la-money-bill-wave\"></i>', 4, '48 Hours', '{\"send_via\":[\"BANK\",\"PhonePay\",\"PAYTM\"]}', 1.00000000, 1.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long-established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'Lorem Ipsum will uncover many websites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humor and the like).</span><br>', '{\"receiver_account_number\":{\"field_name\":\"receiver_account_number\",\"field_level\":\"Receiver Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"receiver_name\":{\"field_name\":\"receiver_name\",\"field_level\":\"Receiver Name\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-09-30 01:52:19', '2023-09-30 01:52:19'),
(11, 'Loan', '<i class=\"las la-calendar-minus\"></i>', 4, '48 Hours', '{\"send_via\":[\"BANK\",\"PAYTM\",\"RAZORPAY\"]}', 1.00000000, 1.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br>', '{\"receiver_account_number\":{\"field_name\":\"receiver_account_number\",\"field_level\":\"Receiver Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"receiver_name\":{\"field_name\":\"receiver_name\",\"field_level\":\"Receiver Name\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-09-30 01:57:13', '2023-09-30 01:57:13'),
(12, 'Airtime', '<i class=\"las la-stopwatch\"></i>', 1, '48 Hours', '{\"operator\":[\"GPAY\",\"RAZORPAY\",\"PHONEPAY\"]}', 1.00000000, 1.00000000, '<span style=\"color: rgb(0, 0, 0);\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br>', '{\"mobile_number\":{\"field_name\":\"mobile_number\",\"field_level\":\"Mobile Number\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-09-30 01:58:32', '2023-09-30 01:58:32');

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `field_type` varchar(91) DEFAULT NULL,
  `field_name` varchar(91) DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=>Enable, 0=>Disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `field_type`, `field_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Recharge', 'select', 'operator', 1, '2023-09-30 01:16:18', '2023-09-30 01:32:33'),
(2, 'Net', NULL, NULL, 1, '2023-09-30 01:35:02', '2023-09-30 01:35:27'),
(3, 'Bill', NULL, NULL, 1, '2023-09-30 01:35:11', '2023-09-30 01:35:11'),
(4, 'Payment', 'select', 'send_via', 1, '2023-09-30 01:35:23', '2023-09-30 01:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(11) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_attachments`
--

INSERT INTO `support_attachments` (`id`, `support_message_id`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 1, '651cf0787fbd81696395384.jpeg', '2023-10-03 23:26:24', '2023-10-03 23:26:24'),
(2, 1, '651cf0788422d1696395384.jpg', '2023-10-03 23:26:24', '2023-10-03 23:26:24'),
(3, 2, '651cf1281a8221696395560.png', '2023-10-03 23:29:20', '2023-10-03 23:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `supportticket_id` varchar(191) NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `message` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_messages`
--

INSERT INTO `support_messages` (`id`, `supportticket_id`, `admin_id`, `message`, `created_at`, `updated_at`) VALUES
(1, '1', 0, 'My Recharge not Done Yet.', '2023-10-03 23:26:24', '2023-10-03 23:26:24'),
(2, '1', 1, 'HELLO GREATHIMANSH,\r\n\r\n            Your Recharge Pending Due TO Preview Payment Pending. Please Clear the First Preview Payment', '2023-10-03 23:29:20', '2023-10-03 23:29:20'),
(3, '1', 0, 'Ok now i m done my all preview payment Please release my recharger early as possible\r\nThank you..', '2023-10-03 23:32:35', '2023-10-03 23:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(91) DEFAULT NULL,
  `ticket` varchar(191) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `name`, `email`, `ticket`, `subject`, `status`, `last_reply`, `created_at`, `updated_at`) VALUES
(1, 1, 'Himanshu Kumar', 'himanshu@gmail.com', '905626', 'TESTING', 3, '2023-10-04 05:02:35', '2023-10-03 23:26:24', '2023-10-03 23:39:48');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(10) DEFAULT NULL,
  `trx` varchar(25) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `charge`, `post_balance`, `trx_type`, `trx`, `details`, `created_at`, `updated_at`) VALUES
(1, 1, 1000.00000000, 0.00000000, 1000.00000000, '+', 'ZBSZ25ZGFF7Y', 'Added Balance Via Admin', '2023-09-30 02:01:01', '2023-09-30 02:01:01'),
(2, 1, 1000.00000000, 0.00000000, 2000.00000000, '+', 'J42DWGRDBZD7', 'Added Balance Via Admin', '2023-09-30 02:01:03', '2023-09-30 02:01:03'),
(3, 1, 50.00000000, 15.00000000, 2050.00000000, '+', '3YB23FKTSD1O', 'Deposit Via educaition', '2023-09-30 02:08:36', '2023-09-30 02:08:36'),
(4, 1, 10.00000000, 1.20000000, 2038.80000000, '-', 'NEVHQE6OKJ5V', 'Requested for Recharge service', '2023-09-30 02:09:32', '2023-09-30 02:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(90) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `ref_by` int(11) DEFAULT NULL,
  `balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `image` varchar(91) DEFAULT NULL,
  `address` text DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: sms unverified, 1: sms verified',
  `ver_code` varchar(91) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `mobile`, `ref_by`, `balance`, `password`, `image`, `address`, `status`, `ev`, `sv`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Himanshu', 'Kumar', 'greathimansh', 'honeysingh8027@gmail.com', '917696802762', NULL, 2038.80000000, '$2y$10$WgUidqunj7glwu1nFl5Ec.7nefPdWaYxDpj33NapdWeSdTEIsDZjO', '1696069909_greathimansh.jpg', '{\"address\":\"Hanumanchowk, maata rani wali gali, near shanidev mandir,\",\"city\":\"Bathinda\",\"state\":\"punjab\",\"zip\":\"151001\",\"country\":\"India\"}', 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, '2023-09-30 00:49:10', '2023-10-04 01:24:22');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(50) DEFAULT NULL,
  `location` varchar(91) DEFAULT NULL,
  `browser` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `country_code` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `location`, `browser`, `os`, `longitude`, `latitude`, `country`, `country_code`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2023-09-30 00:49:11', '2023-09-30 00:49:11'),
(2, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2023-09-30 00:58:07', '2023-09-30 00:58:07'),
(3, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2023-09-30 01:59:40', '2023-09-30 01:59:40'),
(4, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2023-10-03 23:23:47', '2023-10-03 23:23:47'),
(5, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2023-10-19 00:33:29', '2023-10-19 00:33:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apply_services`
--
ALTER TABLE `apply_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apply_services`
--
ALTER TABLE `apply_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
