%{
/*******************************************
   Minimal Flex/Bison Integration
   with D
	
   The Lexer
 *******************************************/

/****************************************
 Includes
 ****************************************/

#include <stdio.h>
#include "parser.tab.h"

/****************************************
 Extern & Forward declarations
 ****************************************/

void yyerror(const char* str);
void count();

%}

/****************************************
 Options
 ****************************************/

%option yylineno

/****************************************
 Building blocks
 ****************************************/

DIGIT				[0-9]
DIGIT_HEX			[a-fA-F0-9]
DIGIT_BIN			[01]
LETTER				[a-zA-Z]
LETTER_OR_USCORE	[a-zA-Z_]

/****************************************
 Tokens
 ****************************************/
%%

{LETTER_OR_USCORE}({LETTER_OR_USCORE}|{DIGIT})*		{ count(); return ID; }
{DIGIT}+											{ count(); return NUMBER; }

[ \t\v\n\f]+                						{ count(); /* ignore whitespace */ }
.													{ count(); /* ignore it */ } 
%%

/****************************************
 Functions
 ****************************************/

int yycolumn = 0;

void count()
{
	int i;
	
	for (i = 0; yytext[i] != '\0'; i++)
	{
		if (yytext[i] == '\n') yycolumn = 0;
		else if (yytext[i] == '\t') yycolumn += 8 - (yycolumn % 8);
		else yycolumn++;
	}

	//ECHO;
	yylval.str=strdup(yytext);
}

void yyerror(const char *str)
{
	fprintf(stderr,"Syntax error @ line %d : %s\n",yylineno,str);
	
	exit(0);
}

/****************************************
  This is the end,
  my only friend, the end...
 ****************************************/
