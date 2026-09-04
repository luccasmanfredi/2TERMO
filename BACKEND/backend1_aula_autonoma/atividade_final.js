const readline = require("readline-sync");

const nome = readline.question("Digite o nome do aluno: ");
const disciplina = readline.question("Digite a disciplina: ");
const idade = Number(readline.question("Digite a idade do aluno: "));
const cidade = readline.question("Digite a cidade do aluno: ");
const nomeTurma = readline.question("Digite o nome da turma: ");
const nomeEscola = readline.question("Digite o nome da escola: ");
const periodo = readline.question("Digite o periodo (manha/tarde/noite/integral): ");
const cargaHoraria = Number(readline.question("Digite a carga horaria da disciplina: "));
const anoLetivo = Number(readline.question("Digite o ano letivo: "));

const nota1 = Number(readline.question("Digite a primeira nota: "));
const nota2 = Number(readline.question("Digite a segunda nota: "));
const faltas = Number(readline.question("Digite a quantidade de faltas: "));

const media = (nota1 + nota2) / 2;

console.log("\n--- RELATÓRIO DO ALUNO ---");
console.log("Aluno:", nome);
console.log("Disciplina:", disciplina);
console.log("Nota 1:", nota1);
console.log("Nota 2:", nota2);
console.log("Média:", media);
console.log("Faltas:", faltas);
console.log("Idade:", idade);
console.log("Cidade:", cidade);
console.log("Turma:", nomeTurma);
console.log("Escola:", nomeEscola);
console.log("Período:", periodo);
console.log("Carga Horária:", cargaHoraria, "horas");
console.log("Ano Letivo:", anoLetivo);