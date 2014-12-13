#lang racket
(require "../../lib/rkt/unit.rkt")
(require "06n-stream.rkt")

(define (prime? n)
  (define (helper possible-divisor)
    (cond
      ((<= possible-divisor 1) #t)
      ((= (remainder n possible-divisor) 0) #f)
      (else (helper (- possible-divisor 1)))))
  (helper (- n 1)))

; stream-filter е „мързелив“ и няма да се опита да обходи и филтрира безкрайния
; поток. Оценяването на това дали елементите са прости числа се случва при
; поискването им.
(define (prime-stream)
  (stream-filter prime? (n-stream 2)))

(assert= 3 (stream-ref (prime-stream) 1))
(assert= 5 (stream-ref (prime-stream) 2))
(assert= 7 (stream-ref (prime-stream) 3))
(assert= 11 (stream-ref (prime-stream) 4))
(assert= 31 (stream-ref (prime-stream) 10))
