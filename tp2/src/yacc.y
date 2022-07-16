%{
    #include "./src/lib.h"

    void insert_type();

    char type[18];
%}

%token VOID CHARACTER PRINTFF SCANFF INT FLOAT CHAR FOR IF ELSE TRUE FALSE NUMBER FLOAT_NUM ID LE GE EQ NE GT LT AND OR STR ADD MULTIPLY DIVIDE SUBTRACT UNARY RETURN 

%%

program: main '(' ')' '{' body return '}'
;

main: datatype ID { add(&st, 'F', yylineno, type, yytext); }
;

datatype: INT { insert_type(); }
| FLOAT { insert_type(); }
| CHAR { insert_type(); }
| VOID { insert_type(); }
;

body: FOR { add(&st, 'K', yylineno, type, yytext); } '(' statement ';' condition ';' statement ')' '{' body '}'
| IF { add(&st, 'K', yylineno, type, yytext); } '(' condition ')' '{' body '}' else
| statement ';'
| body body 
| PRINTFF { add(&st, 'K', yylineno, type, yytext); } '(' STR ')' ';'
| SCANFF { add(&st, 'K', yylineno, type, yytext); } '(' STR ',' '&' ID ')' ';'
;

else: ELSE { add(&st, 'K', yylineno, type, yytext); } '{' body '}'
|
;

condition: value relop value 
| TRUE { add(&st, 'K', yylineno, type, yytext); }
| FALSE { add(&st, 'K', yylineno, type, yytext); }
|
;

statement: datatype ID { add(&st, 'V', yylineno, type, yytext); } init
| ID '=' expression
| ID relop expression
| ID UNARY
| UNARY ID
;

init: '=' value
|
;

expression: expression arithmetic expression
| value
;

arithmetic: ADD 
| SUBTRACT 
| MULTIPLY
| DIVIDE
;

relop: LT
| GT
| LE
| GE
| EQ
| NE
;

value: NUMBER { add(&st, 'C', yylineno, type, yytext); }
| FLOAT_NUM { add(&st, 'C', yylineno, type, yytext); }
| CHARACTER { add(&st, 'C', yylineno, type, yytext); }
| ID
;

return: RETURN { add(&st, 'K', yylineno, type, yytext); } value ';'
|
;

%%
void insert_type() {
	strcpy(type, yytext);
}

int main () {
    return begin();
}

void yyerror(const char* msg) {
  handleError(msg);
}