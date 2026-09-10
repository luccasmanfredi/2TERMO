const entrada = require('readline-sync');
const calculadoraVendas = require('./calculoVendas');

const nome = entrada.question('Informe o seu nome: ');
const quantidade = entrada.questionFloat('Informe qual a quantidade: ');
const preco = entrada.questionFloat('Informe qual o preco: ');

const total = calculadoraVendas.calcularTotal(preco, quantidade);
const cupom = calculadoraVendas.gerarCupom(nome, total);

console.log("\n--- CUPOM FISCAL ---")
console.log(cupom);