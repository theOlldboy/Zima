CREATE DATABASE ProjetoZIMA;
USE ProjetoZIMA;

DROP TABLE Endereco_Cliente;
DROP TABLE Cartao_Cliente;
DROP TABLE Usuario;


CREATE TABLE Usuario (
	`id_cliente` int primary key auto_increment,
    `nome_cliente` varchar(60),
    `email_cliente` varchar(60),
    `cpf_cliente` varchar(11),
    `senha` varchar(12) not null,
    `telefone_cliente` varchar(20),
    `tipo_usuario` int(1) not null
)Engine = InnoDB;

CREATE TABLE Endereco_Cliente(
    `id_cliente` int primary key auto_increment,
    `cep` varchar(8) not null,
    `rua` varchar(40) not null,
    `bairro` varchar(60) not null,
    `cidade` varchar(30) not null,
    `UF` varchar(2) not null,
    `numero` varchar(20) not null,
    `complemento` varchar(50) not null,
    `pontoReferencia` varchar(40) not null,
    FOREIGN KEY(`id_cliente`) REFERENCES Usuario(`id_cliente`)
)Engine = InnoDB;

CREATE TABLE Cartao_Cliente(
    `id_cliente` int primary key auto_increment,
    `titular_cartao` varchar(50) not null,
    `numero_cartao` varchar(16) not null,
    `codigo_verificacao` int(3) not null,
    `data_validade` date,
    FOREIGN KEY(`id_cliente`) REFERENCES Usuario(`id_cliente`)
)Engine = InnoDB;

SELECT * FROM Cartao_Cliente;