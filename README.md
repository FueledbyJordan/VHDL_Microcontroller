# VHDL Microcontroller Project

This code simulates a microcontroller processor as specified in the included requirements.

This code was written and is maintained by:
* [D. Jordan Murray](https://github.com/fueledbyjordan)
* [John Humphries](https://github.com/jhumph30)
* [Roy Helms](https://github.com/rmh10)
* [Logan Mayhew](https://github.com/Axelian)
* [Sreng Heng](https://github.com/sreng8)

## To Use The Assembler
The file that holds the assembly instructions is .src/instructions.asm
The file that holds the data in memory is .src/Nums_To_Add.txt
These files can be edited to the end user's liking.  The code is assembled by running the following command.

```shell
python assembler.py > Source/Memory.vhd 
```

The user should then include the file Memory.vhd into the project directory.  The user should then run the simulation.
