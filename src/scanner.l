%{
#include <stdio.h>
#include "token_types.h"

int num_lines = 0;
int yylval;

%}
letter          [A-Za-z]
digit           [0-9]
ws              [ \t]+
newline         "\n"

error            .

%%

{ws}            { ;   /* do nothing with whitespace */ }
{newline}       { ++num_lines;  }

"//".*			{ /* do nothing with comment */  }
"/*"((("*"[^/])?)|[^*])*"*/" { /* do nothing with comment */ }

"int"			{ return INT; }
"float"			{ return FLOAT; }
"void"			{ return VOID; }
"if"			{ return IF; }
"else"			{ return ELSE; }
"while"			{ return WHILE; }
"for"			{ return FOR; }
"return"		{ return RETURN; }

{digit}+		{ yylval = atoi(yytext); return NUMBER; }

[a-zA-Z_][a-zA-Z0-9_]*	{ return ID; }

"="				{ return ASSIGN; }
"=="			{ return EQUAL; }
"!="			{ return NEQUAL; }
"<"				{ return LT; }
">"				{ return GT; }
"<="			{ return LEQUAL; }
">="			{ return GEQUAL; }
"+"				{ return PLUS; }
"-"				{ return MINUS; }
"*"				{ return MUL; }
"/"				{ return DIV; }

";"				{ return SEMICOLON; }
","				{ return COMMA; }
"("				{ return LPAREN; }
")"				{ return RPAREN; }
"{"				{ return LBRACE; }
"}"				{ return RBRACE; }

{error}         { return ERROR; }

%%
