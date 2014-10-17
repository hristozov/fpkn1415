(load "../../lib/scm/unit.scm")

(define (fib-iter n)
  (define (helper a b count)
    (if (= count 1)
        a
        (helper (+ a b) a (- count 1))))
  (helper 1 0 n))

(assert= 1 (fib-iter 1))
(assert= 1 (fib-iter 2))
(assert= 2 (fib-iter 3))
(assert= 3 (fib-iter 4))
(assert= 5 (fib-iter 5))
(assert= 8 (fib-iter 6))
(assert= 6765 (fib-iter 20))
