(load "../../lib/scm/unit.scm")

(define (pow x n)
  (if (= 0 n)
      1
      (* x (pow x (- n 1)))))

(assert= 1 (pow 2 0))
(assert= 2 (pow 2 1))
(assert= 4 (pow 2 2))
(assert= 1024 (pow 2 10))
(assert= 1024 (pow -2 10))
(assert= -2048 (pow -2 11))
