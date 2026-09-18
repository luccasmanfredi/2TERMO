const entrada = require('readline-sync');

console.log("=== Tabela de Producao ===");

const pecasPorCiclo = entrada.questionInt("Quantas pecas a maquina consegue produzir por ciclo? ");
let producaoAcumulada = 0;

for (let ciclo = 1; ciclo <= 10; ciclo++) {
	producaoAcumulada += pecasPorCiclo;
	console.log(`Ciclo ${ciclo}: ${producaoAcumulada} pecas produzidas`);
}
