(load "../../lib/scm/unit.scm")
(load "../06/06nth.scm")
(load "03filter.scm")

(define (filter-matrix p m)
  (map (lambda (row)
         (filter p row))
       m))

(assert-equal '((2) (4 6) (8)) (filter-matrix even? '((1 2 3) (4 5 6) (7 8 9))))
