lex lexer.l
bison -d parser.y
gcc lex.yy.c -c
gcc parser.tab.c -c
dmd -c app.d
dmd lex.yy.o parser.tab.o app.o -ofapp -m64
