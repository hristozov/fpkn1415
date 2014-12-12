(load "04accumulate.scm")
(load "03filter.scm")

(define (even-squares-sum l)
  (accumulate + 0 (lambda (x) (* x x)) (filter even? l)))

(assert= 20 (even-squares-sum '(1 2 3 4)))
