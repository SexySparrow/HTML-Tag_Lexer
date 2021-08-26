/* Brabete Adrian 334CC*/

%{
int indentare = 0;
%}
litere [A-Za-z]
atribut [A-Za-z:]
valuare "\""[^<>\"]*"\""
tag_ignor "<!"|"<?"
inchidere_tag_ignor ">"
tag_normal "<"[ ]* 
inchidere_tag "</"[^<>]*">"|"/>"
intre_tag ">"[^<]*"<"


%x IGNOR TAG ATRIBUT INCHIDERE

%%

    /* tag uri care incep cu <? si <! sunt ignorate */
<INITIAL>{tag_ignor}          {BEGIN(IGNOR);}
<IGNOR>[^>]*                  {}
<IGNOR>{inchidere_tag_ignor} {BEGIN(0);}

    /* TAG uri */
<INITIAL>{tag_normal}          {printf("\n"); indentare++; BEGIN(TAG);}
<TAG,INITIAL>{inchidere_tag}   {indentare--;}
<TAG>{tag_normal}              {indentare++;}
<TAG>">"                       {}
    /* indentarea TAG urilor */
<TAG>[^>< ]*                    {
                                for (int i = 0; i < indentare; i++)
                                    printf(" ");

                                if (yytext[yyleng - 1] == '/')
                                    yytext[yyleng - 1] = ' ';
                                
                                printf("%s", yytext);
                                }
<TAG>" "+{litere}               {printf(" ::"); BEGIN(ATRIBUT); REJECT;}

    /* ATRIBUTE  */
<ATRIBUT>" "                   {}
<ATRIBUT>{atribut}+            {printf(" %s", yytext);}
    /* inlocuim egal ul cu : */
<ATRIBUT>"="                   {printf(" :");}
    /* inlocuim "" cu ' '*/
<ATRIBUT>{valuare}             {yytext[0] = ' ';
                                yytext[yyleng - 1] = ' ';
                                printf("%s", yytext);
                                BEGIN(INCHIDERE);}
<ATRIBUT>">"                   {yyless(yyleng-1); BEGIN(0);}
<ATRIBUT>"<"                   {yyless(yyleng-1); BEGIN(0);}

    /* afisam ; intre atribute */
<INCHIDERE>" "+[^>]            {printf(";"); BEGIN(ATRIBUT); REJECT;}
<INCHIDERE>">"                 {printf(";"); BEGIN(0);}

    /* renuntam la caracterele care nu corespund unor reguli*/
<INITIAL,IGNOR,TAG,ATRIBUT>{intre_tag} {yyless(yyleng - 1); BEGIN(0);}
.|\n
%%

main() { 
	yylex();
    printf("\n");
}

