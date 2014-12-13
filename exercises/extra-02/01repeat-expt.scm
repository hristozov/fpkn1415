(load "../../lib/scm/unit.scm")

; Вдига числата в списъка l на степен n.
(define (expt-list l n)
  (map (lambda (x) (expt x n)) l))

; Итерираме числата от 1 до n.
(define (repeat-expt l n)
  (define (helper current-n)
    (if (> current-n n)
        '()
        (cons (expt-list l current-n)
              (helper (+ current-n 1)))))
  (helper 1))

(assert-equal '((1 2 3) (1 4 9) (1 8 27))
              (repeat-expt '(1 2 3) 3))
