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
	$(CC) lex.yy.c y.tab.c ./src/tabela.c ./src/lib.c ./src/btree.c ./src/codigo.c
	
test:
	./$(TARGET) < ./src/test/entrada1.p

test2:
	./$(TARGET) < ./src/test/entrada2.p

test3:
	./$(TARGET) < ./src/test/entrada3.p