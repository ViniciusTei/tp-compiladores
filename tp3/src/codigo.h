#ifndef codigo
#define codigo

#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#define MAX_CODE_TAM 900
#define MAX_CODE_STR_LEGNTH 12

typedef struct Quadruple {
  char op[MAX_CODE_STR_LEGNTH];
  char arg1[MAX_CODE_STR_LEGNTH];
  char arg2[MAX_CODE_STR_LEGNTH];
  char result[MAX_CODE_STR_LEGNTH];
} Quadruple;

enum Conditionals {
  ifElse,
  forStatment,
  whileStatment
} Conditionals;

int tempReg; //inteiro que vai ajudar a definir as variaveis temporarias
int regEnd; //endereco das intrucoes
int actualConditional;

typedef struct ThreeAdd {
  char three_address_table[MAX_CODE_TAM][MAX_CODE_STR_LEGNTH];
  int last;
} ThreeAdd;

ThreeAdd intermadiateCode;

void createFileOutput();

#endif