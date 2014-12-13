#lang racket
(require "../../lib/rkt/unit.rkt")

; Ползваме helper с текущото и предишното число на Фибоначи.
(define (fibonacci)
  (define (helper a b)
    (stream-cons a
                 (helper b (+ a b))))
  (helper 1 1))

(assert= 1 (stream-ref (fibonacci) 1))
(assert= 2 (stream-ref (fibonacci) 2))
(assert= 3 (stream-ref (fibonacci) 3))
(assert= 5 (stream-ref (fibonacci) 4))
(assert= 8 (stream-ref (fibonacci) 5))
(assert= 2504730781961 (stream-ref (fibonacci) 60))
