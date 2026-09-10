-- Comando para criar banco de dados 

create database estacionamento_senai;

create table clientes (
ID_Cliente int,
Nome varchar(60),
Telefone varchar(14),
 Data_Nascimento date,
  CPF varchar(14),
  Endereco varchar (60)
);
 
 create table Veiculos (
 ID_Veiculo int,
 Placa varchar(8),
 Modelo varchar (30),
 Tipo varchar (10),
 Numero_Vagas int
 );
 