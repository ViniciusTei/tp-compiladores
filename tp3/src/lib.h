#ifndef lib
#define lib

#include "tabela.h"
#include "btree.h"
#include "codigo.h"

#define MAX_SEMANTIC_ERROS 256
#define MAX_ERROR_LENGTH 60

// Variáveis do YACC/LEX
extern int yylineno, yychar, yydebug;
extern char* yytext;
extern FILE* yyin;

// Estado do compilador
SymbolTable st;
int hasError;
TipoApontador head;
char semanticErros[MAX_SEMANTIC_ERROS][MAX_ERROR_LENGTH];
int numSemanticErros;

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
int checkVarIsAlreadyDeclared(char *c);
int typeCheck(char *type1, char *type2);
void returnTypeCheck(char *value);

// Funcoes do YACC/LEX
void yyerror(const char *str);
int yylex(void);
int yyparse(void);


#endif