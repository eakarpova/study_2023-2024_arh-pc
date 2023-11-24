%include	'in_out.asm'

SECTION .data
msg: DB 'Введите значение переменной х: ', 0
rem: DB 'Результат: ', 0

SECTION .bss
x:	RESB 80

SECTION .text
GLOBAL _start
_start:
; ---- Вычисление выражения
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax, x
call atoi
mov ebx, 31
mul ebx ; x*31
add eax, -5 ; x*31 - 5
add eax, 10; (x*31 - 5) + 10
mov edi, eax
; ---- Вывод результата на экран
mov eax, rem
call sprint
mov eax, edi
call iprintLF
call quit
