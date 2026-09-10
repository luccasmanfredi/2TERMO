const entrada = require('readline-sync');

console.log('--- Cadastro de Visitantes da Fábrica ---');

const listaVisitantes = [];

let continuar = 's';

while (continuar === 's') {
    const nome = entrada.question('Digite o nome do visitante: ');
    const empresa = entrada.question('Digite a empresa do visitante: ');

    const visitante = {
        nome: nome,
        empresa: empresa
    };

    listaVisitantes.push(visitante);

    continuar = entrada.question('Deseja cadastrar um novo visitante? (s/n): ').toLowerCase();
}

console.log('Lista de todos os visitantes que entraram hoje:');
console.log(listaVisitantes);
console.log(`Total de visitantes cadastrados: ${listaVisitantes.length}`);
