#ifndef TABELASIMBOLOS
#define TABELASIMBOLOS
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#define ST_MAX_TAM 1024

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
  SymbolTableData table[ST_MAX_TAM];
  int first, last;
} SymbolTable;

void initializeSymbolTable(SymbolTable *st);
void add(SymbolTable *table, char c, int lineNum, char *type, char *yytext);
void printSymbolTable(SymbolTable st);

#endif