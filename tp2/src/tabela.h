#ifndef TABELASIMBOLOS
#define TABELASIMBOLOS
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

typedef enum MetaType {
	UNKNOWN = -1,
	IDTYPE,
	CONSTANT,
  OPERATOR,
  KEYWORD,
} MetaKind;

typedef struct Token {
  char *lexem;
  int value;
} Token;

typedef struct SymbolTableData{
  Token token;
  char* type;
  int line;
} SymbolTableData;

typedef struct SymbolTable {
  SymbolTableData *table;
  int first, last;
} SymbolTable;

void initializeSymbolTable(SymbolTable *st);
void add(SymbolTable *table, char c, int lineNum, char *type, char *yytext);

#endif