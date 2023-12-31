---
## Front matter
title: "Лабораторная работа №5"
subtitle: "Основы работы с Midnight Commander (mc). Структура программы на языке ассемблера NASM. Системные вызовы в ОС GNU Linux"
author: "Карпова Есения Алексеевна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Целью данной лабораторной работы является приобретение практических навыков работы в Midnight Commander, освоение инструкций языка ассемблера mov и int

# Задание

1. Основы работы с mc
2. Структура программы на языке ассемблера NASM
3. Подключение внешнего файла
4. Выполнение заданий для самостоятельной работы

# Теоретическое введение

Midnight Commander (mc) - это программа, которая позволяет просматривать структуру каталогов и выполнять основные операции по управлению файловой системой , т.е. mc является файловым менеджером.MC позволяет сделать работу с файлами более удобной и наглядной.Программа на языке ассемблера NASM, как правило, состоит из трех секций: секция кода программы(SECTION.text), секция инициированных (известных во время работы компиляции) данных (SECTION.data) и секция неинициализированных данных(тех, под которые во время компиляции только отводится память, а значение присваивается в ходе выполнения программы) (SECTION.bss).
Для объявления инициированных данных в секции .data используются директивы DB, DW,
DD, DQ и DT, которые резервируют память и указывают, какие значения должны храниться в
этой памяти:
• DB (define byte) — определяет переменную размером в 1 байт;
• DW (define word) — определяет переменную размеров в 2 байта (слово);
• DD (define double word) — определяет переменную размером в 4 байта (двойное слово);
• DQ (define quad word) — определяет переменную размером в 8 байт (учетверённое слово);
• DT (define ten bytes) — определяет переменную размером в 10 байт.
Директивы используются для объявления простых переменных и для объявления масси-
вов. Для определения строк принято использовать директиву DB в связи с особенностями
хранения данных в оперативной памяти.
Синтаксис директив определения данных следующий:
<имя> DB <операнд> [, <операнд>] [, <операнд>]
Инструкция языка ассемблера mov предназначена для дублирования данных источника в
приёмнике. В общем виде эта инструкция записывается в виде
mov
dst,src
Здесь операнд dst — приёмник, а src — источник.
В качестве операнда могут выступать регистры (register), ячейки памяти (memory) и непо-
средственные значения (const). 
Инструкция языка ассемблера intпредназначена для вызова прерывания с указанным
номером. В общем виде она записывается в виде
int n
Здесь n — номер прерывания, принадлежащий диапазону 0–255.
При программировании в Linux с использованием вызовов ядра sys_calls n=80h (принято
задавать в шестнадцатеричной системе счисления).

# Выполнение лабораторной работы
1. Основы работы с Midnight Commander

1.1. Открываю Midnight Commander(рис. @fig:001).

![Открытие Midnight Commander](1.png){#fig:001 width=100%}

1.2. Перехожу в каталог ~/work/arch-pc и с помощью функциональной клавиши F7 создаю папку lab05 (рис. @fig:001).

![Создание папки lab05](2.png){#fig:002 width=100%}
 
1.3. Пользуясь строкой ввода и командой touch создаю файл lab5-1.asm (рис. @fig:003).

![Создание файла lab5-1.asm](3.png){#fig:003 width=100%}

2. Структура программы на языке ассемблера NASM
  
2.1 С помощью функциональной клавиши F4 открываю файл lab5-1.asm для редактирова-
ния во встроенном редакторе (рис. @fig:004).
 
![Открытие файла lab5-1.asm](4.png){#fig:004 width=100%}

2.2. Ввожу в файл код программы для запроса строки у пользователя (рис. @fig:005).

![Редактирую файл](5.png){#fig:005 width=100%}

2.3. Оттранслирую текст программы lab5-1.asm в объектный файл. Выполните компо-
новку объектного файла и запустите получившийся исполняемый файл.(рис. @fig:006).

![Компиляция файла и передача на обработку компоновку](6.png){#fig:006 width=100%}

2.4. На запрос программы ввожу свое ФИО (рис. @fig:007).

![Исполнени файла](7.png){#fig:007 width=100%}

3. Подключение внешнего файла

3.1. Скачиваю файл in_out.asm со страницы курса в ТУИС. Размещаю файл в тот же каталог, где лежит файл с программой (рис. @fig:008).

![Размещение файла](8.png){#fig:008 width=100%}

3.2. Изменяю содержимое файла lab5-2.asm во встроенном редакторе, чтобы в программе использовались подпрограммы из внешнего файла in_out.asm (рис. @fig:009).

![Редактирование файла](9.png){#fig:009 width=100%}

3.3. Создаю исполняемый файл и проверяю его работу (рис. @fig:010).

![Исполнение файла](10.png){#fig:010 width=100%}

3.4. В файле lab5-2.asm заменяю подпрограмму sprintLF на sprint (рис. @fig:011).

![Замена подпрограммы](11.png){#fig:011 width=100%}

3.5. Создаю исполняемый файл и проверьте его работу (рис. @fig:012).

![Исполнение файла с другой подпрограммой](12.png){#fig:012 width=100%}

Разница между первым исполняемым файлом и вторым в том, что запуск первого запрашивает ввод с новой строки, а программа, которая исполняется при запуске второго, запрашивает ввод без переноса на новую строку

4. Задание для самостоятельной работы

4.1. Создаю копию файла lab5-1.asm с именем lab5-1-1.asm с помощью функциональной клавиши F5 (рис. @fig:013).

![Создание копии файла](13.png){#fig:013 width=100%}

4.2. С помощью функциональной клавиши F4 открываю созданный файл для редактирования. Изменяю программу так, чтобы кроме вывода приглашения и запроса ввода, она выводила вводимую пользователем строку (рис. @fig:014).

![Редактирование файла](14.png){#fig:014 width=100%}

4.3. Создаю объектный файл lab5-1-1.o, отдаю его на обработку компоновщику, получаю исполняемый файл lab5-1-1, запускаю полученный исполняемый файл. Программа запрашивает ввод, ввожу свои ФИО, далее программа выводит введенные мною данные (рис. @fig:015).

![Исполнение файла](15.png){#fig:015 width=100%}

4.4. Создаю копию файла lab5-2.asm с именем lab5-2-1.asm с помощью функциональной клавиши F5 (рис. @fig:016).

![Копирование файла](16.png){#fig:016 width=100%}

4.5. С помощью функциональной клавиши F4 открываю созданный файл для редактирования. Изменяю программу так, чтобы кроме вывода приглашения и запроса ввода, она выводила вводимую пользователем строку (рис. @fig:017).

![Редактирование файла](17.png){#fig:017 width=100%}

4.6. Создаю объектный файл lab5-2-1.o, отдаю его на обработку компоновщику, получаю исполняемый файл lab5-2-1, запускаю полученный исполняемый файл. Программа запрашивает ввод без переноса на новую строку, ввожу свои ФИО, далее программа выводит введенные мною данные (рис. @fig:018).

![Исполнение файла](18.png){#fig:018 width=100%}

# Выводы

При выполнении лабораторной работы я приобрела практические нааыки работы с Midnight Commander, а также освоила инструкции языка ассемблера mov и int.

# Список литературы{.unnumbered}

Демидова А.В. - Лабораторная работа №5 
