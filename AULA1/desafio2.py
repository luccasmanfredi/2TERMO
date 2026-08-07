# Desafio 2: Repetição e Listas (O Filtro de Pares)
# Enunciado em Python: Dado o seguinte código inicial com uma lista de
# números:

# numeros = [12, 5, 8, 21, 14, 3, 10, 7]

# Escreva um programa que:

# 1. Percorra a lista e crie uma nova lista contendo apenas os números pares.
# 2. Calcule e exiba a média desses números pares.

# - O que avalia no aluno: Laços de repetição (for), listas, método .append(),
# acúmulo de valores e o operador de resto de divisão %.
#---------------------------------------------------------------------------------------------------------#
numeros = [12, 5, 8, 21, 14, 3, 10, 7]

numeros_pares = []
for numero in numeros:
    if numero % 2 == 0:
        numeros_pares.append(numero)

print(numeros_pares)
print([sum(numeros_pares) / len(numeros_pares)])
#---------------------------------------------------------------------------------------------------------#

