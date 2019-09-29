%{
    #include<stdio.h>
    #include <stdlib.h>
    extern FILE *yyin;
    int yylex();
    int yyerror();
%}

%token LI_START_TAG OL_START_TAG UL_START_TAG LI_END_TAG OL_END_TAG UL_END_TAG LETTERS
%%
start: tag {
    printf("Accepted\n");
    exit(1);
};
tag: ul | ol
;
ul: UL_START_TAG nesting UL_END_TAG 
;
ol: OL_START_TAG nesting OL_END_TAG
;
li: LI_START_TAG innerLi LI_END_TAG
;
innerLi: tag |
;
nesting: tag | li nesting |
;
%%

int main() {
    yyin = fopen("test.html", "r");
    yyparse();
    return 1;
}

int yyerror() {
    printf("Invalid syntax\n");
    return 0;
}