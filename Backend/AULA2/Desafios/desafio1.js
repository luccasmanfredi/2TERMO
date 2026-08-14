const entrada = require("readline-sync");

console.log("=== O VERIFICADOR DE APOSENTADORIA ===");

const nome = entrada.question("Qual o seu nome? ");
const idade = entrada.questionInt("Qual a sua idade? ")
const tempoContribuicao = entrada.questionInt("Qual o seu tempo de contribuicao? ");

if (idade >= 65 || tempoContribuicao >= 30) {
    console.log(`Olá, ${nome}! Você tem ${idade} anos e ${tempoContribuicao} anos de contribuição. Parabéns! Você já pode se aposentar.`);
}

else {
    console.log(`Olá, ${nome}! Você tem ${idade} anos e ${tempoContribuicao} anos de contribuição. Infelizmente, você ainda não pode se aposentar.`);
}

