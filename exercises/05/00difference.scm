(load "../../lib/scm/unit.scm")

(define (difference f a b)
  (- (f a) (f b)))

(define (identity x) x)
(define (pow2 x) (* x x))

(assert= 9 (difference pow2 5 4))
(assert= 2 (difference identity 4 2))
(assert= -2 (difference - 4 2))
