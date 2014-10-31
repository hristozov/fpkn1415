(load "../../lib/scm/unit.scm")

(define (count-digits-iter n)
  (define (helper i result)
    (if (<= i 0)
        result
        (helper (quotient i 10) 
                (+ result 1))))
  (helper n 0))

(assert= 0 (count-digits-iter 0))
(assert= 1 (count-digits-iter 1))
(assert= 1 (count-digits-iter 9))
(assert= 2 (count-digits-iter 10))
(assert= 2 (count-digits-iter 27))
(assert= 3 (count-digits-iter 100))
;(assert= 100000 (count-digits-iter (expt 10 99999)))
