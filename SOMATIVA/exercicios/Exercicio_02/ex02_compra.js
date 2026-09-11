const entrada = require('readline-sync');

console.log("=== Loja Manfredi ===");

const Nome_Material = entrada.question("Informe o nome do material: ");

const quantidade_comprada = entrada.question("Informe a quantidade comprada: ");

const preco_unitario = entrada.questionFloat("Informe o valor do produto: ");

const Total_Compra = quantidade_comprada * preco_unitario

console.log(`O produto ${Nome_Material} ficou: ${Total_Compra} `)