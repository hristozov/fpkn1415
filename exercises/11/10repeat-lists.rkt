#lang racket
(require "../../lib/rkt/unit.rkt")
(require "03stream-take.rkt")
(require "08repeat-list.rkt")

(define (repeat-lists l1 l2)
  (define (helper1 current-list)
    (if (null? current-list)
        (helper2 l2)
        (stream-cons (car current-list)
                     (helper1 (cdr current-list)))))
  (define (helper2 current-list)
    (if (null? current-list)
        (helper1 l1)
        (stream-cons (car current-list)
                     (helper2 (cdr current-list)))))
  (helper1 l1))

(define (repeat-lists2 l1 l2)
  (repeat-list (append l1 l2)))

(assert-equal '(1 2 3 4 1 2 3)
              (stream->list (stream-take (repeat-lists '(1 2) '(3 4))
                                         7)))