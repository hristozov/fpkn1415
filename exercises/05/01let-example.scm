(load "../../lib/scm/unit.scm")

(define (testlet x)
  (let 
    ((x-plus-3 (+ x 3))
     (x-plus-5 (+ x 5)))
    (* x-plus-3 x-plus-5)))

; Долното няма да работи с let, тъй като x-plus-3 няма да е дефинирано. 
(define (testlet* x)
  (let*
    ((x-plus-3 (+ x 3))
     (x-plus-5 (+ x-plus-3 2)))
    (* x-plus-3 x-plus-5)))

(assert= 35 (testlet 2))
(assert= 35 (testlet* 2))
