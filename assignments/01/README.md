Решения
=======
* [Първи вариант](assignment-1.scm)
* [Втори вариант](assignment-2.scm)

Първи вариант
=============
_(за хората с четни факултетни номера)_

Да се напише процедура `(hw11 a b)`, която връща броя на всички числа в интервала между `a` и `b` включително, които са съставени само от едни и същи цифри в осмична бройна система. `a`, `b` и резултатът са естествени числа в десетична бройна система.

Примери
-------
Първите числа (десетични), които отговарят на условието (в скоби е осмичният им вид):
`0 (0), 1 (1), 2 (2), 3 (3), 4 (4), 5 (5), 6 (6), 7 (7), 9 (11), 18 (22), 27 (33), 36 (44), 45 (55), 54 (66), 63 (77), 73 (111), 146 (222), 219 (333), ...`

`(hw11 1 8) -> 7`

`(hw11 1 9) -> 8`

`(hw11 1 18) -> 9`

`(hw11 1 65) -> 14`

Втори вариант
=============
_(за хората с нечетни факултетни номера)_

Да се напише процедура `(hw12 a b)`, която връща броя на всички числа в интервала между `a` и `b` включително, които НЕ са съставени от едни и същи цифри в шестнайсетична бройна система (т.е. имат поне 2 различни цифри). `a`, `b` и резултатът са естествени числа в десетична бройна система.

Примери
-------
Първите числа (десетични), които НЕ отговарят на условието (в скоби е шестнайсетичният им вид):
`1 (1), 2 (2), 3 (3), 4 (4), 5 (5), 6 (6), 7 (7), 8 (8), 9 (9), 10 (A), 11 (B), 12 (C), 13 (D), 14 (E), 15 (F), 17 (11), 34 (22), 51 (33), 68 (44), 85 (55), 102 (66), ...`

`(hw2-2 1 13) -> 0`

`(hw2-2 1 18) -> 2`

`(hw2-2 1 35) -> 18`

`(hw2-2 1 87) -> 67`
