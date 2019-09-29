bison -yd .\yacc.y
flex .\lex.l
gcc .\lex.yy.c .\y.tab.c
.\a.exe