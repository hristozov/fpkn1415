#lang racket
(require "../../lib/rkt/unit.rkt")

(define (hw32)
  empty-stream)

(let ((first-stream (stream-ref (hw32) 0)))
  (assert= 1 (stream-ref first-stream 0))
  (assert= 1 (stream-ref first-stream 1))
  (assert= 1 (stream-ref first-stream 2))
  (assert= 1 (stream-ref first-stream 3))
  (assert= 1 (stream-ref first-stream 4)))

(let ((second-stream (stream-ref (hw32) 1)))
  (assert= 1 (stream-ref second-stream 0))
  (assert= 2 (stream-ref second-stream 1))
  (assert= 4 (stream-ref second-stream 2))
  (assert= 8 (stream-ref second-stream 3))
  (assert= 16 (stream-ref second-stream 4)))

(let ((third-stream (stream-ref (hw32) 2)))
  (assert= 1 (stream-ref third-stream 0))
  (assert= 3 (stream-ref third-stream 1))
  (assert= 9 (stream-ref third-stream 2))
  (assert= 27 (stream-ref third-stream 3))
  (assert= 81 (stream-ref third-stream 4)))