(load "../../lib/scm/unit.scm")

(define (invert f)
  (lambda (x) 
    (/ 1 (f x))))

(assert= 0.5 ((invert (lambda (x) x)) 2))