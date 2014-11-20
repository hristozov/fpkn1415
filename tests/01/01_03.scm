(load "../../lib/scm/unit.scm")
(load "../../exercises/04/04accumulate.scm")

(define (plus2 x)
  (+ x 2))

(define (double-fact n)
  (accumulate identity * 1 (if (even? n) 2 1) plus2 n))

(assert= 384 (double-fact 8))
(assert= 105 (double-fact 7))