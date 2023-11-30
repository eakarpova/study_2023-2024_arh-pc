%include	 'in_out.asm'

SECTION .data
msg1: DB 'Функция:f(x) = 10x - 4 ',0
msg2: DB 'Результат: ', 0

SECTION .text
global _start

_start:
pop ecx		; извлекаем из стека в 'ecx' 
pop edx		; извлекаем из стека в 'edx'
sub ecx, 1	; уменьшение 'ecx' на 1
mov esi, 0	; использование esi для хранения промежуточных сумм
mov edi, 10	; хранение 10 в edi

next:
cmp ecx, 0h	; проверяем, есть ли еще аргументы
jz _end		; если аргументов нет - выходим из цикла
pop eax		; иначе извлекаем следующий аргумент
call atoi
mul edi		; eax = eax * edi
add eax, -4	; eax = eax - 4
add esi, eax    ; добавление к промежуточной сумме
loop next

_end:
mov eax, msg1
call sprintLF
mov eax, msg2
call sprint
mov eax, esi
call iprintLF
call quit
