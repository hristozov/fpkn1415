(load "../../lib/scm/unit.scm")
(load "01accumulate-filter.scm")
(load "../04/04accumulate.scm")

(define (prime? n)
  (define (term candidate)
    (not (= 0 (remainder n candidate))))
  (if (<= n 1)
      #f
      (accumulate term (lambda (x y) (and x y)) #t 2 plus1 (- n 1))))

(define (identity x) x)
(define (plus1 x) (+ x 1))

(define (sum-primes a b)
  (accumulate-filter identity + 0 a plus1 b prime?))

(assert= 17 (sum-primes 1 10))
