#lang racket
(require "../../lib/rkt/unit.rkt")
(require "02stream-to-list.rkt")
(provide list-to-stream)

(define (list-to-stream l)
  (if (null? l)
      empty-stream
      (stream-cons (car l)
                   (list-to-stream (cdr l)))))

(assert-equal '(1 2 3) (stream-to-list (list-to-stream '(1 2 3))))
