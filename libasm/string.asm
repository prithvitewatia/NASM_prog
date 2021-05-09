;Custom Assembly file for string utilities
;========================================

;--subroutine: strlen
;Calculates the length of string to be displayed
strlen:
    push    ebx             ;Storing the value in ebx
    mov     ebx,    eax     ;Copying the message in the ebx register
nextchar:
    cmp     byte[eax],0     ;Checking if we have read the whole string
    jz      finished        ;If yes go to finished
    inc     eax             ;If not read the next character
    jmp     nextchar
finished:
    sub     eax,    ebx     ;Calculating the length of string and storing it in eax
    pop     ebx
    ret
;--subroutine: sprint
;Displays a string on STDOUT
sprint:
    push    edx
    push    ecx
    push    ebx
    push    eax
    call    strlen          ;calling strlen to calculate the length of string

    mov     edx,    eax     ;Saving the length of string in edx
    pop     eax             ;before calling strlen eax used to contain the msg
    mov     ecx,    eax     ;Storing the message in ecx register
    mov     ebx,    1       ;Writing to STDOUT
    mov     eax,    4       ;Invoking SYS_WRITE
    int     80h
    pop     ebx
    pop     ecx
    pop     edx
    ret
;--subroutine: sprintLF
;Displays a string on STDOUT and prints linefeed character in the end
sprintLF:
    call    sprint          ;Printing the message on STDOUT
    push    eax             ;Saving the value in eax
    mov     eax,    0Ah     ;Adding Linefeed caharcter to be printed
    push    eax             ;saving the linefeed character for printing
    mov     eax,    esp     ;copying the stack pointer into eax
    
    call    sprint          ;Printing the linefeed character
    pop     eax             ;Removing the linefeed character
    pop     eax             ;retrieving the original value of eax
    ret
