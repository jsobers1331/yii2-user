CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmation_token` varchar(32) DEFAULT NULL,
  `confirmation_sent_at` int(11) DEFAULT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `recovery_token` varchar(32) DEFAULT NULL,
  `recovery_sent_at` int(11) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `registered_from` int(11) DEFAULT NULL,
  `logged_in_from` int(11) DEFAULT NULL,
  `logged_in_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`),
  UNIQUE KEY `user_confirmation` (`id`,`confirmation_token`),
  UNIQUE KEY `user_recovery` (`id`,`recovery_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;


INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `created_at`, `updated_at`, `confirmation_token`, `confirmed_at`, `confirmation_sent_at`) VALUES
(1, 'user', 'user@example.com', '$2y$13$qY.ImaYBppt66qez6B31QO92jc5DYVRzo5NxM1ivItkW74WsSG6Ui', '39HU0m5lpjWtqstFVGFjj6lFb7UZDeRq', 1383494773, 1383494773, NULL, 1383494773, NULL),
(2, 'unconfirmed', 'unconfirmed@example.com', '$2y$13$CIH1LSMPzU9xDCywt3QO8uovAu2axp8hwuXVa72oI.1G/USsGyMBS', 'mhh1A6KfqQLmHP-MiWN0WB0M90Q2u5OE', 1384517855, 1384517855, 'NO2aCmBIjFQX624xmAc3VBu7Th3NJoa6', NULL, 1384517855);