#lang racket
(provide n-stream)

(define (n-stream start)
  (stream-cons start
               (n-stream (+ start 1))))

(stream-ref (n-stream 1337) 201)