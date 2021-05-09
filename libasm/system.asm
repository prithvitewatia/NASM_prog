;Custom system file for assembly programs
;========================================

;--subroutine: quit
;Exits the program
quit:
    mov     ebx,    0       ;Program completed successfully
    mov     eax,    1       ;Invoking SYS_EXIT
    int     80h
    ret