import std.stdio;
import std.string;

extern (C) struct yy_buffer_state;
extern (C) int yyparse();
extern (C) yy_buffer_state* yy_scan_string(const char*);
extern (C) yy_buffer_state* yy_scan_buffer(char *, size_t);
extern (C) extern __gshared FILE* yyin;
extern (C) extern __gshared const(char)* yyfilename;

extern (C) extern __gshared int yylineno;

void main() {
	writeln("Parsing input");
	yylineno = 0;

	try 
	{
		string input = "some_id 10\nanother_id";

		yy_scan_buffer(cast(char*)(toStringz(input~'\0')),input.length+2);

		yyparse();
	}
	catch (Exception e)
	{
		writeln("Some error");
	}
	writeln("done");


}