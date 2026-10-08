const fs = require("fs");

const equipamentos = [
    { codigo: 101, nome: "Torno CNC", setor: "Usinagem", operacional: true },
    { codigo: 102, nome: "Impressora", setor: "Financeiro", operacional: true },
    { codigo: 103, nome: "Projetor", setor: "Sala de reunioes", operacional: false }
];

const dadosTexto = JSON.stringify(equipamentos, null, 2);
fs.writeFileSync("equipamentos.json", dadosTexto);
console.log("Dados salvos com sucesso no arquivo equipamentos.json");

