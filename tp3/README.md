# TP3

Nesta parte do trabalho vamso terminar nosso compilador. Primeiro devemos implementar a analise semantica do codigo, e a geracao do codigo intermediario.

Para o nosso compilador vamos implementar os seguintes tipos de erros semanticos:

- variavel nao foi declarada
- multiplas declaracoes de variaveis
- variaveis nao podems ser palavras reservadas
- verificacao de tipos

Para implementar o codigo intermediario vamos usar a implementacao de tres enderecos, mostrando um arquivo texto com a saida do codigo gerado pelo programa fonte.

## Implementacao

 - [x] arvore sintaxe (b-tree)
 - [x] analise semantica
 - [x] geracao de codigo intermediario

 ## Como usar o compilador

Primeiro basta compilar o arquivo usando o comando `make` no seu terminal, isso ira criar um arquivo `a.out`.

Voce pode rodar o comando `make test` para rodar o teste padrao do projeto, ou adicionar um arquivo novo e rodar no terminal o 
arquivo executavel gerando passando na entrada o seu arquivo no seguinte formato:

```bash
./a.out < novo_arq.p
```