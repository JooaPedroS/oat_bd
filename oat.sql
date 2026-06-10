-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.4.3 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para oataaa
CREATE DATABASE IF NOT EXISTS `oataaa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oataaa`;

-- Copiando estrutura para tabela oataaa.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `cod_cliente` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `telefone` varchar(50) DEFAULT '0',
  `email` varchar(255) DEFAULT '0',
  PRIMARY KEY (`cod_cliente`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela oataaa.cliente: ~1 rows (aproximadamente)
INSERT INTO `cliente` (`cod_cliente`, `nome`, `telefone`, `email`) VALUES
	(1, 'Fulano de Tal', '"77955430676"', '"fulano@email.com"');

-- Copiando estrutura para tabela oataaa.comissao
CREATE TABLE IF NOT EXISTS `comissao` (
  `cod_comissao` int unsigned NOT NULL AUTO_INCREMENT,
  `valor_liquido` double unsigned NOT NULL DEFAULT (0),
  `cod_venda` int unsigned NOT NULL DEFAULT (0),
  `matricula_vendedor` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_comissao`) USING BTREE,
  KEY `cod_venda` (`cod_venda`),
  KEY `matricula_vendedor` (`matricula_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela oataaa.comissao: ~1 rows (aproximadamente)
INSERT INTO `comissao` (`cod_comissao`, `valor_liquido`, `cod_venda`, `matricula_vendedor`) VALUES
	(1, 100, 1, '"2026045"');

-- Copiando estrutura para tabela oataaa.fornecedor
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `cod_fornecedor` int unsigned NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `empresa` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cod_fornecedor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela oataaa.fornecedor: ~1 rows (aproximadamente)
INSERT INTO `fornecedor` (`cod_fornecedor`, `cnpj`, `empresa`, `nome`, `telefone`, `email`) VALUES
	(1, '"82831366000177"', '"Empresa Fazedora de Coisas LTDA"', '"emrpesinha"', '"779940675891"', '"empresinha@email.com"');

-- Copiando estrutura para tabela oataaa.item_venda_servico
CREATE TABLE IF NOT EXISTS `item_venda_servico` (
  `cod_venda_servico` int unsigned NOT NULL AUTO_INCREMENT,
  `cod_servico` int NOT NULL DEFAULT '0',
  `cod_unitario` int NOT NULL DEFAULT '0',
  `cod_venda` int NOT NULL,
  PRIMARY KEY (`cod_venda_servico`) USING BTREE,
  KEY `cod_venda` (`cod_venda`),
  KEY `cod_unitario` (`cod_unitario`),
  KEY `cod_servico` (`cod_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela oataaa.item_venda_servico: ~0 rows (aproximadamente)
INSERT INTO `item_venda_servico` (`cod_venda_servico`, `cod_servico`, `cod_unitario`, `cod_venda`) VALUES
	(1, 1, 1, 1);

-- Copiando estrutura para tabela oataaa.pacote
CREATE TABLE IF NOT EXISTS `pacote` (
  `cod_pacote` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descricao` text,
  PRIMARY KEY (`cod_pacote`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela oataaa.pacote: ~1 rows (aproximadamente)
INSERT INTO `pacote` (`cod_pacote`, `nome`, `descricao`) VALUES
	(1, '"pacote"', '"pacote bem legal!!!"');

-- Copiando estrutura para tabela oataaa.pacote_servico
CREATE TABLE IF NOT EXISTS `pacote_servico` (
  `cod_pacote_servico` int unsigned NOT NULL AUTO_INCREMENT,
  `descricao` text,
  `categoria` varchar(50) DEFAULT NULL,
  `cod_fornecedor` int NOT NULL,
  PRIMARY KEY (`cod_pacote_servico`) USING BTREE,
  KEY `cod_fornecedor` (`cod_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela oataaa.pacote_servico: ~1 rows (aproximadamente)
INSERT INTO `pacote_servico` (`cod_pacote_servico`, `descricao`, `categoria`, `cod_fornecedor`) VALUES
	(1, '"Ligamento com o pacote com o serviço"', '"categoria Legal"', 1);

-- Copiando estrutura para tabela oataaa.pagamento_fornecedor
CREATE TABLE IF NOT EXISTS `pagamento_fornecedor` (
  `cod_pagamento` int unsigned NOT NULL AUTO_INCREMENT,
  `valor_custo` double NOT NULL,
  `data_limite` timestamp NULL DEFAULT NULL,
  `cod_fornecedor` int DEFAULT NULL,
  `cod_venda` int DEFAULT NULL,
  PRIMARY KEY (`cod_pagamento`) USING BTREE,
  KEY `cod_fornecedor` (`cod_fornecedor`),
  KEY `cod_venda` (`cod_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela oataaa.pagamento_fornecedor: ~1 rows (aproximadamente)
INSERT INTO `pagamento_fornecedor` (`cod_pagamento`, `valor_custo`, `data_limite`, `cod_fornecedor`, `cod_venda`) VALUES
	(1, 1000, '2026-06-10 01:37:20', 1, 1);

-- Copiando estrutura para tabela oataaa.recebimento_cliente
CREATE TABLE IF NOT EXISTS `recebimento_cliente` (
  `cod_recebimento_cliente` int unsigned NOT NULL AUTO_INCREMENT,
  `valor_total` double NOT NULL DEFAULT (0),
  `forma_pagamento` varchar(50) NOT NULL DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `cod_venda` int NOT NULL,
  PRIMARY KEY (`cod_recebimento_cliente`) USING BTREE,
  KEY `cod_venda` (`cod_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela oataaa.recebimento_cliente: ~1 rows (aproximadamente)
INSERT INTO `recebimento_cliente` (`cod_recebimento_cliente`, `valor_total`, `forma_pagamento`, `status`, `cod_venda`) VALUES
	(1, 100, '"pix"', '"efetuada"', 1);

-- Copiando estrutura para tabela oataaa.servico
CREATE TABLE IF NOT EXISTS `servico` (
  `cod_servico` int unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cod_fornecedor` int NOT NULL,
  PRIMARY KEY (`cod_servico`) USING BTREE,
  KEY `cod_fornecedor` (`cod_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela oataaa.servico: ~0 rows (aproximadamente)
INSERT INTO `servico` (`cod_servico`, `categoria`, `descricao`, `cod_fornecedor`) VALUES
	(1, '"categoria legal"', '"uau que serviço maneiro!!!"', 1);

-- Copiando estrutura para tabela oataaa.venda
CREATE TABLE IF NOT EXISTS `venda` (
  `cod_venda` int unsigned NOT NULL AUTO_INCREMENT,
  `data_venda` timestamp NOT NULL,
  `valor_total` double NOT NULL DEFAULT '0',
  `matricula_vendedor` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `cod_cliente` int NOT NULL,
  PRIMARY KEY (`cod_venda`) USING BTREE,
  KEY `cod_cliente` (`cod_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela oataaa.venda: ~0 rows (aproximadamente)
INSERT INTO `venda` (`cod_venda`, `data_venda`, `valor_total`, `matricula_vendedor`, `cod_cliente`) VALUES
	(1, '2026-06-10 01:38:33', 100, '2026046', 1);

-- Copiando estrutura para tabela oataaa.vendedor
CREATE TABLE IF NOT EXISTS `vendedor` (
  `matricula_vendedor` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`matricula_vendedor`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela oataaa.vendedor: ~1 rows (aproximadamente)
INSERT INTO `vendedor` (`matricula_vendedor`, `nome`) VALUES
	('"2026045"', '"Vendedor Bacanão"');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
