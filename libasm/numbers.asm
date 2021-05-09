;Custom assembly file for numbers
;================================

SECTION     .data
number      times 10 db 0    ;32 bit integer can have at

;--subroutine: iprint
;Displays an integer on STDOUT
iprint:
    push    eax         ;Saving the values in different registers
    push    ecx
    push    edx
    push    esi
    mov     ecx,    0   ;Counting how many bytes we need to print in the end

divideloop:
    inc     ecx         ;Count each byte to print-The number of characters
    mov     edx,    0   ;empty  edx
    mov     esi,    10  ;mov 10 into esi
    idiv    esi         ;Divide eax by esi
    add     edx,    48  ;Coverting edx to ascii, edx holds rem after div
    push    edx
    cmp     eax,    0   ;Can the number be divided anymore
    jnz     divideloop

printloop:
    dec    ecx          ;Count down each byte that we put on the stack
    mov    eax,     esp ;mov the stack pointer into eax for printing
    call   sprint       ;Printing the current digit
    pop    eax          ;Remove the last character form stack to move esp forward
    cmp    ecx,     0   ;Checking if we printed all bytes we pushed onto the stack
    jnz     printloop

    pop    esi
    pop    edx
    pop    ecx
    pop    eax
    ret

;--subroutine: iprintLF
;Displays an integer with linefeed character
iprintLF:
    call    iprint      ;Pritning the number
    push    eax         ;Saving the value in eax
    mov     eax,    0Ah;Adding new line character to eax
    push    eax
    mov     eax,    esp;Moving stack pointer into eax
    call    sprint      ;Printing the lifefeed character
    pop     eax         ;Removing the linefeed character
    pop     eax         ;Restoring original message
    ret

;--subroutine: atoi
; Converts Ascii to integer
atoi:
    push    ebx             ; preserve ebx on the stack to be restored after function runs
    push    ecx             ; preserve ecx on the stack to be restored after function runs
    push    edx             ; preserve edx on the stack to be restored after function runs
    push    esi             ; preserve esi on the stack to be restored after function runs
    mov     esi, eax        ; move pointer in eax into esi (our number to convert)
    mov     eax, 0          ; initialise eax with decimal value 0
    mov     ecx, 0          ; initialise ecx with decimal value 0
 
.multiplyLoop:
    xor     ebx, ebx        ; resets both lower and uppper bytes of ebx to be 0
    mov     bl, [esi+ecx]   ; move a single byte into ebx register's lower half
    cmp     bl, 48          ; compare ebx register's lower half value against ascii value 48 (char value 0)
    jl      .finished       ; jump if less than to label finished
    cmp     bl, 57          ; compare ebx register's lower half value against ascii value 57 (char value 9)
    jg      .finished       ; jump if greater than to label finished
 
    sub     bl, 48          ; convert ebx register's lower half to decimal representation of ascii value
    add     eax, ebx        ; add ebx to our interger value in eax
    mov     ebx, 10         ; move decimal value 10 into ebx
    mul     ebx             ; multiply eax by ebx to get place value
    inc     ecx             ; increment ecx (our counter register)
    jmp     .multiplyLoop   ; continue multiply loop
 
.finished:
    cmp     ecx, 0          ; compare ecx register's value against decimal 0 (our counter register)
    je      .restore        ; jump if equal to 0 (no integer arguments were passed to atoi)
    mov     ebx, 10         ; move decimal value 10 into ebx
    div     ebx             ; divide eax by value in ebx (in this case 10)
 
.restore:
    pop     esi             ; restore esi from the value we pushed onto the stack at the start
    pop     edx             ; restore edx from the value we pushed onto the stack at the start
    pop     ecx             ; restore ecx from the value we pushed onto the stack at the start
    pop     ebx             ; restore ebx from the value we pushed onto the stack at the start
    ret

;--Subroutine: int2str
;Converts an integer to string so that