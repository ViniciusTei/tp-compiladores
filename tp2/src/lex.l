%{
    #include "y.tab.h"
    int countn=0;

%}

%option yylineno

alpha [a-zA-Z]
digit [0-9]

%%

"pespcrepva"                    { return PRINTFF; }
"plepia"                     { return SCANFF; }
"pinpteipro"                       { return INT; }
"prepal"                     { return FLOAT; }
"pcaprapcptepre"                      { return CHAR; }
"pvapzipo"                      { return VOID; }
"preptoprpne"                    { return RETURN; }
"preppipta"	                    { return FOR; }
"pse"	                    { return IF; }
"psepnao"	                    { return ELSE; }
"pverpdapdeipro"                      { return TRUE; }
"pfalpso"                     { return FALSE; }
"penpquanpto"                     { return WHILE; }
[-]?{digit}+                { return NUMBER; }
[-]?{digit}+\.{digit}{1,6}  { return FLOAT_NUM; }
{alpha}({alpha}|{digit})*   { return ID; }
"<="                        { return LE; }
">="                        { return GE; }
"=="                        { return EQ; }
"!="                        { return NE; }
">"	                    { return GT; }
"<"	                    { return LT; }
"&&"	                    { return AND; }
"||"	                    { return OR; }
"+"                         { return ADD; }
"-"                         { return SUBTRACT; }
"/"                         { return DIVIDE; }
"*"                         { return MULTIPLY; }
\/\/.*                      { ; }
\/\*(.*\n)*.*\*\/           { ; } 
[ \t]*                      { ; }
[\n]                        { countn++; }
.	                    { return *yytext; }
["].*["]                    { return STR; }
['].[']                     { return CHARACTER; }

%% 


int yywrap() {
	return 1;
}