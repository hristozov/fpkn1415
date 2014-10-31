(load "../../lib/scm/unit.scm")
(load "04accumulate.scm")
(load "05fact.scm")

(define (my-cos x)
  (define (term n)
    (* (expt -1 n)
       (/ (expt x (* 2 n))
          (fact-accumulate (* 2 n)))))
  (accumulate term + 0 0 plus1 50))

(assert-approx 1 0.001 (my-cos 0))
(assert-approx -0.416 0.001 (my-cos 2))
(assert-approx -1 0.001 (my-cos 3.1415))
