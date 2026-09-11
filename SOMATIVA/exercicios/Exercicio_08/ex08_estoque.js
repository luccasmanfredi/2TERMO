const entrada = require('readline-sync');

const componentes = [];
const estoqueMinimo = 50;
const estoqueMaximo = 200;

for (let i = 0; i < 3; i++) {
	componentes.push({
		nome: entrada.question(`Nome do componente ${i + 1}: `),
		quantidade: entrada.questionInt("Quantidade: ")
	});
}

for (let i = 0; i < componentes.length; i++) {
	const componente = componentes[i];

	console.log(`\n${componente.nome} - Quantidade: ${componente.quantidade}`);

	if (componente.quantidade < estoqueMinimo) {
		console.log("REPOR ESTOQUE");
	} else if (componente.quantidade > estoqueMaximo) {
		console.log("ESTOQUE ACIMA DO MAXIMO");
	} else {
		console.log("ESTOQUE OK");
	}
}
