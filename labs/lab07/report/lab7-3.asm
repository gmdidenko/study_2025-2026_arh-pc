%include 'in_out.asm'

SECTION .data
msg DB "Наименьшее число: ",0
a DD 46
b DD 32
c DD 74

SECTION .bss
min resb 10

SECTION .text
GLOBAL _start
_start:
    ; Инициализация минимума значением a
    mov eax, [a]
    mov [min], eax
    
    ; Сравнение с b
    mov eax, [min]
    cmp eax, [b]
    jl check_c
    mov eax, [b]
    mov [min], eax

check_c:
    ; Сравнение с c
    mov eax, [min]
    cmp eax, [c]
    jl print_result
    mov eax, [c]
    mov [min], eax

print_result:
    mov eax, msg
    call sprint
    mov eax, [min]
    call iprintLF
    call quit
