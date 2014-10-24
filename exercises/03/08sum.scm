(load "../../lib/scm/unit.scm")

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-iter term a next b)
  (define (sum-helper c acc)
    (if (> c b)
        acc
        (sum-helper (next c) (+ acc (term c)))))
  (sum-helper a 0))

(define (plus1 x) (+ x 1))
(define (square x) (* x x))

(assert= 14 (sum square 1 plus1 3))
(assert= 14 (sum-iter square 1 plus1 3))
