const entrada = require ('readline-sync');

const Temp = entrada.questionFloat("Informe qual a temperatura da maquina: ");

if (Temp <= 60) {
    console.log(`A temperatura da maquina e: ${Temp} °C`);
    console.log("Situacao: NORMAL");
} else if (Temp <= 80) {
    console.log(`A temperatura da maquina e: ${Temp} °C`);
    console.log("Situacao: ATENCAO");
} else {
    console.log(`A temperatura da maquina e: ${Temp} °C`);
    console.log("Situacao: CRITICA");
}