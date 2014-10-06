(load "../../lib/scm/unit.scm")

(define (sum start end)
  (if (>= start end)
      end
      (+ start (sum (+ start 1) end))))

(assert= 4 (sum 4 4))
(assert= 15 (sum 1 5))
(assert= 5050 (sum 1 100))
