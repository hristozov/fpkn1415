(load "../../lib/scm/unit.scm")
(load "04accumulate.scm")

(define (pow-accumulate x n)
  (accumulate (lambda (_) x) * 1 1 plus1 n))

(assert= 27 (pow-accumulate 3 3))
(assert= 1024 (pow-accumulate 2 10))
