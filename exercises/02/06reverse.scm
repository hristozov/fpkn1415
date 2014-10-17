(load "../../lib/scm/unit.scm")

(define (my-reverse n)
  (define (helper n acc)
    (if (<= n 0)
        acc
        (helper (quotient n 10) 
                (+ (* acc 10) 
                   (remainder n 10)))))
  (helper n 0))

(assert= 0 (my-reverse 0))
(assert= 5 (my-reverse 5))
(assert= 1 (my-reverse 10))
(assert= 21 (my-reverse 12))
(assert= 1 (my-reverse 1000))
(assert= 1234 (my-reverse 432100))
(assert= 10234 (my-reverse 43201))