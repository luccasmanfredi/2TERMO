-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Luccas Manfredi
-- Turma: 1DEVIS Data: 02/10/2026
-- Base: smartcoffee_dml
-- ============================================================

DROP DATABASE IF EXISTS SMARTCOFFEE_Desafio_DML;
CREATE DATABASE SMARTCOFFEE_Desafio_DML;
USE SMARTCOFFEE_Desafio_DML;

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

INSERT INTO categoria (nome) VALUES
('Cafes'),
('Bebidas Geladas'),
('Bebidas Quentes'),
('Salgados'),
('Sobremesas'),
('Combo');

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Francisco Magri', 'Chico@email.com', '19999999901', 'Piracicaba', TRUE),
('Luccas Manfredi', 'Luccas@email.com', '19999999902', 'Limeira', TRUE);

-- 2. Cadastre a categoria 'Especiais da Casa'.

INSERT INTO categoria (nome) VALUES
('Especiais da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.

SELECT id_categoria
FROM categoria
WHERE nome = 'Especiais da Casa';

SET @categoria_especiais = (
    SELECT id_categoria
    FROM categoria
    WHERE nome = 'Especiais da Casa'
);

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café Especial da Casa', 18.00, TRUE, @categoria_especiais),
('Capuccino Especial', 22.00, TRUE, @categoria_especiais),
('Torta de Chocolate', 16.00, TRUE, @categoria_especiais);

-- 4. Cadastre um terceiro cliente sem telefone.

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Gabriel Travaglini', 'Gabriel@email.com', NULL, 'Limeira', TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados.

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, 2);

SET @pedido_atividade = LAST_INSERT_ID();

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.

SET @pedido_atividade = (
    SELECT id_pedido
    FROM pedido
    WHERE id_cliente = 2
    ORDER BY id_pedido DESC
    LIMIT 1
);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_atividade, 1, 1, 18.00),
(@pedido_atividade, 2, 1, 22.00);

SELECT * FROM item_pedido
WHERE id_pedido = @pedido_atividade;


-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
SELECT * FROM cliente
WHERE email = 'Chico@email.com';

-- UPDATE:
UPDATE cliente
SET telefone = '19988887777'
WHERE email = 'Chico@email.com';

-- SELECT final:
SELECT * FROM cliente
WHERE email = 'Chico@email.com';


-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
SELECT * FROM cliente
WHERE email = 'Luccas@email.com';

UPDATE cliente
SET cidade = 'Campinas',
    telefone = '19988886666'
WHERE email = 'Luccas@email.com';

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
SELECT produto
FROM produto
JOIN categoria ON produto.id_categoria = categoria.id_categoria
WHERE categoria.nome = 'Especiais da Casa';

UPDATE produto
SET preco = preco * 1.08
WHERE id_categoria = (
    SELECT id_categoria
    FROM categoria
    WHERE nome = 'Especiais da Casa'
);


-- 10. Altere o status do pedido criado para 'PREPARANDO'.

SELECT * FROM pedido
WHERE id_pedido = @pedido_atividade;

UPDATE pedido
SET status_pedido = 'PREPARANDO'
WHERE id_pedido = @pedido_atividade;


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).

SELECT (quantidade * preco_unitario) AS valor_total
FROM item_pedido
WHERE id_pedido = @pedido_atividade;

UPDATE pedido
SET valor_total = (
    SELECT SUM(quantidade * preco_unitario)
    FROM item_pedido
    WHERE id_pedido = @pedido_atividade
)
WHERE id_pedido = @pedido_atividade;

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).

SELECT * FROM produto
WHERE nome = 'Café Especial da Casa';

UPDATE produto
SET ativo = FALSE
WHERE nome = 'Café Especial da Casa';

-- PARTE C - DELETE


-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.

INSERT INTO cliente (nome, email, cidade, ativo) VALUES
('Chico Teste', 'chico.teste@email.com', 'Limeira', TRUE);

SELECT * FROM cliente
WHERE email = 'chico.teste@email.com';

DELETE FROM cliente
WHERE email = 'chico.teste@email.com';

-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
SELECT * FROM cliente
WHERE id_cliente = 2;

-- DELETE FROM cliente WHERE id_cliente = 2;

-- Resultado observado: a exclusão é bloqueada porque existe um pedido
-- associado ao cliente na tabela pedido.
-- ---------------------------------------------------------------------------

-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta: A chave estrangeira impede excluir o cliente enquanto houver
-- pedidos associados a ele.


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.

INSERT INTO categoria (nome) VALUES
('Excluir Depois');

SELECT * FROM categoria
WHERE nome = 'Excluir Depois';

DELETE FROM categoria
WHERE nome = 'Excluir Depois';
