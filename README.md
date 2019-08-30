# minimal-flex-bison-dlang
Minimal Flex/Bison integration with D

### The current setup includes:

- a super-basic lexer (lexer.l)
- a super-basic parser (parser.y)
- the entry D file (app.d) to stitch it all together
- a simple Bash script (make.sh) to compile everything, without superfluous commands or ultra-complicated Makefiles

Basically, all you have to do to get started is run `make.sh` and then `./app` to see the result.

Have fun! ;-)

