(load "../../lib/scm/unit.scm")
(load "../../exercises/04/04accumulate.scm")

(define (plus1 x)
  (+ x 1))

(define (plus2 x)
  (+ x 2))

(define (double-fact n)
  (accumulate identity * 1 (if (even? n) 2 1) plus2 n))

(define (pow x n)
  (accumulate (lambda (_) x) * 1 1 plus1 n))

(define (solution n)
  (accu))

(assert= 384 (double-fact 8))
(assert= 105 (double-fact 7))
(assert= 1 (pow 2 0))
(assert= 2 (pow 2 1))
(assert= 1024 (pow 2 10))