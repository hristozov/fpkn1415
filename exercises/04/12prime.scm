(load "../../lib/scm/unit.scm")
(load "04accumulate.scm")

; Как действаме тук:
; 1. Минаваме през всички индекси в интервала от 2 до n-1.
; 2. На всяко число съпостяваме булева стойност, която казва дали НЕ Е делител
;    на n.
; 3. Прилагаме логическо И на стойностите от предната стъпка, като началната
;    стойност на операциите е #t.
; По този начин, ако има делител на n в дадения интервал, то term ще даде #f за
; него и крайният резултат от accumulate ще стане #f заради логическото И.
(define (prime-accumulate? n)
  (define (term candidate)
    (not (= 0 (remainder n candidate))))
  (accumulate term (lambda (x y) (and x y)) #t 2 plus1 (- n 1)))

(assert-true (prime-accumulate? 2))
(assert-true (prime-accumulate? 3))
(assert-false (prime-accumulate? 4))
(assert-true (prime-accumulate? 5))
(assert-false (prime-accumulate? 6))
(assert-true (prime-accumulate? 7))
(assert-false (prime-accumulate? 8))
(assert-false (prime-accumulate? 9))
(assert-false (prime-accumulate? 10))
(assert-true (prime-accumulate? 11))
