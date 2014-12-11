#lang racket

(define (add-streams s1 s2)
  (if (or (stream-empty? s1)
          (stream-empty? s2))
      empty-stream
      (stream-cons (+ (stream-first s1)
                      (stream-first s2))
                   (add-streams (stream-rest s1)
                                (stream-rest s2)))))

(stream->list (add-streams (stream-cons 1 (stream-cons 2 (stream-cons 3 empty-stream)))
                           (stream-cons 7 (stream-cons 2 empty-stream))))