(load "../../lib/scm/unit.scm")

(define (generate-list n)
  (define (helper i result)
    (if (> i n)
        result
        (helper (+ i 1) (cons i result))))
  (helper 1 '()))

(define (generate-list-rev n)
  (define (helper i result)
    (if (= i 0)
        result
        (helper (- i 1) (cons i result))))
  (helper n '()))

(assert-equal '(1) (generate-list 1))
(assert-equal '(1) (generate-list-rev 1))
(assert-equal '(3 2 1) (generate-list 3))
(assert-equal '(1 2 3) (generate-list-rev 3))