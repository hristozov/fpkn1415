(load "../../lib/scm/unit.scm")

(define (digits-the-same? n)
  (define (helper current last-digit)
    (cond
      ((= current 0) #t)
      ((not (= last-digit (remainder current 8))) #f)
      (else (helper (quotient current 8) last-digit))))
  (helper (quotient n 8) (remainder n 8)))

(define (hw11 a b)
  (define (helper i result)
    (if (> i b)
        result
        (helper (+ i 1)
                (+ result (if (digits-the-same? i) 1 0)))))
  (helper a 0))

(assert= 7 (hw11 1 8))
(assert= 8 (hw11 1 9))
(assert= 9 (hw11 1 18))
(assert= 14 (hw11 1 65))
