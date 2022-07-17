# TP 2

Vamos criar nosso analisador sintatico. Apos a entrega, devemos poder comecar a reconhecer os primeiros erros nos codigos criados em nossa linguagem P.

Nele vamos reconhecer erros lexicos e sintaticos. E vamos comecar a definir as primeiras regras para fazer a analise sintatica do codigo.

https://medium.com/codex/building-a-c-compiler-using-lex-and-yacc-446262056aaa

https://github.dev/gfviegas/xd-compilador

## Yacc

Yacc (Yet Another Compiler Compiler) eh uma ferramenta usada para criar uma arvore de derivacao. Ele pega os tokens do analisador lexico (Lex) e faz uma analise semantica. Yacc traduz uma GLC em uma implementacao C.

## Implementacao

Ao se usar o executável de seu compilador para a sua linguagem, deverá ser impresso na saída:

- o programa fonte com as linhas numeradas;
- o conteúdo da tabela de símbolos;
- “Programa sintaticamente correto” ou "Programa sintaticamente incorreto", dependendo da entrada que for passada. No caso do programa incorreto, pode-se também imprimir algo do tipo: “Erro próximo a linha x” (onde x é a numeração que foi usada na impressão do fonte na tela) seguido de uma descrição do erro e aí encerra-se a compilação prematuramente.

### TO-DO

- [x] Implementar as gramaticas para todos os comandos definidos pela linguagem
- [x] Imprimir o programa fonte com as linha numeradas
- [x] Imprimir o conteudo da tabela de simbolos
- [x] Imprimir mensagem de sucesso
- [x] Imprimir mensagem de erro, deve mostrar o erro e a linha onde ocorreu o erro.  