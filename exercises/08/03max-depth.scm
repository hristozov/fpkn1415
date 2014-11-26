(load "../../lib/scm/unit.scm")

(define (max-depth l)
  (cond
    ((null? l) 0)
    ((not (list? l)) 0)
    (else (max (+ 1 (max-depth (car l)))
               (max-depth (cdr l))))))

(assert= 1 (max-depth '(1 2 3)))
(assert= 2 (max-depth '(1 (2) 3)))
(assert= 4 (max-depth '(1 (2 (3)) 3 ((4)) (((5))))))
