(load "../../lib/scm/unit.scm")

(define (my-root x m eps)
  (define (improve y)
    (*
      (/ 1 m)
      (+ (* (- m 1) y)
         (/ x (expt y (- m 1))))))
  (define (good-enough? current-y)
    (< (abs (- (expt current-y m) 
               x)) 
       eps))
  (define (iter-helper current-y)
      (if (good-enough? current-y)
          current-y
          (iter-helper (improve current-y))))
  (iter-helper 1))

(assert-approx 4 0.001 (my-root 16 2 0.001))
(assert-approx 1.6265765 0.001 (my-root 7 4 0.001))
