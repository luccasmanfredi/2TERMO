const entrada = require("readline-sync");

console.log("==== O GERADOR DE PARCELAS ====");

const valorTotal = entrada.questionFloat("Digite o valor total do produto: ");
const quantidadeParcelas = entrada.questionInt("Digite a quantidade de parcelas (maximo 12):");

if (quantidadeParcelas > 12) {
    console.log("A quantidade de parcelas excede o limite máximo de 12.");
} else {
    const valorParcela = valorTotal / quantidadeParcelas;
    for (let i = 1; i <= quantidadeParcelas; i++) {
        console.log(`Parcela ${i}: R$ ${valorParcela.toFixed(2)}`);
    }
}