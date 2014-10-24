(load "../../lib/scm/unit.scm")

(define (sqrt-iter x)
  (define epsilon 0.01)
  (define (good-enough? rn)
    (< (abs (- (* rn rn) x))
       epsilon))
  (define (improve rn)
    (/ (+ rn (/ x rn)) 
       2))
  (define (helper rn)
    (if (good-enough? rn)
        rn
        (helper (improve rn))))
  (helper 1))

(assert-approx 4 0.01 (sqrt-iter 16))
(assert-approx 2 0.01 (sqrt-iter 4))
(assert-approx 10 0.01 (sqrt-iter 100))
(assert-approx (expt 2 0.5) 0.01 (sqrt-iter 2))
(assert-approx (expt 171 0.5) 0.01 (sqrt-iter 171))
(assert-approx (expt 2237 0.5) 0.01 (sqrt-iter 2237))