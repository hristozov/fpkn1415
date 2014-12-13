#lang racket
(require "../../lib/rkt/unit.rkt")
(provide n-stream)

; Потокът е безкраен - рекурсията няма дъно. Това не е проблем - stream-cons
; оценява мързеливо втория си аргумент, отклонявайки се от апликативния модел.
(define (n-stream start)
  (stream-cons start
               (n-stream (+ start 1))))

(assert= 1538 (stream-ref (n-stream 1337) 201))
