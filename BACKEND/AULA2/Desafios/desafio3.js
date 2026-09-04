const entrada = require("readline-sync");

function calcularArea(largura, comprimento) {
    return largura * comprimento;
}

for (let i = 1; i <= 3; i++) {
    console.log(`\nTerreno ${i}:`);
    const largura = entrada.questionFloat("Digite a largura do terreno (em metros): ");
    const comprimento = entrada.questionFloat("Digite o comprimento do terreno (em metros): ");

    const area = calcularArea(largura, comprimento);
    console.log(`A área do terreno ${i} é: ${area.toFixed(2)} metros quadrados.`);
}