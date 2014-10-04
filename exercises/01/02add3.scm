(load "../../lib/unit.scm")

(define (add3 a)
	(define three 3)
	(+ a three))

(assert= 4 (add3 1))
(assert= -2 (add3 -5))