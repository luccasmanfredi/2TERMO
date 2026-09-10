const entrada = require('readline-sync');


console.log ("CALCULADORA DE IMC");

const peso = entrada.questionFloat ("Qual seu peso?");
const altura = entrada.questionInt ("Qual a sua altura");

const total = peso / altura * altura ;

console.log ("\n --- IMC ---");
console.log (`Produto {total}`)