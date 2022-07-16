%{
    #include "./src/lib.h"

    void defineDataType();

    char dataType[18];
%}

%token VOID CHARACTER PRINTFF SCANFF INT FLOAT CHAR FOR IF ELSE TRUE FALSE NUMBER FLOAT_NUM ID LE GE EQ NE GT LT AND OR STR ADD MULTIPLY DIVIDE SUBTRACT UNARY RETURN WHILE

%%

begin: main '(' ')' '{' body return '}'
;

main: datatype ID { addToSymbolTable(&st, FUNCT, yylineno, dataType, yytext); }
;

datatype: INT { defineDataType(); }
| FLOAT { defineDataType(); }
| CHAR { defineDataType(); }
| VOID { defineDataType(); }
;

body: FOR { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '(' statement ';' condition ';' statement ')' '{' body '}'
| IF { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '(' condition ')' '{' body '}' else
| statement ';'
| body body 
| PRINTFF { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '(' STR ')' ';'
| SCANFF { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '(' STR ',' '&' ID ')' ';'
| WHILE { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '(' condition ')' '{' body '}'
;

else: ELSE { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } '{' body '}'
|
;

condition: value relop value 
| TRUE { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); }
| FALSE { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); }
|
;

statement: datatype ID { addToSymbolTable(&st, IDTYPE, yylineno, dataType, yytext); } init
| ID '=' expression
| ID relop expression
;

init: '=' value
|
;

expression: expression arithmetic expression
| value
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
| ID
;

return: RETURN { addToSymbolTable(&st, KEYWORD, yylineno, dataType, yytext); } value ';'
|
;

%%

void defineDataType() {
	strcpy(dataType, yytext);
}

int main (int argc, char *argv[]) {

    return begin();
}

void yyerror(const char* msg) {
  handleError(msg);
}