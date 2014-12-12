#lang racket
(require "../../lib/rkt/unit.rkt")
(provide n-stream)

(define (n-stream start)
  (stream-cons start
               (n-stream (+ start 1))))

(assert= 1538 (stream-ref (n-stream 1337) 201))
