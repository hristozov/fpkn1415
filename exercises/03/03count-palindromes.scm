(load "../../lib/scm/unit.scm")
(load "01palindrome.scm")

(define (count-palindromes start end)
  (define (helper current count)
    (cond
      ((> current end) count)
      ((palindrome? current) (helper (+ current 1) (+ count 1)))
      (else (helper (+ current 1) count))))
  (helper start 0))

(assert= 9 (count-palindromes 1 10))
(assert= 11 (count-palindromes 1 22))
(assert= 15 (count-palindromes 1 66))
