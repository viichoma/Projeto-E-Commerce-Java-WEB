-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.28-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para projetojava
CREATE DATABASE IF NOT EXISTS `projetojava` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `projetojava`;

-- Copiando estrutura para tabela projetojava.item_pedido
CREATE TABLE IF NOT EXISTS `item_pedido` (
  `CD_PEDIDO` int(11) DEFAULT NULL,
  `CD_PRODUTO` int(11) DEFAULT NULL,
  `VL_PRECO` double DEFAULT NULL,
  `QT_QUANTIDADE` double DEFAULT NULL,
  `VL_PRECO_TOTAL` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela projetojava.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `CD_PEDIDO` int(11) NOT NULL,
  `CD_USUARIO` int(11) NOT NULL,
  `VL_TOTAL` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`CD_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela projetojava.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `CD_PRODUTO` int(11) NOT NULL AUTO_INCREMENT,
  `DS_PRODUTO` varchar(50) NOT NULL DEFAULT '',
  `VL_PRECO` double NOT NULL DEFAULT 0,
  `DS_TAMANHO` varchar(50) NOT NULL DEFAULT '0',
  `DS_CATEGORIA` varchar(50) DEFAULT NULL,
  `DS_GENERO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CD_PRODUTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela projetojava.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `CD_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `DS_NOME` varchar(50) NOT NULL,
  `DS_EMAIL` varchar(50) NOT NULL,
  `DS_SENHA` varchar(50) NOT NULL,
  PRIMARY KEY (`CD_USUARIO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
