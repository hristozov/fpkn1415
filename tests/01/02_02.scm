(load "../../lib/scm/unit.scm")

(define (my-ln x eps)
  (define (term n)
    (/ 
      (* (expt -1 (+ n 1))
         (expt x n))
      n))
  (define (good-enough? current-term)
    (< (abs current-term) eps))
  (define (iter-helper i result)
    (let ((current-term (term i)))
      (if (good-enough? current-term)
          result
          (iter-helper (+ i 1)
                       (+ result current-term)))))
  (iter-helper 1 0))

(assert-approx 0.182322 0.01 (my-ln 0.2 0.001))
(assert-approx -1.60944 0.01 (my-ln -0.8 0.001))
