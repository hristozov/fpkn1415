(load "../../lib/scm/unit.scm")

(define (sum-digits n)
  (if (<= n 0)
      0
      (+ (remainder n 10) (sum-digits (quotient n 10)))))

(assert= 0 (sum-digits 0))
(assert= 1 (sum-digits 1))
(assert= 9 (sum-digits 9))
(assert= 1 (sum-digits 10))
(assert= 9 (sum-digits 27))
(assert= 1 (sum-digits 100))
