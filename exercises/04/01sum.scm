(load "../../lib/scm/unit.scm")

(define (sum term a b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (+ a 1) b))))

(define (sum-iter term a b)
  (define (sum-helper i acc)
    (if (> i b)
        acc
        (sum-helper (+ i 1) (+ acc (term i)))))
  (sum-helper a 0))

(define (square x) (* x x))

(assert= 14 (sum square 1 3))
(assert= 14 (sum-iter square 1 3))
