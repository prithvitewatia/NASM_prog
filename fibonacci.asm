;A program to print Fibonacci numbers upto or less than than
;the argument provided. Starting number is 1

%include    'libasm/numbers.asm'
%include    'libasm/string.asm'
%include    'libasm/system.asm'

SECTION     .text
global      _start
_start:
    pop     ecx             ;Discarding the number of arguments
                            ;as we expect only 1 arg other than program name
    pop     edx             ;Discarding the name of the program
    pop     eax             ;Storing the actual argument in the Accumulator (eax)
    call    atoi            ;Converting the argument to integer
    mov     edx,    eax     ;Storing the value in data register for later comparison
    mov     eax,    1       ;Starting number
    call    iprintLF        ;Printing 1
    call    iprintLF        ;Again printing 1 to begin sequence
    mov     ebx,    eax     ;Starting the sequence
    mov     ecx,    eax
.nextFib:
    add     ebx,    ecx     ;Adding the previously generated numbers(r=x+y)
    mov     eax,    ebx     ;Add to accumulator for printing
    cmp     eax,    edx     ;Comparing if the current sum is greater than argument supplied
    jg      .finished       ;If yes then dont print any more
    call    iprintLF
    mov     ebx,    ecx     ;x=y
    mov     ecx,    eax     ;y=r
    cmp     ecx,    edx     ;Comparing the current number with the argument
    jmp     .nextFib        ;Checking the next number
.finished:
    call    quit            ;exiting the program