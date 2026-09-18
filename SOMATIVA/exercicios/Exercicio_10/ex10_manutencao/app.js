const entrada = require('readline-sync');

const funcoes = require ("./funcoesManutencao.js");

const Nome_Maquina = entrada.question("Informe o nome da maquina: ");

const Pecas = entrada.questionFloat("Informe o valor das pecas: ");
const Horas = entrada.questionFloat("Informe o total de horas de servico: ");
const Meses = entrada.questionInt("Quantos meses desde a ultima verificacao: ");

const MaoDeObra = funcoes.calcularMaoDeObra(Horas);
const Total = funcoes.calcularTotal(Pecas, Horas);
const Garantia = funcoes.verificarGarantia(Meses);

console.log("\nRELATORIO FINAL");
console.log(`Maquina: ${Nome_Maquina}`);
console.log(`Pecas: R$ ${Pecas.toFixed(2)}`);
console.log(`Mao de obra: R$ ${MaoDeObra.toFixed(2)}`);
console.log(`Total: R$ ${Total.toFixed(2)}`);
console.log(`Garantia: ${Garantia}`);