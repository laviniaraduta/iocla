%include "printf32.asm"

struc my_struct
    int_x: resb 4
    char_y: resb 1
    string_s: resb 32
endstruc

section .data
    sample_obj:
        istruc my_struct
            at int_x, dd 1000
            at char_y, db 'a'
            at string_s, db 'My string is better than yours', 0
        iend

    new_int dd 2000
    new_char db 'b'
    new_string db 'Are you sure?', 0
    print_format1 db 'int_x: ', 0
    print_format2 db 'char_y: ', 0
    print_format3 db 'string_s: ', 0

section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp

    ; TODO
    ; print all three values (int_x, char_y, string_s) from simple_obj
    ; Hint: use "lea reg, [base + offset]" to save the result of
    ; "base + offset" into register "reg"

    mov eax, [sample_obj + int_x]
    PRINTF32 `%s\x0`, print_format1
    PRINTF32 `%d\n\x0`, eax

    xor eax, eax
    mov al, byte [sample_obj + char_y]
    PRINTF32 `%s\x0`, print_format2
    PRINTF32 `%c\n\x0`, eax

    lea eax, [sample_obj + string_s]
    PRINTF32 `%s\x0`, print_format3
    PRINTF32 `%s\n\x0`, eax

    ; TODO
    ; write the equivalent of "simple_obj->int_x = new_int"
    mov eax, dword [new_int]
    mov [sample_obj + int_x], eax


    xor eax, eax
    mov eax, [sample_obj + int_x]
    PRINTF32 `%s\x0`, print_format1
    PRINTF32 `%d\n\x0`, eax

   


    ; TODO
    ; write the equivalent of "simple_obj->char_y = new_char"
    xor eax, eax
    mov al, byte [new_char]
    mov byte [sample_obj + char_y], al

    xor eax, eax
    mov al, byte [sample_obj + char_y]
    PRINTF32 `%s\x0`, print_format2
    PRINTF32 `%c\n\x0`, eax

    ; TODO
    ; write the equivalent of "strcpy(simple_obj->string_s, new_string)"
    xor eax, eax
    mov esi, new_string
    lea edi, [sample_obj + string_s]
    mov ecx, 0
    mov al, byte [esi + ecx]
    loop:
        mov byte [edi + ecx], al
        inc ecx
        mov al, byte [esi + ecx]
        cmp eax, 0
        jne loop
    
    mov byte [edi + ecx], 0
    lea eax, [sample_obj + string_s]
    PRINTF32 `%s\x0`, print_format3
    PRINTF32 `%s\n\x0`, eax

    ; TODO
    ; print all three values again to validate the results of the
    ; three set operations above

    
    


    xor eax, eax
    leave
    ret
