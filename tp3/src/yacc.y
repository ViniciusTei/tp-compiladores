%{
    #include "./src/lib.h"
    #include "y.tab.h"
    void handleAddToSymbolTable(MetaType c, int lineNum, char *dataType, char *yytext);
    void defineDataType();
    char dataType[18];
%}

%union {
  struct lexval {
   char name[100];
   TipoApontador node;
   char type[10];
   char gotoLabel[10];
   char nextGotoLabel[10];
  } lexval;
}

%token <lexval> VOID CHARACTER PRINTFF SCANFF INT FLOAT CHAR FOR IF ELSE TRUE FALSE NUMBER FLOAT_NUM ID LE GE EQ NE GT LT AND OR STR ADD MULTIPLY DIVIDE SUBTRACT UNARY RETURN WHILE

%type <lexval> main body return datatype expression statement init value arithmetic relop begin condition else

%%

begin: main '(' ')' '{' body return '}' {
  $1.node = Insere("main", $5.node, $6.node);
  $$.node = Insere("begin", $1.node, NULL);
  head = $$.node;
}
;

main: datatype ID { handleAddToSymbolTable(FUNCT, yylineno, dataType, yytext); }
;

datatype: INT { defineDataType(); }
| FLOAT { defineDataType(); }
| CHAR { defineDataType(); }
| VOID { defineDataType(); }
;

body: FOR { handleAddToSymbolTable(KEYWORD, yylineno, dataType, yytext); actualConditional = forStatment; } '(' statement ';' condition ';' statement ')' '{' body '}' {
  TipoApontador temp = Insere("condition", $6.node, $8.node);
  TipoApontador temp2 = Insere("condition", $4.node, temp);
  $$.node = Insere($1.name, temp2, $11.node);
  sprintf(intermadiateCode.three_address_table[intermadiateCode.last++], "JUMP to %s\n", $6.gotoLabel);
  sprintf(intermadiateCode.three_address_table[intermadiateCode.last++], "LABEL %s:\n", $6.nextGotoLabel);
}
| IF {handleAddToSymbolTable(KEYWORD, yylineno, dataType, yytext); actualConditional = ifElse;} '(' condition ')' { sprintf(intermadiateCode.three_address_table[intermadiateCode.last++], "LABEL %s:\n", $4.gotoLabel); } '{' body '}'{ sprintf(intermadiateCode.three_address_table[intermadiateCode.last++], "LABEL %s:\n", $4.nextGotoLabel); } else {
  TipoApontador nodeIf = Insere($1.name, $4.node, $8.node);
  $$.node = Insere("if-else", nodeIf, $11.node);
  sprintf(intermadiateCode.three_address_table[intermadiateCode.last++], "GOTO next\n");
}
| statement ';' {
  $$.node = $1.node;
}
| body body {
  $$.node = Insere("statments", $1.node, $2.node);
}
| PRINTFF {handleAddToSymbolTable(KEYWORD, yylineno, dataType, yytext);} '(' STR ')' ';' {
  $$.node = Insere("printf", NULL, NULL);
}
| SCANFF {handleAddToSymbolTable(KEYWORD, yylineno, dataType, yytext);} '(' STR ',' '&' ID ')' ';' {
  $$.node = Insere("scanf", NULL, NULL);
}
| WHILE {handleAddToSymbolTable(KEYWORD, yylineno, dataType, yytext); actualConditional = whileStatment;} '(' condition ')' '{' body '}' {
  $$.node = Insere($1.name, $4.node, $7.node);
}
;

else: ELSE {handleAddToSymbolTable(KEYWORD, yylineno, dataType, yytext); } '{' body '}' {
  $$.node = Insere($1.name, NULL, $4.node);
}
| { $$.node = NULL; }
;

condition: value relop value { 
  $$.node = Insere($2.name, $1.node, $3.node);
  switch(actualConditional) {
    case forStatment:
      sprintf($$.gotoLabel, "L%d", regEnd++);
      sprintf(intermadiateCode.three_address_table[intermadiateCode.last++], "LABEL %s:\n", $$.gotoLabel);
      sprintf(intermadiateCode.three_address_table[intermadiateCode.last++], "if NOT (%s %s %s) GOTO L%d\n", $1.name, $2.name, $3.name, regEnd);
      sprintf($$.nextGotoLabel, "L%d", regEnd++);
      break;
    case ifElse:
      sprintf(intermadiateCode.three_address_table[intermadiateCode.last++], "if (%s %s %s) GOTO L%d else GOTO L%d\n", $1.name, $2.name, $3.name, regEnd, regEnd++);
      sprintf($$.gotoLabel, "L%d", regEnd++);
      sprintf($$.nextGotoLabel, "L%d", regEnd++);
      break;
	}  
}
| TRUE {handleAddToSymbolTable(KEYWORD, yylineno, dataType, yytext); $$.node = NULL; }
| FALSE {handleAddToSymbolTable(KEYWORD, yylineno, dataType, yytext); $$.node = NULL; }
| { $$.node = NULL; }
;

