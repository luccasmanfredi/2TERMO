const fs = require("fs");
const readline = require("readline-sync");

const materiais = JSON.parse(
    fs.readFileSync("materiais.json", "utf-8")
);

const codigo = Number(
    readline.question("Informe o codigo do material: ")
);

let encontrado = false;

for (const material of materiais) {

    if (material.codigo === codigo) {

        console.log("Quantidade atual:", material.quantidade);

        const novaQuantidade = Number(
            readline.question("Informe a nova quantidade: ")
        );

        // Backup
        fs.writeFileSync(
            "materiais_backup.json",
            JSON.stringify(materiais, null, 2)
        );

        material.quantidade = novaQuantidade;

        fs.writeFileSync(
            "materiais.json",
            JSON.stringify(materiais, null, 2)
        );

        console.log("Estoque atualizado!");

        encontrado = true;
    }
}

if (!encontrado) {
    console.log("Material não encontrado.");
}