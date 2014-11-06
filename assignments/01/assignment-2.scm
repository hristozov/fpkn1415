(load "../../lib/scm/unit.scm")

(define (digits-the-same? n)
  (define (helper current last-digit)
    (cond
      ((= current 0) #t)
      ((not (= last-digit (remainder current 16))) #f)
      (else (helper (quotient current 16) last-digit))))
  (helper (quotient n 16) (remainder n 16)))

(define (hw12 a b)
  (define (helper i result)
    (if (> i b)
        result
        (helper (+ i 1)
                (+ result (if (digits-the-same? i) 0 1)))))
  (helper a 0))

(assert= 0 (hw12 1 13))
(assert= 2 (hw12 1 18))
(assert= 18 (hw12 1 35))
(assert= 67 (hw12 1 87))
