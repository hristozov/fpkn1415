#lang racket
(require "../../lib/rkt/unit.rkt")
(provide stream-to-list)

(define (stream-to-list stream)
  (if (stream-empty? stream)
      '()
      (cons (stream-first stream)
            (stream-to-list
              (stream-rest stream)))))

(assert-equal '(1 2 3)
              (stream-to-list 
                (stream-cons 1 (stream-cons 2 (stream-cons 3 empty-stream)))))
