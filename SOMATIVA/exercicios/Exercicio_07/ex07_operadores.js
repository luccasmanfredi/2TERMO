const entrada = require('readline-sync');

const operadores = [];

for (let i = 0; i < 5; i++) {
	const nome = entrada.question(`Informe o nome do operador ${i + 1}: `);
	operadores.push(nome);
}

console.log('\nOperadores cadastrados:');

for (let i = 0; i < operadores.length; i++) {
	console.log(`${i + 1} - ${operadores[i]}`);
}
