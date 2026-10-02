const fs = require("fs");

try {

    const temperaturas = JSON.parse(
        fs.readFileSync("temperaturas.json", "utf-8")
    );

    for (const item of temperaturas) {

        if (item.temperatura > 350) {
            throw new Error(
                "Temperatura de " + item.temperatura +
                "°C excedeu o limite permitido."
            );
        }

        console.log(
            "Leitura:", item.temperatura + "°C - NORMAL"
        );
    }

} catch (erro) {

    console.log("ALARME:");
    console.log(erro.message);

}