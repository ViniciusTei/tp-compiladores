%{
  /* definicoes de constantes */
%}

%option noyywrap 
/* definicoes regulares */

white_space [ \t\n]+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*
function_call {letter}+\(.*\)\;
function_def {letter}+{letter}+\(.*\)\{

%%
pnupmepral | //numeral pnupmepral
pleptra | //letra pleptra
penpquanpto | //enquanto penpquanpto
preppipta | //repita preppipta
objeto | //
defina |
se |
pare |
continue |
vazio |
retorne |
entao |
senao                     {printf("\nFoi encontrado uma palavra reservada. LEXEMA: %s", yytext);}
{function_call}           {printf("\nFoi encontrado uma chamada de funcao. LEXEMA: %s", yytext);}
{function_def}            {printf("\nFoi encontrado uma declaracao de funcao. LEXEMA: %s", yytext);}
{white_space}             {/*nao faz nada*/}
. 
%%

/* definicios de metodos auxiliares */

int main(void) 
{ 
    /* Call the lexer, then quit. */ 
    yylex(); 
    printf("\n");
    return 0; 
}