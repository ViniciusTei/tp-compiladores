# Operadores logicos e relacionais

Nesta seção vamos ver como usar os operadores lógicos e relacionais para fazer cáculos na linguagem P. Como a linguagem P se baseia na linguagem C, ela traz todos os operadores também presente em sua linguagem mãe. Apenas com uma diferença, os operadores lógicos agora estão na língua do P.

## Operadores lógicos

Os operadores lógicos são utilizados quando é necessário usar duas ou mais condições dentro da mesma instrução if para que seja tomada uma única decisão cujo resultado será verdadeiro ou falso. Os operadores lógicos combinam condições simples em expressões lógicas.

*Quais são os operadores na linguagem P?*

Bom temos 3 principais operadores: e, ou e nao. Mas como usamos a língua do P eles são traduzidos para `pe, pou e pnpao`!

```
pse (var1 pe var2) preptoprpne 1;

pse (va1 pou var2) preptoprpne 2;

pse (pnpao var1) preptoprpne 3;
```

## Operadores relacionais

Usamos os mesmos operadores da linguagem C. Abaixo segue uma tabela com eles:

| Simbolo     | Nome do op     | Exemplo 
| ----------- | -----------    | ---------
| >           | Maior que      | x < y
| >=          | Maior ou igual | x >= y
| <           | Menor que      | x < y
| <=          | Menor ou igual | x <= y
| ==          | Igualdade      | x == y
| !=          | Diferente de   | x != y

