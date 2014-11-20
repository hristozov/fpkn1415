(load "../../lib/scm/unit.scm")

; с провека на това колко е точен текущият член в реда
(define (my-root1 x m eps)
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

; със сравнение на два последователни члена от реда
(define (my-root2 x m eps)
  (define (improve y)
    (*
      (/ 1 m)
      (+ (* (- m 1) y)
         (/ x (expt y (- m 1))))))
  (define (good-enough? old-y new-y)
    (< (abs (- old-y new-y))
       eps))
  (define (iter-helper old-y)
    (let ((new-y (improve old-y)))
      (if (good-enough? old-y new-y)
          new-y
          (iter-helper new-y))))
  (iter-helper 1))

(assert-approx 4 0.001 (my-root1 16 2 0.001))
(assert-approx 1.6265765 0.001 (my-root1 7 4 0.001))
(assert-approx 4 0.001 (my-root2 16 2 0.001))
(assert-approx 1.6265765 0.001 (my-root2 7 4 0.001))
