#lang racket
(require "../../lib/rkt/unit.rkt")
(require "03list-to-stream.rkt")

; Резултатът ще е дълъг колкото по-късия от двата потока.
(define (add-streams s1 s2)
  (if (or (stream-empty? s1)
          (stream-empty? s2))
      empty-stream
      (stream-cons (+ (stream-first s1)
                      (stream-first s2))
                   (add-streams (stream-rest s1)
                                (stream-rest s2)))))

(assert-equal '(6 9 4)
              (stream->list (add-streams
                              (list-to-stream '(1 2 3 7))
                              (list-to-stream '(5 7 1)))))
