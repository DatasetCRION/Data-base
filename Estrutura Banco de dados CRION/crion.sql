--
-- Database: `crion`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `stoptweet`
--

DROP TABLE IF EXISTS `stoptweet`;
CREATE TABLE IF NOT EXISTS `stoptweet` (
  `id` int(11) NOT NULL,
  `id_tweet` text NOT NULL,
  `name` text NOT NULL,
  `id_usuario` double NOT NULL,
  `ProfileLocation` text NOT NULL,
  `Text` text NOT NULL,
  `Lat` double DEFAULT NULL,
  `Lng` double DEFAULT NULL,
  PRIMARY KEY (`id`)
);


-- Estrutura da tabela `teste`
--

DROP TABLE IF EXISTS `teste`;
CREATE TABLE IF NOT EXISTS `teste` (
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
-- Estrutura da tabela `treinatweet`
--

DROP TABLE IF EXISTS `treinatweet`;
CREATE TABLE IF NOT EXISTS `treinatweet` (
  `id` int(11) NOT NULL,
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
-- Estrutura da tabela `votacaotweetsvm`
--

DROP TABLE IF EXISTS `votacaotweetsvm`;
CREATE TABLE IF NOT EXISTS `votacaotweetsvm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tweet` text NOT NULL,
  `name` text NOT NULL,
  `id_usuario` text NOT NULL,
  `Text` text NOT NULL,
  `Lat` double DEFAULT NULL,
  `Lng` double DEFAULT NULL,
  PRIMARY KEY (`id`)
);