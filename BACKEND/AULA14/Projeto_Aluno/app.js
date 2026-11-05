// CRUD READ - Sistema de consultas de maquinas industriais
// Coloque este arquivo na mesma pasta de maquinas.json.
// Execute: node app.js

const fs = require('node:fs');
const caminho = require('node:path');
const ARQUIVO = caminho.join(__dirname, 'maquinas.json');

// 1. Leitura do arquivo JSON e conversao em array de objetos
function carregarMaquinas() {
  const conteudo = fs.readFileSync(ARQUIVO, 'utf8');
  const maquinas = JSON.parse(conteudo);

  if (!Array.isArray(maquinas)) {
    throw new Error('O arquivo JSON deve conter uma lista de maquinas.');
  }

  return maquinas;
}

// 2. Mostra as maquinas cadastradas no terminal
function listarMaquinas(maquinas) {
  maquinas.forEach((maquina) => {
    console.log(`${maquina.id} | ${maquina.nome} | ${maquina.status}`);
  });
}

// 3. Busca a primeira maquina com o ID informado
function buscarPorId(maquinas, id) {
  return maquinas.find((maquina) => maquina.id === id);
}

// 4. Retorna todas as maquinas com o status informado
function filtrarPorStatus(maquinas, status) {
  return maquinas.filter((maquina) => maquina.status === status);
}

// 5. Retorna todas as maquinas do setor informado
function filtrarPorSetor(maquinas, setor) {
  return maquinas.filter((maquina) => maquina.setor === setor);
}

// 6. Executa consultas de exemplo
function executar() {
  try {
    const maquinas = carregarMaquinas();

    console.log('\n=== TODAS AS MAQUINAS ===');
    listarMaquinas(maquinas);

    console.log('\n=== BUSCA PELO ID 3 ===');
    console.log(buscarPorId(maquinas, 3) ?? 'Maquina nao encontrada.');

    console.log('\n=== BUSCA PELO ID 99 ===');
    console.log(buscarPorId(maquinas, 99) ?? 'Maquina nao encontrada.');

    console.log('\n=== MAQUINAS EM MANUTENCAO ===');
    console.log(filtrarPorStatus(maquinas, 'manutencao'));

    console.log('\n=== MAQUINAS DO SETOR USINAGEM ===');
    console.log(filtrarPorSetor(maquinas, 'Usinagem'));
  } catch (erro) {
    console.error('Erro ao ler ou consultar o arquivo:', erro.message);
    process.exitCode = 1;
  }
}

if (require.main === module) {
  executar();
}

// PERMITE IMPORTAR AS FUNÇÕES NO ARQUIVO testes.js
module.exports = {
  carregarMaquinas,
  listarMaquinas,
  buscarPorId,
  filtrarPorStatus,
  filtrarPorSetor,
};