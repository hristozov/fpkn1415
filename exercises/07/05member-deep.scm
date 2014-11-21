(load "../../lib/scm/unit.scm")

(define (member-deep? x l)
  (cond
    ((null? l) #f)
    ((list? (car l)) (or (member-deep? x (car l))
                         (member-deep? x (cdr l))))
    ((= (car l) x) #t)
    (else (member-deep? x (cdr l)))))

(assert-true (member-deep? 1 '(1 2 3)))
(assert-true (member-deep? 1 '((1) 2 3)))
(assert-true (member-deep? 2 '(1 2 3)))
(assert-true (member-deep? 2 '(1 (4 2) 3)))
(assert-true (member-deep? 3 '(1 2 3)))
(assert-true (member-deep? 3 '(1 2 ((7) 3))))
(assert-false (member-deep? 4 '(1 2 3)))
