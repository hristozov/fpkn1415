(load "../../lib/scm/unit.scm")

(define (my-gcd a b)
  (cond
    ((= a b) b)
    ((> a b) (- a b))
    (else (- b a))))

(assert= 3 (gcd 6 9))
(assert= 2 (gcd 4 6))
(assert= 9 (gcd 27 18))