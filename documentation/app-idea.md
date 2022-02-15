# TDD - Café com conhecimento

## Projeto

    Um app conversor de moeda, para converter um valor em uma moeda para seu valor correspondente em outra moeda usando sua taxa de câmbio atual, por exemplo, pode ser usado para calcular o valor de 100 dólares americanos em euros.

### TDD

    Durante o café, iremos desenvolver usando TDD um pedaço desse conversor:
        Usecase que irá fazer a conversão de moedas
        Repo com as taxas de conversão
        Cubit que chamará o usecase

### Premissas

    O projeto será disponibilizado através de um repositório remoto já com a configuração inicial

    O app terá somente uma tela HomePage que não vai ser desenvolvida durante o café, assim como a parte de injeção de dependências,
    que será feita para rodarmos o app no emulador após o desenvolvimento com TDD.

    

# Encontro 1

    Apresentação teórica sobre TDD, e uma visão geral do projeto que contruiremos

# Encontro 2

    Início da aplicação do TDD criando os testes do usecase

##  Usecase

* Objetivo
    * Converter um valor de uma moeda de origem para seu valor correspondente numa moeda de destino

* Recebe
    * id da moeda de origem
    * id da moeda de destino
    * valor da moeda de origem a ser convertido


* 1 - Buscar no repository a taxa de conversão
        Passa como parâmetro
            id da moeda de origem
            id da moeda de destino

* 2 - Retornar a multiplicação entre o valor da moeda de origem e a taxa de conversão

* 3 - Em caso de exceção repassar para quem chamá-lo
            

# Encontro 3

    Aplicação do TDD criando os testes do repo

# Encontro 4

    Aplicação do TDD criando os testes do cubit

## Entre os encontros 4 e 5

    Implementar a injeção de independência

# Encontro 5

    Apresentação do app funcionando, e um espaço para perguntas e discussões relacionadas ao TDD






