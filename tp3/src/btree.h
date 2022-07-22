/*
* Implementacao baseada no livro do Nivio Ziviani
* http://www2.dcc.ufmg.br/livros/algoritmos/cap5/codigo/c/5.4a5.10-arvorebinaria.c
*/

#ifndef btree
#define btree
#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <sys/time.h>
#define MAX  10

typedef struct TipoRegistro {
  void *Chave;
} TipoRegistro;
typedef struct TipoNo * TipoApontador;
typedef struct TipoNo {
  TipoRegistro Reg;
  TipoApontador Esq, Dir;
} TipoNo;

void inicializaBTree(TipoApontador *tree);
TipoApontador Insere(char *token, TipoApontador *left, TipoApontador *right);

#endif