create database SESI_EXTENSAOVSTA;

use SESI_EXTENSAOVSTA;

-- Visualizar todos os bancos de dados 

show schemas;

create table if not exists alunos(
    ID_Aluno int not null auto_increment primary key,
    nome_aluno varchar(70) not null,
    CPF char(14) not null unique,
    data_nascimento date not null,
    data_cadastro timestamp default current_timestamp
);

--  visualizar informações  sobre os dados da tabela 

describe alunos;