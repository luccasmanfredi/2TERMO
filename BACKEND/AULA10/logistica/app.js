const entrada = require(`readline-sync`);

const logistica = require('./calculadoraFrete.js');

const produto = entrada.question("Informe o nome do produto: ");
const  km = entrada.questionInt("Qual a distancia da entrega em KM? ");
const valorCarga = entrada.questionFloat("Qual o valor total da carga? ");

const freteBase = logistica.calcularBase(km);
const seguro = logistica.calcularSeguro(valorCarga);
const prazo = logistica.verificarPrazo(km);

const total = freteBase + seguro;

console.log(`====== RELATORIO DE POSTAGEM ======
Produto: ${produto}
Frete base: R$ ${freteBase.toFixed(2)}
Seguro: R$ ${seguro.toFixed(2)}
Total: R$ ${total.toFixed(2)}
Prazo de entrega: ${prazo}
===================================`);

