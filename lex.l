%{
    #include"y.tab.h"
%}

liStartTag         "<li"
olStartTag         "<ol"
ulStartTag         "<ul"
closeTag            ">"
liEndTag         "</li>"
olEndTag         "</ol>"
ulEndTag         "</ul>"
ws               [\r\n\t ]
compact          " compact"
reversed         " reversed"
start            " start="
value            " value="
olattr           {compact}|{reversed}|{start}|{type}
ulattr           {compact}|{reversed}|{start}|{type}
liattr           {value}

%%
{liStartTag}(({value}\"[0-9]+\")?)*{closeTag} {
    return LI_START_TAG;
}

{olStartTag}(({reversed}|({start}\"[0-9]+\")|{compact})?)*{closeTag} {
    return OL_START_TAG;
}

{ulStartTag}{closeTag} {
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