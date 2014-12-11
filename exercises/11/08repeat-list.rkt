#lang racket
(require "../../lib/rkt/unit.rkt")
(provide repeat-list)

(define (repeat-list l)
  (define (helper current-list)
    (if (null? current-list)
        (helper l)
        (stream-cons (car current-list)
                     (helper (cdr current-list)))))
  (helper l))

(assert= 1 (stream-ref (repeat-list '(1 2 3)) 0))
(assert= 2 (stream-ref (repeat-list '(1 2 3)) 1))
(assert= 3 (stream-ref (repeat-list '(1 2 3)) 2))
(assert= 1 (stream-ref (repeat-list '(1 2 3)) 3))
(assert= 2 (stream-ref (repeat-list '(1 2 3)) 4))
