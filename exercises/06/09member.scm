(load "../../lib/scm/unit.scm")

(define (member? x l)
  (cond
    ((null? l) #f)
    ((= (car l) x) #t)
    (else (member? x (cdr l)))))

(assert-true (member? 1 '(1 2 3)))
(assert-true (member? 2 '(1 2 3)))
(assert-true (member? 3 '(1 2 3)))
(assert-false (member? 4 '(1 2 3)))
