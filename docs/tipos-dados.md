# Tipos de dados

A linguagem P provê 5 tipos primitivos de dados, inteiro, real, caractere, vetor e lógico.

Para falarmos dos tipos de dados, primeiro vamos definir os identificadores da linguagem.

Um **identificador** é a forma que chamamos nossas declarações como as variáveis e funções da linguagem. Elas são definidas iniciando por uma letra e seguidas de qualquer letra ou número.

Exemplo: num, num1;

## Inteiro e Real

Nossa linguagem permite trabalhar com tipos inteiros e reais, sendo descritos na forma **pinpteipro** e **prepal** respectivamente. Para dizermos que uma *variável* é desse tipo fazemos:

```
pinpteipro num = 1;
prepal num2 = 1.5;
```

## Caractere

Um caractere vai armazenar os valores da tabela [ASCII](https://pt.wikipedia.org/wiki/ASCII). Ele é definido na nossa linguagem na forma **pcaprapcptepre**.

```
pcaprapcptepre char = 'c';
pcaprapcptepre char2 = '\n';
pcaprapcptepre char3 = 65; // vai mostrar 'A'
```

## Vetor (Não implementado ainda)

Um tipo vetor na nossa linguagem se é uma lista que pode armazernar qualquer tipo de tipo de dados. Ele possui métodos prórpios para auxilar nas operações com listas. Em P um vetor é definido na forma **pveptor<tipo_desejado>**.

```
pveptor<pinpteipro> vet = [0, 1];
pveptor<pcaprapcptepre> vet2 = ['a', 'b', 'c'];
```

## Lógico (Não implementado ainda)

Um tipo lógico define variáveis do tipo booleano, com valor verdadeiro ou falso. Para definir usamos a forma **plopgipco**, e os valores são respectivamente **pverpdapdeipro** e **pfalpso**.

```
plopgipco val = pverpdapdeipro;
plopgipco val2 = pfalpso;
```