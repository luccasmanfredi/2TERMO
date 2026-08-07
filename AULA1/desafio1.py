# Desafio 1 

# Escreva um programa em python que receba o número de dias que um carro foi alugado e a quantidade em Km rodados. 

# - O aluguel custa R$90,00 por dia. 
# - Se o cliente rodou até 100 km no total, paga R$0,20 por km rodado.
# - Se o cliente rodou mais de 100 km, paga R$0,15 por km rodado.

# Exiba o valor a pagar formatado com duas casas decimais. 
#--------------------------------------------------------------------------------------------------------------------------------------------------------#

print ("Bem-vindo ao sistema de aluguel de carros!")

dias = int(input("Digite o número de dias que o carro foi alugado: "))
km = float(input("Digite a quantidade de km rodados: "))

if km <= 100:
    valor_km = km * 0.20
else: 
    valor_km = km * 0.15 

    valor_dias = dias * 90
    valor_total = valor_dias + valor_km

print (f"O valor total a pagar é: R${valor_total:.2f}")
