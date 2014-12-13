(load "../../lib/scm/unit.scm")
(load "../06/06nth.scm")

; skip от предишната задача.
(define (skip m r)
  (define (helper i)
    (cond
      ((>= i (length m)) '())
      ((= i r) (helper (+ i 1)))
      (else (cons (nth m i)
                  (helper (+ i 1))))))
  (helper 0))

; Тук решението е подобно - махаме редове с helper-а, подобно на skip. Разликата
; е, че при добавянето на редовете викаме skip върху самите тях, за да махнем
; съответните елементи от c-тата колона.
(define (skip-row-column m r c)
  (define (helper i)
    (cond
      ((>= i (length m)) '())
      ((= i r) (helper (+ i 1)))
      (else (cons (skip (nth m i) c)
                  (helper (+ i 1))))))
  (helper 0))

(assert-equal '((1 3) (7 9))
              (skip-row-column '((1 2 3) (4 5 6) (7 8 9)) 1 1))
