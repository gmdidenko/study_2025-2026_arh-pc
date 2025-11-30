%include 'in_out.asm'

SECTION .data
msg1 db "Функция: f(x)=8x-3",0
msg2 db "Результат: ",0

SECTION .text
global _start

_start:
    pop ecx
    pop edx
    sub ecx, 1
    mov esi, 0
next:
    cmp ecx, 0
    jz _end
    pop eax
    call atoi
    mov ebx, 8
    imul ebx
    sub eax, 3
    add esi, eax
    loop next
_end:
    mov eax, msg1
    call sprintLF
    mov eax, msg2
    call sprint
    mov eax, esi
    call iprintLF
    call quit
