#lang racket
(require "../../exercises/11/04stream-take.rkt")
(require "../../lib/rkt/unit.rkt")

(define (repeat-list l)
  (define (helper current-list)
    (if (null? current-list)
        (helper l)
        (stream-cons (car current-list)
                     (helper (cdr current-list)))))
  (helper l))

(define (get-list n)
  (if (= n 0)
      '()
      (cons n (get-list (- n 1)))))

(define (solve n)
  (let ((l (reverse (get-list n))))
    (repeat-list (append l (cdr (reverse (cdr l)))))))

(assert-equal '(1 2 3 4 5 4 3 2 1 2)
              (stream->list (stream-take (solve 5) 10)))
