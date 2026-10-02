const fs = require("fs");

const sensores = [
    {
        codigo: 1, tipo: "Temperatura", valor: 80, unidade: "°C", status: "Normal" },
    {
        codigo: 2, tipo: "Pressão", valor: 120, unidade: "bar", status: "Alerta" },
    {
        codigo: 3, tipo: "Umidade", valor: 60, unidade: "%", status: "Normal" },
    {
        codigo: 4, tipo: "Temperatura", valor: 95, unidade: "°C", status: "Alerta" },
    {
        codigo: 5, tipo: "Vibração", valor: 30, unidade: "mm/s", status: "Normal" }
];

fs.writeFileSync(
    "monitoramento.json",
    JSON.stringify(sensores, null, 2)
);

console.log("Sensores cadastrados!");