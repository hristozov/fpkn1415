(load "../../lib/scm/unit.scm")

(define (add a b)
  (+ a b))

(assert= 2 (add 1 1))
(assert= -1 (add -5 4))
