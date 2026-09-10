const entrada = require("readline-sync");
const sensores = require("./sensor.js");

const temperatura = entrada.questionFloat("Informe qual a temperatura: ");
const umidade = entrada.questionFloat("Informe qual a umidade: ");

const temperaturaTotal = sensores.checarTemperatura(temperatura);
const umidadeTotal = sensores.checarUmidade(umidade);

console.log(temperaturaTotal);
console.log(umidadeTotal);  