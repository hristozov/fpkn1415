(load "../../lib/scm/unit.scm")
(load "04composition.scm")

(define (repeat-n-recur f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeat-n-recur f (- n 1)))))

(define (repeat-n f n)
  (define (helper result i)
    (if (= i 0)
        result
        (helper (compose f result) (- i 1))))
  (helper (lambda (x) x) n))

(define (plus1 x) (+ x 1))

(assert= 6 ((repeat-n-recur plus1 5) 1))
(assert= 6 ((repeat-n plus1 5) 1))
