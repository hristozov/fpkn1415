(load "../../lib/scm/unit.scm")
(load "../06/06nth.scm")

(define (diagonal m)
  (define (helper i)
    (if (>= i (length m))
        '()
        (cons (nth (nth m i) i)
              (helper (+ i 1)))))
  (helper 0))

(assert-equal '(1 5 9) (diagonal '((1 2 3) (4 5 6) (7 8 9))))
(assert-equal '(1) (diagonal '((1))))
(assert-equal '() (diagonal '()))