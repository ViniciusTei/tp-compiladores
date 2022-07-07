%{
  /* definicoes de constantes */
%}

%option noyywrap 
/* definicoes regulares */

white_space [ \t\n]+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*
line_comment \/\/.*
block_comment \/\*(({white_space}|{letter}|{digit}|.)*)\*\/
text ["]({letter}|{digit}|[ ])*["] 
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
pde         	|
papte         	|
pverpdapdeipro               {printf("\nFoi encontrado uma palavra reservada. LEXEMA: %s", yytext);}
penpquanpto     |
ppapra          |
preppipta       |
pde     		|
papte              			    {printf("\nFoi encontrado uma palavra de laço de repetição. LEXEMA: %s", yytext);}
pse 	   |
psepnao	   |
penptao    |
pespcoplha |
pcapso     					        {printf("\nFoi encontrado uma palavra condicional. LEXEMA: %s", yytext);}
"+"|"-"|"*"|"/"|"mod"|"^"   {printf("\nFoi encontrado um operador aritmetico. LEXEMA %s", yytext);}
"=="|"<"|">"|"<="|"=>"|"!=" {printf("\nFoi econtrado um operador relacional. LEXEMA %s", yytext);}
"("|")"|"{"|"}"|";"         {printf("\nFoi econtrado um delimitador. LEXEMA %s", yytext);}
{text}                      {printf("\nFoi econtrado um texto. LEXEMA %s", yytext);}
"pou"|"pe"|"pnapo"          {printf("\nFoi encontrado um operador logico. LEXEMA: %s", yytext);}
{id}                        {printf("\nFoi encontrado um identificador. LEXEMA: %s", yytext);}
{line_comment}              {printf("\nFoi encontrado um comentario de linha. LEXEMA %s", yytext);}
{block_comment}             {printf("\nFoi encontrado um comentario de bloco. LEXEMA %s", yytext);}
{white_space}               {/*nao faz nada*/}
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