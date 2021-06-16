-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Jun-2021 às 01:26
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


DROP DATABASE ZIMA;
CREATE DATABASE ZIMA;
USE ZIMA;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `zima`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao`
--

CREATE TABLE `cartao` (
  `cod_usuario` int(11) NOT NULL,
  `numero` varchar(16) NOT NULL,
  `titular` varchar(50) NOT NULL,
  `dataValidade` date NOT NULL,
  `cvv` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cartao`
--

INSERT INTO `cartao` (`cod_usuario`, `numero`, `titular`, `dataValidade`, `cvv`) VALUES
(1, '645456756756', 'Joao otavio Lima F', '2021-06-29', '456');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `cod_usuario` int(11) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `pRef` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`cod_usuario`, `cep`, `cidade`, `uf`, `bairro`, `rua`, `numero`, `complemento`, `pRef`) VALUES
(1, '72010030', 'BrasÃ­lia', 'DF', 'Taguatinga Centro (Taguatinga)', 'C 3', 6, 'bla bla bla bla bal bla', 'AAAAAAAAAAAAAAAAh'),
(2, '16075690', 'AraÃ§atuba', 'SP', 'Conjunto Habitacional Manoel Pires', 'Rua A', 2, 'hfghfghhj hgfjghjg ghj', 'jhgjghjgh ghjghj jjjj');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_pedido`
--

CREATE TABLE `itens_pedido` (
  `id` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `cod_pedido` int(11) NOT NULL,
  `cod_produto` int(11) NOT NULL,
  `qtde` int(3) NOT NULL,
  `tipo_bebida` varchar(10) NOT NULL,
  `qtde_bebida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `codigo` int(11) NOT NULL,
  `cod_pedido` int(11) DEFAULT NULL,
  `forma` varchar(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `usuario` (
  `codigo` int(11) NOT NULL,
  `tipo` int(1) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `senha` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `pedido` (
  `codigo` int(11) NOT NULL,
  `cod_cli` int(11) NOT NULL,
  `valor` float DEFAULT NULL,
  `data` date DEFAULT NULL,
  `cep_entrega` varchar(10) DEFAULT NULL,
  `bairro_entrega` varchar(50) DEFAULT NULL,
  `rua_entrega` varchar(50) DEFAULT NULL,
  `numero_entrega` varchar(50) DEFAULT NULL,
  `pRef_entrega` varchar(50) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `local` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `codigo` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `img` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`codigo`, `titulo`, `descricao`, `preco`, `img`) VALUES
(2, 'Sanduíche 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum ', 14.99, 'sanduiche1.jpg'),
(3, 'Sanduíche 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum ', 15.99, 'sanduiche2.jpg'),
(4, 'Sanduíche 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum ', 16.99, 'sanduiche3.jpg'),
(5, 'Sanduíche 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum ', 17.99, 'sanduiche4.jpg'),
(6, 'Sanduíche 5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum ', 18.99, 'sanduiche5.jpg'),
(7, 'Sanduíche 6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed rutrum ', 19.99, 'sanduiche6.jpg\r\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `codigo` int(11) NOT NULL,
  `tipo` int(1) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `senha` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`codigo`, `tipo`, `nome`, `cpf`, `senha`, `email`, `telefone`) VALUES
(1, 0, 'JoÃ£o OtÃ¡vio Lima Felipelli', '07029717155', '123456', 'joaolima.felipelli@gmail.com', '611999141797'),
(2, 0, 'Lulindo', '55555555555', '212330', 'lulindo@gmail.com', '61999156641');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cartao`
--
ALTER TABLE `cartao`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- Índices para tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itens_pedido_ibfk_1` (`cod_pedido`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `pagamento_ibfk_1` (`cod_pedido`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `pedido_ibfk_1` (`cod_cli`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cartao`
--
ALTER TABLE `cartao`
  MODIFY `cod_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `cod_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cartao`
--
ALTER TABLE `cartao`
  ADD CONSTRAINT `cartao_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`);

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`);

--
-- Limitadores para a tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`cod_pedido`) REFERENCES `pedido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`cod_pedido`) REFERENCES `pedido` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;


SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE pedido;
TRUNCATE itens_pedido;
TRUNCATE usuario;
TRUNCATE endereco;
TRUNCATE cartao;
TRUNCATE pagamento;

SET FOREIGN_KEY_CHECKS = 1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
