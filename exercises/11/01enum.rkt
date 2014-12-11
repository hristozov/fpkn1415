#lang racket
(require "../../lib/rkt/unit.rkt")

(define (enum a b)
  (if (= a b)
      (stream b)
      (stream-cons a (enum (+ a 1) b))))

(assert-equal '(1 2 3) (stream->list (enum 1 3)))
