#include "codigo.h"

void createFileOutput() {
  FILE *arq;

  arq = fopen("intermediate-code-thrre-address.txt", "w");

  if (arq == NULL) exit(1);

  printf("\n\nCodigo de tres enderecos gerado: \n");

  for (int i = 0; i < intermadiateCode.last; i++) {
    printf("%s",intermadiateCode.three_address_table[i]);
    fprintf(arq, "%s", intermadiateCode.three_address_table[i]);
  }

  fclose(arq);
}