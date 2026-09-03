const fs = require('fs');

try {
    const dadosTexto = fs.readFileSync('maquinas.json', 'utf-8');
    const maquinas = JSON.parse(dadosTexto);

    const manutencao_urgente = maquinas.filter(maquina => maquina.horasUso > 1000);

    console.log("=== MAQUINAS PARA MANUTENCAO URGENTE ===");

    const texto = [];

    for (const maquina of manutencao_urgente) {
        console.log(maquina.nome);
        texto.push(`{ "id": ${maquina.id}, "nome": "${maquina.nome}", "horasUso": ${maquina.horasUso} }`);
    }

    fs.writeFileSync('manutencao_urgente.json', `[${texto}]`);
} catch (erro) {
    console.log("Erro ao acessar as maquinas: " + erro.message);
}