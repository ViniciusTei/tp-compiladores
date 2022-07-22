%{
    #include "./src/lib.h"
    void defineDataType();
    char dataType[18];
%}

%token VOID CHARACTER PRINTFF SCANFF INT FLOAT CHAR FOR IF ELSE TRUE FALSE NUMBER FLOAT_NUM ID LE GE EQ NE GT LT AND OR STR ADD MULTIPLY DIVIDE SUBTRACT UNARY RETURN WHILE

%type <lexval> main body return datatype expression statement init value arithmetic relop begin

%%

begin: main '(' ')' '{' body return '}' {
  $1.node = Insere("main", $5.node, $6.node);
  $$.node = Insere("begin", $1.node, NULL);
  head = $$.node;
}
;

main: datatype ID { addToSymbolTable(&st, FUNCT, yylineno, dataType, yytext); }
;

datatype: INT { defineDataType(); }
| FLOAT { defineDataType(); }
| CHAR { defineDataType(); }
| VOID { defineDataType(); }
;

body: FOR { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '(' statement ';' condition ';' statement ')' '{' body '}' {
  TipoApontador temp = Insere("condition", $6.node, $8.node);
  TipoApontador temp2 = Insere("condition", $4.node, temp);
  $$.node = Insere($1.name, temp2, $11.node);
}
| IF { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '(' condition ')' '{' body '}' else {
  TipoApontador nodeIf = Insere($1.name, $4.node, $8.node);
  $$.node = Insere("if-else", nodeIf, $11.node);
}
| statement ';' {
  $$.node = $1.node;
}
| body body {
  $$.node = Insere("statments", $1.node, $2.node);
}
| PRINTFF { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '(' STR ')' ';' {
  $$.node = Insere("printf", NULL, NULL);
}
| SCANFF { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '(' STR ',' '&' ID ')' ';' {
  $$.node = Insere("scanf", NULL, NULL);
}
| WHILE { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '(' condition ')' '{' body '}' {
  $$.node = Insere($1.name, $4.node, $6.node);
}
;

else: ELSE { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '{' body '}' {
  $$.node = Insere($1.name, NULL, $4.node);
}
| { $$.node = NULL; }
;

condition: value relop value {
  $$.node = Insere($2.name, $1.node, $3.node);
}
| TRUE { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); $$.node = NULL; }
| FALSE { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); $$.node = NULL; }
| { $$.node = NULL; }
;

statement: datatype ID { addToSymbolTable(&st, IDTYPE, yylineno, dataType, yytext); } init {
  $2.node = Insere($2.name, NULL, NULL);
  $$.node = Insere("declaration", $2.node, $4.node);
}
| ID '=' expression {
  $1.node = Insere($1.name, NULL, NULL);
  $$.node = Insere("=", $1.node, $3.node);
}
| ID relop expression {
  $1.node = Insere($1.name, NULL, NULL);
  $$.node = Insere($2.name, $1.node, $3.node);
}
;

init: '=' value { $$.node = $2.node; }
| { $$.node = Insere("NULL", NULL, NULL); }
;

expression: expression arithmetic expression { $$.node = Insere($2.name, $1.node, $3.node); }
| value { $$.node = $1.node; }
;

arithmetic: ADD { addToSymbolTable(&st, OPERATOR, yylineno, dataType, yytext); }
| SUBTRACT { addToSymbolTable(&st, OPERATOR, yylineno, dataType, yytext); }
| MULTIPLY { addToSymbolTable(&st, OPERATOR, yylineno, dataType, yytext); }
| DIVIDE { addToSymbolTable(&st, OPERATOR, yylineno, dataType, yytext); }
;

relop: LT { addToSymbolTable(&st, OPERATOR, yylineno, dataType, yytext); }
| GT { addToSymbolTable(&st, OPERATOR, yylineno, dataType, yytext); }
| LE { addToSymbolTable(&st, OPERATOR, yylineno, dataType, yytext); }
| GE { addToSymbolTable(&st, OPERATOR, yylineno, dataType, yytext); }
| EQ { addToSymbolTable(&st, OPERATOR, yylineno, dataType, yytext); }
| NE { addToSymbolTable(&st, OPERATOR, yylineno, dataType, yytext); }
;

value: NUMBER { addToSymbolTable(&st, CONSTANT, yylineno, dataType, yytext); }
| FLOAT_NUM { addToSymbolTable(&st, CONSTANT, yylineno, dataType, yytext); }
| CHARACTER { addToSymbolTable(&st, CONSTANT, yylineno, dataType, yytext); }
| ID { $$.node = Insere($1.name, NULL, NULL); }
;

return: RETURN { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } value ';' {
  $1.node = Insere("return", NULL, NULL);
  $$.NODE = Insere("RETURN", $1.node, $3.node);
}
| { $$.node = NULL; }
;

%%

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