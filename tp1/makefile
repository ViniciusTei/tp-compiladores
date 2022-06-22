#Nome do programa
TARGET = a.out

#diretorios dos arquivos
SRC = ./src

#compilador
CC = gcc

LEX =	flex

lex:
	$(LEX) $(SRC)/lex/lex.l
	$(CC) lex.yy.c
	./$(TARGET) < $(SRC)/input/entrada.txt
