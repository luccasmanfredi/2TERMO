-- Active: 1791543223289@@127.0.0.1@3306@biblioteca_luccas_somativa
-- FASE 1 - DDL: CRIAÇÃO E ESTRUTURA

-- 1. 

DROP DATABASE IF EXISTS biblioteca_luccas_somativa;

CREATE DATABASE biblioteca_luccas_somativa;

USE biblioteca_luccas_somativa;

-- 2.

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE
);

-- 3.

CREATE TABLE Livro (
  id_livro INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL,
  autor VARCHAR(120) NOT NULL,
  isbn CHAR(13) NOT NULL UNIQUE,
  ano_publicacao INT,
  quantidade_disponivel INT DEFAULT 0.00 CHECK (quantidade_disponivel >= 0)
);

-- 4.

CREATE TABLE Emprestimo (
  id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
  data_empresitmo DATETIME DEFAULT CURRENT_TIMESTAMP,
  data_prevista DATE NOT NULL,
  data_devolucao DATE,
  status_emprestimo VARCHAR(20) DEFAULT 'aberto' CHECK (status_emprestimo IN ('aberto', 'fechado')),
  id_usuario INT NOT NULL,
  id_livro INT NOT NULL,
  CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
  CONSTRAINT FK_id_livro FOREIGN KEY (id_livro) REFERENCES Livro (id_livro) 
);

-- FASE 2 - DML: MANIPULAÇÃO DE DADOS

-- 5.

ALTER TABLE LIVRO ADD editora VARCHAR(100);

-- 6.

INSERT INTO Usuario (nome, email, telefone, ativo) VALUES 
('Luccas Manfredi', 'luccas@email.com', '19999999991', TRUE), 
('Gabriel Travaglini', 'Gabriel@email.com', '19999999992', TRUE),
('Francisco Magri', 'Chico@email.com', '19999999993', TRUE),
('Franz Kramer', 'Franz@email.com', NULL, TRUE);

-- 7.

INSERT INTO Livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel) VALUES 
('Dom Quixote', 'Miguel de Cervantes', 1111111111, 1605, 40),
('Duna', 'Frank Herbert', 2222222222, 1965, 120),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 3333333333, 2020, 90),
('Dom Casmurro', 'Machado de Assis', 4444444444, 1899, 14),
('O Alquimista', 'Paulo Coelho', 5555555555, 1988, 22),
('Cem Anos de Solidão', 'Gabriel García Márquez', 6666666666, 2020, 50);

-- 8.

INSERT INTO Emprestimo (data_prevista, data_devolucao, status_emprestimo, id_usuario, id_livro) VALUES 
('2026-06-20', '2026-01-19', 'fechado', 1, 1),
('2026-05-09', '2026-01-13', 'fechado', 2, 1),
('2026-02-19', NULL, 'aberto', 3, 1);

-- 9.

SELECT * from usuario;

UPDATE usuario
SET telefone = '19999999994'
WHERE id_usuario = 4;

-- 10

UPDATE Livro
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_publicacao >= 2020;


-- 11.

INSERT INTO Usuario (nome, email, telefone, ativo) VALUES 
('celso', 'celso@gmail.com', '199999999', TRUE);

-- O usuário celso não possui empréstimos, então pode ser excluído.

DELETE FROM usuario WHERE id_usuario = 5;

-- O usuário Francisco possui empréstimos cadastrados, por isso não pode ser excluído.
DELETE FROM usuario WHERE id_usuario = 3;
-- Isso acontece porque a tabela Emprestimo usa o id do usuário como chave estrangeira.
-- Enquanto houver empréstimos ligados a esse usuário, o banco impede de o excluirmos.

-- FASE 3 - DQL: CONSULTAS E ANÁLISE.

-- 12.

SELECT titulo, autor, quantidade_disponivel FROM Livro;

-- 13.

SELECT titulo, quantidade_disponivel FROM livro WHERE quantidade_disponivel >= 2 ORDER BY quantidade_disponivel DESC; 

-- 14.

SELECT titulo, id_livro FROM livro WHERE titulo LIKE 'O Alquimista%';

-- 15.

-- O intervalo de anos dos meus livros são de 1605 até 2020.
-- Vou realizar com os livros nos intervalos de 1965 até 2020

