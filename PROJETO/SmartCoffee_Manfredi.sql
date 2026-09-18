CREATE DATABASE Projeto_SmartCoffee_Manfredi;

USE Projeto_SmartCoffee_Manfredi;

CREATE TABLE Funcionario (
    ID_FUNCIONARIO INT AUTO_INCREMENT PRIMARY KEY,
    Data_Admissao DATE NOT NULL,
    Salario DECIMAL(10,2),
    CPF CHAR(14) NOT NULL UNIQUE,
    Nome VARCHAR(60) NOT NULL,
    Cargo VARCHAR(20) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Escolaridade VARCHAR(30)
);

CREATE TABLE Estoque_Ficha_Tecnica (
    ID_ESTOQUE INT AUTO_INCREMENT PRIMARY KEY,
    kg DECIMAL(10,2),
    ml DECIMAL(10,2),
    un INT,
    Quantidade_Max INT,
    Quantidade_Min INT,
    Localizacao VARCHAR(100),
    Validade DATE NOT NULL,
    Saida_Produto INT,
    Entrada_Produto INT,
    Quantidade_Atual INT,
    Nome_Estoque VARCHAR(100) NOT NULL,
    Quantidade_Gasta DECIMAL(10,2) NOT NULL
);

CREATE TABLE Clientes (
    ID_CLIENTE INT AUTO_INCREMENT PRIMARY KEY,
    CEP VARCHAR(9) NOT NULL,
    CPF CHAR(14) NOT NULL UNIQUE,
    Nome_Cliente VARCHAR(60) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE Prog_Fidelidade (
    ID_FIDELIDADE INT AUTO_INCREMENT PRIMARY KEY,
    ID_CLIENTE INT NOT NULL,
    CPF CHAR(14) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL,
    Nome VARCHAR(60) NOT NULL,
    Pontos INT,
    Telefone VARCHAR(15),
    Data_Ultima_Atualizacao DATE,
    FOREIGN KEY (ID_CLIENTE) REFERENCES Clientes(ID_CLIENTE)
);

CREATE TABLE Delivery (
    ID_DELIVERY INT AUTO_INCREMENT PRIMARY KEY,
    Frete VARCHAR(10) NOT NULL,
    Valor DECIMAL(10,2),
    Taxa DECIMAL(10,2),
    CEP_Cliente VARCHAR(9) NOT NULL,
    Avaliacao_Entregador DECIMAL(2,1) NOT NULL,
    Avaliacao_Cliente DECIMAL(2,1) NOT NULL,
    Endereco_Entrega VARCHAR(200) NOT NULL,
    Status_Entrega VARCHAR(30),
    Data_Hora_Saida DATETIME NOT NULL,
    Nome_Entregador VARCHAR(60) NOT NULL
);

CREATE TABLE Produtos (
    ID_PRODUTO INT AUTO_INCREMENT PRIMARY KEY,
    ID_ESTOQUE INT,
    Peso DECIMAL(10,2) NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Descricao VARCHAR(255),
    Cor VARCHAR(30) NOT NULL,
    Marca VARCHAR(50),
    Quantidade INT,
    Validade DATE NOT NULL,
    Nome_Produto VARCHAR(100) NOT NULL,
    Preco_Unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_ESTOQUE) REFERENCES Estoque_Ficha_Tecnica(ID_ESTOQUE)
);