LEX = flex
CFLAGS = -O3
LDFLAGS = -lfl
CC = gcc

all:
	$(LEX) scanner.l
	$(CC) $(CFLAGS) -c lex.yy.c
	$(CC) $(CFLAGS) -c main.c
	$(CC) $(CFLAGS) -o scanner main.o lex.yy.o $(LDFLAGS)

clean:
	rm -f *.o scanner lex.yy.c
