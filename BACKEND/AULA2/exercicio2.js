// O "Mão de Vaca" (Cálculo com Decisão)
// Objetivo:** Praticar cálculos e `if/else`.
// Enunciado: Um restaurante está dando 10% de desconto para contas acima de R$ 100,00. Peça o valor total da conta. Se for acima de 100, mostre o valor com desconto. Se for abaixo, mostre o valor normal.

const entrada = require('readline-sync');

console.log("---CÁLCULO COM DECISÃO---");

let valorConta = entrada.questionInt("Qual o valor total da conta? ");

if (valorConta > 100) {
    const valorComDesconto = valorConta - (valorConta * 0.9);
    console.log(`O valor da conta com desconto é: R$ ${valorComDesconto.toFixed(2)}`);
} else {
    console.log(`O valor da conta é: R$ ${valorConta.toFixed(2)}`);
}