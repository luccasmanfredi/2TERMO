DROP DATABASE IF EXISTS SMARTCOFFEE_DML_LUCCAS;

CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_DML_LUCCAS;

USE SMARTCOFFEE_DML_LUCCAS;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(15),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);

-- INSERINDO DADOS NO BD

INSERT INTO cliente(nome,email,telefone,cidade,ativo) VALUES 
('Arthur Nunes', 'arthur@email.com', '1999999901', 'Rondonia', TRUE),
('Beatriz Raissa', 'beatriz@email.com', '1999999902', 'Limeira', TRUE),
('Dandara Dias', 'dandara@email.com', '1999999903', 'Limeira', TRUE),
('Davi Ferreira', 'davi@email.com',NULL, 'Limeira', TRUE),
('Felipe Rodrigues', 'felipe@email.com',NULL, 'Limeira', TRUE),
('Franscisco Magri', 'franscisco@email.com','1999999904', 'Limeira', TRUE),
('Franz Kramer', 'franz@email.com','1999999905', 'Limeira', TRUE),
('Gabriel Nogueira', 'gabriel@email.com','1999999906', 'Limeira', TRUE),
('Gabrielli Araujo', 'gabrielli@email.com','1999999907', 'Americana', TRUE),
('Isabella Alves', 'isabella@email.com',NULL,'Limeira', TRUE),
('Keynan Santos', 'keynan@email.com','1999999908','Santos', TRUE),
('Larissa Ramires', 'larissa@email.com','1999999909','Limeira', TRUE),
('Leonardo Dias', 'leonardo@email.com','1999999910','Valinhos', TRUE),
('Luana Lima', 'luana@email.com','1999999911','Limeira', TRUE),
('Luccas Manfredi', 'luccas@email.com','1999999912','Campinas', TRUE),
('Livia Stein', 'livia@email.com','1999999913','Limeira', TRUE);

INSERT INTO categoria (nome) VALUES
('Cafes'),
('Bebidas Geladas'),
('Bebidas Quentes'),
('Salgados'),
('Sobremesas'),
('Combo');

-- VERIFICAR ÚLTIMO INSERT REALIZADO OU FEITO
INSERT INTO categoria (nome) VALUES
('Doces');

SET @categoria = LAST_INSERT_ID();

SELECT @categoria;
-- ------------------------------------

-- ATUALIZANDO OU MODIFICANDO DADOS NO BD
-- LEMBRAR DE SEMPRE EXECUTAR O SELECT PARA ATUALIZAR (UPDATE)
-- NUNCA JAMAIS NEVER FAÇA UM UPDATE SEM WHERE 😤

-- EX 1: MODIFICANDO VALORES INDIVIDUAIS
UPDATE cliente
SET telefone = '1988880001'
WHERE id_cliente = 10;

UPDATE cliente
SET telefone = '000000000'

-- EX 2 MODIIFCANDO VÁRIOS VALORES

UPDATE cliente
SET telefone = '1999999901',
    cidade = 'Piracicaba'
WHERE id_cliente = 10;

-- APAGAR DADOS DA TABELA NO BD
DELETE FROM cliente
WHERE id_cliente = 9;



SELECT * FROM cliente;

SELECT * FROM categoria;