#lang racket
(require "04n-stream.rkt")

(define (prime? n)
  (define (helper possible-divisor)
    (cond
      ((<= possible-divisor 1) #t)
      ((= (remainder n possible-divisor) 0) #f)
      (else (helper (- possible-divisor 1)))))
  (helper (- n 1)))

(define (prime-stream)
  (stream-filter prime? (n-stream 2)))

(stream-ref (prime-stream) 1)
(stream-ref (prime-stream) 2)
(stream-ref (prime-stream) 3)
(stream-ref (prime-stream) 4)
(stream-ref (prime-stream) 10)