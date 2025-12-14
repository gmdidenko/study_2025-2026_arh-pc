; -------------------------------
; Запись имени в файл name.txt
; -------------------------------
%include 'in_out.asm'

SECTION .data
    fname db 'name.txt', 0
    msg1 db 'Как Вас зовут?', 10, 0
    msg2 db 'Меня зовут ', 0

SECTION .bss
    buffer resb 128

SECTION .text
global _start

_start:
    ; вывод приглашения
    mov eax, msg1
    call sprint

    ; ввод имени
    mov ecx, buffer
    mov edx, 128
    call sread

    ; создание файла
    mov ecx, 0666o
    mov ebx, fname
    mov eax, 8          ; sys_creat
    int 80h
    mov esi, eax        ; дескриптор

    ; запись "Меня зовут "
    mov eax, msg2
    call slen
    mov edx, eax
    mov ecx, msg2
    mov ebx, esi
    mov eax, 4          ; sys_write
    int 80h

    ; запись имени
    mov eax, buffer
    call slen
    mov edx, eax
    mov ecx, buffer
    mov eax, 4
    int 80h

    ; закрытие файла
    mov ebx, esi
    mov eax, 6          ; sys_close
    int 80h

    call quit

