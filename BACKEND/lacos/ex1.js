const readline = require("readline-sync");

let total = 0;
let preco = -1;

while (preco !==0) {
    preco = readline.questionFloat("Preco: R$ ");

    if(preco !==0) {
        total += preco;
        console.log(`Subtotal: R$ ${total.toFixed(2)}`);
        
    }
}