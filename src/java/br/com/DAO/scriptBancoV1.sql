

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `zima`
--
DROP DATABASE ZIMA;
CREATE DATABASE ZIMA;
USE ZIMA;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--
CREATE TABLE `usuario` (
  `codigo` int(11) NOT NULL PRIMARY KEY auto_increment,
  `tipo` int(1) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `senha` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `cartao` (
  `cod_usuario` int(11) NOT NULL primary key auto_increment,
  `numero` varchar(16) NOT NULL,
  `titular` varchar(50) NOT NULL,
  `dataValidade` DATE NOT NULL,
  `cvv` varchar(3) NOT NULL,
  FOREIGN KEY(cod_usuario) REFERENCES usuario(codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `cod_usuario` int(11) NOT NULL primary key auto_increment,
  `cep` varchar(10) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `pRef` text DEFAULT NULL,
  FOREIGN KEY(cod_usuario) REFERENCES usuario(codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pedido` (
  `codigo` int(11) NOT NULL primary key auto_increment,
  `valor` float NOT NULL,
  `data` date DEFAULT NULL,
  `cep_entrega` varchar(10) NOT NULL,
  `bairro_entrega` varchar(50) NOT NULL,
  `rua_entrega` varchar(50) NOT NULL,
  `numero_entrega` varchar(50) NOT NULL,
  `pRef_entrega` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `itens_pedido`(
	`id_item` int(11) not null,
	`cod_pedido`int(11) primary key auto_increment not null,
    `cod_produto`int(11) not null,
    `qtde` int(3) not null,
    FOREIGN KEY(cod_pedido) REFERENCES pedido(codigo)
)ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `pagamento` (
  `codigo` int(11) NOT NULL,
  `cod_pedido` int(11) primary key auto_increment,
  `forma` int(1) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  FOREIGN KEY(cod_pedido) REFERENCES pedido(codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--


CREATE TABLE `produto` (
  `codigo` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `preco` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
