#lang racket
(require "../../lib/rkt/unit.rkt")
(require "02stream-to-list.rkt")
(require "05n-stream.rkt")

(define (stream-take stream n)
  (if (= n 0)
      empty-stream
      (stream-cons (stream-first stream)
                   (stream-take (stream-rest stream)
                                (- n 1)))))

(assert-equal '(4 5 6 7 8) (stream->list (stream-take (n-stream 4) 5)))
