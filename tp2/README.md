# TP 2

Vamos criar nosso analisador sintatico. Apos a entrega, devemos poder comecar a reconhecer os primeiros erros nos codigos criados em nossa linguagem P.

Nele vamos reconhecer erros lexicos e sintaticos. E vamos comecar a definir as primeiras regras para fazer a analise sintatica do codigo.

https://medium.com/codex/building-a-c-compiler-using-lex-and-yacc-446262056aaa

## Yacc

Yacc (Yet Another Compiler Compiler) eh uma ferramenta usada para criar uma arvore de derivacao. Ele pega os tokens do analisador lexico (Lex) e faz uma analise semantica. Yacc traduz uma GLC em uma implementacao C.