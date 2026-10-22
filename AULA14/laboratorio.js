// Ex 2 //
// const fs = require("fs");
// const texto = fs.readFileSync("maquinas.json", "utf8");
// console.log(typeof texto);
// console.log(texto); 

// Quantos objetos existem no array?
// Existem 4 objetos no array.

// Qual propriedade representa o identificador único?
// A propriedade "id" representa o identificador único.

// Qual é o tipo de dado do valor da propriedade id?
// O valor de "id" é do tipo number (número).

// Quais máquinas estão no setor Usinagem?
// No setor Usinagem estão as máquinas Torno C e Fresa D.

// Ex 3 //

// const fs = require("fs");
// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);
// console.log(Array.isArray(maquinas));
// console.log(maquinas.length);
// console.log(maquinas[0].nome);

// Ex 4 //

const fs = require("fs");
const texto = fs.readFileSync("maquinas.json", "utf8");
const maquinas = JSON.parse(texto);
maquinas.forEach((maquina, indice) => {
console.log(`${indice + 1}. ${maquina.nome} - ${maquina.setor} - ${maquina.status}`);
});

// Ex 5 //

// const fs = require("fs");
// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);
// const procurada = maquinas.find(maquina => maquina.id === 99);

// if (procurada !== undefined) {
// 	console.log(procurada.nome);
// } else {
// 	console.log("Máquina não encontrada.");
// }

// Ex 6 //

// const fs = require("fs");
// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);
// const maquinasUsinagem = maquinas.filter(maquina => maquina.setor === "Usinagem");
// console.log("Máquinas do setor Usinagem:", maquinasUsinagem);
// console.log("Quantidade:", maquinasUsinagem.length); // 2

// const maquinasMontagem = maquinas.filter(maquina => maquina.setor === "Montagem");
// console.log("Máquinas do setor Montagem:", maquinasMontagem);
// console.log("Quantidade:", maquinasMontagem.length); // 1

// Ex 7 //

// Não. O find() retorna apenas a primeira máquina que corresponde à condição.
// Para listar todas as máquinas com defeito, filter() é melhor pois retorna um novo array
// com todas as que correspondem com a condição ou um array vazio, se não houver nenhuma.

// Ex 9 //

// const fs = require("fs");
// try {
// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);
// console.log(`Registros carregados: ${maquinas.length}`);
// } catch (erro) {
// console.log("Não foi possível carregar os dados.");
// console.log(erro.message);
// }

// Ex 10 //

// const fs = require("fs");

// try {
// 	const texto = fs.readFileSync("maquinas.json", "utf8");
// 	const maquinas = JSON.parse(texto);

// 	// Desafio A: exibe ID, nome e status de cada máquina.

// 	console.log("=== TODAS AS MÁQUINAS ===");
// 	maquinas.forEach(maquina => {
// 		console.log(`${maquina.id} | ${maquina.nome} | ${maquina.status}`);
// 	});

// 	// Desafio B: procura uma máquina pelo ID e mostra seu setor.

// 	const idProcurado = 3;
// 	const maquinaEncontrada = maquinas.find(maquina => maquina.id === idProcurado);

// 	if (maquinaEncontrada !== undefined) {
// 		console.log(`\nSetor da máquina ${idProcurado}: ${maquinaEncontrada.setor}`);
// 	} else {
// 		console.log(`\nNão encontrei uma máquina com o ID ${idProcurado}.`);
// 	}

// 	// Desafio C: lista as máquinas de um setor e mostra a quantidade.

// 	const setorProcurado = "Usinagem";
// 	const maquinasDoSetor = maquinas.filter(maquina => maquina.setor === setorProcurado);

// 	console.log(`\nMáquinas do setor ${setorProcurado}: ${maquinasDoSetor.length}`);
// 	maquinasDoSetor.forEach(maquina => console.log(maquina.nome));

// 	// Desafio D: a função retorna todas as máquinas com o status informado.

// 	function filtrarPorStatus(status) {
// 		return maquinas.filter(maquina => maquina.status === status);
// 	}

// 	const maquinasAtivas = filtrarPorStatus("Ativa");
// 	const maquinasParadas = filtrarPorStatus("Parada");

// 	console.log(`\nMáquinas com status Ativa: ${maquinasAtivas.length}`);
// 	console.log(maquinasAtivas);
// 	console.log(`Máquinas com status Parada: ${maquinasParadas.length}`);
// 	console.log(maquinasParadas);
// } catch (erro) {
// 	console.log("Não foi possível carregar os dados.");
// 	console.log(erro.message);
// }

