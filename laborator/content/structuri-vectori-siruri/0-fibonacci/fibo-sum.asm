%include "printf32.asm"

section .data
    N dd 9 ; compute the sum of the first N fibonacci numbers
    sum_print_format db "Sum first %d fibonacci numbers is %d", 10, 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    xor eax, eax     ;store the sum in eax
    xor ebx, ebx       ;store the first number in ebx
    xor edx, edx       ;store the second number in edx
    mov edx, 1

    ; use loop instruction
    xor ecx, ecx
    mov ecx, dword[N]
    sub ecx, 2
    add eax, 1

fib:
    mov edi, ebx
    add edi, edx ; in edi we have the new number
    mov ebx, edx
    mov edx, edi
    add eax, edi
    loop fib

    push eax
    push dword [N]
    push sum_print_format
    call printf
    add esp, 12

    xor eax, eax
    leave
    ret




