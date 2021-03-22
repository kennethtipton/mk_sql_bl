CREATE DATABASE [IF NOT EXISTS] mk_sql_bl

--
-- Table structure for table `bl_sources`
--

CREATE TABLE `bl_sources` (
  `bl_source_name` varchar(48) NOT NULL,
  `bl_source_description` varchar(128) DEFAULT NULL,
  `bl_source_web_site` varchar(48) DEFAULT NULL,
  `bl_source_url` char(128) NOT NULL,
  `bl_source_output_file` varchar(48) DEFAULT NULL,
  `bl_source_ip_type` varchar(10) DEFAULT NULL,
  `bl_source_ip_notation` varchar(16) DEFAULT NULL,
  `bl_address_list_name` varchar(48) DEFAULT NULL,
  `bl_source_update_interval` time DEFAULT NULL,
  `bl_source_active` tinyint(1) DEFAULT NULL,
  `bl_source_expires` datetime DEFAULT NULL,
  `bl_source_filter` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`bl_source_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `ip_blacklist`
--

DROP TABLE IF EXISTS `ip_blacklist`;

CREATE TABLE `ip_blacklist` (
  `bl_ipaddress` varchar(54) NOT NULL,
  `bl_ipaddress_import_Source` varchar(40) DEFAULT NULL,
  `bl_ipaddress_source_date` datetime DEFAULT NULL,
  `bl_ipaddress_import_date` datetime DEFAULT NULL,
  `bl_ipaddress_destination` varchar(32) DEFAULT NULL,
  `bl_ipaddress_expires` datetime DEFAULT NULL,
  `bl_ipaddress_active` tinyint DEFAULT '1',
  `bl_ipaddress_notation_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`bl_ipaddress`),
  KEY `indx_ipaddress` (`bl_ipaddress`),
  FULLTEXT KEY `bl_IP_Address` (`bl_ipaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
