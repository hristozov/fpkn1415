#lang racket
(require "../../lib/rkt/unit.rkt")

(define (hw31)
  empty-stream)

(let ((first-stream (stream-ref (hw31) 0)))
  (assert= 1 (stream-ref first-stream 0))
  (assert= 2 (stream-ref first-stream 1))
  (assert= 3 (stream-ref first-stream 2))
  (assert= 4 (stream-ref first-stream 3)))

(let ((second-stream (stream-ref (hw31) 1)))
  (assert= 2 (stream-ref second-stream 0))
  (assert= 4 (stream-ref second-stream 1))
  (assert= 6 (stream-ref second-stream 2))
  (assert= 8 (stream-ref second-stream 3)))

(let ((third-stream (stream-ref (hw31) 2)))
  (assert= 3 (stream-ref third-stream 0))
  (assert= 6 (stream-ref third-stream 1))
  (assert= 9 (stream-ref third-stream 2))
  (assert= 12 (stream-ref third-stream 3)))