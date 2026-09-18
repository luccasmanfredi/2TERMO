const entrada = require('readline-sync');

function calcularEficiencia(real, prevista) {
	return (real / prevista) * 100;
}

function classificarEficiencia(percentual) {
	if (percentual >= 90) {
		return 'META ATINGIDA';
	} else if (percentual >= 70) {
		return 'ATENCAO';
	} else {
		return 'ABAIXO DA META';
	}
}

const prevista = entrada.questionFloat('Informe a producao prevista: ');
const real = entrada.questionFloat('Informe a producao real: ');

const percentual = calcularEficiencia(real, prevista);
const classificacao = classificarEficiencia(percentual);

console.log(`Producao prevista: ${prevista}`);
console.log(`Producao real: ${real}`);
console.log(`Eficiencia: ${percentual.toFixed(2)}%`);
console.log(`Classificacao: ${classificacao}`);