statement: datatype ID { handleAddToSymbolTable(IDTYPE, yylineno, dataType, yytext); } init {
  $2.node = Insere($2.name, NULL, NULL);

  if (typeCheck($1.name, $4.type) < 1) {
    $$.node = Insere("declaration", $2.node, $4.node);

  } else {
    sprintf(semanticErros[numSemanticErros], "<Semantic error> %d: Os tipos sao incompativeis!\n Esperado %s, recebido %s\n", yylineno, $1.name, $4.type);
    numSemanticErros += 1;
  }
  sprintf(intermadiateCode.three_address_table[intermadiateCode.last++], "%s = %s\n", $2.name, $4.name);
}
| ID '=' expression {
    if (checkVarIsAlreadyDeclared($1.name) > 0) {
      $1.node = Insere($1.name, NULL, NULL);
      char *idType = getDataType(st, $1.name);
      printf("%s %s", idType, $1.name);
      if (typeCheck(idType, $3.type) < 1) {
        $$.node = Insere("=", $1.node, $3.node);
      } else {
        sprintf(semanticErros[numSemanticErros], "<Semantic error> %d: Os tipos sao incompativeis!\n Esperado %s, recebido %s\n", yylineno, idType, $3.type);
        numSemanticErros += 1;
      }
    }
    sprintf(intermadiateCode.three_address_table[intermadiateCode.last++], "%s = %s\n", $1.name, $3.name);
}
| ID { checkVarIsAlreadyDeclared($1.name); } relop expression {
  $1.node = Insere($1.name, NULL, NULL);
  $$.node = Insere($3.name, $1.node, $4.node);
}
;

init: '=' value {
  $$.node = $2.node;
  strcpy($$.type, $2.type);
  strcpy($$.name, $2.name);  
}
| {
  strcpy($$.type, "null");
  strcpy($$.name, "NULL");
  $$.node = Insere("NULL", NULL, NULL);
}
;

expression: expression arithmetic expression {
  if (typeCheck($1.type, $3.type) < 1) {
    $$.node = Insere($2.name, $1.node, $3.node);
  } else {
    sprintf(semanticErros[numSemanticErros], "<Semantic error> %d: Os tipos sao incompativeis!\n Esperado %s, recebido %s\n", yylineno, $1.type, $3.type);
    numSemanticErros += 1;
  }

  sprintf($$.name, "t%d", tempReg);
	tempReg++;
  sprintf(intermadiateCode.three_address_table[intermadiateCode.last++], "%s = %s %s %s\n",  $$.name, $1.name, $2.name, $3.name);
}
| value {
  strcpy($$.name, $1.name);
  strcpy($$.type, $1.type);
  $$.node = $1.node;
}
;

arithmetic: ADD { handleAddToSymbolTable(OPERATOR, yylineno, dataType, yytext); }
| SUBTRACT { handleAddToSymbolTable(OPERATOR, yylineno, dataType, yytext); }
| MULTIPLY { handleAddToSymbolTable(OPERATOR, yylineno, dataType, yytext); }
| DIVIDE { handleAddToSymbolTable(OPERATOR, yylineno, dataType, yytext); }
;

relop: LT { handleAddToSymbolTable(OPERATOR, yylineno, dataType, yytext); }
| GT { handleAddToSymbolTable(OPERATOR, yylineno, dataType, yytext); }
| LE { handleAddToSymbolTable(OPERATOR, yylineno, dataType, yytext); }
| GE { handleAddToSymbolTable(OPERATOR, yylineno, dataType, yytext); }
| EQ { handleAddToSymbolTable(OPERATOR, yylineno, dataType, yytext); }
| NE { handleAddToSymbolTable(OPERATOR, yylineno, dataType, yytext); }
;

value: NUMBER {
  strcpy($$.name, $1.name);
  strcpy($$.type, "pinpteipro");
  handleAddToSymbolTable(CONSTANT, yylineno, dataType, yytext);
}
| FLOAT_NUM {
  strcpy($$.name, $1.name);
  strcpy($$.type, "prepal");
  handleAddToSymbolTable(CONSTANT, yylineno, dataType, yytext);
}
| CHARACTER {
  strcpy($$.name, $1.name);
  strcpy($$.type, "pcaprapcptepre");
  handleAddToSymbolTable(CONSTANT, yylineno, dataType, yytext); 
}
| ID {
  strcpy($$.name, $1.name);
  strcpy($$.type, getDataType(st, $1.name));
  checkVarIsAlreadyDeclared($1.name);
  $$.node = Insere($1.name, NULL, NULL);
}
;

return: RETURN { handleAddToSymbolTable(KEYWORD, yylineno, dataType, yytext); } value ';' {
  returnTypeCheck($3.name);
  $1.node = Insere("return", NULL, NULL);
  $$.node = Insere("RETURN", $1.node, $3.node);
}
| { $$.node = NULL; }
;

%%

void handleAddToSymbolTable(MetaType c, int lineNum, char *dataType, char *yytext) {
  int ret = addToSymbolTable(&st, c, lineNum, dataType, yytext);

  if (ret == MULTIPLE_DEFINITION_ERROR) {
    sprintf(semanticErros[numSemanticErros], "<Semantic error> %d: Multiplas declaracoes da variavel \"%s\"\n", lineNum, yytext);
    numSemanticErros += 1;
  } else if (ret == RESERVERD_WORD_ERROR) {
    sprintf(semanticErros[numSemanticErros], "<Semantic error> %d: Variavel \"%s\" eh uma palavra reservada\n", lineNum, yytext);
    numSemanticErros += 1;
  }
}

void defineDataType() {
	strcpy(dataType, yytext);
}

int main (int argc, char *argv[]) {
		/* yylex();  */
    return begin();
}

void yyerror(const char* msg) {
  handleError(msg);
}