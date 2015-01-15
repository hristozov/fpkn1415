(load "../../lib/scm/unit.scm")

(define (solve f g)
  (lambda (m)
    (define (helper cur-idx cur-m)
      (if (null? cur-m)
          '()
          (cons (map (if (even? cur-idx) f g) (car cur-m))
                (helper (+ cur-idx 1) (cdr cur-m)))))
    (apply append (helper 0 (apply map list m)))))

(assert-equal '(2 5 8 4 10 16 4 7 10)
              ((solve (lambda (x) (+ x 1)) (lambda (y) (* y 2)))
               '((1 2 3) (4 5 6) (7 8 9))))