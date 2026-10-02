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
--  ---------------------------------------------------------------------------------------------------
CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status_pedido ENUM('ABERTO', 'PREPARANDO', 'FINALIZADO', 'CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(150),
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);

CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_pagamento_forma_pagamento FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento (id_forma_pagamento)
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

INSERT INTO produto (nome,preco,ativo,id_categoria) VALUES
('Café Tradicional',7.00, TRUE,1),
('Café com Leite Gelado',6.00, TRUE,2),
('Chocolate Quente',9.00, TRUE,3),
('Coxinha',8.00, TRUE,4),
('Kit-Kat',3.00, TRUE,5);

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
('2026-10-02 08:16:00', 'ABERTO', 0.00, 1),
(NOW(), 'PREPARANDO', 1.00, 2),
(NOW(), 'FINALIZADO', 2.00, 3),
(NOW(), 'CANCELADO', 3.00, 4),
('2026-10-02 08:22:00', 'ABERTO', 4.00, 5);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(1, 1, 10, 7.00, 'Sem Açúcar'),
(2, 2, 20, 6.00, 'Com Açúcar'),
(3, 3, 30, 9.00, 'Com Chantilly'),
(4, 4, 40, 8.00, 'Com Requeijão'),
(5, 5, 50, 3.00, 'Chocolate Preto');

INSERT INTO forma_pagamento (id_forma_pagamento, descricao) VALUES
(1, 'Crédito'),
(2, 'Débito'),
(3, 'Pix');

INSERT INTO pagamento (id_pagamento, id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES 
(1, 1, 1, 0.00, NOW()),
(2, 2, 2, 1.00, NOW()),
(3, 3, 3, 2.00, NOW()),
(4, 4, 2, 3.00, NOW()),
(5, 5, 3, 4.00, NOW());

-- VERIFICAR ÚLTIMO INSERT REALIZADO OU FEITO
INSERT INTO categoria (nome) VALUES
('Doces');

SET @categoria = LAST_INSERT_ID();

SELECT @categoria;
-- ------------------------------------

-- ATRIBUIR NOMES AOS IDS 

INSERT INTO categoria (nome) VALUES
('Combos Extras');

SET @categorias_novas = (SELECT nome FROM categoria WHERE nome = 'Combos Extras');

-- ATUALIZANDO OU MODIFICANDO DADOS NO BD
-- LEMBRAR DE SEMPRE EXECUTAR O SELECT PARA ATUALIZAR (UPDATE)
-- NUNCA JAMAIS NEVER FAÇA UM UPDATE SEM WHERE 😤

-- EX 1: MODIFICANDO VALORES INDIVIDUAIS
UPDATE cliente
SET telefone = '1988880001'
WHERE id_cliente = 10;

UPDATE cliente
SET telefone = '000000000'
WHERE id_cliente = 10;

-- EX 2 MODIFICANDO VÁRIOS VALORES
UPDATE cliente
SET telefone = '1999999901',
    cidade = 'Piracicaba'
WHERE id_cliente = 10;

-- APAGAR DADOS DA TABELA NO BD
DELETE FROM cliente
WHERE id_cliente = 9;

-- CONSULTAR DADOS NO BD

SELECT * FROM cliente WHERE id_cliente = 9;
SELECT * FROM categoria;
SELECT * FROM pedido;
SELECT * FROM produto;
SELECT * FROM pagamento;

-- PROCEDIMENTO DE UMA COMPRA
-- PASSO 1: REALIZAR CADASTRO CLIENTE

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Carlos Silva', 'carlossilva3@email.com', '19999999999', 'Santos', TRUE);

SET @cliente_compra = LAST_INSERT_ID();

-- PASSO 2: REALIZAR PEDIDO
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, @cliente_compra);

SET @pedido_compra = LAST_INSERT_ID();

-- PASSO 3: INSERINDO ITENS
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_compra, 4, 1, 13.00),
(@pedido_compra, 5, 1, 9.00);

-- PASSO 4: ATUALIZANDO TOTAL E STATUS
UPDATE pedido
SET valor_total = 22.00,
    status_pedido = 'PREPARANDO'
WHERE id_pedido = @pedido_compra;

-- PASSO 5 - REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido_compra, 2, 22.00, NOW());

-- PASSO 6 - CONSULTAR PEDIDO E RESULTADO
SELECT p.id_pedido,
       c.nome AS Nome_Cliente,
       p.status_pedido AS Status_Pedido,
       p.valor_total AS Compra_Total
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido_compra;

-- PASSO 7 - RELATÓRIO

-- 1

SELECT nome FROM cliente WHERE id_cliente = @cliente_compra;

SELECT nome FROM cliente WHERE id_cliente = 121;

-- 2 

SELECT * FROM pedido WHERE id_pedido = @pedido_compra;

-- TRANSAÇÕES - SEGURANÇA PARA DML

START TRANSACTION

UPDATE produto
SET preco = preco * 2.80
WHERE id_categoria = 1;

SELECT id_produto, nome, preco
FROM produto
WHERE id_categoria = 1;

-- DESFAZ O QUE FIZEMOS DE ERRADO OU VOLTA UMA TRANSAÇÃO
ROOLBACK;

--  VALIDA O PROCEDIMENTO DE TRANSAÇÃO
COMMIT;

START TRANSACTION;

UPDATE cliente SET cidade = 'Santos' WHERE id_cliente = 121;

SELECT * FROM cliente WHERE id_cliente = 121;

COMMIT;
ROOLBACK;