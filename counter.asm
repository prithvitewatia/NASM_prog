;This program is to print numbers from 1 to argument provided

%include    'libasm/numbers.asm'
%include    'libasm/string.asm'
%include    'libasm/system.asm'

SECTION     .text
global      _start
_start:
    pop     ecx             ;Discarding the number of arguments
    pop     edx             ;Discarding the name of the program

    pop     eax             ;eax contains the argument supplied
    call    atoi            ;Converting string argument to number
    mov     ebx,    eax     ;Storing the argument in ebx for later comparison
    mov     eax,    0       ;Start counting by setting eax to 0

nextnum:
    inc     eax
    call    iprintLF        ;printing the number
    cmp     eax,    ebx     ;Checking if current value is equal to argument supplied
    jnz     nextnum         ;If not print the next number
    call    quit            ;If yes, Exit the program
   