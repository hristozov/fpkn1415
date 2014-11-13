(load "../../lib/scm/unit.scm")

(define (my-reverse l)
  (define (helper current-l result)
    (if (null? current-l)
        result
        (helper (cdr current-l)
                (cons (car current-l) result))))
  (helper l '()))

(assert-equal '() (my-reverse '()))
(assert-equal '(1) (my-reverse '(1)))
(assert-equal '(3 2 1) (my-reverse '(1 2 3)))