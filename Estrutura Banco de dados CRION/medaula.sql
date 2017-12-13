-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 13-Dez-2017 às 01:47
-- Versão do servidor: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medaula`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(96) NOT NULL,
  `email` varchar(112) NOT NULL,
  `senha` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
);

--
-- Extraindo dados da tabela `tb_usuario`
-- SENHA EM MD5
--

INSERT INTO `tb_usuario` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Vinicius', 'vsawgado@gmail.com', '202cb962ac59075b964b07152d234b70'),
(2, 'crion1', 'crion1@gmail.com', '6142e59c47d4a890e18ca065be09aa0a'),
(3, 'crion2', 'crion2@gmail.com', '791b0bbd6e3eca8c11728a66ce7471c3'),
(4, 'crion3', 'crion3@gmail.com', '48a433f0cdc8fa3cf65597d0eb7d15cb'),
(5, 'crion4', 'crion4@gmail.com', '09007ff581d5bc35966bc50ceb2610b9'),
(6, 'crion5', 'crion5@gmail.com', '6e7a10bf261329189c5db73192fe37b5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tweet`
--

DROP TABLE IF EXISTS `tweet`;
CREATE TABLE IF NOT EXISTS `tweet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tweet` text NOT NULL,
  `name` text NOT NULL,
  `id_usuario` double NOT NULL,
  `ProfileLocation` text NOT NULL,
  `Text` text NOT NULL,
  `Lat` double DEFAULT NULL,
  `Lng` double DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Estrutura da tabela `votacao`
--

DROP TABLE IF EXISTS `votacao`;
CREATE TABLE IF NOT EXISTS `votacao` (
  `id_usuario` int(11) DEFAULT NULL,
  `id_tweet` int(11) DEFAULT NULL,
  `crime` int(11) DEFAULT NULL,
  `naocrime` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  KEY `fk_tb_usuario` (`id_usuario`),
  KEY `fk_tweet` (`id_tweet`)
);