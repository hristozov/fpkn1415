(load "../../lib/scm/unit.scm")

(define (my-reverse n)
  (define (helper i result)
    (if (<= i 0)
        result
        (helper (quotient i 10) 
                (+ (* result 10) 
                   (remainder i 10)))))
  (helper n 0))

(assert= 0 (my-reverse 0))
(assert= 5 (my-reverse 5))
(assert= 1 (my-reverse 10))
(assert= 21 (my-reverse 12))
(assert= 1 (my-reverse 1000))
(assert= 1234 (my-reverse 432100))
(assert= 10234 (my-reverse 43201))
