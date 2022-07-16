#include "lib.h"

int begin(void) {
  printf("Starting...\n");
  hasError = 0;
  initializeSymbolTable(&st);
  
  yyparse();

  printSymbolTable(st);
  
  hasError
    ? printf("\n Programa incorreto! Encerrando compilador!\n")
    : printf("\n Programa correto! Encerrando compilador!\n");

  return 0;
}

void handleError(const char *str) {
	printf("\n");
	printf("Erro: %s na linha %d", str, yylineno);
	printf("\n\n");

  hasError = 1;
}