%include 'in_out.asm'

SECTION .data
msg db "Вычисление функции f(x) = ((1/3)x + 5) * 7",0
inmsg db "Введите x: ",0
resmsg db "Результат: ",0

SECTION .bss
x resb 10

SECTION .text
global _start
_start:
    ; Вывод сообщения о вычисляемой функции
    mov eax, msg
    call sprintLF

    ; Запрос ввода x
    mov eax, inmsg
    call sprint

    ; Чтение введенного значения
    mov ecx, x
    mov edx, 10
    call sread

    ; Преобразование введенной строки в число
    mov eax, x
    call atoi

    ; Вычисление f(x) = ((1/3)x + 5) * 7
    ; Шаг 1: x / 3 (целочисленное деление)
    mov ebx, 3
    xor edx, edx    ; Обнуление EDX для деления
    div ebx         ; EAX = x / 3, EDX = остаток
    
    ; Шаг 2: + 5
    add eax, 5
    
    ; Шаг 3: × 7
    mov ebx, 7
    mul ebx         ; EAX = EAX * 7

    ; Сохранение результата
    mov edi, eax

    ; Вывод результата
    mov eax, resmsg
    call sprint
    mov eax, edi
    call iprintLF

    ; Завершение программы
    call quit
