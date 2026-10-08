const fs = require("fs");

const materiais = JSON.parse(
    fs.readFileSync("materiais.json", "utf-8")
);

let totalUnidades = 0;
let totalEstoque = 0;

for (const material of materiais) {

    let valor = material.quantidade * material.valorUnitario;

    console.log(material.descricao);
    console.log("Quantidade:", material.quantidade);
    console.log("Valor unitário: R$", material.valorUnitario);
    console.log("Valor em estoque: R$", valor.toFixed(2));
    console.log("--------------------");

    totalUnidades += material.quantidade;
    totalEstoque += valor;
}

console.log("Tipos de materiais:", materiais.length);
console.log("Total de unidades:", totalUnidades);
console.log("Valor total do estoque: R$", totalEstoque.toFixed(2));