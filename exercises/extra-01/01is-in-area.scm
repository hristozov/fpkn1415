(load "../../lib/scm/unit.scm")

(define (distance x1 y1 x2 y2)
  (sqrt (+ (expt (- x1 x2) 2)
           (expt (- y1 y2) 2))))

(define (is-in-area x y)
  (let 
    ((is-in-lower (and (<= x 0)
                       (>= x -2)
                       (<= y 0)
                       (>= y -2)
                       (>= (distance x y 0 -2) 2)))
     (is-in-upper (and (<= x 0)
                       (>= x -2)
                       (>= y 0)
                       (<= y 2)
                       (>= (distance x y -1 1) 1))))
    (or is-in-lower is-in-upper)))

; долната част:
(assert-true (is-in-area 0 0))
(assert-true (is-in-area -2 0))
(assert-true (is-in-area -2 -2))
(assert-true (is-in-area -2 -2))
(assert-true (is-in-area -1.8 -0.2))
(assert-true (is-in-area -1.6 -0.7))
(assert-true (is-in-area -1.6 -0.8)) ; по контура
(assert-false (is-in-area -1.6 -0.9))
(assert-false (is-in-area 0 -2))
; горната част
(assert-true (is-in-area 0 2))
(assert-true (is-in-area -2 2))
(assert-true (is-in-area -2 0))
(assert-false (is-in-area -1 -1))
(assert-false (is-in-area -0.5 0.2))
(assert-true (is-in-area -0.4 0.2)) ; по контура
(assert-true (is-in-area -0.3 0.2))
