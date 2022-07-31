#include "btree.h"

void inicializaBTree(TipoApontador tree) {
  tree = NULL;
}

TipoApontador Insere(char *token, TipoApontador left, TipoApontador right) { 
  TipoApontador newnode = (TipoApontador) malloc(sizeof(TipoNo));
  newnode->Esq = left;
  newnode->Dir = right;
  newnode->Reg.Chave = strdup(token);

  return newnode;
}

void printBTree(TipoApontador tree) {
  if (tree->Esq) printBTree(tree->Esq);

  printf("%s, ", tree->Reg.Chave);

  if (tree->Dir) printBTree(tree->Dir);
}