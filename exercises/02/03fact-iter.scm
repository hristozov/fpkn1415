(load "../../lib/scm/unit.scm")

(define (fact-iter n)
  (define (helper i acc)
    (if (= i 1)
        acc
        (helper (- i 1) (* acc i))))
  (helper n 1))

(assert= 1 (fact-iter 1))
(assert= 24 (fact-iter 4))
