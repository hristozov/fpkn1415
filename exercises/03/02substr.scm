(load "../../lib/scm/unit.scm")
(load "../02/04count-digits-iter.scm")

(define (substr? n a)
  (let ((mask (expt 10 (count-digits-iter a))))
    (define (helper i)
      (cond
         ((< i a) #f)
         ((= a (remainder i mask)) #t)
         (else (helper (quotient i 10)))))
    (helper n)))

(assert-true (substr? 1234 23))
(assert-true (substr? 1234 12))
(assert-true (substr? 1234 1))
(assert-true (substr? 1234 2))
(assert-true (substr? 1234 4))
