// const geo = require ('geometria');

// const l = 10 

// console.log(calculasAreaQuadrado(l));
// -------------------------------------------------------------
// Versão Corrigida

const geometria = require('./geometria.js');

const lado = 10;

const valorArea = geometria.calcularAreaQuadrado(lado);

console.log(`Valor total da área: ${valorArea}`);

// Chamar um console.log sozinho sem puxar a função não iria funcionar de jeito nenhum. 

// Chamei a função definida no geometria.js e declarei a função em um const para realizar o cálculo, no final só puxei um console.log para apresentar o valor final.
