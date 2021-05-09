;A program to print the factorial of the argument
;Largest factorial that can be computed is 12!
;This is because of the size limit of 32 bit

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
    push    ebx             ;saving the value of ebx register
    mov     ebx,    eax     ;Storing the value register for later comparison
    mov     eax,    1       ;eax will store the result
    mov     ecx,    1       ;ecx will store the product number

.nextNum:
    mul     ecx             ;eax=eax*ecx
    inc     ecx             ;ecx+=1
    cmp     ecx,    ebx     ;checking if current value is less than argument supplied
    jg      .finished       ;If not display the result
    jmp     .nextNum        ;if yes multiply next number

.finished:
    call    iprintLF        ;Displaying the result
    pop     ebx             ;Restoring the value
    call    quit            ;exiting the program