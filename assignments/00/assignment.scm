(load "../../lib/scm/unit.scm")

(define (number-of-set-bits n)
  0)

(assert= 0 (number-of-set-bits 0))
(assert= 1 (number-of-set-bits 1))
(assert= 1 (number-of-set-bits 2))
(assert= 3 (number-of-set-bits 7))
(assert= 1 (number-of-set-bits 8))
(assert= 10 (number-of-set-bits 1023))
(assert= 1 (number-of-set-bits 1024))
