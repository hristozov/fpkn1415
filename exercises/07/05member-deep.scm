(load "../../lib/scm/unit.scm")

(define (member-deep? x l)
  (if (null? l)
      #f
      (let ((l-head (car l))
            (l-tail (cdr l)))
        (cond
          ((list? l-head) (or (member-deep? x l-head)
                              (member-deep? x l-tail)))
          ((= l-head x) #t)
          (else (member-deep? x l-tail))))))

(assert-true (member-deep? 1 '(1 2 3)))
(assert-true (member-deep? 1 '((1) 2 3)))
(assert-true (member-deep? 2 '(1 2 3)))
(assert-true (member-deep? 2 '(1 (4 2) 3)))
(assert-true (member-deep? 3 '(1 2 3)))
(assert-true (member-deep? 3 '(1 2 ((7) 3))))
(assert-false (member-deep? 4 '(1 2 3)))
