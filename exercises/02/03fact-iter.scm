(load "../../lib/scm/unit.scm")

(define (fact-iter n)
  (define (helper n acc)
    (if (= n 1)
        acc
        (helper (- n 1) (* acc n))))
  (helper n 1))

(assert= 1 (fact-iter 1))
(assert= 24 (fact-iter 4))
