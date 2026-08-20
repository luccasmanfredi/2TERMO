const entrada = require('readline-sync');

// Buscado as ferramentas no arquivo funcoesOficina,js (O './' significa "nesta mesma pasta")

const oficina = require('./funcoesOficina');

console.log("=== SISTEMA DE GESTÃO DE OFICINA ===");

const peca = entrada.questionFloat("Preco da peca: R$" );
const horas = entrada.questionInt("Horas de servico: ");
const tempoUso = entrada.questionInt ("Meses desde o ultimo conserto: ");

// Usamos o nome 'oficina' (que damos no require) seguindo do ponto .
const totalBruto = oficina.calcularOrcamento(peca, horas);
const statusGarantia = oficina.verificarGarantia(tempoUso);
const totalComDesconto = oficina.aplicarDesconto(totalBruto);

console.log("\n --- RELATORIO FINAL ---");
console.log(`Orcamento sem Desconto: R$ ${totalBruto.toFixed(2)}`);
console.log(`Orcamento com Desconto (5%): R$ ${totalComDesconto.toFixed(2)}`);
console.log(`Status do Veiculo: ${statusGarantia}`);
 