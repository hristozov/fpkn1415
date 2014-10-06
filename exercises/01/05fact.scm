(load "../../lib/scm/unit.scm")

(define (fact n)
  (if (<= n 1)
      1
      (* n (fact (- n 1)))))

(assert= 1 (fact 1))
(assert= 24 (fact 4))
