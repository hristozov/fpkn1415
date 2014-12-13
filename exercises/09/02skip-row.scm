(load "../../lib/scm/unit.scm")
(load "../06/06nth.scm")

; Този skip работи за r-тия ред в матрицата m. Всъщност, това е код който маха
; r-тия елемент в списъка m, а ползването му за матрици е частен случай.
(define (skip m r)
  (define (helper i)
    (cond
      ((>= i (length m)) '())
      ((= i r) (helper (+ i 1)))
      (else (cons (nth m i)
                  (helper (+ i 1))))))
  (helper 0))

(assert-equal '((1 2 3) (7 8 9))
              (skip '((1 2 3) (4 5 6) (7 8 9)) 1))
