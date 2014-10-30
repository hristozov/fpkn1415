(load "../../lib/scm/unit.scm")
(load "04accumulate.scm")

(define (fact-accumulate n)
  (accumulate identity * 1 1 plus1 n))

(assert= 1 (fact-accumulate 1))
(assert= 24 (fact-accumulate 4))
