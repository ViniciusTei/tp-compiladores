#include "lib.h"

int begin(void) {
  hasError = 0;
  initializeSymbolTable(&st);
  printf("Arquivo de entrada\n");
  yyparse();

  printSymbolTable(st);

  printf("Analise sintatica\n\n");
  printBTree(head);
  
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