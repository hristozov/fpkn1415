(load "../../lib/scm/unit.scm")

(define (max-sublist-length l)
  0)

(assert= 0 (max-sublist-length '()))
(assert= 1 (max-sublist-length '(1)))
(assert= 1 (max-sublist-length '(((1)))))
(assert= 2 (max-sublist-length '((() 1))))
(assert= 3 (max-sublist-length '(1 2 3)))
(assert= 3 (max-sublist-length '(1 (2 3 4))))
(assert= 3 (max-sublist-length '((2 3 4) 1)))
(assert= 4 (max-sublist-length '((2 3 4 (4)) 1)))
(assert= 5 (max-sublist-length '((2 3 (5 6 7 8 9) 4) 1)))
