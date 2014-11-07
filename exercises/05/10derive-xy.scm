(load "../../lib/scm/unit.scm")

(define (derive-x f)
  (lambda (x y)
    (let ((x0 (+ x 0.001)))
      (/ (- (f x y) (f x0 y))
         (- x x0)))))

(define (derive-y f)
  (lambda (x y)
    (let ((y0 (+ y 0.001)))
      (/ (- (f x y) (f x y0))
         (- y y0)))))

(assert-approx 2
               0.01
               ((derive-x (lambda (x y) (+ (* 2 x) (* 3 y))))
                1337 1337))
(assert-approx 3
               0.01
               ((derive-y (lambda (x y) (+ (* 2 x) (* 3 y))))
                1337 1337))
