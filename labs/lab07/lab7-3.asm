%include         'in_out.asm'
section         .data
msg1 db 'Введите B: ',0h
msg2 db "Наименьшее число: ",0h
A dd '24'
B dd '98'
C dd '15'
section .bss
min resb 10
section         .text
global _start
_start:
; ---------- Записываем 'A' в переменную 'min'
mov ecx, [A]
mov [min],ecx ; 'min = A'
; ---------- Сравниваем 'A' и 'С' (как символы)
cmp ecx,[C]; Сравниваем 'A' и 'С'
jg check_B; если 'A<C', то переход на метку 'check_B',
mov ecx,[C]; иначе 'ecx = C'
mov [min],ecx ; 'min' = C'

check_B:
mov eax,min
call atoi ; Вызов подпрограммы перевода символа в число
mov [min],eax ; запись преобразованного числа в `min`
; ---------- Сравниваем 'min(A,C)' и 'B' (как числа)
mov ecx,[min]
cmp [B], ecx; Сравниваем 'min(A,C)' и 'B'
jg fin; если 'min(A,C)<B', то переход на 'fin',
mov ecx,[B]; иначе 'ecx = B'
mov[min],ecx
; ---------- Вывод результата
fin:
mov eax, msg2
call sprint
mov eax,[min]
call iprintLF; Вывод 'min(A,B,C)'
call quit; Выход
