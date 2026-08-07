# Desafio 3: Funções e Dicionários (O Desconto no Produto)
# Enunciado em Python: Crie um dicionário representando um produto: produto =
# {"nome": "Teclado Mecânico", "preco": 200.0, "estoque": 15}
# 1. Crie uma função chamada aplicar_desconto que receba o dicionário do
# produto
# e a porcentagem de desconto (ex: 10 para 10%).
# 2. A função deve atualizar o preço do produto dentro do dicionário e exibir a
# mensagem: "O produto [NOME] agora custa R$ [NOVO_PRECO]!"

produto = {
    "nome": "Teclado Mecânico",
    "preco": 200.0,
    "estoque": 15,
}


def aplicar_desconto(produto, porcentagem):
    desconto = produto["preco"] * (porcentagem / 100)
    produto["preco"] -= desconto
    print(f"O produto {produto['nome']} agora custa R$ {produto['preco']:.2f}!")


aplicar_desconto(produto, 10)

