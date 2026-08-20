# PBE1 - Programação Backend 1

## 📋 Descrição do Projeto

Este repositório contém exercícios e atividades da disciplina de **Programação Backend 1** (PBE1), focando no aprendizado de conceitos fundamentais de JavaScript como:

- **Variáveis e Tipos de Dados**: declaração de variáveis com `const` e `let`, diferentes tipos de dados
- **Estruturas de Controle**: condicionais (`if/else`), loops (`for`, `while`)
- **Arrays**: manipulação e iteração sobre arrays
- **Entrada/Saída**: interação com usuário através de terminal
- **Lógica de Programação**: implementação de algoritmos e resolução de problemas

## 📁 Estrutura do Projeto

```
PBE1 - Manfredi/
├── BACKEND/
│   ├── lacos/              # Exercícios com loops (for, while)
│   │   ├── array.js        # Manipulação básica de arrays
│   │   ├── array2.js       # Sistema de controle de qualidade com arrays
│   │   └── ex1.js          # Exemplo de loop while para acumulador
│   └── package.json
├── backend1_aula_autonoma/ # Atividades autônomas
│   ├── aula1.js            # Primeiros passos em JavaScript
│   ├── aula2.js            # Declaração de variáveis
│   ├── aula3.js            # (Atividades da aula 3)
│   ├── aula4.js            # (Atividades da aula 4)
│   ├── atividade_final.js  # Projeto final: Relatório de aluno
│   └── package.json
└── package.json            # Dependências do projeto
```

## 🛠️ Tecnologias Utilizadas

- **Linguagem**: JavaScript (ES6+)
- **Runtime**: Node.js
- **Bibliotecas**:
  - `readline-sync` ^1.4.10 - Para capturar entrada do usuário via terminal

## 🚀 Como Executar

### Pré-requisitos
- Node.js instalado (versão 12+)

### Instalação de Dependências

```bash
# Na raiz do projeto
npm install

# Ou no diretório BACKEND
cd BACKEND
npm install

# Ou no diretório backend1_aula_autonoma
cd backend1_aula_autonoma
npm install
```

### Executando os Exemplos

```bash
# Exemplo de array básico
node BACKEND/lacos/array.js

# Sistema de pesagem (array2.js)
node BACKEND/lacos/array2.js

# Exemplo de loop while
node BACKEND/lacos/ex1.js

# Atividades autônomas
node backend1_aula_autonoma/aula1.js
node backend1_aula_autonoma/atividade_final.js
```

## 📝 Exemplos de Conteúdo

### Arrays
- Declaração e acesso a elementos de arrays
- Método `push()` para adicionar elementos
- Método `join()` para concatenar elementos

### Loops
- **For**: iteração com número definido de repetições
- **While**: iteração com condição booleana

### Entrada/Saída
- Captura de dados via `readline-sync`
- Leitura de números inteiros e decimais
- Validação e processamento de dados

## 👤 Autor

**Luccas Manfredi**

## 📄 Licença

ISC

---

> Este projeto faz parte da disciplina PBE1 (Programação Backend 1) do 2º Termo
