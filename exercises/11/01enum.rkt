#lang racket

(define (enum a b)
  (if (= a b)
      (stream b)
      (stream-cons a (enum (+ a 1) b))))

(stream->list (enum 1 3))
