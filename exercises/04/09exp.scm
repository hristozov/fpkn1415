(load "../../lib/scm/unit.scm")
(load "04accumulate.scm")
(load "05fact.scm")

(define (ex x)
  (define (term n)
    (/ (expt x n)
       (fact-accumulate n)))
  (accumulate term + 0 0 plus1 50))

(assert-approx 20.085 0.001 (ex 3))
(assert-approx 2980.957 0.001 (ex 8))
