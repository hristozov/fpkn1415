(load "../../lib/scm/unit.scm")

(define (p x y)
  (define (lower?)
    (and (<= x 0)
         (>= x -2)
         (<= y 0)
         (>= y -2)
         (>= (expt 
               (+ (expt x 2) (expt (- y -2) 2)) 
               0.5)
             2)))
  (define (upper?)
    (and (<= x 0)
         (>= x -2)
         (>= y 0)
         (<= y 2)
         (>= (expt
               (+ (expt (- x -1) 2)
                  (expt (- y 1) 2))
               0.5)
             1)))
  (or (lower?) (upper?)))

; долната част:
(assert-true (p 0 0))
(assert-true (p -2 0))
(assert-true (p -2 -2))
(assert-true (p -2 -2))
(assert-true (p -1.8 -0.2))
(assert-true (p -1.6 -0.7))
(assert-true (p -1.6 -0.8)) ; по контура
(assert-false (p -1.6 -0.9))
(assert-false (p 0 -2))
; горната част
(assert-true (p 0 2))
(assert-true (p -2 2))
(assert-true (p -2 0))
(assert-false (p -1 -1))
(assert-false (p -0.5 0.2))
(assert-true (p -0.4 0.2)) ; по контура
(assert-true (p -0.3 0.2))