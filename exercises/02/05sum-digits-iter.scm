(load "../../lib/scm/unit.scm")

(define (sum-digits-iter n)
  (define (helper n sum)
    (if (<= n 0)
        sum
        (helper (quotient n 10) (+ sum (remainder n 10)))))
  (helper n 0))

(assert= 0 (sum-digits-iter 0))
(assert= 1 (sum-digits-iter 1))
(assert= 9 (sum-digits-iter 9))
(assert= 1 (sum-digits-iter 10))
(assert= 9 (sum-digits-iter 27))
(assert= 1 (sum-digits-iter 100))