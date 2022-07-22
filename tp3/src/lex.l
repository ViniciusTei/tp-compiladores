%{
    #include "y.tab.h"
    int countn=0;
    int line_number = 1; 
%}
 
%option yylineno
alpha [a-zA-Z]
digit [0-9]

%%

"pespcrepva"                    { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return PRINTFF; }
"plepia"                     { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return SCANFF; }
"pinpteipro"                       { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return INT; }
"prepal"                     { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return FLOAT; }
"pcaprapcptepre"                      { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return CHAR; }
"pvapzipo"                      { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return VOID; }
"preptoprpne"                    { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return RETURN; }
"preppipta"	                    { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return FOR; }
"pse"	                    { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return IF; }
"psepnao"	                    { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return ELSE; }
"pverpdapdeipro"                      { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return TRUE; }
"pfalpso"                     { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return FALSE; }
"penpquanpto"                     { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return WHILE; }
[-]?{digit}+                { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return NUMBER; }
[-]?{digit}+\.{digit}{1,6}  { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return FLOAT_NUM; }
{alpha}({alpha}|{digit})*   { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return ID; }
"<="                        { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return LE; }
">="                        { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return GE; }
"=="                        { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return EQ; }
"!="                        { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return NE; }
">"	                    { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return GT; }
"<"	                    { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return LT; }
"&&"	                    { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return AND; }
"||"	                    { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return OR; }
"+"                         { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return ADD; }
"-"                         { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return SUBTRACT; }
"/"                         { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return DIVIDE; }
"*"                         { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return MULTIPLY; }
\/\/.*                      { printf("%s", yytext); }
\/\*(.*\n)*.*\*\/           { printf("%s", yytext); } 
[ \t]*                      { printf("%s", yytext); }
[\n]                        { printf("\n%10d\t", yylineno);countn++; }
.	                    { printf("%s", yytext);return *yytext; }
["].*["]                    { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return STR; }
['].[']                     { printf("%s", yytext);strcpy(yylval.lexval.name,(yytext));return CHARACTER; }
%% 


int yywrap() {
    /* return 1; */
}