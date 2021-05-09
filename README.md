**Nasm Programs**
These are some of the assembly programs I wrote while learning  
nasm. All program are for 32 bit.  


**Compiling the programs**
Use the makefile to build the program.  
Use ```make program-name.out``` to build a particular program.  
Use ```make all``` to build all the programs.

Note: The programs build with makefile will not work on Windows.  
Use the following instructions instead  
```
nasm -f elf program-name.asm
ld -m elf i_386 program-name.o -o program-name

```

**Todo**:
    Programs
        sum of series:
            1. linear
            2. Quadratic
            3. Cubic
   LibFunctions
        Implement library functions
            1. trignomeric functions