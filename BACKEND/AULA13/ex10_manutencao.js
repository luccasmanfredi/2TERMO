const fs = require("fs");
const readline = require("readline-sync");

try {

    if (!fs.existsSync("manutencoes.json")) {
        throw new Error("Arquivo não encontrado.");
    }

    const manutencoes = JSON.parse(
        fs.readFileSync("manutencoes.json", "utf-8")
    );

    let total = 0;

    console.log("=== MÁQUINAS ===");

    for (const manutencao of manutencoes) {

        let horasRestantes =
            manutencao.limiteManutencao - manutencao.horasUso;

        let situacao;

        if (horasRestantes <= 0 && !manutencao.manutencaoRealizada) {
            situacao = "MANUTENÇÃO NECESSÁRIA";
            total++;
        } else {
            situacao = "NORMAL";
        }

        console.log("ID:", manutencao.id);
        console.log("Máquina:", manutencao.maquina);
        console.log("Setor:", manutencao.setor);
        console.log("Horas restantes:", horasRestantes);
        console.log("Situação:", situacao);
        console.log("--------------------");
    }

    console.log("Total para manutenção:", total);

    const id = Number(
        readline.question("Informe o ID da máquina: ")
    );

    let encontrada = false;

    for (const manutencao of manutencoes) {

        if (manutencao.id === id) {

            manutencao.manutencaoRealizada = true;

            fs.writeFileSync(
                "manutencoes_backup.json",
                JSON.stringify(manutencoes, null, 2)
            );

            fs.writeFileSync(
                "manutencoes.json",
                JSON.stringify(manutencoes, null, 2)
            );

            console.log("Manutenção registrada!");

            encontrada = true;
        }
    }

    if (!encontrada) {
        console.log("Máquina não encontrada.");
    }

} catch (erro) {

    console.log("Erro:", erro.message);

}