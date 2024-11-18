section .data
    string db "Atharva", 10       ; String to be converted to uppercase, newline character at the end
    len equ $ - string            ; Length of the string

section .text
    global _start

_start:
    lea ecx, [string]             ; Load the address of the string into ECX
    call toUpper                  ; Convert the string to uppercase
    call print                    ; Display the uppercase string

    mov eax, 60                   ; Exit system call number (Linux x86-64)
    xor edi, edi                  ; Exit code 0
    syscall                       ; Invoke syscall to exit the program

toUpper:
.loop:
    mov al, [ecx]                 ; Load the current character from the string into AL
    test al, al                   ; Test if AL is zero (end of string)
    jz .done                      ; If zero, exit the loop
    cmp al, 'a'                  
