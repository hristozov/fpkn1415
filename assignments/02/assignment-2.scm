(load "../../lib/scm/unit.scm")

(define (max-sublist-length l)
  (cond
    ((null? l) 0)
    ((list? (car l)) (max (length l)
                          (max-sublist-length (car l))
                          (max-sublist-length (cdr l))))
    (else (max (length l)
               (max-sublist-length (cdr l))))))

(assert= 0 (max-sublist-length '()))
(assert= 1 (max-sublist-length '(1)))
(assert= 1 (max-sublist-length '(((1)))))
(assert= 2 (max-sublist-length '((() 1))))
(assert= 3 (max-sublist-length '(1 2 3)))
(assert= 3 (max-sublist-length '(1 (2 3 4))))
(assert= 3 (max-sublist-length '((2 3 4) 1)))
(assert= 4 (max-sublist-length '((2 3 4 (4)) 1)))
(assert= 5 (max-sublist-length '((2 3 (5 6 7 8 9) 4) 1)))
