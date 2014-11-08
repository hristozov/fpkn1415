(load "../../lib/scm/unit.scm")
(load "04accumulate.scm")

; Редицата ни е от вида "x * x * x * ...", като всеки от членовете е независим
; от текущия индекс. Затова подаваме за term процедура, която игнорира индекса
; и винаги връща стойността на x.
(define (pow-accumulate x n)
  (accumulate (lambda (_) x) * 1 1 plus1 n))

(assert= 27 (pow-accumulate 3 3))
(assert= 1024 (pow-accumulate 2 10))
