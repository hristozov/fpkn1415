(load "../../lib/scm/unit.scm")
(load "04accumulate.scm")

(define (variation k n)
  (/ (accumulate identity * 1 1 plus1 n)
     (accumulate identity * 1 1 plus1 (- n k))))

(assert= 210 (variation 3 7))
(assert= 11880 (variation 4 12))
