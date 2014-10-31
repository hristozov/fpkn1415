(load "../../lib/scm/unit.scm")
(load "04accumulate.scm")

(define (sqrt-acc x)
  (accumulate identity
              (lambda (_ acc)  (/ (+ acc (/ x acc)) 2))
              1 1 plus1 10))

(assert-approx 4 0.01 (sqrt-acc 16))
(assert-approx 2 0.01 (sqrt-acc 4))
(assert-approx 10 0.01 (sqrt-acc 100))
(assert-approx (expt 2 0.5) 0.01 (sqrt-acc 2))
(assert-approx (expt 171 0.5) 0.01 (sqrt-acc 171))
(assert-approx (expt 2237 0.5) 0.01 (sqrt-acc 2237))
