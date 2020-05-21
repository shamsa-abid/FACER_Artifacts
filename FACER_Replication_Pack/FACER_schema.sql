-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2020 at 09:11 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `faceremserepopoint5`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesses`
--

CREATE TABLE `accesses` (
  `id` int(11) NOT NULL,
  `host_method_id` int(11) NOT NULL,
  `target_field_id` int(11) NOT NULL,
  `line_num` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `api_call`
--

CREATE TABLE `api_call` (
  `id` int(11) NOT NULL,
  `host_method_id` int(11) NOT NULL,
  `api_name` varchar(350) NOT NULL,
  `api_usage` varchar(150) NOT NULL,
  `line_num` int(11) NOT NULL,
  `in_basic_path` tinyint(1) NOT NULL,
  `in_conditional` tinyint(1) NOT NULL,
  `in_else` tinyint(1) NOT NULL,
  `in_exception` tinyint(1) NOT NULL,
  `api_call_index_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `api_call_index`
--

CREATE TABLE `api_call_index` (
  `id` int(11) NOT NULL,
  `api_call` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `api_call_parameter`
--

CREATE TABLE `api_call_parameter` (
  `id` int(11) NOT NULL,
  `api_parameter_name` varchar(256) NOT NULL,
  `parameter_type_id` int(11) NOT NULL,
  `api_call_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `base_type`
--

CREATE TABLE `base_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `base_type`
--

INSERT INTO `base_type` (`id`, `name`) VALUES
(1, 'Primitive'),
(2, 'User defined'),
(3, 'API object');

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE `calls` (
  `id` int(11) NOT NULL,
  `host_method_id` int(11) NOT NULL,
  `target_method_id` int(11) NOT NULL,
  `line_num` int(11) NOT NULL,
  `in_basic_path` tinyint(1) NOT NULL,
  `in_conditional` tinyint(1) NOT NULL,
  `in_else` tinyint(1) NOT NULL,
  `in_exception` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cluster`
--

CREATE TABLE `cluster` (
  `id` int(11) NOT NULL,
  `clusterID` int(11) NOT NULL,
  `sequenceID` int(11) DEFAULT NULL,
  `methodID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feature_support`
--

CREATE TABLE `feature_support` (
  `feature_id` int(11) NOT NULL,
  `support` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

CREATE TABLE `field` (
  `id` int(11) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `field_type_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `file_name` varchar(555) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int(11) NOT NULL,
  `fqn` varchar(256) NOT NULL,
  `file_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `method`
--

CREATE TABLE `method` (
  `id` int(11) NOT NULL,
  `name` varchar(511) NOT NULL,
  `host_type_id` int(11) NOT NULL,
  `return_type_id` int(11) NOT NULL,
  `from_line_num` int(11) NOT NULL,
  `to_line_num` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `num_statements` int(11) DEFAULT NULL,
  `api_calls_density` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `method_parameter`
--

CREATE TABLE `method_parameter` (
  `id` int(11) NOT NULL,
  `method_parameter_name` varchar(255) NOT NULL,
  `parameter_type_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `method_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `path` varchar(555) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `related_features`
--

CREATE TABLE `related_features` (
  `id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `cluster_id` int(11) NOT NULL,
  `support` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sequence`
--

CREATE TABLE `sequence` (
  `id` int(11) NOT NULL,
  `method_ID` int(11) NOT NULL,
  `sequence` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sim_score`
--

CREATE TABLE `sim_score` (
  `id` int(11) NOT NULL,
  `method_ID_1` int(11) NOT NULL,
  `method_ID_2` int(11) NOT NULL,
  `score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(350) NOT NULL,
  `base_type_id` int(11) NOT NULL,
  `project_id` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `type_hierarchy`
--

CREATE TABLE `type_hierarchy` (
  `id` int(11) NOT NULL,
  `child_type_id` int(11) NOT NULL,
  `parent_type_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uses`
--

CREATE TABLE `uses` (
  `id` int(11) NOT NULL,
  `host_method_id` int(11) NOT NULL,
  `target_type_id` int(11) NOT NULL,
  `line_num` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesses`
--
ALTER TABLE `accesses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_call`
--
ALTER TABLE `api_call`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_call_index`
--
ALTER TABLE `api_call_index`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_call_parameter`
--
ALTER TABLE `api_call_parameter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `calls`
--
ALTER TABLE `calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cluster`
--
ALTER TABLE `cluster`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `method`
--
ALTER TABLE `method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `method_parameter`
--
ALTER TABLE `method_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `related_features`
--
ALTER TABLE `related_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sim_score`
--
ALTER TABLE `sim_score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_hierarchy`
--
ALTER TABLE `type_hierarchy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uses`
--
ALTER TABLE `uses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesses`
--
ALTER TABLE `accesses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `api_call`
--
ALTER TABLE `api_call`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `api_call_index`
--
ALTER TABLE `api_call_index`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `api_call_parameter`
--
ALTER TABLE `api_call_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `calls`
--
ALTER TABLE `calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cluster`
--
ALTER TABLE `cluster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `field`
--
ALTER TABLE `field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `method_parameter`
--
ALTER TABLE `method_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `related_features`
--
ALTER TABLE `related_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sequence`
--
ALTER TABLE `sequence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sim_score`
--
ALTER TABLE `sim_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `type_hierarchy`
--
ALTER TABLE `type_hierarchy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uses`
--
ALTER TABLE `uses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
