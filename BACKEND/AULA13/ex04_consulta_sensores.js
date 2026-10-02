const fs = require("fs");

const sensores = JSON.parse(
    fs.readFileSync("monitoramento.json", "utf-8")
);

let total = 0;

console.log("=== TODOS OS SENSORES ===");

for (const sensor of sensores) {

    console.log(
        sensor.codigo, sensor.tipo, sensor.valor + sensor.unidade, sensor.status );

    if (sensor.status === "Alerta") {
        total++;
    }
}

console.log("--------------------");
console.log("Sensores em alerta:", total);