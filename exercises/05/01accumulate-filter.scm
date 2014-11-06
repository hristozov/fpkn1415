(load "../../lib/scm/unit.scm")

(define (identity x)
  x)

(define (plus1 x)
  (+ x 1))

(define (accumulate-filter term accum-func initial a next b pred)
  (define (accumulate-helper c acc)
    (let 
      ((current-term (term c))
       (next-one (next c)))
      (cond
        ((> c b) acc)
        ((pred current-term) (accumulate-helper next-one (accum-func acc current-term)))
        (else (accumulate-helper next-one acc)))))
  (accumulate-helper a initial))

(assert= 25 (accumulate-filter identity + 0 1 plus1 10 odd?))
(assert= 30 (accumulate-filter identity + 0 1 plus1 10 even?))
