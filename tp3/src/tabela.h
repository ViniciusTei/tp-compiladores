#ifndef TABELASIMBOLOS
#define TABELASIMBOLOS
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#define ST_MAX_TAM 1024
#define RESERVERD_WORDS_TAM 13
#define RESERVERD_WORDS_MAX_LENGTH 28
#define MULTIPLE_DEFINITION_ERROR 500
#define RESERVERD_WORD_ERROR 501

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
int addToSymbolTable(SymbolTable *table, MetaType c, int lineNum, char *dataType, char *yytext);
void printSymbolTable(SymbolTable st);
char *getDataType(SymbolTable st, char *lexem);
int verifyAlreadyIsInTable(SymbolTable *table, char *id);

#endif