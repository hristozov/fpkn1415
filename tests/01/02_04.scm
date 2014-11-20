(load "../../lib/scm/unit.scm")
(load "../../exercises/04/04accumulate.scm")

(define (derive f)
  (lambda (x)
    (let ((x0 (+ x 0.001)))
      (/ (- (f x) (f x0))
         (- x x0)))))

(define (compose f g)
  (lambda (x)
    (g (f x))))

(define (repeat-n f n)
  (define (helper result i)
    (if (= i 0)
        result
        (helper (compose f result) (- i 1))))
  (helper (lambda (x) x) n))

(define (derive-n f n)
  ((repeat-n derive n) f))

(define (solution m n f g)
  (lambda (x)
    (accumulate (lambda (k)
                  ((repeat-n f k)
                   (accumulate (lambda (p)
                                 ((derive-n g p) x))
                               + 0 1 plus1 n)))
                + 0 1 plus1 m)))

(assert-approx 265
               0.5
               ((solution 2
                          3
                          (lambda (x) (+ x 3))
                          (lambda (y) (expt y 4)))
                2))