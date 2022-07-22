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
  FUNCT,
} MetaType;

typedef struct Token {
  char *lexem;
  int value;
} Token;

typedef struct SymbolTableData{
  Token token;
  MetaType type;
  char *data_type;
  int line;
} SymbolTableData;

typedef struct SymbolTable {
  SymbolTableData table[ST_MAX_TAM];
  int first, last;
} SymbolTable;

void initializeSymbolTable(SymbolTable *st);
void addToSymbolTable(SymbolTable *table, MetaType c, int lineNum, char *dataType, char *yytext);
void printSymbolTable(SymbolTable st);

#endif