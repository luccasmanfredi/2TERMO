const entrada = require ('readline-sync');

const Peso_Peca = entrada.questionFloat("Informe o peso da peca: ");

if (Peso_Peca >= 95 && Peso_Peca <= 105) {
	console.log(`Peso informado: ${Peso_Peca}g`);
	console.log("PEÇA APROVADA");
} else {
	console.log(`Peso informado: ${Peso_Peca}g`);
	console.log("PEÇA REPROVADA");
}