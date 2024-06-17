-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.28-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.7.0.6850
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
CREATE DATABASE IF NOT EXISTS `projetojava` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `projetojava`;

-- Copiando estrutura para tabela projetojava.item_pedido
CREATE TABLE IF NOT EXISTS `item_pedido` (
  `CD_PEDIDO` int(11) DEFAULT NULL,
  `CD_PRODUTO` int(11) DEFAULT NULL,
  `VL_PRECO` double DEFAULT NULL,
  `QT_QUANTIDADE` double DEFAULT NULL,
  `VL_PRECO_TOTAL` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela projetojava.item_pedido: ~0 rows (aproximadamente)
DELETE FROM `item_pedido`;

-- Copiando estrutura para tabela projetojava.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `CD_PEDIDO` int(11) NOT NULL,
  `CD_USUARIO` int(11) NOT NULL,
  `VL_TOTAL` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`CD_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela projetojava.pedido: ~0 rows (aproximadamente)
DELETE FROM `pedido`;

-- Copiando estrutura para tabela projetojava.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `CD_PRODUTO` int(11) NOT NULL AUTO_INCREMENT,
  `DS_NOME` varchar(50) NOT NULL DEFAULT '',
  `DS_PRODUTO` varchar(50) NOT NULL DEFAULT '',
  `VL_PRECO` double NOT NULL DEFAULT 0,
  `DS_TAMANHO` char(50) NOT NULL DEFAULT '0',
  `DS_CATEGORIA` varchar(50) DEFAULT NULL,
  `DS_GENERO` char(50) DEFAULT NULL,
  `QT_QUANTIDADE` int(11) DEFAULT NULL,
  `DS_IMG` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`CD_PRODUTO`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela projetojava.produto: ~12 rows (aproximadamente)
DELETE FROM `produto`;
INSERT INTO `produto` (`CD_PRODUTO`, `DS_NOME`, `DS_PRODUTO`, `VL_PRECO`, `DS_TAMANHO`, `DS_CATEGORIA`, `DS_GENERO`, `QT_QUANTIDADE`, `DS_IMG`) VALUES
	(2, 'Jaqueta Ferrari', 'Jaqueta de corrida Ferrari feita de couro sintétic', 500, 'M', 'ROUPA', 'M', 10, 'https://acdn.mitiendanube.com/stores/002/859/419/products/521-6e898e8078f6055b3d16763883183619-1024-1024.webp'),
	(3, 'Calça Parachute Nike', 'Calça do estilo parachute da Nike', 200, 'M', 'ROUPA', 'F', 10, 'https://acdn.mitiendanube.com/stores/002/859/419/products/1451-26e0c69cc53944d00716851156900030-1024-1024.webp'),
	(4, 'Tênis Nike Air Max Plus TN', 'Tênis inspirado em modelo Air Max Plus TN "triple"', 300, '40', 'SAPATO', 'U', 10, 'https://acdn.mitiendanube.com/stores/002/859/419/products/90-713ac8f1d7414e860017017310387704-1024-1024.webp'),
	(5, 'Jaqueta Moletom Spiderman', 'Jaqueta em tecido de moletom e capuz, com estampa ', 219, 'M', 'ROUPA', 'U', 10, 'https://acdn.mitiendanube.com/stores/002/859/419/products/53-52d47533f41075d90116989850275682-1024-1024.webp'),
	(7, 'Body Streetwear', 'Body em modelagem cut-out com mangas estilo luvas', 129, 'M', 'ROUPA', 'F', 10, 'https://acdn.mitiendanube.com/stores/002/859/419/products/49-bfd7e12a2d216015b017017292391641-1024-1024.webp'),
	(8, 'Body manga longa Nike branco', 'Body com manga longa e zíper frontal, com detalhe ', 130, 'M', 'ROUPA', 'F', 10, 'https://acdn.mitiendanube.com/stores/002/859/419/products/12-89a6abd7009614c66116989842748382-1024-1024.webp'),
	(9, 'Body manga longa Nike', 'Body com manga longa e zíper frontal, com detalhe ', 130, 'M', 'ROUPA', 'F', 10, 'https://acdn.mitiendanube.com/stores/002/859/419/products/441-ec7bd3075c8f534fee16938505128385-1024-1024.webp'),
	(10, 'Camiseta Vintage 90\'s Eminem', 'Camiseta em modelagem reta, inspirada em peças y2k', 150, 'G', 'ROUPA', 'U', 10, 'https://acdn.mitiendanube.com/stores/002/859/419/products/711-dbaf477ab8153f470516856696935776-1024-1024.webp'),
	(11, 'Tênis Adidas Samba', 'Tênis inspirado no modelo Adidas Samba', 389, '42', 'SAPATO', 'U', 10, 'https://acdn.mitiendanube.com/stores/002/859/419/products/2-31-66132b4dc4a901b55b16851164961886-1024-1024.webp'),
	(12, 'Cropped Baby Tee', 'Cropped em modelagem baby tee, com logo frontal', 150, 'G', 'ROUPA', 'F', 10, 'https://acdn.mitiendanube.com/stores/002/859/419/products/21-f5340cd1e45e58488317017297071993-1024-1024.webp'),
	(17, 'Bolsa Diesel', 'Bolsa Diesel', 222, 'Único', 'ACESSÓRIO', 'U', 10, 'https://acdn.mitiendanube.com/stores/002/859/419/products/46-fd9a5280591adb55ed17169125618721-480-0.webp'),
	(18, 'Tênis 00s Campus', 'Tênis Adidas Campus 00s', 699, 'M', 'SAPATO', 'U', 123, 'https://acdn.mitiendanube.com/stores/002/859/419/products/7-3e5c34e8a59c595ebe17052503687982-1024-1024.webp');

-- Copiando estrutura para tabela projetojava.produto_tamanhos
CREATE TABLE IF NOT EXISTS `produto_tamanhos` (
  `CD_TAMANHO` int(11) NOT NULL AUTO_INCREMENT,
  `CD_PRODUTO` int(11) NOT NULL,
  `DS_TAMANHO` varchar(10) NOT NULL,
  PRIMARY KEY (`CD_TAMANHO`),
  KEY `CD_PRODUTO` (`CD_PRODUTO`),
  CONSTRAINT `produto_tamanhos_ibfk_1` FOREIGN KEY (`CD_PRODUTO`) REFERENCES `produto` (`CD_PRODUTO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela projetojava.produto_tamanhos: ~68 rows (aproximadamente)
DELETE FROM `produto_tamanhos`;
INSERT INTO `produto_tamanhos` (`CD_TAMANHO`, `CD_PRODUTO`, `DS_TAMANHO`) VALUES
	(1, 2, 'PP'),
	(2, 2, 'P'),
	(3, 2, 'M'),
	(4, 2, 'G'),
	(5, 2, 'GG'),
	(6, 3, 'PP'),
	(7, 3, 'P'),
	(8, 3, 'M'),
	(9, 3, 'G'),
	(10, 3, 'GG'),
	(11, 4, '34'),
	(12, 4, '35'),
	(13, 4, '36'),
	(14, 4, '37'),
	(15, 4, '38'),
	(16, 4, '39'),
	(17, 4, '40'),
	(18, 4, '41'),
	(19, 4, '42'),
	(20, 5, 'PP'),
	(21, 5, 'P'),
	(22, 5, 'M'),
	(23, 5, 'G'),
	(24, 5, 'GG'),
	(25, 7, 'PP'),
	(26, 7, 'P'),
	(27, 7, 'M'),
	(28, 7, 'G'),
	(29, 7, 'GG'),
	(30, 8, 'PP'),
	(31, 8, 'P'),
	(32, 8, 'M'),
	(33, 8, 'G'),
	(34, 8, 'GG'),
	(35, 9, 'PP'),
	(36, 9, 'P'),
	(37, 9, 'M'),
	(38, 9, 'G'),
	(39, 9, 'GG'),
	(40, 10, 'PP'),
	(41, 10, 'P'),
	(42, 10, 'M'),
	(43, 10, 'G'),
	(44, 10, 'GG'),
	(45, 11, '34'),
	(46, 11, '35'),
	(47, 11, '36'),
	(48, 11, '37'),
	(49, 11, '38'),
	(50, 11, '39'),
	(51, 11, '40'),
	(52, 11, '41'),
	(53, 11, '42'),
	(54, 12, 'PP'),
	(55, 12, 'P'),
	(56, 12, 'M'),
	(57, 12, 'G'),
	(58, 12, 'GG'),
	(59, 17, 'Único'),
	(60, 18, '34'),
	(61, 18, '35'),
	(62, 18, '36'),
	(63, 18, '37'),
	(64, 18, '38'),
	(65, 18, '39'),
	(66, 18, '40'),
	(67, 18, '41'),
	(68, 18, '42');

-- Copiando estrutura para tabela projetojava.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `CD_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `DS_NOME` varchar(50) NOT NULL,
  `DS_EMAIL` varchar(50) NOT NULL,
  `DS_SENHA` varchar(50) NOT NULL,
  `ST_ADMINISTRADOR` char(1) DEFAULT NULL,
  PRIMARY KEY (`CD_USUARIO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela projetojava.usuario: ~3 rows (aproximadamente)
DELETE FROM `usuario`;
INSERT INTO `usuario` (`CD_USUARIO`, `DS_NOME`, `DS_EMAIL`, `DS_SENHA`, `ST_ADMINISTRADOR`) VALUES
	(11, 'Vinicius Woicikieviz', 'vi@admin.com', 'admin!@#', 'Y'),
	(19, 'adm', 'adm', 'adm', 'Y'),
	(20, 'Mariane Curi', 'mariane.curi@fatec.sp.gov.br', '12345', 'N');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