SELECT titulo, ano_publicacao FROM livro WHERE ano_publicacao BETWEEN 1965 AND 2020;

-- 16.

SELECT COUNT(quantidade_disponivel) AS total_livros, 
AVG(quantidade_disponivel) AS media_disponivel,
SUM(quantidade_disponivel) AS soma_dos_livros,
MAX(quantidade_disponivel) AS maior_quantidade,
MIN(quantidade_disponivel) AS menor_quantidade
FROM Livro;

-- 17.

SELECT E.id_emprestimo, U.id_usuario, E.id_livro, E.data_prevista, E.status_emprestimo 
FROM emprestimo as E INNER JOIN usuario AS U ON E.id_usuario = U.id_usuario;

-- 18. 

SELECT status_emprestimo, COUNT(*) AS Quantidade FROM Emprestimo GROUP BY status_emprestimo;

-- 19.

SELECT U.id_usuario, U.nome, COUNT(E.id_emprestimo) AS Quantidade 
FROM Usuario AS U 
INNER JOIN Emprestimo AS E ON E.id_usuario = U.id_usuario 
GROUP BY U.id_usuario, U.nome ORDER BY Quantidade DESC;

-- 20.

SELECT U.id_usuario, U.nome, COUNT(E.id_emprestimo) AS Quantidade
FROM Usuario AS U 
LEFT JOIN Emprestimo AS E ON E.id_usuario = U.id_usuario 
GROUP BY U.id_usuario, U.nome;

-- FASE 4 - TCL, TRANSAÇÕES E INTEGRIDADE.

-- 21.

START TRANSACTION;

INSERT INTO emprestimo(data_prevista, data_devolucao, status_emprestimo, id_usuario, id_livro) VALUES
('2026-03-19','2026-04-08', 'fechado', 3, 4);

UPDATE livro
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_livro = 4;

SELECT * FROM livro;

COMMIT;

-- 22.

START TRANSACTION;

UPDATE livro
SET quantidade_disponivel = 20000
WHERE id_livro = 3;

SELECT * FROM livro;

ROLLBACK;

SELECT * FROM livro;

-- 23.

START TRANSACTION;

UPDATE livro
SET quantidade_disponivel = 90
WHERE id_livro = 3;

SELECT * FROM livro;

SAVEPOINT livrosSalvos;

UPDATE livro
SET quantidade_disponivel = 80
WHERE id_livro = 3

SELECT * FROM livros;

ROLLBACK TO SAVEPOINT livrosSalvos;

SELECT * FROM livros;

COMMIT;

-- 24.

START TRANSACTION;

SELECT * FROM emprestimo;

UPDATE emprestimo
SET status_emprestimo = 'fechado', data_devolucao = '2026-09-12'
WHERE id_emprestimo = 2;

UPDATE livro
SET quantidade_disponivel = quantidade_disponivel + 1
WHERE id_livro = 1;

COMMIT;

SELECT * FROM emprestimo;

-- 25.

 -- Cadastrar dois usuários com o mesmo e-mail.
--  R: Não é permitido, pois o campo e-mail possui uma regra sendo o UNIQUE para evitar valores repetidos.

-- Cadastrar dois livros com o mesmo ISBN.
-- R: Não é permitido, pois o IBSN também é uma regra UNIQUE.

-- Permitir quantidade disponível negativa.
-- R: Não é permitido, pois a regra CHECK garante que a quantidade seja zero ou maior.

-- Criar empréstimo para usuário inexistente.
-- R: Não é permitido, pois o empréstimo precisa estar ligado a um usuário cadastrado. (A chave estrangeira faz essa validação).

-- Excluir livro com histórico de empréstimos.
-- R: Não é permitido enquanto tiver empréstimos ligados neste livro.

-- Gravar empréstimo e falhar na redução do estoque.
-- R: A transação permite desfazer as alterações de um ROLLBACK se alguma etapa falhar. Assim o empréstimo não fica registrado sem atualizações.

-- Emprestar livro cuja quantidade disponível seja zero.
-- R: Não é permitido, pois não existem livros disponíveis. O sistema deve verificar o estoque antes de registrar o empréstimo.
