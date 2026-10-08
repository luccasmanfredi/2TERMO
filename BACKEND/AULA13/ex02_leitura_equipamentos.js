const fs = require("fs");

if (fs.existsSync("equipamentos.json")) {
    const equipamentos = JSON.parse(fs.readFileSync("equipamentos.json", "utf-8"));

    console.log("Equipamentos cadastrados:");
    console.log("--------------------");

    for (const equipamento of equipamentos) {
        console.log(`Código: ${equipamento.codigo}`);
        console.log(`Equipamento: ${equipamento.nome}`);
        console.log(`Setor: ${equipamento.setor}`);

        if (equipamento.operacional) {
            console.log("Status: OPERACIONAL");
        } else {
            console.log("Status: PARADA");
        }

        console.log("--------------------");
    }

} else {
    console.log("Arquivo equipamentos.json não encontrado.");
}