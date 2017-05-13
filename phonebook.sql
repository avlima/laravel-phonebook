-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.18-0ubuntu0.16.04.1 - (Ubuntu)
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para phonebook
CREATE DATABASE IF NOT EXISTS `phonebook` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `phonebook`;

-- Copiando estrutura para tabela phonebook.agendas
CREATE TABLE IF NOT EXISTS `agendas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `completed` enum('Sim','Não') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Não',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agendas_user_id_foreign` (`user_id`),
  KEY `agendas_contact_id_foreign` (`contact_id`),
  CONSTRAINT `agendas_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`),
  CONSTRAINT `agendas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela phonebook.agendas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `agendas` DISABLE KEYS */;
INSERT INTO `agendas` (`id`, `user_id`, `contact_id`, `description`, `date`, `completed`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'teste', '2017-05-12', 'Não', '2017-05-12 21:07:00', '2017-05-12 21:07:02'),
	(3, 2, 2, 'teste teste teste', '2017-06-05', 'Não', '2017-05-13 12:10:43', '2017-05-13 12:10:43'),
	(5, 1, 1, 'trwetrwetwert', '2017-10-20', 'Não', '2017-05-13 14:23:57', '2017-05-13 14:23:57'),
	(6, 1, 6, 'werqwreqwer qwe qwer qwer', '2017-11-11', 'Sim', '2017-05-13 16:52:06', '2017-05-13 16:52:21'),
	(7, 1, 1, 'ertwertwert wrtwetwe t', '2017-04-20', 'Não', '2017-05-13 16:56:09', '2017-05-13 16:56:09');
/*!40000 ALTER TABLE `agendas` ENABLE KEYS */;

-- Copiando estrutura para tabela phonebook.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phonebooks_user_id_foreign` (`user_id`),
  CONSTRAINT `phonebooks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela phonebook.contacts: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` (`id`, `user_id`, `name`, `phone`, `email`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Carlos Miranda', '(44) 99970-7919', 'carlos@teste.com', '2017-05-12 15:34:24', '2017-05-12 21:36:45'),
	(2, 2, 'Cleber', '9999999999', 'cleber@teste.com', '2017-05-12 18:28:08', '2017-05-12 18:28:08'),
	(6, 1, 'Teste', '(23) 42342-3423', 'teste@teste.com', '2017-05-12 23:53:50', '2017-05-12 23:53:50'),
	(7, 1, 'Roberto Carlos da Silva', '(41) 99970-0019', 'robertp@teste.com', '2017-05-13 21:11:35', '2017-05-13 21:27:06');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;

-- Copiando estrutura para tabela phonebook.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela phonebook.migrations: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2017_05_12_005245_create_contacts_table', 1),
	(5, '2017_05_12_214802_create_agendas_table', 2),
	(6, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
	(7, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
	(8, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
	(9, '2016_06_01_000004_create_oauth_clients_table', 3),
	(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela phonebook.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela phonebook.oauth_access_tokens: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('0a3eb8e8b7706aa8ea4ca5dc70cc75cc19e6db0559cb1c2ba7fdaadcee2586b718adf485b3d105f1', 2, 1, NULL, '["*"]', 0, '2017-05-13 18:35:31', '2017-05-13 18:35:31', '2017-05-28 18:35:31'),
	('21cb5c343c617eed58992ce87a9bc36131cb748376743f8e80d4510b320550833b0aacb62a8f81e1', 2, 1, NULL, '["*"]', 0, '2017-05-13 17:48:24', '2017-05-13 17:48:24', '2018-05-13 17:48:24'),
	('282a99656f25dd0c1dd2e1dd5bab612554a25a0af3d33688b363f52f1a9925dfac0936db561f7c7b', 1, 1, NULL, '["*"]', 0, '2017-05-13 21:05:24', '2017-05-13 21:05:24', '2017-05-28 21:05:24'),
	('2d4145eda4cea69bf3664e3f59fc9a23e9ede918bdad0e1573394e96ba34f6fe38b2c38544af2dc0', 1, 1, NULL, '[]', 0, '2017-05-13 19:32:28', '2017-05-13 19:32:28', '2017-05-28 19:32:28'),
	('3bbd0ab6f432187498b02c000eb1a0cdd97447020962aa2e068f7f92cb646084ca870f131e30f6ad', 1, 1, NULL, '["*"]', 0, '2017-05-13 19:25:31', '2017-05-13 19:25:31', '2018-05-13 19:25:31'),
	('55c6406b06d810d7b5530fc6c378af7616a35500ee0b678c268d6c623934040e8588f18296725492', 1, 1, NULL, '["*"]', 0, '2017-05-13 19:22:26', '2017-05-13 19:22:26', '2018-05-13 19:22:26'),
	('560546e9a9ce069d2cbd7dc74c43663ac52e0d264767451a99fa261859e8cbc2c1d458063efde1f3', 2, 1, NULL, '[]', 0, '2017-05-13 18:28:25', '2017-05-13 18:28:25', '2018-05-13 18:28:25'),
	('65f0953cb44d3d0eb53526d9cd21762cf67a2cc8afbee4fe5efc43c30740d5d5d133dba3dfe63cc5', 2, 1, NULL, '["*"]', 0, '2017-05-13 17:48:27', '2017-05-13 17:48:27', '2018-05-13 17:48:27'),
	('6d2735b0e5a409f609fe3046305c6c6a46bdd2a2945e01048adb5451889801f99799ebef749c5fbc', 1, 1, NULL, '["*"]', 0, '2017-05-13 17:35:52', '2017-05-13 17:35:52', '2018-05-13 17:35:52'),
	('799129cc5808fb004a63b2eace8a191d073476be2f9a9cbd938a73b871c6c06b56a0e3a4d3b2c33e', 2, 1, NULL, '["*"]', 0, '2017-05-13 17:48:28', '2017-05-13 17:48:28', '2018-05-13 17:48:28'),
	('7a19d03c287d91ece723e6853888d4fa3f07505752335ae05f312cbac54cf57ffddc9a97acc18841', 2, 1, NULL, '[]', 0, '2017-05-13 18:13:16', '2017-05-13 18:13:16', '2018-05-13 18:13:16'),
	('8b0b6bd38eb8c4e093e00dde0e145ab09560328bdcdd0731977a86ed33cd81ce1395f33f11ba0d21', 2, 1, NULL, '["*"]', 0, '2017-05-13 17:56:57', '2017-05-13 17:56:57', '2018-05-13 17:56:57'),
	('ad5fb7d4c2e2d4aae8ec1548c04d35fbd2f0072544618b90d9c8e96aeb57a5bed13fda12377047e2', 2, 1, NULL, '["*"]', 0, '2017-05-13 17:50:00', '2017-05-13 17:50:00', '2018-05-13 17:50:00'),
	('b451d776d8de7233fb995ded01d54d46fcd2f2aad15a92ce3d44e089a49a88672af4a7eefd5e71c2', 1, 1, NULL, '["*"]', 0, '2017-05-13 19:06:12', '2017-05-13 19:06:12', '2018-05-13 19:06:12'),
	('b4af4bab1aab7868d62a32f910c5eab4e975218769772d6e12e3f2c3807f1ec5152181edd6e41f51', 1, 1, NULL, '["*"]', 0, '2017-05-13 19:22:02', '2017-05-13 19:22:02', '2018-05-13 19:22:02'),
	('ce8923315b6eaa88ca2c74a438fb690ecab8452853395643f6192e62768f0b24ec0ddc057648b0a2', 2, 1, NULL, '[]', 0, '2017-05-13 18:27:25', '2017-05-13 18:27:25', '2037-05-13 18:27:25'),
	('d5ebc00adfb62b03dc9698ee2315e6eb08432647d11058ba1bec73c31ba8bb4ba0c17cac3182fa4f', 2, 1, NULL, '["*"]', 0, '2017-05-13 17:37:22', '2017-05-13 17:37:22', '2018-05-13 17:37:22'),
	('d7cf5247868f1ad001227dc526236c7c7d3b130916cfb30c087f6aafdf3be34324eaa90c25de6f91', 2, 1, NULL, '[]', 0, '2017-05-13 17:59:32', '2017-05-13 17:59:32', '2018-05-13 17:59:32'),
	('d7dd61c9237daf89b53f957b19f7fcb95c3504af52913f5e0bb47e6696f95fe7b61e0aa043b79c48', 2, 1, NULL, '[]', 0, '2017-05-13 18:22:14', '2017-05-13 18:22:14', '2018-05-13 18:22:14'),
	('d855e997c6953faafd3dd8f4d6fd9c64dae1e6fc530ff67fd861a09409b1c3345cf04c37351bb76e', 2, 1, NULL, '[]', 0, '2017-05-13 18:28:23', '2017-05-13 18:28:23', '2018-05-13 18:28:23'),
	('d943daf37e5da719c71274cb899eeb44a5a4dbc258a0b738f4fc7d39465575b3ce7aec932ab7fd45', 1, 1, NULL, '["*"]', 0, '2017-05-13 19:28:09', '2017-05-13 19:28:09', '2017-05-28 19:28:09'),
	('db80018b09e668e304924151462bc6f021836e185ac78011804956262fcb905e407a7041ff877893', 2, 1, NULL, '[]', 0, '2017-05-13 18:28:24', '2017-05-13 18:28:24', '2018-05-13 18:28:24'),
	('dbf8eb67457542ad8884de77036bc252f6965ea4b030c0a2ff28c832629115c20704e9feff6cb808', 1, 1, NULL, '["*"]', 0, '2017-05-13 18:56:33', '2017-05-13 18:56:33', '2018-05-13 18:56:33'),
	('e0412efa21736974b80edfcf42083d797355bcd1549a982379894b0f3bca6f6cb2956c4d697ef2d5', 2, 1, NULL, '[]', 0, '2017-05-13 18:12:43', '2017-05-13 18:12:43', '2018-05-13 18:12:43'),
	('e5c7796de649f52a2ea632e5f522796498df6e45658cb88791212c13c90a079590fb42ab67e4a4bf', 1, 1, NULL, '["*"]', 0, '2017-05-13 18:52:59', '2017-05-13 18:52:59', '2018-05-13 18:52:59');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Copiando estrutura para tabela phonebook.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela phonebook.oauth_auth_codes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Copiando estrutura para tabela phonebook.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela phonebook.oauth_clients: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Phonebook Password Grant Client', 'RPqcZyG8fFFCuAgak2bwlC6fuupw9E3FDAFuZxqm', 'http://localhost', 0, 1, 0, '2017-05-13 17:31:42', '2017-05-13 17:31:42');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Copiando estrutura para tabela phonebook.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela phonebook.oauth_personal_access_clients: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Copiando estrutura para tabela phonebook.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela phonebook.oauth_refresh_tokens: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
	('02f662dd18bb213f3171241a82783e73ecd0e7e83b328003eec71a95f4b1121469613284b61072c9', '2d4145eda4cea69bf3664e3f59fc9a23e9ede918bdad0e1573394e96ba34f6fe38b2c38544af2dc0', 0, '2017-06-12 19:32:28'),
	('07b62779cbbebe6930a441a4cc994ff84ead8f523880ba982246e5ad0ec5166a2d282617d9e73b4a', 'db80018b09e668e304924151462bc6f021836e185ac78011804956262fcb905e407a7041ff877893', 0, '2018-05-13 18:28:24'),
	('0ce1849849a92a875534111f61d76b9c57183b8d811122ce9af800d3ffd5f4352546acb9c731bb32', 'd855e997c6953faafd3dd8f4d6fd9c64dae1e6fc530ff67fd861a09409b1c3345cf04c37351bb76e', 0, '2018-05-13 18:28:23'),
	('19b40de48252bddacc171c2722fefd19a0ebe68f4d5e1b066fb3126e5ae396e42c09a6198eb2b1aa', 'e0412efa21736974b80edfcf42083d797355bcd1549a982379894b0f3bca6f6cb2956c4d697ef2d5', 0, '2018-05-13 18:12:43'),
	('376cede6d8527143ba112ede130624ac928af266d25d5facb22271c396052dafb97d44a93cea1f73', '0a3eb8e8b7706aa8ea4ca5dc70cc75cc19e6db0559cb1c2ba7fdaadcee2586b718adf485b3d105f1', 0, '2017-06-12 18:35:31'),
	('3b67f9c521c5fabf59fbcbbaae1e61a1292c96795e6f1a692d88b06a35b0720d73099b2f013da507', '560546e9a9ce069d2cbd7dc74c43663ac52e0d264767451a99fa261859e8cbc2c1d458063efde1f3', 0, '2018-05-13 18:28:25'),
	('4a85901f60cb37ef6b1cdbb2b5c5f0cf7502fdf0a72eb490341457f780f63e11ddb3dd974db722f4', '55c6406b06d810d7b5530fc6c378af7616a35500ee0b678c268d6c623934040e8588f18296725492', 0, '2018-05-13 19:22:26'),
	('4d85628b13a8a56f47e18df1618861fcfcff72bfea1fb8b8aa9cd673328891ecac7157c8d2386c5e', '3bbd0ab6f432187498b02c000eb1a0cdd97447020962aa2e068f7f92cb646084ca870f131e30f6ad', 0, '2018-05-13 19:25:31'),
	('4f4cd32ad37b5ba03d4ff3877a3e60ff42fe739a54c54260558071734db9b80cd9123187886b7dee', '8b0b6bd38eb8c4e093e00dde0e145ab09560328bdcdd0731977a86ed33cd81ce1395f33f11ba0d21', 0, '2018-05-13 17:56:57'),
	('4f8581e0bbde3518016c0589850fc555373ec3c442367ab77e17e3d1c534b33f176a8202d678f41d', 'e5c7796de649f52a2ea632e5f522796498df6e45658cb88791212c13c90a079590fb42ab67e4a4bf', 0, '2018-05-13 18:52:59'),
	('5afd21205b92e8261815cca27c0adf154a66f6aea5a453286c820951117290c17c9ba8dee46a61e6', '799129cc5808fb004a63b2eace8a191d073476be2f9a9cbd938a73b871c6c06b56a0e3a4d3b2c33e', 0, '2018-05-13 17:48:28'),
	('665e058d92aa63c545c45b307976766d78875a153d9f52aa67a76115b4d63f01f4aac936606b92c9', 'd7cf5247868f1ad001227dc526236c7c7d3b130916cfb30c087f6aafdf3be34324eaa90c25de6f91', 0, '2018-05-13 17:59:32'),
	('68b1bee9b9b2009ee33206afa1a2e1bccbda4af72bb9264212ae38977a32cd98c4be47cc3e02703d', 'b451d776d8de7233fb995ded01d54d46fcd2f2aad15a92ce3d44e089a49a88672af4a7eefd5e71c2', 0, '2018-05-13 19:06:12'),
	('76b4aa9ea00befea40b8906c39973b44a2e0fc246403e48bfbc7e93eb7db153c0338b22e17b9dadc', '6d2735b0e5a409f609fe3046305c6c6a46bdd2a2945e01048adb5451889801f99799ebef749c5fbc', 0, '2018-05-13 17:35:52'),
	('89bcd566775ea6ec64853dd2c9999e7e5922e9bb99f6f88ac6f34a14edb8cbe005ff219b09986419', 'ad5fb7d4c2e2d4aae8ec1548c04d35fbd2f0072544618b90d9c8e96aeb57a5bed13fda12377047e2', 0, '2018-05-13 17:50:00'),
	('8f702890e9029c7ab2778d4aaa998dc1ac591b131f158fc61278f973caf433f1e80e9f472f638f9e', 'ce8923315b6eaa88ca2c74a438fb690ecab8452853395643f6192e62768f0b24ec0ddc057648b0a2', 0, '2037-05-13 18:27:25'),
	('98e3a3641e81fef173962e9865924ff32eeb604eb49e7c13bebc1e2b57a567ce906bf7c83f82f111', 'b4af4bab1aab7868d62a32f910c5eab4e975218769772d6e12e3f2c3807f1ec5152181edd6e41f51', 0, '2018-05-13 19:22:02'),
	('9c790e05945eae9bf43066d6ebbb5d31380ec2627c12a5ccf92589e270bb4a27eb35ea4ca4bdfab0', 'dbf8eb67457542ad8884de77036bc252f6965ea4b030c0a2ff28c832629115c20704e9feff6cb808', 0, '2018-05-13 18:56:33'),
	('a565e05933b7925244072d40d38b0c978be36055ff42b43581bfe8a30842c84e7f0570012038708f', 'd5ebc00adfb62b03dc9698ee2315e6eb08432647d11058ba1bec73c31ba8bb4ba0c17cac3182fa4f', 0, '2018-05-13 17:37:22'),
	('aaeefa576fbb24af900cd9438510520446be0f7f5d25647aa8232541b2ad5762b03dca81bb75e039', 'd943daf37e5da719c71274cb899eeb44a5a4dbc258a0b738f4fc7d39465575b3ce7aec932ab7fd45', 0, '2017-06-12 19:28:09'),
	('ae10143a84a7743ffe653341debb77609d3bdcbedbc05844ef40c5bbaf8adc0ccac22012aa45c80d', '21cb5c343c617eed58992ce87a9bc36131cb748376743f8e80d4510b320550833b0aacb62a8f81e1', 0, '2018-05-13 17:48:24'),
	('c48c7f15eda4f9f8f30b8715931a4fef93895a1d3d4b96edc1841fa7917a163b33b2bdc33f3b16ff', '282a99656f25dd0c1dd2e1dd5bab612554a25a0af3d33688b363f52f1a9925dfac0936db561f7c7b', 0, '2017-06-12 21:05:24'),
	('deb4a8368f35150aceb087f353a4ac06717069f235d7f4750004ccc55a2eab62478f657c62cb6a79', '7a19d03c287d91ece723e6853888d4fa3f07505752335ae05f312cbac54cf57ffddc9a97acc18841', 0, '2018-05-13 18:13:16'),
	('e4907021c293775e29b62f6e211ef995f4196a5e92538647d25de4a6b3b4fab83ed5d8eebe655783', '65f0953cb44d3d0eb53526d9cd21762cf67a2cc8afbee4fe5efc43c30740d5d5d133dba3dfe63cc5', 0, '2018-05-13 17:48:27'),
	('e6bbd4011ec5cbb8edadd2c830a86136945d3354b3e2a06cc138cd70eb33b8511b465dce9cdb9faf', 'd7dd61c9237daf89b53f957b19f7fcb95c3504af52913f5e0bb47e6696f95fe7b61e0aa043b79c48', 0, '2018-05-13 18:22:14');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Copiando estrutura para tabela phonebook.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela phonebook.password_resets: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('alberto.lima@sub100.com.br', '$2y$10$xHqCMQTV3Jd1ys0wITIY6utFCj3fBqw/qEYvsz60uIZIAbvBxq1N6', '2017-05-13 22:19:42'),
	('albertovieiradelima@gmail.com', '$2y$10$fCzpiN2R/SeCnrGScg24puxGK7lJmpjpMuTuoilPncp1Sqv20V4e6', '2017-05-13 22:20:17');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Copiando estrutura para tabela phonebook.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela phonebook.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Alberto Vieira de Lima', 'albertovieiradelima@gmail.com', '$2y$10$FQtfguF6EP4RXr8Cn7QI5uRkP3YeGAC3EtKLhqx3E04BM6VS0WCFu', 'xK0iIG3rpSd0l45OdAOstpC5QL7jMTDqekr7jvNGxUomc6SmvbFsCpsrt8j7', '2017-05-12 14:06:43', '2017-05-12 17:47:27'),
	(2, 'Joao da Silva', 'alberto.lima@sub100.com.br', '$2y$10$scR8gydGNizoQ1ta58vsAuI1TXDAyP3QCca6l1NrQ5.dd3qmdue1m', 'XpPfO1LsPFnQFAzCsII2GbeVH9sbqwilCpCJsZ9UR5FgbDV2X0WQubkQH63f', '2017-05-12 18:27:34', '2017-05-12 18:27:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
