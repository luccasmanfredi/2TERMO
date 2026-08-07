// Álcool ou Gasolina? (Matemática + Lógica)
// Objetivo: Praticar lógica aplicada ao dia a dia.
// Enunciado: Dizem que só compensa abastecer com Álcool se o preço dele for menor que 70% do preço da Gasolina. Peça o preço do litro de cada um. O programa deve calcular: `precoAlcool / precoGasolina`. 
// Se o resultado for menor que 0.7, mostre "Abasteça com ÁLCOOL". Caso contrário, mostre "Abasteça com GASOLINA".

const entrada = require('readline-sync');

console.log("--- ÁLCOOL OU GASOLINA? ---");

const precoAlcool = entrada.questionFloat("Qual o preco do litro do Alcool? ");
const precoGasolina = entrada.questionFloat("Qual o preco do litro da Gasolina? ");

const CONTA = precoAlcool / precoGasolina;

if ( CONTA < 0.7) {
    console.log("Abasteça com ÁLCOOL");
} else {
    console.log("Abasteça com GASOLINA");
}