;A fizzbuzz program in assembly
;Prints fizz if the number is divisible by 3
;Prints buzz if the number is divisible by 5
;Prints fizzbuzz if the number is divisible by 15
;The current program only prints value upto 100

%include    'libasm/numbers.asm'
%include    'libasm/string.asm'
%include    'libasm/system.asm'

SECTION     .data
fizz        db          'fizz',0h   ;Message fizz
buzz        db          'buzz',0h   ;Message buzz

SECTION     .text
global      _start
_start:
    mov     ecx,    0               ;Counter = 0
    mov     esi,    0               ;esi,edi are boolean variable 
    mov     edi,    0

.nextNum:
    inc     ecx

.checkFIZZ:
    mov     edx,    0               ;edx holds remainder after div
                                    ;Must be zero before division
    mov     eax,    ecx             ;Copying value for division
    mov     ebx,    3               ;Storing 3 for division
    div     ebx                     ;Dividing by 3
    mov     edi,    edx             ;copying the remainder into edi
    cmp     edi,    0
    jne     .checkBUZZ              ;If number not divisible by 3
                                    ;check it is divisible by 5
    mov     eax,    fizz            ;If number is divisible print fizz
    call    sprint

.checkBUZZ:
    mov     edx,    0
    mov     eax,    ecx
    mov     ebx,    5
    div     ebx
    mov     esi,    edx             ;storing the remainder of this division in esi
    cmp     esi,    0               ;Check if divisible by 5
    jne     .checkInt               ;If not div by 5 continue to the next num
    mov     eax,    buzz            ;If divisible print buzz
    call    sprint

.checkInt:
    cmp     edi,    0               ;Checking if number was divisible by 3
    je      .continue               ;If yes print LF and go to next number
    cmp     esi,    0               ;Checking if number was divisible by 5
    je      .continue               ;If yes printLF and go to the next number
    mov     eax,    ecx             
    call    iprint                  ;Printing the current value

.continue:
    mov     eax,   0Ah              ;Pushing the linefeed character for printing
    push    eax
    mov     eax,    esp             ;moving the stack pointer to our LF character
    call    sprint
    pop     eax
    cmp     ecx,    100             ;Checking if the current number is 100
    jne     .nextNum                ;If not go the the next number
    call    quit                    ;If yes exit the program