(load "../../lib/scm/unit.scm")

(define (sum-next term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-next term (next a) next b))))

(define (sum-next-iter term a next b)
  (define (sum-helper i acc)
    (if (> i b)
        acc
        (sum-helper (next i) (+ acc (term i)))))
  (sum-helper a 0))

(define (plus1 x) (+ x 1))
(define (square x) (* x x))

(assert= 14 (sum-next square 1 plus1 3))
(assert= 14 (sum-next-iter square 1 plus1 3))
