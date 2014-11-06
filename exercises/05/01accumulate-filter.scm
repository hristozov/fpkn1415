(load "../../lib/scm/unit.scm")

(define (identity x)
  x)

(define (plus1 x)
  (+ x 1))

(define (accumulate-filter term accum-func initial a next b pred)
  (define (accumulate-helper c acc)
    (if (> c b)
        acc
        (accumulate-helper (next c) 
                           (accum-func acc 
                                       (if (pred c)
                                           (term c)
                                           initial)))))
  (accumulate-helper a initial))

(assert= 25 (accumulate-filter identity + 0 1 plus1 10 odd?))
(assert= 30 (accumulate-filter identity + 0 1 plus1 10 even?))
