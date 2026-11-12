-- Active: 1791543223289@@127.0.0.1@3306@biblioteca_senai_luccas_revisao
-- - A escola Biblioteca Conecta deseja substituir planilhas e registros manuais por um
-- banco de dados relacional capaz de controlar usuarios, livros e emprestimos. Sua
-- - missao e desenvolver a primeira versao do banco, desde sua criacao ate operações
-- de consulta, manipulacao e controle transacional. A atividade ja inicia com 3
-- tabelas e voce devera criar e adaptar mais 2 tabelas.

-- CRIAR TABELAS - USUÁRIO, LIVRO, EMPRESTIMO, CATEGORIA, FORNECEDOR     

CREATE DATABASE IF NOT EXISTS BIBLIOTECA_SENAI_LUCCAS_REVISAO;

USE BIBLIOTECA_SENAI_LUCCAS_REVISAO;

-- CRIAÇÃO DE TABELAS

CREATE TABLE USUARIO (
    ID_USUARIO INT AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) NOT NULL UNIQUE,
    TELEFONE VARCHAR(20),
    ATIVO BOOLEAN DEFAULT TRUE,
    CONSTRAINT PK_USUARIO PRIMARY KEY (ID_USUARIO)
    CONSTRAINT UQ_EMAIL UNIQUE (EMAIL)
);

CREATE TABLE LIVRO (
    ID_LIVRO INT AUTO_INCREMENT,
    TITULO
)