%include	'in_out.asm'	; подключение внешнего файла
SECTION .data

msg:DB 'Введите значение переменной x: ',0
rem:DB 'Результат: ',0
SECTION ,bss
x: RESB 80; Переменная, значение которой будем вводить с клавиатуры
SECTION .text
GLOBAL _start
_start:

; ---- Вычисление выражения
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call stread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, 'eax=x'
mov ex,10; EAX=10
 
mull ebx; EAX=EAX*EBX
add eax,3
; EAX=EAX+3
xor edx,edx; обнуляем EDX для корректной работы div
mov ebx,3; EBX=3
div ebx; EAX=EAX/3, EDX=остаток от деления
mov edi,eax; запись результата вычисления в 'edi'
; ----
mov
Вывод результата на экран
eax,div
; вызов подпрограммы печати
call sprint; сообщения 'Результат: '
mov; вызов подпрограммы печати значения
eax,edi
call iprintLF; из 'edi' в виде символов
mov; вызов подпрограммы печати
eax,rem
call sprint; сообщения 'Остаток от деления: '
moveax,edx; вызов подпрограммы печати значения
call iprintLF; из 'edx' (остаток) в виде символов
call quit; вызов подпрограммы завершения
Создайте исполняемый файл и запустите его. Результат работ
