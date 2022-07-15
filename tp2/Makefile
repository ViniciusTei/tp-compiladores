#Nome do programa
TARGET = a.out

#diretorios dos arquivos
SRC = ./src

#compilador
CC = gcc

LEX =	flex
YACC = yacc

lex:
	$(LEX) ./src/lex.l
	$(YACC) -v -d ./src/yacc.y
	$(CC) y.tab.c ./src/tabela.c 
	./$(TARGET) < ./src/test/entrada1.c
	./$(TARGET) < ./src/test/entrada2.c