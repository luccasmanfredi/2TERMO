const fs = require("fs");

const producao = JSON.parse(
    fs.readFileSync("producao.json", "utf-8")
);

let totalMeta = 0;

for (const maquina of producao) {

    let percentual = maquina.produzido / maquina.meta * 100;
    let situacao;

    if (percentual >= 100) {
        situacao = "META ATINGIDA";
        totalMeta++;
    } else if (percentual >= 80) {
        situacao = "ATENÇÃO";
    } else {
        situacao = "ABAIXO DA META";
    }

    console.log("Máquina:", maquina.maquina);
    console.log("Meta:", maquina.meta);
    console.log("Produzido:", maquina.produzido);
    console.log("Desempenho:", percentual.toFixed(2) + "%");
    console.log("Situação:", situacao);
    console.log("--------------------");
}

console.log("Máquinas que atingiram a meta:", totalMeta);