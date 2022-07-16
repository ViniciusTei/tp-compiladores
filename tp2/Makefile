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
	$(CC) lex.yy.c y.tab.c ./src/tabela.c ./src/lib.c
	./$(TARGET) < ./src/test/entrada1.p
	./$(TARGET) < ./src/test/entrada2.p
	./$(TARGET) < ./src/test/entrada3.p