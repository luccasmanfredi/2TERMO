function calcularBase(km) {
    return km * 2.1;
}

function calcularSeguro(valorCarga) {
    return valorCarga * 0.01;
}

function verificarPrazo(km) {
    if (km < 100) {
        return '1 dia útil';
    }

    return '3 a 5 dias úteis';
}

module.exports = {
    calcularBase,
    calcularSeguro,
    verificarPrazo
}
