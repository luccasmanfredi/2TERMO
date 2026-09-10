const entrada = require(`readline-sync`);

console.log(" --- A Casa de Cambio --- ");

const conversor = require('./conversor.js');

const valorDolar = entrada.questionFloat("Digite o valor em Dolar (US$): ");
const valorTotal = conversor.converterDolarparaReal(valorDolar);

console.log(`Valor em real: R$ ${valorTotal.toFixed(2)}`); 