%include        'in_out.asm'

SECTION .data
msg1: DB 'Введите значение переменной x: ', 0h
msg2: DB 'Введите значение переменной a: ', 0h
rem: DB 'Результат: ', 0h

SECTION .bss
x:      RESB 10
a:	RESB 10

SECTION .text
GLOBAL _start
_start:

; ---- Ввод  х
mov eax, msg1
call sprint
mov ecx, x
mov edx, 10
call sread

; ---- Преобразование х из символа в число
mov eax, x
call atoi
mov [x], eax

; ---- Ввод а
mov eax, msg2
call sprint
mov ecx, a
mov edx, 10
call sread

; ---- Преобразование а из символа в число
mov eax, a
call atoi
mov [a], eax

; ---- Сравниваем 'x' и 'a'
mov ebx, [x]
mov edx, [a]
cmp edx, ebx ; сравниваем x и a
jge check_X ; если x >= a
jmp _end ; иначе

; ---- Если x <= a
check_X:
add edx, ebx  ; a + x
jmp _end

; ---- Вывод результата на экран
_end:
mov eax, rem
call sprint
mov eax, edx 
call iprintLF
call quit

