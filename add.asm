;A program to add command line integer arguments

%include    'libasm/numbers.asm'
%include    'libasm/string.asm'
%include    'libasm/system.asm'

SECTION     .text
global      _start
_start:
    pop     ecx             ;Discarding the number of arguments
    pop     edx             ;Discarding the name of the program

    dec     ecx             ;decreasing the number of arguments
                            ;As the name of program is removed
    mov     edx,    0       ;Setting edx to 0 to store additions

.nextArg:
    cmp     ecx,    0       ;Checking for presence of any more arguments
    jz      .noADDarg        ;If not display the sum
    pop     eax             ;Reading the argument
    call    atoi            ;Converting the arguments to integer
    add     edx,    eax     ;Adding the argument to edx
    dec     ecx             ;Decreasing the number of remaining arguments
    jmp     .nextArg         ;trying to read the next argument

.noADDarg:
    mov     eax,    edx     ;Copying the result in eax for printing
    call    iprintLF        ;Printing the result
    call    quit            ;Exit the program after displaying the result