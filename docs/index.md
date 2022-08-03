# Linguagem P

Aqui você encontra uma breve documentação para a linguagem P. Nela você poderá entender como escrever um programa em P. 💥💥

## Conteúdo

1. [Hello World](hello-world.md)
2. [Tipos de dados](tipos-dados.md)
3. [Operadores aritméticos](operadores-aritmeticos.md)
4. [Estruturas condicionais e de repetição](estruturas-condicionais.md)
5. [Operadores lógicos e relacionais](operadores-logicos.md)
6. [Sobre o compilador](sobre.md)

## Sobre o compilador

Esse compilador foi construindo usando as ferramentas [Lex e Yacc](http://dinosaur.compilertools.net/). Essas ferramentas auxiliam no processo de consstrucao de um compilador, fazendo o "trabalho duro"  para ler o programa fonte, entender sua estrutura e processa-la para gerar um codigo intermediario.

### Lex

LEX é uma ferramenta usada para gerar analisadores léxicos. Você passa como entrada um grupo de expressões regulares que fazem ações, para gerar um scanner em formato de código em C.

### Yacc

YACC (Yet Another Compiler Compiler) é uma ferramenta para gerar um conversor de código para tokens. Ele trabalha em conjunto com o arquivo LEX, para traduzir GLCs (Gramáticas Livres do Contexto) em implementações C. Esse programa em C gera um parser.

---

Essa linguagem foi criada para a disciplina de Compiladores da Universidade Federal de Viçosa.

**🤝 Colaboradores**

Agradecemos às seguintes pessoas que contribuíram para este projeto:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/ViniciusTei">
        <img src="https://github.com/ViniciusTei.png" width="64px;" alt="Foto do Vinicius no GitHub"/><br>
        <sub>
          <b>ViniciusTei</b>
        </sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/LTaka">
        <img src="https://github.com/LTaka.png" width="64px;" alt="Foto do LTaka no GitHub"/><br>
        <sub>
          <b>LTaka</b>
        </sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/buMatheus">
        <img src="https://github.com/buMatheus.png" width="64px;" alt="Foto do buMatheus no GitHub"/><br>
        <sub>
          <b>buMatheus</b>
        </sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/ArthurMarte">
        <img src="https://github.com/ArthurMarte.png" width="64px;" alt="Foto do ArthurMarte no GitHub"/><br>
        <sub>
          <b>ArthurMarte</b>
        </sub>
      </a>
    </td>
  </tr>
</table>