(load "../../lib/scm/unit.scm")
(load "../06/04member.scm")

(define (union l1 l2)
  (if (null? l1)
      l2
      (let ((l1-head (car l1)))
        (if (member? l1-head l2)
            (union (cdr l1) l2)
            (cons l1-head (union (cdr l1) l2))))))

(assert-equal '(5 4 1 3 2) (union '(2 3 5) '(4 1 3 2)))
(assert-equal '(1 2 3) (union '(1 2 3) '(1 2 3)))
(assert-equal '(2) (union '(2) '(2)))
(assert-equal '() (union '() '()))
