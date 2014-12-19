λ
=

Тук са събрани помощни материали за упражненията по Функционално програмиране за специалност Компютърни науки през учебната 2014/2015. Това хранилище спомага учебните занятия на 5-та и 6-та група на 2-ри поток, но може да бъде използвано от всички студенти, изучаващи Функционало програмиране във ФМИ.

Moodle курсът може да бъде намерен [тук](http://moodle.openfmi.net/enrol/index.php?id=995). Там могат да бъдат намерени по-важните съобщения, свързани с учебната дейност.

Scheme кодът от упражненията трябва да работи на всички R5RS Scheme имплементации. Описание на R5RS стандарта може да бъде намерено [тук](http://www.schemers.org/Documents/Standards/R5RS/HTML/). Там можете да намерите подробна документация за всички форми и процедури, които използваме в курса.

Haskell кодът от упражненията трябва да работи с всяка Haskell 98 имплементация.

Структура
=========

* Материалите за различните упражнения (планове на разгледаното и решения на задачите) са в директорията [/exercises](/exercises).
* Заданията за домашна работа и инструкции как да бъдат изпратени са в директорията [/assignments](/assignments).
* Задачите от контролните са в директорията [/tests](/tests).

В някои от директориите има скриптове на име `run.sh`. Те служат за изпълнение на тестовете във всички Scheme файлове в текущата директория.

Среда за разработка
===================
Racket дистрибуция може да бъде свалена от [официалния сайт на Racket](http://racket-lang.org). Ако не ви се инсталира Racket, можете да ползвате уеб-базирания [repl.it](http://repl.it/languages). Обърнете внимание, че repl.it е базиран на R6RS стандарта и има някои дребни разминавания с R5RS. Въпреки това, той може да бъде използван за решаване на задачи без големи проблеми.

Ако ползвате DrRacket, не забравяйте първо да сложите R5RS за език, тъй като той не е зададен по подразбиране. Това става от менюто Language -> Choose Language -> Other Languages -> R5RS.

За да пишете на Haskell, можете да си свалите [WinHugs](https://www.haskell.org/haskellwiki/WinHugs) и с него да зареждате `.hs` файловете. Друг вариант е да използвате [ghc](https://www.haskell.org/ghc/). За редактиране на Haskell код може да ви бъде удобен [Sublime Text](http://www.sublimetext.com/), който може да бъде надграден със [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell).
