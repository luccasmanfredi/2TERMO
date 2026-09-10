const entrada = require('readline-sync');

console.log("---SISTEMA DE ANALISE DE CREDITO---");

// Coleta de dados
const nome = entrada.question("Nome do cliente: ");
const idade = entrada.question("Idade: ");
const renda = entrada.question("Renda Mensal: ");
const temImovel = entrada.question("Possui imovel proprio? [y/n]:");

// Lógica Combinada
// (idade >= 18) É obrigatório
// (renda >= 2500 || temImovel === true) um dos dois tem que ser verdadeiro;

if (idade >= 18 && (renda >= 2500 || temImovel === true)) {
    console.log(`\nPARABENS, ${nome}! Seu credito foi APROVADO!`);
} else {
    console.log(`\nSinto muito, ${nome}. Seu credito foi NEGADO.`);
}