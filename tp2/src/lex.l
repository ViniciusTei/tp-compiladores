%{
    #include "y.tab.h"
    int countn=0;
    int line_number = 1; 
%}

line .*\n  
%option yylineno
alpha [a-zA-Z]
digit [0-9]

%%

"pespcrepva"                    { printf("%s", yytext);return PRINTFF; }
"plepia"                     { printf("%s", yytext);return SCANFF; }
"pinpteipro"                       { printf("%s", yytext);return INT; }
"prepal"                     { printf("%s", yytext);return FLOAT; }
"pcaprapcptepre"                      { printf("%s", yytext);return CHAR; }
"pvapzipo"                      { printf("%s", yytext);return VOID; }
"preptoprpne"                    { printf("%s", yytext);return RETURN; }
"preppipta"	                    { printf("%s", yytext);return FOR; }
"pse"	                    { printf("%s", yytext);return IF; }
"psepnao"	                    { printf("%s", yytext);return ELSE; }
"pverpdapdeipro"                      { printf("%s", yytext);return TRUE; }
"pfalpso"                     { printf("%s", yytext);return FALSE; }
"penpquanpto"                     { printf("%s", yytext);return WHILE; }
[-]?{digit}+                { printf("%s", yytext);return NUMBER; }
[-]?{digit}+\.{digit}{1,6}  { printf("%s", yytext);return FLOAT_NUM; }
{alpha}({alpha}|{digit})*   { printf("%s", yytext);return ID; }
"<="                        { printf("%s", yytext);return LE; }
">="                        { printf("%s", yytext);return GE; }
"=="                        { printf("%s", yytext);return EQ; }
"!="                        { printf("%s", yytext);return NE; }
">"	                    { printf("%s", yytext);return GT; }
"<"	                    { printf("%s", yytext);return LT; }
"&&"	                    { printf("%s", yytext);return AND; }
"||"	                    { printf("%s", yytext);return OR; }
"+"                         { printf("%s", yytext);return ADD; }
"-"                         { printf("%s", yytext);return SUBTRACT; }
"/"                         { printf("%s", yytext);return DIVIDE; }
"*"                         { printf("%s", yytext);return MULTIPLY; }
\/\/.*                      { printf("%s", yytext); }
\/\*(.*\n)*.*\*\/           { printf("%s", yytext); } 
[ \t]*                      { printf("%s", yytext); }
[\n]                        { printf("\n%10d\t", yylineno);countn++; }
.	                    { printf("%s", yytext);return *yytext; }
["].*["]                    { printf("%s", yytext);return STR; }
['].[']                     { printf("%s", yytext);return CHARACTER; }
{line} { printf("%10d %s", line_number++, yytext); } 
%% 

int yywrap() {
    /* return 1; */
}