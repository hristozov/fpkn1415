(load "../../lib/scm/unit.scm")

(define (identity x)
  x)

(define (plus1 x)
  (+ x 1))

(define (accumulate-iter term accum-func initial a next b)
  (define (accumulate-helper c acc)
    (if (> c b)
        acc
        (accumulate-helper (next c) (accum-func acc (term c)))))
  (accumulate-helper a initial))

(define (accumulate term accum-func initial a next b)
  (define (accumulate-helper c)
    (if (> c b)
        initial
        (accum-func (term c) (accumulate-helper (next c)))))
  (accumulate-helper a))

(define (_square x) (* x x))

(assert= 36 (accumulate _square * 1 1 plus1 3))
(assert= 36 (accumulate-iter _square * 1 1 plus1 3))
