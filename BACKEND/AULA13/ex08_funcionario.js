const fs = require("fs");
const readline = require("readline-sync");

const funcionarios = JSON.parse(
    fs.readFileSync("funcionarios.json", "utf-8")
);

const matricula = Number(
    readline.question("Informe a matricula: ")
);

let encontrado = false;

for (const funcionario of funcionarios) {

    if (funcionario.matricula === matricula) {

        console.log("Funcionário encontrado!");
        console.log("Nome:", funcionario.nome);
        console.log("Setor:", funcionario.setor);
        console.log("Cargo:", funcionario.cargo);

        encontrado = true;
    }
}

if (!encontrado) {
    console.log("Funcionário não encontrado.");
}