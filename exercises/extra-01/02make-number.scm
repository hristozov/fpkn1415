(load "../../lib/scm/unit.scm")
(load "../02/04count-digits-iter.scm")

(define (make-number n)
  (let ((length-n (count-digits-iter n)))
    (define (digit-at n pos)
      (remainder 
        (quotient n (expt 10 
                          (- length-n pos))) 
        10))
    (define (helper i result)
      (if (> i length-n)
          result
          (helper (+ i 2)
                  (+ (* result 10)
                     (digit-at n i)))))
    (helper 2 0)))

(assert= 2839 (make-number 12784359))
(assert= 2839 (make-number 127843591))
(assert= 283 (make-number 1278435))
