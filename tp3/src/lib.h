#ifndef lib
#define lib

#include "tabela.h"
#include "btree.h"

// Variáveis do YACC/LEX
extern int yylineno, yychar, yydebug;
extern char* yytext;
extern FILE* yyin;

// Estado do compilador
SymbolTable st;
int hasError;
TipoApontador head;

/**
 * Funcao principal que ira rodar os principais recursos
 *
 * @return  int
 */
int begin(void);

/**
 * Funcao para tratar mensagens de erro
 *
 * @param  str mensagem de erro
 */
void handleError(const char *str);

// Funcoes do YACC/LEX
void yyerror(const char *str);
int yylex(void);
int yyparse(void);


#endif