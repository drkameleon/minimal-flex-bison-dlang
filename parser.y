%{
/*******************************************
   Minimal Flex/Bison Integration
   with D
	
   The Parser
 *******************************************/

/****************************************
 Extern & Forward declarations
 ****************************************/

extern void yyerror(const char* str);
extern int yyparse(void);
extern int yylex();

extern int yylineno;

/****************************************
 Functions
 ****************************************/ 
 
int yywrap()
{
	return 1;
} 

%}

/****************************************
 Definitions
 ****************************************/

%union 
{
	char* str;
	void* compo;
}

/****************************************
 Tokens & Types
 ****************************************/

%token <str> ID "id"
%token <str> NUMBER "number"

/****************************************
 Directives
 ****************************************/

%glr-parser
%locations
%define parse.error verbose

%start program
%%

/****************************************
 Grammar Rules
 ****************************************/

//==============================
// Building blocks
//==============================

statement 				: 	ID 			{ printf("found id\n"); }
						| 	NUMBER 		{ printf("found number\n"); }
						;

statements 				:	statements[previous] statement 									
							{ 
								printf("found another statement\n");
							}
						|	/* Nothing */																
							{ 
								printf("nothing\n");
							}
						;

//==============================
// Entry point
//==============================

program					:	statements 														
							{ 
								printf("found statements\n");
							}
						;

%%

/****************************************
  This is the end,
  my only friend, the end...
 ****************************************/
