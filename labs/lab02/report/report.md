---
## Front matter
title: "Лабораторная работа №2"
subtitle: "Система контроля версий Git"
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

Целью работы является изучить идеологию и применение средств контроля версий. Приобрести практические навыки по работе с системой git

# Задание

1. Настройка GitHub
2. Базовая настройка Git
3. Создание SSH-ключа
4. Создание рабочего пространства  на основе шаблона
5. Создание репозитория курса  на основе шаблона
6. Насторойка католога курса
7. Выполнение заданий для самостоятельной работы
# Теоретическое введение

Системы контроля версий применяются при работе нескольких человек над одним проектом. При внесении изменений в содержание проекта система конитроля версий позволяет их фиксировать, совмещать изменения, произведенные разными участниками проекта, производить откат к любой более ранней версии проекта, если это потребуется

# Выполнение лабораторной работы

1. Настройка GitHub 
Создаю учетную запись на сайте GitHub, заполнила основные данные учетной записи.

2. Базовая настройка Git 
Открываю консоль и делаю предварительную конфигурацию git. Ввожу команду git config --global user.name"", уквазывая свое имя и команду git config --global user.email "", указывая в ней свою электронную почту. (см. рис. @fig:001)

![Предварительеая конфигурация git](image/1.png){#fig:001 width=100%}

Настраиваю utf-8 в выводе сообщений git для корректного
отображения символов(см. рис. @fig:002)

![Настраивание utf-8](image/2.png){#fig:002 width=100%}

Задаю имя «master» для начальной ветки(см. рис. @fig:003)

![Задаю имя "master"](image/3.png){#fig:003 width=100%}

Задаю параметр autocrlf со значением input, так как я работаю в
системе Linux, чтобы конвертировать CRLF в LF только при
коммитах (рис. 5). CR и LF – это символы, которые можно
использовать для обозначения разрыва строки в текстовых файлах.(см. рис. @fig:004)

![Задаю параметр "autocrlf"](image/4.png){#fig:004 width=100%}

Задаю параметр safecrlf со значением warn, так Git будет
проверять преобразование на обратимость (рис. 6). При значении
warn Git только выведет предупреждение, но будет принимать
необратимые конвертации. (см. рис. @fig:005)

![Задаю параметр "safecrlf"](image/5.png){#fig:005 width=100%}

3. Создание SSH-ключа
Для последующей идентификации пользователя на сервере
репозиториев необходимо сгенерировать пару ключей (приватный и
открытый). Для этого ввожу команду ssh-keygen -C “Имя Фамилия,
work@email”, указывая имя владельца и электронную почту владельца
Ключ автоматически сохранится в каталоге ~/.ssh/(см. рис. @fig:006)

![Генерация SSH-ключа"](image/6.png){#fig:006 width=100%}

Далее необходимо загрузить сгенерированный открытый ключ.
Для этого зайти на сайт под своей учётной записью и перейти в меню
Setting . После этого выбрать в боковом меню SSH and GPG keys и
нажать кнопку New SSH key . Скопировав из локальной консоли ключ в
буфер обмена. Вставляем ключ в появившееся на сайте поле и
указываем для ключа имя (Title).(см. рис. @fig:007)

![Копирование содержимого файла"](image/7.png){#fig:007 width=100%}

4.Создание рабочего пространства на основе шаблона
Закрываю браузер, открываю терминал. Создаю директорию,
рабочее пространство, с помощью утилиты mkdir, благодаря ключу -
p создаю все директории после домашней ~/work/study/2022-
2023/“Архитектура компьютера” рекурсивно. Далее проверяю с
помощью ls, действительно ли были созданы необходимые мне
каталоги.

5. Создание репозитория курса на основе шаблона
В браузере перехожу на страницу репозитория с шаблоном
курса по адресу https://github.com/yamadharma/course-directory-
student-template. Далее выбираю
«Use this template», чтобы использовать этот шаблон для своего
репозитория. В открывшемся окне задаю имя репозитория (Repository name):
study_2022–2023_arh- pc и создаю репозиторий, нажимаю на кнопку
«Create repository from template». Репозиторий создан.Через терминал перехожу в созданный каталог курса с помощью утилиты cd (см. рис. @fig:008)

![Перемещение между директориями"](image/8.png){#fig:008 width=100%}

Клонирую созданный репозиторий с помощью команды git
clone –recursive git@github.com:/study_2022–2023_arh-pc.git arch-
pc.(см. рис. @fig:009)

![Клонирование репозитория"](image/9.png){#fig:009 width=100%}

6. Настройка каталога курса
Перехожу в каталог курса и удаляю лишние файлы с помощью rm. Создаю необходимые каталоги. Отправляю файлы на сервер с помощью команд (см. рис. @fig:010)

![Отправка файлов"](image/10.png){#fig:010 width=100%}

7. Задание для самостоятельной работы
С помощью изученных в ходе первой лабораторной работы команд помещаю
отчет по первой лабораторной работе в папку labs > lab02 > report
Скопирую отчет по выполнению предыдущих лабораторных работ в
соответствующие каталоги созданного рабочего пространства
Перемещаю отчет по первой лабораторной работе в ~/lab01/report.
Загружаю файл на github
Ссылка:
https://github.com/eakarpova/study_2023-2024_arh-pc/tree/master
# Выводы

В ходе лабораторной работы я изучила идеологию и применение средств
контроля версий, а также приобрела практические навыки по работе с системой
git

# Список литературы{.unnumbered}

Лабораторная работа №2. Система контроля версий Git - Демидова А.В.

