(load "../../lib/scm/unit.scm")

(define (depth l)
  0)

(assert= 1 (depth '()))
(assert= 1 (depth '(1 2 3)))
(assert= 2 (depth '(1 2 3 (2))))
(assert= 2 (depth '((1) (2) 3 (2))))
(assert= 2 (depth '(() 1 3 2)))
(assert= 2 (depth '(1 3 2 ())))
(assert= 3 (depth '(1 3 2 (2 (3)))))
(assert= 4 (depth '(1 3 2 (2 ((4) 3)))))
(assert= 4 (depth '(1 3 2 (2 (4 (3))))))
