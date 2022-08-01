#include "lib.h"

int begin(void) {
  hasError = 0;
  numSemanticErros = 0;
  tempReg = 0;
  regEnd = 0;
  intermadiateCode.last = 0;
  initializeSymbolTable(&st);
  printf("Arquivo de entrada\n");
  yyparse();

  printSymbolTable(st);

  // printf("Analise sintatica\n\n");
  // printBTree(head);

  printf("\n");

  if (numSemanticErros > 0)
    for (int i = 0; i < numSemanticErros; i++) 
      printf("%s\n", semanticErros[i]);

  hasError = numSemanticErros > 0 ? 1 : hasError;
  
  hasError
    ? printf("\nPrograma incorreto! Encerrando compilador!\n")
    : printf("\nPrograma correto! Encerrando compilador!\n");

  createFileOutput();

  return 0;
}

void handleError(const char *str) {
	printf("\n");
	printf("Erro: %s na linha %d", str, yylineno);
	printf("\n\n");

  if (numSemanticErros > 0)
    for (int i = 0; i < numSemanticErros; i++) 
      printf("%s\n", semanticErros[i]);

  hasError = 1;
}

int checkVarIsAlreadyDeclared(char *c) {    
  if(verifyAlreadyIsInTable(&st, c) == 0) {
    sprintf(semanticErros[numSemanticErros], "<Semantic error>%d: Var \"%s\", nao foi declarada ainda!\n", yylineno, c);
    numSemanticErros += 1;
    return -1;
  }

  return 1;
}

int typeCheck(char *type1, char *type2) { 
    // declaration with no init 
    if(!strcmp(type2, "null")) return -1; 
    // both datatypes are same 
    if(!strcmp(type1, type2)) return 0; 
    // both datatypes are different 
    return 1;
}

void returnTypeCheck(char *value) {
	char *main_datatype = getDataType(st, "main");
	char *return_datatype = getDataType(st, value);
	if((!strcmp(main_datatype, "int") && !strcmp(return_datatype, "CONST")) || !strcmp(main_datatype, return_datatype)){
		return ;
	}
	else {
		sprintf(semanticErros[numSemanticErros],  "<Semantic error>%d: Tipo de retorno incorreto\n", yylineno);
		numSemanticErros += 1;
	}
}