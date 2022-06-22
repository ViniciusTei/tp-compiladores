%{
  /* definicoes de constantes */
%}

%option noyywrap 
/* definicoes regulares */

white_space [ \t\n]+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*

%%
parpquipvo      |
pcaprapcptepre  |
pcapso          |
pe              |
penpquanpto     |
penptao         |
pespcoplha      |
pespcrepva      |
pfapca          |
pfalpso         |
pfunpcao        |
pinpteipro      |
pinpterprompa   |
plepia          |
plopgipco       |
pmod            |
pnapo           |
pou             |
pouptropcapso   |
ppapra          |
ppapspso        |
ppaupsa         |
prepal          |
preppipta       |
preptoprpne     |
pse             |
psepnao         |
pveptor         |
pverpdapdeipro            {printf("\nFoi encontrado uma palavra reservada. LEXEMA: %s", yytext);}
{id}                      {printf("\nFoi encontrado um identificador. LEXEMA: %s", yytext);}
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