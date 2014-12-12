(load "../../lib/scm/unit.scm")

(define (accumulate acc initial term l)
  (define (helper current-l result)
    (if (null? current-l)
        result
        (helper (cdr current-l)
                (acc result (term (car current-l))))))
  (helper l initial))

(assert= 14 (accumulate + 0 (lambda (x) (* x x)) '(1 2 3)))
