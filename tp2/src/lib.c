#include "lib.h"

int begin(void) {
  initializeSymbolTable(st);
  
  yyparse();

  if (hasSyntaticError) {
    printf("\n Programa sintaticamente incorreto! Encerrando compilador!\n");
    return 0;
  }

  printf("\n Programa correto! Encerrando compilador!\n");
  return 0;
}

void handleError(const char *str) {
	printf("\n");
	printf("Erro: %s na linha %d", str, yylineno);
	printf("\n\n");

	hasSyntaticError = 1;
}