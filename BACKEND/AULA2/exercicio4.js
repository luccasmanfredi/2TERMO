// Desafio 4: Classificação de Atleta (Múltiplas Condições)
// Objetivo: Praticar `else if`.
// Enunciado: Uma escola de natação precisa classificar seus alunos por idade:
// • 5 a 10 anos Infantil
// • 11 a 17 anos: Juvenil
// • 18 a 60 anos: Adulto
// • Acima de 60 anos: Sênior

const entrada = require('readline-sync');

console.log("---Classificação do Atleta---");

const idade = entrada.questionInt("Qual a idade do atleta? ");

if (idade >= 5 && idade <= 10) {
    console.log("Classificação: Infantil");
}

else if (idade >= 11 && idade <= 17) {
    console.log("Classificação: Juvenil");
}

else if (idade >= 18 && idade <= 60) {
    console.log("Classificação: Adulto");
}

else {
    console.log("Classificação: Sênior");
}