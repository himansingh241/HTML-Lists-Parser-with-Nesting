%{
    #include"y.tab.h"
%}

liStartTag         "<li>"
olStartTag         "<ol>"
ulStartTag         "<ul>"
liEndTag         "</li>"
olEndTag         "</ol>"
ulEndTag         "</ul>"
ws               [\r\n\t ]

%%
{liStartTag} {
    return LI_START_TAG;
}

{olStartTag} {
    return OL_START_TAG;
}

{ulStartTag} {
    return UL_START_TAG;
}

{liEndTag} {
    return LI_END_TAG;
}

{olEndTag} {
    return OL_END_TAG;
}

{ulEndTag} {
    return UL_END_TAG;
}

{ws} ;
. ;
%%

int yywrap() {
    return 1;
}