#lang racket

(define (stream-to-list stream)
  (if (stream-empty? stream)
      '()
      (cons (stream-first stream)
            (stream-to-list
             (stream-rest stream)))))

(stream-to-list (stream-cons 1 (stream-cons 2 (stream-cons 3 empty-stream))))