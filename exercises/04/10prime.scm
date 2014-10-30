(load "../../lib/scm/unit.scm")
(load "04accumulate.scm")

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
