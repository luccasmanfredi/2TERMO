const entrada = require('readline-sync');

const pecasDefeituosas = [];

const quantidade = entrada.question('Quantas pecas com defeito foram encontradas? ');

for (let i = 0; i < quantidade; i++) {
    const numeroSerie = entrada.question(`Informe o numero de serie da peca ${i + 1}: `);
    pecasDefeituosas.push(numeroSerie);
}

console.log(`Total de peças: ${pecasDefeituosas} - Numeros de serie: ${pecasDefeituosas.length}`);
