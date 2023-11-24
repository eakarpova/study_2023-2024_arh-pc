;Программа вывода сообщения на экран и ввода строки с клавиатуры
%include 'in_out.asm'

SECTION .data                      ; Секция инициированных данных
msg:	DB 'Введите строку:', 0h   ; сообщение

SECTION   .bss                     ; Секция не инициированных данных
buf1:	  RESB 80                  ; Буфер размером 80 байт

SECTION .text                      ; Код программы
    GLOBAL _start                      ; Начало программы
    _start:                            ; Точка входа в программу

    mov eax,msg
    call sprint

    mov ecx, buf1
    mov edx, 80
    
    call sread
    mov eax,4
    mov ebx,1
    mov ecx,buf1
    int 80h
    call quit