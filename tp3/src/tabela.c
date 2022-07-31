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

void enterTableData(SymbolTable *table, int index, MetaType c, int lineNum, char *dataType, char *yytext) {
	table->table[index].token.lexem = strdup(yytext);
	table->table[index].line = lineNum;
	table->table[index].type = c;
	table->table[index].data_type = strdup(dataType);
}

int addToSymbolTable(SymbolTable *table, MetaType c, int lineNum, char *dataType, char *yytext) {
	char ReserverdWords[RESERVERD_WORDS_TAM][RESERVERD_WORDS_MAX_LENGTH] = {
	"pespcrepva",
	"plepia",
	"pinpteipro",
	"prepal",
	"pcaprapcptepre",
	"pvapzipo",
	"preptoprpne",
	"preppipta",
	"pse",
	"psepnao",
	"pverpdapdeipro",
	"pfalpso",
	"penpquanpto"
	};

	if (c == IDTYPE) {
		for(int i = 0; i < RESERVERD_WORDS_TAM; i++) {
			if(strcmp(ReserverdWords[i], yytext) == 1) {
				return RESERVERD_WORD_ERROR;
			}
		}
	}

  if(!verifyAlreadyIsInTable(table, yytext)) {
    int index = table->last;
		switch (c)
		{
		case KEYWORD:
			enterTableData(table, index, c, lineNum, dataType, yytext);
			break;
		case IDTYPE:
			enterTableData(table, index, c, lineNum, dataType, yytext);
			break;
		case CONSTANT:
			enterTableData(table, index, c, lineNum, dataType, yytext);
			break;
		case FUNCT:
			enterTableData(table, index, c, lineNum, dataType, yytext);
			break;
		case OPERATOR:
			enterTableData(table, index, c, lineNum, dataType, yytext);
			break;
		default:
			printf("Not mapped\n");
			break;
		}

		index++;
		table->last = index;
		return 0;
	} else if (c == IDTYPE) {
		return MULTIPLE_DEFINITION_ERROR;
	}
}

char *handleShowMetaType(MetaType t) {
	switch (t)
		{
		case KEYWORD:
			return "Palavra chave";
			break;
		case IDTYPE:
			return "Variavel";
			break;
		case CONSTANT:
			return "Constante";
			break;
		case FUNCT:
			return "Funcao";
			break;
		case OPERATOR:
			return "Operador";
			break;
		default:
			return "";
			break;
		}
}

void printSymbolTable(SymbolTable st) {
	printf("\n\n\nTABELA DE SIMBOLOS\n");
	printf("SIMBOLO\t\t\t\tTIPO\t\t\tTIPO DE DADO\t\t\tLINHA\n");
	for(int i = 0; i < st.last; i++) {
		printf("%s\t\t\t\t%s\t\t\t%s\t\t\t%d\n", st.table[i].token.lexem, handleShowMetaType(st.table[i].type), st.table[i].data_type, st.table[i].line);
	}
}

char *getDataType(SymbolTable st, char *lexem) {
	for (int i = 0; i < st.last; i++) {
		if (strcmp(st.table[i].token.lexem, lexem) == 0) {
			return st.table[i].data_type;
		}
	}
}