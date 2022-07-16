#include "tabela.h"

void initializeSymbolTable(SymbolTable *st) {
  st->first = 0;
  st->last = st->first;

}

// verifica se o simbolo encontrado ja esta na tabela
int verifyAlreadyIsInTable(SymbolTable *table, char *id) {
	int i;
	for(i=table->last-1; i>=0; i--) {
		if(strcmp(table->table[i].token.lexem, id)==0) {
			return -1;
			break;
		}
	}
	return 0;
}

void add(SymbolTable *table, char c, int lineNum, char *type, char *yytext) {
  char q=verifyAlreadyIsInTable(table, yytext);
  if(!q) {
    int index = table->last;
    if(c == 'H') {
			table->table[index].token.lexem=strdup(yytext);
			table->table[index].line=lineNum;
			table->table[index].type=strdup("Header");
			index++;
		}
		else if(c == 'K') {
			table->table[index].token.lexem=strdup(yytext);
			table->table[index].line=lineNum;
			table->table[index].type=strdup("Keyword\t");
			index++;
		}
		else if(c == 'V') {
			table->table[index].token.lexem=strdup(yytext);
			table->table[index].line=lineNum;
			table->table[index].type=strdup("Variable");
			index++;
		}
		else if(c == 'C') {
			table->table[index].token.lexem=strdup(yytext);
			table->table[index].line=lineNum;
			table->table[index].type=strdup("Constant");
			index++;
		}
		else if(c == 'F') {
			table->table[index].token.lexem=strdup(yytext);
			table->table[index].line=lineNum;
			table->table[index].type=strdup("Function");
			index++;
		}

		table->last = index;

    // table->table = realloc(table->table, index * sizeof(SymbolTable));
	}
}

void printSymbolTable(SymbolTable st) {
	printf("\n\n\nTABELA DE SIMBOLOS\n");
	printf("SIMBOLO\t\t\t\tTIPO\t\t\tLINHA\n");
	for(int i = 0; i < st.last; i++) {
		printf("%s\t\t\t\t%s\t\t\t%d\n", st.table[i].token.lexem, st.table[i].type, st.table[i].line);
	}
}