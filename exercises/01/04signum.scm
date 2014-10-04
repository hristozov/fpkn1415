(load "../../lib/unit.scm")

(define (signum n)
  (cond
    ((> n 0) 1)
    ((< n 0) -1)
    (else 0)))

(assert= 0 (signum 0))
(assert= -1 (signum -4))
(assert= 1 (signum 4))
