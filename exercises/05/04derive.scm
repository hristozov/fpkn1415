(load "../../lib/scm/unit.scm")

; derive взима процедура и връща нова процедура. В новополучената процедура
; фиксираме x0 да е близо до x. По този начин можем да вземем някакво 
; приближение на стойността на производната.
(define (derive f)
  (lambda (x)
    (let ((x0 (+ x 0.001)))
      (/ (- (f x) (f x0))
         (- x x0)))))

(assert-approx 2
               0.01
               ((derive (lambda (x) (* 2 x)))
                1337))
(assert-approx 12
               0.01
               ((derive (lambda (x) (* x x x)))
                2))