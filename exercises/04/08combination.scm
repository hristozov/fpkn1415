(load "../../lib/scm/unit.scm")
(load "04accumulate.scm")

(define (combination k n)
  (/ (accumulate identity * 1 1 plus1 n)
     (* (accumulate identity * 1 1 plus1 k)
        (accumulate identity * 1 1 plus1 (- n k)))))

(assert= 35 (combination 3 7))
(assert= 495 (combination 4 12))
