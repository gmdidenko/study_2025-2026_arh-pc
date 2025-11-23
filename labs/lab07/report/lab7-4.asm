%include 'in_out.asm'

SECTION .data
msg_x DB "Введите x: ",0
msg_a DB "Введите a: ",0
msg_res DB "Результат: ",0

SECTION .bss
x resb 10
a_val resb 10
result resb 10

SECTION .text
GLOBAL _start
_start:
    ; Ввод x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    
    ; Ввод a
    mov eax, msg_a
    call sprint
    mov ecx, a_val
    mov edx, 10
    call sread
    
    ; Преобразование в числа
    mov eax, x
    call atoi
    mov [x], eax
    
    mov eax, a_val
    call atoi
    mov [a_val], eax
    
    ; Вычисление функции f(x) для варианта 19:
    ; f(x) = { a + x, если x > a
    ;         x,      если x ≤ a
    
    mov ebx, [x]      ; ebx = x
    mov ecx, [a_val]  ; ecx = a
    
    ; Сравнение x и a
    cmp ebx, ecx
    jg case_x_greater
    
    ; Случай x ≤ a: f(x) = x
    mov eax, ebx
    jmp store_result

case_x_greater:
    ; Случай x > a: f(x) = a + x
    mov eax, ecx
    add eax, ebx

store_result:
    mov [result], eax
    
    ; Вывод результата
    mov eax, msg_res
    call sprint
    mov eax, [result]
    call iprintLF
    
    call quit
