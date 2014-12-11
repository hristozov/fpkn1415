#lang racket
(provide repeat-list)

(define (repeat-list l)
  (define (helper current-list)
    (if (null? current-list)
        (helper l)
        (stream-cons (car current-list)
                     (helper (cdr current-list)))))
  (helper l))

(stream-ref (repeat-list '(1 2 3)) 0)
(stream-ref (repeat-list '(1 2 3)) 1)
(stream-ref (repeat-list '(1 2 3)) 2)
(stream-ref (repeat-list '(1 2 3)) 3)
(stream-ref (repeat-list '(1 2 3)) 4)