(load "../../lib/scm/unit.scm")

(define (testletrec x)
  (letrec
    ((my-even? (lambda (x)
                 (if (= x 1)
                     #f
                     (my-odd? (- x 1)))))
     (my-odd? (lambda (x)
                (not (my-even? x)))))
    (my-odd? x)))

(assert-false (testletrec 2))
(assert-true (testletrec 3))
(assert-false (testletrec 20))
(assert-true (testletrec 5))