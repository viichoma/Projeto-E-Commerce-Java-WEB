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

-- Copiando dados para a tabela projetojava.item_pedido: ~0 rows (aproximadamente)

-- Copiando dados para a tabela projetojava.pedido: ~0 rows (aproximadamente)

-- Copiando dados para a tabela projetojava.produto: ~1 rows (aproximadamente)
INSERT INTO `produto` (`CD_PRODUTO`, `DS_NOME`, `DS_PRODUTO`, `VL_PRECO`, `DS_TAMANHO`, `DS_CATEGORIA`, `DS_GENERO`, `QT_QUANTIDADE`, `DS_IMG`) VALUES
	(2, 'Jaqueta Ferrari', 'Jaqueta de corrida Ferrari feita de couro sintétic', 500, 'M', 'ROUPA', 'M', 10, 'FERRARI-JACKET.webp');

-- Copiando dados para a tabela projetojava.usuario: ~3 rows (aproximadamente)
INSERT INTO `usuario` (`CD_USUARIO`, `DS_NOME`, `DS_EMAIL`, `DS_SENHA`) VALUES
	(6, 'Vinicius', 'vinicius@outlook.com', 'vi123'),
	(7, 'vi', 'vi', 'vi'),
	(8, 'Vinicius Woicikieviz Choma', 'vinicius.choma@outlook.com', '123');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
