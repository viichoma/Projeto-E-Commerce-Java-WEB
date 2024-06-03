-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
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

-- Copiando dados para a tabela projetojava.item_pedido: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela projetojava.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `CD_PEDIDO` int(11) NOT NULL,
  `CD_USUARIO` int(11) NOT NULL,
  `VL_TOTAL` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`CD_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela projetojava.pedido: ~0 rows (aproximadamente)

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
  `DS_IMG` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CD_PRODUTO`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela projetojava.produto: ~11 rows (aproximadamente)
INSERT INTO `produto` (`CD_PRODUTO`, `DS_NOME`, `DS_PRODUTO`, `VL_PRECO`, `DS_TAMANHO`, `DS_CATEGORIA`, `DS_GENERO`, `QT_QUANTIDADE`, `DS_IMG`) VALUES
	(2, 'Jaqueta Ferrari', 'Jaqueta de corrida Ferrari feita de couro sintétic', 500, 'M', 'ROUPA', 'M', 10, 'FERRARI-JACKET.webp'),
	(3, 'Calça parachute Nike', 'Calça do estilo parachute da Nike', 200, 'M', 'ROUPA', 'F', 10, 'NIKE-PARACHUTE-PANTS.webp'),
	(4, 'tênis nike Air max plus tn', 'tênis inspirado em modelo air max plus TN "triple ', 300, '40', 'SAPATO', 'U', 10, 'NIKE-AIR-MAX+.webp'),
	(5, 'jaqueta moletom spiderman', 'jaqueta em tecido de moletom e capuz, com estampa ', 219, 'M', 'ROUPA', 'U', 10, 'HOMEM-ARANHA.webp'),
	(6, 'Calça Hello Kitty', 'Calça Hello Kitty kawai', 70, 'M', 'ROUPA', 'U', 10, 'CALCA HELLO KITTY.jpg'),
	(7, 'Body streetwear', 'body em modelagem cut-out com mangas estilo luvas,', 129, 'M', 'ROUPA', 'F', 10, 'BODY STREETWEAR.webp'),
	(8, 'body manga longa nike branco', 'body com manga longa e zíper frontal, com detalhe ', 130, 'M', 'ROUPA', 'F', 10, 'BODY MANGA LONGA NIKE BRANCO.webp'),
	(9, 'body manga longa nike', 'body com manga longa e zíper frontal, com detalhe ', 130, 'M', 'ROUPA', 'F', 10, 'BODY MANGA LONGA NIKE PRETO.webp'),
	(10, 'Camiseta Vintage 90\'s eminem', 'camiseta em modelagem reta, inspirada em peças y2k', 150, 'G', 'ROUPA', 'U', 10, 'CAMISETA VINTAGE 90\'S EMINEM.webp'),
	(11, 'Tênis adidas samba', 'tênis inspirado no modelo adidas samba.', 389, '42', 'SAPATO', 'U', 10, 'TENIS ADIDAS SAMBA.webp'),
	(12, 'Cropped baby tee', 'cropped em modelagem baby tee, com logo frontal da', 150, 'G', 'ROUPA', 'F', 10, 'CROPPPED-BABY-TEE-NIKE.webp');

-- Copiando estrutura para tabela projetojava.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `CD_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `DS_NOME` varchar(50) NOT NULL,
  `DS_EMAIL` varchar(50) NOT NULL,
  `DS_SENHA` varchar(50) NOT NULL,
  PRIMARY KEY (`CD_USUARIO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela projetojava.usuario: ~3 rows (aproximadamente)
INSERT INTO `usuario` (`CD_USUARIO`, `DS_NOME`, `DS_EMAIL`, `DS_SENHA`) VALUES
	(7, 'vi', 'vi', 'vi'),
	(8, 'Vinicius Woicikieviz Choma', 'vinicius.choma@outlook.com', '123'),
	(9, 'Vinicius Woicikieviz', 'vi@admin.com', 'vi@admin!@');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
