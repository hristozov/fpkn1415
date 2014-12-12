#lang racket
(require "04stream-take.rkt")
(require "03list-to-stream.rkt")
(require "../../lib/rkt/unit.rkt")
(provide repeat-list)

(define (repeat-list l)
  (define (helper current-list)
    (if (null? current-list)
        (helper l)
        (stream-cons (car current-list)
                     (helper (cdr current-list)))))
  (helper l))

;(define (repeat-list2 l)
;  (stream-append
;    (list-to-stream l)
;    (repeat-list2 l)))

(assert= 1 (stream-ref (repeat-list '(1 2 3)) 0))
(assert= 2 (stream-ref (repeat-list '(1 2 3)) 1))
(assert= 3 (stream-ref (repeat-list '(1 2 3)) 2))
(assert= 1 (stream-ref (repeat-list '(1 2 3)) 3))
(assert= 2 (stream-ref (repeat-list '(1 2 3)) 4))
(assert-equal '(1 2 3 1 2)
              (stream->list (stream-take (repeat-list '(1 2 3))
                                         5)))
