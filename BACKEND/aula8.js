// // Criando a "Máquina" de calcular média
// function calcularMedia(n1, n2) {
//     return (n1 + n2) / 2;
// }
// // Usando a máquina
// const resultado = calcularMedia(10, 8);
// const resultado1 = calcularMedia(25, 45);
// console.log(`A media calculada foi: ${resultado1}`);

// Minha versão

const entrada = require("readline-sync");

console.log("Calculo de Media");

function calcularMedia(n1, n2) {
    return (n1 + n2) / 2;
}

const num1 = entrada.questionFloat ("Qual o primeiro valor: ")
const num2 = entrada.questionFloat ("Qual o segundo valor: ")
const resultado = calcularMedia(num1, num2)

console.log(`O valor da media é: ${resultado}`)
