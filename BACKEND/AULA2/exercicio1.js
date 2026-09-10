// O Verificador de Votação (Básico)
//Objetivo: Praticar ´if/else´ simples
// Crie um programa que peça o nome do usuário e o ano de nascimento. O programa deve calcular a idade e dizer se ele já tem idade mínima para votar (16 anos).

const entrada = require('readline-sync');

 console.log("---VERIFICADOR DE VOTAÇÃO---");

 const nome = entrada.question("Qual seu nome? ");
 const anoNascimento = entrada.question("Qual seu ano de nascimento? ");

 if (2026 - anoNascimento >= 16) {
     console.log(`Olá, ${nome}! Você tem ${2026 - anoNascimento} anos e já pode votar.`);
 } else {
     console.log(`Olá, ${nome}! Você tem ${2026 - anoNascimento} anos e ainda não pode votar.`);
 }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//