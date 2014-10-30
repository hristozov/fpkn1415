(load "../../lib/scm/unit.scm")

(define (product-next term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-next term (next a) next b))))

(define (product-next-iter term a next b)
  (define (product-helper i acc)
    (if (> i b)
        acc
        (product-helper (next i) (* acc (term i)))))
  (product-helper a 1))

(define (plus1 x) (+ x 1))
(define (square x) (* x x))

(assert= 36 (product-next square 1 plus1 3))
(assert= 36 (product-next-iter square 1 plus1 3))
