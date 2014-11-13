(load "../../lib/scm/unit.scm")

(define (my-length l)
  (define (helper current-l length)
    (if (null? current-l)
        length
        (helper (cdr current-l) (+ length 1))))
  (helper l 0))

(assert= 0 (my-length '()))
(assert= 1 (my-length '(1)))
(assert= 3 (my-length '(1 2 3)))
(assert= 4 (my-length '(1 2 7 8)))
