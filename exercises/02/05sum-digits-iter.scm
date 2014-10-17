(load "../../lib/scm/unit.scm")

(define (sum-digits-iter n)
  (define (helper i result)
    (if (<= i 0)
        result
        (helper (quotient i 10)
                (+ result (remainder i 10)))))
  (helper n 0))

(assert= 0 (sum-digits-iter 0))
(assert= 1 (sum-digits-iter 1))
(assert= 9 (sum-digits-iter 9))
(assert= 1 (sum-digits-iter 10))
(assert= 9 (sum-digits-iter 27))
(assert= 1 (sum-digits-iter 100))