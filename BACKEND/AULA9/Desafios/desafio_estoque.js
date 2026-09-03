const fs = require('fs');

console.log("=== SISTEMA DE CONSULTA DE ESTOQUE ===\n");

try {
    const dadosTexto = fs.readFileSync('estoque.json', 'utf-8');
    const produtos = JSON.parse(dadosTexto);

    const produtosEstoqueBaixo = produtos.filter(produto => produto.qtd < 100);
                                                                                                                                                                                                               
    for (const produto of produtosEstoqueBaixo) {
        console.log(`ID: ${produto.id}`);
        console.log(`Nome: ${produto.nome}`);
        console.log(`Quantidade em estoque: ${produto.qtd}`);
        console.log("------------------------------");
    }
} catch(erro) {
    console.log("Erro ao acessar o banco de dados: " + erro.message);
}
